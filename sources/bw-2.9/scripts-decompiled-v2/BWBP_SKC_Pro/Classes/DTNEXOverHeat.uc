class DTNEXOverHeat extends DT_BWMiscDamage
	config(BallisticProV55);

static function Class<Effects> GetPawnDamageEffect(Vector HitLocation, float Damage, Vector Momentum, Pawn Victim, bool bLowDetail)
{
	// End:0x40
	if(PlayerController(Victim.Controller) != none)
	{
		PlayerController(Victim.Controller).ClientFlash(default.FlashF, default.FlashV);
	}
	return super(BallisticDamageType).GetPawnDamageEffect(HitLocation, Damage, Momentum, Victim, bLowDetail);
	//return;	
}

defaultproperties
{
	DeathStrings[0]="%o was on the receiving end of %k's overloaded NEX."
	DeathStrings[1]="%k vented %kh plasma sword into %o."
	DeathStrings[2]="%k plunged an overloaded NEX into %o."
	DeathStrings[3]="%k's Plas-Edge exploded in %o's face."
	FemaleSuicides[0]="%o melted her face off with her NEX."
	FemaleSuicides[1]="%o lost an eyebrow thanks to her Plas-Edge."
	FemaleSuicides[2]="%o's Plas-Edge looks better as part of her hands anyways."
	MaleSuicides[0]="%o melted his face off with his NEX."
	MaleSuicides[1]="%o exploded his prototype Plas-Edge."
	MaleSuicides[2]="%o's Plas-Edge looks better as part of his hands anyways."
	BloodManagerName="BallisticProV55.BloodMan_Lightning"
	FlashV=(X=800.0000000,Y=800.0000000,Z=2000.0000000)
	FlashF=0.5000000
	bDetonatesBombs=false
	bIgniteFires=true
	DamageDescription=",Electro,Hazard"
	WeaponClass=Class'BWBP_SKC_Pro.N3XPlaz'
	DeathString="%o was on the receiving end of %k's overloaded NEX."
	FemaleSuicide="%o melted her face off with her NEX."
	MaleSuicide="%o melted his face off with his NEX."
	bArmorStops=false
	bInstantHit=true
	bCauseConvulsions=true
	bFlaming=true
	GibModifier=5.0000000
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.4000000
	KDamageImpulse=20000.0000000
}
