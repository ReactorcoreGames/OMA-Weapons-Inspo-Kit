class XMV500AutoTurret extends BallisticAutoTurret
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

function SetAbandoned()
{
	//return;	
}

function InitAutoTurretWeapon(Weapon Weap)
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
	InitTurretWeapon(Weap);
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
	return (MaxDesireability * 0.5000000) + ((MaxDesireability * 0.5000000) * (float(MagAmmoAmount) / 900.0000000));
	//return;	
}

defaultproperties
{
	UndeployedWeaponName="BWBP_APC_Pro.XMV500Minigun"
	WeaponClassName="BWBP_APC_Pro.XMV500Minigun_TW"
	TargetAcquiredSound=Sound'BWBP_SKC_Sounds.AH104.AH104-SightOn'
	GunBone="Minigun"
	PivotBone="StandBase"
	RotationInertia=0.5000000
	RotPitchConstraint=(Min=8000.0000000,Max=5000.0000000)
	RotationSpeed=5.0000000
	CamRelLocation=(X=250.0000000,Y=0.0000000,Z=150.0000000)
	CamDistance=(X=-800.0000000,Y=0.0000000,Z=0.0000000)
	ZoomWeaponOffsetAdjust=275.0000000
	WeaponInfoTexture=Texture'AS_FX_TX.HUD.SpaceHUD_Weapon_Solid_Skaarj'
	DefaultWeaponClassName="UT2k4AssaultFull.Weapon_LinkTurret"
	VehicleProjSpawnOffset=(X=220.0000000,Y=0.0000000,Z=15.0000000)
	bCHZeroYOffset=false
	bDrawDriverInTP=true
	AutoTurretControllerClass=Class'UT2k4AssaultFull.LinkTurretController'
	DriveAnim="Biggun_Aimed"
	VehiclePositionString="manning a Link Turret"
	VehicleNameString="[B] XMB-500 Sentry Gun"
	HealthMax=400.0000000
	Health=400
	DrawScale=0.3500000
	CollisionHeight=22.4000000
	bNetNotify=true
}
