class DT_MAGSAWStab extends DT_BWBlade
	config(BallisticProV55);

static function Class<Effects> GetPawnDamageEffect(Vector HitLocation, float Damage, Vector Momentum, Pawn Victim, bool bLowDetail)
{
	// End:0x7E
	if(xPawn(Victim) != none)
	{
		// End:0x43
		if(default.PawnDamageSounds.Length > 0)
		{
			Victim.PlaySound(default.PawnDamageSounds[Rand(default.PawnDamageSounds.Length)], 0, default.TransientSoundVolume, false, default.TransientSoundRadius);
		}
		// End:0x7E
		if((default.EffectChance > float(0)) && default.EffectChance > FRand())
		{
			DoBloodEffects(HitLocation, Damage, Momentum, Victim, bLowDetail);
		}
	}
	return super(BallisticDamageType).GetPawnDamageEffect(HitLocation, Damage, Momentum, Victim, bLowDetail);
	//return;	
}

defaultproperties
{
	DeathStrings[0]="%o was sawed in half by %k's chainsaw longsword."
	DeathStrings[1]="%k's MAG-SAW ripped %o open."
	DeathStrings[2]="%o was dismembered by %k's chainsaw-assisted slashes."
	EffectChance=1.0000000
	BloodManagerName="BWBP_OP_Pro.BloodMan_MAGSAW"
	BlockFatiguePenalty=0.2500000
	DamageIdent="Melee"
	DamageDescription=",Slash,Hack,"
	WeaponClass=Class'BWBP_OP_Pro.MAG78Longsword'
	DeathString="%o was sawed in half by %k's chainsaw longsword."
	FemaleSuicide="%o somehow managed to end herself with her MAG-SAW."
	MaleSuicide="%o somehow managed to end himself with his MAG-SAW."
	bAlwaysSevers=true
	GibModifier=2.0000000
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.DarkStar.Dark-Flesh'
	KDamageImpulse=2000.0000000
	TransientSoundVolume=0.9000000
}
