class WeaponLocker extends Pickup;

struct WeaponEntry
{
	var() Class<Weapon> WeaponClass;
	var() int ExtraAmmo;
};

struct PawnToucher
{
	var Pawn P;
	var float NextTouchTime;
};

var float InactiveTime;
var Class<FX_WeaponLocker> EffectClass;
var() bool bSentinelProtected;
var() array<WeaponEntry> Weapons;
var localized string LockerString;
var FX_WeaponLocker Effect;
var array<PawnToucher> Customers;

function bool AddCustomer(Pawn P)
{
	local int i;
	local PawnToucher PT;

	// End:0xC4
	if(Customers.Length > 0)
	{
		i = 0;
		J0x13:

		// End:0xC4 [Loop If]
		if(i < Customers.Length)
		{
			// End:0x9E
			if(Customers[i].NextTouchTime < Level.TimeSeconds)
			{
				// End:0x88
				if(Customers[i].P == P)
				{
					Customers[i].NextTouchTime = Level.TimeSeconds + InactiveTime;
					return true;
				}
				Customers.Remove(i, 1);
				i--;
				// [Explicit Continue]
				goto J0xBA;
			}
			// End:0xBA
			if(Customers[i].P == P)
			{
				return false;
			}
			J0xBA:

			i++;
			// [Loop Continue]
			goto J0x13;
		}
	}
	PT.P = P;
	PT.NextTouchTime = Level.TimeSeconds + InactiveTime;
	Customers[Customers.Length] = PT;
	return true;
	//return;	
}

function bool HasCustomer(Pawn P)
{
	local int i;

	// End:0x9E
	if(Customers.Length > 0)
	{
		i = 0;
		J0x13:

		// End:0x9E [Loop If]
		if(i < Customers.Length)
		{
			// End:0x78
			if(Customers[i].NextTouchTime < Level.TimeSeconds)
			{
				// End:0x62
				if(Customers[i].P == P)
				{
					return false;
				}
				Customers.Remove(i, 1);
				i--;
				// [Explicit Continue]
				goto J0x94;
			}
			// End:0x94
			if(Customers[i].P == P)
			{
				return true;
			}
			J0x94:

			i++;
			// [Loop Continue]
			goto J0x13;
		}
	}
	return false;
	//return;	
}

simulated function PostNetBeginPlay()
{
	local int i;

	super(Actor).PostNetBeginPlay();
	MaxDesireability = 0.0000000;
	// End:0x1C
	if(bHidden)
	{
		return;
	}
	i = Weapons.Length - 1;
	J0x2B:

	// End:0x89 [Loop If]
	if(i > -1)
	{
		// End:0x5F
		if(Weapons[i].WeaponClass == none)
		{
			Weapons.Remove(i, 1);
			// [Explicit Continue]
			goto J0x7F;
		}
		MaxDesireability += Weapons[i].WeaponClass.default.AIRating;
		J0x7F:

		i--;
		// [Loop Continue]
		goto J0x2B;
	}
	SpawnLockerWeapon();
	// End:0xC2
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Effect = Spawn(EffectClass, self,, Location, Rotation);
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(Effect != none)
	{
		Effect.Destroy();
	}
	super.Destroyed();
	//return;	
}

static simulated function UpdateHUD(HUD H)
{
	H.LastPickupTime = H.Level.TimeSeconds;
	H.LastWeaponPickupTime = H.LastPickupTime;
	//return;	
}

function Reset()
{
	//return;	
}

