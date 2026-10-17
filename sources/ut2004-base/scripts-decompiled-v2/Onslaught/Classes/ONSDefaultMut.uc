class ONSDefaultMut extends DMMutator
	config
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	// End:0x54
	if((Controller(Other) != none) && MessagingSpectator(Other) == none)
	{
		Controller(Other).bAdrenalineEnabled = false;
		Controller(Other).PlayerReplicationInfoClass = Class'Onslaught.ONSPlayerReplicationInfo';		
	}
	else
	{
		// End:0x6A
		if(Other.IsA('AdrenalinePickup'))
		{
			return false;
		}
	}
	return true;
	//return;	
}

