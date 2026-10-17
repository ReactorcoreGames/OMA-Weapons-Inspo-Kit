class DT_RSDarkStabHead extends DT_BWBlade
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
	DeathStrings[0]="%k swung %kh Dark Star into %o's pointy nose."
	DeathStrings[1]="%o's head was obliterated by %k's Dark saw."
	DeathStrings[2]="%o's cranium couldn't quite escape %k's relentless Dark saw attack."
	BloodManagerName="BallisticProV55.BloodMan_Saw"
	BlockFatiguePenalty=0.0500000
	AimDisplacementDamageThreshold=30
	AimDisplacementDuration=0.2500000
	bHeaddie=true
	DamageIdent="Melee"
	DamageDescription=",Slash,DarkStar,Hack,"
	WeaponClass=Class'BallisticProV55.RSDarkStar'
	DeathString="%k swung %kh Dark Star into %o's pointy nose."
	FemaleSuicide="%o sawed her head off with a Dark Star."
	MaleSuicide="%o sawed his head off with a Dark Star."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.DarkStar.Dark-Flesh'
	KDamageImpulse=2000.0000000
	TransientSoundVolume=0.9000000
}
