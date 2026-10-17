class BallisticMeleeFire extends BallisticInstantFire;

struct SwipePoint
{
	var() int Weight;
	var() Rotator offset;
};

struct SwipeHit
{
	var() int Weight;
	var() Actor Victim;
	var() Vector HitLoc;
	var() Vector HitDir;
};

var() array<SwipePoint> SwipePoints;
var() int WallHitPoint;
var() int NumSwipePoints;
var array<SwipeHit> SwipeHits;
var() Vector TraceExtent;
var float HoldStartTime;
var() float MaxBonusHoldTime;
var() float FlankDamageMult;
var() float BackDamageMult;
var() float ChargeDamageBonusFactor;
var float FatiguePerStrike;
var bool bCanBackstab;

simulated function ApplyFireEffectParams(FireEffectParams Params)
{
	local MeleeEffectParams effect_params;

	super.ApplyFireEffectParams(Params);
	effect_params = MeleeEffectParams(Params);
	ChargeDamageBonusFactor = effect_params.ChargeDamageBonusFactor;
	FlankDamageMult = effect_params.FlankDamageMult;
	BackDamageMult = effect_params.BackDamageMult;
	FatiguePerStrike = effect_params.Fatigue;
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x0D
	if(!CheckReloading())
	{
		return false;
	}
	return true;
	//return;	
}

simulated function float GetCrosshairInaccAngle()
{
	return float(SwipePoints[0].offset.Yaw) * 0.0000959;
	//return;	
}

function float MaxRange()
{
	return TraceRange.Max;
	//return;	
}

simulated function SetInstigator(Pawn P)
{
	Instigator = P;
	//return;	
}

function float ResolveDamageFactors(Actor Victim, Vector TraceStart, Vector HitLocation, int PenetrateCount, int WallCount, int WallPenForce, Vector WaterHitLocation)
{
	local float DamageFactor;
	local Vector testDir;
	local Combo Combo;

	DamageFactor = super.ResolveDamageFactors(Victim, TraceStart, HitLocation, PenetrateCount, WallCount, WallPenForce, WaterHitLocation);
	Combo = xPawn(Instigator).CurrentCombo;
	// End:0x83
	if(((Combo != none) && ComboDefensive(Combo) == none) && ComboBerserk(Combo) == none)
	{
		DamageFactor *= 0.5000000;
	}
	// End:0xB9
	if(HoldTime > float(0))
	{
		DamageFactor *= (float(1) + (ChargeDamageBonusFactor * (FMin(HoldTime, MaxBonusHoldTime) / MaxBonusHoldTime)));		
	}
	else
	{
		// End:0x115
		if((ThisModeNum == 2) && HoldStartTime != float(0))
		{
			DamageFactor *= (float(1) + (ChargeDamageBonusFactor * (FMin(Level.TimeSeconds - HoldStartTime, MaxBonusHoldTime) / MaxBonusHoldTime)));
			HoldStartTime = 0.0000000;
		}
	}
	// End:0x19F
	if(bCanBackstab)
	{
		testDir = Normal(HitLocation - TraceStart);
		testDir.Z = 0.0000000;
		// End:0x172
		if((Vector(Victim.Rotation) Dot testDir) > 0.6000000)
		{
			DamageFactor *= BackDamageMult;			
		}
		else
		{
			// End:0x19F
			if((Vector(Victim.Rotation) Dot testDir) > 0.2500000)
			{
				DamageFactor *= FlankDamageMult;
			}
		}
	}
	DamageFactor = FMin(3.0000000, DamageFactor);
	return DamageFactor;
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
	i = 0;
	J0x105:

	// End:0x16F [Loop If]
	if(i < SwipeHits.Length)
	{
		OnTraceHit(SwipeHits[i].Victim, SwipeHits[i].HitLoc, StartTrace, SwipeHits[i].HitDir, 0, 0, 0);
		SwipeHits[i].Victim = none;
		i++;
		// [Loop Continue]
		goto J0x105;
	}
	SwipeHits.Length = 0;
	super(BallisticFire).DoFireEffect();
	//return;	
}

simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
{
	// End:0x40
	if(ThisModeNum == 2)
	{
		BallisticAttachment(Weapon.ThirdPersonActor).MeleeUpdateHit(Other, HitLocation, HitNormal, Surf);		
	}
	else
	{
		super(BallisticFire).SendFireEffect(Other, HitLocation, HitNormal, Surf, WaterHitLoc);
	}
	//return;	
}

function MeleeDoTrace(Vector InitialStart, Rotator Dir, bool bWallHitter, int Weight)
{
	local int i;
	local Vector End, X, HitLocation, HitNormal, Start, WaterHitLoc,
		LastHitLocation;

	local Material HitMaterial;
	local float dist;
	local Actor Other, LastOther;
	local bool bHitWall;

	dist = TraceRange.Min + (FRand() * (TraceRange.Max - TraceRange.Min));
	Start = InitialStart;
	X = Normal(Vector(Dir));
	End = Start + (X * dist);
	LastHitLocation = End;
	Weapon.bTraceWater = true;
	J0x7B:

	// End:0x529 [Loop If]
	if(dist > float(0))
	{
		Other = Trace(HitLocation, HitNormal, End, Start, true, TraceExtent, HitMaterial);
		dist -= VSize(HitLocation - Start);
		// End:0x113
		if((int(Level.NetMode) == int(NM_Client)) && (int(Other.Role) != int(ROLE_Authority)) || Other.bWorldGeometry)
		{
			// [Explicit Break]
			goto J0x529;
		}
		// End:0x523
		if(Other != none)
		{
			LastHitLocation = HitLocation;
			// End:0x1CB
			if(bWallHitter && (FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
			{
				// End:0x190
				if(VSize(HitLocation - Start) > float(1))
				{
					WaterHitLoc = HitLocation;
				}
				Start = HitLocation;
				End = Start + (X * dist);
				Weapon.bTraceWater = false;
				goto J0x526;				
			}
			else
			{
				LastHitLocation = HitLocation;
			}
			// End:0x350
			if(!Other.bWorldGeometry && Other != LastOther)
			{
				i = 0;
				J0x202:

				// End:0x269 [Loop If]
				if(i < SwipeHits.Length)
				{
					// End:0x25F
					if(SwipeHits[i].Victim == Other)
					{
						// End:0x25C
						if(SwipeHits[i].Weight < Weight)
						{
							SwipeHits.Remove(i, 1);
							i--;
							// [Explicit Continue]
							goto J0x25F;
						}
						// [Explicit Break]
						goto J0x269;
					}
					J0x25F:

					i++;
					// [Loop Continue]
					goto J0x202;
				}
				J0x269:

				// End:0x33D
				if(i >= SwipeHits.Length)
				{
					SwipeHits.Length = SwipeHits.Length + 1;
					SwipeHits[SwipeHits.Length - 1].Victim = Other;
					SwipeHits[SwipeHits.Length - 1].Weight = Weight;
					SwipeHits[SwipeHits.Length - 1].HitLoc = HitLocation;
					SwipeHits[SwipeHits.Length - 1].HitDir = X;
					LastOther = Other;
					// End:0x33D
					if(bWallHitter && Vehicle(Other) != none)
					{
						bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);
					}
				}
				// End:0x350
				if(Mover(Other) == none)
				{
					// [Explicit Break]
					goto J0x529;
				}
			}
			// End:0x4B9
			if(Other.bWorldGeometry || Mover(Other) != none)
			{
				// End:0x487
				if(Other.bCanBeDamaged)
				{
					i = 0;
					J0x38D:

					// End:0x3F4 [Loop If]
					if(i < SwipeHits.Length)
					{
						// End:0x3EA
						if(SwipeHits[i].Victim == Other)
						{
							// End:0x3E7
							if(SwipeHits[i].Weight < Weight)
							{
								SwipeHits.Remove(i, 1);
								i--;
								// [Explicit Continue]
								goto J0x3EA;
							}
							// [Explicit Break]
							goto J0x3F4;
						}
						J0x3EA:

						i++;
						// [Loop Continue]
						goto J0x38D;
					}
					J0x3F4:

					// End:0x487
					if(i >= SwipeHits.Length)
					{
						SwipeHits.Length = SwipeHits.Length + 1;
						SwipeHits[SwipeHits.Length - 1].Victim = Other;
						SwipeHits[SwipeHits.Length - 1].Weight = Weight;
						SwipeHits[SwipeHits.Length - 1].HitLoc = HitLocation;
						SwipeHits[SwipeHits.Length - 1].HitDir = X;
						LastOther = Other;
					}
				}
				// End:0x4B6
				if(bWallHitter)
				{
					bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);
				}
				// [Explicit Break]
				goto J0x529;
			}
			// End:0x51D
			if((Other == Instigator) || Other == LastOther)
			{
				Start = HitLocation + ((X * Other.CollisionRadius) * float(2));
				End = Start + (X * dist);
				// [Explicit Continue]
				goto J0x526;
			}
			// [Explicit Break]
			goto J0x529;			
		}
		else
		{
			// [Explicit Break]
			goto J0x529;
		}
		J0x526:

		// [Loop Continue]
		goto J0x7B;
	}
	J0x529:

	// End:0x559
	if(!bHitWall && bWallHitter)
	{
		NoHitEffect(X, InitialStart, LastHitLocation, WaterHitLoc);
	}
	Weapon.bTraceWater = false;
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
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x28B
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
	// End:0x2D7
	if(bFireOnRelease)
	{
		// End:0x2B9
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
		NextFireTime += (FireRate * (float(1) + FMax(0.0000000, BW.MeleeFatigue - 0.1500000)));
		NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
	}
	// End:0x360
	if(!BW.bBerserk)
	{
		BW.MeleeFatigue = FMin(BW.MeleeFatigue + FatiguePerStrike, 1.0000000);
	}
	load = float(AmmoPerFire);
	HoldTime = 0.0000000;
	// End:0x3BD
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x437
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
		// End:0x437
		if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
		{
			BW.bNeedCock = true;
		}
	}
	BW.SetDefaultGunLength();
	// End:0x487
	if((BW.SprintControl != none) && BW.SprintControl.bSprinting)
	{
		BW.PlayerSprint(true);
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
	CheckClipFinished();
	// End:0xD2
	if((FireCount > 0) && Weapon.HasAnim(FireLoopAnim))
	{
		BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate / (float(1) + (BW.MeleeFatigue * 0.7500000)), 0.0000000,, "FIRE");		
	}
	else
	{
		BW.SafePlayAnim(FireAnim, FireAnimRate / (float(1) + (BW.MeleeFatigue * 0.7500000)), TweenTime,, "FIRE");
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
	// End:0x8E
	if((FireCount > 0) && Weapon.HasAnim(FireLoopAnim))
	{
		BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate / (float(1) + (BW.MeleeFatigue * 0.7500000)), 0.0000000,, "FIRE");		
	}
	else
	{
		BW.SafePlayAnim(FireAnim, FireAnimRate / (float(1) + (BW.MeleeFatigue * 0.7500000)), TweenTime,, "FIRE");
	}
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0x148
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	CheckClipFinished();
	//return;	
}

