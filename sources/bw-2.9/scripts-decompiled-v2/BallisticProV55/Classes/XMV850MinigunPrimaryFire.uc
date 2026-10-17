class XMV850MinigunPrimaryFire extends BallisticProInstantFire;

var Rotator OldLookDir;
var Rotator TurnVelocity;
var float LastFireTime;
var float MuzzleBTime;
var float MuzzleCTime;
var float OldFireRate;
var Actor MuzzleFlashB;
var Actor MuzzleFlashC;
var XMV850Minigun Minigun;
var float LagTime;
var int TraceCount;
var bool bStarted;
var bool bRequireSpool;
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
	// End:0xBE
	if(Instigator.IsLocallyControlled())
	{
		TurnVelocity = (BasePlayerView - OldLookDir) / dt;
		OldLookDir = BasePlayerView;
		// End:0xBE
		if((int(Level.NetMode) == int(NM_Client)) && Level.TimeSeconds > NextTVUpdateTime)
		{
			Minigun.SetServerTurnVelocity(TurnVelocity.Yaw, TurnVelocity.Pitch);
			NextTVUpdateTime = Level.TimeSeconds + 0.1500000;
		}
	}
	OldFireRate = FireRate;
	// End:0xF4
	if(Minigun.BarrelSpeed <= float(0))
	{
		FireRate = 1.0000000;
		TraceCount = 1;		
	}
	else
	{
		DesiredFireRate = FMin(1.0000000 / ((float(60) * (float(1) + (0.2500000 * float(int(BW.bBerserk))))) * Minigun.BarrelSpeed), 1.0000000);
		// End:0x15D
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
	// End:0x287
	if(MuzzleBTime != float(0))
	{
		MuzzleBTime += ((FireRate / float(TraceCount)) - (OldFireRate / float(TraceCount)));
		// End:0x287
		if(Level.TimeSeconds >= MuzzleBTime)
		{
			MuzzleBTime = 0.0000000;
			// End:0x21A
			if(MuzzleFlashB != none)
			{
				MuzzleFlashB.Trigger(Weapon, Instigator);
			}
			// End:0x281
			if(BallisticFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}
			EjectBrass();
		}
	}
	// End:0x36D
	if(MuzzleCTime != float(0))
	{
		MuzzleCTime += ((FireRate / float(TraceCount)) - (OldFireRate / float(TraceCount)));
		// End:0x36D
		if(Level.TimeSeconds >= MuzzleCTime)
		{
			MuzzleCTime = 0.0000000;
			// End:0x300
			if(MuzzleFlashC != none)
			{
				MuzzleFlashC.Trigger(Weapon, Instigator);
			}
			// End:0x367
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
		XMV850MinigunAttachment(Weapon.ThirdPersonActor).UpdateTurnVelocity(TurnVelocity);
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
	// End:0x76
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		BW.RewindCollisions();
	}
	i = 0;
	J0x7D:

	// End:0x176 [Loop If]
	if((i < TraceCount) && ConsumedLoad < BW.MagAmmo)
	{
		ConsumedLoad += int(load);
		Aim = GetNewFireAim(StartTrace, ExtraTime);
		Aim += ExtraAim;
		R = Rotator((GetFireSpread()) >> Aim);
		DoTrace(StartTrace, R);
		ApplyRecoil();
		// End:0x12C
		if(i == 1)
		{
			MuzzleBTime = Level.TimeSeconds + ExtraTime;			
		}
		else
		{
			// End:0x153
			if(i == 2)
			{
				MuzzleCTime = Level.TimeSeconds + ExtraTime;
			}
		}
		ExtraTime += Interval;
		ExtraAim += AimInterval;
		i++;
		// [Loop Continue]
		goto J0x7D;
	}
	// End:0x19E
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		BW.RestoreCollisions();
	}
	SetTimer(FMin(0.1000000, FireRate / float(2)), false);
	super(WeaponFire).DoFireEffect();
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x3B
	if(bRequireSpool && Minigun.BarrelSpeed < Minigun.DesiredSpeed)
	{
		return;
	}
	BW.bPreventReload = true;
	BW.FireCount++;
	// End:0x84
	if(BW.FireCount == 1)
	{
		NextFireTime = Level.TimeSeconds;
	}
	// End:0xAE
	if(int(BW.ReloadState) != int(0))
	{
		BW.ReloadState = 0;
	}
	// End:0x1D3
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		DoFireEffect();
		// End:0xF0
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x12C
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
		// End:0x1D3
		if((BallisticTurret(Weapon.Owner) == none) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo) != none)
		{
			Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo).AddFireStat(int(load), int(BW.InventoryGroup));
		}
	}
	// End:0x1FB
	if(!BW.bScopeView)
	{
		BW.AddFireChaos(FireChaos);
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x245
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
	// End:0x2CF
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
	TraceCount=1
	TraceRange=(Min=12000.0000000,Max=12000.0000000)
	DamageType=Class'BallisticProV55.DTXMV850MG'
	DamageTypeHead=Class'BallisticProV55.DTXMV850MGHead'
	DamageTypeArm=Class'BallisticProV55.DTXMV850MG'
	PenetrateForce=150
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Minigun'
	BrassOffset=(X=-50.0000000,Y=-8.0000000,Z=5.0000000)
	MuzzleFlashClass=Class'BallisticProV55.XMV850FlashEmitter'
	FlashScaleFactor=0.8000000
	FireRecoil=72.0000000
	FirePushbackForce=150.0000000
	FireChaos=0.1200000
	XInaccuracy=16.0000000
	YInaccuracy=16.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.XMV-850.XMV-Fire-1',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	FireRate=0.0500000
	AmmoClass=Class'BallisticProV55.Ammo_MinigunRounds'
	ShakeRotMag=(X=32.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=480.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-60.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	WarnTargetPct=0.2000000
	aimerror=900.0000000
}
