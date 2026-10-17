class E23Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPR_Main');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPR_Glass');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPRMain-SpecMask');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPRGlass-SpecMask');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPRLaserBeam');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPRBolt');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPR-MuzzleFlash');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPR-MuzzleEffect');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.Ripple-VPR');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPRBolt-Flare');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPR-Impact');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.VPR.VPRMuzzleFlash');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.VPR.VPRProjectile');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPR_Main');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPR_Glass');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPRMain-SpecMask');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPRGlass-SpecMask');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPRLaserBeam');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPRBolt');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPR-MuzzleFlash');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPR-MuzzleEffect');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.Ripple-VPR');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPRBolt-Flare');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.VPR.VPR-Impact');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.VPR.VPR-Ammo');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.VPR.VPRMuzzleFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.VPR.VPRPickup-HD');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.VPR.VPRPickup-LD');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.VPR.VPRProjectile');
	//return;	
}

event Landed(Vector HitNormal)
{
	local Rotator R, Dir;
	local Vector X, Y, Z;

	// End:0xCA
	if(bOnSide)
	{
		Dir = Rotator(HitNormal);
		Dir.Pitch -= 16384;
		R.Yaw = Rotation.Yaw;
		GetAxes(R, X, Y, Z);
		X = X >> Dir;
		Y = Y >> Dir;
		Z = Z >> Dir;
		Dir = OrthoRotation(X, Y, Z);
		Dir.Roll -= 16384;
		SetRotation(Dir);
		LandedRot = Rotation;
	}
	GotoState('Pickup', 'Begin');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.VPR.VPRPickup-LD'
	PickupDrawScale=0.2000000
	InventoryType=Class'BallisticProV55.E23PlasmaRifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the E-23 'ViPeR'."
	PickupSound=Sound'BW_Core_WeaponSound.A73.A73Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.VPR.VPRPickup-HD'
	Physics=0
	DrawScale=0.2800000
	CollisionHeight=4.5000000
}
