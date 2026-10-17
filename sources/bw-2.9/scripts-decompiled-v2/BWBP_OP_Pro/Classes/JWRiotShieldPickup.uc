class JWRiotShieldPickup extends BallisticWeaponPickup;

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.OtherShields.JWTruncheon');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCut');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCutWood');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.ShieldS.JWRiotShieldPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.ShieldS.JWRiotShieldPickupLo');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.ShieldS.JWRiotShieldPickupLo'
	InventoryType=Class'BWBP_OP_Pro.JWRiotShieldWeapon'
	RespawnTime=10.0000000
	PickupMessage="You picked up a civilion riot shield."
	PickupSound=Sound'BW_Core_WeaponSound.EKS43.EKS-Putaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.ShieldS.JWRiotShieldPickupHi'
	Physics=0
	CollisionHeight=3.5000000
}
