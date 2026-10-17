class ScarabPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.Grenade.Grenade_Weapon_Tex');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.CruGren.CruGrenPickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.CruGren.CruGrenPickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.Grenade.Grenade_Weapon_Tex');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.CruGren.CruGrenPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.CruGren.CruGrenPickupLo');
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BWBP_APC_Static.CruGren.CruGrenPickupLo'
	PickupDrawScale=0.2000000
	bWeaponStay=false
	InventoryType=Class'BWBP_APC_Pro.ScarabGrenade'
	RespawnTime=20.0000000
	PickupMessage="You picked up the NRX-82 'Scarab' grenade."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.GrenadePickup'
	StaticMesh=StaticMesh'BWBP_APC_Static.CruGren.CruGrenPickupHi'
	bOrientOnSlope=true
	Physics=0
	DrawScale=0.4000000
	CollisionHeight=5.6000000
}
