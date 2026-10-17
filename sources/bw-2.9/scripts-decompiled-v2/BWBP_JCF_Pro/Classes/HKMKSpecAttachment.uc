class HKMKSpecAttachment extends HandgunAttachment;

var bool bLaserOn;
var bool bOldLaserOn;
var LaserActor Laser;
var Rotator LaserRot;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLaserOn;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		LaserRot;
}

simulated event PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	// End:0x40
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena())
	{
		TracerClass = Class'BWBP_SKC_Pro.TraceEmitter_Pulse';
		ImpactManager = Class'BWBP_SKC_Pro.IM_LS14Impacted';
		TracerChance = 1.0000000;
		TracerMix = 0;
	}
	//return;	
}

simulated function Tick(float dt)
{
	local Vector HitLocation, Start, End, HitNormal, Scale3D, loc;

	local Rotator X;
	local Actor Other;

	super.Tick(dt);
	// End:0x5A
	if((bLaserOn && int(Role) == int(ROLE_Authority)) && HandGun != none)
	{
		LaserRot = Instigator.GetViewRotation() + HandGun.GetFireRot();
	}
	// End:0x75
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x95
	if(Laser == none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor_RSBlueThird',,, Location);
	}
	// End:0xB3
	if(bLaserOn != bOldLaserOn)
	{
		bOldLaserOn = bLaserOn;
	}
	// End:0x11F
	if(((!bLaserOn || Instigator == none) || Instigator.IsFirstPerson()) || Instigator.DrivenVehicle != none)
	{
		// End:0x11A
		if(!Laser.bHidden)
		{
			Laser.bHidden = true;
		}
		return;		
	}
	else
	{
		// End:0x142
		if(Laser.bHidden)
		{
			Laser.bHidden = false;
		}
	}
	Start = Instigator.Location + Instigator.EyePosition();
	X = LaserRot;
	loc = GetBoneCoords('tip3').Origin;
	End = Start + (Vector(X) * float(5000));
	Other = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x1D9
	if(Other == none)
	{
		HitLocation = End;
	}
	Laser.SetLocation(loc);
	Laser.SetRotation(Rotator(HitLocation - loc));
	Scale3D.X = VSize(HitLocation - Laser.Location) / float(128);
	Scale3D.Y = 1.5000000;
	Scale3D.Z = 1.5000000;
	Laser.SetDrawScale3D(Scale3D);
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(Laser != none)
	{
		Laser.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated event ThirdPersonEffects()
{
	// End:0x58
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && Instigator != none)
	{
		// End:0x47
		if(int(FiringMode) == 1)
		{
			SetBoneScale(0, 1.0000000, 'Silencer');			
		}
		else
		{
			SetBoneScale(0, 0.0000000, 'Silencer');
		}
	}
	super(BallisticAttachment).ThirdPersonEffects();
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_JCF_Pro.HKMKSpecPistol'
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	AltFlashBone="tip2"
	FlashScale=0.2000000
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	BrassMode=2
	InstantMode=2
	FlashMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	TracerMix=-3
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnim="Reload_Pistol"
	ReloadAnimRate=1.4000000
	bRapidFire=true
	bAltRapidFire=true
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=1.0000000
}
