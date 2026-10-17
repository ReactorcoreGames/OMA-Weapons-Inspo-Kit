class DT_AK91Supercharge extends DT_BWFire
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
	DeathStrings[0]="%k SUPERCHARGED %o!"
	FemaleSuicides[0]="%o SUPERCHARGED herself."
	MaleSuicides[0]="%o SUPERCHARGED himself."
	BloodManagerName="BallisticProV55.BloodMan_Lightning"
	bNoSeverStumps=true
	FlashV=(X=2000.0000000,Y=600.0000000,Z=600.0000000)
	FlashF=0.1000000
	ShieldDamage=200
	DamageDescription=",Electro,Hazard,Plasma,"
	WeaponClass=Class'BWBP_SKC_Pro.AK91ChargeRifle'
	DeathString="%k SUPERCHARGED %o!"
	FemaleSuicide="%o SUPERCHARGED herself!"
	MaleSuicide="%o SUPERCHARGED himself!"
	bInstantHit=true
	bSkeletize=true
	bCauseConvulsions=true
	bCausesBlood=true
	bDelayedDamage=true
	bNeverSevers=false
	bFlaming=true
	GibModifier=5.5000000
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=1.2000000
	KDamageImpulse=20000.0000000
}
