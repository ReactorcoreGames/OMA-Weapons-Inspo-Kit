class MinigunPickup extends UTWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'XEffects.ShellCasingTex');
	L.AddPrecacheMaterial(Texture'AW-2004Explosions.Fire.Part_explode2s');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.TracerShot');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.MinigunPickup');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'XEffects.ShellCasingTex');
	Level.AddPrecacheMaterial(Texture'AW-2004Explosions.Fire.Part_explode2s');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.TracerShot');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

defaultproperties
{
	MaxDesireability=0.7300000
	InventoryType=Class'XWeapons.Minigun'
	PickupMessage="You got the Minigun."
	PickupSound=Sound'PickupSounds.MinigunPickup'
	PickupForce="MinigunPickup"
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.MinigunPickup'
	DrawScale=0.5000000
}
