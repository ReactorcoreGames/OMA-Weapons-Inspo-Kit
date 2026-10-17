class FMPPrimaryFire extends BallisticProInstantFire;

var(FMP) Sound AmpRedFireSound;
var(FMP) Sound AmpGreenFireSound;
var(FMP) Sound RegularFireSound;
var(FMP) Actor MuzzleFlashRed;
var(FMP) Class<Actor> MuzzleFlashClassRed;
var(FMP) Actor MuzzleFlashGreen;
var(FMP) Class<Actor> MuzzleFlashClassGreen;
var(FMP) name AmpFlashBone;
var(FMP) float AmpFlashScaleFactor;
var(SX45) bool bAmped;
var(FMP) float AmpDrainPerShot;

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
	if((MuzzleFlashClassRed != none) && (MuzzleFlashRed == none) || MuzzleFlashRed.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashRed, MuzzleFlashClassRed, Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	}
	// End:0x147
	if((MuzzleFlashClassGreen != none) && (MuzzleFlashGreen == none) || MuzzleFlashGreen.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashGreen, MuzzleFlashClassGreen, Weapon.DrawScale * AmpFlashScaleFactor, Weapon, FlashBone);
	}
	//return;	
}

simulated function DestroyEffects()
{
	super(BallisticFire).DestroyEffects();
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlash);
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashRed);
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashGreen);
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
	// End:0xB8
	if((MuzzleFlashRed != none) && int(FMPMachinePistol(Weapon).CurrentWeaponMode) == 1)
	{
		MuzzleFlashRed.Trigger(Weapon, Instigator);		
	}
	else
	{
		// End:0xFD
		if((MuzzleFlashGreen != none) && int(FMPMachinePistol(Weapon).CurrentWeaponMode) == 2)
		{
			MuzzleFlashGreen.Trigger(Weapon, Instigator);			
		}
		else
		{
			MuzzleFlash.Trigger(Weapon, Instigator);
		}
	}
	// End:0x127
	if(!bBrassOnCock)
	{
		EjectBrass();
	}
	//return;	
}

simulated function SwitchWeaponMode(byte newmode)
{
	// End:0x2E
	if(int(newmode) == 0)
	{
		RangeAtten = default.RangeAtten;
		FlashBone = default.FlashBone;
		bAmped = false;		
	}
	else
	{
		// End:0x5C
		if(int(newmode) == 1)
		{
			RangeAtten = 1.0000000;
			FlashBone = default.AmpFlashBone;
			bAmped = true;			
		}
		else
		{
			// End:0x8B
			if(int(newmode) == 2)
			{
				RangeAtten = 1.0000000;
				FlashBone = AmpFlashBone;
				bAmped = true;				
			}
			else
			{
				RangeAtten = default.RangeAtten;
				FlashBone = default.FlashBone;
				bAmped = false;
			}
		}
	}
	// End:0xC7
	if(Weapon.bBerserk)
	{
		FireRate *= 0.7500000;
	}
	// End:0x106
	if(Level.GRI.WeaponBerserk > 1.0000000)
	{
		FireRate /= Level.GRI.WeaponBerserk;
	}
	//return;	
}

function ServerPlayFiring()
{
	// End:0x70
	if(((FMPMachinePistol(Weapon) != none) && int(FMPMachinePistol(Weapon).CurrentWeaponMode) == 1) && AmpRedFireSound != none)
	{
		Weapon.PlayOwnedSound(AmpRedFireSound, BallisticFireSound.Slot, BallisticFireSound.Volume,, BallisticFireSound.Radius);		
	}
	else
	{
		// End:0xE1
		if(((FMPMachinePistol(Weapon) != none) && int(FMPMachinePistol(Weapon).CurrentWeaponMode) == 2) && AmpGreenFireSound != none)
		{
			Weapon.PlayOwnedSound(AmpGreenFireSound, BallisticFireSound.Slot, BallisticFireSound.Volume,, BallisticFireSound.Radius);			
		}
		else
		{
			// End:0x129
			if(BallisticFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume,, BallisticFireSound.Radius);
			}
		}
	}
	CheckClipFinished();
	PlayFireAnimations();
	//return;	
}

