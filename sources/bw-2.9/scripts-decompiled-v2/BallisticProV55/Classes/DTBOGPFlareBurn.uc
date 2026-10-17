class DTBOGPFlareBurn extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was sent screaming as %k's flare incinerated %vh."
	DeathStrings[1]="%k lit up %o like a burning Christmas tree with %kh BORT-85 flare."
	DeathStrings[2]="%k toasted %o like a marshmallow with a burning hot flare."
	FlashThreshold=0
	FlashV=(X=750.0000000,Y=250.0000000,Z=0.0000000)
	FlashF=-0.0500000
	InvasionDamageScaling=2.0000000
	DamageIdent="Pistol"
	WeaponClass=Class'BallisticProV55.BOGPPistol'
	DeathString="%o was sent screaming as %k's flare incinerated %vh."
	FemaleSuicide="%o set herself ablaze with a BORT-85 flare."
	MaleSuicide="%o set himself ablaze with a BORT-85 flare."
	bDelayedDamage=true
	VehicleDamageScaling=0.5000000
}
