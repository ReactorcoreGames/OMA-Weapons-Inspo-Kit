class ONSGrenadeFire extends BioFire;

simulated function bool AllowFire()
{
	// End:0x2D
	if(ONSGrenadeLauncher(Weapon).CurrentGrenades >= ONSGrenadeLauncher(Weapon).MaxGrenades)
	{
		return false;
	}
	return super(WeaponFire).AllowFire();
	//return;	
}

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
	local ONSGrenadeProjectile G;

	G = ONSGrenadeProjectile(super(ProjectileFire).SpawnProjectile(Start, Dir));
	// End:0x8C
	if((G != none) && ONSGrenadeLauncher(Weapon) != none)
	{
		G.SetOwner(Weapon);
		ONSGrenadeLauncher(Weapon).Grenades[ONSGrenadeLauncher(Weapon).Grenades.Length] = G;
		ONSGrenadeLauncher(Weapon).CurrentGrenades++;
	}
	return G;
	//return;	
}

defaultproperties
{
	bSplashDamage=false
	bRecommendSplashDamage=false
	FireRate=0.6500000
	AmmoClass=Class'Onslaught.ONSGrenadeAmmo'
	ProjectileClass=Class'Onslaught.ONSGrenadeProjectile'
}
