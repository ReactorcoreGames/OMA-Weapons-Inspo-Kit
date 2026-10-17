class LS14PrimaryFire extends BallisticProInstantFire;

var() Actor MuzzleFlash2;
var bool bSecondBarrel;
var bool bIsDouble;
var bool bAnimatedOverheat;
var() Sound FireSoundLoop;
var() Sound FireSoundLoopRapid;
var() Sound SpinUpSound;
var() Sound SpinDownSound;
var() Sound SpinDownSoundRapid;
var float StopFireTime;
var bool bLaserFiring;
var bool bSpinUp;
var bool bPreventFire;
var float SelfHeatPerShot;
var float SelfHeatPerShotDouble;
var float SelfHeatDeclineDelay;

simulated function bool AllowFire()
{
	// End:0x2B
	if((LS14Carbine(Weapon).SelfHeatLevel >= float(10)) || !super(BallisticFire).AllowFire())
	{
		return false;
	}
	return true;
	//return;	
}

function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	LS14Carbine(BW).AddHeat(SelfHeatPerShot, 0.0000000, SelfHeatDeclineDelay);
	//return;	
}

function DoFireEffect()
{
	super(BallisticInstantFire).DoFireEffect();
	// End:0x42
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		LS14Carbine(BW).AddHeat(SelfHeatPerShot, 0.0000000, SelfHeatDeclineDelay);
	}
	//return;	
}

function InitEffects()
{
	super(BallisticFire).InitEffects();
	// End:0x6A
	if((MuzzleFlashClass != none) && (MuzzleFlash2 == none) || MuzzleFlash2.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash2, MuzzleFlashClass, Weapon.DrawScale * FlashScaleFactor, Weapon, 'tip2');
	}
	//return;	
}

simulated function SwitchWeaponMode(byte newmode)
{
	super(BallisticInstantFire).SwitchWeaponMode(newmode);
	// End:0x39
	if(int(newmode) == 0)
	{
		bIsDouble = false;
		SelfHeatPerShot = default.SelfHeatPerShot;
		SelfHeatDeclineDelay = default.SelfHeatDeclineDelay;		
	}
	else
	{
		bIsDouble = true;
		SelfHeatPerShot = default.SelfHeatPerShotDouble;
		SelfHeatDeclineDelay = default.SelfHeatDeclineDelay * float(2);
	}
	//return;	
}

