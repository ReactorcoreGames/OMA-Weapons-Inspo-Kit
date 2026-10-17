class DTSMAT_Freeze extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o couldn't escape the blizzard left by %k's ice rocket."
	DeathStrings[1]="%k froze %o to death with a SMAT ice rocket."
	DeathStrings[2]="%o was turned into a snowman by %k's lingering SMAT cloud."
	DeathStrings[3]="%k's SMAT ice cloud left %o out in the cold."
	DeathStrings[4]="%o got lost in %k's SMAT-induced winter wonderland."
	FemaleSuicides[0]="%o walked out into her own SMAT blizzard."
	FemaleSuicides[1]="%o tried building a snowman in her SMAT snow cloud"
	FemaleSuicides[2]="%o turned herself into a SMATsicle."
	MaleSuicides[0]="%o walked out into his own SMAT blizzard."
	MaleSuicides[1]="%o tried building a snowman in his SMAT snow cloud"
	MaleSuicides[2]="%o turned himself into a SMATsicle."
	SimpleKillString="SMAT Ice Cloud"
	FlashThreshold=0
	FlashV=(X=0.0000000,Y=0.0000000,Z=2000.0000000)
	FlashF=0.3000000
	bDetonatesBombs=false
	bIgnoredOnLifts=true
	DamageIdent="Grenade"
	DamageDescription=",Gas,GearSafe,Hazard,"
	WeaponClass=Class'BWBP_SKC_Pro.SMATLauncher'
	DeathString="%o choked to death in a cloud of %k's toxic gas."
	FemaleSuicide="%o walked out into her own SMAT blizzard."
	MaleSuicide="%o walked out into his own SMAT blizzard."
	bArmorStops=false
	bLocationalHit=false
	bCausesBlood=false
	bDelayedDamage=true
	bNeverSevers=true
	GibPerterbation=0.5000000
	KDamageImpulse=20000.0000000
	VehicleDamageScaling=0.0000000
}
