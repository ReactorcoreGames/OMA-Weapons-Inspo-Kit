class BallisticShieldSecondaryFire extends BallisticMeleeFire;

function PlayPreFire()
{
	// End:0x25
	if(FRand() > 0.5000000)
	{
		PreFireAnim = 'PrepSmash';
		FireAnim = 'Smash';		
	}
	else
	{
		PreFireAnim = 'PrepSmashAlt';
		FireAnim = 'SmashAlt';
	}
	super(BallisticFire).PlayPreFire();
	//return;	
}

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

defaultproperties
{
	SwipePoints[0]=(Weight=3,offset=(Pitch=0,Yaw=-1536,Roll=0))
	SwipePoints[1]=(Weight=5,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[2]=(Weight=6,offset=(Pitch=0,Yaw=1536,Roll=0))
	SwipePoints[3]=(Weight=4,offset=(Pitch=0,Yaw=-1280,Roll=0))
	SwipePoints[4]=(Weight=2,offset=(Pitch=0,Yaw=-2560,Roll=0))
	WallHitPoint=1
	NumSwipePoints=3
	FatiguePerStrike=0.5000000
	TraceRange=(Min=140.0000000,Max=140.0000000)
	DamageType=Class'BWBP_OP_Pro.DTBallisticShield'
	DamageTypeHead=Class'BWBP_OP_Pro.DTBallisticShield'
	DamageTypeArm=Class'BWBP_OP_Pro.DTBallisticShield'
	KickForce=100
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Swing',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	bFireOnRelease=true
	PreFireAnim="PrepSmashAlt"
	FireAnim="SmashAlt"
	FireRate=1.2000000
	AmmoClass=Class'BallisticProV55.Ammo_Knife'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=512.0000000,Z=0.0000000)
	ShakeRotRate=(X=3000.0000000,Y=3000.0000000,Z=3000.0000000)
	ShakeRotTime=2.5000000
	BotRefireRate=0.9900000
	WarnTargetPct=0.5000000
}
