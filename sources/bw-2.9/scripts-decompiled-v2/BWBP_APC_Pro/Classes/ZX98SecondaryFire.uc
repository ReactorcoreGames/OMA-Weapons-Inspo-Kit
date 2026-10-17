class ZX98SecondaryFire extends BallisticProInstantFire;

var Rotator OldLookDir;
var Rotator TurnVelocity;
var float LastFireTime;
var float MuzzleBTime;
var float MuzzleCTime;
var float OldFireRate;
var Actor MuzzleFlashB;
var Actor MuzzleFlashC;
var ZX98AssaultRifle ZX98Weapon;
var float LagTime;
var int TraceCount;
var bool bStarted;
var float NextTVUpdateTime;

function InitEffects()
{
	// End:0x1B
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	super(BallisticFire).InitEffects();
	// End:0x85
	if((MuzzleFlashClass != none) && (MuzzleFlashB == none) || MuzzleFlashB.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashB, MuzzleFlashClass, Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	}
	// End:0xE9
	if((MuzzleFlashClass != none) && (MuzzleFlashC == none) || MuzzleFlashC.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashC, MuzzleFlashClass, Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	}
	//return;	
}

simulated function DestroyEffects()
{
	super(BallisticFire).DestroyEffects();
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashB);
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashC);
	//return;	
}

simulated function Rotator GetNewAimPivot(float ExtraTime, optional bool bIgnoreViewAim)
{
	return BW.CalcFutureAim(ExtraTime, bIgnoreViewAim);
	//return;	
}

simulated function Vector GetNewFireDir(out Vector StartTrace, float ExtraTime)
{
	// End:0x51
	if(BallisticTurret(Instigator) != none)
	{
		StartTrace = (Instigator.Location + Instigator.EyePosition()) + (Vector(Instigator.GetViewRotation()) * float(64));		
	}
	else
	{
		// End:0x8D
		if(StartTrace == vect(0.0000000, 0.0000000, 0.0000000))
		{
			StartTrace = Instigator.Location + Instigator.EyePosition();
		}
	}
	// End:0xEE
	if((AIController(Instigator.Controller) != none) && BallisticTurret(Instigator) == none)
	{
		return Vector((GetNewAimPivot(ExtraTime)) + BW.GetRecoilPivot()) >> (AdjustAim(StartTrace, aimerror));		
	}
	else
	{
		return Vector((GetNewAimPivot(ExtraTime)) + BW.GetRecoilPivot()) >> BW.GetPlayerAim(true);
	}
	//return;	
}

simulated function Rotator GetNewFireAim(out Vector StartTrace, float ExtraTime)
{
	return Rotator(GetNewFireDir(StartTrace, ExtraTime));
	//return;	
}

event PostBeginPlay()
{
	OldLookDir = BW.GetPlayerAim();
	OldFireRate = FireRate;
	super(WeaponFire).PostBeginPlay();
	//return;	
}

event ModeTick(float dt)
{
	local float DesiredFireRate;
	local Rotator BasePlayerView;

	BasePlayerView = BW.GetPlayerAim();
	// End:0xBE
	if(Instigator.IsLocallyControlled())
	{
		TurnVelocity = (BasePlayerView - OldLookDir) / dt;
		OldLookDir = BasePlayerView;
		// End:0xBE
		if((int(Level.NetMode) == int(NM_Client)) && Level.TimeSeconds > NextTVUpdateTime)
		{
			ZX98Weapon.SetServerTurnVelocity(TurnVelocity.Yaw, TurnVelocity.Pitch);
			NextTVUpdateTime = Level.TimeSeconds + 0.1500000;
		}
	}
	OldFireRate = FireRate;
	// End:0xF4
	if(ZX98Weapon.BarrelSpeed <= float(0))
	{
		FireRate = 1.0000000;
		TraceCount = 1;		
	}
	else
	{
		DesiredFireRate = FMin(1.0000000 / (float(12) * ZX98Weapon.BarrelSpeed), 1.0000000);
		// End:0x13C
		if(int(BW.CurrentWeaponMode) == 0)
		{
			TraceCount = 1;			
		}
		else
		{
			TraceCount = int(Ceil((dt * 1.5000000) / DesiredFireRate));
		}
		FireRate = DesiredFireRate * float(TraceCount);
	}
	NextFireTime += (FireRate - OldFireRate);
	// End:0x266
	if(MuzzleBTime != float(0))
	{
		MuzzleBTime += ((FireRate / float(TraceCount)) - (OldFireRate / float(TraceCount)));
		// End:0x266
		if(Level.TimeSeconds >= MuzzleBTime)
		{
			MuzzleBTime = 0.0000000;
			// End:0x1F9
			if(MuzzleFlashB != none)
			{
				MuzzleFlashB.Trigger(Weapon, Instigator);
			}
			// End:0x260
			if(BallisticFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}
			EjectBrass();
		}
	}
	// End:0x34C
	if(MuzzleCTime != float(0))
	{
		MuzzleCTime += ((FireRate / float(TraceCount)) - (OldFireRate / float(TraceCount)));
		// End:0x34C
		if(Level.TimeSeconds >= MuzzleCTime)
		{
			MuzzleCTime = 0.0000000;
			// End:0x2DF
			if(MuzzleFlashC != none)
			{
				MuzzleFlashC.Trigger(Weapon, Instigator);
			}
			// End:0x346
			if(BallisticFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}
			EjectBrass();
		}
	}
	super(BallisticFire).ModeTick(dt);
	//return;	
}

simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
{
	super(BallisticFire).SendFireEffect(Other, HitLocation, HitNormal, Surf, WaterHitLoc);
	// End:0x5A
	if(int(Level.NetMode) != int(NM_Standalone))
	{
		ZX98Attachment(Weapon.ThirdPersonActor).UpdateTurnVelocity(TurnVelocity);
	}
	//return;	
}

function DoFireEffect()
{
	local Vector StartTrace;
	local Rotator R, Aim, ExtraAim, AimInterval;
	local int i;
	local float Interval, ExtraTime;

	// End:0x1C
	if(!bAISilent)
	{
		Instigator.MakeNoise(1.0000000);
	}
	// End:0x4E
	if(TraceCount > 1)
	{
		Interval = FireRate / float(TraceCount);
		AimInterval = TurnVelocity * Interval;
	}
	i = 0;
	J0x55:

	// End:0x148 [Loop If]
	if((i < TraceCount) && ConsumedLoad < BW.MagAmmo)
	{
		ConsumedLoad += int(load);
		Aim = GetNewFireAim(StartTrace, ExtraTime);
		Aim += ExtraAim;
		R = Rotator((GetFireSpread()) >> Aim);
		DoTrace(StartTrace, R);
		// End:0xFE
		if(i == 1)
		{
			MuzzleBTime = Level.TimeSeconds + ExtraTime;			
		}
		else
		{
			// End:0x125
			if(i == 2)
			{
				MuzzleCTime = Level.TimeSeconds + ExtraTime;
			}
		}
		ExtraTime += Interval;
		ExtraAim += AimInterval;
		i++;
		// [Loop Continue]
		goto J0x55;
	}
	SetTimer(FMin(0.1000000, FireRate / float(2)), false);
	super(BallisticFire).DoFireEffect();
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x30
	if(ZX98Weapon.BarrelSpeed < ZX98Weapon.DesiredSpeed)
	{
		return;
	}
	BW.bPreventReload = true;
	BW.FireCount++;
	// End:0x79
	if(BW.FireCount == 1)
	{
		NextFireTime = Level.TimeSeconds;
	}
	// End:0xA3
	if(int(BW.ReloadState) != int(0))
	{
		BW.ReloadState = 0;
	}
	// End:0x1C8
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		DoFireEffect();
		// End:0xE5
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x121
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
		// End:0x1C8
		if((BallisticTurret(Weapon.Owner) == none) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo) != none)
		{
			Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo).AddFireStat(int(load), int(BW.InventoryGroup));
		}
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x212
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
	// End:0x29C
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
	//return;	
}

defaultproperties
{
	TraceRange=(Min=15000.0000000,Max=20000.0000000)
	WallPenetrationForce=128.0000000
	Damage=90.0000000
	RangeAtten=0.3500000
	WaterRangeAtten=0.8000000
	DamageType=Class'BWBP_APC_Pro.DTZX98Gauss'
	DamageTypeHead=Class'BWBP_APC_Pro.DTZX98GaussHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTZX98Gauss'
	PenetrateForce=512
	bPenetrate=true
	RunningSpeedThresh=1000.0000000
	bCockAfterEmpty=true
	ClipFinishSound=(Sound=Sound'BW_Core_WeaponSound.Misc.ClipEnd-1',Volume=0.8000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.Misc.DryRifle',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BWBP_APC_Pro.ZX98SFlashEmitter'
	FlashScaleFactor=0.5000000
	FireRecoil=180.0000000
	FireChaos=0.0320000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.1600000,OutVal=1.0000000),(InVal=0.2500000,OutVal=1.5000000),(InVal=0.5000000,OutVal=2.2500000),(InVal=0.7500000,OutVal=3.5000000),(InVal=1.0000000,OutVal=5.0000000)))
	XInaccuracy=64.0000000
	YInaccuracy=64.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-QFire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bPawnRapidFireAnim=true
	PreFireAnim="None"
	FireAnim="ChargedFire"
	FireEndAnim="None"
	FireRate=1.0000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_42HVG'
	AmmoPerFire=4
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	WarnTargetPct=0.2000000
	aimerror=900.0000000
}