simulated function SpawnLockerWeapon()
{
	local LockerWeapon L;
	local Rotator WeaponDir;
	local Class<UTWeaponPickup> P;
	local int i;
	local float Interval;

	// End:0x36
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.DetailMode) == int(0))
	{
		return;
	}
	L = Spawn(Class'XWeapons.LockerWeapon');
	Interval = 65536.0000000 / float(Weapons.Length);
	i = 0;
	J0x60:

	// End:0x496 [Loop If]
	if(i < 8)
	{
		// End:0x9F
		if(i >= Weapons.Length)
		{
			L.Emitters[i].Disabled = true;
			// [Explicit Continue]
			goto J0x48C;
		}
		P = Class<UTWeaponPickup>(Weapons[i].WeaponClass.default.PickupClass);
		// End:0x107
		if((P == none) || P.default.StaticMesh == none)
		{
			L.Emitters[i].Disabled = true;
			// [Explicit Continue]
			goto J0x48C;
		}
		MeshEmitter(L.Emitters[i]).StaticMesh = P.default.StaticMesh;
		L.Emitters[i].StartLocationOffset = P.default.LockerOffset * Vector(WeaponDir);
		WeaponDir.Yaw += int(Interval);
		MeshEmitter(L.Emitters[i]).StartSpinRange.X.Min = P.default.StandUp.X;
		MeshEmitter(L.Emitters[i]).StartSpinRange.X.Max = P.default.StandUp.X;
		MeshEmitter(L.Emitters[i]).StartSpinRange.Y.Min = P.default.StandUp.Y;
		MeshEmitter(L.Emitters[i]).StartSpinRange.Y.Max = P.default.StandUp.Y;
		MeshEmitter(L.Emitters[i]).StartSpinRange.Z.Min = P.default.StandUp.Z;
		MeshEmitter(L.Emitters[i]).StartSpinRange.Z.Max = P.default.StandUp.Z;
		MeshEmitter(L.Emitters[i]).StartSizeRange.X.Min = 0.9000000 * P.default.DrawScale;
		MeshEmitter(L.Emitters[i]).StartSizeRange.X.Max = 0.9000000 * P.default.DrawScale;
		MeshEmitter(L.Emitters[i]).StartSizeRange.Y.Min = 0.9000000 * P.default.DrawScale;
		MeshEmitter(L.Emitters[i]).StartSizeRange.Y.Max = 0.9000000 * P.default.DrawScale;
		MeshEmitter(L.Emitters[i]).StartSizeRange.Z.Min = 0.9000000 * P.default.DrawScale;
		MeshEmitter(L.Emitters[i]).StartSizeRange.Z.Max = 0.9000000 * P.default.DrawScale;
		J0x48C:

		i++;
		// [Loop Continue]
		goto J0x60;
	}
	//return;	
}

simulated function string GetHumanReadableName()
{
	return LockerString;
	//return;	
}

function float BotDesireability(Pawn Bot)
{
	local Weapon AlreadyHas;
	local float desire;
	local int i;

	// End:0x1F
	if(bHidden || HasCustomer(Bot))
	{
		return 0.0000000;
	}
	// End:0x6D
	if((bSentinelProtected && Bot(Bot.Controller) != none) && !Bot(Bot.Controller).NeedWeapon())
	{
		return 0.0000000;
	}
	i = 0;
	J0x74:

	// End:0x11B [Loop If]
	if(i < Weapons.Length)
	{
		// End:0x111
		if(Weapons[i].WeaponClass != none)
		{
			AlreadyHas = Weapon(Bot.FindInventoryType(Weapons[i].WeaponClass));
			// End:0xF2
			if(AlreadyHas == none)
			{
				desire += Weapons[i].WeaponClass.default.AIRating;
				// [Explicit Continue]
				goto J0x111;
			}
			// End:0x111
			if(AlreadyHas.NeedAmmo(0))
			{
				desire += 0.1500000;
			}
		}
		J0x111:

		i++;
		// [Loop Continue]
		goto J0x74;
	}
	// End:0x16D
	if(Bot.Controller.bHuntPlayer && (desire * 0.8330000) < (Bot.Weapon.AIRating - 0.1000000))
	{
		return 0.0000000;
	}
	// End:0x1B1
	if((Bot.Weapon == none) || Bot.Weapon.AIRating < 0.5000000)
	{
		return 2.0000000 * desire;
	}
	return desire;
	//return;	
}

