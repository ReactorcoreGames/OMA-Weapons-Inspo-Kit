class DT_MAGSAWStabHead extends DT_BWBlade
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
	DeathStrings[0]="%k ripped and tore %kh chainsword into %o's screaming face."
	DeathStrings[1]="%o's head was massacred by %k's chainsword."
	DeathStrings[2]="%o's face was mulched by %k's chainsword."
	BloodManagerName="BWBP_OP_Pro.BloodMan_MAGSAW"
	bHeaddie=true
	DamageIdent="Melee"
	DamageDescription=",Slash,Hack,"
	WeaponClass=Class'BWBP_OP_Pro.MAG78Longsword'
	DeathString=""
	FemaleSuicide="%o sawed her head off with a Dark Star."
	MaleSuicide="%o sawed his head off with a Dark Star."
	bAlwaysSevers=true
	bSpecial=true
	GibModifier=2.0000000
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.DarkStar.Dark-Flesh'
	GibPerterbation=1.2000000
	KDamageImpulse=2000.0000000
	TransientSoundVolume=0.9000000
}
