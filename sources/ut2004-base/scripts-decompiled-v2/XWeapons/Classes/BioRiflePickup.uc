class BioRiflePickup extends UTWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'XEffects.xbiosplat2');
	L.AddPrecacheMaterial(Texture'XEffects.xbiosplat');
	L.AddPrecacheMaterial(Texture'XGameShaders.WeaponShaders.bio_flash');
	L.AddPrecacheMaterial(Texture'WeaponSkins.BioGoo.BRInnerGoo');
	L.AddPrecacheMaterial(Texture'WeaponSkins.BioGoo.BRInnerBubbles');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.BioRiflePickup');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'XEffects.xbiosplat2');
	Level.AddPrecacheMaterial(Texture'XEffects.xbiosplat');
	Level.AddPrecacheMaterial(Texture'XGameShaders.WeaponShaders.bio_flash');
	Level.AddPrecacheMaterial(Texture'WeaponSkins.BioGoo.BRInnerGoo');
	Level.AddPrecacheMaterial(Texture'WeaponSkins.BioGoo.BRInnerBubbles');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

defaultproperties
{
	MaxDesireability=0.7500000
	InventoryType=Class'XWeapons.BioRifle'
	PickupMessage="You got the Bio-Rifle"
	PickupSound=Sound'PickupSounds.FlakCannonPickup'
	PickupForce="FlakCannonPickup"
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.BioRiflePickup'
	DrawScale=0.6000000
}
