class BallAttachment extends xWeaponAttachment;

function InitFor(Inventory i)
{
	super.InitFor(i);
	//return;	
}

simulated event ThirdPersonEffects()
{
	super.ThirdPersonEffects();
	//return;	
}

defaultproperties
{
	bHeavy=true
	Mesh=SkeletalMesh'Weapons.BallLauncher_3rd'
}
