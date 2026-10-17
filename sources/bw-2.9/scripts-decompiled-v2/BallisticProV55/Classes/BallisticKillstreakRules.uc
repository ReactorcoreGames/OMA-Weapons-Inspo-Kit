class BallisticKillstreakRules extends GameRules
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var Mut_Killstreak mut;
var byte SpreeThresholds[2];

function ScoreKill(Controller Killer, Controller Killed)
{
	local int i;
	local PlayerController PC;
	local KillstreakLRI KLRI;

	// End:0x0D
	if(Killer == none)
	{
		return;
	}
	PC = PlayerController(Killer);
	KLRI = Class'BallisticProV55.Mut_Killstreak'.static.GetKLRI(Killer.PlayerReplicationInfo);
	// End:0x147
	if(((PC != none) && Killer != Killed) && PC.Pawn != none)
	{
		i = 0;
		J0x79:

		// End:0x147 [Loop If]
		if(i < 2)
		{
			// End:0x13D
			if(((PC.Pawn.GetSpree() == int(SpreeThresholds[i])) && !bool(int(mut.GetStreakLevel(PC)) & (i + 1))) && !bool(int(KLRI.ActiveStreak) & (i + 1)))
			{
				mut.FlagStreak(PC, byte(float(2) ** float(i)));
				PC.ReceiveLocalizedMessage(Class'BallisticProV55.BallisticKillstreakMessage', i + 1);
				// [Explicit Break]
				goto J0x147;
			}
			i++;
			// [Loop Continue]
			goto J0x79;
		}
	}
	J0x147:

	// End:0x1C4
	if((PlayerController(Killed) != none) && BallisticPawn(Killed.Pawn) != none)
	{
		KLRI = Class'BallisticProV55.Mut_Killstreak'.static.GetKLRI(Killed.PlayerReplicationInfo);
		// End:0x1C4
		if(int(KLRI.ActiveStreak) > 0)
		{
			mut.ResetActiveStreaks(PlayerController(Killed));
		}
	}
	// End:0x1E8
	if(NextGameRules != none)
	{
		NextGameRules.ScoreKill(Killer, Killed);
	}
	//return;	
}

defaultproperties
{
	SpreeThresholds[0]=4
	SpreeThresholds[1]=9
}
