class SRXPrimaryFire extends BallisticProInstantFire;

var() Sound SuperFireSound;
var() Sound MegaFireSound;
var() Sound ExtraFireSound;
var() Sound SilentFireSound;
var() Sound BlackFireSound;
var() Sound RegularFireSound;
var() Actor MuzzleFlashAmp1;
var() Class<Actor> MuzzleFlashClassAmp1;
var() Actor MuzzleFlashAmp2;
var() Class<Actor> MuzzleFlashClassAmp2;
var() name AmpFlashBone;
var() float Amp1FlashScaleFactor;
var() float Amp2FlashScaleFactor;
var() Actor SMuzzleFlash;
var() Class<Actor> SMuzzleFlashClass;
var() name SFlashBone;
var() float SFlashScaleFactor;
var(SRX) bool bAmped;
var(SRX) float AmpDrainPerShot;

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
	if((MuzzleFlashClassAmp1 != none) && (MuzzleFlashAmp1 == none) || MuzzleFlashAmp1.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashAmp1, MuzzleFlashClassAmp1, Weapon.DrawScale * Amp1FlashScaleFactor, Weapon, FlashBone);
	}
	// End:0x1AB
	if((MuzzleFlashClassAmp2 != none) && (MuzzleFlashAmp2 == none) || MuzzleFlashAmp2.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashAmp2, MuzzleFlashClassAmp2, Weapon.DrawScale * Amp2FlashScaleFactor, Weapon, FlashBone);
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
	// End:0xB4
	if(SRXRifle(Weapon).bSilenced && SMuzzleFlash != none)
	{
		SMuzzleFlash.Trigger(Weapon, Instigator);		
	}
	else
	{
		// End:0xF8
		if((MuzzleFlashAmp1 != none) && int(SRXRifle(Weapon).CurrentWeaponMode) == 1)
		{
			MuzzleFlashAmp1.Trigger(Weapon, Instigator);			
		}
		else
		{
			// End:0x13D
			if((MuzzleFlashAmp2 != none) && int(SRXRifle(Weapon).CurrentWeaponMode) == 2)
			{
				MuzzleFlashAmp2.Trigger(Weapon, Instigator);				
			}
			else
			{
				MuzzleFlash.Trigger(Weapon, Instigator);
			}
		}
	}
	// End:0x167
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
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashAmp1);
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashAmp2);
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
	// End:0x75
	if(int(newmode) == 0)
	{
		bAmped = false;		
	}
	else
	{
		// End:0x8D
		if(int(newmode) == 1)
		{
			bAmped = true;			
		}
		else
		{
			// End:0xA6
			if(int(newmode) == 2)
			{
				bAmped = true;				
			}
			else
			{
				bAmped = false;
			}
		}
	}
	//return;	
}

function ServerPlayFiring()
{
	// End:0x78
	if(((SRXRifle(Weapon) != none) && SRXRifle(Weapon).bSilenced) && SilencedFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(SilencedFireSound.Sound, SilencedFireSound.Slot, SilencedFireSound.Volume,, SilencedFireSound.Radius,, true);		
	}
	else
	{
		// End:0xC0
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume,, BallisticFireSound.Radius);
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
	// End:0x90
	if(((SRXRifle(Weapon) != none) && SRXRifle(Weapon).bSilenced) && SilencedFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(SilencedFireSound.Sound, SilencedFireSound.Slot, SilencedFireSound.Volume,, SilencedFireSound.Radius,, true);		
	}
	else
	{
		// End:0xD8
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume,, BallisticFireSound.Radius);
		}
	}
	CheckClipFinished();
	// End:0x100
	if(bAmped)
	{
		SRXRifle(BW).AddHeat(AmpDrainPerShot);
	}
	//return;	
}

function DoFireEffect()
{
	super(BallisticInstantFire).DoFireEffect();
	// End:0x38
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		SRXRifle(BW).AddHeat(AmpDrainPerShot);
	}
	//return;	
}

