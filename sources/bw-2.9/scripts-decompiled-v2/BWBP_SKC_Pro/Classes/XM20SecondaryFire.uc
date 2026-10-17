class XM20SecondaryFire extends BallisticProInstantFire;

var() Sound FireSoundLoop;
var() float StopFireTime;
var() bool bLaserFiring;
var() bool bPreventFire;
var() Actor MuzzleFlashBlue;
var() name PreFireAnimCharged;
var() name FireLoopAnimCharged;
var() name FireEndAnimCharged;
var() int TraceCount;
var() float OverChargedFireRate;
var() int SoundAdjust;
var() Sound ChargeSound;
var() Sound PowerFireSound;
var() Sound RegularFireSound;

function StartBerserk()
{
	StopBerserk();
	// End:0x2F
	if(XM20Carbine(BW).bOvercharged)
	{
		FireRate = default.OverChargedFireRate * 0.7500000;
	}
	//return;	
}

function StopBerserk()
{
	super(BallisticInstantFire).StopBerserk();
	// End:0x28
	if(XM20Carbine(BW).bOvercharged)
	{
		FireRate = default.OverChargedFireRate;
	}
	//return;	
}

function StartSuperBerserk()
{
	super(BallisticFire).StartSuperBerserk();
	// End:0x41
	if(XM20Carbine(BW).bOvercharged)
	{
		FireRate = default.OverChargedFireRate / Level.GRI.WeaponBerserk;
	}
	//return;	
}

simulated function SwitchLaserMode(byte newmode)
{
	// End:0x4E
	if(int(newmode) == 2)
	{
		XM20Carbine(BW).bOvercharged = true;
		XM20Carbine(BW).ChargeRate = XM20Carbine(BW).default.ChargeRateOvercharge;		
	}
	else
	{
		XM20Carbine(BW).bOvercharged = false;
		XM20Carbine(BW).ChargeRate = XM20Carbine(BW).default.ChargeRate;
	}
	// End:0xA9
	if(Weapon.bBerserk)
	{
		FireRate *= 0.7500000;
	}
	// End:0xE8
	if(Level.GRI.WeaponBerserk > 1.0000000)
	{
		FireRate /= Level.GRI.WeaponBerserk;
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
	if((MuzzleFlashBlue == none) || MuzzleFlashBlue.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashBlue, Class'BWBP_SKC_Pro.HMCRedEmitter', Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	}
	MuzzleFlash = MuzzleFlashBlue;
	//return;	
}

simulated function DestroyEffects()
{
	super(WeaponFire).DestroyEffects();
	//return;	
}

simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
{
	TargetedHurtRadius(7.0000000, 20.0000000, Class'BWBP_SKC_Pro.DT_XM20_Body', 0.0000000, HitLocation, Other);
	return super(BallisticInstantFire).ImpactEffect(HitLocation, HitNormal, HitMat, Other, WaterHitLoc);
	//return;	
}

simulated function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;

	// End:0x14
	if(Weapon.bHurtEntry)
	{
		return;
	}
	Weapon.bHurtEntry = true;
	// End:0x194
	foreach Weapon.VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x193
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && UnrealPawn(Victim) == none) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim)
		{
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
		}		
	}	
	Weapon.bHurtEntry = false;
	//return;	
}

simulated state Shield
{
	simulated function bool AllowFire()
	{
		return ((!XM20Carbine(BW).bBroken && Weapon.AmmoAmount(ThisModeNum) >= AmmoPerFire) && !BW.bServerReloading) && int(BW.MeleeState) == int(0);
		//return;		
	}

	simulated event ModeDoFire()
	{
		// End:0x0D
		if(!AllowFire())
		{
			return;
		}
		// End:0x8D
		if(BW != none)
		{
			BW.bPreventReload = true;
			BW.FireCount++;
			// End:0x8D
			if(int(BW.ReloadState) != int(0))
			{
				// End:0x7C
				if(int(Weapon.Role) == int(ROLE_Authority))
				{
					BW.bServerReloading = false;
				}
				BW.ReloadState = 0;
			}
		}
		XM20Carbine(Weapon).ShieldDeploy();
		ConsumedLoad += int(load);
		// End:0x136
		if(int(Weapon.Role) == int(ROLE_Authority))
		{
			// End:0xEB
			if((Instigator == none) || Instigator.Controller == none)
			{
				return;
			}
			// End:0x127
			if(AIController(Instigator.Controller) != none)
			{
				AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
			}
			Instigator.DeactivateSpawnProtection();
		}
		BW.LastFireTime = Level.TimeSeconds;
		// End:0x16E
		if(Instigator.IsLocallyControlled())
		{
			PlayFiring();			
		}
		else
		{
			ServerPlayFiring();
		}
		NextFireTime += FireRate;
		NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
		load = float(AmmoPerFire);
		// End:0x1ED
		if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
		{
			bIsFiring = false;
			Weapon.PutDown();
		}
		//return;		
	}
	stop;	
}

