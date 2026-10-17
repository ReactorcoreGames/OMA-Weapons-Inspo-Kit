class DTM58Grenade extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k bounced an M58 off %o's head."
	BloodManagerName="BallisticProV55.BloodMan_BluntSmall"
	bDetonatesBombs=false
	DamageDescription=",Blunt,Hazard,"
	WeaponClass=Class'BallisticProV55.M58Grenade'
	DeathString="%k bounced an M58 off %o's head."
	FemaleSuicide="%o tripped on her own M58."
	MaleSuicide="%o tripped on his own M58."
	bDelayedDamage=true
	GibPerterbation=0.5000000
	KDamageImpulse=20000.0000000
}
