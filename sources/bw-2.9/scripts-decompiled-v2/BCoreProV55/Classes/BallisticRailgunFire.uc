class BallisticRailgunFire extends BallisticInstantFire;

var array<Vector> WallEntrys;
var array<Vector> WallExits;

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
		NextFireTime += FireRate;
		NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
	}
	load = float(AmmoPerFire);
	HoldTime = 0.0000000;
	// End:0x35B
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x3D5
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
		// End:0x3D5
		if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
		{
			BW.bNeedCock = true;
		}
	}
	//return;	
}

function bool CanPenetrate(Actor Other, Vector HitLocation, Vector Dir, int PenCount)
{
	local float Resistance;

	// End:0x40
	if(((!bPenetrate || Other == none) || Other.bWorldGeometry) || Mover(Other) != none)
	{
		return false;
	}
	// End:0x6B
	if(BallisticShield(Other) != none)
	{
		return BallisticShield(Other).EffectiveThickness < WallPenetrationForce;
	}
	// End:0x17A
	if(Pawn(Other) != none)
	{
		Resistance = FRand() * Pawn(Other).HealthMax;
		// End:0xC5
		if(xPawn(Other) != none)
		{
			Resistance += xPawn(Other).ShieldStrength;			
		}
		else
		{
			// End:0x108
			if((Vehicle(Other) == none) && HitLocation.Z < Other.Location.Z)
			{
				Resistance *= 0.5000000;				
			}
			else
			{
				// End:0x177
				if(((Vehicle(Other) == none) && Normal(Dir).Z > -0.5000000) && HitLocation.Z > (Other.Location.Z + (Other.CollisionHeight * 0.8000000)))
				{
					Resistance *= 0.5000000;
				}
			}
		}		
	}
	else
	{
		// End:0x1A5
		if(DestroyableObjective(Other) != none)
		{
			Resistance = float(DestroyableObjective(Other).Health);
		}
	}
	// End:0x1C2
	if(float(PenetrateForce / (PenCount + 1)) > Resistance)
	{
		return true;
	}
	return false;
	//return;	
}

