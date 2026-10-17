class AY90BoltProjectileFast extends BallisticProjectile;

var Vector StartLocation;
var bool bScaleDone;

simulated function PreBeginPlay()
{
	local BallisticWeapon BW;

	super(Actor).PreBeginPlay();
	// End:0x13
	if(Instigator == none)
	{
		return;
	}
	BW = BallisticWeapon(Instigator.Weapon);
	// End:0x39
	if(BW == none)
	{
		return;
	}
	BW.default.ParamsClasses[int(BW.GameStyleIndex)].static.OverrideProjectileParams(self, 1);
	//return;	
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	StartLocation = Location;
	//return;	
}

simulated function DoDamage(Actor Other, Vector HitLocation)
{
	local DestroyableObjective HealObjective;
	local Vehicle HealVehicle;
	local int AdjustedDamage;

	// End:0x45
	if(Instigator != none)
	{
		AdjustedDamage = int(default.Damage * Instigator.DamageScaling);
		// End:0x45
		if(Instigator.HasUDamage())
		{
			AdjustedDamage *= float(2);
		}
	}
	HealObjective = DestroyableObjective(Other);
	// End:0x79
	if(HealObjective == none)
	{
		HealObjective = DestroyableObjective(Other.Owner);
	}
	// End:0xC7
	if((HealObjective != none) && HealObjective.TeamLink(Instigator.GetTeamNum()))
	{
		HealObjective.HealDamage(AdjustedDamage, InstigatorController, MyDamageType);
		return;
	}
	HealVehicle = Vehicle(Other);
	// End:0x125
	if((HealVehicle != none) && HealVehicle.TeamLink(Instigator.GetTeamNum()))
	{
		HealVehicle.HealDamage(AdjustedDamage, InstigatorController, MyDamageType);
		return;
	}
	super.DoDamage(Other, HitLocation);
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x60
	if((((Other == none) || !bCanHitOwner && (Other == Instigator) || Other == Owner) || RSDarkProjectile(Other) != none) || RSDarkFastProjectile(Other) != none)
	{
		return;
	}
	// End:0x91
	if((int(Role) == int(ROLE_Authority)) && Other != HitActor)
	{
		DoDamage(Other, HitLocation);
	}
	// End:0xFB
	if((Pawn(Other) != none) && Pawn(Other).Health <= 0)
	{
		PenetrateManager.static.StartSpawn(HitLocation, Other.Location - HitLocation, 2, Level.GetLocalPlayerController(), 4);		
	}
	else
	{
		PenetrateManager.static.StartSpawn(HitLocation, Other.Location - HitLocation, 1, Level.GetLocalPlayerController(), 4);
	}
	ImpactManager = none;
	HitActor = Other;
	Explode(HitLocation, vect(0.0000000, 0.0000000, 1.0000000));
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
	// End:0xBE
	if((HealVehicle != none) && HealVehicle.TeamLink(Instigator.GetTeamNum()))
	{
		AdjustedDamage = int(Damage * Instigator.DamageScaling);
		// End:0x78
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
	WeaponClass=Class'BWBP_SKC_Pro.AY90SkrithBoltcaster'
	ImpactManager=Class'BWBP_SKC_Pro.IM_A49Lob'
	PenetrateManager=Class'BallisticProV55.IM_A73Lob'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.A73TrailEmitter'
	bRandomStartRotation=false
	bPenetrate=true
	DamageTypeHead=Class'BWBP_SKC_Pro.DTAY90SkrithHead'
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DTAY90SkrithRadius'
	bUsePositionalDamage=true
	AccelSpeed=90000.0000000
	HeadMult=1.5000000
	LimbMult=0.5000000
	Speed=50.0000000
	MaxSpeed=8000.0000000
	Damage=75.0000000
	DamageRadius=265.0000000
	MomentumTransfer=65000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DTAY90Skrith'
	LightType=1
	LightEffect=21
	LightHue=150
	LightBrightness=192.0000000
	LightRadius=9.0000000
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.A73.A73Projectile'
	bDynamicLight=true
	AmbientSound=Sound'BW_Core_WeaponSound.A73.A73ProjFly'
	LifeSpan=6.0000000
	DrawScale3D=(X=0.5000000,Y=3.0000000,Z=3.0000000)
	Skins[0]=FinalBlend'BWBP_SKC_Tex.SkrithBow.AY90Projectile2-Final'
	Skins[1]=FinalBlend'BWBP_SKC_Tex.SkrithBow.AY90ProjectileFast1-Final'
	Style=6
	SoundVolume=255
	SoundRadius=75.0000000
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=12384)
}
