class A73Projectile extends BallisticProjectile;

var Vector StartLocation;
var bool bScaleDone;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	StartLocation = Location;
	//return;	
}

simulated function Tick(float dt)
{
	local Vector DS;

	// End:0x10
	if(bScaleDone)
	{
		Disable('Tick');
	}
	DS.X = VSize(Location - StartLocation) / (float(384) * DrawScale);
	DS.Y = 0.5000000;
	DS.Z = 0.5000000;
	// End:0x86
	if(DS.X >= float(1))
	{
		DS = vect(1.0000000, 0.5000000, 0.5000000);
		bScaleDone = true;
	}
	SetDrawScale3D(DS);
	//return;	
}

simulated function DoDamage(Actor Other, Vector HitLocation)
{
	local DestroyableObjective HealObjective;
	local Vehicle HealVehicle;
	local int AdjustedDamage;

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
	super.DoDamage(Other, HitLocation);
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local byte Flags;

	// End:0x0B
	if(bExploded)
	{
		return;
	}
	// End:0x88
	if((((HitActor != none) && ((Vehicle(HitActor) != none) || DestroyableObjective(HitActor) != none) || DestroyableObjective(HitActor.Owner) != none) && Instigator != none) && HitActor.TeamLink(Instigator.GetTeamNum()))
	{		
	}
	else
	{
		// End:0x160
		if((ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
		{
			// End:0x100
			if((HitActor != none) && ((Vehicle(HitActor) != none) || DestroyableObjective(HitActor) != none) || DestroyableObjective(HitActor.Owner) != none)
			{
				Flags = 4;
			}
			// End:0x13C
			if(Instigator == none)
			{
				ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Level.GetLocalPlayerController(), Flags);				
			}
			else
			{
				ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Instigator, Flags);
			}
		}
	}
	BlowUp(HitLocation);
	bExploded = true;
	Destroy();
	//return;	
}

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	local Vehicle HealVehicle;
	local int AdjustedDamage;

	HealVehicle = Vehicle(Wall);
	// End:0xCE
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
		Destroy();		
	}
	else
	{
		super.HitWall(HitNormal, Wall);
	}
	//return;	
}

simulated function InitEffects()
{
	local Vector X, Y, Z;

	bDynamicLight = default.bDynamicLight;
	// End:0x10A
	if((((int(Level.DetailMode) > int(0)) && int(Level.NetMode) != int(NM_DedicatedServer)) && TrailClass != none) && Trail == none)
	{
		GetAxes(Rotation, X, Y, Z);
		Trail = Spawn(TrailClass, self,, ((Location + (X * TrailOffset.X)) + (Y * TrailOffset.Y)) + (Z * TrailOffset.Z), Rotation);
		// End:0xF2
		if(Emitter(Trail) != none)
		{
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(Trail), DrawScale);
		}
		// End:0x10A
		if(Trail != none)
		{
			Trail.SetBase(self);
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

defaultproperties
{
	WeaponClass=Class'BallisticProV55.A73SkrithRifle'
	ImpactManager=Class'BallisticProV55.IM_A73Projectile'
	PenetrateManager=Class'BallisticProV55.IM_A73Projectile'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.A73TrailEmitter'
	bRandomStartRotation=false
	bPenetrate=true
	DamageTypeHead=Class'BallisticProV55.DTA73SkrithHead'
	MyRadiusDamageType=Class'BallisticProV55.DTA73Skrith'
	bUsePositionalDamage=true
	MyDamageType=Class'BallisticProV55.DTA73Skrith'
	LightType=1
	LightEffect=21
	LightHue=150
	LightBrightness=192.0000000
	LightRadius=6.0000000
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.A73.A73Projectile'
	bDynamicLight=true
	AmbientSound=Sound'BW_Core_WeaponSound.A73.A73ProjFly'
	LifeSpan=4.0000000
	Style=6
	SoundVolume=255
	SoundRadius=75.0000000
	CollisionRadius=1.0000000
	CollisionHeight=1.0000000
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=16384)
}
