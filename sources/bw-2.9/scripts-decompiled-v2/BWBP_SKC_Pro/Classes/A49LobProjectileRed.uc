class A49LobProjectileRed extends BallisticProjectile;

var() float FallSpeed;

simulated event Landed(Vector HitNormal)
{
	HitWall(HitNormal, none);
	//return;	
}

simulated event HitWall(Vector HitNormal, Actor Wall)
{
	Explode(Location, HitNormal);
	//return;	
}

simulated function InitProjectile()
{
	InitEffects();
	//return;	
}

defaultproperties
{
	FallSpeed=600.0000000
	WeaponClass=Class'BWBP_SKC_Pro.A49SkrithBlaster'
	ImpactManager=Class'BallisticProV55.IM_A73PowerB'
	TrailClass=Class'BallisticProV55.A73PowerTrailEmitterB'
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DTA49Skrith'
	ShakeRadius=384.0000000
	ShakeRotMag=(X=256.0000000,Y=200.0000000,Z=128.0000000)
	ShakeRotRate=(X=3000.0000000,Y=2500.0000000,Z=3000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=10.0000000,Y=15.0000000,Z=15.0000000)
	ShakeOffsetTime=2.0000000
	MotionBlurRadius=250.0000000
	MotionBlurFactor=2.0000000
	MotionBlurTime=2.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DTA49Skrith'
	LightHue=150
	LightBrightness=225.0000000
	LightRadius=18.0000000
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.DarkStar.DarkProjBig'
	Physics=2
	LifeSpan=9.0000000
	Skins[0]=FinalBlend'BW_Core_WeaponTex.A73RedLayout.A73BPowerF2'
	Skins[1]=FinalBlend'BW_Core_WeaponTex.A73RedLayout.A73BPowerF1'
	SoundRadius=128.0000000
	bOrientToVelocity=true
}
