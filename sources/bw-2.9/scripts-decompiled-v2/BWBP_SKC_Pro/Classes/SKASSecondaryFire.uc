class SKASSecondaryFire extends BallisticProShotgunFire;

var float RailPower;
var float ChargeRate;
var float PowerLevel;
var float MaxCharge;
var Sound ChargeSound;
var Sound UltraChargeSound;
var() Sound UltraFireSound;

simulated event ModeDoFire()
{
	// End:0x46
	if((RailPower + 0.0100000) >= PowerLevel)
	{
		super.ModeDoFire();
		SKASShotgun(BW).CoolRate = SKASShotgun(BW).default.CoolRate;		
	}
	else
	{
		SKASShotgun(BW).CoolRate = SKASShotgun(BW).default.CoolRate * float(3);
	}
	SKASShotgun(BW).Heat += RailPower;
	RailPower = 0.0000000;
	//return;	
}

simulated function StopFiring()
{
	HoldTime = 0.0000000;
	super(BallisticFire).StopFiring();
	//return;	
}

simulated function PlayStartHold()
{
	Weapon.PlayAnim('ChargeUp', 1.0000000, 0.1000000);
	//return;	
}

function float ResolveDamageFactors(Actor Other, Vector TraceStart, Vector HitLocation, int PenetrateCount, int WallCount, int WallPenForce, Vector WaterHitLocation)
{
	return super(BallisticInstantFire).ResolveDamageFactors(Other, TraceStart, HitLocation, PenetrateCount, WallCount, WallPenForce, WaterHitLocation) * RailPower;
	//return;	
}

simulated function ModeTick(float dt)
{
	super(BallisticFire).ModeTick(dt);
	// End:0xD6
	if(SKASShotgun(BW).Heat <= float(0))
	{
		MaxCharge = RailPower;
		// End:0x99
		if(HoldTime > float(0))
		{
			RailPower = FMin(RailPower + (ChargeRate * dt), PowerLevel);
			Instigator.AmbientSound = ChargeSound;
			Instigator.SoundVolume = byte(255);
			Instigator.SoundPitch = 64;			
		}
		else
		{
			Instigator.AmbientSound = BW.UsedAmbientSound;
			Instigator.SoundVolume = Instigator.default.SoundVolume;
		}		
	}
	else
	{
		Instigator.AmbientSound = BW.UsedAmbientSound;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
	}
	// End:0x11D
	if(!bIsFiring)
	{
		return;
	}
	// End:0x140
	if(RailPower >= PowerLevel)
	{
		Weapon.StopFire(ThisModeNum);
	}
	//return;	
}

simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
{
	SKASAttachment(Weapon.ThirdPersonActor).SKASUpdateHit(Other, HitLocation, HitNormal, Surf);
	//return;	
}

simulated function DestroyEffects()
{
	// End:0x17
	if(MuzzleFlash != none)
	{
		MuzzleFlash.Destroy();
	}
	super(BallisticFire).DestroyEffects();
	//return;	
}

simulated state SpinUpFire
{
	simulated function bool AllowFire()
	{
		// End:0x1D
		if(SKASShotgun(BW).BarrelSpeed > float(0))
		{
			return false;
		}
		return super(BallisticFire).AllowFire();
		//return;		
	}
	stop;	
}

simulated state Scope
{
	simulated function ApplyFireEffectParams(FireEffectParams effect_params)
	{
		super(BallisticFire).ApplyFireEffectParams(effect_params);
		bUseWeaponMag = false;
		bFireOnRelease = true;
		bModeExclusive = false;
		// End:0x34
		if(bFireOnRelease)
		{
			bWaitForRelease = true;
		}
		// End:0x45
		if(bWaitForRelease)
		{
			bNowWaiting = true;
		}
		//return;		
	}

	simulated function bool AllowFire()
	{
		// End:0x0D
		if(!CheckReloading())
		{
			return false;
		}
		// End:0x1A
		if(!CheckWeaponMode())
		{
			return false;
		}
		// End:0xB0
		if(!bUseWeaponMag || BW.bNoMag)
		{
			// End:0xAD
			if(!super(WeaponFire).AllowFire())
			{
				// End:0xAB
				if(DryFireSound.Sound != none)
				{
					Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
				}
				return false;
			}			
		}
		else
		{
			// End:0x1A4
			if(BW.MagAmmo < AmmoPerFire)
			{
				// End:0x144
				if(!bPlayedDryFire && DryFireSound.Sound != none)
				{
					Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
					bPlayedDryFire = true;
				}
				// End:0x15E
				if(bDryUncock)
				{
					BW.bNeedCock = true;
				}
				BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), 0.0000000);
				BW.EmptyFire(byte(ThisModeNum));
				return false;				
			}
			else
			{
				// End:0x1BB
				if(BW.bNeedReload)
				{
					return false;					
				}
				else
				{
					// End:0x1CF
					if(BW.bNeedCock)
					{
						return false;
					}
				}
			}
		}
		return true;
		//return;		
	}

	simulated function PostBeginPlay()
	{
		// End:0x3C
		if((ThisModeNum == 0) && Weapon.AmmoClass[1] != none)
		{
			AmmoClass = Weapon.AmmoClass[1];			
		}
		else
		{
			// End:0x68
			if(Weapon.AmmoClass[0] != none)
			{
				AmmoClass = Weapon.AmmoClass[0];
			}
		}
		super(WeaponFire).PostBeginPlay();
		//return;		
	}

	simulated function bool CheckReloading()
	{
		// End:0x2F
		if(BW.bScopeView && int(BW.ReloadState) == int(8))
		{
			return true;
		}
		return super(BallisticFire).CheckReloading();
		//return;		
	}

	simulated event ModeDoFire()
	{
		// End:0x2E
		if(Instigator.IsLocallyControlled() && BW != none)
		{
			BW.ScopeViewRelease();
		}
		//return;		
	}

	simulated function PlayPreFire()
	{
		// End:0x6A
		if(Instigator.IsLocallyControlled() && BW != none)
		{
			BW.ScopeView();
			// End:0x6A
			if(!BW.bNoTweenToScope)
			{
				BW.TweenAnim(BW.IdleAnim, BW.SightingTime);
			}
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	ChargeRate=1.0000000
	PowerLevel=1.0000000
	ChargeSound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-TriCharge'
	UltraChargeSound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-UltraCharge'
	UltraFireSound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-Ultra'
	TraceCount=30
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2560.0000000,Max=2560.0000000)
	DamageType=Class'BWBP_SKC_Pro.DTSKASShotgunAlt'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSKASShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSKASShotgunAlt'
	KickForce=400
	PenetrateForce=100
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_MRS138Shotgun'
	BrassOffset=(X=-1.0000000,Y=0.0000000,Z=-1.0000000)
	bCockAfterEmpty=true
	MuzzleFlashClass=Class'BallisticProV55.M763FlashEmitter'
	FireRecoil=1500.0000000
	FirePushbackForce=850.0000000
	FireChaos=1.0000000
	XInaccuracy=378.0000000
	YInaccuracy=378.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-Triple',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bFireOnRelease=true
	bWaitForRelease=true
	FireAnim="FireBig"
	FireEndAnim="None"
	FireRate=1.7000000
	AmmoClass=Class'BallisticProV55.Ammo_MRS138Shells'
	AmmoPerFire=3
	ShakeRotMag=(X=256.0000000,Y=128.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.5000000
	ShakeOffsetMag=(X=-50.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.5000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
}
