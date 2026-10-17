class ONSGrenadeAttachment extends xWeaponAttachment;

var xEmitter MuzFlash3rd;

simulated function Destroyed()
{
	// End:0x17
	if(MuzFlash3rd != none)
	{
		MuzFlash3rd.Destroy();
	}
	super(Actor).Destroyed();
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
	Mesh=SkeletalMesh'ONSWeapons-A.GrenadeLauncher_3rd'
	DrawScale=0.1800000
}
