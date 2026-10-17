class DTX3KnifeThrown extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k pegged %o with %kh X3."
	DeathStrings[1]="%k flung a knife at %o."
	DeathStrings[2]="%k flicked a knife into %o's flesh."
	SimpleKillString="X3 Thrown"
	bCanBeBlocked=false
	DisplacementType=0
	DamageIdent="Melee"
	WeaponClass=Class'BallisticProV55.X3Knife'
	DeathString="%k pegged %o with %kh X3."
	FemaleSuicide="%o threw a knife at herself."
	MaleSuicide="%o threw a knife at himself."
	bNeverSevers=true
	KDamageImpulse=1000.0000000
}
