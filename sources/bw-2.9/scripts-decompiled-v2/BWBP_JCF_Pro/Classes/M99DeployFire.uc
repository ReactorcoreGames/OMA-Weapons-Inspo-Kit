class M99DeployFire extends M353SecondaryFire;

function DoFireEffect()
{
	// End:0x1E
	if(BallisticTurret(Instigator) != none)
	{
		FireAnim = 'Undeploy';		
	}
	else
	{
		M99Rifle(Weapon).Notify_Deploy();
	}
	//return;	
}

defaultproperties
{
	AmmoClass=Class'BWBP_JCF_Pro.Ammo_50ECSRifle'
}
