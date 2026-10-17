class ShockProjFire extends ProjectileFire;

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

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
	local Projectile P;

	P = super.SpawnProjectile(Start, Dir);
	// End:0x63
	if((ShockRifle(Instigator.Weapon) != none) && P != none)
	{
		ShockRifle(Instigator.Weapon).SetComboTarget(ShockProjectile(P));
	}
	return P;
	//return;	
}

defaultproperties
{
	ProjSpawnOffset=(X=24.0000000,Y=8.0000000,Z=0.0000000)
	bSplashDamage=true
	TransientSoundVolume=0.4000000
	FireAnim="AltFire"
	FireAnimRate=1.5000000
	FireSound=SoundGroup'WeaponSounds.ShockRifle.ShockRifleAltFire'
	FireForce="ShockRifleAltFire"
	FireRate=0.6000000
	AmmoClass=Class'XWeapons.ShockAmmo'
	AmmoPerFire=1
	ShakeRotMag=(X=60.0000000,Y=20.0000000,Z=0.0000000)
	ShakeRotRate=(X=1000.0000000,Y=1000.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ProjectileClass=Class'XWeapons.ShockProjectile'
	BotRefireRate=0.3500000
	FlashEmitterClass=Class'XEffects.ShockProjMuzFlash'
}
