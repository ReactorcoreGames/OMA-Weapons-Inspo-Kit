class RS04SecondaryFire extends BallisticMeleeFire;

var() Vector SpawnOffset;
var Projectile proj;
var bool bLoaded;
var() Sound ChargeSound;
var() byte ChargeSoundPitch;
var() float DecayCharge;

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

function PlayPreFire()
{
	super(BallisticFire).PlayPreFire();
	RS04Pistol(Weapon).bStriking = true;
	//return;	
}

function PlayFiring()
{
	// End:0x22
	if(BW.MagAmmo == 0)
	{
		FireAnim = 'StabOpen';		
	}
	else
	{
		FireAnim = 'Stab';
	}
	super.PlayFiring();
	//return;	
}

simulated state Light
{
	simulated function ApplyFireEffectParams(FireEffectParams effect_params)
	{
		super(BallisticFire).ApplyFireEffectParams(effect_params);
		bWaitForRelease = true;
		bModeExclusive = false;
		// End:0x2C
		if(bFireOnRelease)
		{
			bWaitForRelease = true;
		}
		// End:0x3D
		if(bWaitForRelease)
		{
			bNowWaiting = true;
		}
		//return;		
	}

	event ModeDoFire()
	{
		// End:0x16
		if(!Instigator.IsLocallyControlled())
		{
			return;
		}
		// End:0x33
		if(AllowFire())
		{
			RS04Pistol(Weapon).WeaponSpecial();
		}
		//return;		
	}
	stop;	
}

simulated state FlashbangLight
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
			super(BallisticMeleeFire).ModeDoFire();
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
		// End:0x22
		if(BW.MagAmmo == 0)
		{
			FireAnim = 'FlashLightToggleOpen';			
		}
		else
		{
			FireAnim = 'FlashLightToggle';
		}
		ClientPlayForceFeedback(FireForce);
		FireCount++;
		// End:0xA6
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
		super(BallisticMeleeFire).DoFireEffect();
		//return;		
	}
	stop;	
}

