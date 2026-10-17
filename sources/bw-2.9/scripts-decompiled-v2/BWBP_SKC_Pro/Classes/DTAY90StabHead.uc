class DTAY90StabHead extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k rammed the blades of %kh Elite AY90 into %o's head."
	DeathStrings[1]="%o was jabbed in the jaw by %k's Elite AY90."
	DeathStrings[2]="%o tried to chew on %k's Elite AY90."
	DamageDescription=",Stab,"
	WeaponClass=Class'BWBP_SKC_Pro.AY90SkrithBoltcaster'
	DeathString="%k rammed the blades of an Elite AY90 into %o's head."
	FemaleSuicide="%o sliced her own head in half with the Elite AY90."
	MaleSuicide="%o sliced his own head in half with the Elite AY90."
	bArmorStops=false
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=Sound'BW_Core_WeaponSound.A73.A73StabFlesh'
	KDamageImpulse=2000.0000000
}
