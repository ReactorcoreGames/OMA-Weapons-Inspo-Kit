class ShockRiflePickup extends UTWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	// End:0x3A
	if(Class'XWeapons.ShockRifle'.default.bUseOldWeaponMesh)
	{
		L.AddPrecacheMaterial(Texture'WeaponSkins.Skins.ShockTex0');
		L.AddPrecacheMaterial(Texture'WeaponSkins.ShockLaser.lasermist');
	}
	L.AddPrecacheMaterial(Texture'XEffects.ShockHeatDecal');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_flash');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_flare_a');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_core');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.purple_line');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_sparkle');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_core_low');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_Energy_green_faded');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.Shock_Elec_a');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_gradient_b');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.Shock_ring_a');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.ShockComboFlash');
	L.AddPrecacheMaterial(Texture'XGameShaders.WeaponShaders.shock_muzflash_1st');
	L.AddPrecacheMaterial(Texture'XGameShaders.WeaponShaders.shock_muzflash_3rd');
	L.AddPrecacheMaterial(Texture'XWeapons_rc.Effects.ShockBeamTex');
	L.AddPrecacheMaterial(Texture'XEffects.SaDScorcht');
	L.AddPrecacheMaterial(Texture'DeployableTex.Effects.C_T_Electricity_SG');
	L.AddPrecacheMaterial(Texture'UT2004Weapons.Shaders.ShockRipple');
	L.AddPrecacheStaticMesh(StaticMesh'Editor.TexPropSphere');
	L.AddPrecacheStaticMesh(StaticMesh'NewWeaponPickups.ShockPickupSM');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	// End:0x3A
	if(Class'XWeapons.ShockRifle'.default.bUseOldWeaponMesh)
	{
		Level.AddPrecacheMaterial(Texture'WeaponSkins.Skins.ShockTex0');
		Level.AddPrecacheMaterial(Texture'WeaponSkins.ShockLaser.lasermist');
	}
	Level.AddPrecacheMaterial(Texture'XEffects.ShockHeatDecal');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_flash');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_flare_a');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_core');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.purple_line');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_sparkle');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_core_low');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_Energy_green_faded');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.Shock_Elec_a');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_gradient_b');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.Shock_ring_a');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.ShockComboFlash');
	Level.AddPrecacheMaterial(Texture'XGameShaders.WeaponShaders.shock_muzflash_1st');
	Level.AddPrecacheMaterial(Texture'XGameShaders.WeaponShaders.shock_muzflash_3rd');
	Level.AddPrecacheMaterial(Texture'XWeapons_rc.Effects.ShockBeamTex');
	Level.AddPrecacheMaterial(Texture'DeployableTex.Effects.C_T_Electricity_SG');
	Level.AddPrecacheMaterial(Texture'XEffects.SaDScorcht');
	Level.AddPrecacheMaterial(Texture'UT2004Weapons.Shaders.ShockRipple');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'Editor.TexPropSphere');
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

defaultproperties
{
	StandUp=(X=0.0000000,Y=0.2500000,Z=0.0000000)
	MaxDesireability=0.6300000
	InventoryType=Class'XWeapons.ShockRifle'
	PickupMessage="You got the Shock Rifle."
	PickupSound=Sound'PickupSounds.ShockRiflePickup'
	PickupForce="ShockRiflePickup"
	DrawType=8
	StaticMesh=StaticMesh'NewWeaponPickups.ShockPickupSM'
	DrawScale=0.5500000
	Skins[0]=Texture'UT2004Weapons.NewWeaps.ShockRifleTex0'
	Skins[1]=FinalBlend'UT2004Weapons.Shaders.PurpleShockFinal'
}
