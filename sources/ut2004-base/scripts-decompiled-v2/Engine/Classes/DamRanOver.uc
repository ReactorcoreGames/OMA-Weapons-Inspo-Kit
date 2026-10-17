class DamRanOver extends DamageType
	abstract
	notplaceable;

defaultproperties
{
	DeathString="%k ran over %o"
	FemaleSuicide="%o ran over herself"
	MaleSuicide="%o ran over himself"
	ThemSuicide="%o ran over themself"
	bLocationalHit=false
	bKUseTearOffMomentum=true
	bNeverSevers=true
	bExtraMomentumZ=false
	bVehicleHit=true
	GibModifier=2.0000000
	GibPerterbation=0.5000000
}
