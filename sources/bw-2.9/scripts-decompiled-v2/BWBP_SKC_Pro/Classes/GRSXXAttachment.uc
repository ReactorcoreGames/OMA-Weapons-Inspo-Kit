class GRSXXAttachment extends HandgunAttachment;

var bool bLaserOn;
var bool bOldLaserOn;
var LaserActor Laser;
var Rotator LaserRot;
var Vector PreviousHitLoc;
var Emitter LaserDot;
var bool bBigLaser;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLaserOn;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		LaserRot, bBigLaser;
}

simulated function KillLaserDot()
{
	// End:0x32
	if(LaserDot != none)
	{
		LaserDot.bHidden = false;
		LaserDot.Kill();
		LaserDot = none;
	}
	//return;	
}

simulated function SpawnLaserDot(Vector loc)
{
	// End:0x31
	if(LaserDot == none)
	{
		LaserDot = Spawn(Class'BWBP_SKC_Pro.IE_GRSXXLaserHit',,, loc);
		LaserDot.bHidden = false;
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
		Laser = Spawn(Class'BWBP_SKC_Pro.LaserActor_GRSXX',,, Location);
	}
	// End:0xB3
	if(bLaserOn != bOldLaserOn)
	{
		bOldLaserOn = bLaserOn;
	}
	// End:0x130
	if(((!bLaserOn || Instigator == none) || Instigator.IsFirstPerson()) || Instigator.DrivenVehicle != none)
	{
		// End:0x11A
		if(!Laser.bHidden)
		{
			Laser.bHidden = true;
		}
		// End:0x12B
		if(LaserDot != none)
		{
			KillLaserDot();
		}
		return;		
	}
	else
	{
		// End:0x153
		if(Laser.bHidden)
		{
			Laser.bHidden = false;
		}
	}
	// End:0x186
	if(Instigator != none)
	{
		Start = Instigator.Location + Instigator.EyePosition();		
	}
	else
	{
		Start = Location;
	}
	X = LaserRot;
	loc = GetModeTipLocation();
	// End:0x1CF
	if(AIController(Instigator.Controller) != none)
	{
		HitLocation = mHitLocation;		
	}
	else
	{
		End = Start + (Vector(X) * float(3000));
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x220
		if(Other == none)
		{
			HitLocation = End;
		}
	}
	// End:0x246
	if((LaserDot == none) && Other != none)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		// End:0x264
		if((LaserDot != none) && Other == none)
		{
			KillLaserDot();
		}
	}
	// End:0x293
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
		LaserDot.SetRotation(Rotator(HitNormal));
	}
	Laser.SetLocation(loc);
	Laser.SetRotation(Rotator(HitLocation - loc));
	Scale3D.X = VSize(HitLocation - Laser.Location) / float(128);
	// End:0x312
	if(bBigLaser)
	{
		Scale3D.Y = 9.0000000;
		Scale3D.Z = 9.0000000;		
	}
	else
	{
		Scale3D.Y = 4.5000000;
		Scale3D.Z = 4.5000000;
	}
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
	KillLaserDot();
	super.Destroyed();
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	// End:0x1B
	if(int(Mode) == 0)
	{
		ImpactManager = default.ImpactManager;		
	}
	else
	{
		// End:0x34
		if(VSize(PreviousHitLoc - mHitLocation) < float(2))
		{
			return;
		}
		ModeInfos[1].ImpactManager = Class'BWBP_SKC_Pro.IM_GRSXXLaser';
	}
	super(BallisticAttachment).InstantFireEffects(Mode);
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_SKC_Pro.GRSXXPistol'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.GRSXXFlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	BrassClass=Class'BWBP_SKC_Pro.Brass_GRSXX'
	InstantMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Pistol'
	TracerChance=0.6000000
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	FlyByMode=0
	ReloadAnim="Reload_Pistol"
	ReloadAnimRate=0.6750000
	CockAnimRate=0.7500000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.GRS9_TPm'
	DrawScale=0.0700000
	Skins[0]=Shader'BWBP_SKC_Tex.Glock_Gold.GRSXX-MainShine'
}
