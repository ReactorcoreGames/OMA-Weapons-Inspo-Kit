class SRS900PrimaryFire extends BallisticProInstantFire;

var() Actor SMuzzleFlash;
var() Class<Actor> SMuzzleFlashClass;
var() name SFlashBone;
var() float SFlashScaleFactor;

simulated function ApplyRecoil()
{
	BW.AddRecoil(FireRecoil, FireChaos, byte(ThisModeNum));
	// End:0xA0
	if(FirePushbackForce != float(0))
	{
		// End:0x78
		if(int(Instigator.Physics) == int(2))
		{
			Instigator.Velocity -= ((Vector(Instigator.GetViewRotation()) * FirePushbackForce) * 0.2500000);			
		}
		else
		{
			Instigator.Velocity -= (Vector(Instigator.GetViewRotation()) * FirePushbackForce);
		}
	}
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
	if(!SRS900Rifle(Weapon).bSilenced && MuzzleFlash != none)
	{
		MuzzleFlash.Trigger(Weapon, Instigator);		
	}
	else
	{
		// End:0xF3
		if(SRS900Rifle(Weapon).bSilenced && SMuzzleFlash != none)
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

simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
{
	BallisticAttachment(Weapon.ThirdPersonActor).BallisticUpdateHit(Other, HitLocation, HitNormal, Surf, SRS900Rifle(Weapon).bSilenced, WaterHitLoc);
	//return;	
}

function ServerPlayFiring()
{
	// End:0x95
	if(((SRS900Rifle(Weapon) != none) && SRS900Rifle(Weapon).bSilenced) && SilencedFireSound.Sound != none)
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
	FireAnim = 'Fire';
	// End:0x66
	if(SRS900Rifle(Weapon).bSilenced)
	{
		SRS900Rifle(Weapon).StealthImpulse(0.3000000);
		Weapon.SetBoneScale(0, 1.0000000, SRS900Rifle(Weapon).SilencerBone);		
	}
	else
	{
		SRS900Rifle(Weapon).StealthImpulse(0.3000000);
		Weapon.SetBoneScale(0, 0.0000000, SRS900Rifle(Weapon).SilencerBone);
	}
	PlayFireAnimations();
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0x137
	if(((SRS900Rifle(Weapon) != none) && SRS900Rifle(Weapon).bSilenced) && SilencedFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(SilencedFireSound.Sound, SilencedFireSound.Slot, SilencedFireSound.Volume,, SilencedFireSound.Radius,, true);		
	}
	else
	{
		// End:0x17F
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
	DamageType=Class'BallisticProV55.DTSRS900Rifle'
	DamageTypeHead=Class'BallisticProV55.DTSRS900RifleHead'
	DamageTypeArm=Class'BallisticProV55.DTSRS900Rifle'
	PenetrateForce=180
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	BrassOffset=(X=-10.0000000,Y=1.0000000,Z=-1.0000000)
	bCockAfterEmpty=true
	ClipFinishSound=(Sound=Sound'BW_Core_WeaponSound.Misc.ClipEnd-1',Volume=0.8000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.5000000
	BurstFireRateFactor=0.5500000
	FireRecoil=192.0000000
	FireChaos=0.0700000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.1600000,OutVal=1.0000000),(InVal=0.2500000,OutVal=1.5000000),(InVal=0.5000000,OutVal=2.2500000),(InVal=0.7500000,OutVal=3.5000000),(InVal=1.0000000,OutVal=5.0000000)))
	SilencedFireSound=(Sound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilenceFire',Volume=1.0000000,Radius=768.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.SRS900.SRS-Fire',Volume=1.0000000,Radius=1536.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireRate=0.2000000
	AmmoClass=Class'BallisticProV55.Ammo_RS762mm'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-160.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	WarnTargetPct=0.2000000
	aimerror=800.0000000
}
