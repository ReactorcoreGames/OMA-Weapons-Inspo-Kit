class X82Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.X82.X82Skin');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.X82.X82Spec');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.X82.X83SmokeCore');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.X82.X82Skin');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.X82.X82Spec');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.X82.X83SmokeCore');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.EmptyRifleRound');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.X83.X82A2Mag');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.X83.X83PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.X83.X83PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.X83.X83PickupLo'
	PickupDrawScale=0.4000000
	MaxDesireability=0.7500000
	InventoryType=Class'BWBP_SKC_Pro.X82Rifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the X-83 A1 sniper rifle."
	PickupSound=Sound'BW_Core_WeaponSound.MRL.MRL-BigOn'
	StaticMesh=StaticMesh'BWBP_SKC_Static.X83.X83PickupHi'
	Physics=0
	DrawScale=0.3300000
	CollisionHeight=3.0000000
}
