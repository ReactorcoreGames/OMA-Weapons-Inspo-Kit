class M46StickyMine extends M46Mine;

var() Class<DamageType> StuckDamageType;
var() bool bNoFXOnExplode;

simulated function Destroyed()
{
	local int Surf;

	// End:0xD5
	if(bNoFXOnExplode && !bNoFX)
	{
		// End:0xD5
		if(((EffectIsRelevant(Location, false)) && ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
		{
			// End:0x6F
			if(bCheckHitSurface)
			{
				CheckSurface(Location, -Vector(Rotation), Surf);
			}
			// End:0xAE
			if(Instigator == none)
			{
				ImpactManager.static.StartSpawn(Location, -Vector(Rotation), Surf, Level.GetLocalPlayerController());				
			}
			else
			{
				ImpactManager.static.StartSpawn(Location, -Vector(Rotation), Surf, Instigator);
			}
		}
	}
	super(BallisticProjectile).Destroyed();
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
	// End:0xDF
	if(!bNoFXOnExplode)
	{
		// End:0xDF
		if((ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
		{
			// End:0x81
			if(bCheckHitSurface)
			{
				CheckSurface(HitLocation, HitNormal, Surf);
			}
			// End:0xBC
			if(Instigator == none)
			{
				ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Level.GetLocalPlayerController());				
			}
			else
			{
				ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Instigator);
			}
		}
	}
	BlowUp(HitLocation);
	bExploded = true;
	// End:0x15B
	if((!bNetTemporary && bTearOnExplode) && (int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
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

simulated function InitProjectile()
{
	super(BallisticProjectile).InitProjectile();
	PlaySound(DetonateSound,, 2.0000000,, 256.0000000);
	SetTimer(1.0000000, false);
	return;
	//return;	
}

simulated event Timer()
{
	// End:0x16
	if(StartDelay > float(0))
	{
		super(BallisticProjectile).Timer();		
	}
	else
	{
		Explode(Location, Vector(Rotation));
	}
	//return;	
}

singular simulated function HitWall(Vector HitNormal, Actor Wall)
{
	//return;	
}

function BlowUp(Vector HitLocation)
{
	// End:0x12
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0xBB
	if(DamageRadius > float(0))
	{
		// End:0x9C
		if(Pawn(Base) != none)
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Base, Damage, Instigator, HitLocation, MomentumTransfer * Normal(Base.Location - Location), StuckDamageType);
			TargetedHurtRadius(Damage, DamageRadius, MyRadiusDamageType, MomentumTransfer, HitLocation, Base);			
		}
		else
		{
			TargetedHurtRadius(Damage, DamageRadius, MyRadiusDamageType, MomentumTransfer, HitLocation);
		}
	}
	MakeNoise(1.0000000);
	//return;	
}

defaultproperties
{
	StuckDamageType=Class'BallisticProV55.DTM46GrenadeStuck'
	bNoFXOnExplode=true
	bTearOnExplode=false
	Damage=125.0000000
	DamageRadius=512.0000000
}
