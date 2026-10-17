class HydraPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.RL.RL_Main');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.RL.CruRLPickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.RL.CruRLPickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.RL.RL_Main');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.RL.CruRLPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.RL.CruRLPickupLo');
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_APC_Static.RL.CruRLPickupLo'
	PickupDrawScale=0.4000000
	InventoryType=Class'BWBP_APC_Pro.HydraBazooka'
	RespawnTime=60.0000000
	PickupMessage="You picked up the Hydra missile launcher."
	PickupSound=Sound'BW_Core_WeaponSound.G5.G5-Putaway'
	StaticMesh=StaticMesh'BWBP_APC_Static.RL.CruRLPickupHi'
	Physics=0
	DrawScale=0.3000000
	CollisionHeight=6.0000000
}