simulated function SetSilenced(bool bSilenced)
{
	// End:0x6C
	if(bSilenced)
	{
		FireRecoil *= 0.8000000;
		RangeAtten *= 1.2000000;
		XInaccuracy *= 0.7500000;
		YInaccuracy *= 0.7500000;
		Damage *= 0.7500000;
		BW.SightingTime = BW.default.SightingTime * 1.2500000;		
	}
	else
	{
		FireRecoil = default.FireRecoil;
		RangeAtten = default.RangeAtten;
		XInaccuracy = default.XInaccuracy;
		YInaccuracy = default.YInaccuracy;
		Damage = default.Damage;
		BW.SightingTime = BW.default.SightingTime;
	}
	//return;	
}

function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	super(BallisticInstantFire).ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x99
	if((Victim.bProjTarget && BallisticShield(Victim) == none) && int(SRXRifle(Weapon).CurrentWeaponMode) == 1)
	{
		BW.TargetedHurtRadius(float(Damage), 384.0000000, Class'BWBP_SKC_Pro.DTSRXRifle_Incendiary', 200.0000000, HitLocation, Pawn(Victim));
	}
	//return;	
}

simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
{
	local int Surf;

	// End:0x55
	if(((!Other.bWorldGeometry && Mover(Other) == none) && Pawn(Other) == none) || int(Level.NetMode) == int(NM_Client))
	{
		return false;
	}
	// End:0x70
	if(Vehicle(Other) != none)
	{
		Surf = 3;		
	}
	else
	{
		// End:0x94
		if(HitMat == none)
		{
			Surf = int(Other.SurfaceType);			
		}
		else
		{
			Surf = int(HitMat.SurfaceType);
		}
	}
	// End:0x10E
	if(((Other == none) || Other.bWorldGeometry) && int(SRXRifle(Weapon).CurrentWeaponMode) == 1)
	{
		BW.TargetedHurtRadius(5.0000000, 150.0000000, Class'BWBP_SKC_Pro.DTSRXRifle_Incendiary', 50.0000000, HitLocation);
	}
	SendFireEffect(Other, HitLocation, HitNormal, Surf, WaterHitLoc);
	// End:0x149
	if(!bAISilent)
	{
		Instigator.MakeNoise(1.0000000);
	}
	return true;
	//return;	
}

defaultproperties
{
	MuzzleFlashClassAmp1=Class'BWBP_SKC_Pro.FG50FlashEmitter'
	MuzzleFlashClassAmp2=Class'BallisticProV55.A500FlashEmitter'
	AmpFlashBone="tip2"
	Amp1FlashScaleFactor=0.3000000
	Amp2FlashScaleFactor=0.3000000
	SMuzzleFlashClass=Class'BWBP_SKC_Pro.SRXSilencedFlash'
	SFlashBone="tip2"
	SFlashScaleFactor=0.7500000
	AmpDrainPerShot=-0.8500000
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	DamageType=Class'BWBP_SKC_Pro.DTSRXRifle'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSRXRifleHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSRXRifle'
	PenetrateForce=120
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	BrassOffset=(X=-10.0000000,Y=1.0000000,Z=-1.0000000)
	bCockAfterEmpty=true
	ClipFinishSound=(Sound=Sound'BW_Core_WeaponSound.Misc.ClipEnd-1',Volume=0.8000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SRXFlashEmitter'
	FlashScaleFactor=0.4000000
	AimedFireAnim="SightFire"
	BurstFireRateFactor=0.3000000
	FireRecoil=192.0000000
	FireChaos=0.3000000
	SilencedFireSound=(Sound=Sound'BWBP_SKC_Sounds.SRSM2.SRSM2-Fire2',Volume=1.5000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.SRSM2.SRSM2-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireRate=0.1850000
	AmmoClass=Class'BallisticProV55.Ammo_RS762mm'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-300.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	WarnTargetPct=0.2000000
	aimerror=800.0000000
}
