class RedeemerPickup extends UTWeaponPickup;

var Material PrecacheHUDTextures[4];

function PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	// End:0x26
	if(Level.Game.IsA('xMutantGame'))
	{
		Destroy();
	}
	//return;	
}

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
	local int i;

	i = 0;
	J0x07:

	// End:0x37 [Loop If]
	if(i < 4)
	{
		L.AddPrecacheMaterial(default.PrecacheHUDTextures[i]);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	L.AddPrecacheMaterial(Texture'EpicParticles.Smoke.Smokepuff2');
	L.AddPrecacheMaterial(Texture'EpicParticles.Fire.IonBurn');
	L.AddPrecacheMaterial(Texture'EpicParticles.Smoke.IonWave');
	L.AddPrecacheMaterial(Texture'EpicParticles.Flares.BurnFlare1');
	L.AddPrecacheMaterial(Texture'EpicParticles.Beams.WhiteStreak01aw');
	L.AddPrecacheMaterial(Texture'EpicParticles.Smoke.Smokepuff');
	L.AddPrecacheMaterial(Texture'EpicParticles.Flares.SoftFlare');
	L.AddPrecacheMaterial(Texture'WeaponSkins.Skins.RDMR_Missile');
	L.AddPrecacheMaterial(Texture'AW-2004Explosions.Fire.Part_explode2');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.RedeemerPickup');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.RedeemerMissile');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x37 [Loop If]
	if(i < 4)
	{
		Level.AddPrecacheMaterial(default.PrecacheHUDTextures[i]);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	Level.AddPrecacheMaterial(Texture'EpicParticles.Smoke.Smokepuff2');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Fire.IonBurn');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Smoke.IonWave');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Flares.BurnFlare1');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Beams.WhiteStreak01aw');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Smoke.Smokepuff');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Flares.SoftFlare');
	Level.AddPrecacheMaterial(Texture'WeaponSkins.Skins.RDMR_Missile');
	Level.AddPrecacheMaterial(Texture'AW-2004Explosions.Fire.Part_explode2');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.RedeemerMissile');
	Level.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.RedeemerPickup');
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

defaultproperties
{
	PrecacheHUDTextures[0]=Texture'2K4Hud.ZoomFX.RedeemerInnerScope'
	PrecacheHUDTextures[1]=Texture'2K4Hud.ZoomFX.RedeemerOuterEdge'
	PrecacheHUDTextures[2]=Texture'2K4Hud.ZoomFX.RedeemerOuterScope'
	PrecacheHUDTextures[3]=Texture'2K4Hud.ZoomFX.RDM_Altitude'
	bWeaponStay=false
	MaxDesireability=1.0000000
	InventoryType=Class'XWeapons.Redeemer'
	RespawnTime=120.0000000
	PickupMessage="You got the Redeemer."
	PickupSound=Sound'PickupSounds.FlakCannonPickup'
	PickupForce="FlakCannonPickup"
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.RedeemerPickup'
	DrawScale=0.9000000
}
