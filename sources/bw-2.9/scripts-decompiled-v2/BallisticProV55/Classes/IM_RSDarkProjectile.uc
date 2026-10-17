class IM_RSDarkProjectile extends BCImpactManager;

simulated function Initialize(int HitSurfaceType, Vector Norm, optional byte Flags)
{
	// End:0x22
	if(HitSurfaceType > 2)
	{
		HitSoundVolume = 0.7000000;
		HitSoundRadius = 96.0000000;
	}
	super.Initialize(HitSurfaceType, Norm, Flags);
	//return;	
}

defaultproperties
{
	HitEffects[0]=Class'BallisticProV55.IE_RSDarkGeneral'
	HitEffects[1]=Class'BallisticProV55.IE_RSDarkPlayerHit'
	HitEffects[2]=Class'BallisticProV55.IE_RSDarkPlayerKill'
	HitEffects[3]=Class'BallisticProV55.IE_RSDarkFastGeneral'
	HitEffects[4]=Class'BallisticProV55.IE_RSDarkFastPlayerHit'
	HitEffects[5]=Class'BallisticProV55.IE_RSProjectileCombo'
	HitDecals[0]=Class'BallisticProV55.AD_RSDarkSlow'
	HitDecals[1]=Class'BallisticProV55.AD_RSDarkSlow'
	HitDecals[2]=Class'BallisticProV55.AD_RSDarkSlow'
	HitDecals[3]=Class'BallisticProV55.AD_RSDarkFast'
	HitDecals[4]=Class'BallisticProV55.AD_RSDarkFast'
	HitSounds[0]=Sound'BW_Core_WeaponSound.DarkStar.Dark-SlowImpact'
	HitSounds[1]=Sound'BW_Core_WeaponSound.DarkStar.Dark-SlowImpact'
	HitSounds[2]=Sound'BW_Core_WeaponSound.DarkStar.Dark-SlowImpact'
	HitSounds[3]=Sound'BW_Core_WeaponSound.A73.A73Impact'
	HitSounds[4]=Sound'BW_Core_WeaponSound.A73.A73Impact'
	HitSoundVolume=1.3000000
	HitSoundRadius=256.0000000
}
