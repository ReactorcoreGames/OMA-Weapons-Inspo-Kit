class CryoLanceLauncherPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.CryoCannon.Cannon_Cryo_D1');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.CryoLance.CryoCannonPickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.CryoLance.CryoCannonPickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	super(Actor).UpdatePrecacheMaterials();
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.CryoCannon.Cannon_Cryo_D1');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	super(Actor).UpdatePrecacheStaticMeshes();
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.CryoLance.CryoCannonPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.CryoLance.CryoCannonPickupLo');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BWBP_APC_Static.CryoLance.CryoCannonPickupLo'
	InventoryType=Class'BWBP_APC_Pro.CryoLanceLauncher'
	RespawnTime=20.0000000
	PickupMessage="You picked up the Cryo Lance"
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BWBP_APC_Static.CryoLance.CryoCannonPickupHi'
	Physics=0
	DrawScale=0.4000000
	CollisionHeight=4.0000000
}
