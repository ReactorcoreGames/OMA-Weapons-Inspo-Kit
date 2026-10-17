class A800Projectile_Red extends BallisticGrenade;

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	super.HitWall(HitNormal, Wall);
	// End:0x28
	if(int(DetonateOn) != int(1))
	{
		DetonateOn = 1;
	}
	//return;	
}

defaultproperties
{
	ArmedPlayerImpactType=1
	DampenFactor=0.9000000
	DampenFactorParallel=0.9000000
	RandomSpin=0.0000000
	DetonateDelay=1.0000000
	ImpactDamageType=Class'BWBP_SWC_Pro.DTA800MG'
	WeaponClass=Class'BWBP_SWC_Pro.A800SkrithMinigun'
	ImpactManager=Class'BallisticProV55.IM_A73ProjectileB'
	PenetrateManager=Class'BallisticProV55.IM_A73ProjectileB'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.A73TrailEmitterB'
	bPenetrate=true
	DamageTypeHead=Class'BWBP_SWC_Pro.DTA800MGHead'
	MyRadiusDamageType=Class'BWBP_SWC_Pro.DTA800MG'
	bUsePositionalDamage=true
	AccelSpeed=100000.0000000
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	Damage=40.0000000
	MyDamageType=Class'BWBP_SWC_Pro.DTA800MG'
	LightType=1
	LightEffect=21
	LightHue=180
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=6.0000000
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.A73.A73Projectile'
	bDynamicLight=true
	Physics=6
	AmbientSound=Sound'BW_Core_WeaponSound.A73.A73ProjFly'
	LifeSpan=4.0000000
	DrawScale=0.6000000
	Skins[0]=FinalBlend'BW_Core_WeaponTex.A73RedLayout.A73BProjFinal'
	Skins[1]=FinalBlend'BW_Core_WeaponTex.A73RedLayout.A73BProj2Final'
	Style=6
	SoundVolume=255
	SoundRadius=75.0000000
	CollisionRadius=1.0000000
	CollisionHeight=1.0000000
	RotationRate=(Pitch=0,Yaw=0,Roll=16384)
}
