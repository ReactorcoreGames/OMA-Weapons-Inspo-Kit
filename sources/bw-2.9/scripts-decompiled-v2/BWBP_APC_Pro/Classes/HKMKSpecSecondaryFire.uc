class HKMKSpecSecondaryFire extends BallisticProShotgunFire;

simulated function bool AllowFire()
{
	// End:0x0D
	if(!CheckReloading())
	{
		return false;
	}
	// End:0xE5
	if(HKMKSpecPistol(BW).AltAmmo < 1)
	{
		// End:0xA2
		if(!bPlayedDryFire && DryFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
			bPlayedDryFire = true;
		}
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), 0.0000000);
		BW.EmptyFire(byte(ThisModeNum));
		return false;
	}
	return true;
	//return;	
}

function PlayFiring()
{
	// End:0x75
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		BW.IdleAnim = 'IdleOpen';
		BW.ReloadAnim = 'ReloadOpen';
		AimedFireAnim = 'SightFireAltOpen';
		FireAnim = 'FireAltOpen';
		HKMKSpecPistol(BW).ReloadAltAnim = 'ReloadAltOpen';		
	}
	else
	{
		BW.IdleAnim = 'Idle';
		BW.ReloadAnim = 'Reload';
		AimedFireAnim = 'SightFireAlt';
		FireAnim = 'FireAlt';
		HKMKSpecPistol(BW).ReloadAltAnim = 'ReloadAlt';
	}
	// End:0x10E
	if(HKMKSpecPistol(Weapon).bSilenced)
	{
		Weapon.SetBoneScale(0, 1.0000000, HKMKSpecPistol(Weapon).SilencerBone);		
	}
	else
	{
		Weapon.SetBoneScale(0, 0.0000000, HKMKSpecPistol(Weapon).SilencerBone);
	}
	// End:0x15F
	if(int(ScopeDownOn) == int(1))
	{
		BW.TemporaryScopeDown(0.5000000, 0.9000000);
	}
	// End:0x1D2
	if(AimedFireAnim != 'None')
	{
		BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
		// End:0x1CF
		if(BW.BlendFire())
		{
			BW.SafePlayAnim(AimedFireAnim, FireAnimRate, TweenTime, 1, "AIMEDFIRE");
		}		
	}
	else
	{
		// End:0x21B
		if((FireCount > 0) && Weapon.HasAnim(FireLoopAnim))
		{
			BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");			
		}
		else
		{
			BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
		}
	}
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0x2CA
	if(((HKMKSpecPistol(Weapon) != none) && HKMKSpecPistol(Weapon).bSilenced) && SilencedFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(SilencedFireSound.Sound, SilencedFireSound.Slot, SilencedFireSound.Volume,, SilencedFireSound.Radius,, true);		
	}
	else
	{
		// End:0x312
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume,, BallisticFireSound.Radius);
		}
	}
	CheckClipFinished();
	//return;	
}

function DoFireEffect()
{
	super(BallisticShotgunFire).DoFireEffect();
	HKMKSpecPistol(BW).AltAmmo--;
	//return;	
}

defaultproperties
{
	TraceCount=9
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=5000.0000000,Max=5000.0000000)
	DecayRange=(Min=1024.0000000,Max=1536.0000000)
	Damage=4.0000000
	RangeAtten=0.7500000
	DamageType=Class'BWBP_SKC_Pro.DTCYLOShotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTCYLOShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTCYLOShotgun'
	KickForce=400
	PenetrateForce=100
	bPenetrate=true
	FlashBone="tip3"
	BrassClass=Class'BallisticProV55.Brass_Shotgun'
	bBrassOnCock=true
	BrassOffset=(X=-30.0000000,Y=-5.0000000,Z=5.0000000)
	bUseWeaponMag=false
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireRecoil=512.0000000
	FirePushbackForce=150.0000000
	FireChaos=0.5000000
	XInaccuracy=350.0000000
	YInaccuracy=350.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-FireSG',Volume=1.3000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	JamSound=(Sound=Sound'BW_Core_WeaponSound.Misc.ClipEnd-1',Volume=0.9000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	FireAnim="FireSG"
	FireEndAnim="None"
	FireRate=0.7000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_CYLOSG'
	AmmoPerFire=0
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
}
