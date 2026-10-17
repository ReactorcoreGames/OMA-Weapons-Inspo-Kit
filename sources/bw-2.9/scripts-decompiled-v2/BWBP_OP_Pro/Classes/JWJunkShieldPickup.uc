class JWJunkShieldPickup extends BallisticWeaponPickup;

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.OtherShields.JWSignBack');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.OtherShields.JWSignFace');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.OtherShields.JW2x4');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCut');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCutWood');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.ShieldS.JWJunkShieldPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.ShieldS.JWJunkShieldPickupLo');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.ShieldS.JWJunkShieldPickupLo'
	InventoryType=Class'BWBP_OP_Pro.JWJunkShieldWeapon'
	RespawnTime=10.0000000
	PickupMessage="You picked up a junk shield."
	PickupSound=Sound'BW_Core_WeaponSound.EKS43.EKS-Putaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.ShieldS.JWJunkShieldPickupHi'
	Physics=0
	CollisionHeight=3.5000000
}
