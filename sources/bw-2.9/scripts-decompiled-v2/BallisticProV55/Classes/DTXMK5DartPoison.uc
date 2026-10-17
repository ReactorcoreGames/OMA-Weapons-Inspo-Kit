class DTXMK5DartPoison extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's XMk5 dart poisoned %o to an agonizing death."
	DeathStrings[1]="%o suffered boils and poisoning from %k's stun dart."
	DeathStrings[2]="%k's dart poison eventually overcame %o's fragile constitution."
	SimpleKillString="XMk5 Poison"
	DamageDescription=",Poison,GearSafe,NonSniper,"
	WeaponClass=Class'BallisticProV55.XMK5SubMachinegun'
	DeathString="%k's XMk5 dart poisoned %o to an agonizing death."
	FemaleSuicide="%o pricked herself with an XMk5 dart."
	MaleSuicide="%o pricked himself with an XMk5 dart."
	bArmorStops=false
	bFastInstantHit=true
	bDelayedDamage=true
	bDirectDamage=true
	GibPerterbation=0.1000000
	KDamageImpulse=3000.0000000
	VehicleDamageScaling=0.6500000
}
