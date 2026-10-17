class NoneWeaponDummy extends RandomWeaponDummy
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

event PreBeginPlay()
{
	Destroy();
	//return;	
}

defaultproperties
{
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_NoGun'
	ItemName="No Weapon"
}
