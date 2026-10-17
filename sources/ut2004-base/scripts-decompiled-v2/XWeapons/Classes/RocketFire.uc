class RocketFire extends ProjectileFire;

function PlayFireEnd()
{
	//return;	
}

function InitEffects()
{
	super(WeaponFire).InitEffects();
	// End:0x2A
	if(FlashEmitter != none)
	{
		Weapon.AttachToBone(FlashEmitter, 'tip');
	}
	//return;	
}

function PlayFiring()
{
	super(WeaponFire).PlayFiring();
	RocketLauncher(Weapon).PlayFiring(true);
	//return;	
}

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
	local Projectile P;

	P = RocketLauncher(Weapon).SpawnProjectile(Start, Dir);
	// End:0x44
	if(P != none)
	{
		P.Damage *= DamageAtten;
	}
	return P;
	//return;	
}

defaultproperties
{
	ProjSpawnOffset=(X=25.0000000,Y=6.0000000,Z=-6.0000000)
	bSplashDamage=true
	bSplashJump=true
	bRecommendSplashDamage=true
	TweenTime=0.0000000
	FireSound=SoundGroup'WeaponSounds.RocketLauncher.RocketLauncherFire'
	FireForce="RocketLauncherFire"
	FireRate=0.9000000
	AmmoClass=Class'XWeapons.RocketAmmo'
	AmmoPerFire=1
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'XWeapons.RocketProj'
	BotRefireRate=0.5000000
	WarnTargetPct=0.9000000
	FlashEmitterClass=Class'XEffects.RocketMuzFlash1st'
}
