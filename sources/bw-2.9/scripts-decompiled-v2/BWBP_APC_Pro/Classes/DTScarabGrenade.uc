class DTScarabGrenade extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o found %k's explosive Scarab right under %vh feet, %ve couldn't stomp it out in time."
	DeathStrings[1]="%k created a bloody meal for the scarabs using %o's exploded corpse."
	DeathStrings[2]="%o's ankles made a good appetizer for %k's explosive Scarab."
	DeathStrings[3]="%k's Scarab scurried onto %o before blowing %vm up to tiny bits."
	DeathStrings[4]="%o should've brought a bigger net to contain the explosion of %k's Scarab."
	BloodManagerName="BallisticProV55.BloodMan_BluntSmall"
	bDetonatesBombs=false
	DamageIdent="Grenade"
	DamageDescription=",Blunt,Hazard,"
	WeaponClass=Class'BWBP_APC_Pro.ScarabGrenade'
	DeathString="%k rammed a pineapple down %k's throat."
	FemaleSuicide="%o tripped on her own pineapple."
	MaleSuicide="%o tripped on his own pineapple."
	bDelayedDamage=true
	GibPerterbation=0.5000000
	KDamageImpulse=20000.0000000
}
