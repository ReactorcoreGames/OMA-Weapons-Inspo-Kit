class LonghornMicroClusterAltImpact extends BallisticGrenade;

var float ZBonus;
var int ImpactCount;

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	// End:0x21
	if(!bHasImpacted)
	{
		FlakClass = Class'BWBP_SKC_Pro.LonghornMicroClusterFlakArtillery';
		ImpactManager = Class'BWBP_SKC_Pro.IM_LonghornCluster';
	}
	super.Explode(HitLocation, HitNormal);
	//return;	
}

simulated function InitEffects()
{
	super(BallisticProjectile).InitEffects();
	// End:0x44
	if(LonghornGrenadeTrail(Trail) != none)
	{
		// End:0x44
		if(Instigator != none)
		{
			LonghornGrenadeTrail(Trail).SetupColor(Instigator.GetTeamNum());
		}
	}
	//return;	
}

simulated function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir, NewMomentum;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x1B8
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x1B7
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim) && Victims != HurtWall)
		{
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x133
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			NewMomentum = (damageScale * Momentum) * Dir;
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), NewMomentum, DamageType);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

defaultproperties
{
	ArmedDetonateOn=2
	ArmedPlayerImpactType=1
	DampenFactorParallel=0.6000000
	bAlignToVelocity=true
	DetonateDelay=1.2500000
	ImpactDamage=25
	ImpactDamageType=Class'BWBP_SKC_Pro.DT_LonghornShotDirect'
	WeaponClass=Class'BWBP_SKC_Pro.LonghornLauncher'
	ImpactManager=Class'BWBP_SKC_Pro.IM_LonghornCluster'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SKC_Pro.LonghornGrenadeTrailSmall'
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_LonghornShotRadius'
	ShakeRadius=512.0000000
	MotionBlurRadius=384.0000000
	MotionBlurFactor=3.0000000
	MotionBlurTime=1.0000000
	Speed=3800.0000000
	Damage=25.0000000
	DamageRadius=250.0000000
	MomentumTransfer=15000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_LonghornShotRadius'
	LightType=1
	LightEffect=21
	LightHue=25
	LightSaturation=192
	LightBrightness=32.0000000
	LightRadius=4.0000000
	StaticMesh=StaticMesh'BWBP_SKC_Static.Longhorn.ClusterProj'
	bDynamicLight=true
	LifeSpan=20.0000000
	DrawScale=0.5000000
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
