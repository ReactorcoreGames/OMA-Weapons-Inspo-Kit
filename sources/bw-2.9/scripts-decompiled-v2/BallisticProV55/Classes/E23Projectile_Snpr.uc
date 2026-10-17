class E23Projectile_Snpr extends BallisticProjectile;

singular simulated function HitWall(Vector HitNormal, Actor Wall)
{
	local PlayerController PC;

	// End:0x121
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x119
		if(!Wall.bStatic && !Wall.bWorldGeometry)
		{
			// End:0x6F
			if((Instigator == none) || Instigator.Controller == none)
			{
				Wall.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Wall.TakeDamage(int(Damage), Instigator, Location, MomentumTransfer * Normal(Velocity), MyDamageType);
			// End:0x10E
			if(((DamageRadius > float(0)) && Vehicle(Wall) != none) && Vehicle(Wall).Health > 0)
			{
				Vehicle(Wall).DriverRadiusDamage(Damage, DamageRadius, InstigatorController, MyDamageType, MomentumTransfer, Location);
			}
			HurtWall = Wall;
		}
		MakeNoise(1.0000000);
	}
	Explode(Location + (ExploWallOut * HitNormal), HitNormal);
	// End:0x25A
	if((ExplosionDecal != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x242
		if(ExplosionDecal.default.CullDistance != float(0))
		{
			PC = Level.GetLocalPlayerController();
			// End:0x1D2
			if(!PC.BeyondViewDistance(Location, ExplosionDecal.default.CullDistance))
			{
				Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));				
			}
			else
			{
				// End:0x23F
				if(((Instigator != none) && PC == Instigator.Controller) && !PC.BeyondViewDistance(Location, 2.0000000 * ExplosionDecal.default.CullDistance))
				{
					Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));
				}
			}			
		}
		else
		{
			Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));
		}
	}
	HurtWall = none;
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.E23PlasmaRifle'
	ImpactManager=Class'BallisticProV55.IM_E23Projectile'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	bRandomStartRotation=false
	DamageTypeHead=Class'BallisticProV55.DTE23PlasmaHead'
	MyRadiusDamageType=Class'BallisticProV55.DTE23Plasma'
	MyDamageType=Class'BallisticProV55.DTE23Plasma'
	LightType=1
	LightEffect=21
	LightHue=64
	LightSaturation=96
	LightBrightness=192.0000000
	LightRadius=6.0000000
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.VPR.VPRProjectile'
	bDynamicLight=true
	AmbientSound=Sound'BW_Core_WeaponSound.A73.A73ProjFly'
	LifeSpan=4.0000000
	DrawScale3D=(X=2.0000000,Y=1.3000000,Z=1.3000000)
	Style=6
	SoundVolume=255
	SoundRadius=75.0000000
	CollisionRadius=3.0000000
	CollisionHeight=3.0000000
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=16384)
}
