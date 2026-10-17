class SuperShockBeamEffect extends ShockBeamEffect;

simulated function SpawnEffects()
{
	local ShockBeamEffect E;

	super.SpawnEffects();
	E = Spawn(Class'XWeapons.ExtraRedBeam');
	// End:0x38
	if(E != none)
	{
		E.AimAt(mSpawnVecA, HitNormal);
	}
	//return;	
}

simulated function SpawnImpactEffects(Rotator HitRot, Vector EffectLoc)
{
	Spawn(Class'XEffects.ShockImpactFlareB',,, EffectLoc, HitRot);
	Spawn(Class'XEffects.ShockImpactRingB',,, EffectLoc, HitRot);
	Spawn(Class'XEffects.ShockImpactScorch',,, EffectLoc, Rotator(-HitNormal));
	Spawn(Class'XEffects.ShockExplosionCoreB',,, EffectLoc, HitRot);
	//return;	
}

defaultproperties
{
	CoilClass=Class'XEffects.ShockBeamCoilB'
	MuzFlashClass=Class'XEffects.ShockMuzFlashB'
	MuzFlash3Class=Class'XEffects.ShockMuzFlashB3rd'
	bNetTemporary=false
	Skins[0]=ColorModifier'InstagibEffects.Effects.RedSuperShockBeam'
}
