class DTCX85Bullet extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k eliminated %o with the CX85."
	DeathStrings[1]="%o was drilled by %k's CX85."
	DeathStrings[2]="%k purified %o with CX85 rounds."
	DamageIdent="Machinegun"
	WeaponClass=Class'BWBP_OP_Pro.CX85AssaultWeapon'
	DeathString="%k eliminated %o with the M50."
	FemaleSuicide="%o nailed herself with the M50."
	MaleSuicide="%o nailed himself with the M50."
	bFastInstantHit=true
	GibPerterbation=0.1000000
	KDamageImpulse=3000.0000000
}
