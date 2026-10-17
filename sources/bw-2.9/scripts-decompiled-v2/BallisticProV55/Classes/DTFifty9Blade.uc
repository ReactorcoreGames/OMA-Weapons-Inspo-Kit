class DTFifty9Blade extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k swung %kh Fifty-9 like a maniac and finally brought %o down."
	DeathStrings[1]="%o was chopped up good by %k's Fifty-9 blade."
	DeathStrings[2]="%k's Fifty-9 blade sliced open %o like a ripe fruit."
	AimDisplacementDamageThreshold=40
	DamageIdent="Melee"
	WeaponClass=Class'BallisticProV55.Fifty9MachinePistol'
	DeathString="%k's Fifty-9 blade sliced open %o like a ripe fruit."
	FemaleSuicide="%o skinned herself with a Fifty-9."
	MaleSuicide="%o skinned himself with a Fifty-9."
	bNeverSevers=true
	PawnDamageSounds[0]=Sound'BW_Core_WeaponSound.A73.A73StabFlesh'
	KDamageImpulse=1000.0000000
}