simulated event ModeHoldFire()
{
	BW.SetMeleeGunLength();
	// End:0x50
	if((BW.SprintControl != none) && BW.SprintControl.bSprinting)
	{
		BW.PlayerSprint(false);
	}
	//return;	
}

defaultproperties
{
	SwipePoints[0]=(Weight=3,offset=(Pitch=0,Yaw=2560,Roll=0))
	SwipePoints[1]=(Weight=5,offset=(Pitch=0,Yaw=1280,Roll=0))
	SwipePoints[2]=(Weight=6,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[3]=(Weight=4,offset=(Pitch=0,Yaw=-1280,Roll=0))
	SwipePoints[4]=(Weight=2,offset=(Pitch=0,Yaw=-2560,Roll=0))
	WallHitPoint=2
	NumSwipePoints=5
	TraceExtent=(X=0.0000000,Y=15.0000000,Z=15.0000000)
	MaxBonusHoldTime=1.5000000
	FlankDamageMult=1.1500000
	BackDamageMult=1.3000000
	ChargeDamageBonusFactor=1.0000000
	bCanBackstab=true
	TraceRange=(Min=145.0000000,Max=145.0000000)
	Damage=50.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	PDamageFactor=0.5000000
	RunningSpeedThresh=1000.0000000
	bNoPositionalDamage=true
	TweenTime=0.1000000
	FireRate=0.8000000
}
