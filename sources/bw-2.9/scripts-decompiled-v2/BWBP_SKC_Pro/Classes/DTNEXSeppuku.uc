class DTNEXSeppuku extends DT_BWMiscDamage
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
	DeathStrings[0]="%o stared a bit too closely at %k's demonstration."
	FemaleSuicides[0]="%o performed seppuku."
	MaleSuicides[0]="%o performed seppuku."
	BloodManagerName="BallisticProV55.BloodMan_Lightning"
	FlashV=(X=2000.0000000,Y=600.0000000,Z=600.0000000)
	FlashF=0.1000000
	DamageDescription=",Electro,Hazard"
	WeaponClass=Class'BWBP_SKC_Pro.N3XPlaz'
	DeathString="%o stared a bit too closely at %k's demonstration."
	MaleSuicide="%o performed seppuku."
	bArmorStops=false
	bInstantHit=true
	bNeverSevers=true
	bFlaming=true
	GibModifier=3.5000000
	GibPerterbation=1.4000000
	KDamageImpulse=20000.0000000
}
