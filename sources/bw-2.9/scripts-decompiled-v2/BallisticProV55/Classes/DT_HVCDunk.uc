class DT_HVCDunk extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	FemaleSuicides[0]="%o went wading with her lightning gun."
	FemaleSuicides[1]="%o shrieked and flapped around in the water with her HVC."
	FemaleSuicides[2]="A suicidal %o flung herself and her lightning gun into the water."
	FemaleSuicides[3]="%o and electricity didn't mix."
	MaleSuicides[0]="%o went wading with his lightning gun."
	MaleSuicides[1]="%o shrieked and flapped around in the water with his HVC."
	MaleSuicides[2]="A suicidal %o flung himself and his lightning gun into the water."
	MaleSuicides[3]="%o and electricity didn't mix."
	FlashThreshold=0
	FlashV=(X=400.0000000,Y=400.0000000,Z=1500.0000000)
	FlashF=0.3500000
	bIgniteFires=true
	DamageDescription=",Electro,Hazard,"
	WeaponClass=Class'BallisticProV55.HVCMk9LightningGun'
	DeathString="%k zapped %o."
	FemaleSuicide="%o floated to the surface."
	MaleSuicide="%o floated to the surface."
	bArmorStops=false
	bInstantHit=true
	bNeverSevers=true
	GibModifier=0.0000000
	GibPerterbation=0.7000000
}
