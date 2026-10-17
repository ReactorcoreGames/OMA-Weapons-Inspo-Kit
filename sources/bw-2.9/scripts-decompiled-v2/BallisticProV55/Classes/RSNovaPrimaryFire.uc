class RSNovaPrimaryFire extends BallisticProProjectileFire;

struct ChainVic
{
	var float ZapTime;
	var Actor ZapVic;
};

var Actor MuzzleFlashFast;
var Actor MuzzleFlashSlow;
var Actor LightMuzzleFlash;
var() Sound ChnLtngSoundLoop;
var() Sound FireSoundLoop;
var() Sound FireSound2;
var bool bIsZapping;
var() int Damage;
var float ModePowerDrain;
var bool bPendingOwnerZap;
var float PendingZapDamage;
var RSNovaStaff NovaStaff;
var bool bChainZapping;
var array<ChainVic> ChainVics;

simulated event PostBeginPlay()
{
	super(WeaponFire).PostBeginPlay();
	NovaStaff = RSNovaStaff(Weapon);
	//return;	
}

simulated function ApplyFireEffectParams(FireEffectParams Params)
{
	local ProjectileEffectParams effect_params;

	super(BallisticProjectileFire).ApplyFireEffectParams(Params);
	effect_params = ProjectileEffectParams(Params);
	Damage = int(effect_params.Damage);
	default.Damage = int(effect_params.Damage);
	//return;	
}

