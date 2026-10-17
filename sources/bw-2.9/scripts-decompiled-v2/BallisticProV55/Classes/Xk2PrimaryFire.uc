class Xk2PrimaryFire extends BallisticProInstantFire;

var() Actor SMuzzleFlash;
var() Class<Actor> SMuzzleFlashClass;
var() name SFlashBone;
var() float SFlashScaleFactor;
var() Actor MuzzleFlashAmp;
var() Class<Actor> MuzzleFlashClassAmp;
var() name AmpFlashBone;
var() float AmpFlashScaleFactor;
var(XK2) bool bAmped;
var(XK2) float AmpDrainPerShot;

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
	// End:0x147
	if((MuzzleFlashClassAmp != none) && (MuzzleFlashAmp == none) || MuzzleFlashAmp.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashAmp, MuzzleFlashClassAmp, Weapon.DrawScale * AmpFlashScaleFactor, Weapon, FlashBone);
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
		DecayRange.Min *= 0.8000000;
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
	// End:0xD6
	if(((int(XK2SubMachinegun(Weapon).CurrentWeaponMode) == 4) && XK2SubMachinegun(Weapon).AmpCharge > float(0)) && MuzzleFlashAmp != none)
	{
		MuzzleFlashAmp.Trigger(Weapon, Instigator);		
	}
	else
	{
		// End:0x136
		if((!XK2SubMachinegun(Weapon).bSilenced && int(XK2SubMachinegun(Weapon).CurrentWeaponMode) != 4) && MuzzleFlash != none)
		{
			MuzzleFlash.Trigger(Weapon, Instigator);			
		}
		else
		{
			// End:0x173
			if(XK2SubMachinegun(Weapon).bSilenced && SMuzzleFlash != none)
			{
				SMuzzleFlash.Trigger(Weapon, Instigator);
			}
		}
	}
	// End:0x184
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
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashAmp);
	//return;	
}

simulated function SwitchWeaponMode(byte newmode)
{
	// End:0x1E
	if(Weapon.bBerserk)
	{
		FireRate *= 0.7500000;
	}
	// End:0x5D
	if(Level.GRI.WeaponBerserk > 1.0000000)
	{
		FireRate /= Level.GRI.WeaponBerserk;
	}
	// End:0xAC
	if(int(newmode) == 4)
	{
		bAmped = true;
		WaterRangeAtten = 0.6000000;
		DecayRange.Max = 4200.0000000;
		DecayRange.Min = 1500.0000000;
		WallPenetrationForce = 24.0000000;		
	}
	else
	{
		bAmped = false;
	}
	//return;	
}

function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	super(BallisticInstantFire).ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x8F
	if(((bAmped && Pawn(Victim) != none) && Pawn(Victim).Health > 0) && Vehicle(Victim) == none)
	{
		Class'BCoreProV55.BCSprintControl'.static.AddSlowTo(Pawn(Victim), 0.7000000, 0.2000000);
	}
	//return;	
}

simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
{
	// End:0x58
	if(!bAmped)
	{
		BallisticAttachment(Weapon.ThirdPersonActor).BallisticUpdateHit(Other, HitLocation, HitNormal, Surf, XK2SubMachinegun(Weapon).bSilenced, WaterHitLoc);		
	}
	else
	{
		Xk2Attachment(Weapon.ThirdPersonActor).IceUpdateHit(Other, HitLocation, HitNormal, Surf,, WaterHitLoc);
	}
	//return;	
}

function ServerPlayFiring()
{
	// End:0x95
	if(((XK2SubMachinegun(Weapon) != none) && XK2SubMachinegun(Weapon).bSilenced) && SilencedFireSound.Sound != none)
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
	PlayFireAnimations();
	CheckClipFinished();
	//return;	
}

function PlayFiring()
{
	// End:0x42
	if(XK2SubMachinegun(Weapon).bSilenced)
	{
		Weapon.SetBoneScale(0, 1.0000000, XK2SubMachinegun(Weapon).SilencerBone);		
	}
	else
	{
		Weapon.SetBoneScale(0, 0.0000000, XK2SubMachinegun(Weapon).SilencerBone);
	}
	PlayFireAnimations();
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0xFA
	if(((XK2SubMachinegun(Weapon) != none) && XK2SubMachinegun(Weapon).bSilenced) && SilencedFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(SilencedFireSound.Sound, SilencedFireSound.Slot, SilencedFireSound.Volume,, SilencedFireSound.Radius,, true);		
	}
	else
	{
		// End:0x142
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume,, BallisticFireSound.Radius);
		}
	}
	CheckClipFinished();
	// End:0x16A
	if(bAmped)
	{
		XK2SubMachinegun(BW).AddHeat(AmpDrainPerShot);
	}
	//return;	
}

function DoFireEffect()
{
	super(BallisticInstantFire).DoFireEffect();
	// End:0x38
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		XK2SubMachinegun(BW).AddHeat(AmpDrainPerShot);
	}
	//return;	
}

defaultproperties
{
	SMuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	SFlashBone="tip2"
	SFlashScaleFactor=1.0000000
	MuzzleFlashClassAmp=Class'BallisticProV55.XK2SilencedFlash'
	AmpFlashBone="tip2"
	AmpFlashScaleFactor=0.3000000
	AmpDrainPerShot=-0.3000000
	TraceRange=(Min=4096.0000000,Max=4096.0000000)
	DamageType=Class'BallisticProV55.DTXK2SMG'
	DamageTypeHead=Class'BallisticProV55.DTXK2SMGHead'
	DamageTypeArm=Class'BallisticProV55.DTXK2SMG'
	PenetrateForce=150
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	BrassOffset=(X=-5.0000000,Y=0.0000000,Z=-4.0000000)
	bDryUncock=true
	ClipFinishSound=(Sound=Sound'BW_Core_WeaponSound.Misc.ClipEnd-2',Volume=0.8000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.Misc.DryPistol',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	AimedFireAnim="SightFire"
	FireRecoil=72.0000000
	FireChaos=0.0250000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.2400000,OutVal=1.0000000),(InVal=0.3500000,OutVal=1.5000000),(InVal=0.6600000,OutVal=2.2500000),(InVal=1.0000000,OutVal=3.5000000)))
	XInaccuracy=48.0000000
	YInaccuracy=48.0000000
	SilencedFireSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-SilenceFire',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Fire',Volume=0.7000000,Radius=384.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bPawnRapidFireAnim=true
	FireRate=0.0900000
	AmmoClass=Class'BallisticProV55.Ammo_9mm'
	ShakeRotMag=(X=24.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=360.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-100.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
}
