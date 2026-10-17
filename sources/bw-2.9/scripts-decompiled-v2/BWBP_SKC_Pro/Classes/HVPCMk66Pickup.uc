class HVPCMk66Pickup extends BallisticWeaponPickup;

var float HeatLevel;
var float HeatTime;

function InitDroppedPickupFor(Inventory Inv)
{
	super.InitDroppedPickupFor(Inv);
	// End:0x48
	if(HVPCMk66PlasmaCannon(Inv) != none)
	{
		HeatLevel = HVPCMk66PlasmaCannon(Inv).HeatLevel;
		HeatTime = Level.TimeSeconds;
	}
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.BFG.BFG-Skin');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Lighter.LightGlassSkin');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.XavPlasCannon.XavPackSkin');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.XavPlasCannon.XavAmmoSkin');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.SparkA1');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.FlareC2');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.LightningBolt2');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.LightningBoltCut2');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.LightningGun.LighterAmmo');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.LightningGun.LighterPack');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.LightningGun.LighterPickupHD');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.LightningGun.LighterPickupLD');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.LightningGun.LighterPickupLD'
	PickupDrawScale=0.2500000
	InventoryType=Class'BWBP_SKC_Pro.HVPCMk66PlasmaCannon'
	RespawnTime=180.0000000
	PickupMessage="You got the Extreme-Voltage Hyper Plasma Cannon 9000."
	PickupSound=Sound'BW_Core_WeaponSound.LightningGun.LG-Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.LightningGun.LighterPickupHD'
	Physics=0
	DrawScale=0.3000000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=-3.0000000)
	Skins[0]=Texture'BWBP_SKC_Tex.BFG.BFG-Skin'
	Skins[1]=FinalBlend'BW_Core_WeaponTex.Lighter.LightGlassFinal'
	Skins[2]=Texture'BWBP_SKC_Tex.XavPlasCannon.XavPackSkin'
	CollisionHeight=4.5000000
}
