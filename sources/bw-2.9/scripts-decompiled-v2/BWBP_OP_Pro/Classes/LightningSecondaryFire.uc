class LightningSecondaryFire extends BallisticProjectileFire;

defaultproperties
{
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	bBrassOnCock=true
	BrassOffset=(X=-10.0000000,Y=1.0000000,Z=-1.0000000)
	MuzzleFlashClass=Class'BWBP_OP_Pro.LightningFlashEmitter'
	FlashScaleFactor=0.6000000
	FireRecoil=400.0000000
	FirePushbackForce=255.0000000
	FireChaos=0.8000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.LS14-EnergyRocket',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	FireEndAnim="None"
	FireRate=0.8000000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_LightningRifle'
	ShakeRotMag=(X=400.0000000,Y=32.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_OP_Pro.LightningProjectile'
	BotRefireRate=0.4000000
	aimerror=800.0000000
}
