class SuperShockRifle extends ShockRifle
	config(User)
	hidedropdown
	cacheexempt;

simulated event RenderOverlays(Canvas Canvas)
{
	// End:0x65
	if((Instigator.PlayerReplicationInfo.Team != none) && Instigator.PlayerReplicationInfo.Team.TeamIndex == 1)
	{
		ConstantColor'UT2004Weapons.Shaders.ShockControl'.Color = Class'Engine.HUD'.default.BlueColor;		
	}
	else
	{
		ConstantColor'UT2004Weapons.Shaders.ShockControl'.Color = Class'Engine.HUD'.default.RedColor;
	}
	super.RenderOverlays(Canvas);
	//return;	
}

simulated function bool ConsumeAmmo(int Mode, float load, optional bool bAmountNeededIsMax)
{
	return true;
	//return;	
}

simulated function CheckOutOfAmmo()
{
	//return;	
}

function float GetAIRating()
{
	return AIRating;
	//return;	
}

simulated function bool StartFire(int Mode)
{
	bWaitForCombo = false;
	return super.StartFire(Mode);
	//return;	
}

function float RangedAttackTime()
{
	return 0.0000000;
	//return;	
}

function byte BestMode()
{
	return 0;
	//return;	
}

defaultproperties
{
	FireModeClass[0]=Class'XWeapons.SuperShockBeamFire'
	FireModeClass[1]=Class'XWeapons.SuperShockBeamFire'
	AIRating=1.0000000
	bCanThrow=false
	PickupClass=Class'XWeapons.SuperShockRiflePickup'
	ItemName="Super Shock Rifle"
	bNetNotify=false
}
