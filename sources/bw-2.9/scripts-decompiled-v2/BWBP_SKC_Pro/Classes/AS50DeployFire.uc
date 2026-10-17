class AS50DeployFire extends M353SecondaryFire;

function DoFireEffect()
{
	// End:0x1E
	if(BallisticTurret(Instigator) != none)
	{
		FireAnim = 'Undeploy';		
	}
	else
	{
		AS50Rifle(Weapon).Notify_Deploy();
	}
	//return;	
}

defaultproperties
{
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_50Inc'
}
