class M2020GaussPrimaryFire extends BallisticProInstantFire;

var() Sound SpecialFireSound;
var() Sound LowPowerFireSound;
var bool bFlashAlt;
var() Actor MuzzleFlash2;
var() Class<Actor> MuzzleFlashClass2;

function PlayFiring()
{
	// End:0x29
	if(int(ScopeDownOn) == int(1))
	{
		BW.TemporaryScopeDown(0.5000000, 0.9000000);
	}
	PlayFireAnimations();
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0xA8
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	CheckClipFinished();
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
	if((MuzzleFlashClass2 != none) && (MuzzleFlash2 == none) || MuzzleFlash2.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash2, MuzzleFlashClass2, Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	}
	//return;	
}

simulated function DestroyEffects()
{
	super(BallisticFire).DestroyEffects();
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlash);
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlash2);
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
	// End:0xA8
	if((MuzzleFlash != none) && !bFlashAlt)
	{
		MuzzleFlash.Trigger(Weapon, Instigator);		
	}
	else
	{
		// End:0xD7
		if((MuzzleFlash2 != none) && bFlashAlt)
		{
			MuzzleFlash2.Trigger(Weapon, Instigator);
		}
	}
	// End:0xE8
	if(!bBrassOnCock)
	{
		EjectBrass();
	}
	//return;	
}

function StartBerserk()
{
	switch(BW.CurrentWeaponMode)
	{
		// End:0x2A
		case 0:
			FireRate = default.FireRate * 0.7500000;
			// End:0x59
			break;
		// End:0x44
		case 1:
			FireRate = 1.0000000 * 0.7500000;
			// End:0x59
			break;
		// End:0xFFFF
		default:
			FireRate = 0.2000000 * 0.7500000;
			break;
	}
	FireAnimRate = default.FireAnimRate / 0.7500000;
	FireRecoil = default.FireRecoil * 0.7500000;
	FireChaos = default.FireChaos * 0.7500000;
	//return;	
}

function StopBerserk()
{
	switch(BW.CurrentWeaponMode)
	{
		// End:0x23
		case 0:
			FireRate = default.FireRate;
			// End:0x44
			break;
		// End:0x36
		case 1:
			FireRate = 1.0000000;
			// End:0x44
			break;
		// End:0xFFFF
		default:
			FireRate = 0.2000000;
			break;
	}
	FireAnimRate = default.FireAnimRate;
	FireRecoil = default.FireRecoil;
	FireChaos = default.FireChaos;
	//return;	
}

simulated function SwitchWeaponMode(byte newmode)
{
	// End:0x86
	if(int(newmode) == 0)
	{
		FirePushbackForce = default.FirePushbackForce;
		bFlashAlt = false;
		KickForce = default.KickForce;
		// End:0x64
		if(M2020GaussDMR(Weapon).bSuppressed)
		{
			M2020GaussAttachment(Weapon.ThirdPersonActor).CurrentTracerMode = 1;			
		}
		else
		{
			M2020GaussAttachment(Weapon.ThirdPersonActor).CurrentTracerMode = 2;
		}		
	}
	else
	{
		// End:0xD3
		if(int(newmode) == 1)
		{
			FirePushbackForce = 120.0000000;
			KickForce = 1000;
			bFlashAlt = false;
			M2020GaussAttachment(Weapon.ThirdPersonActor).CurrentTracerMode = 3;			
		}
		else
		{
			// End:0x12E
			if((int(newmode) == 2) || int(newmode) == 3)
			{
				FirePushbackForce = 0.0000000;
				bFlashAlt = true;
				KickForce = default.KickForce;
				M2020GaussAttachment(Weapon.ThirdPersonActor).CurrentTracerMode = 0;
			}
		}
	}
	//return;	
}

defaultproperties
{
	SpecialFireSound=Sound'BWBP_SKC_Sounds.M50A2.M2020-GaussFireSuper'
	LowPowerFireSound=Sound'BWBP_SKC_Sounds.M50A2.M2020-GaussFireLow'
	MuzzleFlashClass2=Class'BallisticProV55.M50FlashEmitter'
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	DamageType=Class'BWBP_SKC_Pro.DT_M2020Pwr'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_M2020HeadPwr'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_M2020LimbPwr'
	PenetrateForce=600
	bPenetrate=true
	PDamageFactor=0.7500000
	WallPDamageFactor=0.7500000
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	BrassOffset=(X=-30.0000000,Y=1.0000000,Z=0.0000000)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.M2020FlashEmitter'
	FlashScaleFactor=1.2000000
	FireRecoil=320.0000000
	FireChaos=0.6000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.M2020.M2020-GaussFire',Volume=6.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireRate=0.3250000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_42HVG'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-300.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.4000000
	aimerror=800.0000000
}
