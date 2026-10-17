class M806Pickup extends BallisticHandgunPickup;

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M806.M806_Main');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.EmptyPistolRound');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M806.PistolMuzzleFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Ammo.M806Clip');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.M806.M806PickupLo'
	PickupDrawScale=0.0700000
	InventoryType=Class'BallisticProV55.M806Pistol'
	RespawnTime=10.0000000
	PickupMessage="You picked up the M806A2 pistol."
	PickupSound=Sound'BW_Core_WeaponSound.M806.M806Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M806.M806PickupHi'
	Physics=0
	DrawScale=0.1200000
	CollisionHeight=4.0000000
}
