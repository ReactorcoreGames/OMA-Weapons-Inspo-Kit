class ONSMineLayerPickup extends UTWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'VMWeaponsTX.PlayerWeaponsGroup.SpiderMineTEX');
	L.AddPrecacheMaterial(Shader'VMWeaponsTX.PlayerWeaponsGroup.ParasiteMineImplantTEXshad');
	L.AddPrecacheMaterial(Texture'VMWeaponsTX.PlayerWeaponsGroup.SpiderMineBLUEtex');
	L.AddPrecacheMaterial(Texture'XGameShaders.WeaponShaders.bio_flash');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.BeamFragment');
	L.AddPrecacheStaticMesh(default.StaticMesh);
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'VMWeaponsTX.PlayerWeaponsGroup.SpiderMineTEX');
	Level.AddPrecacheMaterial(Shader'VMWeaponsTX.PlayerWeaponsGroup.ParasiteMineImplantTEXshad');
	Level.AddPrecacheMaterial(Texture'VMWeaponsTX.PlayerWeaponsGroup.SpiderMineBLUEtex');
	Level.AddPrecacheMaterial(Texture'XGameShaders.WeaponShaders.bio_flash');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.BeamFragment');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

defaultproperties
{
	StandUp=(X=0.0000000,Y=0.2500000,Z=0.0000000)
	MaxDesireability=0.7000000
	InventoryType=Class'Onslaught.ONSMineLayer'
	PickupMessage="You got the Mine Layer."
	PickupSound=Sound'PickupSounds.FlakCannonPickup'
	PickupForce="ONSMineLayerPickup"
	DrawType=8
	StaticMesh=StaticMesh'ONSWeapons-SM.MineLayerPickup'
	DrawScale=0.3000000
}
