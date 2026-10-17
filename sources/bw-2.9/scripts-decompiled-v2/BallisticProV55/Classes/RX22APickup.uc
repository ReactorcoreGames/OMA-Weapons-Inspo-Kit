class RX22APickup extends BallisticWeaponPickup;

function SetWeaponStay()
{
	bWeaponStay = false;
	//return;	
}

function float GetRespawnTime()
{
	return RespawnTime;
	//return;	
}

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.RX22A.RX22AShield');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.RX22A.RX22ASign');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.RX22A.RX22ATank');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.RX22A.RX22ASkin');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerCanHeater');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerTank');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.RX22A.RX22AShield');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.RX22A.RX22ASign');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.RX22A.RX22ATank');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.RX22A.RX22ASkin');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerPickup');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerPickupLD');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerCanHeater');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerTank');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerPickupLD'
	PickupDrawScale=0.3500000
	InventoryType=Class'BallisticProV55.RX22AFlamer'
	RespawnTime=60.0000000
	PickupMessage="You picked up the RX-22A flamethrower."
	PickupSound=Sound'BW_Core_WeaponSound.RX22A.RX22A-Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerPickup'
	Physics=0
	DrawScale=0.3500000
	CollisionHeight=5.0000000
}
