class RSNovaProjectile extends BallisticProjectile;

var bool bScaleDone;
var float ScaleTime;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	ScaleTime = Level.TimeSeconds + 0.8000000;
	//return;	
}

simulated function Tick(float dt)
{
	local Vector DS;

	DS = default.DrawScale3D;
	DS.X = (ScaleTime - Level.TimeSeconds) / 0.6000000;
	// End:0x5B
	if(DS.X >= float(1))
	{
		DS.X = 1.0000000;
		Disable('Tick');
	}
	SetDrawScale3D(DS);
	//return;	
}

simulated function Actor GetDamageVictim(Actor Other, Vector HitLocation, Vector Dir, out float Dmg, optional out Class<DamageType> dt)
{
	super.GetDamageVictim(Other, HitLocation, Dir, Dmg, dt);
	Dmg *= (float(1) + (0.5000000 * (FMin(default.LifeSpan - LifeSpan, 0.6000000) / 0.6000000)));
	return Other;
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
	// End:0x3E3
	if((((((BallisticPawn(Instigator) != none) && RSNovaStaff(Instigator.Weapon) != none) && Victim != Instigator) && Victim.bProjTarget) && xPawn(Victim) != none) && (Pawn(Victim).GetTeamNum() != Instigator.GetTeamNum()) || Instigator.GetTeamNum() == 255)
	{
		BallisticPawn(Instigator).GiveAttributedShield(int(Dmg * 0.6000000), Instigator);
	}
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, Dmg, Instigator, HitLocation, GetMomentumVector(Normal(Velocity)), dt);
	// End:0x460
	if(bWasAlive && Pawn(Victim).Health <= 0)
	{
		Class'BallisticProV55.RSNovaSoul'.static.SpawnSoul(HitLocation, Instigator, Pawn(Other), self);
	}
	//return;	
}

simulated function DoVehicleDriverRadius(Vehicle Other)
{
	local bool bWasAlive;
	local Pawn D;

	// End:0x4F
	if((Other.Driver != none) && Other.Driver.Health > 0)
	{
		D = Other.Driver;
		bWasAlive = true;
	}
	Other.DriverRadiusDamage(Damage, DamageRadius, InstigatorController, MyDamageType, MomentumTransfer, Location);
	// End:0xC7
	if(bWasAlive && (D == none) || D.Health <= 0)
	{
		Class'BallisticProV55.RSNovaSoul'.static.SpawnSoul(Location, Instigator, D, self);
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
		// End:0x20C
		if(int(Role) == int(ROLE_Authority))
		{
			// End:0x204
			if((!Wall.bStatic && !Wall.bWorldGeometry) && (Pawn(Wall) == none) || Vehicle(Wall) != none)
			{
				// End:0x19F
				if((Instigator == none) || Instigator.Controller == none)
				{
					Wall.SetDelayedDamageInstigatorController(InstigatorController);
				}
				DoDamage(Wall, Location);
				// End:0x1F9
				if(((DamageRadius > float(0)) && Vehicle(Wall) != none) && Vehicle(Wall).Health > 0)
				{
					DoVehicleDriverRadius(Vehicle(Wall));
				}
				HurtWall = Wall;
			}
			MakeNoise(1.0000000);
		}
	}
	Explode(Location + (ExploWallOut * HitNormal), HitNormal);
	HurtWall = none;
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x12
	if(!CanTouch(Other))
	{
		return;
	}
	// End:0x36
	if((RSNovaProjectile(Other) != none) || RSNovaFastProjectile(Other) != none)
	{
		return;
	}
	// End:0x67
	if((int(Role) == int(ROLE_Authority)) && Other != HitActor)
	{
		DoDamage(Other, HitLocation);
	}
	// End:0xD1
	if((Pawn(Other) != none) && Pawn(Other).Health <= 0)
	{
		PenetrateManager.static.StartSpawn(HitLocation, Other.Location - HitLocation, 2, Level.GetLocalPlayerController(), 4);		
	}
	else
	{
		PenetrateManager.static.StartSpawn(HitLocation, Other.Location - HitLocation, 1, Level.GetLocalPlayerController(), 4);
	}
	ImpactManager = none;
	// End:0x146
	if(int(Role) == int(ROLE_Authority))
	{
		HitActor = Other;
		Explode(HitLocation, vect(0.0000000, 0.0000000, 1.0000000));
	}
	//return;	
}

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	local RSDeathBall DB;

	// End:0x51
	if((DamageType == Class'BallisticProV55.DT_RSDarkSlow') || DamageType == Class'BallisticProV55.DT_RSDarkFast')
	{
		ImpactManager.static.StartSpawn(HitLocation, Normal(Momentum), 5, Level.GetLocalPlayerController(), 4);		
	}
	else
	{
		// End:0xAC
		if(DamageType == Class'BallisticProV55.DT_RSDarkPlasma')
		{
			DB = Spawn(Class'BallisticProV55.RSDeathBall', EventInstigator,, Location, Rotator(Velocity));
			DB.Instigator = EventInstigator;
			DB.SetTarget(Instigator, true);
			Destroy();
		}
	}
	//return;	
}