simulated function Vector GetFireSpread()
{
	local float fX;
	local Rotator R;

	// End:0x35
	if(BW.bScopeView || int(BW.CurrentWeaponMode) != 4)
	{
		return super.GetFireSpread();		
	}
	else
	{
		fX = FRand();
		R.Yaw = int((float(1024) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
		R.Pitch = int((float(1024) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
		return Vector(R);
	}
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0xEC
	if(bIsJammed)
	{
		// End:0xC3
		if(BW.FireCount == 0)
		{
			bIsJammed = false;
			// End:0x6A
			if(bJamWastesAmmo && int(Weapon.Role) == int(ROLE_Authority))
			{
				ConsumedLoad += int(load);
				Timer();
			}
			// End:0xB3
			if(int(UnjamMethod) == int(3))
			{
				NextFireTime += FireRate;
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
				BW.FireCount++;
				return;
			}
			// End:0xC0
			if(!AllowFire())
			{
				return;
			}			
		}
		else
		{
			NextFireTime += FireRate;
			NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
			return;
		}
	}
	// End:0x16C
	if(BW != none)
	{
		BW.bPreventReload = true;
		BW.FireCount++;
		// End:0x16C
		if(int(BW.ReloadState) != int(0))
		{
			// End:0x15B
			if(int(Weapon.Role) == int(ROLE_Authority))
			{
				BW.bServerReloading = false;
			}
			BW.ReloadState = 0;
		}
	}
	// End:0x18D
	if(MaxHoldTime > 0.0000000)
	{
		HoldTime = FMin(HoldTime, MaxHoldTime);
	}
	ConsumedLoad += int(load);
	SetTimer(FMin(0.1000000, FireRate / float(2)), false);
	// End:0x2EA
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		DoFireEffect();
		// End:0x1F6
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x232
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
		// End:0x2EA
		if((InStr(Level.Game.GameName, "Freon") != -1) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo) != none)
		{
			Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo).AddFireStat(int(load), int(BW.InventoryGroup));
		}
	}
	// End:0x312
	if(!BW.bScopeView)
	{
		BW.AddFireChaos(FireChaos);
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x35C
	if(Instigator.IsLocallyControlled())
	{
		ShakeView();
		PlayFiring();
		FlashMuzzleFlash();
		StartMuzzleSmoke();		
	}
	else
	{
		ServerPlayFiring();
	}
	// End:0x3A8
	if(bFireOnRelease)
	{
		// End:0x38A
		if(bIsFiring)
		{
			NextFireTime += (MaxHoldTime + FireRate);			
		}
		else
		{
			NextFireTime = Level.TimeSeconds + FireRate;
		}		
	}
	else
	{
		// End:0x43D
		if(bBurstMode)
		{
			// End:0x40C
			if(BurstCount > MaxBurst)
			{
				NextFireTime += (FireRate * 1.7000000);
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
				Weapon.StopFire(ThisModeNum);
				BurstCount = 0;				
			}
			else
			{
				NextFireTime += (FireRate * 0.8000000);
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
			}			
		}
		else
		{
			NextFireTime += FireRate;
			NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
		}
	}
	load = float(AmmoPerFire);
	HoldTime = 0.0000000;
	// End:0x4C1
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x53B
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
		// End:0x53B
		if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
		{
			BW.bNeedCock = true;
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
	// End:0x72
	if((MuzzleFlashFast == none) || MuzzleFlashFast.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashFast, Class'BallisticProV55.RSNovaFastMuzzleFlash', Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	}
	// End:0xC9
	if((MuzzleFlashSlow == none) || MuzzleFlashSlow.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashSlow, Class'BallisticProV55.RSNovaSlowMuzzleFlash', Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	}
	MuzzleFlash = MuzzleFlashSlow;
	//return;	
}

simulated function DestroyEffects()
{
	super(WeaponFire).DestroyEffects();
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashFast);
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashSlow);
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(LightMuzzleFlash);
	//return;	
}

simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
{
	RSNovaAttachment(Weapon.ThirdPersonActor).NovaUpdateHit(BW.CurrentWeaponMode);
	//return;	
}

simulated function SwitchWeaponMode(byte newmode)
{
	super(BallisticProjectileFire).SwitchWeaponMode(newmode);
	switch(newmode)
	{
		// End:0x30
		case 0:
			MuzzleFlash = MuzzleFlashSlow;
			ModePowerDrain = 0.0000000;
			// End:0xAB
			break;
		// End:0x4E
		case 1:
			MuzzleFlash = MuzzleFlashFast;
			ModePowerDrain = 0.0000000;
			// End:0xAB
			break;
		// End:0x6C
		case 2:
			MuzzleFlash = LightMuzzleFlash;
			ModePowerDrain = 0.0400000;
			// End:0xAB
			break;
		// End:0x8A
		case 3:
			MuzzleFlash = MuzzleFlashSlow;
			ModePowerDrain = 0.5000000;
			// End:0xAB
			break;
		// End:0xA8
		case 4:
			MuzzleFlash = LightMuzzleFlash;
			ModePowerDrain = 0.1000000;
			// End:0xAB
			break;
		// End:0xFFFF
		default:
			break;
	}
	// End:0xCE
	if(RSNovaStaff(BW).bOnRampage)
	{
		ModePowerDrain *= 0.4000000;
	}
	//return;	
}

event Timer()
{
	super(BallisticFire).Timer();
	// End:0x51
	if(bIsZapping && (!IsFiring() || Weapon.GetFireMode(1).IsFiring()) || !IsInState('NovaLightning'))
	{
		StopLightning();
	}
	// End:0x9C
	if(bChainZapping && (!IsFiring() || Weapon.GetFireMode(1).IsFiring()) || !IsInState('ChainLightning'))
	{
		StopChainLightning();
	}
	//return;	
}

function StopLightning()
{
	NovaStaff.KillZap();
	bIsZapping = false;
	// End:0x3D
	if(LightMuzzleFlash != none)
	{
		Emitter(LightMuzzleFlash).Kill();
		LightMuzzleFlash = none;
	}
	Instigator.AmbientSound = BW.UsedAmbientSound;
	Instigator.SoundVolume = Weapon.default.SoundVolume;
	//return;	
}

function StopChainLightning()
{
	NovaStaff.KillChainZaps();
	bChainZapping = false;
	ChainVics.Length = 0;
	// End:0x45
	if(LightMuzzleFlash != none)
	{
		Emitter(LightMuzzleFlash).Kill();
		LightMuzzleFlash = none;
	}
	Instigator.AmbientSound = BW.UsedAmbientSound;
	Instigator.SoundVolume = Weapon.default.SoundVolume;
	//return;	
}

state NovaLightning
{
	function EndState()
	{
		// End:0x0F
		if(bIsZapping)
		{
			StopLightning();
		}
		//return;		
	}

	function float MaxRange()
	{
		return 1000.0000000;
		//return;		
	}

	simulated event ModeDoFire()
	{
		// End:0x0D
		if(!AllowFire())
		{
			return;
		}
		BW.FireCount++;
		// End:0xD1
		if(int(Weapon.Role) == int(ROLE_Authority))
		{
			ConsumedLoad += int(load);
			SetTimer(FMin(0.1000000, FireRate / float(2)), false);
			DoFireEffect();
			// End:0x86
			if((Instigator == none) || Instigator.Controller == none)
			{
				return;
			}
			// End:0xC2
			if(AIController(Instigator.Controller) != none)
			{
				AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
			}
			Instigator.DeactivateSpawnProtection();
		}
		// End:0xFE
		if(Instigator.IsLocallyControlled())
		{
			ShakeView();
			PlayFiring();
			FlashMuzzleFlash();
			StartMuzzleSmoke();			
		}
		else
		{
			ServerPlayFiring();
		}
		NextFireTime += FireRate;
		NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
		load = float(AmmoPerFire);
		HoldTime = 0.0000000;
		// End:0x188
		if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
		{
			bIsFiring = false;
			Weapon.PutDown();
		}
		//return;		
	}

	function DoFireEffect()
	{
		local Actor Target, Victims;
		local float TargetAngle, DR, BHD;
		local Vector ForceDir;
		local DestroyableObjective HealObjective;
		local Vehicle HealVehicle;
		local int AdjustedDamage;
		local bool bWasAlive;
		local RSBlackHole bh;

		bIsZapping = true;
		// End:0x24
		if(!bAISilent)
		{
			Instigator.MakeNoise(1.0000000);
		}
		ApplyRecoil();
		TargetAngle = 0.9200000;
		// End:0x331
		foreach Instigator.VisibleCollidingActors(Class'Engine.Actor', Victims, 700.0000000, Instigator.Location)
		{
			// End:0x330
			if(((((((Victims != none) && Victims != Instigator) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && !Victims.bWorldGeometry) && Victims.bCanBeDamaged || RSDarkFlameProjectile(Victims) != none) && !Victims.PhysicsVolume.bWaterVolume || (Pawn(Victims) != none) && !Pawn(Victims).HeadVolume.bWaterVolume)
			{
				DR = Normal(Victims.Location - Instigator.Location) Dot Vector(Instigator.GetViewRotation());
				// End:0x200
				if((RSDarkProjectile(Victims) != none) || RSDarkFastProjectile(Victims) != none)
				{
					// End:0x1FD
					if(DR > 0.9000000)
					{
						Victims.TakeDamage(10, Instigator, Victims.Location, Normal(Instigator.Location - Victims.Location) * float(1000), Class'BallisticProV55.DT_RSNovaLightning');
					}
					// End:0x330
					continue;
				}
				// End:0x2DF
				if(RSDarkFlameProjectile(Victims) != none)
				{
					// End:0x2DC
					if(DR > 0.9100000)
					{
						bh = NovaStaff.DNControl.GetNearestBlackHole(Victims.Location, BHD);
						// End:0x292
						if((BHD <= float(384)) || BHD <= bh.CollisionRadius)
						{
							bh.AddCharge(0.5000000);							
						}
						else
						{
							bh = Spawn(Class'BallisticProV55.RSBlackHole',,, Victims.Location);
							NovaStaff.DNControl.AddBlackHole(bh);
						}
						Victims.Destroy();
					}
					// End:0x330
					continue;
				}
				// End:0x30B
				if(RSBlackHole(Victims) != none)
				{
					RSBlackHole(Victims).AddCharge(0.2000000);
					// End:0x330
					continue;
				}
				// End:0x330
				if(DR > TargetAngle)
				{
					Target = Victims;
					TargetAngle = DR;
				}
			}			
		}		
		// End:0x34F
		if(Target == none)
		{
			NovaStaff.SetFreeZap();			
		}
		else
		{
			HealObjective = DestroyableObjective(Target);
			// End:0x383
			if(HealObjective == none)
			{
				HealObjective = DestroyableObjective(Target.Owner);
			}
			// End:0x431
			if((HealObjective != none) && HealObjective.TeamLink(Instigator.GetTeamNum()))
			{
				AdjustedDamage = int((float(Damage) * Instigator.DamageScaling) * float(15));
				// End:0x3F3
				if(Instigator.HasUDamage())
				{
					AdjustedDamage *= float(2);
				}
				HealObjective.HealDamage(AdjustedDamage, Instigator.Controller, Class'BallisticProV55.DT_RSNovaLightning');
				NovaStaff.SetTargetZap(Target, true);
				return;
			}
			HealVehicle = Vehicle(Target);
			// End:0x4EF
			if((HealVehicle != none) && HealVehicle.TeamLink(Instigator.GetTeamNum()))
			{
				AdjustedDamage = int((float(Damage) * Instigator.DamageScaling) * float(15));
				// End:0x4B1
				if(Instigator.HasUDamage())
				{
					AdjustedDamage *= float(2);
				}
				HealVehicle.HealDamage(AdjustedDamage, Instigator.Controller, Class'BallisticProV55.DT_RSNovaLightning');
				NovaStaff.SetTargetZap(Target, true);
				return;
			}
			// End:0x5DF
			if(((Pawn(Target) != none) && Pawn(Target).bProjTarget) && Instigator.Controller.SameTeamAs(Pawn(Target).Controller))
			{
				AdjustedDamage = int(float(Damage) * Instigator.DamageScaling);
				// End:0x584
				if(Instigator.HasUDamage())
				{
					AdjustedDamage *= float(2);
				}
				// End:0x5B2
				if(BallisticPawn(Target) != none)
				{
					BallisticPawn(Target).GiveAttributedShield(2, Instigator);					
				}
				else
				{
					Pawn(Target).AddShieldStrength(2);
				}
				NovaStaff.SetTargetZap(Target, true);
				return;
			}
			// End:0x644
			if((xPawn(Target) != none) && Pawn(Target).Health > 0)
			{
				// End:0x641
				if((Monster(Target) == none) || Pawn(Target).default.Health > 275)
				{
					bWasAlive = true;
				}				
			}
			else
			{
				// End:0x69B
				if(((Vehicle(Target) != none) && Vehicle(Target).Driver != none) && Vehicle(Target).Driver.Health > 0)
				{
					bWasAlive = true;
				}
			}
			ForceDir = (Instigator.Location + (Vector(Instigator.GetViewRotation()) * float(700))) - Target.Location;
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Target, float(Damage), Instigator, Target.Location + (Normal(Target.Location - Instigator.Location) * float(-24)), (float(40000) * FMax(0.1000000, 1.0000000 - (VSize(ForceDir) / float(2000)))) * Normal(ForceDir), Class'BallisticProV55.DT_RSNovaLightning');
			// End:0x7BE
			if(bWasAlive && Pawn(Target).Health <= 0)
			{
				Class'BallisticProV55.RSNovaSoul'.static.SpawnSoul(Target.Location, Instigator, Pawn(Target), Weapon);
			}
			NovaStaff.SetTargetZap(Target, false);
			// End:0x8D0
			if(!Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
			{
				// End:0x822
				if(RSNovaStaff(Weapon).SoulPower >= ModePowerDrain)
				{
					RSNovaStaff(Weapon).AddSoul(-ModePowerDrain);					
				}
				else
				{
					Instigator.PlaySound(Sound'BW_Core_WeaponSound.DarkStar.Dark-ImmolateIgnite',, 3.7000000,, 32.0000000);
					RSNovaStaff(Weapon).AddSoul(-5.0000000);
					Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 100.0000000 * (ModePowerDrain - RSNovaStaff(Weapon).SoulPower), Instigator, Instigator.Location, (-Vector(Instigator.GetViewRotation()) * float(3000)) + vect(0.0000000, 0.0000000, 1000.0000000), Class'BallisticProV55.DT_RSNovaBacklash');
				}
			}
		}
		//return;		
	}

	simulated function bool AllowFire()
	{
		// End:0x39
		if(!super(BallisticFire).AllowFire() || Instigator.PhysicsVolume.bWaterVolume)
		{
			// End:0x37
			if(bIsZapping)
			{
				PlayFireEnd();
			}
			return false;
		}
		return true;
		//return;		
	}

	function ServerPlayFiring()
	{
		// End:0x7C
		if(BW.FireCount < 2)
		{
			// End:0x7C
			if(BallisticFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}
		}
		// End:0xAE
		if(FireSoundLoop != none)
		{
			Instigator.AmbientSound = FireSoundLoop;
			Instigator.SoundVolume = byte(255);
		}
		//return;		
	}

	function PlayFiring()
	{
		// End:0x6E
		if(Instigator.PhysicsVolume.bWaterVolume)
		{
			StopLightning();
			PlayFireEnd();
			// End:0x60
			if(Weapon.HasAnim(FireLoopAnim))
			{
				BW.SafeLoopAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");
			}
			NextFireTime += 2.0000000;
			return;
		}
		// End:0x11C
		if(FireCount < 1)
		{
			// End:0xB2
			if(Weapon.HasAnim(FireLoopAnim))
			{
				BW.SafeLoopAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");
			}
			// End:0x119
			if(BallisticFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}			
		}
		else
		{
			// End:0x192
			if(FireCount == Max(1, int(Level.TimeDilation * 5.0000000)))
			{
				Weapon.PlayOwnedSound(FireSound2, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}
		}
		ClientPlayForceFeedback(FireForce);
		FireCount++;
		// End:0x1C5
		if(int(Level.NetMode) == int(NM_Client))
		{
			bIsZapping = true;
		}
		// End:0x21C
		if((LightMuzzleFlash == none) || LightMuzzleFlash.bDeleteMe)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(LightMuzzleFlash, Class'BallisticProV55.RSNovaLightMuzzleFlash', Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
		}
		// End:0x24E
		if(FireSoundLoop != none)
		{
			Instigator.AmbientSound = FireSoundLoop;
			Instigator.SoundVolume = byte(255);
		}
		//return;		
	}

	function PlayFireEnd()
	{
		// End:0x0F
		if(bIsZapping)
		{
			super(WeaponFire).PlayFireEnd();
		}
		StopLightning();
		//return;		
	}

	function StopFiring()
	{
		super(BallisticFire).StopFiring();
		StopLightning();
		//return;		
	}
	stop;	
}

state Zap
{
	function OnTraceHit(Actor Other, Vector HitLocation, Vector Dir)
	{
		local bool bWasAlive;

		// End:0x6A
		if((xPawn(Other) != none) && Pawn(Other).Health > 0)
		{
			// End:0x67
			if((Monster(xPawn(Other)) == none) || Pawn(Other).default.Health > 275)
			{
				bWasAlive = true;
			}			
		}
		else
		{
			// End:0xC1
			if(((Vehicle(Other) != none) && Vehicle(Other).Driver != none) && Vehicle(Other).Driver.Health > 0)
			{
				bWasAlive = true;
			}
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(Damage), Instigator, HitLocation, float(50000) * Dir, Class'BallisticProV55.DT_RSNovaOneShotZap');
		// End:0x14E
		if(bWasAlive && Pawn(Other).Health <= 0)
		{
			Class'BallisticProV55.RSNovaSoul'.static.SpawnSoul(Other.Location, Instigator, Pawn(Other), Weapon);
		}
		//return;		
	}

	function DoFireEffect()
	{
		local Vector StartTrace;
		local Rotator Aim;

		Aim = GetFireAim(StartTrace);
		Aim = Rotator((GetFireSpread()) >> Aim);
		// End:0x4F
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			BW.RewindCollisions();
		}
		DoTrace(StartTrace, Aim);
		// End:0x87
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			BW.RestoreCollisions();
		}
		ApplyRecoil();
		// End:0xC8
		if(RSNovaStaff(Weapon).SoulPower >= ModePowerDrain)
		{
			RSNovaStaff(Weapon).AddSoul(-ModePowerDrain);			
		}
		else
		{
			Instigator.PlaySound(Sound'BW_Core_WeaponSound.DarkStar.Dark-ImmolateIgnite',, 3.7000000,, 32.0000000);
			RSNovaStaff(Weapon).AddSoul(-5.0000000);
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 100.0000000 * (ModePowerDrain - RSNovaStaff(Weapon).SoulPower), Instigator, Instigator.Location, (-Vector(Instigator.GetViewRotation()) * float(3000)) + vect(0.0000000, 0.0000000, 1000.0000000), Class'BallisticProV55.DT_RSNovaBacklash');
		}
		//return;		
	}

	function float MaxRange()
	{
		return 7500.0000000;
		//return;		
	}

	function DoTrace(Vector InitialStart, Rotator Dir)
	{
		local Vector End, X, HitLocation, HitNormal, Start, LastHitLoc;

		local Material HitMaterial;
		local float dist;
		local Actor Other, LastOther;
		local bool bHitWall;

		dist = MaxRange();
		Start = InitialStart;
		X = Normal(Vector(Dir));
		End = Start + (X * dist);
		LastHitLoc = End;
		Weapon.bTraceWater = true;
		J0x5B:

		// End:0x2A7 [Loop If]
		if(dist > float(0))
		{
			Other = Trace(HitLocation, HitNormal, End, Start, true,, HitMaterial);
			Weapon.bTraceWater = false;
			dist -= VSize(HitLocation - Start);
			// End:0x100
			if((int(Level.NetMode) == int(NM_Client)) && (int(Other.Role) != int(ROLE_Authority)) || Other.bWorldGeometry)
			{
				// [Explicit Break]
				goto J0x2A7;
			}
			// End:0x296
			if(Other != none)
			{
				// End:0x16A
				if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
				{
					bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other);
					// [Explicit Break]
					goto J0x2A7;
				}
				LastHitLoc = HitLocation;
				// End:0x248
				if(!Other.bWorldGeometry && Other != LastOther)
				{
					OnTraceHit(Other, HitLocation, X);
					// End:0x1E3
					if(Vehicle(Other) != none)
					{
						bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other);						
					}
					else
					{
						// End:0x248
						if(Mover(Other) == none)
						{
							bHitWall = true;
							// End:0x22E
							if(HitMaterial != none)
							{
								SendFireEffect(Other, HitLocation, HitNormal, int(HitMaterial.SurfaceType));								
							}
							else
							{
								SendFireEffect(Other, HitLocation, HitNormal, 6);
							}
							// [Explicit Break]
							goto J0x2A7;
						}
					}
				}
				// End:0x290
				if(Other.bWorldGeometry || Mover(Other) != none)
				{
					bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other);
					// [Explicit Break]
					goto J0x2A7;
				}
				// [Explicit Break]
				goto J0x2A7;				
			}
			else
			{
				LastHitLoc = End;
				// [Explicit Break]
				goto J0x2A7;
			}
			// [Loop Continue]
			goto J0x5B;
		}
		J0x2A7:

		// End:0x2C7
		if(!bHitWall)
		{
			NoHitEffect(X, InitialStart, LastHitLoc);
		}
		//return;		
	}

	function NoHitEffect(Vector Dir, optional Vector Start, optional Vector HitLocation, optional Vector WaterHitLoc)
	{
		// End:0x9E
		if((Weapon != none) && int(Level.NetMode) != int(NM_Client))
		{
			// End:0x70
			if((HitLocation != vect(0.0000000, 0.0000000, 0.0000000)) && HitLocation != WaterHitLoc)
			{
				SendFireEffect(none, HitLocation, vect(0.0000000, 0.0000000, 0.0000000), 0, WaterHitLoc);				
			}
			else
			{
				SendFireEffect(none, Start + (Dir * (MaxRange())), vect(0.0000000, 0.0000000, 0.0000000), 0, WaterHitLoc);
			}
		}
		//return;		
	}

	simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
	{
		local int Surf;

		// End:0x55
		if(((!Other.bWorldGeometry && Mover(Other) == none) && Vehicle(Other) == none) || int(Level.NetMode) == int(NM_Client))
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
		SendFireEffect(Other, HitLocation, HitNormal, Surf, WaterHitLoc);
		// End:0xE5
		if(!bAISilent)
		{
			Instigator.MakeNoise(1.0000000);
		}
		return true;
		//return;		
	}

	simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
	{
		RSNovaAttachment(Weapon.ThirdPersonActor).BigZapUpdateHit(Other, HitLocation, HitNormal, Surf);
		//return;		
	}
	stop;	
}

