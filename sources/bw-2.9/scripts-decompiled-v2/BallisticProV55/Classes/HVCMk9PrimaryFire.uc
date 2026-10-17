class HVCMk9PrimaryFire extends BallisticProInstantFire;

struct ZappedTarget
{
	var() Pawn Vic;
	var() float Zaps;
};

struct ZapLure
{
	var() Vector loc;
	var() float Zaps;
};

var() bool bDoOverCharge;
var Sound FireSoundLoop;
var bool bPendingOwnerZap;
var bool bZapping;
var bool bSoundActive;
var float NextMessageTime;
var int SuccessiveHits;
var() Sound FireSound2;
var bool bIsZapping;
var float PendingZapDamage;
var array<ZappedTarget> OldTargets;
var array<ZapLure> OldLures;

simulated state DirectFire
{
	simulated function bool AllowFire()
	{
		// End:0x9C
		if(((HVCMk9LightningGun(Weapon).HeatLevel >= float(10)) || HVCMk9LightningGun(Weapon).bIsVenting) || !super(BallisticFire).AllowFire())
		{
			// End:0x9A
			if((int(Instigator.Role) == int(ROLE_Authority)) && HVCMk9Attachment(Weapon.ThirdPersonActor).bStreamOn)
			{
				HVCMk9Attachment(Weapon.ThirdPersonActor).EndStream();
			}
			return false;
		}
		return true;
		//return;		
	}

	function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, float(Min(Damage + (SuccessiveHits * 5), 30)), Instigator, HitLocation, MomentumDir, DamageType);
		//return;		
	}

	function DoFireEffect()
	{
		local Vector StartTrace;
		local Rotator Aim;

		Aim = GetFireAim(StartTrace);
		Aim = Rotator((GetFireSpread()) >> Aim);
		// End:0x4F
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			BW.RewindCollisions();
		}
		DoTrace(StartTrace, Aim);
		// End:0x87
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			BW.RestoreCollisions();
		}
		// End:0xC6
		if(HVCMk9Attachment(Weapon.ThirdPersonActor).StreamEffect == none)
		{
			HVCMk9Attachment(Weapon.ThirdPersonActor).StartStream();
		}
		ApplyRecoil();
		//return;		
	}

	event Timer()
	{
		super(BallisticFire).Timer();
		// End:0x85
		if(bPendingOwnerZap)
		{
			bPendingOwnerZap = false;
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 50.0000000, Instigator, Instigator.Location + (Vector(Instigator.GetViewRotation()) * Instigator.CollisionRadius), float(KickForce) * Vector(Instigator.GetViewRotation()), Class'BallisticProV55.DT_HVCOverheat');
		}
		//return;		
	}

	function DoTrace(Vector Start, Rotator Dir)
	{
		local Actor Victims;
		local Vector X;
		local float F;

		// End:0x1D
		if(!bDoOverCharge)
		{
			OldDoTrace(Start, Dir);
			return;
		}
		X = Vector(Dir);
		SendFireEffect(Level, Start + (X * float(64)), -X, 0);
		// End:0x143
		foreach Instigator.VisibleCollidingActors(Class'Engine.Actor', Victims, 192.0000000, Start + (X * float(64)))
		{
			// End:0x142
			if((!Victims.IsA('FluidSurfaceInfo') && !Victims.bWorldGeometry) && Victims.bCanBeDamaged)
			{
				// End:0xE5
				if(Victims == Instigator)
				{
					bPendingOwnerZap = true;
					SetTimer(0.1500000, false);
					// End:0x142
					continue;
				}
				Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, 50.0000000, Instigator, Victims.Location - (X * Victims.CollisionRadius), (F * float(KickForce)) * X, Class'BallisticProV55.DT_HVCOverheat');
			}			
		}		
		//return;		
	}

	function OldDoTrace(Vector InitialStart, Rotator Dir)
	{
		local Vector End, X, HitLocation, Start, HitNormal, LastHitLoc;

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

		// End:0x2D1 [Loop If]
		if(dist > float(0))
		{
			Other = Trace(HitLocation, HitNormal, End, Start, true,, HitMaterial);
			Weapon.bTraceWater = false;
			dist -= VSize(HitLocation - Start);
			// End:0x100
			if((int(Level.NetMode) == int(NM_Client)) && (int(Other.Role) != int(ROLE_Authority)) || Other.bWorldGeometry)
			{
				// [Explicit Break]
				goto J0x2D1;
			}
			// End:0x2B9
			if(Other != none)
			{
				// End:0x171
				if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
				{
					bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other);
					SuccessiveHits = 0;
					// [Explicit Break]
					goto J0x2D1;
				}
				LastHitLoc = HitLocation;
				// End:0x25D
				if(!Other.bWorldGeometry && Other != LastOther)
				{
					OnTraceHit(Other, HitLocation, InitialStart, X, 0, 0, 0);
					SuccessiveHits++;
					// End:0x1F9
					if(Vehicle(Other) != none)
					{
						bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other);						
					}
					else
					{
						// End:0x25D
						if(Mover(Other) == none)
						{
							bHitWall = true;
							// End:0x244
							if(HitMaterial != none)
							{
								SendFireEffect(Other, HitLocation, HitNormal, int(HitMaterial.SurfaceType));								
							}
							else
							{
								SendFireEffect(Other, HitLocation, HitNormal, 0);
							}
							// [Explicit Break]
							goto J0x2D1;
						}
					}
				}
				// End:0x2AC
				if(Other.bWorldGeometry || Mover(Other) != none)
				{
					bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other);
					SuccessiveHits = 0;
					// [Explicit Break]
					goto J0x2D1;
				}
				SuccessiveHits = 0;
				// [Explicit Break]
				goto J0x2D1;				
			}
			else
			{
				LastHitLoc = End;
				SuccessiveHits = 0;
				// [Explicit Break]
				goto J0x2D1;
			}
			// [Loop Continue]
			goto J0x5B;
		}
		J0x2D1:

		// End:0x2F1
		if(!bHitWall)
		{
			NoHitEffect(X, InitialStart, LastHitLoc);
		}
		//return;		
	}

	function PlayFiring()
	{
		// End:0x59
		if(!bSoundActive)
		{
			// End:0x2A
			if(FireSoundLoop != none)
			{
				Instigator.AmbientSound = FireSoundLoop;
			}
			Instigator.SoundRadius = 512.0000000;
			Instigator.SoundVolume = byte(255);
			bSoundActive = true;
		}
		// End:0x92
		if(Weapon.HasAnim(FireLoopAnim))
		{
			BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");
		}
		ClientPlayForceFeedback(FireForce);
		FireCount++;
		// End:0xD6
		if(int(Level.NetMode) == int(NM_Client))
		{
			HVCMk9LightningGun(BW).AddHeat(0.3000000);
		}
		// End:0x17E
		if(((int(Level.NetMode) != int(NM_Client)) && !bDoOverCharge) && HVCMk9LightningGun(Weapon).HeatLevel > float(10))
		{
			bDoOverCharge = true;
			Weapon.PlaySound(HVCMk9LightningGun(Weapon).OverheatSound, 0, 0.7000000,, 64.0000000, 1.0000000, true);
			HVCMk9LightningGun(Weapon).ClientOverCharge();
			Weapon.ServerStopFire(byte(ThisModeNum));
		}
		CheckClipFinished();
		//return;		
	}

	function ServerPlayFiring()
	{
		// End:0x59
		if(!bSoundActive)
		{
			// End:0x2A
			if(FireSoundLoop != none)
			{
				Instigator.AmbientSound = FireSoundLoop;
			}
			Instigator.SoundRadius = 512.0000000;
			Instigator.SoundVolume = byte(255);
			bSoundActive = true;
		}
		// End:0x101
		if(((int(Weapon.Role) == int(ROLE_Authority)) && !bDoOverCharge) && HVCMk9LightningGun(Weapon).HeatLevel > float(10))
		{
			bDoOverCharge = true;
			Weapon.PlaySound(HVCMk9LightningGun(Weapon).OverheatSound, 0, 0.7000000,, 64.0000000, 1.0000000, true);
			HVCMk9LightningGun(Weapon).ClientOverCharge();
			Weapon.ServerStopFire(byte(ThisModeNum));
		}
		// End:0x13A
		if(Weapon.HasAnim(FireLoopAnim))
		{
			BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");
		}
		ClientPlayForceFeedback(FireForce);
		FireCount++;
		CheckClipFinished();
		//return;		
	}

	function StopFiring()
	{
		super(BallisticFire).StopFiring();
		// End:0x3C
		if(int(Instigator.Role) == int(ROLE_Authority))
		{
			HVCMk9Attachment(Weapon.ThirdPersonActor).EndStream();
		}
		// End:0x59
		if(bDoOverCharge)
		{
			NextFireTime += 2.0000000;
			bDoOverCharge = false;
		}
		bZapping = false;
		bSoundActive = false;
		Instigator.AmbientSound = none;
		Instigator.SoundVolume = Weapon.default.SoundVolume;
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
		// End:0x2E6
		if(int(Weapon.Role) == int(ROLE_Authority))
		{
			DoFireEffect();
			HVCMk9LightningGun(Weapon).AddHeat(0.1500000);
			// End:0x20F
			if((Instigator == none) || Instigator.Controller == none)
			{
				return;
			}
			// End:0x24B
			if(AIController(Instigator.Controller) != none)
			{
				AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
			}
			Instigator.DeactivateSpawnProtection();
			// End:0x2E3
			if((BallisticTurret(Weapon.Owner) == none) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo) != none)
			{
				Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo).AddFireStat(int(load), 1);
			}			
		}
		else
		{
			// End:0x300
			if(!BW.bScopeView)
			{
				ApplyRecoil();
			}
		}
		BW.LastFireTime = Level.TimeSeconds;
		// End:0x34A
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
		// End:0x396
		if(bFireOnRelease)
		{
			// End:0x378
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
		// End:0x41A
		if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
		{
			bIsFiring = false;
			Weapon.PutDown();
		}
		// End:0x494
		if(BW != none)
		{
			BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
			// End:0x494
			if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
			{
				BW.bNeedCock = true;
			}
		}
		//return;		
	}
	stop;	
}

