class MutFastWeapSwitch extends Mutator
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

auto state StartUp
{
	function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
	{
		bSuperRelevant = 0;
		// End:0x35
		if(GameReplicationInfo(Other) != none)
		{
			GameReplicationInfo(Other).bFastWeaponSwitching = true;
			GotoState('None');
		}
		// End:0x5B
		if(xPawn(Other) != none)
		{
			xPawn(Other).bCanBoostDodge = true;
		}
		return true;
		//return;		
	}
	stop;	
}

defaultproperties
{
	GroupName="WeapSwitch"
	FriendlyName="UT2003 Style"
	Description="UT2003 style fast weapon switching and boost dodging."
}
