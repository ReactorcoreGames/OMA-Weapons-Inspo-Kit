class WrenchMinigunTurret extends ASTurret_Minigun
	config(User);

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	local int actualDamage;
	local bool bAlreadyDead;
	local Controller Killer;

	// End:0x49
	if(int(Role) < int(ROLE_Authority))
	{
		Log((((string(self) $ " client damage type ") $ string(DamageType)) $ " by ") $ string(instigatedBy));
		return;
	}
	// End:0x5F
	if(Level.Game == none)
	{
		return;
	}
	// End:0x84
	if((bSpawnProtected && instigatedBy != none) && instigatedBy != self)
	{
		return;
	}
	// End:0xAF
	if((Level.TimeSeconds == DamLastDamageTime) && instigatedBy == DamLastInstigator)
	{
		return;
	}
	DamLastInstigator = instigatedBy;
	DamLastDamageTime = Level.TimeSeconds;
	// End:0xE4
	if(DamageType == none)
	{
		DamageType = Class'Engine.DamageType';
	}
	Damage *= DamageType.default.VehicleDamageScaling;
	Momentum *= (DamageType.default.VehicleMomentumScaling * MomentumMult);
	bAlreadyDead = Health <= 0;
	NetUpdateTime = Level.TimeSeconds - float(1);
	// End:0x170
	if(Weapon != none)
	{
		Weapon.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	}
	// End:0x19A
	if((instigatedBy != none) && instigatedBy.HasUDamage())
	{
		Damage *= float(2);
	}
	actualDamage = Level.Game.ReduceDamage(Damage, self, instigatedBy, HitLocation, Momentum, DamageType);
	// End:0x202
	if(DamageType.default.bArmorStops && actualDamage > 0)
	{
		actualDamage = ShieldAbsorb(actualDamage);
	}
	// End:0x251
	if((bShowDamageOverlay && DamageType.default.DamageOverlayMaterial != none) && actualDamage > 0)
	{
		SetOverlayMaterial(DamageType.default.DamageOverlayMaterial, DamageType.default.DamageOverlayTime, true);
	}
	Health -= actualDamage;
	// End:0x27F
	if(HitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		HitLocation = Location;
	}
	// End:0x28A
	if(bAlreadyDead)
	{
		return;
	}
	PlayHit(float(actualDamage), instigatedBy, HitLocation, DamageType, Momentum);
	// End:0x333
	if(Health <= 0)
	{
		EjectDriver();
		// End:0x2DF
		if(instigatedBy != none)
		{
			Killer = instigatedBy.GetKillerController();			
		}
		else
		{
			// End:0x309
			if((DamageType != none) && DamageType.default.bDelayedDamage)
			{
				Killer = DelayedDamageInstigatorController;
			}
		}
		Health = 0;
		TearOffMomentum = Momentum;
		Died(Killer, DamageType, HitLocation);		
	}
	else
	{
		// End:0x366
		if(Controller != none)
		{
			Controller.NotifyTakeHit(instigatedBy, HitLocation, actualDamage, DamageType, Momentum);
		}
	}
	MakeNoise(1.0000000);
	//return;	
}

function Died(Controller Killer, Class<DamageType> DamageType, Vector HitLocation)
{
	local PlayerController PC;
	local Controller C;

	// End:0x1F
	if(bDeleteMe || Level.bLevelChange)
	{
		return;
	}
	// End:0x46
	if(int(Physics) != int(13))
	{
		super(Vehicle).Died(Killer, DamageType, HitLocation);
		return;
	}
	// End:0x81
	if(Level.Game.PreventDeath(self, Killer, DamageType, HitLocation))
	{
		Health = Max(Health, 1);
		return;
	}
	Health = Min(0, Health);
	// End:0x1DE
	if(Controller != none)
	{
		C = Controller;
		C.WasKilledBy(Killer);
		Level.Game.Killed(Killer, C, self, DamageType);
		// End:0x1A5
		if(C.bIsPlayer)
		{
			PC = PlayerController(C);
			// End:0x11C
			if(PC != none)
			{
				ClientKDriverLeave(PC);				
			}
			else
			{
				ClientClearController();
			}
			// End:0x195
			if(((bRemoteControlled || bEjectDriver) && Driver != none) && Driver.Health > 0)
			{
				C.UnPossess();
				C.Possess(Driver);
				// End:0x18B
				if(bEjectDriver)
				{
					EjectDriver();
				}
				Driver = none;				
			}
			else
			{
				C.PawnDied(self);
			}
		}
		// End:0x1DB
		if(!C.bIsPlayer && !C.bDeleteMe)
		{
			C.Destroy();
		}		
	}
	else
	{
		Level.Game.Killed(Killer, Controller(Owner), self, DamageType);
	}
	// End:0x233
	if(Killer != none)
	{
		TriggerEvent(Event, self, Killer.Pawn);		
	}
	else
	{
		TriggerEvent(Event, self, none);
	}
	// End:0x25D
	if(IsHumanControlled())
	{
		PlayerController(Controller).ForceDeathUpdate();
	}
	// End:0x26B
	if(!bDeleteMe)
	{
		Destroy();
	}
	//return;	
}

