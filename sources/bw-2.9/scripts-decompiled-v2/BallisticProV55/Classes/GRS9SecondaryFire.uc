class GRS9SecondaryFire extends BallisticProInstantFire;

var() Sound FireSoundLoop;
var float StopFireTime;
var bool bLaserFiring;
var() Sound ChargeSound;
var() byte ChargeSoundPitch;
var() float DecayCharge;

simulated function bool CheckWeaponMode()
{
	// End:0x28
	if((Instigator != none) && AIController(Instigator.Controller) != none)
	{
		return true;
	}
	// End:0x41
	if(GRS9Pistol(Weapon).bHasKnife)
	{
		return true;
	}
	return BW.CheckWeaponMode(ThisModeNum);
	//return;	
}

simulated state CombatLaser
{
	simulated function bool AllowFire()
	{
		// End:0x5A
		if((((Level.TimeSeconds - StopFireTime) < 0.8000000) || GRS9Pistol(Weapon).LaserAmmo <= float(0)) || !super(BallisticFire).AllowFire())
		{
			// End:0x58
			if(bLaserFiring)
			{
				StopFiring();
			}
			return false;
		}
		return true;
		//return;		
	}

	simulated function bool HasAmmo()
	{
		return GRS9Pistol(Weapon).LaserAmmo > float(0);
		//return;		
	}

	simulated function bool CheckWeaponMode()
	{
		// End:0x2C
		if(Weapon.IsInState('DualAction') || Weapon.IsInState('PendingDualAction'))
		{
			return false;
		}
		return true;
		//return;		
	}

	function DoFireEffect()
	{
		// End:0x2F
		if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
		{
			GRS9Pistol(Weapon).LaserAmmo -= 0.0800000;			
		}
		else
		{
			GRS9Pistol(Weapon).LaserAmmo -= 0.1500000;
		}
		GRS9Pistol(Weapon).ServerSwitchLaser(true);
		bLaserFiring = true;
		super(BallisticInstantFire).DoFireEffect();
		//return;		
	}

	function PlayFiring()
	{
		super(BallisticFire).PlayFiring();
		// End:0x25
		if(FireSoundLoop != none)
		{
			Instigator.AmbientSound = FireSoundLoop;
		}
		bLaserFiring = true;
		//return;		
	}

	function StopFiring()
	{
		bLaserFiring = false;
		Instigator.AmbientSound = none;
		GRS9Pistol(Weapon).ServerSwitchLaser(false);
		StopFireTime = Level.TimeSeconds;
		//return;		
	}

	simulated event ModeDoFire()
	{
		// End:0x2F
		if(GRS9Pistol(Weapon).bBigLaser)
		{
			BallisticFireSound.Sound = default.BallisticFireSound.Sound;			
		}
		else
		{
			BallisticFireSound.Sound = none;
		}
		super(BallisticProInstantFire).ModeDoFire();
		//return;		
	}

	simulated function ApplyRecoil()
	{
		// End:0x26
		if(BW != none)
		{
			BW.AddRecoil(FireRecoil, float(ThisModeNum));
		}
		//return;		
	}

	simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
	{
		BallisticWeapon(Weapon).TargetedHurtRadius(7.0000000, 20.0000000, Class'BallisticProV55.DTGRS9Laser', 0.0000000, HitLocation, Pawn(Other));
		return super(BallisticInstantFire).ImpactEffect(HitLocation, HitNormal, HitMat, Other, WaterHitLoc);
		//return;		
	}
	stop;	
}

simulated state LaserSight
{
	simulated function ApplyFireEffectParams(FireEffectParams effect_params)
	{
		bUseWeaponMag = false;
		bFireOnRelease = true;
		bWaitForRelease = true;
		bModeExclusive = false;
		bIgnoreReload = true;
		FireRate = 0.2000000;
		// End:0x44
		if(bFireOnRelease)
		{
			bWaitForRelease = true;
		}
		// End:0x55
		if(bWaitForRelease)
		{
			bNowWaiting = true;
		}
		//return;		
	}

	event ModeDoFire()
	{
		// End:0x43
		if(int(Weapon.Role) == int(ROLE_Authority))
		{
			GRS9Pistol(Weapon).ServerSwitchLaser(!GRS9Pistol(Weapon).bLaserOn);
		}
		//return;		
	}
	stop;	
}

