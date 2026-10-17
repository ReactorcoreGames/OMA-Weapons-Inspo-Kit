class IP_L8GIAmmoPack extends IP_AmmoPack;

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

		// End:0x32F
		if(ValidTouch(Other))
		{
			// End:0x44
			if(Pawn(Other).GiveHealth(5, int(Pawn(Other).HealthMax)))
			{
				bGetIt = true;
			}
			Inv = Pawn(Other).Inventory;
			J0x5D:

			// End:0x112 [Loop If]
			if((Inv != none) && Count < 1000)
			{
				// End:0x108
				if(!Inv.IsA('L8GIAmmoPack'))
				{
					// End:0xF4
					if((BCGhostWeapon(Inv) != none) && BCGhostWeapon(Inv).MyWeaponClass != Class'BWBP_OP_Pro.L8GIAmmoPack')
					{
						GW = Inv;
						Inv = Inv.Inventory;
						BCGhostWeapon(GW).ReviveWeapon();
						// [Explicit Continue]
						goto J0x108;
					}
					Inv = Inv.Inventory;
				}
				J0x108:

				Count++;
				// [Loop Continue]
				goto J0x5D;
			}
			Count = 0;
			Inv = Pawn(Other).Inventory;
			J0x132:

			// End:0x310 [Loop If]
			if((Inv != none) && Count < 1000)
			{
				A = Ammunition(Inv);
				// End:0x1CA
				if((A != none) && !A.IsA('Ammo_L8GI'))
				{
					// End:0x1C7
					if(A.AmmoAmount < A.MaxAmmo)
					{
						A.AddAmmo(A.InitialAmount);
						bGetIt = true;
					}					
				}
				else
				{
					W = Weapon(Inv);
					// End:0x2F2
					if((W != none) && !W.IsA('L8GIAmmoPack'))
					{
						// End:0x2F2
						if(W.bNoAmmoInstances)
						{
							// End:0x26D
							if(!W.AmmoMaxed(0) && W.GetAmmoClass(0) != none)
							{
								W.AddAmmo(W.static.GetAmmoClass(0).default.InitialAmount, 0);
								bGetIt = true;
							}
							// End:0x2F2
							if(((W.GetAmmoClass(1) != none) && W.GetAmmoClass(1) != W.GetAmmoClass(0)) && !W.AmmoMaxed(1))
							{
								bGetIt = true;
								W.AddAmmo(W.static.GetAmmoClass(1).default.InitialAmount, 1);
							}
						}
					}
				}
				Count++;
				Inv = Inv.Inventory;
				// [Loop Continue]
				goto J0x132;
			}
			// End:0x32F
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
	RespawnTime=0.0000000
}
