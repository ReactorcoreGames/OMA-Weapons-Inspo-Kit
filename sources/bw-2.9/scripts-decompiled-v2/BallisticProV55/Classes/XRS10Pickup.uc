class XRS10Pickup extends BallisticHandgunPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Shader'BW_Core_WeaponTex.XRS10.XRS10Shiney');
	L.AddPrecacheMaterial(Shader'BW_Core_WeaponTex.XRS10.XRS10LaserShiney');
	L.AddPrecacheMaterial(Shader'BW_Core_WeaponTex.XRS10.XRS10SilencerShiney');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Shader'BW_Core_WeaponTex.XRS10.XRS10Shiney');
	Level.AddPrecacheMaterial(Shader'BW_Core_WeaponTex.XRS10.XRS10LaserShiney');
	Level.AddPrecacheMaterial(Shader'BW_Core_WeaponTex.XRS10.XRS10SilencerShiney');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.XRS10.XRS10Clips');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.XRS10.XRS10PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.XRS10.XRS10PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.XRS10.XRS10PickupLo'
	PickupDrawScale=0.1900000
	InventoryType=Class'BallisticProV55.XRS10SubMachinegun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the XRS-10 machine pistol."
	PickupSound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.XRS10.XRS10PickupHi'
	Physics=0
	DrawScale=0.2200000
	PrePivot=(X=0.0000000,Y=-20.0000000,Z=0.0000000)
	CollisionHeight=4.0000000
}
