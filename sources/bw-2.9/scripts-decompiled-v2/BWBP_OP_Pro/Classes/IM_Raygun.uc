class IM_Raygun extends BCImpactManager;

simulated function Initialize(int HitSurfaceType, Vector Norm, optional byte Flags)
{
	// End:0x16
	if(HitSurfaceType > 0)
	{
		HitSoundRadius = 256.0000000;
	}
	super.Initialize(HitSurfaceType, Norm, Flags);
	//return;	
}

defaultproperties
{
	HitEffects[0]=Class'BWBP_OP_Pro.IE_RaygunChargedExplosion'
	HitEffects[1]=Class'BWBP_OP_Pro.IE_RaygunProjectile'
	HitDecals[0]=Class'BallisticProV55.AD_Explosion'
	HitDecals[1]=Class'BallisticProV55.AD_RSDarkFast'
	HitSounds[0]=Sound'BWBP_OP_Sounds.Raygun.Raygun-ImpactBig'
	HitSounds[1]=Sound'BWBP_OP_Sounds.Raygun.Raygun-Impact'
	HitSoundVolume=1.0000000
	HitSoundRadius=2048.0000000
}
