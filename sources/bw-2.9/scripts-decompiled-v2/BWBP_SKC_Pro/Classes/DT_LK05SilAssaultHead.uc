class DT_LK05SilAssaultHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's head was picked off by %k's silent LK05."
	DeathStrings[1]="%o throughts were silenced by %k's LK05."
	DeathStrings[2]="%k's LK05 spat death in %o's face."
	SimpleKillString="LK-05 Advanced Carbine Suppressed"
	bHeaddie=true
	DamageIdent="Assault"
	WeaponClass=Class'BWBP_SKC_Pro.LK05Carbine'
	DeathString="%o's head was picked off by %k's silent LK05."
	FemaleSuicide="%o saw a bullet coming up the barrel of her LK05."
	MaleSuicide="%o saw a bullet coming up the barrel of his LK05."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.0000000
}
