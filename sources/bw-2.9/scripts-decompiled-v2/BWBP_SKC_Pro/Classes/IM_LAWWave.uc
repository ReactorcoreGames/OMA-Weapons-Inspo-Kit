class IM_LAWWave extends BCImpactManager;

var() float SurfaceRange;
var() float MinFluidDepth;

simulated function SpawnEffects(int HitSurfaceType, Vector Norm, optional byte Flags)
{
	local Vector WLoc, WNorm;
	local bool bHitWater;
	local float ImpactDepth;
	local Projector P;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x38
	if(int(Flags) == 1)
	{
		HitEffects[0] = Class'BWBP_SKC_Pro.IE_ShockwaveRed';		
	}
	else
	{
		HitEffects[0] = Class'BWBP_SKC_Pro.IE_Shockwave';
	}
	// End:0x113
	if(PhysicsVolume.bWaterVolume)
	{
		bHitWater = !PhysicsVolume.TraceThisActor(WLoc, WNorm, Location, Location + (vect(0.0000000, 0.0000000, 1.0000000) * SurfaceRange));
		ImpactDepth = WLoc.Z - Location.Z;
		// End:0x113
		if(ImpactDepth > MinFluidDepth)
		{
			// End:0xF1
			if(bHitWater && ImpactDepth < SurfaceRange)
			{
				Spawn(Class'BallisticProV55.IE_WaterSurfaceBlast', Owner,, WLoc);
			}
			HitEffects[HitSurfaceType] = Class'BallisticProV55.IE_UnderWaterExplosion';
			HitSounds[HitSurfaceType] = SoundGroup'BW_Core_WeaponSound.Explosions.Explode-UW';
		}
	}
	HitSoundPitch = 0.8000000 + (0.4000000 * FRand());
	// End:0x197
	if(HitSounds.Length > 0)
	{
		// End:0x165
		if(HitSurfaceType >= HitSounds.Length)
		{
			PlaySound(HitSounds[0], 3, HitSoundVolume,, HitSoundRadius, HitSoundPitch, true);			
		}
		else
		{
			// End:0x197
			if(HitSounds[HitSurfaceType] != none)
			{
				PlaySound(HitSounds[HitSurfaceType], 3, HitSoundVolume,, HitSoundRadius, HitSoundPitch, true);
			}
		}
	}
	// End:0x20D
	if(HitEffects.Length > 0)
	{
		// End:0x1DE
		if(HitSurfaceType >= HitEffects.Length)
		{
			Spawn(HitEffects[0], Owner,, Location + (EffectBackOff * Norm), Rotation);			
		}
		else
		{
			// End:0x20D
			if(HitEffects[HitSurfaceType] != none)
			{
				Spawn(HitEffects[HitSurfaceType], Owner,, Location, Rotation);
			}
		}
	}
	// End:0x2EA
	if(HitDecals.Length > 0)
	{
		// End:0x250
		if(HitSurfaceType >= HitDecals.Length)
		{
			P = Spawn(HitDecals[0], Owner,, Location, Rotator(-Norm));			
		}
		else
		{
			// End:0x289
			if(HitDecals[HitSurfaceType] != none)
			{
				P = Spawn(HitDecals[HitSurfaceType], Owner,, Location, Rotator(-Norm));
			}
		}
		// End:0x2EA
		if((BallisticDecal(P) != none) && BallisticDecal(P).bWaitForInit)
		{
			P.SetDrawScale(P.DrawScale * DecalScale);
			BallisticDecal(P).InitDecal();
		}
	}
	// End:0x316
	if((ShakeRadius > float(0)) && (HitSurfaceType != 9) || bShakeOnWaterHit)
	{
		DoViewShake();
	}
	//return;	
}

defaultproperties
{
	SurfaceRange=684.0000000
	MinFluidDepth=128.0000000
	HitEffects[0]=Class'BWBP_SKC_Pro.IE_Shockwave'
	HitSounds[0]=Sound'BWBP_SKC_Sounds.LAW.LAW-Pulse'
	HitSoundVolume=3.5000000
	HitSoundRadius=1600.0000000
	EffectBackOff=96.0000000
}
