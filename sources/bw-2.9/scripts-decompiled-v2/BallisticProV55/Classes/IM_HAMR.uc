class IM_HAMR extends BCImpactManager;

var() float SurfaceRange;
var() float MinFluidDepth;

simulated function SpawnEffects(int HitSurfaceType, Vector Norm, optional byte Flags)
{
	local Vector WLoc, WNorm;
	local bool bHitWater;
	local float ImpactDepth;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0xE9
	if(PhysicsVolume.bWaterVolume)
	{
		bHitWater = !PhysicsVolume.TraceThisActor(WLoc, WNorm, Location, Location + (vect(0.0000000, 0.0000000, 1.0000000) * SurfaceRange));
		ImpactDepth = WLoc.Z - Location.Z;
		// End:0xE9
		if(ImpactDepth > MinFluidDepth)
		{
			// End:0xC7
			if(bHitWater && ImpactDepth < SurfaceRange)
			{
				Spawn(Class'BallisticProV55.IE_WaterSurfaceBlast', Owner,, WLoc);
			}
			HitEffects[HitSurfaceType] = Class'BallisticProV55.IE_UnderWaterExplosion';
			HitSounds[HitSurfaceType] = SoundGroup'BW_Core_WeaponSound.Explosions.Explode-UW';
		}
	}
	super.SpawnEffects(HitSurfaceType, Norm, Flags);
	//return;	
}

defaultproperties
{
	SurfaceRange=384.0000000
	MinFluidDepth=128.0000000
	HitEffects[0]=Class'BallisticProV55.IE_HAMRExplosion'
	HitEffects[1]=Class'BallisticProV55.IE_HAMRExplosionDirt'
	HitEffects[2]=Class'BallisticProV55.IE_HAMRExplosionDirt'
	HitEffects[3]=Class'BallisticProV55.IE_HAMRExplosion'
	HitEffects[4]=Class'BallisticProV55.IE_HAMRExplosionDirt'
	HitEffects[5]=Class'BallisticProV55.IE_HAMRExplosionDirt'
	HitEffects[6]=Class'BallisticProV55.IE_HAMRExplosion'
	HitEffects[7]=Class'BallisticProV55.IE_HAMRExplosion'
	HitEffects[8]=Class'BallisticProV55.IE_HAMRExplosion'
	HitEffects[9]=Class'BallisticProV55.IE_HAMRExplosionDirt'
	HitEffects[10]=Class'BallisticProV55.IE_HAMRExplosion'
	HitDecals[0]=Class'BallisticProV55.AD_Explosion'
	HitSounds[0]=SoundGroup'BW_Core_WeaponSound.Artillery.Art-Explode'
	HitSoundVolume=1.5000000
	HitSoundRadius=1024.0000000
	EffectBackOff=96.0000000
}