simulated state Laser
{
	simulated function ModeTick(float dt)
	{
		// End:0xA3
		if((bIsFiring && !bPreventFire) && BW.MagAmmo > 0)
		{
			XM20Carbine(BW).SetLaserCharge(FMin(XM20Carbine(BW).LaserCharge + ((XM20Carbine(BW).ChargeRate * dt) * float(1 + (2 * int(BW.bBerserk)))), XM20Carbine(BW).MaxCharge));			
		}
		else
		{
			// End:0x16D
			if(XM20Carbine(BW).LaserCharge > float(0))
			{
				// End:0xDC
				if(Level.TimeSeconds > StopFireTime)
				{
					StopFiring();
				}
				bPreventFire = true;
				XM20Carbine(BW).SetLaserCharge(FMax(0.0000000, XM20Carbine(BW).LaserCharge - ((XM20Carbine(BW).CoolRate * dt) * float(1 + (2 * int(BW.bBerserk))))));
				// End:0x16D
				if(XM20Carbine(BW).LaserCharge <= float(0))
				{
					bPreventFire = false;
				}
			}
		}
		super(BallisticFire).ModeTick(dt);
		//return;		
	}

	simulated event ModeDoFire()
	{
		// End:0x45
		if((!AllowFire() || XM20Carbine(BW).LaserCharge < XM20Carbine(BW).MaxCharge) || bPreventFire)
		{
			return;
		}
		// End:0xF4
		if(BW != none)
		{
			BW.bPreventReload = true;
			BW.FireCount++;
			// End:0xA0
			if(BW.FireCount == 1)
			{
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
			}
			// End:0xF4
			if(int(BW.ReloadState) != int(0))
			{
				// End:0xE3
				if(int(Weapon.Role) == int(ROLE_Authority))
				{
					BW.bServerReloading = false;
				}
				BW.ReloadState = 0;
			}
		}
		load = float(AmmoPerFire);
		HoldTime = 0.0000000;
		// End:0x231
		if(int(Weapon.Role) == int(ROLE_Authority))
		{
			DoFireEffect();
			// End:0x14E
			if((Instigator == none) || Instigator.Controller == none)
			{
				return;
			}
			// End:0x18A
			if(AIController(Instigator.Controller) != none)
			{
				AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
			}
			Instigator.DeactivateSpawnProtection();
			// End:0x231
			if((BallisticTurret(Weapon.Owner) == none) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo) != none)
			{
				Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo).AddFireStat(int(load), int(BW.InventoryGroup));
			}
		}
		// End:0x259
		if(!BW.bScopeView)
		{
			BW.AddFireChaos(FireChaos);
		}
		BW.LastFireTime = Level.TimeSeconds;
		// End:0x2B7
		if(Instigator.IsLocallyControlled())
		{
			ShakeView();
			PlayFiring();
			FlashMuzzleFlash();
			StartMuzzleSmoke();
			XM20Carbine(BW).UpdateScreen();			
		}
		else
		{
			ServerPlayFiring();
		}
		NextFireTime += FireRate;
		NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
		// End:0x329
		if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
		{
			bIsFiring = false;
			Weapon.PutDown();
		}
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
		//return;		
	}

	function DoFireEffect()
	{
		local Vector StartTrace;
		local Rotator Aim;
		local int i;

		XM20Carbine(Weapon).ServerSwitchLaser(true);
		// End:0xDE
		if(!bLaserFiring)
		{
			// End:0x8C
			if(XM20Carbine(BW).bOvercharged)
			{
				Weapon.PlayOwnedSound(PowerFireSound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);				
			}
			else
			{
				Weapon.PlayOwnedSound(RegularFireSound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}
		}
		bLaserFiring = true;
		// End:0x102
		if(!bAISilent)
		{
			Instigator.MakeNoise(1.0000000);
		}
		// End:0x12A
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			BW.RewindCollisions();
		}
		i = 0;
		J0x131:

		// End:0x1AF [Loop If]
		if((i < TraceCount) && ConsumedLoad < BW.MagAmmo)
		{
			ConsumedLoad += int(load);
			Aim = GetFireAim(StartTrace);
			Aim = Rotator((GetFireSpread()) >> Aim);
			DoTrace(StartTrace, Aim);
			ApplyRecoil();
			i++;
			// [Loop Continue]
			goto J0x131;
		}
		// End:0x1D7
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			BW.RestoreCollisions();
		}
		SetTimer(FMin(0.1000000, FireRate / float(2)), false);
		super(WeaponFire).DoFireEffect();
		//return;		
	}

	simulated function PlayPreFire()
	{
		Instigator.AmbientSound = ChargeSound;
		Instigator.SoundVolume = byte(255);
		super(BallisticFire).PlayPreFire();
		//return;		
	}

	function PlayFiring()
	{
		super(BallisticFire).PlayFiring();
		// End:0x38
		if(FireSoundLoop != none)
		{
			Instigator.AmbientSound = FireSoundLoop;
			Instigator.SoundVolume = byte(255);
		}
		// End:0x101
		if(!bLaserFiring)
		{
			// End:0xAF
			if(XM20Carbine(BW).bOvercharged)
			{
				Weapon.PlayOwnedSound(PowerFireSound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);				
			}
			else
			{
				Weapon.PlayOwnedSound(RegularFireSound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}
		}
		bLaserFiring = true;
		//return;		
	}

	function ServerPlayFiring()
	{
		super(BallisticFire).ServerPlayFiring();
		// End:0x38
		if(FireSoundLoop != none)
		{
			Instigator.AmbientSound = FireSoundLoop;
			Instigator.SoundVolume = byte(255);
		}
		// End:0x101
		if(!bLaserFiring)
		{
			// End:0xAF
			if(XM20Carbine(BW).bOvercharged)
			{
				Weapon.PlayOwnedSound(PowerFireSound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);				
			}
			else
			{
				Weapon.PlayOwnedSound(RegularFireSound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}
		}
		bLaserFiring = true;
		//return;		
	}

	function StopFiring()
	{
		Instigator.AmbientSound = XM20Carbine(BW).UsedAmbientSound;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
		bLaserFiring = false;
		XM20Carbine(Weapon).ServerSwitchLaser(false);
		StopFireTime = Level.TimeSeconds;
		//return;		
	}
	stop;	
}

defaultproperties
{
	FireSoundLoop=Sound'BWBP_SKC_Sounds.XM20.XM20-Lase'
	PreFireAnimCharged="LoopOpenStart"
	FireLoopAnimCharged="LoopOpenFire"
	FireEndAnimCharged="LoopOpenEnd"
	TraceCount=1
	OverChargedFireRate=0.0450000
	ChargeSound=Sound'BWBP_SKC_Sounds.XM20.XM20-SpartanChargeSound'
	PowerFireSound=Sound'BWBP_SKC_Sounds.XM20.XM20-Overcharge'
	RegularFireSound=Sound'BWBP_SKC_Sounds.XM20.XM20-LaserStart'
	MaxWaterTraceRange=5000.0000000
	DamageType=Class'BWBP_SKC_Pro.DT_XM20_Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_XM20_Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_XM20_Body'
	PenetrateForce=300
	bPenetrate=true
	FlashScaleFactor=0.3000000
	FireRecoil=32.0000000
	FireChaos=0.0000000
	bModeExclusive=false
	PreFireTime=0.1000000
	PreFireAnim="LoopStart"
	FireLoopAnim="LoopFire"
	FireEndAnim="LoopEnd"
	FireRate=0.0700000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_Laser'
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
	aimerror=1.0000000
}
