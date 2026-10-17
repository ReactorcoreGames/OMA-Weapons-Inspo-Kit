class HVPCMk5SecondaryFire extends BallisticProProjectileFire;

simulated function bool AllowFire()
{
	// End:0x45
	if(((HVPCMk5PlasmaCannon(Weapon).HeatLevel >= 10.5000000) || HVPCMk5PlasmaCannon(Weapon).bIsVenting) || !super(BallisticFire).AllowFire())
	{
		return false;
	}
	return true;
	//return;	
}

function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	// End:0x38
	if(!HVPCMk5PlasmaCannon(BW).bMilSpec)
	{
		HVPCMk5PlasmaCannon(BW).AddHeat(HeatPerShot);
	}
	//return;	
}

function DoFireEffect()
{
	super(BallisticProjectileFire).DoFireEffect();
	// End:0x53
	if((int(Level.NetMode) == int(NM_DedicatedServer)) && !HVPCMk5PlasmaCannon(BW).bMilSpec)
	{
		HVPCMk5PlasmaCannon(Weapon).AddHeat(HeatPerShot);
	}
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.A48FlashEmitter'
	FlashScaleFactor=0.2000000
	FireRecoil=200.0000000
	FireChaos=0.0250000
	XInaccuracy=16.0000000
	YInaccuracy=16.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-FireAlt',Volume=2.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	HeatPerShot=0.3000000
	FireEndAnim="None"
	FireRate=0.1750000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_HVPCCells'
	ShakeRotMag=(X=16.0000000,Y=4.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.5000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-160.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	ProjectileClass=Class'BWBP_SKC_Pro.HVPCMk5ProjectileSmall'
	WarnTargetPct=0.2000000
}
