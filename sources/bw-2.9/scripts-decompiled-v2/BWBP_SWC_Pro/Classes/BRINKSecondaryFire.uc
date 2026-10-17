class BRINKSecondaryFire extends BallisticProProjectileFire;

var bool bLoaded;

simulated function bool CheckGrenade()
{
	local int Channel;
	local name seq;
	local float frame, Rate;

	// End:0x6B
	if(!bLoaded)
	{
		Weapon.GetAnimParams(Channel, seq, frame, Rate);
		// End:0x4D
		if(seq == BRINKAssaultRifle(Weapon).GrenadeLoadAnim)
		{
			return false;
		}
		BRINKAssaultRifle(Weapon).LoadGrenade();
		bIsFiring = false;
		return false;
	}
	return true;
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x0D
	if(!CheckReloading())
	{
		return false;
	}
	// End:0x1A
	if(!CheckWeaponMode())
	{
		return false;
	}
	// End:0xAC
	if(!super(BallisticFire).AllowFire() || !bLoaded)
	{
		// End:0x99
		if(DryFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
		}
		BW.EmptyFire(1);
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
	bLoaded = false;
	PreFireTime = 0.0000000;
	//return;	
}

function StopFiring()
{
	local int Channel;
	local name seq;
	local float frame, Rate;

	Weapon.GetAnimParams(Channel, seq, frame, Rate);
	// End:0x56
	if(seq == PreFireAnim)
	{
		Weapon.PlayAnim(Weapon.IdleAnim, 1.0000000, 0.5000000);
	}
	//return;	
}

defaultproperties
{
	bLoaded=true
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	FlashBone="tip2"
	bUseWeaponMag=false
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireRecoil=1024.0000000
	FireChaos=0.5000000
	XInaccuracy=8.0000000
	YInaccuracy=8.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	bFireOnRelease=true
	bModeExclusive=false
	PreFireTime=0.4500000
	PreFireAnim="GrenadePrep"
	FireAnim="GrenadeFire"
	FireForce="AssaultRifleAltFire"
	FireRate=1.8000000
	AmmoClass=Class'BWBP_SWC_Pro.Ammo_BRINKGrenades'
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_SWC_Pro.BRINKRocket'
	BotRefireRate=0.3000000
	WarnTargetPct=0.6000000
}
