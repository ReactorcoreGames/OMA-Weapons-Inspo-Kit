class MAG78SecondaryFire extends BallisticMeleeFire;

var() Pawn HookedVictim;
var() float HookTime;
var() Sound SawFreeLoop;
var() Sound SawHackLoop;
var() Sound SawStop;
var bool bHitThisTick;

simulated function bool AllowFire()
{
	// End:0x24
	if(!super(BallisticFire).AllowFire())
	{
		// End:0x22
		if(bIsFiring)
		{
			StopFiring();
			bIsFiring = false;
		}
		return false;
	}
	return true;
	//return;	
}

function PlayFiring()
{
	// End:0x29
	if(int(ScopeDownOn) == int(1))
	{
		BW.TemporaryScopeDown(0.5000000, 0.0000000);
	}
	// End:0x57
	if(MAG78Longsword(Weapon).bLatchedOn)
	{
		Weapon.AmbientSound = SawHackLoop;		
	}
	else
	{
		Weapon.AmbientSound = SawFreeLoop;
	}
	// End:0xF5
	if(FireCount == 0)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		BW.SafePlayAnim('SawStart', FireAnimRate, TweenTime,, "FIRE");		
	}
	else
	{
		// End:0x165
		if(FireCount > 4)
		{
			// End:0x140
			if(MAG78Longsword(Weapon).bLatchedOn)
			{
				BW.SafeLoopAnim('SawAttack', FireAnimRate, TweenTime,, "FIRE");				
			}
			else
			{
				BW.SafeLoopAnim('SawIdle', FireAnimRate, TweenTime,, "FIRE");
			}
		}
	}
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	//return;	
}

function ServerPlayFiring()
{
	// End:0x8A
	if(FireCount == 0)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		BW.SafePlayAnim('SawStart', FireAnimRate, TweenTime,, "FIRE");		
	}
	else
	{
		// End:0xFA
		if(FireCount > 4)
		{
			// End:0xD5
			if(MAG78Longsword(Weapon).bLatchedOn)
			{
				BW.SafeLoopAnim('SawAttack', FireAnimRate, TweenTime,, "FIRE");				
			}
			else
			{
				BW.SafeLoopAnim('SawIdle', FireAnimRate, TweenTime,, "FIRE");
			}
		}
	}
	//return;	
}

simulated event ModeDoFire()
{
	BW.GunLength = 1.0000000;
	// End:0x21
	if(!AllowFire())
	{
		return;
	}
	// End:0xA1
	if(BW != none)
	{
		BW.bPreventReload = true;
		BW.FireCount++;
		// End:0xA1
		if(int(BW.ReloadState) != int(0))
		{
			// End:0x90
			if(int(Weapon.Role) == int(ROLE_Authority))
			{
				BW.bServerReloading = false;
			}
			BW.ReloadState = 0;
		}
	}
	// End:0xC2
	if(MaxHoldTime > 0.0000000)
	{
		HoldTime = FMin(HoldTime, MaxHoldTime);
	}
	// End:0xF4
	if(!bHitThisTick)
	{
		ConsumedLoad += int(load);
		SetTimer(FMin(0.1000000, FireRate / float(2)), false);
	}
	// End:0x1A9
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		DoFireEffect();
		MAG78Longsword(Weapon).NextAmmoTickTime = Level.TimeSeconds + float(2);
		// End:0x15E
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x19A
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x1F3
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
	// End:0x23F
	if(bFireOnRelease)
	{
		// End:0x221
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
		NextFireTime += (FireRate * (float(1) + BW.MeleeFatigue));
		NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
	}
	BW.MeleeFatigue = FMin(BW.MeleeFatigue + FatiguePerStrike, 1.0000000);
	load = float(AmmoPerFire);
	HoldTime = 0.0000000;
	// End:0x303
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x37D
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
		// End:0x37D
		if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
		{
			BW.bNeedCock = true;
		}
	}
	BW.GunLength = BW.default.GunLength;
	// End:0x3DB
	if((BW.SprintControl != none) && BW.SprintControl.bSprinting)
	{
		BW.PlayerSprint(true);
	}
	//return;	
}

simulated function StopFiring()
{
	Weapon.PlayOwnedSound(SawStop, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, 0.7500000 + (MAG78Longsword(Weapon).ChainSpeed * 0.3750000), BallisticFireSound.bAtten);
	BW.GunLength = BW.default.GunLength;
	Weapon.PlayAnim(FireEndAnim, FireEndAnimRate, 0.0000000, 0);
	//return;	
}

simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
{
	// End:0x3C
	if((Weapon != none) && int(Weapon.Role) == int(ROLE_Authority))
	{
		MAG78Longsword(Weapon).bLatchedOn = true;
	}
	return super(BallisticInstantFire).ImpactEffect(HitLocation, HitNormal, HitMat, Other, WaterHitLoc);
	//return;	
}

function NoHitEffect(Vector Dir, optional Vector Start, optional Vector HitLocation, optional Vector WaterHitLoc)
{
	// End:0x3C
	if((Weapon != none) && int(Weapon.Role) == int(ROLE_Authority))
	{
		MAG78Longsword(Weapon).bLatchedOn = false;
	}
	super(BallisticInstantFire).NoHitEffect(Dir, Start, HitLocation, WaterHitLoc);
	//return;	
}

simulated event ModeTick(float dt)
{
	super(BallisticFire).ModeTick(dt);
	// End:0x3C
	if(!IsFiring())
	{
		MAG78Longsword(Weapon).bLatchedOn = false;
		Weapon.AmbientSound = none;
	}
	//return;	
}

function ApplyDamage(Actor Target, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	super(BallisticInstantFire).ApplyDamage(Target, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x73
	if((Pawn(Target) != none) && Pawn(Target).Health > 0)
	{
		HookedVictim = Pawn(Target);
		HookTime = Level.TimeSeconds;
	}
	MAG78Longsword(Weapon).bLatchedOn = true;
	//return;	
}

defaultproperties
{
	SawFreeLoop=Sound'BW_Core_WeaponSound.DarkStar.Dark-Saw'
	SawHackLoop=Sound'BW_Core_WeaponSound.DarkStar.Dark-SawPitched'
	SawStop=Sound'BW_Core_WeaponSound.DarkStar.Dark-SawClose'
	SwipePoints[0]=(Weight=3,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[1]=(Weight=5,offset=(Pitch=0,Yaw=1280,Roll=0))
	SwipePoints[2]=(Weight=6,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[3]=(Weight=4,offset=(Pitch=0,Yaw=-1280,Roll=0))
	SwipePoints[4]=(Weight=2,offset=(Pitch=0,Yaw=-2560,Roll=0))
	WallHitPoint=0
	NumSwipePoints=1
	KickForce=500
	ScopeDownOn=1
	bAISilent=true
	AmmoClass=Class'BWBP_OP_Pro.Ammo_MAGSAWCharge'
	ShakeRotMag=(X=64.0000000,Y=16.0000000,Z=0.0000000)
	ShakeRotRate=(X=1024.0000000,Y=1024.0000000,Z=512.0000000)
	ShakeRotTime=1.0000000
}
