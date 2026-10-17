class BallisticInvKillstreakRules extends GameRules
	config(BallisticProV55)
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var Mut_Killstreak mut;
var config int InvSpreeThresholds[2];

function ScoreKill(Controller Killer, Controller Killed)
{
	local int i, OldScore;
	local PlayerController PC;
	local KillstreakLRI KLRI;

	PC = PlayerController(Killer);
	// End:0x1AD
	if(((PC != none) && Killer != Killed) && PC.Pawn != none)
	{
		KLRI = Class'BallisticProV55.Mut_Killstreak'.static.GetKLRI(PC.PlayerReplicationInfo);
		// End:0x1AD
		if(KLRI != none)
		{
			OldScore = KLRI.InvKillScore;
			// End:0xBA
			if(Invasion(Level.Game).LastKilledMonsterClass == none)
			{
				KLRI.InvKillScore += 1;				
			}
			else
			{
				KLRI.InvKillScore += Invasion(Level.Game).LastKilledMonsterClass.default.ScoringValue;
			}
			i = 0;
			J0xF6:

			// End:0x1AD [Loop If]
			if(i < 2)
			{
				// End:0x11A
				if(OldScore >= InvSpreeThresholds[i])
				{
					// [Explicit Continue]
					goto J0x1A3;
				}
				// End:0x1A3
				if((KLRI.InvKillScore >= InvSpreeThresholds[i]) && bool(int(mut.GetStreakLevel(PC)) & int(float(2) ** float(i))))
				{
					mut.FlagStreak(PC, byte(i + 1));
					PC.ReceiveLocalizedMessage(Class'BallisticProV55.BallisticKillstreakMessage', i + 1);
					// [Explicit Break]
					goto J0x1AD;
				}
				J0x1A3:

				i++;
				// [Loop Continue]
				goto J0xF6;
			}
		}
	}
	J0x1AD:

	// End:0x213
	if(((PlayerController(Killed) != none) && BallisticPawn(Killed.Pawn) != none) && BallisticPawn(Killed.Pawn).bActiveKillstreak)
	{
		mut.ResetActiveStreaks(PlayerController(Killed));
	}
	// End:0x237
	if(NextGameRules != none)
	{
		NextGameRules.ScoreKill(Killer, Killed);
	}
	//return;	
}

defaultproperties
{
	InvSpreeThresholds[0]=150
	InvSpreeThresholds[1]=350
}
