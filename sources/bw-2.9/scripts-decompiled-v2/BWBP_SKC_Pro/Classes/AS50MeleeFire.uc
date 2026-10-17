class AS50MeleeFire extends BallisticMeleeFire;

simulated function ModeHoldFire()
{
	super.ModeHoldFire();
	BW.GunLength = 1.0000000;
	//return;	
}

simulated event ModeDoFire()
{
	super.ModeDoFire();
	BW.GunLength = BW.default.GunLength;
	//return;	
}

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

defaultproperties
{
	SwipePoints[0]=(Weight=6,offset=(Pitch=6000,Yaw=4000,Roll=0))
	SwipePoints[1]=(Weight=5,offset=(Pitch=4500,Yaw=3000,Roll=0))
	SwipePoints[2]=(Weight=4,offset=(Pitch=3000,Yaw=2000,Roll=0))
	SwipePoints[3]=(Weight=3,offset=(Pitch=1500,Yaw=1000,Roll=0))
	SwipePoints[4]=(Weight=2,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[5]=(Weight=1,offset=(Pitch=-1500,Yaw=-1500,Roll=0))
	SwipePoints[6]=(Weight=0,offset=(Pitch=-3000,Yaw=0,Roll=0))
	WallHitPoint=4
	TraceRange=(Min=130.0000000,Max=130.0000000)
	DamageType=Class'BWBP_SKC_Pro.DTAS50Melee'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTAS50Melee'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTAS50Melee'
	bIgnoreReload=true
	bUseWeaponMag=false
	ScopeDownOn=2
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Swing',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	bFireOnRelease=true
	PreFireAnim="MeleePrep"
	FireAnim="Melee"
	TweenTime=0.0000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_50Inc'
	AmmoPerFire=0
	ShakeRotTime=1.0000000
	ShakeOffsetMag=(X=5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.0000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.0500000
}