state ChainLightning
{
	function float MaxRange()
	{
		return 1200.0000000;
		//return;		
	}

	simulated event ModeDoFire()
	{
		// End:0x0D
		if(!AllowFire())
		{
			return;
		}
		BW.FireCount++;
		// End:0xD1
		if(int(Weapon.Role) == int(ROLE_Authority))
		{
			ConsumedLoad += int(load);
			SetTimer(FMin(0.1000000, FireRate / float(2)), false);
			DoFireEffect();
			// End:0x86
			if((Instigator == none) || Instigator.Controller == none)
			{
				return;
			}
			// End:0xC2
			if(AIController(Instigator.Controller) != none)
			{
				AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
			}
			Instigator.DeactivateSpawnProtection();
		}
		// End:0xFE
		if(Instigator.IsLocallyControlled())
		{
			ShakeView();
			PlayFiring();
			FlashMuzzleFlash();
			StartMuzzleSmoke();			
		}
		else
		{
			ServerPlayFiring();
		}
		NextFireTime += FireRate;
		NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
		load = float(AmmoPerFire);
		HoldTime = 0.0000000;
		// End:0x188
		if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
		{
			bIsFiring = false;
			Weapon.PutDown();
		}
		//return;		
	}

	function DoFireEffect()
	{
		local Actor Target, Victims;
		local float TargetWeight, Weight;
		local Vector ForceDir;
		local bool bWasAlive;
		local int i, j;
		local Vector PrevLoc;

		bChainZapping = true;
		Instigator.MakeNoise(1.0000000);
		ApplyRecoil();
		PrevLoc = Instigator.Location;
		i = 0;
		J0x3A:

		// End:0xE7 [Loop If]
		if(i < ChainVics.Length)
		{
			// End:0xA7
			if((ChainVics[i].ZapVic == none) || !Weapon.FastTrace(ChainVics[i].ZapVic.Location, PrevLoc))
			{
				ChainVics.Remove(i, 1);
				i--;
				// [Explicit Continue]
				goto J0xDD;
			}
			PrevLoc = ChainVics[i].ZapVic.Location;
			ChainVics[i].ZapTime += 0.1000000;
			J0xDD:

			i++;
			// [Loop Continue]
			goto J0x3A;
		}
		// End:0x34B
		if(ChainVics.Length > 0)
		{
			i = ChainVics.Length - 1;
			// End:0x348
			if(ChainVics[i].ZapTime >= 0.5000000)
			{
				TargetWeight = 10000.0000000;
				// End:0x2F9
				foreach Instigator.VisibleCollidingActors(Class'Engine.Actor', Victims, 1600.0000000, ChainVics[i].ZapVic.Location)
				{
					// End:0x2F8
					if(((((((((Victims != none) && Victims != Instigator) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && !Victims.bWorldGeometry) && Victims.bProjTarget) && !Victims.bStatic) && Projectile(Victims) == none) && !Victims.PhysicsVolume.bWaterVolume || (Pawn(Victims) != none) && !Pawn(Victims).HeadVolume.bWaterVolume)
					{
						j = 0;
						J0x25B:

						// End:0x292 [Loop If]
						if(j < ChainVics.Length)
						{
							// End:0x288
							if(ChainVics[j].ZapVic == Victims)
							{
								// [Explicit Break]
								goto J0x292;
							}
							j++;
							// [Loop Continue]
							goto J0x25B;
						}
						J0x292:

						// End:0x2F8
						if(j >= ChainVics.Length)
						{
							Weight = VSize(Victims.Location - ChainVics[i].ZapVic.Location);
							// End:0x2F8
							if(Weight < TargetWeight)
							{
								Target = Victims;
								TargetWeight = Weight;
							}
						}
					}					
				}				
				// End:0x348
				if(Target != none)
				{
					ChainVics.Length = i + 2;
					i++;
					ChainVics[i].ZapVic = Target;
					ChainVics[i].ZapTime = 0.0000000;
				}
			}			
		}
		else
		{
			TargetWeight = 0.8500000;
			// End:0x4D7
			foreach Instigator.VisibleCollidingActors(Class'Engine.Actor', Victims, 1000.0000000, Instigator.Location)
			{
				// End:0x4D6
				if(((((((((Victims != none) && Victims != Instigator) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && !Victims.bWorldGeometry) && Victims.bProjTarget) && !Victims.bStatic) && Projectile(Victims) == none) && !Victims.PhysicsVolume.bWaterVolume || (Pawn(Victims) != none) && !Pawn(Victims).HeadVolume.bWaterVolume)
				{
					Weight = Normal(Victims.Location - Instigator.Location) Dot Vector(Instigator.GetViewRotation());
					// End:0x4D6
					if(Weight > TargetWeight)
					{
						Target = Victims;
						TargetWeight = Weight;
					}
				}				
			}			
			// End:0x50F
			if(Target != none)
			{
				ChainVics.Length = 1;
				ChainVics[0].ZapVic = Target;
				ChainVics[0].ZapTime = 0.0000000;
			}
		}
		// End:0x52D
		if(ChainVics.Length < 1)
		{
			NovaStaff.SetFreeChainZap();			
		}
		else
		{
			i = 0;
			J0x534:

			// End:0x7AA [Loop If]
			if(i < ChainVics.Length)
			{
				// End:0x55D
				if(ChainVics[i].ZapVic == none)
				{
					// [Explicit Continue]
					goto J0x7A0;
				}
				// End:0x5A9
				if((xPawn(ChainVics[i].ZapVic) != none) && Pawn(ChainVics[i].ZapVic).Health > 0)
				{
					bWasAlive = true;					
				}
				else
				{
					// End:0x624
					if(((Vehicle(ChainVics[i].ZapVic) != none) && Vehicle(ChainVics[i].ZapVic).Driver != none) && Vehicle(ChainVics[i].ZapVic).Driver.Health > 0)
					{
						bWasAlive = true;						
					}
					else
					{
						bWasAlive = false;
					}
				}
				ForceDir = (Instigator.Location + (Vector(Instigator.GetViewRotation()) * float(700))) - ChainVics[i].ZapVic.Location;
				Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(ChainVics[i].ZapVic, float(Damage * 2), Instigator, ChainVics[i].ZapVic.Location + (Normal(ChainVics[i].ZapVic.Location - Instigator.Location) * float(-24)), (float(40000) * FMax(0.1000000, 1.0000000 - (VSize(ForceDir) / float(2000)))) * Normal(ForceDir), Class'BallisticProV55.DT_RSNovaChainLightning');
				// End:0x7A0
				if(bWasAlive && Pawn(ChainVics[i].ZapVic).Health <= 0)
				{
					Class'BallisticProV55.RSNovaSoul'.static.SpawnSoul(ChainVics[i].ZapVic.Location, Instigator, Pawn(ChainVics[i].ZapVic), Weapon);
				}
				J0x7A0:

				i++;
				// [Loop Continue]
				goto J0x534;
			}
			NovaStaff.SetChainZap();
			// End:0x7F4
			if(RSNovaStaff(Weapon).SoulPower >= ModePowerDrain)
			{
				RSNovaStaff(Weapon).AddSoul(-ModePowerDrain);				
			}
			else
			{
				Instigator.PlaySound(Sound'BW_Core_WeaponSound.DarkStar.Dark-ImmolateIgnite',, 3.7000000,, 32.0000000);
				RSNovaStaff(Weapon).AddSoul(-5.0000000);
				Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 100.0000000 * (ModePowerDrain - RSNovaStaff(Weapon).SoulPower), Instigator, Instigator.Location, (-Vector(Instigator.GetViewRotation()) * float(3000)) + vect(0.0000000, 0.0000000, 1000.0000000), Class'BallisticProV55.DT_RSNovaBacklash');
			}
		}
		//return;		
	}

	simulated function bool AllowFire()
	{
		// End:0x39
		if(!super(BallisticFire).AllowFire() || Instigator.PhysicsVolume.bWaterVolume)
		{
			// End:0x37
			if(bChainZapping)
			{
				PlayFireEnd();
			}
			return false;
		}
		return true;
		//return;		
	}

	function ServerPlayFiring()
	{
		// End:0x7C
		if(BW.FireCount < 2)
		{
			// End:0x7C
			if(BallisticFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}
		}
		// End:0xAE
		if(ChnLtngSoundLoop != none)
		{
			Instigator.AmbientSound = ChnLtngSoundLoop;
			Instigator.SoundVolume = byte(255);
		}
		//return;		
	}

	function PlayFiring()
	{
		// End:0x6E
		if(Instigator.PhysicsVolume.bWaterVolume)
		{
			StopChainLightning();
			PlayFireEnd();
			// End:0x60
			if(Weapon.HasAnim(FireLoopAnim))
			{
				BW.SafeLoopAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");
			}
			NextFireTime += 2.0000000;
			return;
		}
		// End:0x11C
		if(FireCount < 1)
		{
			// End:0xB2
			if(Weapon.HasAnim(FireLoopAnim))
			{
				BW.SafeLoopAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");
			}
			// End:0x119
			if(BallisticFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}			
		}
		else
		{
			// End:0x192
			if(FireCount == Max(1, int(Level.TimeDilation * 5.0000000)))
			{
				Weapon.PlayOwnedSound(FireSound2, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}
		}
		ClientPlayForceFeedback(FireForce);
		FireCount++;
		// End:0x1C5
		if(int(Level.NetMode) == int(NM_Client))
		{
			bChainZapping = true;
		}
		// End:0x21C
		if((LightMuzzleFlash == none) || LightMuzzleFlash.bDeleteMe)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(LightMuzzleFlash, Class'BallisticProV55.RSNovaLightMuzzleFlash', Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
		}
		// End:0x24E
		if(ChnLtngSoundLoop != none)
		{
			Instigator.AmbientSound = ChnLtngSoundLoop;
			Instigator.SoundVolume = byte(255);
		}
		//return;		
	}

	function PlayFireEnd()
	{
		// End:0x0F
		if(bChainZapping)
		{
			super(WeaponFire).PlayFireEnd();
		}
		StopChainLightning();
		//return;		
	}

	function StopFiring()
	{
		super(BallisticFire).StopFiring();
		StopChainLightning();
		//return;		
	}
	stop;	
}

defaultproperties
{
	ChnLtngSoundLoop=Sound'BW_Core_WeaponSound.NovaStaff.Nova-ChainLightning'
	FireSoundLoop=Sound'BW_Core_WeaponSound.NovaStaff.Nova-AltFireLoop'
	Damage=2
	SpawnOffset=(X=12.0000000,Y=8.0000000,Z=-9.0000000)
	MuzzleFlashClass=Class'BallisticProV55.RSNovaSlowMuzzleFlash'
	FireRecoil=1024.0000000
	FireChaos=0.2500000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.1600000,OutVal=1.0000000),(InVal=0.2500000,OutVal=1.5000000),(InVal=0.5000000,OutVal=2.2500000),(InVal=0.7500000,OutVal=3.5000000),(InVal=1.0000000,OutVal=5.0000000)))
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireRate=1.3500000
	AmmoClass=Class'BallisticProV55.Ammo_NovaCrystal'
	AmmoPerFire=3
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-100.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BallisticProV55.RSNovaProjectile'
	WarnTargetPct=0.2000000
}
