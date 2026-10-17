class DTR9A1Rifle_Freeze extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's R9A1 sent %o to the cooler."
	DeathStrings[1]="%k broke the ice between %o and %kh R9A1."
	DeathStrings[2]="%o chilled out after seeing %k's ranger rifle."
	DeathStrings[3]="%o was sent to the ice age by %k's R9A1."
	DeathStrings[4]="%k's R9A1 gave %o an ice time."
	DeathStrings[5]="%k leveled $kh R9 at %o and shouted Freeze!"
	SimpleKillString="R9A1 Freeze"
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_OP_Pro.R9A1RangerRifle'
	DeathString="%k's R9A1 sent %o to the cooler."
	FemaleSuicide="%o exorcised herself."
	MaleSuicide="%o exorcised himself."
}
