class DTM46Manual extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o wandered too close to %k's lurking M46 grenade."
	DeathStrings[1]="%k's manually detonated mine took %o's feet off."
	DeathStrings[2]="%o was blown to the Moon by %k's M46 detonation."
	SimpleKillString="M46 Mine Manual Detonation"
	bDetonatesBombs=false
	InvasionDamageScaling=2.0000000
	DamageIdent="Grenade"
	WeaponClass=Class'BallisticProV55.M46AssaultRifle'
	DeathString="%o wandered too close to %k's lurking M46 grenade."
	FemaleSuicide="%o thought she'd make sure her M46 grenade was armed one last time."
	MaleSuicide="%o thought he'd make sure his M46 grenade was armed one last time."
	bDelayedDamage=true
}
