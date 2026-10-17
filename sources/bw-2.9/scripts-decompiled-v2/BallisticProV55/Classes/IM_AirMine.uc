class IM_AirMine extends BCImpactManager;

simulated function SpawnEffects(int HitSurfaceType, Vector Norm, optional byte Flags)
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x3A
	if(PhysicsVolume.bWaterVolume)
	{
		HitSounds[0] = SoundGroup'BW_Core_WeaponSound.Explosions.Explode-UW';
	}
	super.SpawnEffects(HitSurfaceType, Norm, Flags);
	//return;	
}

defaultproperties
{
	HitEffects[0]=Class'BallisticProV55.IE_AirMineExplosion'
	HitDecals[0]=Class'BallisticProV55.AD_Explosion'
	HitSounds[0]=SoundGroup'BW_Core_WeaponSound.Explosions.Explode'
	HitSoundVolume=1.0000000
	HitSoundRadius=1024.0000000
	EffectBackOff=32.0000000
}
