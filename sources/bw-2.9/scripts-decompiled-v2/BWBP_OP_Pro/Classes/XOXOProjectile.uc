class XOXOProjectile extends BallisticProjectile;

simulated function PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	// End:0x1D
	if(FRand() > 0.5000000)
	{
		SetStaticMesh(StaticMesh'BWBP_OP_Static.XOXO.X');
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
	local Vector ClosestLocation, BoneTestLocation, Temp;

	// End:0x8A
	if(((Instigator != none) && Instigator.Weapon != none) && Instigator.Weapon.IsA('RSDarkStar'))
	{
		AdjustedDamage = int((default.Damage * Instigator.DamageScaling) * MyDamageType.default.VehicleDamageScaling);
		// End:0x8A
		if(Instigator.HasUDamage())
		{
			AdjustedDamage *= float(2);
		}
	}
	HealObjective = DestroyableObjective(Other);
	// End:0xBE
	if(HealObjective == none)
	{
		HealObjective = DestroyableObjective(Other.Owner);
	}
	// End:0x10C
	if((HealObjective != none) && HealObjective.TeamLink(Instigator.GetTeamNum()))
	{
		HealObjective.HealDamage(AdjustedDamage, InstigatorController, MyDamageType);
		return;
	}
	HealVehicle = Vehicle(Other);
	// End:0x16A
	if((HealVehicle != none) && HealVehicle.TeamLink(Instigator.GetTeamNum()))
	{
		HealVehicle.HealDamage(AdjustedDamage, InstigatorController, MyDamageType);
		return;
	}
	// End:0x19F
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	// End:0x26A
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
	// End:0x2F6
	if((xPawn(Victim) != none) && Pawn(Victim).Health > 0)
	{
		// End:0x2F3
		if((Monster(Victim) == none) || Pawn(Victim).default.Health > 275)
		{
			bWasAlive = true;
		}		
	}
	else
	{
		// End:0x34D
		if(((Vehicle(Victim) != none) && Vehicle(Victim).Driver != none) && Vehicle(Victim).Driver.Health > 0)
		{
			bWasAlive = true;
		}
	}
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, Dmg, Instigator, HitLocation, MomentumTransfer * Normal(Velocity), dt);
	// End:0x3CB
	if(bWasAlive && Pawn(Victim).Health <= 0)
	{
		Class'BWBP_OP_Pro.XOXOLewdness'.static.DistributeLewd(HitLocation, Instigator, Pawn(Victim), self);
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

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local int Surf;

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
	// End:0xCC
	if((ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x76
		if(bCheckHitSurface)
		{
			CheckSurface(HitLocation, HitNormal, Surf);
		}
		// End:0xAD
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 1, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 1, Instigator);
		}
	}
	BlowUp(HitLocation);
	bExploded = true;
	// End:0x161
	if((!bNetTemporary && bTearOnExplode) && (int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		Velocity = vect(0.0000000, 0.0000000, 0.0000000);
		SetCollision(false, false, false);
		TearOffHitNormal = HitNormal;
		bTearOff = true;
		GotoState('NetTrapped');		
	}
	else
	{
		Destroy();
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_OP_Pro.XOXOStaff'
	ImpactManager=Class'BWBP_OP_Pro.IM_XOXO'
	PenetrateManager=Class'BWBP_OP_Pro.IM_XOXO'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_OP_Pro.XOXOShotTrail'
	bRandomStartRotation=false
	MyRadiusDamageType=Class'BWBP_OP_Pro.DTXOXOFast'
	bUsePositionalDamage=true
	AccelSpeed=100000.0000000
	MaxDamageGainFactor=0.6000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2500000
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	bSwitchToZeroCollision=true
	Damage=38.0000000
	DamageRadius=48.0000000
	MomentumTransfer=-1000.0000000
	MyDamageType=Class'BWBP_OP_Pro.DTXOXOFast'
	LightType=1
	LightEffect=21
	LightHue=220
	LightSaturation=120
	LightBrightness=192.0000000
	LightRadius=6.0000000
	StaticMesh=StaticMesh'BWBP_OP_Static.XOXO.O'
	bDynamicLight=true
	AmbientSound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire2FlyBy'
	LifeSpan=4.0000000
	DrawScale=1.5000000
	Style=6
	SoundVolume=255
	SoundRadius=75.0000000
	CollisionRadius=1.0000000
	CollisionHeight=1.0000000
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=16384)
}
