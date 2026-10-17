class LAWAttachment extends BallisticAttachment;

var bool bLaserOn;
var bool bOldLaserOn;
var LaserActor Laser;
var Rotator LaserRot;
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
		Laser = Spawn(Class'BWBP_SKC_Pro.LaserActor_LAW',,, Location);
	}
	// End:0xCF
	if(bLaserOn != bOldLaserOn)
	{
		bOldLaserOn = bLaserOn;
	}
	// End:0x13B
	if(((!bLaserOn || Instigator == none) || Instigator.IsFirstPerson()) || Instigator.DrivenVehicle != none)
	{
		// End:0x136
		if(!Laser.bHidden)
		{
			Laser.bHidden = true;
		}
		return;		
	}
	else
	{
		// End:0x15E
		if(Laser.bHidden)
		{
			Laser.bHidden = false;
		}
	}
	// End:0x191
	if(Instigator != none)
	{
		Start = Instigator.Location + Instigator.EyePosition();		
	}
	else
	{
		Start = Location;
	}
	X = LaserRot;
	loc = GetBoneCoords('tip3').Origin;
	End = Start + (Vector(X) * float(5000));
	Other = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x20E
	if(Other == none)
	{
		HitLocation = End;
	}
	Laser.SetLocation(loc);
	Laser.SetRotation(Rotator(HitLocation - loc));
	Scale3D.X = VSize(HitLocation - Laser.Location) / float(128);
	Scale3D.Y = 1.0000000;
	Scale3D.Z = 1.0000000;
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
	WeaponClass=Class'BWBP_SKC_Pro.LAWLauncher'
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.G5BackFlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	AltFlashBone="tip2"
	FlashScale=1.5000000
	BrassMode=3
	InstantMode=3
	ReloadAnim="Reload_MG"
	ReloadAnimRate=1.1050000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.LAW_TPm'
	DrawScale=0.3500000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=5.0000000)
}
