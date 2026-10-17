class MACTurret extends BallisticTurret
	config(BallisticProV55);

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

function SetAbandoned()
{
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
	return (MaxDesireability * 0.5000000) + ((MaxDesireability * 0.5000000) * (float(MagAmmoAmount) / 900.0000000));
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

simulated event Tick(float dt)
{
	local Rotator newRot;

	// End:0x78
	if((Driver != none) && bDriving)
	{
		// End:0x78
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			newRot = Rotator((RightHandlePosition()) - Driver.GetBoneCoords('Bip01 R UpperArm').Origin);
			Driver.SetBoneDirection('Bip01 R UpperArm', newRot,, 0.4000000, 1);
		}
	}
	super.Tick(dt);
	//return;	
}

simulated event DrivingStatusChanged()
{
	local int i;

	super.DrivingStatusChanged();
	// End:0x161
	if(!bDriving && OldDriver != none)
	{
		OldDriver.bNoWeaponFiring = false;
		OldDriver.SetBoneDirection('Bip01 R UpperArm', Rotation,, 0.0000000, 0);
		// End:0x86
		if(IsLocallyControlled())
		{
			// End:0x86
			if(OldDriver.Controller != none)
			{
				OldDriver.Controller.bRun = 0;
			}
		}
		// End:0x161
		if(MACWeapon(Weapon) != none)
		{
			i = 0;
			J0x9D:

			// End:0x161 [Loop If]
			if(i < MACWeapon(Weapon).Beacons.Length)
			{
				// End:0x109
				if(MACWeapon(Weapon).Beacons[i].Trail != none)
				{
					MACWeapon(Weapon).Beacons[i].Trail.bHidden = true;
				}
				// End:0x157
				if(MACWeapon(Weapon).Beacons[i].Sphere != none)
				{
					MACWeapon(Weapon).Beacons[i].Sphere.bHidden = true;
				}
				i++;
				// [Loop Continue]
				goto J0x9D;
			}
		}
	}
	//return;	
}

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

defaultproperties
{
	UndeployedWeaponName="BallisticProV55.MACWeapon"
	WeaponClassName="BallisticProV55.MACWeapon_TW"
	GunPitchBounds=(Min=-8192.0000000,Max=10000.0000000)
	CamPitchBounds=(Min=-5000.0000000,Max=14000.0000000)
	GunYawSpeed=16000.0000000
	GunPitchSpeed=12000.0000000
	CamYawSpeed=24000.0000000
	CamPitchSpeed=24000.0000000
	CameraOffset=(X=-52.0000000,Y=0.0000000,Z=14.0000000)
	CameraElevation=26.0000000
	GunBone="GunSlide"
	PivotBone="StandPivot"
	bDrawDriverInTP=true
	VehicleNameString="J2329-HAMR Turret"
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.HAMRTurret_TPm'
	DrawScale=0.2500000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=8.0000000)
	CollisionHeight=32.0000000
}
