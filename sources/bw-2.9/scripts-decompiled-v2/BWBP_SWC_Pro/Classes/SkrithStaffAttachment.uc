class SkrithStaffAttachment extends A73Attachment;

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
		LaserDot = Spawn(Class'BallisticProV55.IE_GRS9LaserHit',,, loc);
		LaserDot.bHidden = false;
	}
	//return;	
}

function InitFor(Inventory i)
{
	super(BallisticAttachment).InitFor(i);
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

	super(BallisticAttachment).Tick(dt);
	// End:0x76
	if((bLaserOn && int(Role) == int(ROLE_Authority)) && myWeap != none)
	{
		LaserRot = Instigator.GetViewRotation();
		LaserRot += myWeap.GetAimPivot();
		LaserRot += myWeap.GetRecoilPivot();
	}
	// End:0x91
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0xB1
	if(Laser == none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor_GRSNine',,, Location);
	}
	// End:0xCF
	if(bLaserOn != bOldLaserOn)
	{
		bOldLaserOn = bLaserOn;
	}
	// End:0x14C
	if(((!bLaserOn || Instigator == none) || Instigator.IsFirstPerson()) || Instigator.DrivenVehicle != none)
	{
		// End:0x136
		if(!Laser.bHidden)
		{
			Laser.bHidden = true;
		}
		// End:0x147
		if(LaserDot != none)
		{
			KillLaserDot();
		}
		return;		
	}
	else
	{
		// End:0x16F
		if(Laser.bHidden)
		{
			Laser.bHidden = false;
		}
	}
	// End:0x1A2
	if(Instigator != none)
	{
		Start = Instigator.Location + Instigator.EyePosition();		
	}
	else
	{
		Start = Location;
	}
	X = LaserRot;
	loc = GetTipLocation();
	// End:0x1EB
	if(AIController(Instigator.Controller) != none)
	{
		HitLocation = mHitLocation;		
	}
	else
	{
		End = Start + (Vector(X) * float(3000));
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x23C
		if(Other == none)
		{
			HitLocation = End;
		}
	}
	// End:0x262
	if((LaserDot == none) && Other != none)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		// End:0x280
		if((LaserDot != none) && Other == none)
		{
			KillLaserDot();
		}
	}
	// End:0x2DA
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
		LaserDot.SetRotation(Rotator(HitNormal));
		LaserDot.Emitters[5].AutomaticInitialSpawning = Other.bWorldGeometry;
	}
	Laser.SetLocation(loc);
	Laser.SetRotation(Rotator(HitLocation - loc));
	Scale3D.X = VSize(HitLocation - Laser.Location) / float(128);
	Scale3D.Y = 10.0000000;
	Scale3D.Z = 10.0000000;
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
	super(BallisticAttachment).Destroyed();
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
	ImpactManager = Class'BWBP_SWC_Pro.IM_SSLaser';
	super(BallisticAttachment).InstantFireEffects(Mode);
	//return;	
}

simulated function FlashMuzzleFlash(byte Mode)
{
	// End:0x1B
	if(int(Mode) == 0)
	{
		super(BallisticAttachment).FlashMuzzleFlash(Mode);		
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
	super(BallisticAttachment).Timer();
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
	MuzzleFlashClass=Class'BWBP_SWC_Pro.SkrithStaffFlashEmitter'
	ImpactManager=Class'BWBP_SWC_Pro.IM_SSLaser'
	FlashBone="Muzzle"
	TracerMode=3
	ReloadAnimRate=1.5000000
	DrawScale=1.3000000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
}
