class WrenchgunSecondaryFire extends BallisticProProjectileFire;

var() Actor MuzzleFlash2;
var() Sound SlugFireSound;
var byte ProjectileCount;
var name AimedFireEmptyAnim;
var name FireEmptyAnim;
var float HipSpreadFactor;

simulated function float GetCrosshairInaccAngle()
{
	return (YInaccuracy * HipSpreadFactor) * 0.0000959;
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
	// End:0xE5
	if(BW.HasNonMagAmmo(0))
	{
		BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
		// End:0xE2
		if(BW.BlendFire())
		{
			BW.SafePlayAnim(AimedFireAnim, FireAnimRate, TweenTime, 1, "AIMEDFIRE");
		}		
	}
	else
	{
		BW.SafePlayAnim(FireEmptyAnim, FireAnimRate, TweenTime,, "FIRE");
		// End:0x146
		if(BW.BlendFire())
		{
			BW.SafePlayAnim(AimedFireEmptyAnim, FireAnimRate, TweenTime, 1, "AIMEDFIRE");
		}
	}
	//return;	
}

function PlayFiring()
{
	// End:0x29
	if(int(ScopeDownOn) == int(1))
	{
		BW.TemporaryScopeDown(0.5000000, 0.9000000);
	}
	// End:0xA1
	if(BW.HasNonMagAmmo(0))
	{
		BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
		// End:0x9E
		if(BW.BlendFire())
		{
			BW.SafePlayAnim(AimedFireAnim, FireAnimRate, TweenTime, 1, "AIMEDFIRE");
		}		
	}
	else
	{
		BW.SafePlayAnim(FireEmptyAnim, FireAnimRate, TweenTime,, "FIRE");
		// End:0x102
		if(BW.BlendFire())
		{
			BW.SafePlayAnim(AimedFireEmptyAnim, FireAnimRate, TweenTime, 1, "AIMEDFIRE");
		}
	}
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0x17B
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	CheckClipFinished();
	//return;	
}

simulated function Vector GetFireSpread()
{
	local float fX;
	local Rotator R;

	// End:0x30
	if(BW.bScopeView || BW.bAimDisabled)
	{
		return super.GetFireSpread();		
	}
	else
	{
		fX = FRand();
		R.Yaw = int(((XInaccuracy * HipSpreadFactor) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
		R.Pitch = int(((YInaccuracy * HipSpreadFactor) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
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
	// End:0x241
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
	}
	// End:0x272
	if(!BW.bScopeView)
	{
		BW.LastFireTime = Level.TimeSeconds;
	}
	// End:0x29F
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
	// End:0x2EB
	if(bFireOnRelease)
	{
		// End:0x2CD
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
		NextFireTime += FireRate;
		NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
	}
	load = float(AmmoPerFire);
	HoldTime = 0.0000000;
	// End:0x36F
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x40E
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
		// End:0x3E9
		if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
		{
			BW.bNeedCock = true;
		}
		// End:0x40E
		if(BW.HasNonMagAmmo(0))
		{
			BW.ReloadState = 1;
		}
	}
	//return;	
}

simulated function Vector GetFireDir(out Vector StartTrace)
{
	// End:0x3C
	if(StartTrace == vect(0.0000000, 0.0000000, 0.0000000))
	{
		StartTrace = Instigator.Location + Instigator.EyePosition();
	}
	return Vector(AdjustAim(StartTrace, aimerror));
	//return;	
}

function DoFireEffect()
{
	local Vector StartTrace, X, Y, Z, Start, End,
		HitLocation, HitNormal;

	local Rotator Aim;
	local Actor Other;
	local int i;

	Weapon.GetViewAxes(X, Y, Z);
	Start = Instigator.Location + Instigator.EyePosition();
	StartTrace = (Start + (X * SpawnOffset.X)) + (Z * SpawnOffset.Z);
	// End:0xB6
	if(!Weapon.WeaponCentered())
	{
		StartTrace = StartTrace + ((Weapon.hand * Y) * SpawnOffset.Y);
	}
	i = 0;
	J0xBD:

	// End:0x16B [Loop If]
	if(i < int(ProjectileCount))
	{
		Aim = GetFireAim(StartTrace);
		Aim = Rotator((GetFireSpread()) >> Aim);
		End = Start + (Vector(Aim) * (MaxRange()));
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x151
		if(Other != none)
		{
			Aim = Rotator(HitLocation - StartTrace);
		}
		SpawnProjectile(StartTrace, Aim);
		i++;
		// [Loop Continue]
		goto J0xBD;
	}
	SendFireEffect(none, vect(0.0000000, 0.0000000, 0.0000000), StartTrace, 0);
	ConsumedLoad = BW.MagAmmo;
	super(BallisticFire).DoFireEffect();
	//return;	
}

function InitEffects()
{
	super(BallisticFire).InitEffects();
	// End:0x6A
	if((MuzzleFlashClass != none) && (MuzzleFlash2 == none) || MuzzleFlash2.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash2, MuzzleFlashClass, Weapon.DrawScale * FlashScaleFactor, Weapon, 'tip2');
	}
	//return;	
}

function FlashMuzzleFlash()
{
	local Coords C;
	local Actor MuzzleSmoke;
	local Vector Start, X, Y, Z;

	// End:0x36
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x74
	if(!Instigator.IsFirstPerson() || PlayerController(Instigator.Controller).ViewTarget != Instigator)
	{
		return;
	}
	// End:0xB3
	if(ConsumedLoad == 2)
	{
		C = Weapon.GetBoneCoords('tip2');
		MuzzleFlash2.Trigger(Weapon, Instigator);
	}
	C = Weapon.GetBoneCoords('tip');
	MuzzleFlash.Trigger(Weapon, Instigator);
	// End:0xFC
	if(!Class'BCoreProV55.BallisticMod'.default.bMuzzleSmoke)
	{
		return;
	}
	Weapon.GetViewAxes(X, Y, Z);
	Start = (C.Origin + (X * float(-180))) + (Y * float(3));
	MuzzleSmoke = Spawn(Class'BallisticProV55.MRT6Smoke', Weapon,, Start, Rotator(X));
	// End:0x17B
	if(!bBrassOnCock)
	{
		EjectBrass();
	}
	//return;	
}

defaultproperties
{
	ProjectileCount=2
	AimedFireEmptyAnim="SightFire"
	FireEmptyAnim="Fire"
	HipSpreadFactor=6.0000000
	SpawnOffset=(X=12.0000000,Y=10.0000000,Z=-15.0000000)
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	AimedFireAnim="SightFireCombined"
	FireRecoil=1100.0000000
	FireChaos=1.0000000
	XInaccuracy=64.0000000
	YInaccuracy=32.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.Redwood.SuperMagnum-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bTossed=true
	FireAnim="FireCombined"
	FireAnimRate=0.8000000
	FireForce="AssaultRifleAltFire"
	FireRate=0.3500000
	AmmoClass=Class'BallisticProV55.Ammo_12Gauge'
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_APC_Pro.WrenchgunWrench'
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
}
