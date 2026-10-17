class SKASPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.SKAS.SKASShotgun');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Concrete');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Metal');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Wood');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M763.M763MuzzleFlash');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M763.M763Flash1');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.EmptyShell');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.SKAS.SKASShotgun');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Concrete');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Metal');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Wood');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M763.M763MuzzleFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M763.M763Flash1');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.EmptyShell');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.SKAS.SKASShotgunAmmo');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.SKAS.SKASShotgunPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.SKAS.SKASShotgunPickupLow');
	//return;	
}

auto state Pickup
{
	function BeginState()
	{
		// End:0x36
		if(!bDropped && Class<BallisticWeapon>(InventoryType) != none)
		{
			MagAmmo = Class<BallisticWeapon>(InventoryType).default.MagAmmo;
		}
		super.BeginState();
		//return;		
	}
	stop;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.SKAS.SKASShotgunPickupLow'
	PickupDrawScale=0.6000000
	InventoryType=Class'BWBP_SKC_Pro.SKASShotgun'
	RespawnTime=90.0000000
	PickupMessage="You picked up the SKAS-21 automatic shotgun."
	PickupSound=Sound'BW_Core_WeaponSound.M763.M763Putaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.SKAS.SKASShotgunPickupHi'
	Physics=0
	DrawScale=0.6000000
	CollisionHeight=3.0000000
}
