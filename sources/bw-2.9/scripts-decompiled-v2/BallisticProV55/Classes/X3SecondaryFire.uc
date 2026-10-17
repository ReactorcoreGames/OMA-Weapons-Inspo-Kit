class X3SecondaryFire extends BallisticMeleeFire;

simulated function bool AllowFire()
{
	// End:0x2D
	if(Level.TimeSeconds > X3Knife(Weapon).NextThrowTime)
	{
		return super.AllowFire();
	}
	return false;
	//return;	
}

event ModeDoFire()
{
	// End:0x25
	if(FRand() > 0.5000000)
	{
		PreFireAnim = 'BigBack1';
		FireAnim = 'BigStab1';		
	}
	else
	{
		PreFireAnim = 'BigBack2';
		FireAnim = 'BigSlash1';
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
	FatiguePerStrike=0.2000000
	TraceRange=(Min=130.0000000,Max=130.0000000)
	DamageType=Class'BallisticProV55.DTX3Knife'
	DamageTypeHead=Class'BallisticProV55.DTX3KnifeHead'
	DamageTypeArm=Class'BallisticProV55.DTX3KnifeLimb'
	KickForce=100
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=SoundGroup'BW_Core_WeaponSound.Knife.KnifeSlash',Volume=1.0000000,Radius=378.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	bFireOnRelease=true
	PreFireAnim="BigBack1"
	FireAnim="BigStab1"
	FireRate=0.7500000
	AmmoClass=Class'BallisticProV55.Ammo_X3Knife'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=128.0000000,Z=0.0000000)
	ShakeRotRate=(X=2500.0000000,Y=2500.0000000,Z=2500.0000000)
	ShakeRotTime=2.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.5000000
}
