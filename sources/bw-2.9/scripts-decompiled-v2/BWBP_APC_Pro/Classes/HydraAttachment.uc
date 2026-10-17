class HydraAttachment extends BallisticAttachment;

var bool bLaserOn;
var bool bOldLaserOn;
var LaserActor Laser;
var Vector LaserEndLoc;
var Emitter LaserDot;
var Rotator LaserRot;
var BallisticWeapon myWeap;
var name BackBones[6];
var name FrontBones[6];
var byte Index;
var Actor BackFlashes[6];
var Actor FrontFlashes[6];

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLaserOn;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		LaserRot;
}

simulated function FlashMuzzleFlash(byte Mode)
{
	// End:0x3C
	if(Instigator.IsFirstPerson() && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0x14A
	if(AltMuzzleFlashClass != none)
	{
		// End:0x12D
		if(BackFlashes[int(Index)] == none)
		{
			BackFlashes[int(Index)] = Spawn(AltMuzzleFlashClass, self);
			// End:0xB6
			if(Emitter(BackFlashes[int(Index)]) != none)
			{
				Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(BackFlashes[int(Index)]), DrawScale * FlashScale);
			}
			BackFlashes[int(Index)].SetDrawScale(DrawScale * FlashScale);
			// End:0x10D
			if(DGVEmitter(BackFlashes[int(Index)]) != none)
			{
				DGVEmitter(BackFlashes[int(Index)]).InitDGV();
			}
			AttachToBone(BackFlashes[int(Index)], BackBones[int(Index)]);
		}
		BackFlashes[int(Index)].Trigger(self, Instigator);
	}
	// End:0x258
	if(MuzzleFlashClass != none)
	{
		// End:0x23B
		if(FrontFlashes[int(Index)] == none)
		{
			FrontFlashes[int(Index)] = Spawn(MuzzleFlashClass, self);
			// End:0x1C4
			if(Emitter(FrontFlashes[int(Index)]) != none)
			{
				Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(FrontFlashes[int(Index)]), DrawScale * FlashScale);
			}
			FrontFlashes[int(Index)].SetDrawScale(DrawScale * FlashScale);
			// End:0x21B
			if(DGVEmitter(FrontFlashes[int(Index)]) != none)
			{
				DGVEmitter(FrontFlashes[int(Index)]).InitDGV();
			}
			AttachToBone(FrontFlashes[int(Index)], FrontBones[int(Index)]);
		}
		FrontFlashes[int(Index)].Trigger(self, Instigator);
	}
	Index++;
	// End:0x275
	if(int(Index) > 5)
	{
		Index = 0;
	}
	//return;	
}

simulated event Destroyed()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x51 [Loop If]
	if(i < 6)
	{
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(FrontFlashes[i]);
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(BackFlashes[i]);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0x68
	if(LaserDot != none)
	{
		LaserDot.Destroy();
	}
	// End:0x7F
	if(Laser != none)
	{
		Laser.Destroy();
	}
	super.Destroyed();
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
		Laser = Spawn(Class'BallisticProV55.LaserActor_G5Painter',,, Location);
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
	loc = GetBoneCoords('tip2').Origin;
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
	Scale3D.Y = 1.5000000;
	Scale3D.Z = 1.5000000;
	Laser.SetDrawScale3D(Scale3D);
	//return;	
}

defaultproperties
{
	BackBones[0]="backblast"
	BackBones[1]="backblast"
	BackBones[2]="backblast"
	BackBones[3]="backblast"
	BackBones[4]="backblast"
	BackBones[5]="backblast"
	FrontBones[0]="Muzzle1"
	FrontBones[1]="Muzzle2"
	FrontBones[2]="Muzzle3"
	FrontBones[3]="Muzzle4"
	FrontBones[4]="Muzzle5"
	FrontBones[5]="Muzzle6"
	WeaponClass=Class'BWBP_APC_Pro.HydraBazooka'
	MuzzleFlashClass=Class'BWBP_APC_Pro.HydraFlashEmitter'
	AltMuzzleFlashClass=Class'BWBP_APC_Pro.HydraBackFlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	AltFlashBone="Laser"
	FlashScale=1.2000000
	BrassMode=3
	InstantMode=3
	ReloadAnim="Reload_MG"
	ReloadAnimRate=1.1800000
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_APC_Anim.CruRL_TPm'
	DrawScale=0.2300000
}
