class ExploWallHit extends xHeavyWallHitEffect;

simulated function SpawnEffects()
{
	PlaySound(ImpactSounds[Rand(10)]);
	// End:0x29
	if(PhysicsVolume.bWaterVolume)
	{
		Spawn(Class'XEffects.pclImpactSmoke');
		return;
	}
	// End:0x60
	if((int(Level.DetailMode) == int(0)) || Level.bDropDetail)
	{
		Spawn(Class'XEffects.SmallExplosion');
		return;
	}
	Spawn(Class'XEffects.pclImpactSmoke');
	Spawn(Class'XEffects.SmallExplosion');
	//return;	
}

