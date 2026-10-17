class GASCMeleeFire extends BallisticMeleeFire;

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

function PlayPreFire()
{
	super(BallisticFire).PlayPreFire();
	GASCPistol(Weapon).bStriking = true;
	//return;	
}

function PlayFiring()
{
	// End:0x34
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		FireAnim = 'MeleeStabOpen';
		PreFireAnim = 'MeleePrepOpen';		
	}
	else
	{
		FireAnim = 'MeleeStab';
		PreFireAnim = 'MeleePrep';
	}
	super.PlayFiring();
	//return;	
}

defaultproperties
{
	SwipePoints[0]=(Weight=3,offset=(Pitch=2048,Yaw=2048,Roll=0))
	SwipePoints[1]=(Weight=1,offset=(Pitch=1000,Yaw=1000,Roll=0))
	SwipePoints[2]=(Weight=2,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[3]=(Weight=1,offset=(Pitch=-1000,Yaw=-1000,Roll=0))
	SwipePoints[4]=(Weight=3,offset=(Pitch=-2048,Yaw=-2048,Roll=0))
	TraceRange=(Min=140.0000000,Max=140.0000000)
	Damage=90.0000000
	DamageType=Class'BWBP_APC_Pro.DTGASCMelee'
	DamageTypeHead=Class'BWBP_APC_Pro.DTGASCMelee'
	DamageTypeArm=Class'BWBP_APC_Pro.DTGASCMelee'
	KickForce=100
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	bIgnoreReload=true
	bUseWeaponMag=false
	ScopeDownOn=2
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=SoundGroup'BW_Core_WeaponSound.X4.X4_Melee',Volume=0.5000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	bFireOnRelease=true
	PreFireAnim="MeleePrep"
	FireAnim="MeleeStab"
	FireRate=0.4500000
	AmmoClass=Class'BWBP_APC_Pro.Ammo_GASCClip'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=128.0000000,Z=0.0000000)
	ShakeRotRate=(X=2500.0000000,Y=2500.0000000,Z=2500.0000000)
	ShakeRotTime=2.5000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
}
