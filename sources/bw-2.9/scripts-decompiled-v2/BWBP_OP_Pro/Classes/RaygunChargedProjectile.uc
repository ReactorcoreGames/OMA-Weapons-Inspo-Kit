class RaygunChargedProjectile extends BallisticProjectile;

simulated function Actor GetDamageVictim(Actor Other, Vector HitLocation, Vector Dir, out float Dmg, optional out Class<DamageType> dt)
{
	super.GetDamageVictim(Other, HitLocation, Dir, Dmg, dt);
	Dmg *= (float(1) + ((0.5000000 * FMin(default.LifeSpan - LifeSpan, 0.6000000)) / 0.6000000));
	return Other;
	//return;	
}

function BlowUp(Vector HitLocation)
{
	// End:0x12
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x66
	if(DamageRadius > float(0))
	{
		TargetedHurtRadius(Damage * (0.5000000 + (0.5000000 * FMin(default.LifeSpan - LifeSpan, 1.0000000))), DamageRadius, MyRadiusDamageType, MomentumTransfer, HitLocation, HitActor);
	}
	MakeNoise(1.0000000);
	//return;	
}

simulated function Tick(float DeltaTime)
{
	super(Actor).Tick(DeltaTime);
	SetRotation(Rotation + (rot(0, 0, 250000) * DeltaTime));
	//return;	
}

function bool AllowPlague(Actor Other)
{
	return ((((Pawn(Other) != none) && Pawn(Other).Health > 0) && Vehicle(Other) == none) && (Pawn(Other).GetTeamNum() == 255) || Pawn(Other).GetTeamNum() != Instigator.GetTeamNum()) && (Level.TimeSeconds - Pawn(Other).SpawnTime) > DeathMatch(Level.Game).SpawnProtectionTime;
	//return;	
}

function DoDamage(Actor Other, Vector HitLocation)
{
	local RaygunPlagueEffect RPE;

	super.DoDamage(Other, HitLocation);
	// End:0xCA
	if(AllowPlague(Other))
	{
		// End:0x4C
		foreach Other.BasedActors(Class'BWBP_OP_Pro.RaygunPlagueEffect', RPE)
		{
			RPE.ExtendDuration(4.0000000);			
		}		
		// End:0xCA
		if(RPE == none)
		{
			RPE = Spawn(Class'BWBP_OP_Pro.RaygunPlagueEffect', Other,, Other.Location);
			RPE.Initialize(Other);
			// End:0xCA
			if(Instigator != none)
			{
				RPE.Instigator = Instigator;
				RPE.InstigatorController = Instigator.Controller;
			}
		}
	}
	//return;	
}

function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;
	local RaygunPlagueEffect RPE;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x36
	if(Victim == none)
	{
		DamageAmount *= 0.5000000;
		DamageRadius *= 0.7500000;
	}
	// End:0x3DE
	foreach CollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x3DD
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim) && Victims != HurtWall)
		{
			// End:0xCF
			if(!FastTrace(Victims.Location, Location))
			{
				continue;				
			}
			Dir = Victims.Location;
			// End:0x139
			if(Victims.Location.Z > HitLocation.Z)
			{
				Dir.Z = FMax(HitLocation.Z, Dir.Z - Victims.CollisionHeight);				
			}
			else
			{
				Dir.Z = FMin(HitLocation.Z, Dir.Z + Victims.CollisionHeight);
			}
			Dir -= HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x201
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, Square(damageScale) * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), ((damageScale * Momentum) * 0.8000000) * Dir, DamageType);
			// End:0x3DD
			if(((Pawn(Victims) != none) && Pawn(Victims).Health > 0) && Vehicle(Victims) == none)
			{
				// End:0x319
				foreach Victims.BasedActors(Class'BWBP_OP_Pro.RaygunPlagueEffect', RPE)
				{
					// End:0x2FB
					if(Victim != none)
					{
						RPE.ExtendDuration(8.0000000);
						// End:0x318
						continue;
					}
					RPE.ExtendDuration(4.0000000 * Square(damageScale));					
				}				
				// End:0x3DD
				if(RPE == none)
				{
					RPE = Spawn(Class'BWBP_OP_Pro.RaygunPlagueEffect', Victims,, Victims.Location);
					RPE.Initialize(Victims);
					// End:0x38D
					if(Victim == none)
					{
						RPE.Duration = FMax(1.0000000, 4.0000000 * Square(damageScale));						
					}
					else
					{
						RPE.Duration = 8.0000000;
					}
					// End:0x3DD
					if(Instigator != none)
					{
						RPE.Instigator = Instigator;
						RPE.InstigatorController = Instigator.Controller;
					}
				}
			}
		}		
	}	
	bHurtEntry = false;
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_OP_Pro.Raygun'
	ImpactManager=Class'BWBP_OP_Pro.IM_Raygun'
	TrailClass=Class'BWBP_OP_Pro.RaygunChargedShotTrail'
	ModeIndex=1
	DamageTypeHead=Class'BWBP_OP_Pro.DTRaygunCharged'
	MyRadiusDamageType=Class'BWBP_OP_Pro.DTRaygunChargedRadius'
	ShakeRadius=300.0000000
	MotionBlurRadius=250.0000000
	MotionBlurFactor=2.0000000
	MotionBlurTime=2.0000000
	AccelSpeed=11000.0000000
	Speed=5500.0000000
	MaxSpeed=17500.0000000
	Damage=50.0000000
	DamageRadius=256.0000000
	MomentumTransfer=120000.0000000
	MyDamageType=Class'BWBP_OP_Pro.DTRaygunCharged'
	ExploWallOut=24.0000000
	LightType=1
	LightHue=30
	LightSaturation=24
	LightBrightness=64.0000000
	LightRadius=192.0000000
	bDynamicLight=true
	LifeSpan=9.0000000
	Style=6
	SoundVolume=255
	SoundRadius=128.0000000
	CollisionRadius=2.0000000
	CollisionHeight=2.0000000
}
