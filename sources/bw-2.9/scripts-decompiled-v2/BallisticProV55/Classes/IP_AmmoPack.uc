class IP_AmmoPack extends BallisticAmmoPickup;

var() StaticMesh LowPolyStaticMesh;
var() float LowPolyDist;

function float DetourWeight(Pawn Other, float PathWeight)
{
	local Inventory Inv;
	local Weapon W;
	local float desire;

	// End:0x3D
	if((Other.Weapon != none) && Other.Weapon.AIRating >= 0.5000000)
	{
		return 0.0000000;
	}
	Inv = Other.Inventory;
	J0x51:

	// End:0xBC [Loop If]
	if(Inv != none)
	{
		W = Weapon(Inv);
		// End:0xA5
		if(W != none)
		{
			desire += FMax(-0.5000000, W.DesireAmmo(W.GetAmmoClass(0), true));
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x51;
	}
	return desire / PathWeight;
	//return;	
}

function float BotDesireability(Pawn Bot)
{
	local Inventory Inv;
	local Weapon W;
	local float desire;

	Inv = Bot.Inventory;
	J0x14:

	// End:0x7F [Loop If]
	if(Inv != none)
	{
		W = Weapon(Inv);
		// End:0x68
		if(W != none)
		{
			desire += FMax(-0.5000000, W.DesireAmmo(W.GetAmmoClass(0), false));
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x14;
	}
	// End:0xA7
	if(Bot.Controller.bHuntPlayer)
	{
		return desire *= 0.2500000;
	}
	return desire * MaxDesireability;
	//return;	
}

simulated event Tick(float dt)
{
	local PlayerController PC;

	super.Tick(dt);
	// End:0x26
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	PC = Level.GetLocalPlayerController();
	// End:0x48
	if(PC == none)
	{
		return;
	}
	// End:0xD6
	if(PC.ViewTarget != none)
	{
		// End:0xB9
		if(VSize(Location - PC.ViewTarget.Location) > (LowPolyDist * (float(90) / PC.FovAngle)))
		{
			// End:0xB6
			if(StaticMesh != LowPolyStaticMesh)
			{
				SetStaticMesh(LowPolyStaticMesh);
			}			
		}
		else
		{
			// End:0xD3
			if(StaticMesh != default.StaticMesh)
			{
				SetStaticMesh(default.StaticMesh);
			}
		}		
	}
	else
	{
		// End:0x12A
		if(VSize(Location - PC.Location) > (LowPolyDist * (float(90) / PC.FovAngle)))
		{
			// End:0x127
			if(StaticMesh != LowPolyStaticMesh)
			{
				SetStaticMesh(LowPolyStaticMesh);
			}			
		}
		else
		{
			// End:0x144
			if(StaticMesh != default.StaticMesh)
			{
				SetStaticMesh(default.StaticMesh);
			}
		}
	}
	//return;	
}

auto state Pickup
{
	function Touch(Actor Other)
	{
		local Inventory Inv, GW;
		local int Count;
		local Weapon W;
		local bool bGetIt;
		local Ammunition A;

		// End:0x349
		if(ValidTouch(Other))
		{
			// End:0x44
			if(Pawn(Other).GiveHealth(5, int(Pawn(Other).HealthMax)))
			{
				bGetIt = true;
			}
			Inv = Pawn(Other).Inventory;
			J0x5D:

			// End:0xDD [Loop If]
			if((Inv != none) && Count < 1000)
			{
				// End:0xBF
				if(BCGhostWeapon(Inv) != none)
				{
					GW = Inv;
					Inv = Inv.Inventory;
					BCGhostWeapon(GW).ReviveWeapon();
					// [Explicit Continue]
					goto J0xD3;
				}
				Inv = Inv.Inventory;
				J0xD3:

				Count++;
				// [Loop Continue]
				goto J0x5D;
			}
			Count = 0;
			Inv = Pawn(Other).Inventory;
			J0xFD:

			// End:0x32A [Loop If]
			if((Inv != none) && Count < 1000)
			{
				A = Ammunition(Inv);
				// End:0x1FA
				if(A != none)
				{
					// End:0x1F7
					if(((A.AmmoAmount < A.MaxAmmo) && BallAmmo(A) == none) && (BallisticAmmo(A) == none) || BallisticAmmo(A).ResuppliesFromPack())
					{
						// End:0x1CE
						if(A.InitialAmount != 0)
						{
							A.AddAmmo(A.InitialAmount);
							bGetIt = true;							
						}
						else
						{
							A.AddAmmo(A.MaxAmmo / 4);
							bGetIt = true;
						}
					}					
				}
				else
				{
					W = Weapon(Inv);
					// End:0x30C
					if((W != none) && W.bNoAmmoInstances)
					{
						// End:0x287
						if(!W.AmmoMaxed(0) && W.GetAmmoClass(0) != none)
						{
							W.AddAmmo(W.static.GetAmmoClass(0).default.InitialAmount, 0);
							bGetIt = true;
						}
						// End:0x30C
						if(((W.GetAmmoClass(1) != none) && W.GetAmmoClass(1) != W.GetAmmoClass(0)) && !W.AmmoMaxed(1))
						{
							bGetIt = true;
							W.AddAmmo(W.static.GetAmmoClass(1).default.InitialAmount, 1);
						}
					}
				}
				Count++;
				Inv = Inv.Inventory;
				// [Loop Continue]
				goto J0xFD;
			}
			// End:0x349
			if(bGetIt)
			{
				AnnouncePickup(Pawn(Other));
				SetRespawn();
			}
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.Ammo.AmmoPackLo'
	LowPolyDist=500.0000000
	MaxDesireability=0.7000000
	PickupMessage="You picked up an ammo pack."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.AmmoPackPickup'
	PickupForce="HealthPack"
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Ammo.AmmoPackHi'
	DrawScale=0.3500000
	CollisionRadius=16.0000000
	CollisionHeight=15.0000000
}
