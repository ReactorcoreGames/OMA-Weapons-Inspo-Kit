class RS04Pickup extends BallisticHandgunPickup;

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.RS04.RS04-Main');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.RS04.RS04PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.RS04.RS04PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.RS04.RS04PickupLo'
	PickupDrawScale=0.6000000
	InventoryType=Class'BWBP_SKC_Pro.RS04Pistol'
	RespawnTime=20.0000000
	PickupMessage="You picked up the RS04 .45 Compact"
	PickupSound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.RS04.RS04PickupHi'
	Physics=0
	CollisionHeight=4.0000000
}