simulated state Flash
{
	simulated function ApplyFireEffectParams(FireEffectParams effect_params)
	{
		super(BallisticFire).ApplyFireEffectParams(effect_params);
		bFireOnRelease = true;
		bModeExclusive = false;
		bWaitForRelease = true;
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

	function float MaxRange()
	{
		return 1200.0000000;
		//return;		
	}

	function PlayStartHold()
	{
		HoldTime = FMax(DecayCharge, 0.1000000);
		Weapon.AmbientSound = ChargeSound;
		Weapon.ThirdPersonActor.AmbientSound = ChargeSound;
		Weapon.SoundVolume = byte(float(48) + ((FMin(MaxHoldTime, HoldTime) / MaxHoldTime) * float(128)));
		Weapon.SoundPitch = byte(float(ChargeSoundPitch) + ((FMin(MaxHoldTime, HoldTime) / MaxHoldTime) * float(ChargeSoundPitch)));
		Weapon.ThirdPersonActor.SoundVolume = byte(float(48) + ((FMin(MaxHoldTime, HoldTime) / MaxHoldTime) * float(128)));
		Weapon.ThirdPersonActor.SoundPitch = byte(float(ChargeSoundPitch) + ((FMin(MaxHoldTime, HoldTime) / MaxHoldTime) * float(ChargeSoundPitch)));
		BW.bPreventReload = true;
		//return;		
	}

	function ModeTick(float DeltaTime)
	{
		super(BallisticFire).ModeTick(DeltaTime);
		// End:0xF5
		if(bIsFiring)
		{
			Weapon.ThirdPersonActor.SoundVolume = byte(float(48) + ((FMin(MaxHoldTime, HoldTime) / MaxHoldTime) * float(128)));
			Weapon.ThirdPersonActor.SoundPitch = byte(float(ChargeSoundPitch) + ((FMin(MaxHoldTime, HoldTime) / MaxHoldTime) * float(ChargeSoundPitch)));
			Weapon.SoundVolume = byte(float(48) + ((FMin(MaxHoldTime, HoldTime) / MaxHoldTime) * float(128)));
			Weapon.SoundPitch = byte(float(ChargeSoundPitch) + ((FMin(MaxHoldTime, HoldTime) / MaxHoldTime) * float(ChargeSoundPitch)));			
		}
		else
		{
			// End:0x234
			if(DecayCharge > float(0))
			{
				Weapon.ThirdPersonActor.SoundVolume = byte(float(48) + ((FMin(MaxHoldTime, DecayCharge) / MaxHoldTime) * float(128)));
				Weapon.ThirdPersonActor.SoundPitch = byte(float(ChargeSoundPitch) + ((FMin(MaxHoldTime, DecayCharge) / MaxHoldTime) * float(ChargeSoundPitch)));
				Weapon.SoundVolume = byte(float(48) + ((FMin(MaxHoldTime, DecayCharge) / MaxHoldTime) * float(128)));
				Weapon.SoundPitch = byte(float(ChargeSoundPitch) + ((FMin(MaxHoldTime, DecayCharge) / MaxHoldTime) * float(ChargeSoundPitch)));
				DecayCharge -= (DeltaTime * 2.5000000);
				// End:0x234
				if(DecayCharge < float(0))
				{
					DecayCharge = 0.0000000;
					Weapon.ThirdPersonActor.AmbientSound = none;
					Weapon.AmbientSound = none;
				}
			}
		}
		//return;		
	}

	simulated event ModeDoFire()
	{
		// End:0x7F
		if((HoldTime >= MaxHoldTime) || (int(Level.NetMode) == int(NM_DedicatedServer)) && HoldTime >= (MaxHoldTime - 0.1000000))
		{
			super(BallisticFire).ModeDoFire();
			Weapon.ThirdPersonActor.AmbientSound = none;
			Weapon.AmbientSound = none;
			DecayCharge = 0.0000000;			
		}
		else
		{
			DecayCharge = HoldTime;
			NextFireTime = Level.TimeSeconds + (DecayCharge * 0.3500000);
		}
		HoldTime = 0.0000000;
		//return;		
	}

	function ServerPlayFiring()
	{
		// End:0x67
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		}
		CheckClipFinished();
		//return;		
	}

	function PlayFiring()
	{
		ClientPlayForceFeedback(FireForce);
		FireCount++;
		// End:0x79
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		}
		CheckClipFinished();
		//return;		
	}

	function DoFireEffect()
	{
		local Controller C;
		local Vector StartTrace, Dir, EnemyEye;
		local float DF, dist, EnemyDF;
		local int i;
		local GRS9ViewMesser vm;

		Dir = (GetFireSpread()) >> (GetFireAim(StartTrace));
		C = Level.ControllerList;
		J0x2E:

		// End:0x31C [Loop If]
		if(C != none)
		{
			// End:0x94
			if(((C.Pawn == none) || C.Pawn.Health <= 0) || C.GetTeamNum() == Instigator.GetTeamNum())
			{				
			}
			else
			{
				EnemyEye = C.Pawn.EyePosition() + C.Pawn.Location;
				dist = VSize(EnemyEye - StartTrace);
				DF = Dir Dot Normal(EnemyEye - StartTrace);
				// End:0x305
				if(((DF > 0.8000000) && dist < float(1200)) && Weapon.FastTrace(EnemyEye, StartTrace))
				{
					EnemyDF = Normal(StartTrace - EnemyEye) Dot Vector(C.Pawn.GetViewRotation());
					EnemyDF = (EnemyDF + float(1)) / float(2);
					// End:0x197
					if(EnemyDF < -0.7000000)
					{
						EnemyDF = 0.1000000;
					}
					DF = (DF - 0.8000000) * float(5);
					// End:0x1E3
					if(dist > float(500))
					{
						DF /= (float(1) + ((dist - float(500)) / float(700)));
					}
					DF *= EnemyDF;
					// End:0x2B3
					if(PlayerController(C) != none)
					{
						i = 0;
						J0x206:

						// End:0x26A [Loop If]
						if(i < C.Attached.Length)
						{
							// End:0x260
							if(GRS9ViewMesser(C.Attached[i]) != none)
							{
								vm = GRS9ViewMesser(C.Attached[i]);
								// [Explicit Break]
								goto J0x26A;
							}
							i++;
							// [Loop Continue]
							goto J0x206;
						}
						J0x26A:

						// End:0x29C
						if(vm == none)
						{
							vm = Spawn(Class'BallisticProV55.GRS9ViewMesser', C);
							vm.SetBase(C);
						}
						vm.AddImpulse(DF);						
					}
					else
					{
						// End:0x305
						if((AIController(C) != none) && DF > 0.1000000)
						{
							Class'BCoreProV55.BC_BotStoopidizer'.static.DoBotStun(AIController(C), 2.0000000 * DF, 12.0000000 * DF);
						}
					}
				}
			}
			C = C.nextController;
			// [Loop Continue]
			goto J0x2E;
		}
		SendFireEffect(none, StartTrace + (Dir * float(1000)), -Dir, 0);
		super(BallisticFire).DoFireEffect();
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
	FireSoundLoop=Sound'BW_Core_WeaponSound.Glock.Glk-LaserBurn'
	ChargeSound=Sound'BW_Core_WeaponSound.A73.A73ProjFly'
	ChargeSoundPitch=32
	DamageType=Class'BallisticProV55.DTGRS9Laser'
	DamageTypeHead=Class'BallisticProV55.DTGRS9LaserHead'
	DamageTypeArm=Class'BallisticProV55.DTGRS9Laser'
	PenetrateForce=200
	bPenetrate=true
	FlashBone="tip2"
	bUseWeaponMag=false
	FireChaos=0.0000000
	XInaccuracy=2.0000000
	YInaccuracy=2.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-LaserFire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireAnim="Idle"
	FireRate=0.0800000
	AmmoClass=Class'BallisticProV55.Ammo_GRSNine'
	AmmoPerFire=0
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
	aimerror=900.0000000
}
