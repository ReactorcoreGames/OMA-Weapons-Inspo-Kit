class LonghornMicroClusterFlakArtillery extends LonghornMicroClusterFlak;

simulated function InitProjectile()
{
	super.InitProjectile();
	Velocity.Z *= 0.5000000;
	// End:0x39
	if(Velocity.Z < float(0))
	{
		Velocity.Z = 5.0000000;
	}
	//return;	
}

defaultproperties
{
	ArmedDetonateOn=1
	DampenFactor=0.0500000
	DampenFactorParallel=0.2500000
	DetonateDelay=0.1000000
	ImpactDamage=20
	ImpactDamageType=Class'BWBP_SKC_Pro.DT_LonghornArtilleryDirect'
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_LonghornArtilleryRadius'
	Speed=100.0000000
	Damage=150.0000000
	DamageRadius=500.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_LonghornArtilleryRadius'
	AmbientSound=Sound'ONSBPSounds.Artillery.ShellAmbient'
	AmbientGlow=100
	SoundVolume=64
	SoundRadius=100.0000000
}
