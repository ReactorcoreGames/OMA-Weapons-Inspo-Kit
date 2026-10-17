class TridentSecondaryFire extends BallisticProShotgunFire;

var Rotator OldLookDir;
var Rotator TurnVelocity;
var float LastFireTime;
var float MuzzleBTime;
var float MuzzleCTime;
var float OldFireRate;
var Actor MuzzleFlashB;
var Actor MuzzleFlashC;
var TridentMachinegun TridentWeapon;
var float NextTVUpdateTime;

function NoHitEffect(Vector Dir, optional Vector Start, optional Vector HitLocation, optional Vector WaterHitLoc)
{
	local Vector V;

	V = (Instigator.Location + Instigator.EyePosition()) + (Dir * TraceRange.Min);
	// End:0x124
	if(((((TracerClass != none) && int(Level.DetailMode) > int(0)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0) && VSize(V - BallisticAttachment(Instigator.Weapon.ThirdPersonActor).GetModeTipLocation()) > float(200)) && FRand() < TracerChance)
	{
		Spawn(TracerClass, Instigator,, BallisticAttachment(Instigator.Weapon.ThirdPersonActor).GetModeTipLocation(), Rotator(V - BallisticAttachment(Instigator.Weapon.ThirdPersonActor).GetModeTipLocation()));
	}
	// End:0x1B0
	if((((ImpactManager != none) && WaterHitLoc != vect(0.0000000, 0.0000000, 0.0000000)) && Weapon.EffectIsRelevant(WaterHitLoc, false)) && bDoWaterSplash)
	{
		ImpactManager.static.StartSpawn(WaterHitLoc, Normal((Instigator.Location + Instigator.EyePosition()) - WaterHitLoc), 9, Instigator);
	}
	//return;	
}

simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
{
	local int Surf;

	// End:0x8C
	if((((ImpactManager != none) && WaterHitLoc != vect(0.0000000, 0.0000000, 0.0000000)) && Weapon.EffectIsRelevant(WaterHitLoc, false)) && bDoWaterSplash)
	{
		ImpactManager.static.StartSpawn(WaterHitLoc, Normal((Instigator.Location + Instigator.EyePosition()) - WaterHitLoc), 9, Instigator);
	}
	// End:0xB4
	if(!Other.bWorldGeometry && Mover(Other) == none)
	{
		return false;
	}
	// End:0xD0
	if(!bAISilent)
	{
		Instigator.MakeNoise(1.0000000);
	}
	// End:0x23E
	if((ImpactManager != none) && Weapon.EffectIsRelevant(HitLocation, false))
	{
		// End:0x110
		if(Vehicle(Other) != none)
		{
			Surf = 3;			
		}
		else
		{
			// End:0x134
			if(HitMat == none)
			{
				Surf = int(Other.SurfaceType);				
			}
			else
			{
				Surf = int(HitMat.SurfaceType);
			}
		}
		ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Instigator);
		// End:0x23E
		if(((((TracerClass != none) && int(Level.DetailMode) > int(0)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0) && VSize(HitLocation - BallisticAttachment(Weapon.ThirdPersonActor).GetModeTipLocation()) > float(200)) && FRand() < TracerChance)
		{
			Spawn(TracerClass, Instigator,, BallisticAttachment(Weapon.ThirdPersonActor).GetModeTipLocation(), Rotator(HitLocation - BallisticAttachment(Weapon.ThirdPersonActor).GetModeTipLocation()));
		}
	}
	BW.TargetedHurtRadius(1.0000000, 128.0000000, DamageType, 1.0000000, HitLocation, Pawn(Other));
	return true;
	//return;	
}

simulated function DestroyEffects()
{
	// End:0x17
	if(MuzzleFlash != none)
	{
		MuzzleFlash.Destroy();
	}
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashB);
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashC);
	super(BallisticFire).DestroyEffects();
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
			TridentWeapon.SetServerTurnVelocity(TurnVelocity.Yaw, TurnVelocity.Pitch);
			NextTVUpdateTime = Level.TimeSeconds + 0.1500000;
		}
	}
	OldFireRate = FireRate;
	// End:0xF4
	if(TridentWeapon.BarrelSpeed <= float(0))
	{
		FireRate = 1.0000000;
		TraceCount = 1;		
	}
	else
	{
		DesiredFireRate = FMin(1.0000000 / (float(12) * TridentWeapon.BarrelSpeed), 1.0000000);
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
		TridentAttachment(Weapon.ThirdPersonActor).UpdateTurnVelocity(TurnVelocity);
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

	// End:0x170 [Loop If]
	if((i < TraceCount) && ConsumedLoad < BW.MagAmmo)
	{
		ConsumedLoad += int(load);
		Aim = GetNewFireAim(StartTrace, ExtraTime);
		Aim += ExtraAim;
		R = Rotator((GetFireSpread()) >> Aim);
		DoTrace(StartTrace, R);
		// End:0x126
		if(i == 1)
		{
			MuzzleBTime = Level.TimeSeconds + ExtraTime;			
		}
		else
		{
			// End:0x14D
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
	// End:0x198
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		BW.RestoreCollisions();
	}
	ApplyHits();
	SetTimer(FMin(0.1000000, FireRate / float(2)), false);
	SendFireEffect(none, Vector(Aim) * TraceRange.Max, StartTrace, 0);
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
	if(TridentWeapon.BarrelSpeed < TridentWeapon.DesiredSpeed)
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
	MaxSpreadFactor=2
	TraceCount=6
	TracerClass=Class'BWBP_OP_Pro.TraceEmitter_RCSShotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=4000.0000000,Max=6000.0000000)
	DecayRange=(Min=768.0000000,Max=1536.0000000)
	Damage=9.0000000
	RangeAtten=0.3000000
	DamageType=Class'BWBP_OP_Pro.DT_RCS715Shotgun'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_RCS715ShotgunHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_RCS715Shotgun'
	KickForce=500
	PenetrateForce=100
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_MRS138Shotgun'
	BrassBone="EjectorDoor"
	BrassOffset=(X=-1.0000000,Y=0.0000000,Z=-1.0000000)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
	AimedFireAnim="SightFire"
	FireRecoil=256.0000000
	FirePushbackForce=150.0000000
	FireChaos=0.5000000
	XInaccuracy=192.0000000
	YInaccuracy=192.0000000
	BallisticFireSound=(Sound=SoundGroup'BW_Core_WeaponSound.XMV-850.XMV-Fire-3',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireAnimRate=2.5000000
	FireRate=0.2000000
	AmmoClass=Class'BallisticProV55.Ammo_556mmBelt'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.5000000
}
