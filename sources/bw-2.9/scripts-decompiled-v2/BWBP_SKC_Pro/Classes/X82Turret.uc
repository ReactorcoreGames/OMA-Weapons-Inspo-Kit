class X82Turret extends BallisticTurret
	config(BallisticProV55);

function AdjustDriverDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x10
	if(InGodMode())
	{
		Damage = 0;
	}
	Momentum = vect(0.0000000, 0.0000000, 0.0000000);
	//return;	
}

function Fire(optional float F)
{
	super(Vehicle).Fire();
	// End:0x25
	if(Weapon != none)
	{
		Weapon.Fire(F);
	}
	//return;	
}

function AltFire(optional float F)
{
	super(Vehicle).AltFire();
	// End:0x25
	if(Weapon != none)
	{
		Weapon.AltFire(F);
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
	UndeployedWeaponName="BWBP_SKC_Pro.X82Rifle"
	WeaponClassName="BWBP_SKC_Pro.X82Rifle_TW"
	GunYawBounds=(Min=-4000.0000000,Max=4000.0000000)
	GunPitchBounds=(Min=-10000.0000000,Max=8192.0000000)
	CamYawBounds=(Min=-12000.0000000,Max=12000.0000000)
	CamPitchBounds=(Min=-10000.0000000,Max=8192.0000000)
	GunYawSpeed=24000.0000000
	GunPitchSpeed=32768.0000000
	CamTrackYawSpeed=32768.0000000
	CamTrackPitchSpeed=32768.0000000
	AbandonedPitch=3400
	CameraOffset=(X=-90.0000000,Y=-14.0000000,Z=14.0000000)
	GunBone="GunPitch"
	PivotBone="Pitch"
	DriverBackOff=100.0000000
	bDrawDriverInTP=true
	VehicleNameString="X-83 A1 Mounted Rifle"
	Mesh=SkeletalMesh'BWBP_SKC_Anim.X83Turret_TPm'
	DrawScale=0.4200000
	CollisionHeight=18.0000000
}
