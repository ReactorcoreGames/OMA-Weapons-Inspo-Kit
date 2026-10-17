class BigWheelsRules extends GameRules
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var MutBigWheels BigWheelsMutator;

function ScoreKill(Controller Killer, Controller Killed)
{
	local Vehicle V;

	// End:0x71
	if((Killer != none) && Killer.Pawn != none)
	{
		V = Vehicle(Killer.Pawn);
		// End:0x71
		if(V != none)
		{
			V.SetWheelsScale(BigWheelsMutator.GetWheelsScaleFor(V.PlayerReplicationInfo));
		}
	}
	// End:0x95
	if(NextGameRules != none)
	{
		NextGameRules.ScoreKill(Killer, Killed);
	}
	//return;	
}

