class DT_BFGExplode extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was a casualty of %k's overloaded E-V HPC."
	DeathStrings[1]="%k went supernova in %o's face."
	DeathStrings[2]="%o was too close to the exploding %k's E-V HPC."
	DeathStrings[3]="%k took out %o in a glorious E-V HPC explosion."
	FemaleSuicides[0]="%o exploded her new E-V HPC."
	FemaleSuicides[1]="%o overloaded her hyper plasma cannon."
	FemaleSuicides[2]="%o's EV-HPC went haywire and blew up."
	MaleSuicides[0]="%o exploded his new E-V HPC."
	MaleSuicides[1]="%o overloaded a hyper plasma cannon."
	MaleSuicides[2]="%o's EV-HPC went haywire and blew up."
	BloodManagerName="BallisticProV55.BloodMan_Lightning"
	bNoSeverStumps=true
	FlashThreshold=0
	FlashV=(X=2000.0000000,Y=600.0000000,Z=600.0000000)
	FlashF=0.1000000
	ShieldDamage=200
	InvasionDamageScaling=2.5000000
	DamageDescription=",Electro,Hazard,Plasma,"
	WeaponClass=Class'BWBP_SKC_Pro.HVPCMk66PlasmaCannon'
	DeathString="%k went supernova in %o's face."
	FemaleSuicide="%o exploded her new EV-HPC."
	MaleSuicide="%o exploded his new EV-HPC."
	bInstantHit=true
	bSkeletize=true
	bCauseConvulsions=true
	bCausesBlood=true
	bDelayedDamage=true
	bNeverSevers=false
	bFlaming=true
	GibModifier=5.5000000
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LinkHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=1.2000000
	KDamageImpulse=20000.0000000
}
