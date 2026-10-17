class R78PrimaryFire extends BallisticProInstantFire;

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
	if(!R78Rifle(Weapon).bSilenced && MuzzleFlash != none)
	{
		MuzzleFlash.Trigger(Weapon, Instigator);		
	}
	else
	{
		// End:0xF3
		if(R78Rifle(Weapon).bSilenced && SMuzzleFlash != none)
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
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(SMuzzleFlash);
	//return;	
}

function ServerPlayFiring()
{
	// End:0x95
	if(((R78Rifle(Weapon) != none) && R78Rifle(Weapon).bSilenced) && SilencedFireSound.Sound != none)
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
	CheckClipFinished();
	// End:0x17A
	if(AimedFireAnim != 'None')
	{
		// End:0x14D
		if(!BW.bScopeView)
		{
			BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");			
		}
		else
		{
			BW.SafePlayAnim(AimedFireAnim, FireAnimRate, TweenTime,, "AIMEDFIRE");
		}		
	}
	else
	{
		// End:0x1C3
		if((FireCount > 0) && Weapon.HasAnim(FireLoopAnim))
		{
			BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");			
		}
		else
		{
			BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
		}
	}
	//return;	
}

function PlayFiring()
{
	// End:0x29
	if(int(ScopeDownOn) == int(1))
	{
		BW.TemporaryScopeDown(0.5000000, 0.9000000);
	}
	// End:0xA1
	if(AimedFireAnim != 'None')
	{
		// End:0x74
		if(!BW.bScopeView)
		{
			BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");			
		}
		else
		{
			BW.SafePlayAnim(AimedFireAnim, FireAnimRate, TweenTime,, "AIMEDFIRE");
		}		
	}
	else
	{
		// End:0xEA
		if((FireCount > 0) && Weapon.HasAnim(FireLoopAnim))
		{
			BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");			
		}
		else
		{
			BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
		}
	}
	// End:0x151
	if(R78Rifle(Weapon).bSilenced)
	{
		Weapon.SetBoneScale(0, 1.0000000, R78Rifle(Weapon).SilencerBone);		
	}
	else
	{
		Weapon.SetBoneScale(0, 0.0000000, R78Rifle(Weapon).SilencerBone);
	}
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0x20C
	if(((R78Rifle(Weapon) != none) && R78Rifle(Weapon).bSilenced) && SilencedFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(SilencedFireSound.Sound, SilencedFireSound.Slot, SilencedFireSound.Volume,, SilencedFireSound.Radius, SilencedFireSound.Pitch, true);		
	}
	else
	{
		// End:0x254
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume,, BallisticFireSound.Radius);
		}
	}
	CheckClipFinished();
	//return;	
}

function SetSilenced(bool bSilenced)
{
	// End:0x60
	if(bSilenced)
	{
		FireRecoil *= 0.8000000;
		RangeAtten *= 1.2000000;
		XInaccuracy *= 0.7500000;
		YInaccuracy *= 0.7500000;
		BW.SightingTime = BW.default.SightingTime * 1.2500000;		
	}
	else
	{
		FireRecoil = default.FireRecoil;
		RangeAtten = default.RangeAtten;
		XInaccuracy = default.XInaccuracy;
		YInaccuracy = default.YInaccuracy;
		BW.SightingTime = BW.default.SightingTime;
	}
	//return;	
}

defaultproperties
{
	SMuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	SFlashBone="tip2"
	SFlashScaleFactor=0.7500000
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	DamageType=Class'BallisticProV55.DTR78Rifle'
	DamageTypeHead=Class'BallisticProV55.DTR78RifleHead'
	DamageTypeArm=Class'BallisticProV55.DTR78Rifle'
	KickForce=3000
	PDamageFactor=0.8000000
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	bBrassOnCock=true
	BrassOffset=(X=-10.0000000,Y=1.0000000,Z=-1.0000000)
	bCockAfterFire=true
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	FireRecoil=378.0000000
	FireChaos=0.5000000
	SilencedFireSound=(Sound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilenceFire',Volume=1.0000000,Radius=1536.0000000,Slot=0,Pitch=0.8500000,bAtten=true,bNoOverride=true)
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78NS-Fire',Volume=2.0000000,Radius=1024.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireRate=1.1000000
	AmmoClass=Class'BallisticProV55.Ammo_42Rifle'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-300.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.4000000
	WarnTargetPct=0.5000000
	aimerror=800.0000000
}
