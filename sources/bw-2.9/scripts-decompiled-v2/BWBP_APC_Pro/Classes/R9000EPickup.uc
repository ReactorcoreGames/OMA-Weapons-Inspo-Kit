class R9000EPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.ElementalSniper.ESMain');
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.ElementalSniper.ESAmmoMain');
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.ElementalSniper.ESScopeMain');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.R9000E.R9000EPickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.R9000E.R9000EPickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.ElementalSniper.ESMain');
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.ElementalSniper.ESAmmoMain');
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.ElementalSniper.ESScopeMain');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.R9000E.R9000EPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.R9000E.R9000EPickupLo');
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_APC_Static.R9000E.R9000EPickupLo'
	PickupDrawScale=0.5000000
	InventoryType=Class'BWBP_APC_Pro.R9000ERifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the R9000E modular sniper rifle."
	PickupSound=Sound'BW_Core_WeaponSound.R78.R78Putaway'
	StaticMesh=StaticMesh'BWBP_APC_Static.R9000E.R9000EPickupHi'
	Physics=0
	DrawScale=0.3500000
	CollisionHeight=3.0000000
}
