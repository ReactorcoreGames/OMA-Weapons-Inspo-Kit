class DTX8KnifeRifleLaunched extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k showed %o how in %kh country, KNIFE SHOOTS YOU."
	DeathStrings[1]="%k hit the wrong trigger and pegged %o with a knife."
	DeathStrings[2]="%o mistakenly brought a gun to %k's ballistic knife fight."
	SimpleKillString="AK-490 Bayonet Launched"
	bCanBeBlocked=false
	DisplacementType=0
	WeaponClass=Class'BWBP_SKC_Pro.AK490BattleRifle'
	DeathString="%k showed %o how in %kh country, KNIFE SHOOTS YOU."
	FemaleSuicide="%o played Russian roulette with her knife launcher."
	MaleSuicide="%o played Russian roulette with his knife launcher."
	bNeverSevers=true
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.1000000
}
