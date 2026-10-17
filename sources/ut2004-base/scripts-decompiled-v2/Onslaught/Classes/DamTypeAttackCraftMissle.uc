class DamTypeAttackCraftMissle extends VehicleDamageType
	abstract;

static function ScoreKill(Controller Killer, Controller Killed)
{
	// End:0x84
	if((((Killed != none) && Killer != Killed) && Vehicle(Killed.Pawn) != none) && Vehicle(Killed.Pawn).bCanFly)
	{
		// End:0x84
		if(PlayerController(Killer) != none)
		{
			PlayerController(Killer).ReceiveLocalizedMessage(Class'Onslaught.ONSVehicleKillMessage', 6);
		}
	}
	//return;	
}

defaultproperties
{
	VehicleClass=Class'Onslaught.ONSAttackCraft'
	DeathString="%o couldn't avoid %k's air-to-air missile."
	FemaleSuicide="%o blasted herself out of the sky."
	MaleSuicide="%o blasted himself out of the sky."
	ThemSuicide="%o blasted themself out of the sky."
	bDelayedDamage=true
	VehicleDamageScaling=1.5000000
	VehicleMomentumScaling=0.7500000
}
