class TargetDesignatorPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Designator.DesignatorBase');
	L.AddPrecacheMaterial(Combiner'BWBP_OP_Tex.Designator.DesignatorScreenModel');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Designator.DesignatorPickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Designator.DesignatorPickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Designator.DesignatorBase');
	Level.AddPrecacheMaterial(Combiner'BWBP_OP_Tex.Designator.DesignatorScreenModel');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Designator.DesignatorPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Designator.DesignatorPickupLo');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.Designator.DesignatorPickupLo'
	PickupDrawScale=1.2500000
	InventoryType=Class'BWBPAirstrikesPro.TargetDesignator'
	RespawnTime=120.0000000
	PickupMessage="You picked up the MAU-52 Target Designator."
	PickupSound=Sound'BW_Core_WeaponSound.R78.R78Putaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.Designator.DesignatorPickupHi'
	Physics=0
	DrawScale=1.4500000
	CollisionHeight=6.0000000
}
