class SniperRiflePickup extends UTWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Shader'XGameShaders.WeaponShaders.WeaponEnvShader');
	L.AddPrecacheMaterial(Texture'XWeapons_rc.Icons.SniperBorder');
	L.AddPrecacheMaterial(Texture'XWeapons_rc.Icons.SniperFocus');
	L.AddPrecacheMaterial(Texture'XWeapons_rc.Icons.SniperArrows');
	L.AddPrecacheMaterial(Texture'Engine.WhiteTexture');
	L.AddPrecacheMaterial(Texture'WeaponSkins.Skins.SniperScreen1');
	L.AddPrecacheMaterial(Texture'WeaponSkins.Skins.SniperScreen1Pan');
	L.AddPrecacheMaterial(Texture'WeaponSkins.Skins.SniperScreen2');
	L.AddPrecacheMaterial(Texture'XEffects.LightningChargeT');
	L.AddPrecacheMaterial(Texture'XEffects.Skins.pcl_BlueSpark');
	L.AddPrecacheMaterial(Texture'XEffects.Skins.LightningBoltT');
	L.AddPrecacheMaterial(Texture'XGameShaders.ZoomFX.fulloverlay');
	L.AddPrecacheMaterial(Texture'XGameShaders.ZoomFX.scanline');
	L.AddPrecacheMaterial(Texture'EmitterTextures.MultiFrame.LargeFlames');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.SniperRiflePickup');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'EmitterTextures.MultiFrame.LargeFlames');
	Level.AddPrecacheMaterial(Shader'XGameShaders.WeaponShaders.WeaponEnvShader');
	Level.AddPrecacheMaterial(Texture'XWeapons_rc.Icons.SniperBorder');
	Level.AddPrecacheMaterial(Texture'XWeapons_rc.Icons.SniperFocus');
	Level.AddPrecacheMaterial(Texture'XWeapons_rc.Icons.SniperArrows');
	Level.AddPrecacheMaterial(Texture'Engine.WhiteTexture');
	Level.AddPrecacheMaterial(Texture'WeaponSkins.Skins.SniperScreen1');
	Level.AddPrecacheMaterial(Texture'WeaponSkins.Skins.SniperScreen1Pan');
	Level.AddPrecacheMaterial(Texture'WeaponSkins.Skins.SniperScreen2');
	Level.AddPrecacheMaterial(Texture'XEffects.LightningChargeT');
	Level.AddPrecacheMaterial(Texture'XEffects.Skins.pcl_BlueSpark');
	Level.AddPrecacheMaterial(Texture'XEffects.Skins.LightningBoltT');
	Level.AddPrecacheMaterial(Texture'XGameShaders.ZoomFX.fulloverlay');
	Level.AddPrecacheMaterial(Texture'XGameShaders.ZoomFX.scanline');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

defaultproperties
{
	MaxDesireability=0.6500000
	InventoryType=Class'XWeapons.SniperRifle'
	PickupMessage="You got the Lightning Gun."
	PickupSound=Sound'PickupSounds.SniperRiflePickup'
	PickupForce="SniperRiflePickup"
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.SniperRiflePickup'
	DrawScale=0.4500000
}
