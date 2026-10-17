class SuperShockAmmo extends ShockAmmo;

simulated function CheckOutOfAmmo()
{
	//return;	
}

simulated function bool UseAmmo(int AmountNeeded, optional bool bAmountNeededIsMax)
{
	return true;
	//return;	
}

defaultproperties
{
	MaxAmmo=1
	InitialAmount=1
}
