class DamTypeAttackCraftPlasma extends VehicleDamageType
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
	DeathString="%k's Raptor filled %o with plasma."
	FemaleSuicide="%o fried herself with her own plasma blast."
	MaleSuicide="%o fried himself with his own plasma blast."
	ThemSuicide="%o was fried with their own plasma blast."
	bDetonatesGoop=true
	bDelayedDamage=true
	FlashFog=(X=700.0000000,Y=0.0000000,Z=0.0000000)
}