function DoTrace(Vector InitialStart, Rotator Dir)
{
	local int PenCount, WallCount, WallPenForce, HitSameCount;
	local Vector End, X, HitLocation, HitNormal, Start, WaterHitLoc,
		ExitNorm, LastHitLocation;

	local Material HitMaterial;
	local float dist;
	local Actor Other, LastOther;
	local bool bHitWall;

	WallPenForce = int(WallPenetrationForce);
	BW.UpdatePenetrationStatus(0);
	dist = TraceRange.Min + (FRand() * (TraceRange.Max - TraceRange.Min));
	Start = InitialStart;
	X = Normal(Vector(Dir));
	End = Start + (X * dist);
	LastHitLocation = End;
	Weapon.bTraceWater = true;
	WallEntrys.Length = 0;
	WallExits.Length = 0;
	J0xA8:

	// End:0x5B4 [Loop If]
	if((dist > float(0)) && HitSameCount < 10)
	{
		BW.UpdatePenetrationStatus(PenCount + WallCount);
		Other = Trace(HitLocation, HitNormal, End, Start, true,, HitMaterial);
		dist -= VSize(HitLocation - Start);
		// End:0x165
		if((int(Level.NetMode) == int(NM_Client)) && (int(Other.Role) != int(ROLE_Authority)) || Other.bWorldGeometry)
		{			
		}
		else
		{
			// End:0x5A3
			if(Other != none)
			{
				// End:0x207
				if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
				{
					// End:0x1CC
					if(VSize(HitLocation - Start) > float(1))
					{
						WaterHitLoc = HitLocation;
					}
					Start = HitLocation;
					End = Start + (X * dist);
					Weapon.bTraceWater = false;
					goto J0x5B1;					
				}
				else
				{
					LastHitLocation = HitLocation;
				}
				// End:0x32B
				if(!Other.bWorldGeometry && Other != LastOther)
				{
					OnTraceHit(Other, HitLocation, InitialStart, X, PenCount, WallCount, WallPenForce, WaterHitLoc);
					LastOther = Other;
					HitSameCount = 0;
					// End:0x2A6
					if(Vehicle(Other) != none)
					{
						ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);
					}
					// End:0x318
					if(CanPenetrate(Other, HitLocation, X, PenCount))
					{
						PenCount++;
						Start = HitLocation + (X * FMax(Other.CollisionRadius * float(2), 8.0000000));
						End = Start + (X * dist);
						goto J0x5B1;						
					}
					else
					{
						// End:0x32B
						if(Mover(Other) == none)
						{
							// [Explicit Break]
							goto J0x5B4;
						}
					}
				}
				// End:0x525
				if(Other.bWorldGeometry || Mover(Other) != none)
				{
					WallCount++;
					ExitNorm = X;
					// End:0x3CA
					if(Other.bCanBeDamaged)
					{
						bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);
						OnTraceHit(Other, HitLocation, InitialStart, X, PenCount, WallCount, WallPenForce, WaterHitLoc);
						// [Explicit Break]
						goto J0x5B4;
					}
					// End:0x4FC
					if((WallCount < 5) && Class'BCoreProV55.WallPenetrationUtil'.static.GoThroughWall(Weapon, Instigator, HitLocation, HitNormal, float(WallPenForce), X, Start, ExitNorm))
					{
						WallPenForce -= int(VSize(Start - HitLocation));
						End = Start + (X * dist);
						// End:0x492
						if((WallEntrys.Length < 1) || VSize(HitLocation - WallEntrys[WallEntrys.Length - 1]) > float(80))
						{
							WallEnterEffect(HitLocation, HitNormal, X, Other, HitMaterial);
						}
						// End:0x4F9
						if((VSize(Start - HitLocation) > float(50)) && (WallExits.Length < 1) || VSize(HitLocation - WallExits[WallExits.Length - 1]) > float(80))
						{
							WallExitEffect(Start, ExitNorm, X, Other, HitMaterial);
						}
						// [Explicit Continue]
						goto J0x5B1;
					}
					bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);
					// [Explicit Break]
					goto J0x5B4;
				}
				// End:0x59D
				if((Other == Instigator) || Other == LastOther)
				{
					HitSameCount++;
					Start = HitLocation + ((X * FMax(Other.CollisionRadius * float(2), 16.0000000)) * float(2));
					End = Start + (X * dist);
					// [Explicit Continue]
					goto J0x5B1;
				}
				// [Explicit Break]
				goto J0x5B4;				
			}
			else
			{
				LastHitLocation = End;
				// [Explicit Break]
				goto J0x5B4;
			}
		}
		J0x5B1:

		// [Loop Continue]
		goto J0xA8;
	}
	J0x5B4:

	// End:0x5D9
	if(!bHitWall)
	{
		NoHitEffect(X, InitialStart, LastHitLocation, WaterHitLoc);
	}
	Weapon.bTraceWater = false;
	//return;	
}

function WallEnterEffect(Vector HitLocation, Vector HitNormal, Vector X, Actor Other, Material HitMat)
{
	local int Surf;

	// End:0x3A
	if((!Other.bWorldGeometry && Mover(Other) == none) && Vehicle(Other) == none)
	{
		return;
	}
	WallEntrys[WallEntrys.Length] = HitLocation;
	// End:0x70
	if(HitMat == none)
	{
		Surf = int(Other.SurfaceType);		
	}
	else
	{
		Surf = int(HitMat.SurfaceType);
	}
	RailgunAttachment(Weapon.ThirdPersonActor).RailgunWallEnter(HitLocation, HitNormal, Surf, X, Other);
	//return;	
}

function WallExitEffect(Vector HitLocation, Vector HitNormal, Vector X, Actor Other, Material HitMat)
{
	local int Surf;

	// End:0x3A
	if((!Other.bWorldGeometry && Mover(Other) == none) && Vehicle(Other) == none)
	{
		return;
	}
	WallExits[WallExits.Length] = HitLocation;
	// End:0x70
	if(HitMat == none)
	{
		Surf = int(Other.SurfaceType);		
	}
	else
	{
		Surf = int(HitMat.SurfaceType);
	}
	RailgunAttachment(Weapon.ThirdPersonActor).RailgunWallExit(HitLocation, HitNormal, Surf, X, Other);
	//return;	
}

simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
{
	RailgunAttachment(Weapon.ThirdPersonActor).UpdateWallEntrys(WallEntrys);
	RailgunAttachment(Weapon.ThirdPersonActor).UpdateWallExits(WallExits);
	BallisticAttachment(Weapon.ThirdPersonActor).BallisticUpdateHit(Other, HitLocation, HitNormal, Surf, ThisModeNum > 0, WaterHitLoc);
	//return;	
}

defaultproperties
{
	TraceRange=(Min=10000.0000000,Max=10000.0000000)
	WallPenetrationForce=256.0000000
	PDamageFactor=0.9500000
}
