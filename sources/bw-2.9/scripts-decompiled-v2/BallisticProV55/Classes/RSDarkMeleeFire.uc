class RSDarkMeleeFire extends BallisticMeleeFire;

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
	if(RSDarkStar(Weapon).bLatchedOn)
	{
		Weapon.AmbientSound = SawHackLoop;		
	}
	else
	{
		Weapon.AmbientSound = SawFreeLoop;
	}
	// End:0x122
	if(FireCount == 0)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		BW.SafePlayAnim('SawStart', FireAnimRate, TweenTime,, "FIRE");
		// End:0x11F
		if(int(BW.Role) == int(ROLE_Authority))
		{
			BW.AddSpeedModification(1.1500000);
		}		
	}
	else
	{
		// End:0x192
		if(FireCount > 4)
		{
			// End:0x16D
			if(RSDarkStar(Weapon).bLatchedOn)
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
	// End:0x9E
	if(FireCount == 0)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		BW.SafePlayAnim('SawStart', FireAnimRate, TweenTime,, "FIRE");
		BW.AddSpeedModification(1.1500000);		
	}
	else
	{
		// End:0x10E
		if(FireCount > 4)
		{
			// End:0xE9
			if(RSDarkStar(Weapon).bLatchedOn)
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
	// End:0x100
	if(bIsJammed)
	{
		// End:0xD7
		if(BW.FireCount == 0)
		{
			bIsJammed = false;
			// End:0x7E
			if(bJamWastesAmmo && int(Weapon.Role) == int(ROLE_Authority))
			{
				ConsumedLoad += int(load);
				Timer();
			}
			// End:0xC7
			if(int(UnjamMethod) == int(3))
			{
				NextFireTime += FireRate;
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
				BW.FireCount++;
				return;
			}
			// End:0xD4
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
	// End:0x180
	if(BW != none)
	{
		BW.bPreventReload = true;
		BW.FireCount++;
		// End:0x180
		if(int(BW.ReloadState) != int(0))
		{
			// End:0x16F
			if(int(Weapon.Role) == int(ROLE_Authority))
			{
				BW.bServerReloading = false;
			}
			BW.ReloadState = 0;
		}
	}
	// End:0x1A1
	if(MaxHoldTime > 0.0000000)
	{
		HoldTime = FMin(HoldTime, MaxHoldTime);
	}
	// End:0x1D3
	if(!bHitThisTick)
	{
		ConsumedLoad += int(load);
		SetTimer(FMin(0.1000000, FireRate / float(2)), false);
	}
	// End:0x260
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		DoFireEffect();
		// End:0x215
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x251
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x2AA
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
	// End:0x2F6
	if(bFireOnRelease)
	{
		// End:0x2D8
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
	// End:0x3BA
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x434
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
		// End:0x434
		if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
		{
			BW.bNeedCock = true;
		}
	}
	BW.GunLength = BW.default.GunLength;
	// End:0x492
	if((BW.SprintControl != none) && BW.SprintControl.bSprinting)
	{
		BW.PlayerSprint(true);
	}
	//return;	
}

function DoFireEffect()
{
	local Vector StartTrace;
	local Rotator Aim, PointAim;
	local int i;

	Aim = GetFireAim(StartTrace);
	Aim = Rotator((GetFireSpread()) >> Aim);
	// End:0x4F
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		BW.RewindCollisions();
	}
	i = 0;
	J0x56:

	// End:0xD6 [Loop If]
	if(i < NumSwipePoints)
	{
		// End:0x7E
		if(SwipePoints[i].Weight < 0)
		{
			// [Explicit Continue]
			goto J0xCC;
		}
		PointAim = Rotator(Vector(SwipePoints[i].offset) >> Aim);
		MeleeDoTrace(StartTrace, PointAim, i == WallHitPoint, SwipePoints[i].Weight);
		J0xCC:

		i++;
		// [Loop Continue]
		goto J0x56;
	}
	// End:0xFE
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		BW.RestoreCollisions();
	}
	bHitThisTick = SwipeHits.Length > 0;
	i = 0;
	J0x115:

	// End:0x17F [Loop If]
	if(i < SwipeHits.Length)
	{
		OnTraceHit(SwipeHits[i].Victim, SwipeHits[i].HitLoc, StartTrace, SwipeHits[i].HitDir, 0, 0, 0);
		SwipeHits[i].Victim = none;
		i++;
		// [Loop Continue]
		goto J0x115;
	}
	SwipeHits.Length = 0;
	super(BallisticFire).DoFireEffect();
	//return;	
}

simulated function StopFiring()
{
	Weapon.PlayOwnedSound(SawStop, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, 0.7500000 + (RSDarkStar(Weapon).ChainSpeed * 0.3750000), BallisticFireSound.bAtten);
	BW.GunLength = BW.default.GunLength;
	Weapon.PlayAnim(FireEndAnim, FireEndAnimRate, 0.0000000, 0);
	// End:0xCF
	if(int(BW.Role) == int(ROLE_Authority))
	{
		BW.RemoveSpeedModification(1.1500000);
	}
	//return;	
}

simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
{
	// End:0x3C
	if((Weapon != none) && int(Weapon.Role) == int(ROLE_Authority))
	{
		RSDarkStar(Weapon).bLatchedOn = true;
	}
	return super(BallisticInstantFire).ImpactEffect(HitLocation, HitNormal, HitMat, Other, WaterHitLoc);
	//return;	
}

function NoHitEffect(Vector Dir, optional Vector Start, optional Vector HitLocation, optional Vector WaterHitLoc)
{
	// End:0x3C
	if((Weapon != none) && int(Weapon.Role) == int(ROLE_Authority))
	{
		RSDarkStar(Weapon).bLatchedOn = false;
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
		RSDarkStar(Weapon).bLatchedOn = false;
		Weapon.AmbientSound = none;
	}
	//return;	
}

function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	local bool bWasAlive;

	// End:0x232
	if(Pawn(Victim) != none)
	{
		// End:0x176
		if((((BallisticPawn(Instigator) != none) && RSDarkStar(Instigator.Weapon) != none) && Victim.bProjTarget) && (Pawn(Victim).GetTeamNum() != Instigator.GetTeamNum()) || Instigator.GetTeamNum() == 255)
		{
			BallisticPawn(Instigator).GiveAttributedHealth(Damage / 3, int(Instigator.HealthMax), Instigator, true);
			// End:0x176
			if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassic() && Pawn(Victim).Health > 0)
			{
				// End:0x14D
				if(BW.MagAmmo < BW.default.MagAmmo)
				{
					BW.MagAmmo = Min(BW.default.MagAmmo, BW.MagAmmo + (Damage / 4));					
				}
				else
				{
					BW.AddAmmo(BW.MagAmmo + (Damage / 4), 0);
				}
			}
		}
		// End:0x1DB
		if((xPawn(Victim) != none) && Pawn(Victim).Health > 0)
		{
			// End:0x1D8
			if((Monster(Victim) == none) || Pawn(Victim).default.Health > 275)
			{
				bWasAlive = true;
			}			
		}
		else
		{
			// End:0x232
			if(((Vehicle(Victim) != none) && Vehicle(Victim).Driver != none) && Vehicle(Victim).Driver.Health > 0)
			{
				bWasAlive = true;
			}
		}
	}
	super(BallisticInstantFire).ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x2A0
	if(bWasAlive)
	{
		// End:0x2A0
		if(Pawn(Victim).Health <= 0)
		{
			Class'BallisticProV55.RSDarkSoul'.static.SpawnSoul(HitLocation, Instigator, Pawn(Victim), Weapon);
		}
	}
	// End:0x2EF
	if((Pawn(Victim) != none) && Pawn(Victim).Health > 0)
	{
		HookedVictim = Pawn(Victim);
		HookTime = Level.TimeSeconds;
	}
	RSDarkStar(Weapon).bLatchedOn = true;
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
	TraceRange=(Min=180.0000000,Max=180.0000000)
	Damage=25.0000000
	DamageType=Class'BallisticProV55.DT_RSDarkStab'
	DamageTypeHead=Class'BallisticProV55.DT_RSDarkStabHead'
	DamageTypeArm=Class'BallisticProV55.DT_RSDarkStab'
	KickForce=500
	HookStopFactor=1.0000000
	HookPullForce=100.0000000
	ScopeDownOn=1
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-SawOpen',Volume=0.7500000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bAISilent=true
	PreFireAnim="None"
	FireAnim="SawStart"
	FireEndAnim="SawEnd"
	FireRate=0.1000000
	AmmoClass=Class'BallisticProV55.Ammo_DarkDiamond'
	ShakeRotMag=(X=64.0000000,Y=16.0000000,Z=0.0000000)
	ShakeRotRate=(X=1024.0000000,Y=1024.0000000,Z=512.0000000)
	ShakeRotTime=1.0000000
	WarnTargetPct=0.0500000
}
