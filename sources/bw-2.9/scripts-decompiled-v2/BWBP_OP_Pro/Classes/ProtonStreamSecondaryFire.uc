class ProtonStreamSecondaryFire extends BallisticProInstantFire;

var Actor LockedTarget;
var ProtonStreamer PS;
var int SuccessiveHits;
var Actor BoostMuzzleFlash;
var Class<BallisticEmitter> BoostMuzzleFlashClass;
var bool bNoAmmoConsumption;

simulated function SwitchWeaponMode(byte newmode)
{
	// End:0x17
	if(int(newmode) == 1)
	{
		GotoState('PowerAmp');		
	}
	else
	{
		GotoState('None');
	}
	//return;	
}

function StreamDoDamage(Actor Other, Vector HitLocation, Vector TraceStart, Vector Dir)
{
	local float Dmg;
	local Class<DamageType> HitDT;
	local Actor Victim;
	local bool bWasAlive;

	// End:0xE7
	if((((Pawn(Other) != none) && Pawn(Other).Controller != none) && Pawn(Other).Controller.SameTeamAs(Instigator.Controller)) || (DestroyableObjective(Other) != none) && int(DestroyableObjective(Other).DefenderTeamIndex) == Instigator.GetTeamNum())
	{
		// End:0xE4
		if(int(Instigator.Controller.bFire) == 0)
		{
			LockedTarget = Other;
			ProtonStreamAttachment(Weapon.ThirdPersonActor).SetLockedTarget(Other);
		}		
	}
	else
	{
		// End:0x195
		if((DestroyableObjective(Other.Owner) != none) && int(DestroyableObjective(Other.Owner).DefenderTeamIndex) == Instigator.GetTeamNum())
		{
			// End:0x192
			if(int(Instigator.Controller.bFire) == 0)
			{
				LockedTarget = Other.Owner;
				ProtonStreamAttachment(Weapon.ThirdPersonActor).SetLockedTarget(Other.Owner);
			}			
		}
		else
		{
			Dmg = GetDamage(Other, HitLocation, TraceStart, Dir, Victim, HitDT);
			// End:0x224
			if((xPawn(Victim) != none) && Pawn(Victim).Health > 0)
			{
				// End:0x221
				if((Monster(Victim) == none) || Pawn(Victim).default.Health > 275)
				{
					bWasAlive = true;
				}				
			}
			else
			{
				// End:0x27B
				if(((Vehicle(Victim) != none) && Vehicle(Victim).Driver != none) && Vehicle(Victim).Driver.Health > 0)
				{
					bWasAlive = true;
				}
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, 0.0000000, Instigator, HitLocation, float(10000) * Dir, HitDT);
		}
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
	// End:0x2B2
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		DoFireEffect();
		// End:0x1CF
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x20B
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
		// End:0x2B2
		if((BallisticTurret(Weapon.Owner) == none) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo) != none)
		{
			Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo).AddFireStat(int(load), int(BW.InventoryGroup));
		}
	}
	// End:0x2F8
	if(!bNoAmmoConsumption)
	{
		ConsumedLoad += int(FMin(float(Weapon.AmmoAmount(0)), load));
		SetTimer(FMin(0.1000000, FireRate / float(2)), false);
	}
	// End:0x320
	if(!BW.bScopeView)
	{
		BW.AddFireChaos(FireChaos);
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x36A
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
	// End:0x3B6
	if(bFireOnRelease)
	{
		// End:0x398
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
		// End:0x44C
		if(bBurstMode)
		{
			BurstCount++;
			// End:0x41B
			if(BurstCount >= MaxBurst)
			{
				NextFireTime += (FireRate * (float(1) + (float(MaxBurst) * 0.2500000)));
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
				BurstCount = 0;				
			}
			else
			{
				NextFireTime += (FireRate * 0.7500000);
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
			}			
		}
		else
		{
			NextFireTime += FireRate;
			NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
		}
	}
	load = float(AmmoPerFire);
	HoldTime = 0.0000000;
	// End:0x4F8
	if(((BallisticHandgun(Weapon) != none) && BallisticHandgun(Weapon).OtherGun != none) && BallisticHandgun(Weapon).CanSynch(byte(ThisModeNum)))
	{
		BallisticHandgun(BW).OtherGun.ForceFire(ThisModeNum);
	}
	// End:0x53D
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x5B7
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
		// End:0x5B7
		if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
		{
			BW.bNeedCock = true;
		}
	}
	bNoAmmoConsumption = false;
	//return;	
}

simulated function bool StreamAllowFire()
{
	// End:0x0D
	if(!CheckReloading())
	{
		return false;
	}
	// End:0x70
	if((BW.AmmoAmount(0) - 1) < AmmoPerFire)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), 0.0000000);
		BW.EmptyFire(byte(ThisModeNum));
		return false;		
	}
	else
	{
		// End:0x84
		if(BW.bNeedReload)
		{
			return false;
		}
	}
	return true;
	//return;	
}

