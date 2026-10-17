class ONSHoverBikePlasmaGun extends ONSWeapon
	notplaceable;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaStar');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaHead');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.SmokePanels1');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaStar2');
	L.AddPrecacheMaterial(Texture'EpicParticles.Flares.FlashFlare1');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaHeadDesat');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaStar');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaHead');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.SmokePanels1');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaStar2');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Flares.FlashFlare1');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaHeadDesat');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

state ProjectileFireMode
{
	function AltFire(Controller C)
	{
		//return;		
	}
	stop;	
}

defaultproperties
{
	YawBone="PlasmaGunBarrel"
	YawStartConstraint=57344.0000000
	YawEndConstraint=8192.0000000
	PitchBone="PlasmaGunBarrel"
	WeaponFireAttachmentBone="PlasmaGunBarrel"
	WeaponFireOffset=25.0000000
	DualFireOffset=25.0000000
	RotationsPerSecond=0.8000000
	FireInterval=0.2000000
	AltFireInterval=0.5000000
	FireSoundClass=Sound'ONSVehicleSounds-S.HoverBike.HoverBikeFire01'
	FireForce="HoverBikeFire"
	ProjectileClass=Class'Onslaught.ONSHoverBikePlasmaProjectile'
	AIInfo[0]=(bTossed=false,bTrySplash=false,bLeadTarget=true,bInstantHit=false,bFireOnRelease=false,aimerror=600.0000000,WarnTargetPct=0.0000000,RefireRate=0.9000000)
	AIInfo[1]=(bTossed=false,bTrySplash=false,bLeadTarget=true,bInstantHit=false,bFireOnRelease=false,aimerror=600.0000000,WarnTargetPct=0.0000000,RefireRate=0.9000000)
	Mesh=SkeletalMesh'ONSWeapons-A.PlasmaGun'
}