function float DetourWeight(Pawn Other, float PathWeight)
{
	local Weapon AlreadyHas;
	local float desire;
	local int i;

	// End:0x1F
	if(bHidden || HasCustomer(Other))
	{
		return 0.0000000;
	}
	i = 0;
	J0x26:

	// End:0xB7 [Loop If]
	if(i < Weapons.Length)
	{
		AlreadyHas = Weapon(Other.FindInventoryType(Weapons[i].WeaponClass));
		// End:0x8E
		if(AlreadyHas == none)
		{
			desire += Weapons[i].WeaponClass.default.AIRating;
			// [Explicit Continue]
			goto J0xAD;
		}
		// End:0xAD
		if(AlreadyHas.NeedAmmo(0))
		{
			desire += 0.1500000;
		}
		J0xAD:

		i++;
		// [Loop Continue]
		goto J0x26;
	}
	// End:0x11A
	if(AIController(Other.Controller).PriorityObjective() && (Other.Weapon.AIRating > 0.5000000) || PathWeight > float(400))
	{
		return 0.2000000 / PathWeight;
	}
	return desire / PathWeight;
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x49 [Loop If]
	if(i < Weapons.Length)
	{
		Weapons[i].WeaponClass.default.PickupClass.StaticPrecache(Level);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

auto state LockerPickup
{
	function bool ReadyToPickup(float MaxWait)
	{
		return true;
		//return;		
	}

	simulated function bool ValidTouch(Actor Other)
	{
		// End:0x63
		if(((Pawn(Other) == none) || !Pawn(Other).bCanPickupInventory) || (Pawn(Other).DrivenVehicle == none) && Pawn(Other).Controller == none)
		{
			return false;
		}
		// End:0x80
		if(!FastTrace(Other.Location, Location))
		{
			return false;
		}
		return true;
		//return;		
	}

	simulated function Touch(Actor Other)
	{
		local Weapon Copy;
		local int i;

		// End:0x1FC
		if(ValidTouch(Other))
		{
			// End:0x8F
			if((PlayerController(Pawn(Other).Controller) != none) && Viewport(PlayerController(Pawn(Other).Controller).Player) != none)
			{
				// End:0x8F
				if((Effect != none) && !Effect.bHidden)
				{
					Effect.TurnOff(InactiveTime);
				}
			}
			// End:0xA1
			if(int(Role) < int(ROLE_Authority))
			{
				return;
			}
			// End:0xB8
			if(!AddCustomer(Pawn(Other)))
			{
				return;
			}
			TriggerEvent(Event, self, Pawn(Other));
			i = 0;
			J0xD5:

			// End:0x1EC [Loop If]
			if(i < Weapons.Length)
			{
				InventoryType = Weapons[i].WeaponClass;
				Copy = Weapon(Pawn(Other).FindInventoryType(Weapons[i].WeaponClass));
				// End:0x147
				if(Copy != none)
				{
					Copy.FillToInitialAmmo();
					// [Explicit Continue]
					goto J0x1E2;
				}
				// End:0x1E2
				if(Level.Game.PickupQuery(Pawn(Other), self))
				{
					Copy = Weapon(SpawnCopy(Pawn(Other)));
					// End:0x1E2
					if(Copy != none)
					{
						Copy.PickupFunction(Pawn(Other));
						// End:0x1E2
						if(Weapons[i].ExtraAmmo > 0)
						{
							Copy.AddAmmo(Weapons[i].ExtraAmmo, 0);
						}
					}
				}
				J0x1E2:

				i++;
				// [Loop Continue]
				goto J0xD5;
			}
			AnnouncePickup(Pawn(Other));
		}
		//return;		
	}
	stop;	
}

state Disabled
{
	simulated function BeginState()
	{
		local LockerWeapon W;

		super.BeginState();
		// End:0x23
		foreach DynamicActors(Class'XWeapons.LockerWeapon', W)
		{
			W.Destroy();			
		}		
		// End:0x3B
		if(Effect != none)
		{
			Effect.Destroy();
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	InactiveTime=30.0000000
	EffectClass=Class'XWeapons.FX_WeaponLocker'
	LockerString="Weapon Locker"
	PickupMessage="You loaded up at a weapon locker."
	PickupSound=Sound'NewWeaponSounds.WeaponsLocker_01'
	DrawType=8
	StaticMesh=StaticMesh'NewWeaponStatic.WeaponLockerM'
	bStatic=true
	NetUpdateFrequency=1.0000000
	DrawScale=0.5000000
	DrawScale3D=(X=1.2500000,Y=1.2500000,Z=1.0000000)
	PrePivot=(X=0.0000000,Y=0.0000000,Z=105.0000000)
	CollisionRadius=80.0000000
	CollisionHeight=50.0000000
	RotationRate=(Pitch=0,Yaw=0,Roll=0)
	DesiredRotation=(Pitch=0,Yaw=0,Roll=0)
	MessageClass=Class'UnrealGame.PickupMessagePlus'
}
