class ONSAVRiLPickup extends UTWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'VMWeaponsTX.PlayerWeaponsGroup.AVRiLtex');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.DustSmoke');
	L.AddPrecacheMaterial(Texture'ONSInterface-TX.avrilRETICLE');
	L.AddPrecacheMaterial(Texture'VMWeaponsTX.PlayerWeaponsGroup.LGRreticleRed');
	L.AddPrecacheStaticMesh(StaticMesh'VMWeaponsSM.AVRiLGroup.AVRiLprojectileSM');
	L.AddPrecacheStaticMesh(StaticMesh'VMWeaponsSM.PlayerWeaponsGroup.AVRiLsm');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'VMWeaponsTX.PlayerWeaponsGroup.AVRiLtex');
	Level.AddPrecacheMaterial(Texture'VMparticleTextures.VehicleExplosions.VMExp2_framesANIM');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.DustSmoke');
	Level.AddPrecacheMaterial(Texture'ONSInterface-TX.avrilRETICLE');
	Level.AddPrecacheMaterial(Texture'VMWeaponsTX.PlayerWeaponsGroup.LGRreticleRed');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	super(Actor).UpdatePrecacheStaticMeshes();
	Level.AddPrecacheStaticMesh(StaticMesh'VMWeaponsSM.AVRiLGroup.AVRiLprojectileSM');
	Level.AddPrecacheStaticMesh(StaticMesh'VMWeaponsSM.PlayerWeaponsGroup.AVRiLsm');
	//return;	
}

defaultproperties
{
	StandUp=(X=0.0000000,Y=0.2500000,Z=0.0000000)
	MaxDesireability=0.7000000
	InventoryType=Class'Onslaught.ONSAVRiL'
	PickupMessage="You got the AVRiL."
	PickupSound=Sound'PickupSounds.FlakCannonPickup'
	PickupForce="ONSAVRiLPickup"
	DrawType=8
	StaticMesh=StaticMesh'VMWeaponsSM.PlayerWeaponsGroup.AVRiLsm'
	DrawScale=0.0500000
}
