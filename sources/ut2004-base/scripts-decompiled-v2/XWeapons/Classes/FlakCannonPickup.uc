class FlakCannonPickup extends UTWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'XEffects.FlakTrailTex');
	// End:0x41
	if(int(L.DetailMode) != int(0))
	{
		L.AddPrecacheMaterial(Texture'XEffects.Skins.fexpt');
	}
	L.AddPrecacheMaterial(Texture'XEffects.Skins.ExplosionFlashTex');
	L.AddPrecacheMaterial(Texture'XEffects.GoldGlow');
	L.AddPrecacheMaterial(Texture'WeaponSkins.Skins.FlakTex0');
	L.AddPrecacheMaterial(Texture'WeaponSkins.Skins.FlakTex1');
	L.AddPrecacheMaterial(Texture'WeaponSkins.Skins.FlakChunkTex');
	L.AddPrecacheMaterial(Texture'XWeapons.Skins.NewFlakSkin');
	L.AddPrecacheMaterial(Texture'XGameShaders.WeaponShaders.flak_flash');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.FlakChunk');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.FlakShell');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.FlakCannonPickup');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'XEffects.FlakTrailTex');
	// End:0x41
	if(int(Level.DetailMode) != int(0))
	{
		Level.AddPrecacheMaterial(Texture'XEffects.Skins.fexpt');
	}
	Level.AddPrecacheMaterial(Texture'XEffects.Skins.ExplosionFlashTex');
	Level.AddPrecacheMaterial(Texture'XEffects.GoldGlow');
	Level.AddPrecacheMaterial(Texture'WeaponSkins.Skins.FlakTex0');
	Level.AddPrecacheMaterial(Texture'WeaponSkins.Skins.FlakTex1');
	Level.AddPrecacheMaterial(Texture'WeaponSkins.Skins.FlakChunkTex');
	Level.AddPrecacheMaterial(Texture'XWeapons.Skins.NewFlakSkin');
	Level.AddPrecacheMaterial(Texture'XGameShaders.WeaponShaders.flak_flash');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.FlakChunk');
	Level.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.FlakShell');
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

defaultproperties
{
	StandUp=(X=0.0000000,Y=0.0000000,Z=0.2500000)
	MaxDesireability=0.7500000
	InventoryType=Class'XWeapons.FlakCannon'
	PickupMessage="You got the Flak Cannon."
	PickupSound=Sound'PickupSounds.FlakCannonPickup'
	PickupForce="FlakCannonPickup"
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.FlakCannonPickup'
	DrawScale=0.5500000
}
