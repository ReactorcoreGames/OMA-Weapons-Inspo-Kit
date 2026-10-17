class ClassicGrenadeFire extends ClassicRocketMultifire;

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
	return Weapon.Spawn(ProjectileClass,,, Start, Dir);
	//return;	
}

defaultproperties
{
	ProjectileClass=Class'XWeapons.Grenade'
}
