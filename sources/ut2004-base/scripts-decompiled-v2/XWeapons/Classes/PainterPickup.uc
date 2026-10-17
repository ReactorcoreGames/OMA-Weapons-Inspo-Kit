class PainterPickup extends UTWeaponPickup;

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
	L.AddPrecacheMaterial(Texture'XEffectMat.Ion.painter_beam');
	L.AddPrecacheMaterial(Texture'XEffectMat.Ion.ion_grey');
	L.AddPrecacheMaterial(Texture'XEffectMat.Ion.Ion_beam');
	L.AddPrecacheMaterial(Texture'EpicParticles.Smoke.Smokepuff2');
	L.AddPrecacheMaterial(Texture'EpicParticles.Fire.IonBurn2');
	L.AddPrecacheMaterial(Texture'EpicParticles.Flares.BurnFlare1');
	L.AddPrecacheMaterial(Texture'EpicParticles.Beams.WhiteStreak01aw');
	L.AddPrecacheMaterial(Texture'EpicParticles.Smoke.Smokepuff');
	L.AddPrecacheMaterial(Texture'EpicParticles.Flares.SoftFlare');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.PainterPickup');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'XEffectMat.Ion.painter_beam');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Ion.ion_grey');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Ion.Ion_beam');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Smoke.Smokepuff2');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Fire.IonBurn2');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Flares.BurnFlare1');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Beams.WhiteStreak01aw');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Smoke.Smokepuff');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Flares.SoftFlare');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

defaultproperties
{
	bWeaponStay=false
	MaxDesireability=1.5000000
	InventoryType=Class'XWeapons.Painter'
	RespawnTime=120.0000000
	PickupMessage="You got the Ion Painter."
	PickupSound=Sound'PickupSounds.LinkGunPickup'
	PickupForce="LinkGunPickup"
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.PainterPickup'
	DrawScale=0.6000000
}
