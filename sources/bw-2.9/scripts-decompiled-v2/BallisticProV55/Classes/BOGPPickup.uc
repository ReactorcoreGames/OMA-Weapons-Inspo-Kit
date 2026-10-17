class BOGPPickup extends BallisticHandgunPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.BOGP.BOGP_Main');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BOGP.BOGP_Grenade');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.BOGP.BOGP_Main');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BOGP.BOGP_PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BOGP.BOGP_PickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BOGP.BOGP_AmmoPickup');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BOGP.BOGP_Grenade');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.BOGP.BOGP_PickupLo'
	PickupDrawScale=0.5000000
	InventoryType=Class'BallisticProV55.BOGPPistol'
	RespawnTime=10.0000000
	PickupMessage="You picked up the BORT-85 grenade pistol."
	PickupSound=Sound'BW_Core_WeaponSound.M806.M806Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.BOGP.BOGP_PickupHi'
	Physics=0
	DrawScale=0.8000000
	CollisionHeight=4.0000000
}
