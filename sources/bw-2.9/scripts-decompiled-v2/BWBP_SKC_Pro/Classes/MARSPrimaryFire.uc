class MARSPrimaryFire extends BallisticProInstantFire;

var() Actor SMuzzleFlash;
var() Class<Actor> SMuzzleFlashClass;
var() name SFlashBone;
var() float SFlashScaleFactor;

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
	if(!MARSAssaultRifle(Weapon).bSilenced && MuzzleFlash != none)
	{
		MuzzleFlash.Trigger(Weapon, Instigator);		
	}
	else
	{
		// End:0xF3
		if(MARSAssaultRifle(Weapon).bSilenced && SMuzzleFlash != none)
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

function SetSuppressed(bool bSilenced)
{
	// End:0x3C
	if(bSilenced)
	{
		FireRecoil *= 0.8000000;
		RangeAtten *= 1.2000000;
		XInaccuracy *= 0.7500000;
		YInaccuracy *= 0.7500000;		
	}
	else
	{
		FireRecoil = default.FireRecoil;
		RangeAtten = default.RangeAtten;
		XInaccuracy = default.XInaccuracy;
		YInaccuracy = default.YInaccuracy;
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
	BallisticAttachment(Weapon.ThirdPersonActor).BallisticUpdateHit(Other, HitLocation, HitNormal, Surf, MARSAssaultRifle(Weapon).bSilenced, WaterHitLoc);
	//return;	
}

function ServerPlayFiring()
{
	CheckClipFinished();
	PlayFireAnimations();
	// End:0xA1
	if(((MARSAssaultRifle(Weapon) != none) && MARSAssaultRifle(Weapon).bSilenced) && SilencedFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(SilencedFireSound.Sound, SilencedFireSound.Slot, SilencedFireSound.Volume, SilencedFireSound.bNoOverride, SilencedFireSound.Radius, SilencedFireSound.Pitch, SilencedFireSound.bAtten);		
	}
	else
	{
		// End:0x108
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		}
	}
	//return;	
}

function PlayFiring()
{
	// End:0x42
	if(MARSAssaultRifle(Weapon).bSilenced)
	{
		Weapon.SetBoneScale(0, 1.0000000, MARSAssaultRifle(Weapon).SilencerBone);		
	}
	else
	{
		Weapon.SetBoneScale(0, 0.0000000, MARSAssaultRifle(Weapon).SilencerBone);
	}
	PlayFireAnimations();
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	CheckClipFinished();
	// End:0x100
	if(((MARSAssaultRifle(Weapon) != none) && MARSAssaultRifle(Weapon).bSilenced) && SilencedFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(SilencedFireSound.Sound, SilencedFireSound.Slot, SilencedFireSound.Volume,, SilencedFireSound.Radius,, true);		
	}
	else
	{
		// End:0x167
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		}
	}
	//return;	
}

defaultproperties
{
	SMuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	SFlashBone="tip2"
	SFlashScaleFactor=1.0000000
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	DamageType=Class'BWBP_SKC_Pro.DT_MARSAssault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MARSAssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MARSAssault'
	PenetrateForce=150
	BrassClass=Class'BallisticProV55.Brass_MG'
	BrassOffset=(X=-80.0000000,Y=1.0000000,Z=0.0000000)
	bCockAfterEmpty=true
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MARSFlashEmitter'
	FlashScaleFactor=0.5000000
	BurstFireRateFactor=0.5500000
	FireRecoil=120.0000000
	FireChaos=0.0320000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.1600000,OutVal=1.0000000),(InVal=0.2500000,OutVal=1.5000000),(InVal=0.5000000,OutVal=2.2500000),(InVal=0.7500000,OutVal=3.5000000),(InVal=1.0000000,OutVal=5.0000000)))
	SilencedFireSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.F2000-SilFire2',Volume=1.1000000,Radius=192.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-RapidFire',Volume=1.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireRate=0.0800000
	AmmoClass=Class'BallisticProV55.Ammo_556mm'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-100.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	WarnTargetPct=0.2000000
	aimerror=900.0000000
}
