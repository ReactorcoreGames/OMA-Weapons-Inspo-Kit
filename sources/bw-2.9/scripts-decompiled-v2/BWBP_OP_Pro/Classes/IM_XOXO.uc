class IM_XOXO extends BCImpactManager;

simulated function Initialize(int HitSurfaceType, Vector Norm, optional byte Flags)
{
	// End:0x24
	if(HitSurfaceType == 1)
	{
		HitSoundVolume = 0.7000000;
		HitSoundRadius = 96.0000000;		
	}
	else
	{
		// End:0x51
		if(HitSurfaceType == 2)
		{
			HitSoundVolume = 2.0000000;
			HitSoundRadius = 2048.0000000;
			DecalScale = 4.0000000;
		}
	}
	super.Initialize(HitSurfaceType, Norm, Flags);
	//return;	
}

defaultproperties
{
	HitEffects[0]=Class'BWBP_OP_Pro.IE_XOXOExplosion'
	HitEffects[1]=Class'BWBP_OP_Pro.IE_XOXOSmall'
	HitEffects[2]=Class'BWBP_OP_Pro.IE_XOXONukeExplosion'
	HitDecals[0]=Class'BallisticProV55.AD_A42General'
	HitDecals[1]=Class'BallisticProV55.AD_A42General'
	HitDecals[2]=Class'BallisticProV55.AD_Explosion'
	HitSounds[0]=Sound'BWBP_OP_Sounds.XOXO.XOXO-ImpactBig'
	HitSounds[1]=Sound'BWBP_OP_Sounds.XOXO.XOXO-ImpactSmall'
	HitSounds[2]=Sound'BWBP_OP_Sounds.XOXO.XOXO-Sexplosion'
	HitSoundVolume=1.3000000
	HitSoundRadius=378.0000000
}
