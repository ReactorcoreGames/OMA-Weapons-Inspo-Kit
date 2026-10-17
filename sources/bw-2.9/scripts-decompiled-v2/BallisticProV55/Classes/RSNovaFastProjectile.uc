class RSNovaFastProjectile extends BallisticProjectile;

var bool bComboHit;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bComboHit;
}

simulated event PostNetReceive()
{
	// End:0x21
	if(bComboHit)
	{
		Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	}
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	// End:0x0B
	if(bExploded)
	{
		return;
	}
	// End:0x32
	if((ShakeRadius > float(0)) || MotionBlurRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	// End:0xE6
	if((ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x8E
		if(bComboHit)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 5, Level.GetLocalPlayerController());			
		}
		else
		{
			// End:0xC6
			if(Instigator == none)
			{
				ImpactManager.static.StartSpawn(HitLocation, HitNormal, 3, Level.GetLocalPlayerController());				
			}
			else
			{
				ImpactManager.static.StartSpawn(HitLocation, HitNormal, 3, Instigator);
			}
		}
	}
	BlowUp(HitLocation);
	bExploded = true;
	// End:0x137
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		GotoState('NetTrapped');		
	}
	else
	{
		Destroy();
	}
	//return;	
}

simulated function DoDamage(Actor Other, Vector HitLocation)
{
	local Class<DamageType> dt;
	local float Dmg;
	local Actor Victim;
	local bool bWasAlive;
	local DestroyableObjective HealObjective;
	local Vehicle HealVehicle;
	local int AdjustedDamage;
	local Vector ClosestLocation, Temp, BoneTestLocation;

	// End:0x55
	if(Instigator != none)
	{
		AdjustedDamage = int((default.Damage * Instigator.DamageScaling) * MyDamageType.default.VehicleDamageScaling);
		// End:0x55
		if(Instigator.HasUDamage())
		{
			AdjustedDamage *= float(2);
		}
	}
	HealObjective = DestroyableObjective(Other);
	// End:0x89
	if(HealObjective == none)
	{
		HealObjective = DestroyableObjective(Other.Owner);
	}
	// End:0xD7
	if((HealObjective != none) && HealObjective.TeamLink(Instigator.GetTeamNum()))
	{
		HealObjective.HealDamage(AdjustedDamage, InstigatorController, MyDamageType);
		return;
	}
	HealVehicle = Vehicle(Other);
	// End:0x135
	if((HealVehicle != none) && HealVehicle.TeamLink(Instigator.GetTeamNum()))
	{
		HealVehicle.HealDamage(AdjustedDamage, InstigatorController, MyDamageType);
		return;
	}
	// End:0x16A
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	// End:0x235
	if(xPawn(Other) != none)
	{
		ClosestLocation = Other.Location;
		ClosestLocation.Z += HitLocation - Other.Location.Z;
		Temp = Normal(Velocity);
		Temp *= VSize(ClosestLocation - HitLocation);
		BoneTestLocation = Temp;
		BoneTestLocation *= (Normal(ClosestLocation - HitLocation) Dot Normal(Temp));
		BoneTestLocation += HitLocation;
		Victim = GetDamageVictim(Other, BoneTestLocation, Normal(Velocity), Dmg, dt);		
	}
	else
	{
		Victim = GetDamageVictim(Other, HitLocation, Normal(Velocity), Dmg, dt);
	}
	// End:0x2C1
	if((xPawn(Victim) != none) && Pawn(Victim).Health > 0)
	{
		// End:0x2BE
		if((Monster(Victim) == none) || Pawn(Victim).default.Health > 275)
		{
			bWasAlive = true;
		}		
	}
	else
	{
		// End:0x318
		if(((Vehicle(Victim) != none) && Vehicle(Victim).Driver != none) && Vehicle(Victim).Driver.Health > 0)
		{
			bWasAlive = true;
		}
	}
	// End:0x3D2
	if(((((BallisticPawn(Instigator) != none) && RSNovaStaff(Instigator.Weapon) != none) && Victim.bProjTarget) && xPawn(Victim) != none) && (Pawn(Victim).GetTeamNum() != Instigator.GetTeamNum()) || Instigator.GetTeamNum() == 255)
	{
		BallisticPawn(Instigator).GiveAttributedShield(int(Dmg * 0.6000000), Instigator);
	}
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, Dmg, Instigator, HitLocation, MomentumTransfer * Normal(Velocity), dt);
	// End:0x450
	if(bWasAlive && Pawn(Victim).Health <= 0)
	{
		Class'BallisticProV55.RSNovaSoul'.static.SpawnSoul(HitLocation, Instigator, Pawn(Other), self);
	}
	//return;	
}