function bool MaintainConnection(Vector AimVec)
{
	local Pawn P;

	// End:0xA8
	if(((int(Instigator.Controller.bFire) == 1) || (AimVec Dot Normal(LockedTarget.Location - Instigator.Location)) < 0.9000000) || !Weapon.FastTrace(LockedTarget.Location, Instigator.Location))
	{
		LockedTarget = none;
		ProtonStreamAttachment(Weapon.ThirdPersonActor).SetLockedTarget(none);
		return false;
	}
	P = Pawn(LockedTarget);
	// End:0x1C0
	if((P != none) && P.bProjTarget)
	{
		// End:0x104
		if(float(P.Health) >= P.SuperHealthMax)
		{
			bNoAmmoConsumption = true;
			return true;
		}
		// End:0x14C
		if(BallisticPawn(P) != none)
		{
			BallisticPawn(LockedTarget).GiveAttributedHealth(int(Damage), int(Pawn(LockedTarget).HealthMax), Instigator);			
		}
		else
		{
			// End:0x18D
			if(Vehicle(LockedTarget) != none)
			{
				Vehicle(LockedTarget).HealDamage(int(Damage), Instigator.Controller, DamageType);				
			}
			else
			{
				Pawn(LockedTarget).GiveHealth(int(Damage), int(Pawn(LockedTarget).HealthMax));
			}
		}		
	}
	else
	{
		DestroyableObjective(LockedTarget).HealDamage(int(Damage * float(3)), Instigator.Controller, DamageType);
	}
	return true;
	//return;	
}

function DoFireEffect()
{
	local Vector StartTrace;
	local Rotator Aim;

	Aim = GetFireAim(StartTrace);
	Aim = Rotator((GetFireSpread()) >> Aim);
	// End:0x56
	if((LockedTarget == none) || !MaintainConnection(Vector(Aim)))
	{
		DoTrace(StartTrace, Aim);
	}
	// End:0xB4
	if(ProtonStreamAttachment(Weapon.ThirdPersonActor).StreamEffect == none)
	{
		ProtonStreamAttachment(Weapon.ThirdPersonActor).bUseAlt = true;
		ProtonStreamAttachment(Weapon.ThirdPersonActor).StartStream();
	}
	ApplyRecoil();
	//return;	
}

simulated function StopFiring()
{
	super(BallisticFire).StopFiring();
	LockedTarget = none;
	// End:0x43
	if(int(Instigator.Role) == int(ROLE_Authority))
	{
		ProtonStreamAttachment(Weapon.ThirdPersonActor).EndStream();
	}
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x65
	if(!StreamAllowFire())
	{
		// End:0x63
		if((int(Instigator.Role) == int(ROLE_Authority)) && ProtonStreamAttachment(Weapon.ThirdPersonActor).bStreamOn)
		{
			ProtonStreamAttachment(Weapon.ThirdPersonActor).EndStream();
		}
		return false;
	}
	return true;
	//return;	
}

function float MaxRange()
{
	return 1500.0000000;
	//return;	
}

function DoTrace(Vector InitialStart, Rotator Dir)
{
	local Vector End, X, HitLocation, HitNormal, Start, LastHitLoc;

	local Material HitMaterial;
	local float dist;
	local Actor Other, LastOther;
	local bool bHitWall;

	dist = MaxRange();
	Start = InitialStart;
	X = Normal(Vector(Dir));
	End = Start + (X * dist);
	LastHitLoc = End;
	Weapon.bTraceWater = true;
	J0x5B:

	// End:0x2CE [Loop If]
	if(dist > float(0))
	{
		Other = Trace(HitLocation, HitNormal, End, Start, true,, HitMaterial);
		Weapon.bTraceWater = false;
		dist -= VSize(HitLocation - Start);
		// End:0x100
		if((int(Level.NetMode) == int(NM_Client)) && (int(Other.Role) != int(ROLE_Authority)) || Other.bWorldGeometry)
		{
			// [Explicit Break]
			goto J0x2CE;
		}
		// End:0x2B6
		if(Other != none)
		{
			// End:0x171
			if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
			{
				bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other);
				SuccessiveHits = 0;
				// [Explicit Break]
				goto J0x2CE;
			}
			LastHitLoc = HitLocation;
			// End:0x25A
			if(!Other.bWorldGeometry && Other != LastOther)
			{
				StreamDoDamage(Other, HitLocation, InitialStart, X);
				SuccessiveHits++;
				// End:0x1F6
				if(Vehicle(Other) != none)
				{
					bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other);					
				}
				else
				{
					// End:0x25A
					if(Mover(Other) == none)
					{
						bHitWall = true;
						// End:0x241
						if(HitMaterial != none)
						{
							SendFireEffect(Other, HitLocation, HitNormal, int(HitMaterial.SurfaceType));							
						}
						else
						{
							SendFireEffect(Other, HitLocation, HitNormal, 0);
						}
						// [Explicit Break]
						goto J0x2CE;
					}
				}
			}
			// End:0x2A9
			if(Other.bWorldGeometry || Mover(Other) != none)
			{
				bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other);
				SuccessiveHits = 0;
				// [Explicit Break]
				goto J0x2CE;
			}
			SuccessiveHits = 0;
			// [Explicit Break]
			goto J0x2CE;			
		}
		else
		{
			LastHitLoc = End;
			SuccessiveHits = 0;
			// [Explicit Break]
			goto J0x2CE;
		}
		// [Loop Continue]
		goto J0x5B;
	}
	J0x2CE:

	// End:0x2EE
	if(!bHitWall)
	{
		NoHitEffect(X, InitialStart, LastHitLoc);
	}
	//return;	
}

