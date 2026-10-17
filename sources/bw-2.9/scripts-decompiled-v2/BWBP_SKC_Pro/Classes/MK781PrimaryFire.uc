class MK781PrimaryFire extends BallisticProShotgunFire;

var() Actor SMuzzleFlash;
var() Class<Actor> SMuzzleFlashClass;
var() name SFlashBone;
var() float SFlashScaleFactor;

simulated function bool AllowFire()
{
	// End:0x19
	if(MK781Shotgun(Weapon).bReady)
	{
		return false;
	}
	return super(BallisticFire).AllowFire();
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
	if(!MK781Shotgun(Weapon).bSilenced && MuzzleFlash != none)
	{
		MuzzleFlash.Trigger(Weapon, Instigator);		
	}
	else
	{
		// End:0xF3
		if(MK781Shotgun(Weapon).bSilenced && SMuzzleFlash != none)
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

function ServerPlayFiring()
{
	Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	PlayFireAnimations();
	CheckClipFinished();
	//return;	
}

simulated function SwitchSilencerMode(bool bSilenced)
{
	// End:0x2C
	if(bSilenced)
	{
		DecayRange.Min = 1500.0000000;
		DecayRange.Max = 3500.0000000;		
	}
	else
	{
		DecayRange = default.DecayRange;
	}
	//return;	
}

function PlayFiring()
{
	MK781Shotgun(Weapon).UpdateBones();
	PlayFireAnimations();
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume,, BallisticFireSound.Radius);
	CheckClipFinished();
	//return;	
}

defaultproperties
{
	SMuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	SFlashBone="tip2"
	SFlashScaleFactor=1.0000000
	TraceCount=8
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Flechette'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2560.0000000,Max=2560.0000000)
	DamageType=Class'BWBP_SKC_Pro.DTM781Shotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTM781ShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTM781Shotgun'
	KickForce=400
	BrassClass=Class'BWBP_SKC_Pro.Brass_ShotgunFlechette'
	BrassOffset=(X=-1.0000000,Y=0.0000000,Z=-1.0000000)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
	AimedFireAnim="SightFire"
	FireRecoil=300.0000000
	FirePushbackForce=50.0000000
	FireChaos=0.2500000
	XInaccuracy=256.0000000
	YInaccuracy=256.0000000
	SilencedFireSound=(Sound=Sound'BWBP_SKC_Sounds.Mk781.Mk781-FireSil',Volume=2.3000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.Mk781.MK781-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireAnimRate=1.1500000
	FireRate=0.3250000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_10GaugeDart'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-300.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.4000000
}
