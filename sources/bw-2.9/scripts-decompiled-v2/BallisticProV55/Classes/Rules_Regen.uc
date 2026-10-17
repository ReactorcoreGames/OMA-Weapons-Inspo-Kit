class Rules_Regen extends GameRules
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function ScoreKill(Controller Killer, Controller Killed)
{
	super.ScoreKill(Killer, Killed);
	// End:0x161
	if(((((Killed != none) && Killer != none) && Killer.Pawn != none) && Killer.Pawn.Health > 0) && Killer.Pawn.Health < Class'BallisticProV55.Mut_Regeneration'.default.HealthBonusCap)
	{
		// End:0xF5
		if(Vehicle(Killer.Pawn) == none)
		{
			Killer.Pawn.Health = Clamp(Killer.Pawn.Health + Class'BallisticProV55.Mut_Regeneration'.default.HealthBonus, 0, Class'BallisticProV55.Mut_Regeneration'.default.HealthBonusCap);			
		}
		else
		{
			Vehicle(Killer.Pawn).Driver.Health = Clamp(Vehicle(Killer.Pawn).Driver.Health + Class'BallisticProV55.Mut_Regeneration'.default.HealthBonus, 0, Class'BallisticProV55.Mut_Regeneration'.default.HealthBonusCap);
		}
	}
	//return;	
}