function PlayFiring()
{
	// End:0x5C
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		BW.IdleAnim = 'IdleClosed';
		BW.ReloadAnim = 'ReloadEmpty';
		AimedFireAnim = 'SightFireClosed';
		FireAnim = 'FireClosed';		
	}
	else
	{
		BW.IdleAnim = 'Idle';
		BW.ReloadAnim = 'Reload';
		AimedFireAnim = 'SightFire';
		FireAnim = 'Fire';
	}
	PlayFireAnimations();
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0x122
	if(((FMPMachinePistol(Weapon) != none) && int(FMPMachinePistol(Weapon).CurrentWeaponMode) == 1) && AmpRedFireSound != none)
	{
		Weapon.PlayOwnedSound(AmpRedFireSound, BallisticFireSound.Slot, BallisticFireSound.Volume,, BallisticFireSound.Radius);		
	}
	else
	{
		// End:0x193
		if(((FMPMachinePistol(Weapon) != none) && int(FMPMachinePistol(Weapon).CurrentWeaponMode) == 2) && AmpGreenFireSound != none)
		{
			Weapon.PlayOwnedSound(AmpGreenFireSound, BallisticFireSound.Slot, BallisticFireSound.Volume,, BallisticFireSound.Radius);			
		}
		else
		{
			// End:0x1DB
			if(BallisticFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume,, BallisticFireSound.Radius);
			}
		}
	}
	CheckClipFinished();
	// End:0x203
	if(bAmped)
	{
		FMPMachinePistol(BW).AddHeat(AmpDrainPerShot);
	}
	//return;	
}

function DoFireEffect()
{
	super(BallisticInstantFire).DoFireEffect();
	// End:0x38
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		FMPMachinePistol(BW).AddHeat(AmpDrainPerShot);
	}
	//return;	
}

function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	super(BallisticInstantFire).ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x99
	if((Victim.bProjTarget && BallisticShield(Victim) == none) && int(FMPMachinePistol(Weapon).CurrentWeaponMode) == 1)
	{
		BW.TargetedHurtRadius(float(Damage), 256.0000000, Class'BWBP_SKC_Pro.DT_MP40_Incendiary', 200.0000000, HitLocation, Pawn(Victim));
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
	if(((Other == none) || Other.bWorldGeometry) && int(FMPMachinePistol(Weapon).CurrentWeaponMode) == 1)
	{
		BW.TargetedHurtRadius(3.0000000, 150.0000000, Class'BWBP_SKC_Pro.DT_MP40_Incendiary', 50.0000000, HitLocation);
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
	AmpRedFireSound=SoundGroup'BWBP_SKC_Sounds.MP40.MP40-HotFire'
	AmpGreenFireSound=SoundGroup'BWBP_SKC_Sounds.MP40.MP40-AcidFire'
	MuzzleFlashClassRed=Class'BallisticProV55.M50FlashEmitter'
	MuzzleFlashClassGreen=Class'BallisticProV55.A500FlashEmitter'
	AmpFlashBone="tip2"
	AmpFlashScaleFactor=0.3000000
	AmpDrainPerShot=-0.5000000
	TraceRange=(Min=9000.0000000,Max=9000.0000000)
	DamageType=Class'BWBP_SKC_Pro.DT_MP40Chest'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MP40Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MP40Chest'
	KickForce=18000
	HookStopFactor=0.2000000
	HookPullForce=-10.0000000
	PenetrateForce=150
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	BrassOffset=(X=-50.0000000,Y=1.0000000,Z=0.0000000)
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.9000000
	AimedFireAnim="SightFire"
	EmptyFireAnim="FireClosed"
	EmptyAimedFireAnim="SightFireClosed"
	FireRecoil=90.0000000
	FireChaos=0.0300000
	XInaccuracy=32.0000000
	YInaccuracy=32.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.MP40.MP40-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireRate=0.1050000
	AmmoClass=Class'BallisticProV55.Ammo_XRS10Bullets'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-60.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	aimerror=900.0000000
}
