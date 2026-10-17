class CYLOPickup extends BallisticWeaponPickup;

var float HeatLevel;
var float HeatTime;

function InitDroppedPickupFor(Inventory Inv)
{
	super.InitDroppedPickupFor(Inv);
	// End:0x48
	if(CYLOUAW(Inv) != none)
	{
		HeatLevel = CYLOUAW(Inv).HeatLevel;
		HeatTime = Level.TimeSeconds;
	}
	//return;	
}

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.CYLO.UAW');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.CYLO.CYLOMag');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.CYLO.UAW');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.CYLO.CYLOMag');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.CYLO.CYLOUAWHigh');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.CYLO.CYLOUAWLow');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.CYLO.CYLOUAWLow'
	InventoryType=Class'BWBP_SKC_Pro.CYLOUAW'
	RespawnTime=20.0000000
	PickupMessage="You picked up the CYLO urban assault weapon."
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.CYLO.CYLOUAWHigh'
	Physics=0
	CollisionHeight=4.0000000
}
