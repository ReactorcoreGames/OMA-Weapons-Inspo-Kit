class DTA500Impact extends DTA500Blast
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k sent a sizzling glob of acid into %o's face."
	DeathStrings[1]="%o stumbled into %k's A500 acid blob."
	DeathStrings[2]="%k fired a burning acidic bomb down %o's throat."
	DeathStrings[3]="%o got liquidised by %k's Skrith Reptile acid."
	SimpleKillString="A500 Acid Bomb"
	DeathString="%k sent a sizzling glob of acid into %o's face."
	FemaleSuicide="%o drank her own A500 acid blob."
	MaleSuicide="%o drank his own A500 acid blob."
	bExtraMomentumZ=true
}