simulated state BranchingFire
{
	function float MaxRange()
	{
		return 1200.0000000;
		//return;		
	}

	simulated event ModeDoFire()
	{
		// End:0x0D
		if(!AllowFire())
		{
			return;
		}
		BW.FireCount++;
		// End:0xD1
		if(int(Weapon.Role) == int(ROLE_Authority))
		{
			ConsumedLoad += int(load);
			SetTimer(FMin(0.1000000, FireRate / float(2)), false);
			DoFireEffect();
			// End:0x86
			if((Instigator == none) || Instigator.Controller == none)
			{
				return;
			}
			// End:0xC2
			if(AIController(Instigator.Controller) != none)
			{
				AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
			}
			Instigator.DeactivateSpawnProtection();
		}
		// End:0xFE
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
		// End:0x188
		if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
		{
			bIsFiring = false;
			Weapon.PutDown();
		}
		//return;		
	}

	event Timer()
	{
		super(BallisticFire).Timer();
		// End:0x22
		if(bIsZapping && !IsFiring())
		{
			StopLightning();
		}
		// End:0x71
		if(bPendingOwnerZap)
		{
			bPendingOwnerZap = false;
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, PendingZapDamage, Instigator, Instigator.Location, vect(0.0000000, 0.0000000, 5000.0000000), Class'BallisticProV55.DT_HVCFisher');
		}
		//return;		
	}

	simulated function Vector GetFireSpread()
	{
		local float fX;
		local Rotator R;

		fX = FRand();
		R.Yaw = int((XInaccuracy * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
		R.Pitch = int((YInaccuracy * Sin(((FRand() * 1.5000000) - 0.5000000) * 1.5707960)) * Cos(fX * 1.5707960));
		return Vector(R);
		//return;		
	}

	function DoFireEffect()
	{
		local Actor Victims, t;
		local Vector Dir, ForceDir, HitLoc, HitNorm, AimDir, Start;

		local Rotator Aim;
		local array<Actor> Targets;
		local float dist, AmmoFactor, TotalWallZaps, Dmg, TotalPlayerZaps, ZapFactor;

		local Class<DamageType> dt;
		local int i;
		local array<int> Lures, TargIndexes;
		local array<Vector> Vecs;

		// End:0x219
		if(Instigator.PhysicsVolume.bWaterVolume)
		{
			NextFireTime += 2.0000000;
			AmmoFactor = FMin(1.0000000, float(Weapon.AmmoAmount(0)) / 100.0000000);
			HVCMk9LightningGun(Weapon).AddHeat(2.0000000);
			// End:0x9A
			if(Weapon.AmmoAmount(0) > 5)
			{
				HVCMk9Attachment(Weapon.ThirdPersonActor).DoWaterDischarge();
			}
			ConsumedLoad = 100;
			// End:0x1E6
			foreach Instigator.PhysicsVolume.TouchingActors(Class'Engine.Actor', Victims)
			{
				// End:0x1E5
				if(Victims.bCanBeDamaged && !Victims.bStatic)
				{
					Dir = Victims.Location - Instigator.Location;
					dist = VSize(Dir);
					Dir = Normal(Dir);
					// End:0x1E5
					if(dist <= float(2000))
					{
						// End:0x172
						if(Victims == Instigator)
						{
							PendingZapDamage = AmmoFactor * float(250);
							bPendingOwnerZap = true;
							SetTimer(0.2000000, false);
							// End:0x1E5
							continue;
						}
						Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, (AmmoFactor * float(250)) * FMax(0.0400000, 1.0000000 - (dist / float(2000))), Instigator, Victims.Location + (Dir * float(-24)), Dir * float(20000), Class'BallisticProV55.DT_HVCFisher');
					}
				}				
			}			
			// End:0x217
			if(!bPendingOwnerZap)
			{
				PendingZapDamage = AmmoFactor * float(250);
				bPendingOwnerZap = true;
				SetTimer(0.2000000, false);
			}
			return;
		}
		HVCMk9LightningGun(Weapon).AddHeat(0.1500000);
		bIsZapping = true;
		// End:0x26A
		if(((Instigator == none) || Weapon == none) || Instigator.Health < 1)
		{
			return;
		}
		Start = Instigator.Location + Instigator.EyePosition();
		Aim = GetFireAim(Start);
		AimDir = Vector(Aim);
		i = 0;
		J0x2B4:

		// End:0x3AD [Loop If]
		if(i < OldLures.Length)
		{
			// End:0x3A3
			if(Weapon.FastTrace(OldLures[i].loc, Instigator.Location) && (Normal(OldLures[i].loc - Instigator.Location) Dot AimDir) > 0.7500000)
			{
				dist = VSize(OldLures[i].loc - Instigator.Location);
				// End:0x3A3
				if(dist < float(900))
				{
					Lures[Lures.Length] = i;
					TotalWallZaps += ((OldLures[i].Zaps * float(2)) * (float(1) - (dist / float(900))));
				}
			}
			i++;
			// [Loop Continue]
			goto J0x2B4;
		}
		// End:0x52F
		if(Lures.Length > 1)
		{
			i = 0;
			J0x3C0:

			// End:0x52C [Loop If]
			if(i < OldTargets.Length)
			{
				// End:0x522
				if((((OldTargets[i].Vic != none) && OldTargets[i].Zaps > (TotalWallZaps / float(4))) && !OldTargets[i].Vic.HeadVolume.bWaterVolume) && (Normal(OldTargets[i].Vic.Location - Instigator.Location) Dot AimDir) > 0.7500000)
				{
					dist = VSize(OldTargets[i].Vic.Location - Instigator.Location);
					// End:0x4B5
					if(dist > float(950))
					{
						// [Explicit Continue]
						goto J0x522;
					}
					Targets[Targets.Length] = OldTargets[i].Vic;
					TargIndexes[TargIndexes.Length] = i;
					TotalPlayerZaps += (OldTargets[i].Zaps + (OldTargets[i].Zaps * (float(1) - (dist / float(950)))));
				}
				J0x522:

				i++;
				// [Loop Continue]
				goto J0x3C0;
			}			
		}
		else
		{
			// End:0x7CD
			foreach Instigator.VisibleCollidingActors(Class'Engine.Actor', Victims, 950.0000000, Instigator.Location)
			{
				// End:0x7CC
				if((((((((Victims != Instigator) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && !Victims.bWorldGeometry) && Victims.bProjTarget) && !Victims.bStatic) && Projectile(Victims) == none) && !Victims.PhysicsVolume.bWaterVolume || (Pawn(Victims) != none) && !Pawn(Victims).HeadVolume.bWaterVolume)
				{
					Dir = Normal(Victims.Location - Instigator.Location);
					// End:0x7CC
					if((Dir Dot AimDir) > 0.7500000)
					{
						Targets[Targets.Length] = Victims;
						// End:0x7AE
						if(Pawn(Victims) != none)
						{
							i = 0;
							J0x6A9:

							// End:0x756 [Loop If]
							if(i < OldTargets.Length)
							{
								// End:0x74C
								if(OldTargets[i].Vic == Victims)
								{
									dist = VSize(Victims.Location - Instigator.Location);
									TotalPlayerZaps += (OldTargets[i].Zaps + (OldTargets[i].Zaps * (float(1) - (dist / float(950)))));
									TargIndexes[TargIndexes.Length] = i;
									// [Explicit Break]
									goto J0x756;
								}
								i++;
								// [Loop Continue]
								goto J0x6A9;
							}
							J0x756:

							// End:0x7AB
							if(i >= OldTargets.Length)
							{
								OldTargets.Length = OldTargets.Length + 1;
								OldTargets[OldTargets.Length - 1].Vic = Pawn(Victims);
								TargIndexes[TargIndexes.Length] = OldTargets.Length - 1;
							}
							// End:0x7CC
							continue;
						}
						TotalPlayerZaps += 0.8000000;
						TargIndexes[TargIndexes.Length] = -1;
					}
				}				
			}			
		}
		// End:0x8BF
		if(((TotalPlayerZaps < 5.0000000) && Lures.Length < 3) && FRand() > 0.6500000)
		{
			t = Trace(HitLoc, HitNorm, Instigator.Location + (((GetFireSpread()) >> Aim) * float(800)), Instigator.Location, true);
			// End:0x8BF
			if((t != none) && t.bWorldGeometry)
			{
				OldLures.Length = OldLures.Length + 1;
				OldLures[OldLures.Length - 1].loc = HitLoc;
				OldLures[OldLures.Length - 1].Zaps = 1.0000000;
				Lures[Lures.Length] = OldLures.Length - 1;
			}
		}
		TotalWallZaps = 0.0000000;
		i = 0;
		J0x8D1:

		// End:0x948 [Loop If]
		if(i < Lures.Length)
		{
			OldLures[Lures[i]].Zaps += 0.3000000;
			Vecs[Vecs.Length] = OldLures[Lures[i]].loc;
			TotalWallZaps += OldLures[Lures[i]].Zaps;
			i++;
			// [Loop Continue]
			goto J0x8D1;
		}
		i = 0;
		J0x94F:

		// End:0xCA0 [Loop If]
		if(i < Targets.Length)
		{
			Dmg = Damage + float(Rand(4));
			// End:0xA62
			if(TargIndexes[i] > -1)
			{
				dist = VSize(Targets[i].Location - Instigator.Location);
				// End:0xA1A
				if(TotalWallZaps > float(0))
				{
					ZapFactor = FMin(1.0000000, (OldTargets[TargIndexes[i]].Zaps + (OldTargets[TargIndexes[i]].Zaps * (float(1) - (dist / float(900))))) / TotalWallZaps);					
				}
				else
				{
					ZapFactor = 1.0000000;
				}
				// End:0xA56
				if(Lures.Length < 3)
				{
					OldTargets[TargIndexes[i]].Zaps += (0.5000000 * ZapFactor);
				}
				Dmg *= ZapFactor;
			}
			Dir = Normal(Targets[i].Location - Instigator.Location);
			// End:0xC96
			if((Dir Dot AimDir) > 0.7500000)
			{
				ForceDir = (Instigator.Location + (AimDir * float(650 + Rand(100)))) - Targets[i].Location;
				// End:0xB28
				if((TargIndexes[i] > -1) && OldTargets[TargIndexes[i]].Zaps >= float(25))
				{
					dt = Class'BallisticProV55.DT_HVCBurstLightning';					
				}
				else
				{
					dt = Class'BallisticProV55.DT_HVCLightning';
				}
				// End:0xB95
				if(int(Instigator.Physics) == int(2))
				{
					Instigator.Velocity -= ((Normal(Targets[i].Location - Instigator.Location) * float(20)) + (VRand() * float(15)));					
				}
				else
				{
					Instigator.Velocity -= ((Normal(Targets[i].Location - Instigator.Location) * float(80)) + (VRand() * float(60)));
				}
				Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Targets[i], Dmg, Instigator, Targets[i].Location + (Dir * float(-24)), (float(40000) * FMax(0.1000000, 1.0000000 - (VSize(ForceDir) / float(2000)))) * Normal(ForceDir), dt);
				// End:0xC96
				if(int(Targets[i].RemoteRole) == int(ROLE_None))
				{
					Targets.Remove(i, 1);
					TargIndexes.Remove(i, 1);
					i--;
				}
			}
			i++;
			// [Loop Continue]
			goto J0x94F;
		}
		// End:0xCDB
		if((Targets.Length > 0) || Lures.Length > 0)
		{
			HVCMk9LightningGun(Weapon).SetTargetZap(Targets, Vecs);			
		}
		else
		{
			HVCMk9LightningGun(Weapon).SetFreeZap();
		}
		//return;		
	}

	simulated function bool AllowFire()
	{
		// End:0x88
		if(((HVCMk9LightningGun(Weapon).HeatLevel >= float(10)) || HVCMk9LightningGun(Weapon).bIsVenting) || !super(BallisticFire).AllowFire())
		{
			// End:0x86
			if(bIsZapping)
			{
				Weapon.PlayOwnedSound(HVCMk9LightningGun(Weapon).OverheatSound, 0, 0.7000000,, 64.0000000, 1.0000000, true);
				PlayFireEnd();
			}
			return false;
		}
		return true;
		//return;		
	}

	function ServerPlayFiring()
	{
		// End:0x0D
		if(!IsFiring())
		{
			return;
		}
		// End:0x8C
		if(BW.FireCount < 2)
		{
			// End:0x89
			if(BallisticFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}			
		}
		else
		{
			// End:0x10C
			if(BW.FireCount == Max(2, int(Level.TimeDilation * 5.0000000)))
			{
				Weapon.PlayOwnedSound(FireSound2, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}
		}
		// End:0x13E
		if(FireSoundLoop != none)
		{
			Instigator.AmbientSound = FireSoundLoop;
			Instigator.SoundVolume = byte(255);
		}
		//return;		
	}

	function PlayFiring()
	{
		// End:0x0D
		if(!IsFiring())
		{
			return;
		}
		// End:0x7B
		if(Instigator.PhysicsVolume.bWaterVolume)
		{
			StopLightning();
			PlayFireEnd();
			// End:0x6D
			if(Weapon.HasAnim(FireLoopAnim))
			{
				BW.SafeLoopAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");
			}
			NextFireTime += 2.0000000;
			return;
		}
		// End:0x156
		if(FireCount < 1)
		{
			// End:0xB3
			if(int(Level.DetailMode) > int(0))
			{
				HVCMk9LightningGun(Weapon).InitArcs();
			}
			// End:0xEC
			if(Weapon.HasAnim(FireLoopAnim))
			{
				BW.SafeLoopAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");
			}
			// End:0x153
			if(BallisticFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}			
		}
		else
		{
			// End:0x1CC
			if(FireCount == Max(1, int(Level.TimeDilation * 5.0000000)))
			{
				Weapon.PlayOwnedSound(FireSound2, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}
		}
		ClientPlayForceFeedback(FireForce);
		FireCount++;
		// End:0x218
		if(int(Level.NetMode) == int(NM_Client))
		{
			bIsZapping = true;
			HVCMk9LightningGun(Weapon).AddHeat(0.1500000);
		}
		// End:0x26F
		if((MuzzleFlash == none) || MuzzleFlash.bDeleteMe)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, Class'BallisticProV55.HVCMk9MuzzleFlash', Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
		}
		// End:0x2A1
		if(FireSoundLoop != none)
		{
			Instigator.AmbientSound = FireSoundLoop;
			Instigator.SoundVolume = byte(255);
		}
		//return;		
	}

	function PlayFireEnd()
	{
		// End:0x0F
		if(bIsZapping)
		{
			super(WeaponFire).PlayFireEnd();
		}
		StopLightning();
		//return;		
	}

	function StopFiring()
	{
		super(BallisticFire).StopFiring();
		StopLightning();
		//return;		
	}

	function StopLightning()
	{
		HVCMk9LightningGun(Weapon).KillZap();
		bIsZapping = false;
		// End:0x42
		if(MuzzleFlash != none)
		{
			Emitter(MuzzleFlash).Kill();
			MuzzleFlash = none;
		}
		Instigator.AmbientSound = BW.UsedAmbientSound;
		Instigator.SoundVolume = Weapon.default.SoundVolume;
		//return;		
	}
	stop;	
}

defaultproperties
{
	FireSoundLoop=Sound'BW_Core_WeaponSound.LightningGun.LG-FireLoop'
	MaxWaterTraceRange=9000.0000000
	DamageType=Class'BallisticProV55.DT_HVCLightning'
	DamageTypeHead=Class'BallisticProV55.DT_HVCLightning'
	DamageTypeArm=Class'BallisticProV55.DT_HVCLightning'
	KickForce=2000
	bNoPositionalDamage=true
	FireChaos=0.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.LightningGun.LG-FireStart',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bPawnRapidFireAnim=true
	FireRate=0.0700000
	AmmoClass=Class'BallisticProV55.Ammo_HVCCells'
	ShakeRotMag=(X=50.0000000,Y=50.0000000,Z=50.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=1.0000000,Y=1.0000000,Z=1.0000000)
	ShakeOffsetRate=(X=1000.0000000,Y=1000.0000000,Z=1000.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.9900000
	WarnTargetPct=0.3000000
}
