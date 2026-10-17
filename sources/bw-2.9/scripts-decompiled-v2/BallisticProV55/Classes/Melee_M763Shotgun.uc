class Melee_M763Shotgun extends M763Shotgun
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

function float SuggestAttackStyle()
{
	// End:0x1F
	if(AIController(Instigator.Controller) == none)
	{
		return 0.8000000;
	}
	return 0.4000000 + (0.6000000 * (AIController(Instigator.Controller).Skill / float(7)));
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.5000000;
	//return;	
}

defaultproperties
{
	FireModeClass=Class'BallisticProV55.M763MeleeFire'
	Priority=9
	PickupClass=Class'BallisticProV55.Melee_M763Pickup'
	AttachmentClass=Class'BallisticProV55.Melee_M763Attachment'
	ItemName="Unfireable M763 Shotgun"
}
