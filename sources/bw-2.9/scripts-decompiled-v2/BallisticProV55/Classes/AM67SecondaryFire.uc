class AM67SecondaryFire extends BallisticInstantFire;

var() Sound FireSoundLoop;
var float StopFireTime;
var bool bLaserFiring;
var() float LaserAmmoPerFire;
var() Sound ChargeSound;
var() byte ChargeSoundPitch;
var() float DecayCharge;

simulated state CombatLaser
{
	simulated function bool AllowFire()
	{
		// End:0x94
		if(((((AM67Pistol(Weapon).LaserAmmo < AM67Pistol(Weapon).default.LaserAmmo) && !bLaserFiring) || (Level.TimeSeconds - StopFireTime) < 0.7500000) || AM67Pistol(Weapon).LaserAmmo <= float(0)) || !super(BallisticFire).AllowFire())
		{
			// End:0x92
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
		return AM67Pistol(Weapon).LaserAmmo > float(0);
		//return;		
	}

	simulated function bool CheckWeaponMode()
	{
		return true;
		//return;		
	}

	function DoFireEffect()
	{
		AM67Pistol(Weapon).LaserAmmo -= LaserAmmoPerFire;
		AM67Pistol(Weapon).ServerSwitchLaser(true);
		bLaserFiring = true;
		super(BallisticInstantFire).DoFireEffect();
		//return;		
	}

	function PlayFiring()
	{
		// End:0x29
		if(int(ScopeDownOn) == int(1))
		{
			BW.TemporaryScopeDown(0.5000000, 0.9000000);
		}
		ClientPlayForceFeedback(FireForce);
		FireCount++;
		// End:0xA2
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		}
		CheckClipFinished();
		// End:0xC7
		if(FireSoundLoop != none)
		{
			Weapon.AmbientSound = FireSoundLoop;
		}
		bLaserFiring = true;
		//return;		
	}

	function StopFiring()
	{
		bLaserFiring = false;
		Weapon.AmbientSound = none;
		AM67Pistol(Weapon).ServerSwitchLaser(false);
		StopFireTime = Level.TimeSeconds;
		//return;		
	}

	simulated event ModeDoFire()
	{
		// End:0x23
		if(!bLaserFiring)
		{
			BallisticFireSound.Sound = default.BallisticFireSound.Sound;			
		}
		else
		{
			BallisticFireSound.Sound = none;
		}
		LaserAmmoPerFire = default.LaserAmmoPerFire * (float(1) + (float(4) * FMax(0.0000000, AM67Pistol(Weapon).LaserAmmo - 0.5000000)));
		super(BallisticFire).ModeDoFire();
		//return;		
	}

	function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
	{
		super(BallisticInstantFire).ApplyDamage(Victim, int(float(Damage) * (float(1) + (float(4) * FMax(0.0000000, AM67Pistol(Weapon).LaserAmmo - 0.4000000)))), Instigator, HitLocation, MomentumDir, DamageType);
		// End:0xC8
		if(Victim.bProjTarget)
		{
			BW.TargetedHurtRadius(5.0000000 * (float(1) + (float(4) * FMax(0.0000000, AM67Pistol(Weapon).LaserAmmo - 0.4000000))), 20.0000000, Class'BallisticProV55.DTSARLaser', 0.0000000, HitLocation, Pawn(Victim));
		}
		//return;		
	}

	simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
	{
		// End:0x75
		if((Other == none) || Other.bWorldGeometry)
		{
			BW.TargetedHurtRadius(5.0000000 * (float(1) + (float(4) * FMax(0.0000000, AM67Pistol(Weapon).LaserAmmo - 0.4000000))), 20.0000000, Class'BallisticProV55.DTSARLaser', 50.0000000, HitLocation);
		}
		return super(BallisticInstantFire).ImpactEffect(HitLocation, HitNormal, HitMat, Other, WaterHitLoc);
		//return;		
	}
	stop;	
}

simulated state LaserSight
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

	event ModeDoFire()
	{
		// End:0x43
		if(int(Weapon.Role) == int(ROLE_Authority))
		{
			AM67Pistol(Weapon).ServerSwitchLaser(!AM67Pistol(Weapon).bLaserOn);
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
		local AM67ViewMesser vm;

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
							if(AM67ViewMesser(C.Attached[i]) != none)
							{
								vm = AM67ViewMesser(C.Attached[i]);
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
							vm = Spawn(Class'BallisticProV55.AM67ViewMesser', C);
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

defaultproperties
{
	FireSoundLoop=Sound'BW_Core_WeaponSound.Glock.Glk-LaserBurn'
	LaserAmmoPerFire=0.0500000
	ChargeSound=Sound'BW_Core_WeaponSound.A73.A73ProjFly'
	ChargeSoundPitch=32
	RangeAtten=0.1000000
	DamageType=Class'BallisticProV55.DTAM67Laser'
	DamageTypeHead=Class'BallisticProV55.DTAM67LaserHead'
	DamageTypeArm=Class'BallisticProV55.DTAM67Laser'
	PenetrateForce=10
	bPenetrate=true
	FlashBone="tip2"
	bUseWeaponMag=false
	MuzzleFlashClass=Class'BallisticProV55.AM67FlashEmitter'
	XInaccuracy=2.0000000
	YInaccuracy=2.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-LaserFire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bModeExclusive=false
	MaxHoldTime=0.5000000
	FireAnim="Idle"
	FireRate=0.0500000
	AmmoClass=Class'BallisticProV55.Ammo_50HV'
	AmmoPerFire=0
	BotRefireRate=0.3000000
	WarnTargetPct=0.0100000
	aimerror=400.0000000
}