function InitEffects()
{
	// End:0x1B
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x7F
	if((MuzzleFlashClass != none) && (MuzzleFlash == none) || MuzzleFlash.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	}
	Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(BoostMuzzleFlash, BoostMuzzleFlashClass, Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	//return;	
}

state PowerAmp
{
	function StreamDoDamage(Actor Other, Vector HitLocation, Vector TraceStart, Vector Dir)
	{
		// End:0xC5
		if(((Pawn(Other) != none) && Pawn(Other).Controller != none) && Pawn(Other).Controller.SameTeamAs(Instigator.Controller))
		{
			// End:0xC5
			if(int(Instigator.Controller.bFire) == 0)
			{
				LockedTarget = Other;
				ProtonStreamer(BW).BoostTarget = Pawn(Other);
				ProtonStreamAttachment(Weapon.ThirdPersonActor).SetLockedTarget(Other);
			}
		}
		//return;		
	}

	function DoFireEffect()
	{
		local Vector StartTrace;
		local Rotator Aim;

		Aim = GetFireAim(StartTrace);
		Aim = Rotator((GetFireSpread()) >> Aim);
		// End:0x56
		if((LockedTarget == none) || !MaintainConnection(Vector(Aim)))
		{
			DoTrace(StartTrace, Aim);
		}
		// End:0xB4
		if(ProtonStreamAttachment(Weapon.ThirdPersonActor).StreamEffect == none)
		{
			ProtonStreamAttachment(Weapon.ThirdPersonActor).bUseAlt = true;
			ProtonStreamAttachment(Weapon.ThirdPersonActor).StartStream();
		}
		ApplyRecoil();
		//return;		
	}

	function bool MaintainConnection(Vector AimVec)
	{
		// End:0xBD
		if(((int(Instigator.Controller.bFire) == 1) || (AimVec Dot Normal(LockedTarget.Location - Instigator.Location)) < 0.9000000) || !Weapon.FastTrace(LockedTarget.Location, Instigator.Location))
		{
			LockedTarget = none;
			ProtonStreamer(BW).BoostTarget = none;
			ProtonStreamAttachment(Weapon.ThirdPersonActor).SetLockedTarget(none);
			return false;
		}
		return true;
		//return;		
	}

	simulated function StopFiring()
	{
		super(BallisticFire).StopFiring();
		LockedTarget = none;
		ProtonStreamer(BW).BoostTarget = none;
		// End:0x58
		if(int(Instigator.Role) == int(ROLE_Authority))
		{
			ProtonStreamAttachment(Weapon.ThirdPersonActor).EndStream();
		}
		//return;		
	}

	function FlashMuzzleFlash()
	{
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
		// End:0x98
		if(BoostMuzzleFlash != none)
		{
			BoostMuzzleFlash.Trigger(Weapon, Instigator);
		}
		// End:0xA9
		if(!bBrassOnCock)
		{
			EjectBrass();
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	BoostMuzzleFlashClass=Class'BWBP_OP_Pro.ProtonFlashEmitterBoost'
	MaxWaterTraceRange=5000.0000000
	Damage=2.0000000
	DamageType=Class'BWBP_OP_Pro.DTProtonStreamer'
	MuzzleFlashClass=Class'BWBP_OP_Pro.ProtonFlashEmitterAlt'
	FireRecoil=1.0000000
	FireChaos=0.0000000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1600000,OutVal=0.0000000),(InVal=0.2500000,OutVal=1.5000000),(InVal=0.5000000,OutVal=2.2500000),(InVal=0.7500000,OutVal=3.5000000),(InVal=1.0000000,OutVal=5.0000000)))
	bPawnRapidFireAnim=true
	FireAnim="FireLoop"
	FireRate=0.1000000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_ProtonCharge'
	ShakeRotMag=(X=32.0000000,Y=8.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.5000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	WarnTargetPct=0.2000000
}
