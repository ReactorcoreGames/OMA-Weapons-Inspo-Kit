class DT_FG50Limb extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's FG50 round took %o's leg with it."
	DeathStrings[1]="%o's arm stumps were a gift from %k's FG50."
	DeathStrings[2]="%k blew off %o arm with an FG50."
	DeathStrings[3]="%k's FG50 ensured %o would never walk again."
	TagMultiplier=0.5000000
	TagDuration=0.2500000
	bIgniteFires=true
	DamageIdent="Machinegun"
	DamageDescription=",Bullet,Flame,"
	WeaponClass=Class'BWBP_SKC_Pro.FG50MachineGun'
	DeathString="%k's FG50 round took %o's leg with it."
	FemaleSuicide="%o did some self amputation with an FG50."
	MaleSuicide="%o did some self amputation with an FG50."
	bFastInstantHit=true
	GibModifier=1.5000000
	GibPerterbation=0.2000000
	KDamageImpulse=3500.0000000
	VehicleDamageScaling=0.5000000
}
