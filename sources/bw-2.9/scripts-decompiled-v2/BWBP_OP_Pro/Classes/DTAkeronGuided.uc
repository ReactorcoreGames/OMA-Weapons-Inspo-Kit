class DTAkeronGuided extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k callously flew his rocket into %o's face."
	DeathStrings[1]="%o was hunted and killed by %k's roving rocket."
	DeathStrings[2]="%o tragically failed to spot %k's marauding missile."
	SimpleKillString="AN-56 Akeron Guided"
	InvasionDamageScaling=3.0000000
	DamageIdent="Ordnance"
	WeaponClass=Class'BWBP_OP_Pro.AkeronLauncher'
	DeathString="%k callously flew his rocket into %o's face."
	FemaleSuicide="%o took a selfie with an Akeron guided rocket."
	MaleSuicide="%o took a selfie with an Akeron guided rocket."
	bDelayedDamage=true
	bExtraMomentumZ=true
}
