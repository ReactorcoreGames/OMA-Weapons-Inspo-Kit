class DTChaffGrenade extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k whipped a smoke grenade at %o's face."
	DeathStrings[1]="%o took %k's explosive smoke grenade to the face."
	WeaponClass=Class'BWBP_SKC_Pro.ChaffGrenadeWeapon'
	DeathString="%k whipped a smoke grenade at %o's face."
	FemaleSuicide="%o beat the walls with her grenade like a lunatic."
	MaleSuicide="%o beat the walls with his grenade like a lunatic."
	bDelayedDamage=true
	VehicleDamageScaling=0.5000000
}
