class X82SecondaryFire extends M353SecondaryFire;

function DoFireEffect()
{
	// End:0x32
	if(BallisticTurret(Instigator) != none)
	{
		FireAnim = 'Undeploy';
		X82Rifle_TW(Weapon).Notify_Undeploy();		
	}
	else
	{
		X82Rifle(Weapon).Notify_Deploy();
	}
	//return;	
}

defaultproperties
{
	FireRate=1.0000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_50BMG'
}
