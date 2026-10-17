class ONSGrenadePickup extends UTWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'VMWeaponsTX.PlayerWeaponsGroup.GrenadeTex');
	L.AddPrecacheMaterial(Texture'EpicParticles.Smoke.Smokepuff2');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.GrenadeTest');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.AirBlast');
	L.AddPrecacheStaticMesh(StaticMesh'VMWeaponsSM.PlayerWeaponsGroup.VMGrenade');
	L.AddPrecacheStaticMesh(default.StaticMesh);
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'VMWeaponsTX.PlayerWeaponsGroup.GrenadeTex');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Smoke.Smokepuff2');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.GrenadeTest');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.AirBlast');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	super(Actor).UpdatePrecacheStaticMeshes();
	Level.AddPrecacheStaticMesh(StaticMesh'VMWeaponsSM.PlayerWeaponsGroup.VMGrenade');
	//return;	
}

defaultproperties
{
	StandUp=(X=0.0000000,Y=0.2500000,Z=0.0000000)
	MaxDesireability=0.7000000
	InventoryType=Class'Onslaught.ONSGrenadeLauncher'
	PickupMessage="You got the Grenade Launcher."
	PickupSound=Sound'PickupSounds.FlakCannonPickup'
	PickupForce="ONSGrenadePickup"
	DrawType=8
	StaticMesh=StaticMesh'ONSWeapons-SM.GrenadeLauncherPickup'
	DrawScale=0.2500000
}