singular simulated function HitWall(Vector HitNormal, Actor Wall)
{
	local Vehicle HealVehicle;
	local int AdjustedDamage;

	HealVehicle = Vehicle(Wall);
	// End:0x10C
	if((HealVehicle != none) && HealVehicle.TeamLink(Instigator.GetTeamNum()))
	{
		AdjustedDamage = int((default.Damage * Instigator.DamageScaling) * MyDamageType.default.VehicleDamageScaling);
		// End:0x88
		if(Instigator.HasUDamage())
		{
			AdjustedDamage *= float(2);
		}
		HealVehicle.HealDamage(AdjustedDamage, Instigator.Controller, MyDamageType);
		BlowUp(Location + (ExploWallOut * HitNormal));
		// End:0x106
		if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
		{
			GotoState('NetTrapped');			
		}
		else
		{
			Destroy();
		}		
	}
	else
	{
		// End:0x1C2
		if(int(Role) == int(ROLE_Authority))
		{
			// End:0x1BA
			if((!Wall.bStatic && !Wall.bWorldGeometry) && (Pawn(Wall) == none) || Vehicle(Wall) != none)
			{
				// End:0x19F
				if((Instigator == none) || Instigator.Controller == none)
				{
					Wall.SetDelayedDamageInstigatorController(InstigatorController);
				}
				DoDamage(Wall, Location);
				HurtWall = Wall;
			}
			MakeNoise(1.0000000);
		}
	}
	Explode(Location + (ExploWallOut * HitNormal), HitNormal);
	HurtWall = none;
	//return;	
}

simulated function bool CanTouch(Actor Other)
{
	// End:0x24
	if((RSNovaProjectile(Other) != none) || RSNovaFastProjectile(Other) != none)
	{
		return false;
	}
	return super.CanTouch(Other);
	//return;	
}

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x51
	if((DamageType == Class'BallisticProV55.DT_RSDarkSlow') || DamageType == Class'BallisticProV55.DT_RSDarkFast')
	{
		ImpactManager.static.StartSpawn(HitLocation, Normal(Momentum), 5, Level.GetLocalPlayerController(), 4);		
	}
	else
	{
		// End:0x7A
		if(DamageType == Class'BallisticProV55.DT_RSDarkPlasma')
		{
			bComboHit = true;
			Explode(HitLocation, Normal(Momentum));
		}
	}
	//return;	
}

simulated function DestroyEffects()
{
	// End:0x5F
	if(Trail != none)
	{
		// End:0x53
		if(Emitter(Trail) != none)
		{
			Emitter(Trail).Emitters[0].Disabled = true;
			Emitter(Trail).Kill();			
		}
		else
		{
			Trail.Destroy();
		}
	}
	//return;	
}

simulated state NetTrapped
{
	function BeginState()
	{
		HideProjectile();
		SetTimer(NetTrappedDelay, false);
		DestroyEffects();
		//return;		
	}
	stop;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.RSNovaStaff'
	ImpactManager=Class'BallisticProV55.IM_RSNovaProjectile'
	PenetrateManager=Class'BallisticProV55.IM_RSNovaProjectile'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.RSNova2Trail'
	bRandomStartRotation=false
	MyRadiusDamageType=Class'BallisticProV55.DT_RSNovaFast'
	bUsePositionalDamage=true
	AccelSpeed=100000.0000000
	MaxDamageGainFactor=0.6000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2500000
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	bSwitchToZeroCollision=true
	Damage=25.0000000
	DamageRadius=48.0000000
	MomentumTransfer=10000.0000000
	MyDamageType=Class'BallisticProV55.DT_RSNovaFast'
	LightType=1
	LightEffect=21
	LightHue=160
	LightSaturation=120
	LightBrightness=192.0000000
	LightRadius=6.0000000
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.NovaStaff.NovaProjectile2'
	bDynamicLight=true
	bNetTemporary=false
	bSkipActorPropertyReplication=true
	bOnlyDirtyReplication=true
	AmbientSound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire2FlyBy'
	LifeSpan=4.0000000
	Style=6
	SoundVolume=255
	SoundRadius=75.0000000
	CollisionRadius=1.0000000
	CollisionHeight=1.0000000
	bProjTarget=true
	bNetNotify=true
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=16384)
}
