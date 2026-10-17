class MG36SecondaryFire extends M353SecondaryFire;

function DoFireEffect()
{
	// End:0x32
	if(BallisticTurret(Instigator) != none)
	{
		FireAnim = 'Undeploy';
		MG36MG_TW(Weapon).Notify_Undeploy();		
	}
	else
	{
		MG36Machinegun(Weapon).Notify_Deploy();
	}
	//return;	
}

defaultproperties
{
	FireRate=1.0000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_68mm'
}
