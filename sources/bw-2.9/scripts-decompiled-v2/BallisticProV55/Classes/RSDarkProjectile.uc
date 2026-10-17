class RSDarkProjectile extends BallisticProjectile;

var bool bScaleDone;
var float ScaleTime;
var float PullForceMag;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	ScaleTime = Level.TimeSeconds + 0.6000000;
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
	Dmg *= (float(1) + (0.6000000 * (FMin(default.LifeSpan - LifeSpan, 1.0000000) / float(1))));
	DamageRadius *= (float(1) + (0.6000000 * (FMin(default.LifeSpan - LifeSpan, 1.0000000) / float(1))));
	return Other;
	//return;	
}

simulated function InitEffects()
{
	local Vector X, Y, Z;

	bDynamicLight = default.bDynamicLight;
	// End:0xF5
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && TrailClass != none) && Trail == none)
	{
		GetAxes(Rotation, X, Y, Z);
		Trail = Spawn(TrailClass, self,, ((Location + (X * TrailOffset.X)) + (Y * TrailOffset.Y)) + (Z * TrailOffset.Z), Rotation);
		// End:0xDD
		if(Emitter(Trail) != none)
		{
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(Trail), DrawScale / float(2));
		}
		// End:0xF5
		if(Trail != none)
		{
			Trail.SetBase(self);
		}
	}
	//return;	
}

simulated function DoDamage(Actor Other, Vector HitLocation)
{
	local Class<DamageType> dt;
	local float Dmg;
	local Actor Victim;
	local DestroyableObjective HealObjective;
	local Vehicle HealVehicle;
	local int AdjustedDamage, i;
	local Vector ClosestLocation, Temp, BoneTestLocation;
	local RSDarkPlasmaBurner PB;
	local Vector MomentumDir;

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
	// End:0x337
	if((((((BallisticPawn(Instigator) != none) && RSNovaStaff(Instigator.Weapon) != none) && Victim != Instigator) && Victim.bProjTarget) && xPawn(Victim) != none) && (Pawn(Victim).GetTeamNum() != Instigator.GetTeamNum()) || Instigator.GetTeamNum() == 255)
	{
		BallisticPawn(Instigator).GiveAttributedHealth(int(Dmg * 0.2000000), int(Instigator.SuperHealthMax), Instigator);
	}
	// End:0x45A
	if(Pawn(Other) != none)
	{
		i = 0;
		J0x34E:

		// End:0x3BB [Loop If]
		if(i < Other.Attached.Length)
		{
			// End:0x3B1
			if(RSDarkPlasmaBurner(Other.Attached[i]) != none)
			{
				RSDarkPlasmaBurner(Other.Attached[i]).AddPower(2.0000000);
				// [Explicit Break]
				goto J0x3BB;
			}
			i++;
			// [Loop Continue]
			goto J0x34E;
		}
		J0x3BB:

		// End:0x45A
		if(i >= Other.Attached.Length)
		{
			PB = Spawn(Class'BallisticProV55.RSDarkPlasmaBurner', Other,, Other.Location);
			PB.Initialize(Other);
			PB.AddPower(8.0000000);
			// End:0x45A
			if(Instigator != none)
			{
				PB.Instigator = Instigator;
				PB.InstigatorController = Instigator.Controller;
			}
		}
	}
	// End:0x4D3
	if(VSize(Instigator.Location - Other.Location) > float(1024))
	{
		MomentumDir = vect(0.0000000, 0.0000000, 15000.0000000) + (((default.LifeSpan - LifeSpan) * PullForceMag) * Normal(Instigator.Location - Other.Location));		
	}
	else
	{
		MomentumDir = vect(0.0000000, 0.0000000, 1000.0000000) + (float(10000) * Normal(Other.Location - Instigator.Location));
	}
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, Dmg, Instigator, HitLocation, MomentumDir, dt);
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
		Class'BallisticProV55.RSDarkSoul'.static.SpawnSoul(Location, Instigator, D, self);
	}
	//return;	
}

singular simulated function HitWall(Vector HitNormal, Actor Wall)
{
	local Vehicle HealVehicle;
	local int AdjustedDamage;

	HealVehicle = Vehicle(Wall);
	// End:0xAF
	if((HealVehicle != none) && HealVehicle.TeamLink(Instigator.GetTeamNum()))
	{
		AdjustedDamage = int((default.Damage * Instigator.DamageScaling) * MyDamageType.default.VehicleDamageScaling);
		// End:0x88
		if(Instigator.HasUDamage())
		{
			AdjustedDamage *= float(2);
		}
		HealVehicle.HealDamage(AdjustedDamage, Instigator.Controller, MyDamageType);
	}
	// End:0xC1
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x185
	if(!Wall.bStatic && !Wall.bWorldGeometry)
	{
		// End:0x120
		if((Instigator == none) || Instigator.Controller == none)
		{
			Wall.SetDelayedDamageInstigatorController(InstigatorController);
		}
		DoDamage(Wall, Location);
		// End:0x17A
		if(((DamageRadius > float(0)) && Vehicle(Wall) != none) && Vehicle(Wall).Health > 0)
		{
			DoVehicleDriverRadius(Vehicle(Wall));
		}
		HurtWall = Wall;
	}
	MakeNoise(1.0000000);
	Damage *= 0.7500000;
	DamageRadius *= 0.5000000;
	Explode(Location + (ExploWallOut * HitNormal), HitNormal);
	HurtWall = none;
	//return;	
}

