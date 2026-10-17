class BioFire extends ProjectileFire;

function DrawMuzzleFlash(Canvas Canvas)
{
	// End:0x25
	if(FlashEmitter != none)
	{
		FlashEmitter.SetRotation(Weapon.Rotation);
	}
	super(WeaponFire).DrawMuzzleFlash(Canvas);
	//return;	
}

function float MaxRange()
{
	return 1500.0000000;
	//return;	
}

defaultproperties
{
	ProjSpawnOffset=(X=20.0000000,Y=9.0000000,Z=-6.0000000)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	FireEndAnim="None"
	FireSound=SoundGroup'WeaponSounds.BioRifle.BioRifleFire'
	FireForce="BioRifleFire"
	FireRate=0.3300000
	AmmoClass=Class'XWeapons.BioAmmo'
	AmmoPerFire=1
	ShakeRotMag=(X=70.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=1.8000000
	ShakeOffsetMag=(X=0.0000000,Y=0.0000000,Z=-2.0000000)
	ShakeOffsetRate=(X=0.0000000,Y=0.0000000,Z=1000.0000000)
	ShakeOffsetTime=1.8000000
	ProjectileClass=Class'XWeapons.BioGlob'
	BotRefireRate=0.8000000
	FlashEmitterClass=Class'XEffects.BioMuzFlash1st'
}
