class RGPXFlakRocket extends BallisticGrenade;

var float NewSpeed;
var bool bFlakInitialized;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		NewSpeed;
}

simulated event Timer()
{
	// End:0x2C
	if((int(Role) < int(ROLE_Authority)) && NewSpeed == default.NewSpeed)
	{
		SetTimer(0.1000000, false);
		return;
	}
	// End:0x71
	if(StartDelay > float(0))
	{
		StartDelay = 0.0000000;
		bHidden = false;
		SetPhysics(default.Physics);
		SetCollision(default.bCollideActors, default.bBlockActors, default.bBlockPlayers);
		InitProjectile();
		return;
	}
	//return;	
}

function InitFlak(float FSpeed)
{
	Speed = FSpeed;
	NewSpeed = Speed;
	//return;	
}

simulated function InitProjectile()
{
	bFlakInitialized = true;
	super(BallisticProjectile).InitProjectile();
	//return;	
}

simulated event PostNetReceive()
{
	super(Actor).PostNetReceive();
	// End:0x20
	if(NewSpeed != default.NewSpeed)
	{
		Speed = NewSpeed;
	}
	// End:0x4F
	if(!bFlakInitialized && NewSpeed != default.NewSpeed)
	{
		// End:0x4F
		if(StartDelay == float(0))
		{
			InitProjectile();
		}
	}
	//return;	
}

defaultproperties
{
	NewSpeed=-0.1000000
	DetonateOn=1
	bApplyParams=false
	WeaponClass=Class'BWBP_JCF_Pro.RGPXBazooka'
	ImpactManager=Class'BWBP_JCF_Pro.IM_RGPX'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SKC_Pro.LonghornGrenadeTrailSmall'
	StartDelay=0.1000000
	MyRadiusDamageType=Class'BWBP_JCF_Pro.DTRGPXBazookaRadius'
	WallPenetrationForce=384.0000000
	ShakeRadius=378.0000000
	ShakeRotMag=(X=512.0000000,Y=400.0000000,Z=256.0000000)
	ShakeRotRate=(X=3000.0000000,Y=2500.0000000,Z=3000.0000000)
	ShakeOffsetMag=(X=20.0000000,Y=30.0000000,Z=30.0000000)
	MotionBlurRadius=512.0000000
	AccelSpeed=200.0000000
	Speed=5.0000000
	Damage=50.0000000
	DamageRadius=256.0000000
	MomentumTransfer=15000.0000000
	MyDamageType=Class'BWBP_JCF_Pro.DTRGPXBazooka'
	StaticMesh=StaticMesh'BWBP_JCF_Static.RGP-X350.RGP-X350_ProjMini'
	bDynamicLight=true
	bNetTemporary=false
	bUpdateSimulatedPosition=true
	DrawScale=0.1800000
	SoundVolume=192
	SoundRadius=128.0000000
	CollisionRadius=4.0000000
	CollisionHeight=4.0000000
	bUseCollisionStaticMesh=true
}
