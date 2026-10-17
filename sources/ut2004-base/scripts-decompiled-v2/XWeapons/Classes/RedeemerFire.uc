class RedeemerFire extends ProjectileFire;

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
	local Projectile P;

	P = super.SpawnProjectile(Start, Dir);
	// End:0x40
	if(P == none)
	{
		P = super.SpawnProjectile(Instigator.Location, Dir);
	}
	// End:0x8D
	if(P == none)
	{
		Weapon.Spawn(Class'XEffects.SmallRedeemerExplosion');
		Weapon.HurtRadius(500.0000000, 400.0000000, Class'XWeapons.DamTypeRedeemer', 100000.0000000, Instigator.Location);
	}
	return P;
	//return;	
}

function float MaxRange()
{
	return 20000.0000000;
	//return;	
}

defaultproperties
{
	ProjSpawnOffset=(X=100.0000000,Y=0.0000000,Z=0.0000000)
	bSplashDamage=true
	bRecommendSplashDamage=true
	TransientSoundVolume=1.0000000
	FireSound=Sound'WeaponSounds.Misc.redeemer_shoot'
	FireForce="redeemer_shoot"
	FireRate=1.0000000
	AmmoClass=Class'XWeapons.RedeemerAmmo'
	AmmoPerFire=1
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'XWeapons.RedeemerProjectile'
	BotRefireRate=0.5000000
}
