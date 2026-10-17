class ItemgunFire extends WeaponFire;

function Rotator AdjustAim(Vector Start, float InAimError)
{
	return Instigator.Controller.Rotation;
	//return;	
}

simulated function bool AllowFire()
{
	return true;
	//return;	
}

defaultproperties
{
	bWaitForRelease=true
	bModeExclusive=false
	FireAnimRate=1.5000000
	FireRate=0.2500000
	BotRefireRate=0.3000000
}
