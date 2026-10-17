class BlackOpsWristBladeSecondaryFire extends BallisticMeleeFire;

var float RailPower;
var bool bIsCharging;

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x2E
	if(!BlackOpsWristBlade(BW).bSingle)
	{
		bIsCharging = true;
	}
	super.ModeDoFire();
	//return;	
}

simulated function ModeTick(float dt)
{
	super(BallisticFire).ModeTick(dt);
	// End:0x34
	if(bIsCharging)
	{
		RailPower = FMin(RailPower + (2.0000000 * dt), 1.0000000);
	}
	// End:0x61
	if((RailPower + 0.0500000) >= float(1))
	{
		DoFireEffect();
		bIsCharging = false;
		RailPower = 0.0000000;
	}
	// End:0x6E
	if(!bIsFiring)
	{
		return;
	}
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
	SwipePoints[2]=(Weight=4,offset=(Pitch=3000,Yaw=0,Roll=0))
	SwipePoints[3]=(Weight=3,offset=(Pitch=1500,Yaw=1000,Roll=0))
	SwipePoints[4]=(Weight=2,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[5]=(Weight=1,offset=(Pitch=-1500,Yaw=-1500,Roll=0))
	WallHitPoint=4
	bCanBackstab=false
	Damage=75.0000000
	DamageType=Class'BWBP_SKC_Pro.DTBOBTorsoLunge'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTBOBHeadLunge'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTBOBTorsoLunge'
	KickForce=200
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=SoundGroup'BW_Core_WeaponSound.UZI.Melee',Volume=2.5000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	bFireOnRelease=true
	PreFireAnim="PrepHack"
	FireAnim="Hack"
	AmmoClass=Class'BallisticProV55.Ammo_Knife'
	AmmoPerFire=0
	ShakeRotMag=(X=32.0000000,Y=256.0000000,Z=0.0000000)
	ShakeRotRate=(X=3000.0000000,Y=3000.0000000,Z=3000.0000000)
	ShakeRotTime=2.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
}
