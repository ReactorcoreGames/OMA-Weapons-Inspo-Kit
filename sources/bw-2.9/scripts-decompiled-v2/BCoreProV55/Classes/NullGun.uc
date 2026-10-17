class NullGun extends Weapon
	config
	hidedropdown
	cacheexempt;

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

simulated function float RateSelf()
{
	CurrentRating = -99.0000000;
	return CurrentRating;
	//return;	
}

function float GetAIRating()
{
	return AIRating;
	//return;	
}

function bool CanAttack(Actor Other)
{
	local Bot B;

	B = Bot(Instigator.Controller);
	// End:0x5B
	if(B.FindInventoryGoal(0.0005000))
	{
		B.GoalString = "Find weapon";
		B.SetAttractionState();
	}
	return false;
	//return;	
}

defaultproperties
{
	AIRating=-99.0000000
	CurrentRating=-99.0000000
	bCanThrow=false
	Description="item gun."
	InventoryGroup=231
	ItemName="NullGun"
}
