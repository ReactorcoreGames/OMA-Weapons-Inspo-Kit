class AK490Knife extends BallisticProjectile;

var bool bStuckInWall;
var bool bHitPlayer;

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x10
	if(Other == none)
	{
		return;		
	}
	else
	{
		// End:0x32
		if((Other == Instigator) || Other == Owner)
		{
			return;
		}
	}
	// End:0x48
	if(bStuckInWall || bHitPlayer)
	{
		return;
	}
	// End:0x68
	if(int(Role) == int(ROLE_Authority))
	{
		DoDamage(Other, HitLocation);
	}
	bHitPlayer = true;
	SetPhysics(2);
	SetLocation(HitLocation);
	Velocity = Normal(HitLocation - Other.Location) * float(100);
	//return;	
}

simulated event Landed(Vector HitNormal)
{
	HitWall(HitNormal, none);
	//return;	
}

singular simulated function HitWall(Vector HitNormal, Actor Wall)
{
	local int Surf;

	// End:0x0B
	if(bStuckInWall)
	{
		return;
	}
	// End:0x9A
	if(((Wall != none) && !Wall.bWorldGeometry) && !Wall.bStatic)
	{
		// End:0x6F
		if((int(Role) == int(ROLE_Authority)) && !bHitPlayer)
		{
			DoDamage(Wall, Location);
		}
		// End:0x9A
		if(Mover(Wall) == none)
		{
			bHitPlayer = true;
			Velocity = HitNormal * float(100);
			return;
		}
	}
	SetRotation(Rotator(Velocity));
	OnlyAffectPawns(true);
	SetCollisionSize(40.0000000, 40.0000000);
	SetPhysics(0);
	bFixedRotationDir = false;
	bStuckInWall = true;
	bHardAttach = true;
	CheckSurface(Location, HitNormal, Surf, Wall);
	LifeSpan = 20.0000000;
	// End:0x10D
	if(Wall != none)
	{
		SetBase(Wall);
	}
	// End:0x163
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && ImpactManager != none) && EffectIsRelevant(Location, false))
	{
		ImpactManager.static.StartSpawn(Location, HitNormal, Surf, self);
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_SKC_Pro.AK490BattleRifle'
	ImpactManager=Class'BallisticProV55.IM_KnifeThrown'
	TrailClass=Class'BallisticProV55.MRLTrailEmitter'
	TrailOffset=(X=-2.0000000,Y=0.0000000,Z=0.0000000)
	bRandomStartRotation=false
	ModeIndex=1
	DamageTypeHead=Class'BWBP_SKC_Pro.DTX8KnifeRifleLaunchedHead'
	bUsePositionalDamage=true
	bWarnEnemy=false
	Speed=8500.0000000
	MaxSpeed=8500.0000000
	Damage=90.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DTX8KnifeRifleLaunched'
	StaticMesh=StaticMesh'BWBP_SKC_Static.X8.X8Proj'
	Physics=2
	LifeSpan=0.0000000
	DrawScale=0.1500000
	bUnlit=false
	bIgnoreTerminalVelocity=true
}
