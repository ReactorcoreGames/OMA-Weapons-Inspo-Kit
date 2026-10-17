class SK410SecondaryFire extends BallisticProProjectileFire;

simulated function Vector GetFireSpread()
{
	local float fX;
	local Rotator R;

	// End:0x19
	if(BW.bScopeView)
	{
		return super.GetFireSpread();
	}
	fX = FRand();
	R.Yaw = int((float(600) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
	R.Pitch = int((float(600) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
	return Vector(R);
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	BrassClass=Class'BWBP_SKC_Pro.Brass_ShotgunHE'
	BrassOffset=(X=-1.0000000,Y=0.0000000,Z=-1.0000000)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SK410HeatEmitter'
	FlashScaleFactor=0.5000000
	AimedFireAnim="SightFire"
	FireRecoil=650.0000000
	FirePushbackForce=180.0000000
	FireChaos=0.4500000
	XInaccuracy=384.0000000
	YInaccuracy=384.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.M781.M781-FireFRAG',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bTossed=true
	FireEndAnim="None"
	FireAnimRate=1.2500000
	FireRate=0.6500000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_8GaugeHE'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-12.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.SK410HEProjectile'
	BotRefireRate=0.6000000
	WarnTargetPct=0.4000000
}
