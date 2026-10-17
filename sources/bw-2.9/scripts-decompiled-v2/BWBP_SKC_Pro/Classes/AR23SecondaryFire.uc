class AR23SecondaryFire extends BallisticProShotgunFire;

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
		if(seq == AR23HeavyRifle(Weapon).GrenadeLoadAnim)
		{
			return false;
		}
		AR23HeavyRifle(Weapon).LoadGrenade();
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
	TraceCount=36
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2000.0000000,Max=4000.0000000)
	HeadMult=1.4000000
	LimbMult=1.0000000
	RangeAtten=0.3000000
	KickForce=20000
	PenetrateForce=500
	bPenetrate=true
	FlashBone="tip2"
	bUseWeaponMag=false
	FireRecoil=2048.0000000
	FirePushbackForce=1850.0000000
	XInaccuracy=1600.0000000
	YInaccuracy=1600.0000000
	BallisticFireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.Misc.Flak-Fire',Volume=1.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bFireOnRelease=true
	PreFireAnim="GrenadePrep"
	FireAnim="GrenadeFire"
	FireForce="AssaultRifleAltFire"
	FireRate=2.5000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_AR23Grenades'
	ShakeRotMag=(X=256.0000000,Y=128.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.5000000
	ShakeOffsetMag=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-600.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
}
