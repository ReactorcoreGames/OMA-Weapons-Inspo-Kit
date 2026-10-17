class M925SecondaryFire extends M353SecondaryFire;

function DoFireEffect()
{
	// End:0x1E
	if(BallisticTurret(Instigator) != none)
	{
		FireAnim = 'Undeploy';		
	}
	else
	{
		M925Machinegun(Weapon).Notify_Deploy();
	}
	//return;	
}

defaultproperties
{
	AmmoClass=Class'BallisticProV55.Ammo_50CalBelt'
}
