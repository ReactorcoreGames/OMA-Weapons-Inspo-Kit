class ZoomSuperShockBeamFire extends SuperShockBeamFire
	config;

var config bool bAllowMultiHit;

function bool AllowMultiHit()
{
	return bAllowMultiHit;
	//return;	
}

defaultproperties
{
	bAllowMultiHit=true
	DamageType=Class'XWeapons.ZoomSuperShockBeamDamage'
}
