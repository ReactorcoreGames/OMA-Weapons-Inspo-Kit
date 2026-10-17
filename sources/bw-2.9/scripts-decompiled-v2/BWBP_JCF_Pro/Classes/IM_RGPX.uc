class IM_RGPX extends BCImpactManager;

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
	// End:0xE1
	if(PhysicsVolume.bWaterVolume)
	{
		bHitWater = !PhysicsVolume.TraceThisActor(WLoc, WNorm, Location, Location + (vect(0.0000000, 0.0000000, 1.0000000) * SurfaceRange));
		ImpactDepth = WLoc.Z - Location.Z;
		// End:0xE1
		if(ImpactDepth > MinFluidDepth)
		{
			// End:0xC7
			if(bHitWater && ImpactDepth < SurfaceRange)
			{
				Spawn(Class'BallisticProV55.IE_WaterSurfaceBlast', Owner,, WLoc);
			}
			HitEffects[0] = Class'BallisticProV55.IE_UnderWaterExplosion';
			HitSounds[0] = SoundGroup'BW_Core_WeaponSound.Explosions.Explode-UW';
		}
	}
	super.SpawnEffects(HitSurfaceType, Norm, Flags);
	//return;	
}

defaultproperties
{
	SurfaceRange=256.0000000
	MinFluidDepth=128.0000000
	HitEffects[0]=Class'BWBP_JCF_Pro.IE_RGPXExplosion'
	HitDecals[0]=Class'BWBP_JCF_Pro.AD_RGPXExplosion'
	HitSounds[0]=SoundGroup'BW_Core_WeaponSound.MRL.MRL-Explode'
	HitSoundVolume=0.9000000
	HitSoundRadius=386.0000000
	EffectBackOff=96.0000000
}
