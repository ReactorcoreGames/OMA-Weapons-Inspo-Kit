class MarlinMeleeFire extends BallisticMeleeFire;

function PlayPreFire()
{
	super(BallisticFire).PlayPreFire();
	MarlinRifle(Weapon).bStriking = true;
	//return;	
}

defaultproperties
{
	SwipePoints[0]=(Weight=3,offset=(Pitch=2048,Yaw=2048,Roll=0))
	SwipePoints[1]=(Weight=1,offset=(Pitch=1000,Yaw=1000,Roll=0))
	SwipePoints[2]=(Weight=2,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[3]=(Weight=1,offset=(Pitch=-1000,Yaw=-1000,Roll=0))
	SwipePoints[4]=(Weight=3,offset=(Pitch=-2048,Yaw=-2048,Roll=0))
	Damage=80.0000000
	DamageType=Class'BallisticProV55.DTMarlinMelee'
	DamageTypeHead=Class'BallisticProV55.DTMarlinMeleeHead'
	DamageTypeArm=Class'BallisticProV55.DTMarlinMelee'
	bIgnoreReload=true
	bUseWeaponMag=false
	ScopeDownOn=2
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.Marlin.Mar-Melee',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	bFireOnRelease=true
	PreFireAnim="PrepSwipe"
	FireAnim="Swipe"
	PreFireAnimRate=1.5000000
	FireAnimRate=1.5000000
	TweenTime=0.0000000
	AmmoClass=Class'BallisticProV55.Ammo_Marlin'
	AmmoPerFire=0
	ShakeRotTime=1.0000000
	ShakeOffsetMag=(X=5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.0000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.0500000
}
