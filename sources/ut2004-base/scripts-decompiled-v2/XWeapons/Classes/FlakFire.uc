class FlakFire extends ProjectileFire;

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

defaultproperties
{
	ProjPerFire=9
	ProjSpawnOffset=(X=25.0000000,Y=5.0000000,Z=-6.0000000)
	FireEndAnim="None"
	FireAnimRate=0.9500000
	FireSound=SoundGroup'WeaponSounds.FlakCannon.FlakCannonFire'
	FireForce="FlakCannonFire"
	FireRate=0.8947000
	AmmoClass=Class'XWeapons.FlakAmmo'
	AmmoPerFire=1
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'XWeapons.FlakChunk'
	BotRefireRate=0.7000000
	FlashEmitterClass=Class'XEffects.FlakMuzFlash1st'
	Spread=1400.0000000
	SpreadStyle=1
}
