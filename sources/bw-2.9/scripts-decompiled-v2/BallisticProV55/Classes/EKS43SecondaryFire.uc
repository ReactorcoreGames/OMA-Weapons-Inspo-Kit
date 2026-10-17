class EKS43SecondaryFire extends BallisticMeleeFire;

event ModeDoFire()
{
	// End:0x25
	if(FRand() > 0.5000000)
	{
		PreFireAnim = 'PrepHack1';
		FireAnim = 'Hack1';		
	}
	else
	{
		PreFireAnim = 'PrepHack2';
		FireAnim = 'Hack2';
	}
	super.ModeDoFire();
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
	FatiguePerStrike=0.2500000
	TraceRange=(Min=165.0000000,Max=165.0000000)
	DamageType=Class'BallisticProV55.DTEKS43Katana'
	DamageTypeHead=Class'BallisticProV55.DTEKS43KatanaHead'
	DamageTypeArm=Class'BallisticProV55.DTEKS43KatanaLimb'
	KickForce=100
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=SoundGroup'BW_Core_WeaponSound.EKS43.EKS-Slash',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	bFireOnRelease=true
	PreFireAnim="PrepHack1"
	FireAnim="Hack1"
	FireRate=1.2000000
	AmmoClass=Class'BallisticProV55.Ammo_Knife'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=512.0000000,Z=0.0000000)
	ShakeRotRate=(X=3000.0000000,Y=3000.0000000,Z=3000.0000000)
	ShakeRotTime=2.5000000
	BotRefireRate=0.9900000
	WarnTargetPct=0.5000000
}
