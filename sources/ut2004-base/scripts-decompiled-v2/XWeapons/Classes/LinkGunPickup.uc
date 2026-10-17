class LinkGunPickup extends UTWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	// End:0x26
	if(Class'XWeapons.LinkGun'.default.bUseOldWeaponMesh)
	{
		L.AddPrecacheMaterial(Texture'WeaponSkins.Skins.LinkTex0');
	}
	L.AddPrecacheMaterial(Texture'XEffectMat.Link.link_muz_green');
	L.AddPrecacheMaterial(Texture'XEffectMat.Link.link_muzmesh_green');
	L.AddPrecacheMaterial(Texture'XEffectMat.Link.link_beam_green');
	L.AddPrecacheMaterial(Texture'XEffectMat.Link.link_spark_green');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaShaft');
	L.AddPrecacheMaterial(Texture'XEffectMat.Link.link_muz_blue');
	L.AddPrecacheMaterial(Texture'XEffectMat.Link.link_beam_blue');
	L.AddPrecacheMaterial(Texture'XEffectMat.Link.link_muz_red');
	L.AddPrecacheMaterial(Texture'XEffectMat.Link.link_beam_red');
	L.AddPrecacheMaterial(Texture'XEffectMat.Link.link_muz_yellow');
	L.AddPrecacheMaterial(Texture'XEffectMat.Link.link_muzmesh_yellow');
	L.AddPrecacheMaterial(Texture'XEffectMat.Link.link_beam_yellow');
	L.AddPrecacheMaterial(Texture'XEffectMat.Link.link_spark_yellow');
	L.AddPrecacheMaterial(Texture'UT2004Weapons.NewWeaps.LinkPowerBlue');
	L.AddPrecacheMaterial(Texture'UT2004Weapons.NewWeaps.LinkPowerRed');
	L.AddPrecacheMaterial(Texture'EpicParticles.Flares.FlickerFlare');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.LinkProjectile');
	L.AddPrecacheStaticMesh(StaticMesh'NewWeaponPickups.LinkPickupSM');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	// End:0x26
	if(Class'XWeapons.LinkGun'.default.bUseOldWeaponMesh)
	{
		Level.AddPrecacheMaterial(Texture'WeaponSkins.Skins.LinkTex0');
	}
	Level.AddPrecacheMaterial(Texture'XEffectMat.Link.link_muz_green');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Link.link_muzmesh_green');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Link.link_beam_green');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Link.link_spark_green');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Link.link_muz_blue');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Link.link_beam_blue');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Link.link_muz_red');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Link.link_beam_red');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaShaft');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Link.link_muz_yellow');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Link.link_muzmesh_yellow');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Link.link_beam_yellow');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Link.link_spark_yellow');
	Level.AddPrecacheMaterial(Texture'UT2004Weapons.NewWeaps.LinkPowerBlue');
	Level.AddPrecacheMaterial(Texture'UT2004Weapons.NewWeaps.LinkPowerRed');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Flares.FlickerFlare');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.LinkProjectile');
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

function float BotDesireability(Pawn Bot)
{
	local Bot B;
	local DestroyableObjective O;

	B = Bot(Bot.Controller);
	// End:0x10E
	if((B != none) && B.Squad != none)
	{
		O = DestroyableObjective(B.Squad.SquadObjective);
		// End:0x10E
		if(((((O != none) && O.TeamLink(B.GetTeamNum())) && O.Health < O.DamageCapacity) && VSize(Bot.Location - O.Location) < float(2000)) && (AllowRepeatPickup()) || Bot.FindInventoryType(InventoryType) == none)
		{
			return MaxDesireability * float(2);
		}
	}
	return super(WeaponPickup).BotDesireability(Bot);
	//return;	
}

defaultproperties
{
	StandUp=(X=0.0000000,Y=0.2500000,Z=0.0000000)
	MaxDesireability=0.7000000
	InventoryType=Class'XWeapons.LinkGun'
	PickupMessage="You got the Link Gun."
	PickupSound=Sound'PickupSounds.LinkGunPickup'
	PickupForce="LinkGunPickup"
	DrawType=8
	StaticMesh=StaticMesh'NewWeaponPickups.LinkPickupSM'
	DrawScale=0.6500000
}
