class Supercharger_SecondaryFire extends BallisticMeleeFire;

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
	if(Supercharger_AssaultWeapon(Weapon).bLatchedOn)
	{
		Instigator.AmbientSound = SawHackLoop;		
	}
	else
	{
		Instigator.AmbientSound = SawFreeLoop;
	}
	// End:0xF5
	if(FireCount == 0)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		BW.SafePlayAnim('MeleeLoopStart', FireAnimRate, TweenTime,, "FIRE");		
	}
	else
	{
		// End:0x164
		if(FireCount > 0)
		{
			// End:0x13F
			if(Supercharger_AssaultWeapon(Weapon).bLatchedOn)
			{
				BW.SafeLoopAnim('MeleeLoop', FireAnimRate, TweenTime,, "FIRE");				
			}
			else
			{
				BW.SafeLoopAnim('MeleeLoop', FireAnimRate, TweenTime,, "FIRE");
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
		BW.SafePlayAnim('MeleeLoopStart', FireAnimRate, TweenTime,, "FIRE");		
	}
	else
	{
		// End:0xF9
		if(FireCount > 0)
		{
			// End:0xD4
			if(Supercharger_AssaultWeapon(Weapon).bLatchedOn)
			{
				BW.SafeLoopAnim('MeleeLoop', FireAnimRate, TweenTime,, "FIRE");				
			}
			else
			{
				BW.SafeLoopAnim('MeleeLoop', FireAnimRate, TweenTime,, "FIRE");
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
	// End:0x181
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		DoFireEffect();
		// End:0x136
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x172
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x1CB
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
	// End:0x217
	if(bFireOnRelease)
	{
		// End:0x1F9
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
	// End:0x2DB
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x355
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
		// End:0x355
		if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
		{
			BW.bNeedCock = true;
		}
	}
	BW.GunLength = BW.default.GunLength;
	// End:0x3B3
	if((BW.SprintControl != none) && BW.SprintControl.bSprinting)
	{
		BW.PlayerSprint(true);
	}
	//return;	
}

simulated function StopFiring()
{
	Instigator.AmbientSound = none;
	Weapon.PlayOwnedSound(SawStop, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, 1.0000000, BallisticFireSound.bAtten);
	BW.GunLength = BW.default.GunLength;
	Weapon.PlayAnim(FireEndAnim, FireEndAnimRate, 0.0000000, 0);
	//return;	
}

simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
{
	// End:0x3C
	if((Weapon != none) && int(Weapon.Role) == int(ROLE_Authority))
	{
		Supercharger_AssaultWeapon(Weapon).bLatchedOn = true;
	}
	return super(BallisticInstantFire).ImpactEffect(HitLocation, HitNormal, HitMat, Other, WaterHitLoc);
	//return;	
}

function NoHitEffect(Vector Dir, optional Vector Start, optional Vector HitLocation, optional Vector WaterHitLoc)
{
	// End:0x3C
	if((Weapon != none) && int(Weapon.Role) == int(ROLE_Authority))
	{
		Supercharger_AssaultWeapon(Weapon).bLatchedOn = false;
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
		Supercharger_AssaultWeapon(Weapon).bLatchedOn = false;
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
	Supercharger_AssaultWeapon(Weapon).bLatchedOn = true;
	//return;	
}

defaultproperties
{
	SawFreeLoop=Sound'BWBP_SKC_Sounds.SuperCharger.SC-ChompLoopEmpty'
	SawHackLoop=Sound'BWBP_SKC_Sounds.SuperCharger.SC-ChompLoop'
	SawStop=Sound'BWBP_SKC_Sounds.SuperCharger.SC-ChompStop'
	SwipePoints[0]=(Weight=3,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[1]=(Weight=5,offset=(Pitch=0,Yaw=1280,Roll=0))
	SwipePoints[2]=(Weight=6,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[3]=(Weight=4,offset=(Pitch=0,Yaw=-1280,Roll=0))
	SwipePoints[4]=(Weight=2,offset=(Pitch=0,Yaw=-2560,Roll=0))
	WallHitPoint=0
	NumSwipePoints=1
	KickForce=500
	ScopeDownOn=1
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.SuperCharger.SC-ChompStart',Volume=1.3500000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bAISilent=true
	FireAnim="MeleeLoopStart"
	FireEndAnim="MeleeLoopEnd"
	AmmoClass=Class'BallisticProV55.Ammo_HVCCells'
	ShakeRotMag=(X=64.0000000,Y=16.0000000,Z=0.0000000)
	ShakeRotRate=(X=1024.0000000,Y=1024.0000000,Z=512.0000000)
	ShakeRotTime=1.0000000
}
