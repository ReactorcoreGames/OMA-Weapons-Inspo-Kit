class Corroded extends DamageType
	abstract;

static function Class<Effects> GetPawnDamageEffect(Vector HitLocation, float Damage, Vector Momentum, Pawn Victim, bool bLowDetail)
{
	return default.PawnDamageEffect;
	//return;	
}

defaultproperties
{
	DeathString="%o was dissolved by %k's."
	FemaleSuicide="%o dissolved in slime."
	MaleSuicide="%o dissolved in slime."
	bLocationalHit=false
	FlashFog=(X=450.0000000,Y=700.0000000,Z=230.0000000)
}
