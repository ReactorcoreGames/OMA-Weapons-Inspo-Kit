class DTFM14Shotgun extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o managed to blunder %vh way right in front of %k's blunderbuss."
	DeathStrings[1]="%k managed to hunt %o down and open up a massive hole where %vh spine used to be."
	DeathStrings[2]="%o never saw %ks 8 gauge slug from several feet away, taking one straight to the lungs."
	DeathStrings[3]="%k opened a window to %o's heart with a high powered blunderbuss."
	DeathStrings[4]="%o was a victim of gnasher brutality, %k's gnasher to be precise."
	bIgniteFires=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BWBP_APC_Pro.FM14Shotgun'
	DeathString="%k blasted a pound of lead into %o with the FM14."
	FemaleSuicide="%o nailed herself with the FM14."
	MaleSuicide="%o nailed himself with the FM14."
	bExtraMomentumZ=true
	GibPerterbation=0.4000000
	KDamageImpulse=25000.0000000
	VehicleMomentumScaling=0.2000000
}
