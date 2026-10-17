class DT_RSDarkStab extends DT_BWBlade
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
	DeathStrings[0]="%o screeched and leapt onto %k's Dark Star saw."
	DeathStrings[1]="%k sawed %o into tiny pieces with a Dark Star."
	DeathStrings[2]="%k thrust %kh Dark Star into %o's ribcage."
	DeathStrings[3]="%o was insanely shredded by %k's Dark Star."
	BloodManagerName="BallisticProV55.BloodMan_Saw"
	BlockFatiguePenalty=0.0500000
	AimDisplacementDuration=0.2500000
	DamageIdent="Melee"
	DamageDescription=",Slash,DarkStar,Hack,"
	WeaponClass=Class'BallisticProV55.RSDarkStar'
	DeathString="%o screeched and leapt onto %k's Dark Star saw."
	FemaleSuicide="%o accidentally shredded herself on her Dark Star."
	MaleSuicide="%o accidentally shredded himself on his Dark Star."
	bNeverSevers=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.DarkStar.Dark-Flesh'
	KDamageImpulse=2000.0000000
	TransientSoundVolume=0.9000000
}
