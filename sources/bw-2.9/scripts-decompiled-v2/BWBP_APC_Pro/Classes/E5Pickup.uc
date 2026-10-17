class E5Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.MVPR.MVPR_Weapon_Main');
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.MVPR.MVPR_Weapon2_Main');
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.MVPR.MVPR_Padding_Main');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPR_Glass');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPR-MuzzleFlash');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.MVPR.MVPRPickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.MVPR.MVPRPickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.MVPR.MVPR_Weapon_Main');
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.MVPR.MVPR_Weapon2_Main');
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.MVPR.MVPR_Padding_Main');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPR_Glass');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.MVPR.MVPRPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.MVPR.MVPRPickupLo');
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_APC_Static.MVPR.MVPRPickupLo'
	PickupDrawScale=0.0800000
	InventoryType=Class'BWBP_APC_Pro.E5PlasmaRifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the E-5 'ViPeR'."
	PickupSound=Sound'BW_Core_WeaponSound.A73.A73Putaway'
	StaticMesh=StaticMesh'BWBP_APC_Static.MVPR.MVPRPickupHi'
	Physics=0
	DrawScale=0.1300000
	CollisionHeight=4.5000000
}
