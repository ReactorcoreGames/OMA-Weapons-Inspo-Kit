class MDKPickup extends BallisticHandgunPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SWC_Tex.MDK.Main_2D_View');
	L.AddPrecacheMaterial(Texture'BWBP_SWC_Tex.MDK.Attachments_2D_View');
	L.AddPrecacheMaterial(Texture'BWBP_SWC_Tex.MDK.Silencer_2D_View');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SWC_Static.MDK.MDKPickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SWC_Static.MDK.MDKPickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	super(Actor).UpdatePrecacheMaterials();
	Level.AddPrecacheMaterial(Texture'BWBP_SWC_Tex.MDK.Main_2D_View');
	Level.AddPrecacheMaterial(Texture'BWBP_SWC_Tex.MDK.Attachments_2D_View');
	Level.AddPrecacheMaterial(Texture'BWBP_SWC_Tex.MDK.Silencer_2D_View');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	super(Actor).UpdatePrecacheStaticMeshes();
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SWC_Static.MDK.MDKPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SWC_Static.MDK.MDKPickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SWC_Static.MDK.MDKPickupLo'
	PickupDrawScale=0.5250000
	InventoryType=Class'BWBP_SWC_Pro.MDKSubMachinegun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the MDK Modular SubMachine Gun."
	PickupSound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway'
	StaticMesh=StaticMesh'BWBP_SWC_Static.MDK.MDKPickupHi'
	Physics=0
	DrawScale=0.6000000
	CollisionHeight=4.0000000
}
