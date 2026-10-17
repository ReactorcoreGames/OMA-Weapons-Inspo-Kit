class A800MinigunPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SWC_Tex.SkrithHyperBlaster.Hyperblaster-MainFront');
	L.AddPrecacheMaterial(Texture'BWBP_SWC_Tex.SkrithHyperBlaster.Hyperblaster-MainRear');
	L.AddPrecacheMaterial(Texture'BWBP_SWC_Tex.SkrithHyperBlaster.Minigun_Main3_D');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.A73.A73AmmoSkin');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SWC_Static.SkrithHyperBlaster.SkrithHyperBlasterPickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SWC_Static.SkrithHyperBlaster.SkrithHyperBlasterPickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	super(Actor).UpdatePrecacheMaterials();
	Level.AddPrecacheMaterial(Texture'BWBP_SWC_Tex.SkrithHyperBlaster.Hyperblaster-MainFront');
	Level.AddPrecacheMaterial(Texture'BWBP_SWC_Tex.SkrithHyperBlaster.Hyperblaster-MainRear');
	Level.AddPrecacheMaterial(Texture'BWBP_SWC_Tex.SkrithHyperBlaster.Minigun_Main3_D');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.A73.A73AmmoSkin');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	super(Actor).UpdatePrecacheStaticMeshes();
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SWC_Static.SkrithHyperBlaster.SkrithHyperBlasterPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SWC_Static.SkrithHyperBlaster.SkrithHyperBlasterPickupLo');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BWBP_SWC_Static.SkrithHyperBlaster.SkrithHyperBlasterPickupLo'
	PickupDrawScale=0.4000000
	InventoryType=Class'BWBP_SWC_Pro.A800SkrithMinigun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the A800 Skrith HyperBlaster"
	PickupSound=Sound'BW_Core_WeaponSound.XMV-850.XMV-Putaway'
	StaticMesh=StaticMesh'BWBP_SWC_Static.SkrithHyperBlaster.SkrithHyperBlasterPickupHi'
	bOrientOnSlope=true
	Physics=0
	DrawScale=0.3000000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=35.0000000)
	CollisionHeight=8.0000000
}
