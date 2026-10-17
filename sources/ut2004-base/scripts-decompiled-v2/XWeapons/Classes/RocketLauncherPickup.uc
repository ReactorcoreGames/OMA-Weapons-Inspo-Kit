class RocketLauncherPickup extends UTWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'WeaponSkins.Skins.RocketShellTex');
	L.AddPrecacheMaterial(Texture'XEffects.RocketFlare');
	L.AddPrecacheMaterial(Texture'XEffects.SmokeAlphab_t');
	L.AddPrecacheMaterial(Texture'EmitterTextures.MultiFrame.rockchunks02');
	L.AddPrecacheMaterial(Texture'EmitterTextures.MultiFrame.fire3');
	L.AddPrecacheMaterial(Texture'EmitterTextures.MultiFrame.LargeFlames');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.RocketProj');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.RocketLauncherPickup');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'EmitterTextures.MultiFrame.fire3');
	Level.AddPrecacheMaterial(Texture'EmitterTextures.MultiFrame.LargeFlames');
	Level.AddPrecacheMaterial(Texture'WeaponSkins.Skins.RocketShellTex');
	Level.AddPrecacheMaterial(Texture'XEffects.RocketFlare');
	Level.AddPrecacheMaterial(Texture'XEffects.SmokeAlphab_t');
	Level.AddPrecacheMaterial(Texture'EmitterTextures.MultiFrame.rockchunks02');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.RocketProj');
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

defaultproperties
{
	MaxDesireability=0.7800000
	InventoryType=Class'XWeapons.RocketLauncher'
	PickupMessage="You got the Rocket Launcher."
	PickupSound=Sound'PickupSounds.RocketLauncherPickup'
	PickupForce="RocketLauncherPickup"
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.RocketLauncherPickup'
	DrawScale=0.4500000
}
