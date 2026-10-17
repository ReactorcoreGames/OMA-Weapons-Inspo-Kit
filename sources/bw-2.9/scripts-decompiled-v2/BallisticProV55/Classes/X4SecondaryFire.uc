class X4SecondaryFire extends BallisticMeleeFire;

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
	FatiguePerStrike=0.2000000
	TraceRange=(Min=130.0000000,Max=130.0000000)
	DamageType=Class'BallisticProV55.DTX4Knife'
	DamageTypeHead=Class'BallisticProV55.DTX4KnifeHead'
	DamageTypeArm=Class'BallisticProV55.DTX4KnifeLimb'
	KickForce=100
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=SoundGroup'BW_Core_WeaponSound.X4.X4_Melee',Volume=0.5000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	bFireOnRelease=true
	PreFireAnim="PrepMelee"
	FireAnim="Melee"
	AmmoClass=Class'BallisticProV55.Ammo_X4Knife'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=128.0000000,Z=0.0000000)
	ShakeRotRate=(X=2500.0000000,Y=2500.0000000,Z=2500.0000000)
	ShakeRotTime=2.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.5000000
}
