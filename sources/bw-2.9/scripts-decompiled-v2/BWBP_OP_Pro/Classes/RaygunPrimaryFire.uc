class RaygunPrimaryFire extends BallisticProProjectileFire;

simulated function ModeDoFire()
{
	// End:0x2F
	if(int(Level.NetMode) != int(NM_Client))
	{
		Raygun(BW).bLockSecondary = true;
	}
	super.ModeDoFire();
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	MuzzleFlashClass=Class'BWBP_OP_Pro.RaygunMuzzleFlashAlt'
	FlashScaleFactor=2.5000000
	AimedFireAnim="SightFire"
	FireRecoil=108.0000000
	FireChaos=0.0700000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.1600000,OutVal=1.0000000),(InVal=0.2500000,OutVal=1.5000000),(InVal=0.5000000,OutVal=2.2500000),(InVal=0.7500000,OutVal=3.5000000),(InVal=1.0000000,OutVal=5.0000000)))
	BallisticFireSound=(Sound=Sound'BWBP_OP_Sounds.Raygun.Raygun-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	FireAnim="FireSmall"
	FireEndAnim="None"
	FireRate=0.1500000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_RaygunCells'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-70.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_OP_Pro.RaygunProjectile'
	BotRefireRate=0.7000000
	WarnTargetPct=0.2000000
}
