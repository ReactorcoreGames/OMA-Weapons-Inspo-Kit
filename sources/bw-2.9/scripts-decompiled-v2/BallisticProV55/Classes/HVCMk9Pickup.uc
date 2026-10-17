class HVCMk9Pickup extends BallisticWeaponPickup;

var float HeatLevel;
var float HeatTime;

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

function InitDroppedPickupFor(Inventory Inv)
{
	super.InitDroppedPickupFor(Inv);
	// End:0x48
	if(HVCMk9LightningGun(Inv) != none)
	{
		HeatLevel = HVCMk9LightningGun(Inv).HeatLevel;
		HeatTime = Level.TimeSeconds;
	}
	//return;	
}

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Lighter.LightGunSkin');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Lighter.LightGlassSkin');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Lighter.LighterPackSkin');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Lighter.LighterAmmoSkin');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.SparkA1');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.FlareC2');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.LightningBolt2');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.LightningBoltCut2');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.LightningGun.LighterPack');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Lighter.LightGunSkin');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Lighter.LightGlassSkin');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Lighter.LighterPackSkin');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Lighter.LighterAmmoSkin');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.SparkA1');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.FlareC2');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.LightningBolt2');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.LightningBoltCut2');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.LightningGun.LighterAmmo');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.LightningGun.LighterPack');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.LightningGun.LighterPickupHD');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.LightningGun.LighterPickupLD');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.LightningGun.LighterPickupLD'
	PickupDrawScale=0.2500000
	InventoryType=Class'BallisticProV55.HVCMk9LightningGun'
	RespawnTime=120.0000000
	PickupMessage="You got the HVC-Mk9 lightning gun."
	PickupSound=Sound'BW_Core_WeaponSound.LightningGun.LG-Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.LightningGun.LighterPickupHD'
	Physics=0
	DrawScale=0.2800000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=-3.0000000)
	CollisionHeight=4.5000000
}
