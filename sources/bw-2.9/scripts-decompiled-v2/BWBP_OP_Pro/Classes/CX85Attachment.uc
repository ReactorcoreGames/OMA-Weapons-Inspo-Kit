class CX85Attachment extends BallisticAttachment;

var bool bLaserOn;
var bool bOldLaserOn;
var LaserActor Laser;
var Vector LaserEndLoc;
var Emitter LaserDot;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLaserOn;

	// Pos:0x00D
	reliable if((int(Role) == int(ROLE_Authority)) && !bNetOwner)
		LaserEndLoc;
}

simulated event PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	// End:0x35
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
	{
		TracerClass = Class'BWBP_OP_Pro.TraceEmitter_CX61Spectre';
		TracerChance = 1.0000000;
		TracerMix = 0;
	}
	//return;	
}

simulated function GenerateModeInfo()
{
	super.GenerateModeInfo();
	ModeInfos[1].ImpactManager = Class'BallisticProV55.IM_Bullet';
	ModeInfos[1].TracerClass = Class'BWBP_OP_Pro.TraceEmitter_KF8XCrossbow';
	ModeInfos[1].WaterTracerClass = Class'BallisticProV55.TraceEmitter_WaterBullet';
	ModeInfos[1].TracerChance = 1.0000000;
	ModeInfos[1].TracerMix = 0;
	ModeInfos[1].bTrackAnim = false;
	ModeInfos[1].bInstant = true;
	ModeInfos[1].bTracer = true;
	ModeInfos[1].bWaterTracer = true;
	ModeInfos[1].bFlash = false;
	ModeInfos[1].bLight = false;
	ModeInfos[1].bBrass = false;
	//return;	
}

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Vector X, Y, Z;

	// End:0xE0
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		// End:0xBA
		if(BallisticWeapon(Instigator.Weapon).bScopeView)
		{
			Instigator.Weapon.GetViewAxes(X, Y, Z);
			return (Instigator.Location + (X * float(20))) + (Z * float(5));			
		}
		else
		{
			return CX85AssaultWeapon(Instigator.Weapon).GetModeEffectStart(Mode);
		}		
	}
	else
	{
		switch(Mode)
		{
			// End:0xFD
			case 1:
				return GetBoneCoords('tip2').Origin;
			// End:0xFFFF
			default:
				return GetBoneCoords('tip').Origin;
				break;
		}
	}
	//return;	
}

simulated function KillLaserDot()
{
	// End:0x21
	if(LaserDot != none)
	{
		LaserDot.Kill();
		LaserDot = none;
	}
	//return;	
}

simulated function SpawnLaserDot(optional Vector loc)
{
	// End:0x20
	if(LaserDot == none)
	{
		LaserDot = Spawn(Class'BallisticProV55.G5LaserDot',,, loc);
	}
	LaserDot.bHidden = false;
	//return;	
}

simulated function Tick(float dt)
{
	local Vector Scale3D, loc;

	super.Tick(dt);
	// End:0x26
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x46
	if(Laser == none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor_G5Painter',,, Location);
	}
	// End:0x64
	if(bLaserOn != bOldLaserOn)
	{
		bOldLaserOn = bLaserOn;
	}
	// End:0xD6
	if(((!bLaserOn || Instigator == none) || Instigator.IsFirstPerson()) || Instigator.DrivenVehicle != none)
	{
		// End:0xCB
		if(!Laser.bHidden)
		{
			Laser.bHidden = true;
		}
		KillLaserDot();
		return;		
	}
	else
	{
		// End:0xF9
		if(Laser.bHidden)
		{
			Laser.bHidden = false;
		}
		SpawnLaserDot();
	}
	// End:0x11B
	if(LaserDot != none)
	{
		LaserDot.SetLocation(LaserEndLoc);
	}
	loc = GetModeTipLocation();
	Laser.SetLocation(loc);
	Laser.SetRotation(Rotator(LaserEndLoc - loc));
	Scale3D.X = VSize(LaserEndLoc - Laser.Location) / float(128);
	Scale3D.Y = 1.5000000;
	Scale3D.Z = 1.5000000;
	Laser.SetDrawScale3D(Scale3D);
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(LaserDot != none)
	{
		LaserDot.Destroy();
	}
	// End:0x2E
	if(Laser != none)
	{
		Laser.Destroy();
	}
	super.Destroyed();
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_OP_Pro.CX85AssaultWeapon'
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	AltFlashBone="tip2"
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.7150000
	CockAnimRate=1.2500000
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_OP_Anim.CX85_TPm'
	RelativeLocation=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.2500000
}
