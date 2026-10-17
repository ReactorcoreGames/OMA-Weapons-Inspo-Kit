class MG36PrimaryFire extends BallisticProInstantFire;

var() Sound FireSoundLoop;
var() Sound FireSoundLoopBegin;
var() Sound FireSoundLoopEnd;
var() Sound GaussVentSound;
var bool bFiring;
var() Actor SMuzzleFlash;
var() Class<Actor> SMuzzleFlashClass;
var() name SFlashBone;
var() float SFlashScaleFactor;

simulated function bool AllowFire()
{
	// End:0x39
	if(!super(BallisticFire).AllowFire())
	{
		// End:0x37
		if(bFiring)
		{
			StopFiring();
			Instigator.AmbientSound = BW.UsedAmbientSound;
		}
		return false;
	}
	return super(BallisticFire).AllowFire();
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
	if(!MG36Machinegun(Weapon).bSilenced && MuzzleFlash != none)
	{
		MuzzleFlash.Trigger(Weapon, Instigator);		
	}
	else
	{
		// End:0xF3
		if(MG36Machinegun(Weapon).bSilenced && SMuzzleFlash != none)
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

simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
{
	BallisticAttachment(Weapon.ThirdPersonActor).BallisticUpdateHit(Other, HitLocation, HitNormal, Surf, MG36Machinegun(Weapon).bSilenced, WaterHitLoc);
	//return;	
}

function ServerPlayFiring()
{
	// End:0x95
	if(((MG36Machinegun(Weapon) != none) && MG36Machinegun(Weapon).bSilenced) && SilencedFireSound.Sound != none)
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
	PlayFireAnimations();
	//return;	
}

function PlayFiring()
{
	PlayFireAnimations();
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0xAD
	if(((MG36Machinegun(Weapon) != none) && MG36Machinegun(Weapon).bSilenced) && SilencedFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(SilencedFireSound.Sound, SilencedFireSound.Slot, SilencedFireSound.Volume, SilencedFireSound.bNoOverride, SilencedFireSound.Radius, SilencedFireSound.Pitch, SilencedFireSound.bAtten);		
	}
	else
	{
		// End:0x114
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		}
	}
	CheckClipFinished();
	//return;	
}

function PlayFireEnd()
{
	super(WeaponFire).PlayFireEnd();
	//return;	
}

simulated function SwitchSilencerMode(bool bNewMode)
{
	// End:0x5B
	if(bNewMode)
	{
		Damage *= 0.7000000;
		FireRecoil *= 0.9000000;
		XInaccuracy = default.XInaccuracy;
		YInaccuracy = default.YInaccuracy;
		DamageType = Class'BWBP_SKC_Pro.DT_MG36SilAssault';
		DamageTypeHead = Class'BWBP_SKC_Pro.DT_MG36SilAssaultHead';
		DamageTypeArm = Class'BWBP_SKC_Pro.DT_MG36SilAssault';		
	}
	else
	{
		Damage = default.Damage;
		DamageType = Class'BWBP_SKC_Pro.DT_MG36Assault';
		DamageTypeHead = Class'BWBP_SKC_Pro.DT_MG36AssaultHead';
		DamageTypeArm = Class'BWBP_SKC_Pro.DT_MG36Assault';
		FireRecoil = default.FireRecoil;
		RangeAtten = default.RangeAtten;
		XInaccuracy = default.XInaccuracy;
		YInaccuracy = default.YInaccuracy;
	}
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x2A
	if(MG36Machinegun(Weapon).bSilenced)
	{
		// End:0x2A
		if(!AllowFire())
		{
			StopFiring();
			return;
		}
	}
	super.ModeDoFire();
	//return;	
}

function StopFiring()
{
	bFiring = false;
	Instigator.AmbientSound = BW.UsedAmbientSound;
	super(BallisticFire).StopFiring();
	//return;	
}

simulated function ModeTick(float dt)
{
	super(BallisticFire).ModeTick(dt);
	// End:0x7E
	if(((bIsFiring && MG36Machinegun(Weapon).bSilenced) && int(MG36Machinegun(Weapon).CurrentWeaponMode) != 0) && int(MG36Machinegun(Weapon).CurrentWeaponMode) != 1)
	{
		Instigator.AmbientSound = FireSoundLoop;		
	}
	else
	{
		Instigator.AmbientSound = BW.UsedAmbientSound;
	}
	//return;	
}

function DoFireEffect()
{
	super(BallisticInstantFire).DoFireEffect();
	bFiring = true;
	//return;	
}

defaultproperties
{
	GaussVentSound=Sound'BWBP_SKC_Sounds.JSOC.JSOC-GaussVent'
	SMuzzleFlashClass=Class'BWBP_SKC_Pro.MG36SilencedFlash'
	SFlashBone="tip2"
	SFlashScaleFactor=0.7500000
	TraceRange=(Min=9000.0000000,Max=11000.0000000)
	DecayRange=(Min=7680.0000000,Max=15872.0000000)
	WallPenetrationForce=16.0000000
	Damage=28.0000000
	RangeAtten=0.4000000
	WaterRangeAtten=0.7000000
	DamageType=Class'BWBP_SKC_Pro.DT_MG36Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MG36AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MG36Assault'
	PenetrateForce=150
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	BrassBone="tip"
	BrassOffset=(X=-80.0000000,Y=1.0000000,Z=0.0000000)
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.1000000
	FireRecoil=128.0000000
	FireChaos=0.1800000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.1600000,OutVal=1.0000000),(InVal=0.2500000,OutVal=1.5000000),(InVal=0.5000000,OutVal=2.2500000),(InVal=0.7500000,OutVal=3.5000000),(InVal=1.0000000,OutVal=5.0000000)))
	XInaccuracy=4.0000000
	YInaccuracy=4.0000000
	SilencedFireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.JSOC.JSOC-SuppressedFire',Volume=1.0000000,Radius=192.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.JSOC.JSOC-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireRate=0.1000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_68mm'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	WarnTargetPct=0.2000000
	aimerror=900.0000000
}
