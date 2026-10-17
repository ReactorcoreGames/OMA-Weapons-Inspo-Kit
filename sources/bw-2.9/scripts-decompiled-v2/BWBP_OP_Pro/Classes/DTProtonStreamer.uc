class DTProtonStreamer extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o underwent a total protonic reversal from %k's E90-N."
	DeathStrings[1]="%k busted %o with a proton stream."
	DeathStrings[2]="%k made a ghost out of %o."
	DeathStrings[3]="%k neutronized %o with %kh particle accelerator."
	DeathStrings[4]="%k ain't 'fraid of %o's ghost."
	DeathStrings[5]="%k crossed %o's stream."
	DeathStrings[6]="%k made every molecule in %o's body explode at the speed of light."
	DeathStrings[7]="%k reduced %o to a focused, non-terminal, repeating phantasm."
	SimpleKillString="E90-N Proton Stream"
	BloodManagerName="BallisticProV55.BloodMan_NovaLightning"
	FlashThreshold=0
	FlashV=(X=0.0000000,Y=0.0000000,Z=350.0000000)
	FlashF=0.7000000
	ShieldDamage=15
	bIgniteFires=true
	DamageIdent="Energy"
	DamageDescription=",Electro,"
	WeaponClass=Class'BWBP_OP_Pro.ProtonStreamer'
	DeathString="%k busted %o with a proton stream."
	FemaleSuicide="Its true, %o has no dick."
	MaleSuicide="Its true, %o has no dick."
	bInstantHit=true
	bLocationalHit=false
	bCauseConvulsions=true
	bNeverSevers=true
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.2500000
	KDamageImpulse=20000.0000000
}
