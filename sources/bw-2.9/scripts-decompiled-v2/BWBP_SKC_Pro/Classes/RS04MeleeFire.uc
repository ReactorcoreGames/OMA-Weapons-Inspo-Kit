class RS04MeleeFire extends BallisticMeleeFire;

simulated function SwitchBladeMode(bool bLoaded)
{
	// End:0x44
	if(bLoaded)
	{
		FireAnimRate = 0.9000000;
		Damage *= 1.5000000;
		DamageType = Class'BWBP_SKC_Pro.DTRS04Stab';
		DamageTypeHead = Class'BWBP_SKC_Pro.DTRS04Stab';
		DamageTypeArm = Class'BWBP_SKC_Pro.DTRS04Stab';		
	}
	else
	{
		PreFireAnim = 'PrepBash';
		FireAnim = 'Bash';
		FireAnimRate = default.FireAnimRate;
		Damage = default.Damage;
		DamageType = default.DamageType;
		DamageTypeHead = default.DamageTypeHead;
		DamageTypeArm = default.DamageTypeArm;
	}
	// End:0xAF
	if(Weapon.bBerserk)
	{
		FireRate *= 0.7500000;
	}
	// End:0xEE
	if(Level.GRI.WeaponBerserk > 1.0000000)
	{
		FireRate /= Level.GRI.WeaponBerserk;
	}
	//return;	
}

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

function PlayPreFire()
{
	super(BallisticFire).PlayPreFire();
	RS04Pistol(Weapon).bStriking = true;
	//return;	
}

function PlayFiring()
{
	// End:0x2D
	if(BW.MagAmmo == 0)
	{
		PreFireAnim = 'MeleePrepOpen';
		FireAnim = 'MeleeOpen';		
	}
	else
	{
		PreFireAnim = 'MeleePrep';
		FireAnim = 'Melee';
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
	Damage=35.0000000
	DamageType=Class'BWBP_SKC_Pro.DTRS04Bonk'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTRS04Bonk'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTRS04Bonk'
	KickForce=100
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	bIgnoreReload=true
	bUseWeaponMag=false
	ScopeDownOn=2
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.MD24.MD24_Melee',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	bFireOnRelease=true
	PreFireAnim="MeleePrep"
	FireAnim="Melee"
	FireRate=0.4500000
	AmmoClass=Class'BallisticProV55.Ammo_45HV'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=128.0000000,Z=0.0000000)
	ShakeRotRate=(X=2500.0000000,Y=2500.0000000,Z=2500.0000000)
	ShakeRotTime=2.5000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
}
