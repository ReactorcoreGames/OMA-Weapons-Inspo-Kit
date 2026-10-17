class DTWrenchgunShot extends DT_BWBlunt
	config(BallisticProV55);

static function Hurt(Actor Victim, float Damage, Pawn Instigator, Vector HitLocation, Vector Momentum, Class<DamageType> dt)
{
	local WrenchgunBleed C;

	Victim.TakeDamage(int(Damage), Instigator, HitLocation, Momentum, dt);
	// End:0xE6
	if((xPawn(Victim) != none) && xPawn(Victim).bProjTarget)
	{
		// End:0x84
		foreach Victim.BasedActors(Class'BWBP_APC_Pro.WrenchgunBleed', C)
		{
			C.AddTime(2.5000000);			
			return;			
		}		
		C = Victim.Spawn(Class'BWBP_APC_Pro.WrenchgunBleed', Victim,, Victim.Location, Victim.Rotation);
		C.Initialize(Victim);
		C.Instigator = Instigator;
	}
	//return;	
}

defaultproperties
{
	DeathStrings[0]="%k redefined terminal velocity by fatally lobbing a wrench at %o."
	DeathStrings[1]="%o proved to be no match for %k's patented flying wrench technique."
	DeathStrings[2]="%o mistakenly brought a gun to %k's ballistic wrench fight."
	SimpleKillString="Redwood Wrenchgun Wrenchshot"
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BWBP_APC_Pro.Wrenchgun'
	DeathString="%k hunted down a cowering %o with %kh wrenchgun."
	FemaleSuicide="%o doesn't know how to aim."
	MaleSuicide="%o can't aim very well."
	bExtraMomentumZ=true
	GibModifier=1.5000000
	GibPerterbation=0.4000000
	KDamageImpulse=15000.0000000
}
