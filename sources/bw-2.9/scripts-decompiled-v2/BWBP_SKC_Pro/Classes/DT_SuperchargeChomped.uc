class DT_SuperchargeChomped extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o got %vh hand chomped off by %k's supercharger."
	DeathStrings[1]="%k welded some hot spots where %o's lungs used to be."
	DeathStrings[2]="%k's supercharger made a meal out of %o"
	DeathStrings[3]="%%o was shocked to find out that %k's supercharger can weld and chomp at the same time."
	DeathStrings[4]="%k deconstructed %o with %kh supercharger jaws."
	BloodManagerName="BallisticProV55.BloodMan_Lightning"
	bDetonatesBombs=false
	DamageDescription=",Electro,Hazard,Plasma,"
	WeaponClass=Class'BWBP_SKC_Pro.Supercharger_AssaultWeapon'
	DeathString="%o got %vh hand chomped off by %k's supercharger."
	FemaleSuicide="%o chomped herself."
	MaleSuicide="%o chomped himself."
	bCauseConvulsions=true
	bDelayedDamage=true
	GibModifier=15.0000000
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=1.0500000
	KDamageImpulse=20000.0000000
	VehicleDamageScaling=0.4000000
}
