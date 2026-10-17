class MG36Turret extends BallisticTurret
	config(BallisticProV55);

simulated function Vector CalcDrawOffset(Inventory Inv)
{
	return vect(0.0000000, 0.0000000, 1.0000000) * (Inv.CollisionHeight - CollisionHeight);
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
	// End:0x1E5
	if((BallisticWeapon(Weap) != none) && MG36MG_TW(Weap) != none)
	{
		SetBoneScale(0, 0.0000000, 'Silencer');
		// End:0x156
		if(!MG36MG_TW(Weap).bHasGauss)
		{
			Skins[5] = Texture'BW_Core_WeaponTex.Misc.Invisible';
		}
		// End:0x181
		if(!MG36MG_TW(Weap).bHasScope)
		{
			SetBoneScale(2, 0.0000000, 'Scope');
		}
		// End:0x1C1
		if(!MG36MG_TW(Weap).bHasDrum)
		{
			SetBoneScale(3, 0.0000000, 'magBig');
			SetBoneScale(4, 1.0000000, 'MagSmall');			
		}
		else
		{
			SetBoneScale(3, 1.0000000, 'magBig');
			SetBoneScale(4, 0.0000000, 'MagSmall');
		}
	}
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
	return (MaxDesireability * 0.5000000) + ((MaxDesireability * 0.5000000) * (float(MagAmmoAmount) / 50.0000000));
	//return;	
}

simulated function NextWeapon()
{
	// End:0x26
	if((Weapon != none) && BallisticWeapon(Weapon) != none)
	{
		super(Pawn).NextWeapon();		
	}
	else
	{
		super(Vehicle).NextWeapon();
	}
	//return;	
}

simulated function PrevWeapon()
{
	// End:0x26
	if((Weapon != none) && BallisticWeapon(Weapon) != none)
	{
		super(Pawn).PrevWeapon();		
	}
	else
	{
		super(Vehicle).PrevWeapon();
	}
	//return;	
}

defaultproperties
{
	UndeployedWeaponName="BWBP_SKC_Pro.MG36Machinegun"
	WeaponClassName="BWBP_SKC_Pro.MG36MG_TW"
	GunYawBounds=(Min=-6000.0000000,Max=6000.0000000)
	GunPitchBounds=(Min=-8192.0000000,Max=8192.0000000)
	CamYawBounds=(Min=-6000.0000000,Max=6000.0000000)
	CamPitchBounds=(Min=-8192.0000000,Max=8192.0000000)
	GunYawSpeed=24000.0000000
	GunPitchSpeed=32768.0000000
	CamTrackYawSpeed=32768.0000000
	CamTrackPitchSpeed=32768.0000000
	AbandonedPitch=2000
	CameraOffset=(X=-60.0000000,Y=-15.0000000,Z=20.0000000)
	CameraElevation=5.0000000
	GunBone="Weapon"
	PivotBone="StandPivot"
	DriverOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	DriverBackOff=100.0000000
	bDrawDriverInTP=true
	VehicleNameString="MG36 Mounted Machinegun"
	Mesh=SkeletalMesh'BWBP_SKC_Anim.MG36Turret_TPm'
	DrawScale=0.3200000
	Skins[0]=Texture'BWBP_SKC_Tex.MG36.MG36-Main'
	CollisionHeight=18.0000000
}
