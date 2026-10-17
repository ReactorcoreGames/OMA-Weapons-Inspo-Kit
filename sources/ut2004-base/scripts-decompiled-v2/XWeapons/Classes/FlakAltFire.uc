class FlakAltFire extends ProjectileFire;

function InitEffects()
{
	super(WeaponFire).InitEffects();
	// End:0x31
	if(FlashEmitter == none)
	{
		FlashEmitter = Weapon.GetFireMode(0).FlashEmitter;
	}
	//return;	
}

defaultproperties
{
	ProjSpawnOffset=(X=25.0000000,Y=9.0000000,Z=-12.0000000)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	FireAnim="AltFire"
	FireEndAnim="None"
	FireAnimRate=0.9000000
	FireSound=SoundGroup'WeaponSounds.FlakCannon.FlakCannonAltFire'
	FireForce="FlakCannonAltFire"
	FireRate=1.1100000
	AmmoClass=Class'XWeapons.FlakAmmo'
	AmmoPerFire=1
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'XWeapons.FlakShell'
	BotRefireRate=0.5000000
	WarnTargetPct=0.9000000
}
