class DamTypeDestroyedVehicleRoadKill extends DamageType
	abstract;

defaultproperties
{
	DeathString="A vehicle %k destroyed crushed %o"
	FemaleSuicide="%o couldn't avoid the vehicle she destroyed."
	MaleSuicide="%o couldn't avoid the vehicle he destroyed."
	ThemSuicide="%o couldn't avoid the vehicle they destroyed."
	bLocationalHit=false
	bKUseTearOffMomentum=true
	bNeverSevers=true
	bExtraMomentumZ=false
	GibModifier=2.0000000
	GibPerterbation=0.5000000
}
