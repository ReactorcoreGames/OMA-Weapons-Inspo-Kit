class IM_BOGPFlareScorch extends BCImpactManager;

simulated function SpawnEffects(int HitSurfaceType, Vector Norm, optional byte Flags)
{
	local Projector P;
	local IE_BOGPFlareImpact FizzleEffect;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x9C
	if((HitSounds.Length > 0) && (int(Flags) & 2) == 0)
	{
		// End:0x6A
		if(HitSurfaceType >= HitSounds.Length)
		{
			PlaySound(HitSounds[0], 3, HitSoundVolume,, HitSoundRadius, HitSoundPitch, true);			
		}
		else
		{
			// End:0x9C
			if(HitSounds[HitSurfaceType] != none)
			{
				PlaySound(HitSounds[HitSurfaceType], 3, HitSoundVolume,, HitSoundRadius, HitSoundPitch, true);
			}
		}
	}
	// End:0x20C
	if((HitEffects.Length > 0) && (int(Flags) & 1) == 0)
	{
		// End:0x169
		if(HitSurfaceType >= HitEffects.Length)
		{
			FizzleEffect = IE_BOGPFlareImpact(Spawn(HitEffects[0], Owner,, Location + (EffectBackOff * Norm), Rotation));
			// End:0x133
			if(Pawn(Owner) != none)
			{
				FizzleEffect.SetupColor(Pawn(Owner).GetTeamNum());				
			}
			else
			{
				// End:0x166
				if(Controller(Owner) != none)
				{
					FizzleEffect.SetupColor(Controller(Owner).GetTeamNum());
				}
			}			
		}
		else
		{
			// End:0x20C
			if(HitEffects[HitSurfaceType] != none)
			{
				FizzleEffect = IE_BOGPFlareImpact(Spawn(HitEffects[HitSurfaceType], Owner,, Location, Rotation));
				// End:0x1D9
				if(Pawn(Owner) != none)
				{
					FizzleEffect.SetupColor(Pawn(Owner).GetTeamNum());					
				}
				else
				{
					// End:0x20C
					if(Controller(Owner) != none)
					{
						FizzleEffect.SetupColor(Controller(Owner).GetTeamNum());
					}
				}
			}
		}
	}
	// End:0x2FC
	if((HitDecals.Length > 0) && (int(Flags) & 4) == 0)
	{
		// End:0x262
		if(HitSurfaceType >= HitDecals.Length)
		{
			P = Spawn(HitDecals[0], Owner,, Location, Rotator(-Norm));			
		}
		else
		{
			// End:0x29B
			if(HitDecals[HitSurfaceType] != none)
			{
				P = Spawn(HitDecals[HitSurfaceType], Owner,, Location, Rotator(-Norm));
			}
		}
		// End:0x2FC
		if((BallisticDecal(P) != none) && BallisticDecal(P).bWaitForInit)
		{
			P.SetDrawScale(P.DrawScale * DecalScale);
			BallisticDecal(P).InitDecal();
		}
	}
	// End:0x33B
	if(((ShakeRadius > float(0)) && (int(Flags) & 8) == 0) && (HitSurfaceType != 9) || bShakeOnWaterHit)
	{
		DoViewShake();
	}
	//return;	
}

defaultproperties
{
	HitEffects[0]=Class'BallisticProV55.IE_BOGPFlareImpact'
	HitDecals[0]=Class'BallisticProV55.AD_RX22AScorch'
	HitSounds[0]=Sound'BW_Core_WeaponSound.BOGP.BOGP_FlareImpact'
	HitSoundVolume=3.0000000
	HitSoundRadius=1024.0000000
	EffectBackOff=96.0000000
}
