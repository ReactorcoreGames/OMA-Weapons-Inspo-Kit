class TyphonPDWPrimaryFire extends BallisticProInstantFire;

var float StopFireTime;
var bool bPreventFire;
var Actor MuzzleFlashBlue;
var() name PreFireAnimCharged;
var() name FireLoopAnimCharged;
var() name FireEndAnimCharged;
var bool bSpinUp;
var() float OverChargedFireRate;
var int SoundAdjust;
var() Sound ChargeSound;
var() Sound PowerFireSound;
var() Sound RegularFireSound;
var int TraceCount;

simulated function ModeTick(float dt)
{
	// End:0xA8
	if((bIsFiring && !bPreventFire) && !TyphonPDW(BW).bShieldUp)
	{
		TyphonPDW(BW).SetLaserCharge(FMin(TyphonPDW(BW).LaserCharge + ((TyphonPDW(BW).ChargeRate * dt) * float(1 + (2 * int(BW.bBerserk)))), TyphonPDW(BW).MaxCharge));		
	}
	else
	{
		// End:0x154
		if(TyphonPDW(BW).LaserCharge > float(0))
		{
			bPreventFire = true;
			TyphonPDW(BW).SetLaserCharge(FMax(0.0000000, TyphonPDW(BW).LaserCharge - ((TyphonPDW(BW).CoolRate * dt) * float(1 + (2 * int(BW.bBerserk))))));
			// End:0x154
			if(TyphonPDW(BW).LaserCharge <= float(0))
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
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x7F
	if(!bSpinUp && !bPreventFire)
	{
		Weapon.PlayOwnedSound(ChargeSound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		bSpinUp = true;
	}
	// End:0xC5
	if((TyphonPDW(BW).LaserCharge < TyphonPDW(BW).MaxCharge) || TyphonPDW(BW).bShieldUp)
	{
		return;
	}
	// End:0x174
	if(BW != none)
	{
		BW.bPreventReload = true;
		BW.FireCount++;
		// End:0x120
		if(BW.FireCount == 1)
		{
			NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
		}
		// End:0x174
		if(int(BW.ReloadState) != int(0))
		{
			// End:0x163
			if(int(Weapon.Role) == int(ROLE_Authority))
			{
				BW.bServerReloading = false;
			}
			BW.ReloadState = 0;
		}
	}
	load = float(AmmoPerFire);
	HoldTime = 0.0000000;
	// End:0x2B1
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		DoFireEffect();
		// End:0x1CE
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x20A
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
		// End:0x2B1
		if((BallisticTurret(Weapon.Owner) == none) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo) != none)
		{
			Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo).AddFireStat(int(load), int(BW.InventoryGroup));
		}
	}
	// End:0x2D9
	if(!BW.bScopeView)
	{
		BW.AddFireChaos(FireChaos);
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x337
	if(Instigator.IsLocallyControlled())
	{
		ShakeView();
		PlayFiring();
		FlashMuzzleFlash();
		StartMuzzleSmoke();
		TyphonPDW(BW).UpdateScreen();		
	}
	else
	{
		ServerPlayFiring();
	}
	NextFireTime += FireRate;
	NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
	// End:0x3A9
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

	// End:0x1C
	if(!bAISilent)
	{
		Instigator.MakeNoise(1.0000000);
	}
	// End:0x44
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		BW.RewindCollisions();
	}
	i = 0;
	J0x4B:

	// End:0xC9 [Loop If]
	if((i < TraceCount) && ConsumedLoad < BW.MagAmmo)
	{
		ConsumedLoad += int(load);
		Aim = GetFireAim(StartTrace);
		Aim = Rotator((GetFireSpread()) >> Aim);
		DoTrace(StartTrace, Aim);
		ApplyRecoil();
		i++;
		// [Loop Continue]
		goto J0x4B;
	}
	// End:0xF1
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		BW.RestoreCollisions();
	}
	SetTimer(FMin(0.1000000, FireRate / float(2)), false);
	super(WeaponFire).DoFireEffect();
	//return;	
}

simulated function SwitchCannonMode(byte newmode)
{
	// End:0x37
	if(int(newmode) == 1)
	{
		TyphonPDW(BW).ChargeRate = TyphonPDW(BW).default.ChargeRateOvercharge;		
	}
	else
	{
		TyphonPDW(BW).ChargeRate = TyphonPDW(BW).default.ChargeRate;
	}
	// End:0x7C
	if(Weapon.bBerserk)
	{
		FireRate *= 0.7500000;
	}
	// End:0xBB
	if(Level.GRI.WeaponBerserk > 1.0000000)
	{
		FireRate /= Level.GRI.WeaponBerserk;
	}
	//return;	
}

simulated function PlayPreFire()
{
	Instigator.AmbientSound = ChargeSound;
	Instigator.SoundVolume = byte(255);
	super(BallisticFire).PlayPreFire();
	//return;	
}

function StopFiring()
{
	Instigator.AmbientSound = TyphonPDW(BW).UsedAmbientSound;
	Instigator.SoundVolume = Instigator.default.SoundVolume;
	bSpinUp = false;
	StopFireTime = Level.TimeSeconds;
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
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashBlue, Class'BWBP_SKC_Pro.HMCFlashEmitter', Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	}
	MuzzleFlash = MuzzleFlashBlue;
	//return;	
}

simulated function DestroyEffects()
{
	super(WeaponFire).DestroyEffects();
	//return;	
}

defaultproperties
{
	ChargeSound=Sound'BWBP_SKC_Sounds.Typhon.Typhon-PowerCharge'
	TraceCount=1
	WaterRangeAtten=0.5000000
	BrassClass=Class'BWBP_SKC_Pro.Brass_PUMA'
	BrassOffset=(X=-30.0000000,Y=1.0000000,Z=0.0000000)
	DryFireSound=(Sound=Sound'BWBP_SKC_Sounds.LS14.Gauss-Empty',Volume=1.2000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_Laser'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-60.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
}