simulated function bool CanTouch(Actor Other)
{
	// End:0x24
	if((RSDarkProjectile(Other) != none) || RSDarkFastProjectile(Other) != none)
	{
		return false;
	}
	return super.CanTouch(Other);
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x12
	if(!CanTouch(Other))
	{
		return;
	}
	// End:0x43
	if((int(Role) == int(ROLE_Authority)) && Other != HitActor)
	{
		DoDamage(Other, HitLocation);
	}
	// End:0xAD
	if((Pawn(Other) != none) && Pawn(Other).Health <= 0)
	{
		PenetrateManager.static.StartSpawn(HitLocation, Other.Location - HitLocation, 2, Level.GetLocalPlayerController(), 4);		
	}
	else
	{
		PenetrateManager.static.StartSpawn(HitLocation, Other.Location - HitLocation, 1, Level.GetLocalPlayerController(), 4);
	}
	ImpactManager = none;
	// End:0x122
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

	// End:0x40
	if(DamageType == Class'BallisticProV55.DT_RSNovaSlow')
	{
		ImpactManager.static.StartSpawn(HitLocation, Normal(Momentum), 5, Level.GetLocalPlayerController(), 4);		
	}
	else
	{
		// End:0xB8
		if(DamageType == Class'BallisticProV55.DT_RSNovaLightning')
		{
			DB = Spawn(Class'BallisticProV55.RSDeathBall', EventInstigator,, Location, Rotator(Velocity));
			DB.Instigator = EventInstigator;
			DB.InstigatorController = EventInstigator.Controller;
			DB.SetTarget(Instigator, false);
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
	// End:0x28F
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x28E
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Excluded) && Victims != HurtWall)
		{
			// End:0xC3
			if((xPawn(Victims) != none) && Pawn(Victims).Health > 0)
			{
				bWasAlive = true;				
			}
			else
			{
				// End:0x11D
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
			// End:0x1CB
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, Square(damageScale) * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
			// End:0x28E
			if(bWasAlive && Pawn(Victims).Health <= 0)
			{
				Class'BallisticProV55.RSDarkSoul'.static.SpawnSoul(HitLocation, Instigator, Pawn(Victims), self);
			}
		}		
	}	
	bHurtEntry = false;
	//return;	
}

simulated function DestroyEffects()
{
	// End:0xC4
	if(Trail != none)
	{
		// End:0xB8
		if(Emitter(Trail) != none)
		{
			Emitter(Trail).Kill();
			Emitter(Trail).Emitters[0].Disabled = true;
			Emitter(Trail).Emitters[1].Disabled = true;
			Emitter(Trail).Emitters[2].Disabled = true;
			Emitter(Trail).Emitters[3].Disabled = true;			
		}
		else
		{
			Trail.Destroy();
		}
	}
	//return;	
}

state NetTrapped
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
	PullForceMag=800000.0000000
	WeaponClass=Class'BallisticProV55.RSDarkStar'
	ImpactManager=Class'BallisticProV55.IM_RSDarkProjectile'
	PenetrateManager=Class'BallisticProV55.IM_RSDarkProjectile'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.RSDark1Trail'
	bRandomStartRotation=false
	DamageTypeHead=Class'BallisticProV55.DT_RSDarkSlow'
	MyRadiusDamageType=Class'BallisticProV55.DT_RSDarkSlow'
	ShakeRadius=384.0000000
	ShakeRotMag=(X=256.0000000,Y=200.0000000,Z=128.0000000)
	ShakeRotRate=(X=3000.0000000,Y=2500.0000000,Z=3000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=10.0000000,Y=15.0000000,Z=15.0000000)
	ShakeOffsetTime=2.0000000
	AccelSpeed=100000.0000000
	Speed=5000.0000000
	MaxSpeed=14000.0000000
	bSwitchToZeroCollision=true
	Damage=70.0000000
	DamageRadius=128.0000000
	MomentumTransfer=10000.0000000
	MyDamageType=Class'BallisticProV55.DT_RSDarkSlow'
	LightType=1
	LightEffect=21
	LightBrightness=160.0000000
	LightRadius=12.0000000
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.DarkStar.DarkProjBig'
	bDynamicLight=true
	bNetTemporary=false
	bSkipActorPropertyReplication=true
	bOnlyDirtyReplication=true
	AmbientSound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire1FlyBy'
	LifeSpan=4.0000000
	DrawScale=2.0000000
	DrawScale3D=(X=1.5000000,Y=1.0000000,Z=1.0000000)
	SoundVolume=255
	SoundRadius=75.0000000
	CollisionRadius=1.0000000
	CollisionHeight=1.0000000
	bProjTarget=true
	RotationRate=(Pitch=0,Yaw=0,Roll=16384)
}
