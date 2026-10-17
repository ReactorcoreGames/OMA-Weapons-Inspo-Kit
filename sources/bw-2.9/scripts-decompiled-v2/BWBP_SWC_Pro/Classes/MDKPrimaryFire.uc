class MDKPrimaryFire extends BallisticProInstantFire;

var() Actor SMuzzleFlash;
var() Class<Actor> SMuzzleFlashClass;
var() name SFlashBone;
var() float SFlashScaleFactor;

function InitEffects()
{
	// End:0x1B
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x7F
	if((MuzzleFlashClass != none) && (MuzzleFlash == none) || MuzzleFlash.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	}
	// End:0xE3
	if((SMuzzleFlashClass != none) && (SMuzzleFlash == none) || SMuzzleFlash.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(SMuzzleFlash, SMuzzleFlashClass, Weapon.DrawScale * SFlashScaleFactor, Weapon, SFlashBone);
	}
	//return;	
}

function SetSilenced(bool bSilenced)
{
	bAISilent = bSilenced;
	// End:0x42
	if(!bSilenced)
	{
		XInaccuracy *= float(2);
		YInaccuracy *= float(2);
		DecayRange.Min *= 1.2500000;		
	}
	else
	{
		XInaccuracy = default.XInaccuracy;
		YInaccuracy = default.YInaccuracy;
		DecayRange.Min = default.DecayRange.Min;
	}
	//return;	
}

function FlashMuzzleFlash()
{
	// End:0x36
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x74
	if(!Instigator.IsFirstPerson() || PlayerController(Instigator.Controller).ViewTarget != Instigator)
	{
		return;
	}
	// End:0xB6
	if(!MDKSubMachinegun(Weapon).bSilenced && MuzzleFlash != none)
	{
		MuzzleFlash.Trigger(Weapon, Instigator);		
	}
	else
	{
		// End:0xF3
		if(MDKSubMachinegun(Weapon).bSilenced && SMuzzleFlash != none)
		{
			SMuzzleFlash.Trigger(Weapon, Instigator);
		}
	}
	// End:0x104
	if(!bBrassOnCock)
	{
		EjectBrass();
	}
	//return;	
}

simulated function DestroyEffects()
{
	super(BallisticFire).DestroyEffects();
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlash);
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(SMuzzleFlash);
	//return;	
}

simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
{
	BallisticAttachment(Weapon.ThirdPersonActor).BallisticUpdateHit(Other, HitLocation, HitNormal, Surf, MDKSubMachinegun(Weapon).bSilenced, WaterHitLoc);
	//return;	
}

function ServerPlayFiring()
{
	// End:0x95
	if(((MDKSubMachinegun(Weapon) != none) && MDKSubMachinegun(Weapon).bSilenced) && SilencedFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(SilencedFireSound.Sound, SilencedFireSound.Slot, SilencedFireSound.Volume, SilencedFireSound.bNoOverride, SilencedFireSound.Radius, SilencedFireSound.Pitch, SilencedFireSound.bAtten);		
	}
	else
	{
		// End:0xFC
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		}
	}
	// End:0x145
	if((FireCount > 0) && Weapon.HasAnim(FireLoopAnim))
	{
		BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");		
	}
	else
	{
		// End:0x199
		if(!BW.bScopeView || !Weapon.HasAnim(AimedFireAnim))
		{
			BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");			
		}
		else
		{
			BW.SafePlayAnim(AimedFireAnim, FireAnimRate, TweenTime,, "FIRE");
		}
	}
	CheckClipFinished();
	//return;	
}

function PlayFiring()
{
	// End:0x42
	if(MDKSubMachinegun(Weapon).bSilenced)
	{
		Weapon.SetBoneScale(0, 1.0000000, MDKSubMachinegun(Weapon).SilencerBone);		
	}
	else
	{
		Weapon.SetBoneScale(0, 0.0000000, MDKSubMachinegun(Weapon).SilencerBone);
	}
	// End:0xB3
	if((FireCount > 0) && Weapon.HasAnim(FireLoopAnim))
	{
		BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");		
	}
	else
	{
		// End:0x107
		if(!BW.bScopeView || !Weapon.HasAnim(AimedFireAnim))
		{
			BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");			
		}
		else
		{
			BW.SafePlayAnim(AimedFireAnim, FireAnimRate, TweenTime,, "FIRE");
		}
	}
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0x1B6
	if(((MDKSubMachinegun(Weapon) != none) && MDKSubMachinegun(Weapon).bSilenced) && SilencedFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(SilencedFireSound.Sound, SilencedFireSound.Slot, SilencedFireSound.Volume,, SilencedFireSound.Radius,, true);		
	}
	else
	{
		// End:0x1FE
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume,, BallisticFireSound.Radius);
		}
	}
	CheckClipFinished();
	//return;	
}

defaultproperties
{
	SMuzzleFlashClass=Class'BWBP_SWC_Pro.MDKSilencedFlash'
	SFlashBone="tip"
	SFlashScaleFactor=1.0000000
	TraceRange=(Min=4096.0000000,Max=4096.0000000)
	DecayRange=(Min=768.0000000,Max=2048.0000000)
	WallPenetrationForce=8.0000000
	Damage=20.0000000
	HeadMult=1.4000000
	LimbMult=0.6000000
	RangeAtten=0.2000000
	WaterRangeAtten=0.2000000
	DamageType=Class'BallisticProV55.DTXK2SMG'
	DamageTypeHead=Class'BallisticProV55.DTXK2SMGHead'
	DamageTypeArm=Class'BallisticProV55.DTXK2SMG'
	PenetrateForce=150
	bPenetrate=true
	FlashBone="tip2"
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	BrassOffset=(X=-25.0000000,Y=0.0000000,Z=-5.0000000)
	bDryUncock=true
	ClipFinishSound=(Sound=Sound'BW_Core_WeaponSound.Misc.ClipEnd-2',Volume=0.8000000,Radius=72.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.Misc.DryPistol',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BWBP_SWC_Pro.MDKFlashEmitter'
	AimedFireAnim="SightFire"
	FireRecoil=72.0000000
	FireChaos=0.0250000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.2400000,OutVal=1.0000000),(InVal=0.3500000,OutVal=1.5000000),(InVal=0.6600000,OutVal=2.2500000),(InVal=1.0000000,OutVal=3.5000000)))
	XInaccuracy=48.0000000
	YInaccuracy=48.0000000
	SilencedFireSound=(Sound=Sound'BWBP_SWC_Sounds.MDK.MDK-SilenceFire',Volume=1.0000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BallisticFireSound=(Sound=SoundGroup'BWBP_SWC_Sounds.MDK.MDK-Fire',Volume=1.0000000,Radius=384.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bPawnRapidFireAnim=true
	FireRate=0.0900000
	AmmoClass=Class'BallisticProV55.Ammo_9mm'
	ShakeRotMag=(X=64.0000000,Y=32.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
}
