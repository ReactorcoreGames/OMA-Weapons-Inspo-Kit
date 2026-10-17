class BallisticShieldPickup extends BallisticWeaponPickup;

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Shader'BWBP_OP_Tex.BallisticShield.BallisticShieldShiny');
	Level.AddPrecacheMaterial(FinalBlend'BW_Core_WeaponTex.RiotShield.RiotShieldFinal');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCut');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCutWood');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.ShieldS.BallisticShieldPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.ShieldS.BallisticShieldPickupLo');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.ShieldS.BallisticShieldPickupLo'
	InventoryType=Class'BWBP_OP_Pro.BallisticShieldWeapon'
	RespawnTime=10.0000000
	PickupMessage="You picked up a ballistic shield."
	PickupSound=Sound'BW_Core_WeaponSound.EKS43.EKS-Putaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.ShieldS.BallisticShieldPickupHi'
	Physics=0
	CollisionHeight=3.5000000
}
