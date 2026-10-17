class G5Attachment extends BallisticAttachment;

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

simulated function FlashMuzzleFlash(byte Mode)
{
	// End:0x3C
	if(Instigator.IsFirstPerson() && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0xFA
	if(AltMuzzleFlashClass != none)
	{
		// End:0xE5
		if(AltMuzzleFlash == none)
		{
			AltMuzzleFlash = Spawn(AltMuzzleFlashClass, self);
			// End:0x96
			if(Emitter(AltMuzzleFlash) != none)
			{
				Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(AltMuzzleFlash), DrawScale * FlashScale);
			}
			AltMuzzleFlash.SetDrawScale(DrawScale * FlashScale);
			// End:0xD5
			if(DGVEmitter(AltMuzzleFlash) != none)
			{
				DGVEmitter(AltMuzzleFlash).InitDGV();
			}
			AttachToBone(AltMuzzleFlash, 'tip2');
		}
		AltMuzzleFlash.Trigger(self, Instigator);
	}
	// End:0x1B8
	if(MuzzleFlashClass != none)
	{
		// End:0x1A3
		if(MuzzleFlash == none)
		{
			MuzzleFlash = Spawn(MuzzleFlashClass, self);
			// End:0x154
			if(Emitter(MuzzleFlash) != none)
			{
				Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(MuzzleFlash), DrawScale * FlashScale);
			}
			MuzzleFlash.SetDrawScale(DrawScale * FlashScale);
			// End:0x193
			if(DGVEmitter(MuzzleFlash) != none)
			{
				DGVEmitter(MuzzleFlash).InitDGV();
			}
			AttachToBone(MuzzleFlash, 'tip');
		}
		MuzzleFlash.Trigger(self, Instigator);
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.G5Bazooka'
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.G5BackFlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	AltFlashBone="tip2"
	FlashScale=1.2000000
	BrassMode=3
	InstantMode=3
	ReloadAnim="Reload_MG"
	ReloadAnimRate=1.8000000
	CockAnimRate=0.7900000
	bRapidFire=true
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.G5Bazooka_TPm'
	DrawScale=0.2300000
}
