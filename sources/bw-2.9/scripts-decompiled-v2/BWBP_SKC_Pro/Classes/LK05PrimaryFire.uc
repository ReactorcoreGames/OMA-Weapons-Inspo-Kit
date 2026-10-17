class LK05PrimaryFire extends BallisticProInstantFire;

var() Sound FireSoundLoop;
var() Sound FireSoundLoopBegin;
var() Sound FireSoundLoopEnd;
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
	if(!LK05Carbine(Weapon).bSilenced && MuzzleFlash != none)
	{
		MuzzleFlash.Trigger(Weapon, Instigator);		
	}
	else
	{
		// End:0xF3
		if(LK05Carbine(Weapon).bSilenced && SMuzzleFlash != none)
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
	BallisticAttachment(Weapon.ThirdPersonActor).BallisticUpdateHit(Other, HitLocation, HitNormal, Surf, LK05Carbine(Weapon).bSilenced, WaterHitLoc);
	//return;	
}

function ServerPlayFiring()
{
	// End:0x95
	if(((LK05Carbine(Weapon) != none) && LK05Carbine(Weapon).bSilenced) && SilencedFireSound.Sound != none)
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
	// End:0x13E
	if(LK05Carbine(Weapon).bSilenced)
	{
		Weapon.SetBoneScale(0, 1.0000000, LK05Carbine(Weapon).SilencerBone);		
	}
	else
	{
		Weapon.SetBoneScale(0, 0.0000000, LK05Carbine(Weapon).SilencerBone);
	}
	PlayFireAnimations();
	CheckClipFinished();
	//return;	
}

simulated function PlayFireAnimations()
{
	// End:0x5C
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		BW.IdleAnim = 'OpenIdle';
		BW.ReloadAnim = 'ReloadEmpty';
		AimedFireAnim = 'OpenSightFire';
		FireAnim = 'OpenFire';		
	}
	else
	{
		AimedFireAnim = 'SightFire';
		FireAnim = 'Fire';
	}
	super(BallisticFire).PlayFireAnimations();
	//return;	
}

function PlayFiring()
{
	// End:0x42
	if(LK05Carbine(Weapon).bSilenced)
	{
		Weapon.SetBoneScale(0, 1.0000000, LK05Carbine(Weapon).SilencerBone);		
	}
	else
	{
		Instigator.AmbientSound = BW.UsedAmbientSound;
		Weapon.SetBoneScale(0, 0.0000000, LK05Carbine(Weapon).SilencerBone);
	}
	PlayFireAnimations();
	ClientPlayForceFeedback(FireForce);
	// End:0xAB
	if(!bFiring)
	{
		bFiring = true;
	}
	FireCount++;
	// End:0x162
	if(((LK05Carbine(Weapon) != none) && LK05Carbine(Weapon).bSilenced) && SilencedFireSound.Sound != none)
	{
		// End:0x15F
		if((int(LK05Carbine(Weapon).CurrentWeaponMode) == 0) || int(LK05Carbine(Weapon).CurrentWeaponMode) == 1)
		{
			Weapon.PlayOwnedSound(SilencedFireSound.Sound, SilencedFireSound.Slot, SilencedFireSound.Volume,, SilencedFireSound.Radius,, true);
		}		
	}
	else
	{
		// End:0x1AA
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume,, BallisticFireSound.Radius);
		}
	}
	CheckClipFinished();
	//return;	
}

simulated function SwitchSilencerMode(bool bNewMode)
{
	// End:0x5D
	if(bNewMode)
	{
		Damage *= 0.8000000;
		FireRecoil *= 0.6000000;
		XInaccuracy *= 0.5000000;
		YInaccuracy *= 0.5000000;
		DamageType = Class'BWBP_SKC_Pro.DT_LK05SilAssault';
		DamageTypeHead = Class'BWBP_SKC_Pro.DT_LK05SilAssaultHead';
		DamageTypeArm = Class'BWBP_SKC_Pro.DT_LK05SilAssault';		
	}
	else
	{
		Damage = default.Damage;
		FireRecoil = default.FireRecoil;
		XInaccuracy = default.XInaccuracy;
		YInaccuracy = default.YInaccuracy;
		DamageType = Class'BWBP_SKC_Pro.DT_LK05Assault';
		DamageTypeHead = Class'BWBP_SKC_Pro.DT_LK05AssaultHead';
		DamageTypeArm = Class'BWBP_SKC_Pro.DT_LK05Assault';
	}
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x2A
	if(LK05Carbine(Weapon).bSilenced)
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
	if(((bIsFiring && LK05Carbine(Weapon).bSilenced) && int(LK05Carbine(Weapon).CurrentWeaponMode) != 0) && int(LK05Carbine(Weapon).CurrentWeaponMode) != 1)
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
	FireSoundLoop=Sound'BWBP_SKC_Sounds.MARS.F2000-FireLoopSil'
	FireSoundLoopBegin=Sound'BWBP_SKC_Sounds.MARS.F2000-SilFire'
	SMuzzleFlashClass=Class'BWBP_SKC_Pro.LK05SilencedFlash'
	SFlashBone="tip2"
	SFlashScaleFactor=0.7500000
	TraceRange=(Min=9000.0000000,Max=11000.0000000)
	DamageType=Class'BWBP_SKC_Pro.DT_LK05Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_LK05AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_LK05Assault'
	PenetrateForce=150
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	BrassBone="tip"
	BrassOffset=(X=-80.0000000,Y=1.0000000,Z=0.0000000)
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FireRecoil=160.0000000
	FireChaos=0.0280000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.1600000,OutVal=1.0000000),(InVal=0.2500000,OutVal=1.5000000),(InVal=0.5000000,OutVal=2.2500000),(InVal=0.7500000,OutVal=3.5000000),(InVal=1.0000000,OutVal=5.0000000)))
	XInaccuracy=48.0000000
	YInaccuracy=48.0000000
	SilencedFireSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.F2000-SilFire',Volume=1.1000000,Radius=192.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.LK05.LK05-RapidFire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireRate=0.0950000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_68mm'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-100.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	WarnTargetPct=0.2000000
	aimerror=900.0000000
}