simulated state Projectile
{
	simulated function ApplyFireEffectParams(FireEffectParams Params)
	{
		local ProjectileEffectParams effect_params;

		super(BallisticFire).ApplyFireEffectParams(Params);
		effect_params = ProjectileEffectParams(Params);
		ProjectileClass = effect_params.ProjectileClass;
		SpawnOffset = effect_params.SpawnOffset;
		default.ProjectileClass = effect_params.ProjectileClass;
		default.SpawnOffset = effect_params.SpawnOffset;
		//return;		
	}

	simulated function bool CheckSensor()
	{
		local int Channel;
		local name seq;
		local float frame, Rate;

		// End:0x6B
		if(!bLoaded)
		{
			Weapon.GetAnimParams(Channel, seq, frame, Rate);
			// End:0x4D
			if(seq == RS04Pistol(Weapon).SensorLoadAnim)
			{
				return false;
			}
			RS04Pistol(Weapon).LoadSensor();
			bIsFiring = false;
			return false;
		}
		return true;
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
		// End:0xAC
		if(!super(BallisticMeleeFire).AllowFire() || !bLoaded)
		{
			// End:0x99
			if(DryFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
			}
			BW.EmptyFire(1);
			return false;
		}
		return true;
		//return;		
	}

	simulated event ModeDoFire()
	{
		// End:0x0D
		if(!AllowFire())
		{
			return;
		}
		// End:0x1A
		if(!CheckSensor())
		{
			return;
		}
		super(BallisticMeleeFire).ModeDoFire();
		bLoaded = false;
		RS04Pistol(Weapon).AltCharge = 0.0000000;
		PreFireTime = 0.0000000;
		//return;		
	}

	function PlayFiring()
	{
		// End:0x22
		if(BW.MagAmmo == 0)
		{
			FireAnim = 'FlashLightToggleOpen';			
		}
		else
		{
			FireAnim = 'FlashLightToggle';
		}
		super(BallisticMeleeFire).PlayFiring();
		//return;		
	}

	function float MaxRange()
	{
		// End:0x155
		if(ProjectileClass.default.MaxSpeed > ProjectileClass.default.Speed)
		{
			// End:0xFE
			if((Class<BallisticProjectile>(ProjectileClass) != none) && Class<BallisticProjectile>(ProjectileClass).default.AccelSpeed > float(0))
			{
				// End:0xA7
				if(ProjectileClass.default.LifeSpan <= float(0))
				{
					return FMin(ProjectileClass.default.MaxSpeed, (ProjectileClass.default.Speed + (Class<BallisticProjectile>(ProjectileClass).default.AccelSpeed * float(2))) * float(2));					
				}
				else
				{
					return FMin(ProjectileClass.default.MaxSpeed, (ProjectileClass.default.Speed + (Class<BallisticProjectile>(ProjectileClass).default.AccelSpeed * ProjectileClass.default.LifeSpan)) * ProjectileClass.default.LifeSpan);
				}				
			}
			else
			{
				// End:0x12C
				if(ProjectileClass.default.LifeSpan <= float(0))
				{
					return ProjectileClass.default.MaxSpeed * float(2);					
				}
				else
				{
					return (ProjectileClass.default.MaxSpeed * ProjectileClass.default.LifeSpan) * 0.7500000;
				}
			}			
		}
		else
		{
			// End:0x183
			if(ProjectileClass.default.LifeSpan <= float(0))
			{
				return ProjectileClass.default.Speed * float(2);				
			}
			else
			{
				return ProjectileClass.default.Speed * ProjectileClass.default.LifeSpan;
			}
		}
		//return;		
	}

	function DoFireEffect()
	{
		local Vector StartTrace, X, Y, Z, Start, End,
			HitLocation, HitNormal;

		local Rotator Aim;
		local Actor Other;

		Weapon.GetViewAxes(X, Y, Z);
		Start = Instigator.Location + Instigator.EyePosition();
		StartTrace = (Start + (X * SpawnOffset.X)) + (Z * SpawnOffset.Z);
		// End:0xB6
		if(!Weapon.WeaponCentered())
		{
			StartTrace = StartTrace + ((Weapon.hand * Y) * SpawnOffset.Y);
		}
		Aim = GetFireAim(StartTrace);
		Aim = Rotator((GetFireSpread()) >> Aim);
		End = Start + (Vector(Aim) * (MaxRange()));
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x139
		if(Other != none)
		{
			Aim = Rotator(HitLocation - StartTrace);
		}
		SpawnProjectile(StartTrace, Aim);
		SendFireEffect(none, vect(0.0000000, 0.0000000, 0.0000000), StartTrace, 0);
		super(BallisticFire).DoFireEffect();
		//return;		
	}

	function SpawnProjectile(Vector Start, Rotator Dir)
	{
		proj = Spawn(ProjectileClass,,, Start, Dir);
		proj.Instigator = Instigator;
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
		// End:0x4A
		if(int(BW.MeleeState) > int(1))
		{
			return false;
		}
		// End:0x72
		if((int(BW.ReloadState) == int(8)) && !bIgnoreCocking)
		{
			return false;
		}
		// End:0xA1
		if((int(BW.ReloadState) != int(0)) || BW.bServerReloading)
		{
			return false;
		}
		return true;
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
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	ChargeSound=Sound'BW_Core_WeaponSound.A73.A73ProjFly'
	ChargeSoundPitch=32
	SwipePoints[0]=(Weight=3,offset=(Pitch=2048,Yaw=2048,Roll=0))
	SwipePoints[1]=(Weight=1,offset=(Pitch=1000,Yaw=1000,Roll=0))
	SwipePoints[2]=(Weight=2,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[3]=(Weight=1,offset=(Pitch=-1000,Yaw=-1000,Roll=0))
	SwipePoints[4]=(Weight=3,offset=(Pitch=-2048,Yaw=-2048,Roll=0))
	TraceRange=(Min=140.0000000,Max=140.0000000)
	Damage=70.0000000
	DamageType=Class'BWBP_SKC_Pro.DTRS04Stab'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTRS04Stab'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTRS04Stab'
	KickForce=100
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	bIgnoreReload=true
	bUseWeaponMag=false
	ScopeDownOn=2
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=SoundGroup'BW_Core_WeaponSound.Knife.KnifeSlash',Volume=1.0000000,Radius=378.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	PreFireAnim="None"
	FireAnim="FlashLightToggle"
	FireRate=0.2500000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_G51Grenades'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=128.0000000,Z=0.0000000)
	ShakeRotRate=(X=2500.0000000,Y=2500.0000000,Z=2500.0000000)
	ShakeRotTime=2.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.0500000
}
