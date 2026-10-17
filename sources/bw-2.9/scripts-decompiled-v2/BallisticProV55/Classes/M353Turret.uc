class M353Turret extends BallisticTurret
	config(BallisticProV55);

simulated function Vector CalcDrawOffset(Inventory Inv)
{
	return vect(0.0000000, 0.0000000, 1.0000000) * (Inv.CollisionHeight - CollisionHeight);
	//return;	
}

function UpdateWeaponRotation()
{
	local Rotator HeadRot, NeckRot;

	// End:0xC5
	if(Weapon != none)
	{
		NeckRot.Yaw = -GunRotation.Yaw;
		HeadRot.Pitch = -GunRotation.Pitch;
		NeckRot.Yaw -= WeaponPivot.Yaw;
		HeadRot.Pitch -= WeaponPivot.Pitch;
		// End:0x93
		if(Weapon.hand < float(0))
		{
			NeckRot.Yaw = 0 - NeckRot.Yaw;
		}
		Weapon.SetBoneRotation(PivotBone, NeckRot);
		Weapon.SetBoneRotation('Gun', HeadRot);
	}
	//return;	
}

function InitTurretWeapon(Weapon Weap)
{
	local Ammunition A;

	// End:0xF1
	if(Driver != none)
	{
		A = Ammunition(Driver.FindInventoryType(Weap.GetAmmoClass(0)));
		// End:0xDB
		if(A == none)
		{
			A = Driver.Spawn(Weap.GetAmmoClass(0), Driver);
			Driver.AddInventory(A);
			// End:0xB2
			if(Class'BCoreProV55.BallisticReplicationInfo'.default.bNoReloading)
			{
				A.AmmoAmount = BallisticWeapon(Weap).MagAmmo;				
			}
			else
			{
				A.AmmoAmount = 0;
			}
			AmmoAmount[0] = A.AmmoAmount;			
		}
		else
		{
			AmmoAmount[0] = A.AmmoAmount;
		}
	}
	super.InitTurretWeapon(Weap);
	//return;	
}

function SaveTurretWeaponInfo()
{
	local Ammunition A;

	super.SaveTurretWeaponInfo();
	// End:0xBD
	if((Driver != none) && Weapon != none)
	{
		A = Ammunition(Driver.FindInventoryType(Weapon.GetAmmoClass(0)));
		// End:0xA7
		if(A == none)
		{
			A = Driver.Spawn(Weapon.GetAmmoClass(0), Driver);
			Driver.AddInventory(A);
			A.AmmoAmount = AmmoAmount[0];			
		}
		else
		{
			A.AmmoAmount = AmmoAmount[0];
		}
	}
	//return;	
}

function float BotDesireability(Actor S, int TeamIndex, Actor Objective)
{
	// End:0x1C
	if((Health <= 0) || Occupied())
	{
		return 0.0000000;
	}
	// End:0x47
	if((MagAmmoAmount == 0) && BotsNextDesireTime > Level.TimeSeconds)
	{
		return 0.0000000;
	}
	// End:0x56
	if(bKeyVehicle)
	{
		return 100.0000000;
	}
	return (MaxDesireability * 0.5000000) + ((MaxDesireability * 0.5000000) * (float(MagAmmoAmount) / 150.0000000));
	//return;	
}

defaultproperties
{
	UndeployedWeaponName="BallisticProV55.M353Machinegun"
	WeaponClassName="BallisticProV55.M353Machinegun_TW"
	GunYawBounds=(Min=-12000.0000000,Max=12000.0000000)
	GunPitchBounds=(Min=-10000.0000000,Max=8192.0000000)
	CamYawBounds=(Min=-12000.0000000,Max=12000.0000000)
	CamPitchBounds=(Min=-10000.0000000,Max=12000.0000000)
	GunYawSpeed=24000.0000000
	GunPitchSpeed=32768.0000000
	CamTrackYawSpeed=32768.0000000
	CamTrackPitchSpeed=32768.0000000
	AbandonedPitch=3400
	CameraOffset=(X=-60.0000000,Y=-3.0000000,Z=22.0000000)
	CameraElevation=5.0000000
	GunBone="M353"
	PivotBone="Base"
	DriverBackOff=35.0000000
	bDrawDriverInTP=true
	VehicleNameString="M353 Machinegun Turret"
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.M353Turret_TPm'
	DrawScale=0.5000000
	CollisionHeight=14.2000000
}
