class SHADRACHRifleGrenade extends BallisticGrenade;

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	// End:0x18
	if(ShakeRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	BlowUp(HitLocation);
	// End:0x84
	if(ImpactManager != none)
	{
		// End:0x65
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Instigator);
		}
	}
	Destroy();
	//return;	
}

function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;
	local bool can_see;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x60
	if(((Pawn(Victim) != none) && Pawn(Victim).Health > 0) && Vehicle(Victim) == none)
	{
		ApplyPlague(Victim, 1.0000000);
	}
	// End:0x3DD
	foreach CollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x3DC
		if(((((Victims.bCanBeDamaged && Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim) && Victims != HurtWall)
		{
			can_see = FastTrace(Victims.Location, Location);
			// End:0x12A
			if(!can_see)
			{
				// End:0x127
				if(WallPenetrationForce == float(0))
				{
					continue;					
				}				
			}
			else
			{
				// End:0x161
				if(PhysicsVolume.bWaterVolume && Victims.PhysicsVolume == PhysicsVolume)
				{
					DamageRadius *= float(3);
				}
			}
			damageScale = 1.0000000;
			Dir = Victims.Location;
			// End:0x1D6
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
			Dir /= dist;
			// End:0x29C
			if(can_see)
			{
				// End:0x27C
				if(int(RadiusFallOffType) != int(2))
				{
					damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
				}
				// End:0x299
				if(int(RadiusFallOffType) == int(1))
				{
					damageScale = Square(damageScale);
				}				
			}
			else
			{
				damageScale = GetPenetrationDamageScale(Dir, dist);
				// End:0x2C5
				if(damageScale < 0.0100000)
				{
					continue;					
				}
				// End:0x2E2
				if(int(RadiusFallOffType) == int(1))
				{
					damageScale = Square(damageScale);
				}
			}
			// End:0x317
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), GetMomentumVector(damageScale * Dir), DamageType);
			// End:0x3DC
			if(((Pawn(Victims) != none) && Pawn(Victims).Health > 0) && Vehicle(Victims) == none)
			{
				ApplyPlague(Victims, damageScale);
			}
		}		
	}	
	bHurtEntry = false;
	//return;	
}

function bool AllowPlague(Actor Other)
{
	return ((((Pawn(Other) != none) && Pawn(Other).Health > 0) && Vehicle(Other) == none) && (Pawn(Other).GetTeamNum() == 255) || Pawn(Other).GetTeamNum() != Instigator.GetTeamNum()) && (Level.TimeSeconds - Pawn(Other).SpawnTime) > DeathMatch(Level.Game).SpawnProtectionTime;
	//return;	
}

function ApplyPlague(Actor Other, float damageScale)
{
	local SHADRACHPlagueEffect SPE;

	// End:0x35
	foreach Other.BasedActors(Class'BWBP_APC_Pro.SHADRACHPlagueEffect', SPE)
	{
		SPE.ExtendDuration(8.0000000 * damageScale);		
	}	
	// End:0xD5
	if(SPE == none)
	{
		SPE = Spawn(Class'BWBP_APC_Pro.SHADRACHPlagueEffect', Other,, Other.Location);
		SPE.Initialize(Other);
		SPE.Duration = FMax(1.0000000, 8.0000000 * damageScale);
		// End:0xD5
		if(Instigator != none)
		{
			SPE.Instigator = Instigator;
			SPE.InstigatorController = Instigator.Controller;
		}
	}
	//return;	
}

function DoDamage(Actor Other, Vector HitLocation)
{
	local SHADRACHPlagueEffect SPE;

	super(BallisticProjectile).DoDamage(Other, HitLocation);
	// End:0xCA
	if(AllowPlague(Other))
	{
		// End:0x4C
		foreach Other.BasedActors(Class'BWBP_APC_Pro.SHADRACHPlagueEffect', SPE)
		{
			SPE.ExtendDuration(4.0000000);			
		}		
		// End:0xCA
		if(SPE == none)
		{
			SPE = Spawn(Class'BWBP_APC_Pro.SHADRACHPlagueEffect', Other,, Other.Location);
			SPE.Initialize(Other);
			// End:0xCA
			if(Instigator != none)
			{
				SPE.Instigator = Instigator;
				SPE.InstigatorController = Instigator.Controller;
			}
		}
	}
	//return;	
}

defaultproperties
{
	ArmedDetonateOn=1
	DetonateOn=1
	bNoInitialSpin=true
	bAlignToVelocity=true
	DetonateDelay=1.0000000
	ImpactDamage=90
	ImpactDamageType=Class'BWBP_APC_Pro.DT_RadGrenadeDirect'
	WeaponClass=Class'BWBP_APC_Pro.SRKSubMachinegun'
	ImpactManager=Class'BWBP_APC_Pro.IM_SHADRACHChaffGrenade'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_APC_Pro.SRKSmgTrail'
	TrailOffset=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_APC_Pro.DT_SHADRACHGrenadeRadius'
	ShakeRadius=512.0000000
	MotionBlurRadius=768.0000000
	MotionBlurFactor=2.0000000
	MotionBlurTime=10.0000000
	Speed=3750.0000000
	MaxSpeed=4500.0000000
	Damage=65.0000000
	DamageRadius=320.0000000
	MyDamageType=Class'BWBP_APC_Pro.DT_SHADRACHGrenadeRadius'
	StaticMesh=StaticMesh'BWBP_APC_Static.SPXSmg.SHADRACH_Proj'
	DrawScale=0.2000000
	bUnlit=false
}