simulated function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Excluded)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;
	local bool bWasAlive;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x37E
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x37D
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && (Excluded == none) || Victims != Excluded) && Victims != HurtWall)
		{
			// End:0xD0
			if((xPawn(Victims) != none) && Pawn(Victims).Health > 0)
			{
				bWasAlive = true;				
			}
			else
			{
				// End:0x12A
				if(((Vehicle(Victims) != none) && Vehicle(Victims).Driver != none) && Vehicle(Victims).Driver.Health > 0)
				{
					bWasAlive = true;					
				}
				else
				{
					bWasAlive = false;
				}
			}
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x1D8
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, Square(damageScale) * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), GetMomentumVector(damageScale * Dir), DamageType);
			// End:0x335
			if((((((BallisticPawn(Instigator) != none) && RSNovaStaff(Instigator.Weapon) != none) && Victims != Instigator) && Victims.bProjTarget) && xPawn(Victims) != none) && (Pawn(Victims).GetTeamNum() != Instigator.GetTeamNum()) || Instigator.GetTeamNum() == 255)
			{
				BallisticPawn(Instigator).GiveAttributedHealth(int((damageScale * DamageAmount) * 0.6000000), int(Instigator.SuperHealthMax), Instigator, true);
			}
			// End:0x37D
			if(bWasAlive && Pawn(Victims).Health <= 0)
			{
				Class'BallisticProV55.RSNovaSoul'.static.SpawnSoul(HitLocation, Instigator, Pawn(Victims), self);
			}
		}		
	}	
	bHurtEntry = false;
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
	TrailClass=Class'BallisticProV55.RSNova1Trail'
	bRandomStartRotation=false
	bTearOnExplode=false
	DamageTypeHead=Class'BallisticProV55.DT_RSNovaSlow'
	MyRadiusDamageType=Class'BallisticProV55.DT_RSNovaSlow'
	ShakeRadius=384.0000000
	ShakeRotMag=(X=256.0000000,Y=200.0000000,Z=128.0000000)
	ShakeRotRate=(X=3000.0000000,Y=2500.0000000,Z=3000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=10.0000000,Y=15.0000000,Z=15.0000000)
	ShakeOffsetTime=2.0000000
	AccelSpeed=100000.0000000
	Speed=6000.0000000
	MaxSpeed=10000.0000000
	bSwitchToZeroCollision=true
	Damage=60.0000000
	DamageRadius=128.0000000
	MomentumTransfer=70000.0000000
	MyDamageType=Class'BallisticProV55.DT_RSNovaSlow'
	LightType=1
	LightEffect=21
	LightHue=160
	LightSaturation=90
	LightBrightness=192.0000000
	LightRadius=10.0000000
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.NovaStaff.NovaProjectile'
	bDynamicLight=true
	bNetTemporary=false
	bSkipActorPropertyReplication=true
	bOnlyDirtyReplication=true
	AmbientSound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire1FlyBy'
	LifeSpan=4.0000000
	Style=6
	SoundVolume=255
	SoundRadius=75.0000000
	CollisionRadius=1.0000000
	CollisionHeight=1.0000000
	bProjTarget=true
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=16384)
}
