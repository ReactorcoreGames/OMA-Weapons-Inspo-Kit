class Melee_A73SkrithRifle extends A73SkrithRifle
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

defaultproperties
{
	FireModeClass=Class'BallisticProV55.A73MeleeFire'
	Priority=7
	PickupClass=Class'BallisticProV55.Melee_A73Pickup'
	AttachmentClass=Class'BallisticProV55.Melee_A73Attachment'
	ItemName="Unfireable A73 Skrith Rifle"
}
