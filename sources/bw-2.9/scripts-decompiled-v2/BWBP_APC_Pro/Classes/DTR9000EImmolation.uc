class DTR9000EImmolation extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was cooked just right for %k's Chimera of a rifle."
	DeathStrings[1]="Through %k's scope, %ke watch %o fail to put the flames out."
	DeathStrings[2]="%o never saw %k's bullets, or the fires that cremated %vm."
	DeathStrings[3]="%k rendered %o into ashes from half a mile away."
	SimpleKillString="R9000-E Immolation"
	FlashThreshold=0
	FlashV=(X=750.0000000,Y=250.0000000,Z=0.0000000)
	FlashF=-0.0500000
	InvasionDamageScaling=2.0000000
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_APC_Pro.R9000ERifle'
	DeathString="%o was immolated by %k."
	FemaleSuicide="%o immolated herself."
	MaleSuicide="%o immolated himself."
	bDelayedDamage=true
	GibPerterbation=0.1000000
	KDamageImpulse=200.0000000
	VehicleDamageScaling=0.5000000
}