function ApplyDamage(Actor Target, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	// End:0x55
	if((Pawn(Target) != none) && Pawn(Target).bProjTarget)
	{
		Damage += LS14Carbine(BW).ManageHeatInteraction(Pawn(Target), int(HeatPerShot));
	}
	super(BallisticInstantFire).ApplyDamage(Target, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x16E
	if((AllowFire()) && !LS14Carbine(Weapon).bIsReloadingGrenade)
	{
		// End:0xF1
		if(bAnimatedOverheat)
		{
			// End:0x58
			if(LS14Carbine(Weapon).SelfHeatLevel >= 8.5000000)
			{
				FireAnim = 'Overheat';				
			}
			else
			{
				// End:0x8E
				if(bIsDouble && LS14Carbine(Weapon).SelfHeatLevel >= 6.5000000)
				{
					FireAnim = 'FiddleOne';					
				}
				else
				{
					// End:0xE3
					if(((LS14Carbine(Weapon).SelfHeatLevel > 6.5000000) && LS14Carbine(Weapon).SelfHeatLevel < 8.5000000) || bIsDouble)
					{
						FireAnim = 'FireBig';						
					}
					else
					{
						FireAnim = 'Fire';
					}
				}
			}			
		}
		else
		{
			// End:0x108
			if(bIsDouble)
			{
				FireAnim = 'FireBig';				
			}
			else
			{
				FireAnim = 'Fire';
			}
		}
		AimedFireAnim = FireAnim;
		// End:0x14A
		if(!bSecondBarrel)
		{
			bSecondBarrel = true;
			LS14Carbine(Weapon).bBarrelsOnline = true;			
		}
		else
		{
			bSecondBarrel = false;
			LS14Carbine(Weapon).bBarrelsOnline = false;
		}
		super.ModeDoFire();
	}
	// End:0x1AD
	if((LS14Carbine(Weapon) != none) && LS14Carbine(Weapon).bIsReloadingGrenade)
	{
		LS14Carbine(Weapon).bWantsToShoot = true;
	}
	//return;	
}

function FlashMuzzleFlash()
{
	local Coords C;
	local Vector Start, X, Y, Z;

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
	// End:0xC9
	if((bIsDouble && MuzzleFlash2 != none) && MuzzleFlash != none)
	{
		MuzzleFlash2.Trigger(Weapon, Instigator);
		MuzzleFlash.Trigger(Weapon, Instigator);
	}
	// End:0x115
	if(bSecondBarrel && MuzzleFlash2 != none)
	{
		C = Weapon.GetBoneCoords('tip2');
		MuzzleFlash2.Trigger(Weapon, Instigator);		
	}
	else
	{
		// End:0x153
		if(MuzzleFlash != none)
		{
			C = Weapon.GetBoneCoords('tip');
			MuzzleFlash.Trigger(Weapon, Instigator);
		}
	}
	// End:0x169
	if(!Class'BCoreProV55.BallisticMod'.default.bMuzzleSmoke)
	{
		return;
	}
	Weapon.GetViewAxes(X, Y, Z);
	Start = (C.Origin + (X * float(-180))) + (Y * float(3));
	//return;	
}

simulated state GatlingLaser
{
	simulated event ModeDoFire()
	{
		// End:0x0D
		if(!AllowFire())
		{
			return;
		}
		// End:0x98
		if((LS14Carbine(BW).bRapid && !bSpinUp) && !bPreventFire)
		{
			Weapon.PlayOwnedSound(SpinUpSound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			bSpinUp = true;
		}
		// End:0xE9
		if((LS14Carbine(BW).bRapid && LS14Carbine(BW).LaserCharge < LS14Carbine(BW).MaxCharge) || bPreventFire)
		{
			return;
		}
		super(BallisticProInstantFire).ModeDoFire();
		//return;		
	}

	simulated function ModeTick(float dt)
	{
		// End:0x4A
		if((BW.MagAmmo == 0) || BW.bNoMag && BW.AmmoAmount(ThisModeNum) == 0)
		{
			StopFiring();
		}
		// End:0x214
		if(LS14Carbine(BW).bRapid)
		{
			// End:0x104
			if((bIsFiring && !bPreventFire) && BW.MagAmmo > 0)
			{
				LS14Carbine(BW).SetLaserCharge(FMin(LS14Carbine(BW).LaserCharge + ((LS14Carbine(BW).ChargeRate * dt) * float(1 + (2 * int(BW.bBerserk)))), LS14Carbine(BW).MaxCharge));				
			}
			else
			{
				// End:0x214
				if(LS14Carbine(BW).LaserCharge > float(0))
				{
					// End:0x183
					if(((Level.TimeSeconds > StopFireTime) || BW.MagAmmo == 0) || BW.bNoMag && BW.AmmoAmount(ThisModeNum) == 0)
					{
						StopFiring();
					}
					bPreventFire = true;
					LS14Carbine(BW).SetLaserCharge(FMax(0.0000000, LS14Carbine(BW).LaserCharge - ((LS14Carbine(BW).CoolRate * dt) * float(1 + (2 * int(BW.bBerserk))))));
					// End:0x214
					if(LS14Carbine(BW).LaserCharge <= float(0))
					{
						bPreventFire = false;
					}
				}
			}
		}
		super(BallisticFire).ModeTick(dt);
		//return;		
	}

	function DoFireEffect()
	{
		bLaserFiring = true;
		super(BallisticInstantFire).DoFireEffect();
		//return;		
	}

	function PlayFiring()
	{
		super(BallisticFire).PlayFiring();
		// End:0x54
		if((FireSoundLoopRapid != none) && LS14Carbine(BW).bRapid)
		{
			Instigator.AmbientSound = FireSoundLoopRapid;
			Instigator.SoundVolume = byte(255);			
		}
		else
		{
			// End:0xA1
			if((FireSoundLoop != none) && !LS14Carbine(BW).bHighPower)
			{
				Instigator.AmbientSound = FireSoundLoop;
				Instigator.SoundVolume = byte(255);
			}
		}
		bLaserFiring = true;
		//return;		
	}

	function ServerPlayFiring()
	{
		super(BallisticFire).ServerPlayFiring();
		// End:0x54
		if((FireSoundLoopRapid != none) && LS14Carbine(BW).bRapid)
		{
			Instigator.AmbientSound = FireSoundLoopRapid;
			Instigator.SoundVolume = byte(255);			
		}
		else
		{
			// End:0x86
			if(FireSoundLoop != none)
			{
				Instigator.AmbientSound = FireSoundLoop;
				Instigator.SoundVolume = byte(255);
			}
		}
		bLaserFiring = true;
		//return;		
	}

	function StopFiring()
	{
		// End:0xC7
		if(bLaserFiring)
		{
			// End:0x75
			if(LS14Carbine(BW).bRapid)
			{
				Weapon.PlayOwnedSound(SpinDownSoundRapid, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);				
			}
			else
			{
				Weapon.PlayOwnedSound(SpinDownSound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}
		}
		bSpinUp = false;
		Instigator.AmbientSound = LS14Carbine(BW).UsedAmbientSound;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
		bLaserFiring = false;
		StopFireTime = Level.TimeSeconds;
		//return;		
	}

	simulated function CheckClipFinished()
	{
		// End:0x131
		if((ClipFinishSound.Sound != none) && (bUseWeaponMag && (float(BW.MagAmmo) - load) < float(1)) || BW.bNoMag && (float(BW.AmmoAmount(ThisModeNum)) - load) < float(1))
		{
			bSpinUp = false;
			Instigator.AmbientSound = LS14Carbine(BW).UsedAmbientSound;
			Instigator.SoundVolume = Instigator.default.SoundVolume;
			bLaserFiring = false;
			Weapon.PlayOwnedSound(ClipFinishSound.Sound, ClipFinishSound.Slot, ClipFinishSound.Volume, ClipFinishSound.bNoOverride, ClipFinishSound.Radius, ClipFinishSound.Pitch, ClipFinishSound.bAtten);
			BW.StopFire(ThisModeNum);
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	FireSoundLoop=Sound'BWBP_SKC_Sounds.LS440.LS440-FireLoop'
	FireSoundLoopRapid=Sound'BWBP_SKC_Sounds.LS440.LS440-FireLoopRapid'
	SpinUpSound=Sound'BWBP_SKC_Sounds.LS440.LS440-SpinUp'
	SpinDownSound=Sound'BWBP_SKC_Sounds.LS440.LS440-SpinDown'
	SpinDownSoundRapid=Sound'BWBP_SKC_Sounds.LS440.LS440-SpinDownRapid'
	SelfHeatPerShot=0.6000000
	SelfHeatPerShotDouble=1.5000000
	SelfHeatDeclineDelay=0.5000000
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	DamageType=Class'BWBP_SKC_Pro.DTLS14Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTLS14Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTLS14Limb'
	PenetrateForce=500
	bPenetrate=true
	ClipFinishSound=(Sound=Sound'BWBP_SKC_Sounds.LS14.Gauss-LastShot',Volume=1.0000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	DryFireSound=(Sound=Sound'BWBP_SKC_Sounds.LS14.Gauss-Empty',Volume=1.2000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.LS14FlashEmitter'
	FlashScaleFactor=0.4000000
	AimedFireAnim="SightFire"
	FireRecoil=150.0000000
	FireChaos=0.3000000
	BallisticFireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.LS14.Gauss-Fire',Volume=0.9000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireRate=0.1500000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_Laser'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-60.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.9900000
	WarnTargetPct=0.3000000
	aimerror=800.0000000
}
