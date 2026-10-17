class PS9mSecondaryFire extends BallisticProProjectileFire;

function PlayFiring()
{
	// End:0x52
	if((BW.MagAmmo - ConsumedLoad) < 2)
	{
		BW.IdleAnim = 'IdleOpen';
		BW.ReloadAnim = 'ReloadOpen';
		FireAnim = 'DartFireOpen';		
	}
	else
	{
		BW.IdleAnim = 'Idle';
		BW.ReloadAnim = 'Reload';
		FireAnim = 'DartFire';
	}
	super(BallisticFire).PlayFiring();
	//return;	
}

simulated function bool CheckGrenade()
{
	local int Channel;
	local name seq;
	local float frame, Rate;

	// End:0x79
	if(!PS9mPistol(Weapon).bLoaded)
	{
		Weapon.GetAnimParams(Channel, seq, frame, Rate);
		// End:0x5B
		if(seq == PS9mPistol(Weapon).GrenadeLoadAnim)
		{
			return false;
		}
		PS9mPistol(Weapon).LoadGrenade();
		bIsFiring = false;
		return false;
	}
	return true;
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x1A
	if(!CheckGrenade())
	{
		return;
	}
	super.ModeDoFire();
	PS9mPistol(Weapon).bLoaded = false;
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	FlashBone="tip2"
	BrassOffset=(X=-20.0000000,Y=1.0000000,Z=0.0000000)
	bUseWeaponMag=false
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.Stealth.Stealth-DartFire',Volume=1.3500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	FireAnim="DartFire"
	FireForce="AssaultRifleAltFire"
	FireRate=0.6000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_MedDarts'
	AmmoPerFire=0
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.PS9mMedDart'
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
}
