class DTFP9BombShot extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k hijacked an FP9 and turned it on %o."
	DeathStrings[1]="%o was bombed by %k's hijacked FP9."
	DeathStrings[2]="%k attacked an FP9 and %o got in the way."
	DeathStrings[3]="%k used the ultimate detonator on %o."
	FemaleSuicides[0]="%o tried to attack an FP9 bomb."
	FemaleSuicides[1]="%o cut the blue wire."
	FemaleSuicides[2]="%o cut the red wire."
	FemaleSuicides[3]="%o shot the green wire."
	MaleSuicides[0]="%o tried to attack an FP9 bomb."
	MaleSuicides[1]="%o cut the blue wire."
	MaleSuicides[2]="%o cut the red wire."
	MaleSuicides[3]="%o shot the green wire."
	SimpleKillString="FP9 Hijack"
	bDetonatesBombs=false
	InvasionDamageScaling=3.0000000
	DamageIdent="Grenade"
	WeaponClass=Class'BallisticProV55.FP9Explosive'
	DeathString="%k hijacked an FP9 and turned it on %o."
	FemaleSuicide="%o tried to attack an FP9 Bomb."
	MaleSuicide="%o tried to attack an FP9 Bomb."
	bDelayedDamage=true
}
