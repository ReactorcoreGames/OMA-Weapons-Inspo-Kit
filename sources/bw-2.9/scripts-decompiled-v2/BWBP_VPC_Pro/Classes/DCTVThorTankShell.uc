class DCTVThorTankShell extends ONSRocketProjectile;

simulated function PostBeginPlay()
{
	// End:0x28
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		SmokeTrailEffect = Spawn(Class'BWBP_VPC_Pro.DCTVThorShellTrail', self);
	}
	Dir = Vector(Rotation);
	Velocity = Speed * Dir;
	// End:0x73
	if(PhysicsVolume.bWaterVolume)
	{
		bHitWater = true;
		Velocity = 0.6000000 * Velocity;
	}
	// End:0x95
	if(Level.bDropDetail)
	{
		bDynamicLight = false;
		LightType = 0;
	}
	super(Projectile).PostBeginPlay();
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	PlaySound(Sound'WeaponSounds.BaseImpactAndExplosions.BExplosion3',, 5.5000000 * TransientSoundVolume);
	// End:0x95
	if(EffectIsRelevant(Location, false))
	{
		Spawn(Class'BWBP_VPC_Pro.DCTVShellImpact',,, HitLocation + (HitNormal * float(16)), Rotator(HitNormal) + rot(-16384, 0, 0));
		// End:0x95
		if((ExplosionDecal != none) && int(Level.NetMode) != int(NM_DedicatedServer))
		{
			Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));
		}
	}
	BlowUp(HitLocation);
	Destroy();
	//return;	
}

defaultproperties
{
	Speed=5500.0000000
	MaxSpeed=8000.0000000
	MyDamageType=Class'BWBP_VPC_Pro.DT_ThorTankShell'
	Physics=2
	LifeSpan=6.0000000
	bIgnoreTerminalVelocity=true
}
