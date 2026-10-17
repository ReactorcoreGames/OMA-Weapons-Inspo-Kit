class DTCX85DartRadius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was blown up from afar by %k's remote detonation darts."
	DeathStrings[1]="%k's nasty plot took %o out with convenience."
	DeathStrings[2]="%o got his butt blasted by %k's CX85 explosion."
	SimpleKillString="CX85 Dart Detonation"
	bDetonatesBombs=false
	InvasionDamageScaling=2.0000000
	DamageIdent="Machinegun"
	WeaponClass=Class'BWBP_OP_Pro.CX85AssaultWeapon'
	DeathString="%o was blown up from afar by %k's remote detonation darts."
	FemaleSuicide="%o MESSED herself UP with her CX85."
	MaleSuicide="%o RUINED his shit with his CX85."
	bDelayedDamage=true
}
