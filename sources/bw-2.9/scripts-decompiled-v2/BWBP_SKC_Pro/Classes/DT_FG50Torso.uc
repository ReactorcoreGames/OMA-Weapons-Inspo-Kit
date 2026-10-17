class DT_FG50Torso extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o took %k's FG50 round straight to the spine."
	DeathStrings[1]="%o couldn't survive %k's firey tempest of FG50 rounds."
	DeathStrings[2]="%k drilled several large holes into %o with %kh FG50."
	DeathStrings[3]="%k's FG50 put some lead into %o's diet."
	TagMultiplier=0.5000000
	TagDuration=0.2500000
	bIgniteFires=true
	DamageIdent="Machinegun"
	DamageDescription=",Bullet,Flame,"
	WeaponClass=Class'BWBP_SKC_Pro.FG50MachineGun'
	DeathString="%o took %k's FG50 round straight to the spine."
	FemaleSuicide="%o's FG50 didn't like the look of its owner."
	MaleSuicide="%o's FG50 didn't like the look of its owner."
	bFastInstantHit=true
	GibModifier=1.5000000
	GibPerterbation=0.2000000
	KDamageImpulse=3500.0000000
	VehicleDamageScaling=0.5000000
}
