class BlueSuperShockBeam extends ShockBeamEffect;

simulated function SpawnEffects()
{
	local ShockBeamEffect E;

	super.SpawnEffects();
	E = Spawn(Class'XWeapons.ExtraBlueBeam');
	// End:0x38
	if(E != none)
	{
		E.AimAt(mSpawnVecA, HitNormal);
	}
	//return;	
}

defaultproperties
{
	CoilClass=Class'XWeapons.ShockBeamCoilBlue'
	LightHue=230
	bNetTemporary=false
	Skins[0]=ColorModifier'InstagibEffects.Effects.BlueSuperShockTex'
}
