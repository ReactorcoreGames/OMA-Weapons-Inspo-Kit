class ClassicSniperRiflePickup extends UTWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Shader'XGameShaders.WeaponShaders.WeaponEnvShader');
	L.AddPrecacheMaterial(Texture'NewSniperRifle.1stPerson.CogAssaultZoomedCrosshair');
	L.AddPrecacheMaterial(Texture'NewSniperRifle.1stPerson.NewSniper1');
	L.AddPrecacheMaterial(Texture'NewSniperRifle.1stPerson.sniper2');
	L.AddPrecacheMaterial(Texture'Engine.WhiteTexture');
	L.AddPrecacheStaticMesh(StaticMesh'NewWeaponStatic.newsniperpickup');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Shader'XGameShaders.WeaponShaders.WeaponEnvShader');
	Level.AddPrecacheMaterial(Texture'NewSniperRifle.1stPerson.CogAssaultZoomedCrosshair');
	Level.AddPrecacheMaterial(Texture'NewSniperRifle.1stPerson.NewSniper1');
	Level.AddPrecacheMaterial(Texture'NewSniperRifle.1stPerson.sniper2');
	Level.AddPrecacheMaterial(Texture'Engine.WhiteTexture');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

defaultproperties
{
	MaxDesireability=0.7500000
	InventoryType=Class'UTClassic.ClassicSniperRifle'
	PickupMessage="You got the Sniper Rifle."
	PickupSound=Sound'NewWeaponSounds.NewSniper_load'
	PickupForce="SniperRiflePickup"
	DrawType=8
	StaticMesh=StaticMesh'NewWeaponStatic.newsniperpickup'
	DrawScale=0.2100000
}
