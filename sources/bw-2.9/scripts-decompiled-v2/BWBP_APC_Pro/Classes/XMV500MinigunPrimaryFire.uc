class XMV500MinigunPrimaryFire extends BallisticInstantFire;

var Rotator OldLookDir;
var Rotator TurnVelocity;
var float LastFireTime;
var float MuzzleBTime;
var float MuzzleCTime;
var float OldFireRate;
var Actor MuzzleFlashB;
var Actor MuzzleFlashC;
var XMV500Minigun Minigun;
var() int SplashDamage;
var() int SplashDamageRadius;
var float LagTime;
var int TraceCount;
var bool bStarted;
var float NextTVUpdateTime;

function PlayFiring()
{
	// End:0x29
	if(int(ScopeDownOn) == int(1))
	{
		BW.TemporaryScopeDown(0.5000000, 0.9000000);
	}
	// End:0x8E
	if(!bStarted)
	{
		bStarted = true;
		BW.SafeLoopAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");
		BW.PlaySound(Minigun.BarrelStartSound, 0, 0.5000000,, 32.0000000, 1.0000000, true);
	}
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0x107
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	//return;	
}

function ServerPlayFiring()
{
	// End:0x67
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	// End:0xCF
	if(!bStarted)
	{
		bStarted = true;
		BW.SafeLoopAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");
		BW.PlayOwnedSound(Minigun.BarrelStartSound, 0, 0.5000000,, 32.0000000, 1.0000000, true);
	}
	//return;	
}

function StopFiring()
{
	bStarted = false;
	//return;	
}

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

	BasePlayerView = BW.GetBasePlayerView();
	// End:0x2C
	if(!Instigator.IsLocallyControlled())
	{		
	}
	else
	{
		TurnVelocity = (BasePlayerView - OldLookDir) / dt;
		OldLookDir = BasePlayerView;
		// End:0xC3
		if((int(Level.NetMode) == int(NM_Client)) && Level.TimeSeconds > NextTVUpdateTime)
		{
			Minigun.SetServerTurnVelocity(TurnVelocity.Yaw, TurnVelocity.Pitch);
			NextTVUpdateTime = Level.TimeSeconds + 0.1500000;
		}
	}
	OldFireRate = FireRate;
	// End:0xF9
	if(Minigun.BarrelSpeed <= float(0))
	{
		FireRate = 1.0000000;
		TraceCount = 1;		
	}
	else
	{
		DesiredFireRate = FMin(1.0000000 / (float(60) * Minigun.BarrelSpeed), 1.0000000);
		// End:0x141
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
	// End:0x26B
	if(MuzzleBTime != float(0))
	{
		MuzzleBTime += ((FireRate / float(TraceCount)) - (OldFireRate / float(TraceCount)));
		// End:0x26B
		if(Level.TimeSeconds >= MuzzleBTime)
		{
			MuzzleBTime = 0.0000000;
			// End:0x1FE
			if(MuzzleFlashB != none)
			{
				MuzzleFlashB.Trigger(Weapon, Instigator);
			}
			// End:0x265
			if(BallisticFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}
			EjectBrass();
		}
	}
	// End:0x351
	if(MuzzleCTime != float(0))
	{
		MuzzleCTime += ((FireRate / float(TraceCount)) - (OldFireRate / float(TraceCount)));
		// End:0x351
		if(Level.TimeSeconds >= MuzzleCTime)
		{
			MuzzleCTime = 0.0000000;
			// End:0x2E4
			if(MuzzleFlashC != none)
			{
				MuzzleFlashC.Trigger(Weapon, Instigator);
			}
			// End:0x34B
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
		XMV500MinigunAttachment(Weapon.ThirdPersonActor).UpdateTurnVelocity(TurnVelocity);
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

	// End:0x14E [Loop If]
	if((i < TraceCount) && ConsumedLoad < BW.MagAmmo)
	{
		ConsumedLoad += int(load);
		Aim = GetNewFireAim(StartTrace, ExtraTime);
		Aim += ExtraAim;
		R = Rotator((GetFireSpread()) >> Aim);
		DoTrace(StartTrace, R);
		ApplyRecoil();
		// End:0x104
		if(i == 1)
		{
			MuzzleBTime = Level.TimeSeconds + ExtraTime;			
		}
		else
		{
			// End:0x12B
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
	super(WeaponFire).DoFireEffect();
	// End:0x1E3
	if(!AllowFire() || XMV500Minigun(Weapon).bRunOffsetting)
	{
		// End:0x1E3
		if(Instigator != none)
		{
			Instigator.TakeDamage(Rand(2), Instigator, Instigator.Location, -Vector(Instigator.GetViewRotation()) * float(4000), Class'BWBP_APC_Pro.DTXMVCHEAT');
		}
	}
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x3A
	if(!AllowFire() || XMV500Minigun(BW).BarrelSpeed < XMV500Minigun(BW).DesiredSpeed)
	{
		return;
	}
	BW.bPreventReload = true;
	BW.FireCount++;
	// End:0x85
	if(int(BW.ReloadState) != int(0))
	{
		BW.ReloadState = 0;
	}
	// End:0x112
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		DoFireEffect();
		// End:0xC7
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x103
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
	}
	// End:0x13A
	if(!BW.bScopeView)
	{
		BW.AddFireChaos(FireChaos);
	}
	// End:0x167
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
	// End:0x1F1
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x265
	if(!AllowFire() || XMV500Minigun(Weapon).bRunOffsetting)
	{
		// End:0x265
		if(Instigator != none)
		{
			Instigator.TakeDamage(2, Instigator, Instigator.Location, -Vector(Instigator.GetViewRotation()) * float(4000), Class'BWBP_APC_Pro.DTXMVCHEAT');
		}
	}
	BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
	//return;	
}

function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	super.ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x6C
	if(Victim.bProjTarget)
	{
		BW.TargetedHurtRadius(float(SplashDamage), float(SplashDamageRadius), Class'BWBP_SKC_Pro.DT_AH104Pistol', 200.0000000, HitLocation, Pawn(Victim));
	}
	//return;	
}

simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
{
	// End:0x4B
	if((Other == none) || Other.bWorldGeometry)
	{
		BW.TargetedHurtRadius(float(SplashDamage), float(SplashDamageRadius), DamageType, 0.0000000, HitLocation);
	}
	return super.ImpactEffect(HitLocation, HitNormal, HitMat, Other, WaterHitLoc);
	//return;	
}

defaultproperties
{
	TraceCount=3
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	Damage=35.0000000
	RangeAtten=0.5000000
	WaterRangeAtten=0.3000000
	DamageType=Class'BWBP_APC_Pro.DTXMV500MG'
	DamageTypeHead=Class'BWBP_APC_Pro.DTXMV500MGHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTXMV500MG'
	KickForce=2500
	PenetrateForce=125
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Minigun'
	BrassOffset=(X=-50.0000000,Y=-8.0000000,Z=5.0000000)
	FlashScaleFactor=0.8000000
	BallisticFireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.550.Mini-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	FireRate=0.0500000
	AmmoClass=Class'BWBP_APC_Pro.Ammo_MinigunInc'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	WarnTargetPct=0.2000000
	aimerror=900.0000000
}
