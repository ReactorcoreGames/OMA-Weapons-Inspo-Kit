class TargetDesignatorScopeFire extends BallisticScopeFire;

function Timer()
{
	BW.bNeedReload = false;
	// End:0x2C
	if(int(Weapon.Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x52
	if(!Weapon.AmmoMaxed(0))
	{
		Weapon.AddAmmo(1, 0);
	}
	//return;	
}

