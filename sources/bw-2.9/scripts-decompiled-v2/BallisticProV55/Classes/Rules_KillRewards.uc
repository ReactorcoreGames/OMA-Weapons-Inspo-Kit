class Rules_KillRewards extends GameRules
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function ScoreKill(Controller Killer, Controller Killed)
{
	local int RewardHealthMax, RewardShieldMax, armorStrength;
	local xPawn KillerPawn;

	super.ScoreKill(Killer, Killed);
	// End:0x40
	if(((Killed == none) || Killer == none) || Killer.Pawn == none)
	{
		return;
	}
	// End:0x83
	if(Vehicle(Killer.Pawn) != none)
	{
		KillerPawn = xPawn(Vehicle(Killer.Pawn).Driver);		
	}
	else
	{
		KillerPawn = xPawn(Killer.Pawn);
	}
	// End:0xBF
	if((KillerPawn == none) || KillerPawn.Health <= 0)
	{
		return;
	}
	RewardHealthMax = Class'BCoreProV55.BallisticReplicationInfo'.default.KillRewardHealthMax;
	// End:0xF4
	if(RewardHealthMax == 0)
	{
		RewardHealthMax = int(KillerPawn.SuperHealthMax);
	}
	RewardShieldMax = Class'BCoreProV55.BallisticReplicationInfo'.default.KillRewardShieldMax;
	// End:0x129
	if(RewardShieldMax == 0)
	{
		RewardShieldMax = int(KillerPawn.ShieldStrengthMax);
	}
	// End:0x176
	if(KillerPawn.Health < RewardHealthMax)
	{
		KillerPawn.Health = Clamp(KillerPawn.Health + Class'BCoreProV55.BallisticReplicationInfo'.default.HealthKillReward, 0, RewardHealthMax);
	}
	// End:0x1EC
	if(KillerPawn.ShieldStrength < float(RewardShieldMax))
	{
		armorStrength = Min(Class'BCoreProV55.BallisticReplicationInfo'.default.ShieldKillReward, int(float(RewardShieldMax) - KillerPawn.ShieldStrength));
		// End:0x1EC
		if(armorStrength > 0)
		{
			xPawn(Killer.Pawn).AddShieldStrength(armorStrength);
		}
	}
	//return;	
}

