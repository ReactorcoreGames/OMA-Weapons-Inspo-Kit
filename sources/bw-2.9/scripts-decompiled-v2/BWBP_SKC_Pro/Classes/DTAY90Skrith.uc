class DTAY90Skrith extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's Wyvern will feast on %o's plasma filled corpse."
	DeathStrings[1]="%o became carrion for %k's dragonic bow."
	DeathStrings[2]="%k led %o into %kh explosive plasma bolt and blew %vh legs off."
	DeathStrings[3]="%o no longer has a bowel obstruction, or any bowels thanks to %k."
	DeathStrings[4]="%k is a marksman, accurately nailing %o with many plasma bolts."
	DeathStrings[5]="%o was crucified due to %k's boltcaster."
	BloodManagerName="BWBP_SKC_Pro.BloodMan_A73B"
	bOnlySeverLimbs=true
	bIgniteFires=true
	DamageDescription=",Flame,Plasma,"
	WeaponClass=Class'BWBP_SKC_Pro.AY90SkrithBoltcaster'
	DeathString="%k fused parts of %o with the AY90."
	FemaleSuicide="%o's AY90 turned on her."
	MaleSuicide="%o's AY90 turned on him."
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.9000000
}
