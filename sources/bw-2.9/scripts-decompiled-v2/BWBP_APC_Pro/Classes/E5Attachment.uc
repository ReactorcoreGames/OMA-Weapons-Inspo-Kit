class E5Attachment extends BallisticAttachment;

var bool bLaserOn;
var bool bOldLaserOn;
var LaserActor Laser;
var Rotator LaserRot;
var Vector PreviousHitLoc;
var Emitter LaserDot;
var BallisticWeapon myWeap;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLaserOn;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		LaserRot;
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
		LaserDot = Spawn(Class'BallisticProV55.IE_VPRLaserHit',,, loc);
		LaserDot.bHidden = false;
	}
	//return;	
}

function InitFor(Inventory i)
{
	super.InitFor(i);
	// End:0x2B
	if(BallisticWeapon(i) != none)
	{
		myWeap = BallisticWeapon(i);
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
	if((bLaserOn && int(Role) == int(ROLE_Authority)) && myWeap != none)
	{
		LaserRot = Instigator.GetViewRotation() + myWeap.GetFireRot();
	}
	// End:0x75
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x95
	if(Laser == none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor_VPR',,, Location);
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
	// End:0x2BE
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
		LaserDot.SetRotation(Rotator(HitNormal));
		LaserDot.Emitters[5].AutomaticInitialSpawning = Other.bWorldGeometry;
	}
	Laser.SetLocation(loc);
	Laser.SetRotation(Rotator(HitLocation - loc));
	Scale3D.X = VSize(HitLocation - Laser.Location) / float(128);
	Scale3D.Y = 4.0000000;
	Scale3D.Z = 4.0000000;
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
	// End:0x54
	if(((int(InstantMode) == int(3)) || (int(InstantMode) == int(1)) && int(Mode) == 0) || (int(InstantMode) == int(0)) && int(Mode) != 0)
	{
		return;
	}
	// End:0x6D
	if(mHitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;
	}
	// End:0x7A
	if(Instigator == none)
	{
		return;
	}
	// End:0x93
	if(VSize(PreviousHitLoc - mHitLocation) < float(2))
	{
		return;
	}
	PreviousHitLoc = mHitLocation;
	ImpactManager = Class'BallisticProV55.IM_VPRLaser';
	super.InstantFireEffects(Mode);
	//return;	
}

simulated function FlashMuzzleFlash(byte Mode)
{
	// End:0x1B
	if(int(Mode) == 0)
	{
		super.FlashMuzzleFlash(Mode);		
	}
	else
	{
		// End:0x5E
		if((AltMuzzleFlash == none) && AltMuzzleFlashClass != none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * FlashScale, self, AltFlashBone);
		}
	}
	//return;	
}

simulated function Timer()
{
	super.Timer();
	// End:0x2C
	if(AltMuzzleFlash != none)
	{
		Emitter(AltMuzzleFlash).Kill();
		AltMuzzleFlash = none;
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_APC_Pro.E5PlasmaRifle'
	MuzzleFlashClass=Class'BWBP_APC_Pro.E5FlashEmitter'
	AltMuzzleFlashClass=Class'BWBP_APC_Pro.E5LaserFlashEmitter'
	FlashScale=0.3000000
	TracerMode=3
	InstantMode=1
	FlashMode=2
	LightMode=2
	ReloadAnimRate=0.7500000
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_APC_Anim.E5Plasma_TPm'
	RelativeLocation=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	DrawScale=0.7500000
}
