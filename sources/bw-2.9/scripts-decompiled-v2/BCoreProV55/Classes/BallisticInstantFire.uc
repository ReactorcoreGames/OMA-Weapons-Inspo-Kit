class BallisticInstantFire extends BallisticFire;

const MAX_WALLS = 5;

struct InstantFireModeInfo
{
	var int mDamage;
	var Class<DamageType> mDamageType;
	var Class<DamageType> mDamageTypeHead;
	var float mFireRate;
	var float mFireChaos;
	var Sound mFireSound;
	var name mFireAnim;
	var bool bLoopedAnim;
	var name mFireEndAnim;
	var float mRecoil;
	var int mAmmoPerFire;
	var name TargetState;
	var bool bModeLead;
	var bool bModeInstantHit;
	var bool bModeSplash;
	var bool bModeRecommendSplash;
};

var() int HeadRadius;
var() int HeadOffset;
var() Range TraceRange;
var() Range DecayRange;
var() float MaxWaterTraceRange;
var() float WallPenetrationForce;
var() float Damage;
var() float DamageSpecial;
var() float HeadMult;
var() float LimbMult;
var() float RangeAtten;
var() float WaterRangeAtten;
var() Class<DamageType> DamageType;
var() Class<DamageType> DamageTypeHead;
var() Class<DamageType> DamageTypeArm;
var() int KickForce;
var() float HookStopFactor;
var() float HookPullForce;
var() int PenetrateForce;
var() bool bPenetrate;
var() float PDamageFactor;
var() float WallPDamageFactor;
var() bool bUseRunningDamage;
var() float RunningSpeedThresh;
var bool bNoPositionalDamage;
var array<InstantFireModeInfo> FireModes;

simulated function ApplyFireEffectParams(FireEffectParams Params)
{
	local InstantEffectParams effect_params;

	super.ApplyFireEffectParams(Params);
	effect_params = InstantEffectParams(Params);
	// End:0x28
	if(effect_params == none)
	{
		return;
	}
	TraceRange = effect_params.TraceRange;
	DecayRange = effect_params.DecayRange;
	// End:0x92
	if((DecayRange.Max == float(0)) || DecayRange.Max <= DecayRange.Min)
	{
		DecayRange.Max = TraceRange.Max;
	}
	MaxWaterTraceRange = effect_params.WaterTraceRange;
	RangeAtten = effect_params.RangeAtten;
	default.TraceRange = effect_params.TraceRange;
	default.DecayRange = DecayRange;
	default.MaxWaterTraceRange = effect_params.WaterTraceRange;
	default.RangeAtten = effect_params.RangeAtten;
	Damage = float(effect_params.Damage);
	DamageSpecial = float(effect_params.DamageSpecial);
	HeadMult = effect_params.HeadMult;
	LimbMult = effect_params.LimbMult;
	default.Damage = float(effect_params.Damage);
	default.HeadMult = effect_params.HeadMult;
	default.LimbMult = effect_params.LimbMult;
	DamageType = effect_params.DamageType;
	DamageTypeHead = effect_params.DamageTypeHead;
	DamageTypeArm = effect_params.DamageTypeArm;
	bUseRunningDamage = effect_params.UseRunningDamage;
	RunningSpeedThresh = effect_params.RunningSpeedThreshold;
	default.DamageType = effect_params.DamageType;
	default.DamageTypeHead = effect_params.DamageTypeHead;
	default.DamageTypeArm = effect_params.DamageTypeArm;
	default.bUseRunningDamage = effect_params.UseRunningDamage;
	default.RunningSpeedThresh = effect_params.RunningSpeedThreshold;
	WallPenetrationForce = effect_params.PenetrationEnergy;
	PenetrateForce = effect_params.PenetrateForce;
	bPenetrate = effect_params.bPenetrate;
	default.WallPenetrationForce = effect_params.PenetrationEnergy;
	default.PenetrateForce = effect_params.PenetrateForce;
	default.bPenetrate = effect_params.bPenetrate;
	PDamageFactor = effect_params.PDamageFactor;
	WallPDamageFactor = effect_params.WallPDamageFactor;
	default.PDamageFactor = effect_params.PDamageFactor;
	default.WallPDamageFactor = effect_params.WallPDamageFactor;
	HookStopFactor = effect_params.HookStopFactor;
	HookPullForce = effect_params.HookPullForce;
	default.HookStopFactor = effect_params.HookStopFactor;
	default.HookPullForce = effect_params.HookPullForce;
	//return;	
}

function float MaxRange()
{
	return TraceRange.Max;
	//return;	
}

function float SurfaceScale(int Surf)
{
	switch(Surf)
	{
		// End:0x11
		case 0:
			return 1.0000000;
		// End:0x1B
		case 1:
			return 1.0000000;
		// End:0x26
		case 2:
			return 2.0000000;
		// End:0x31
		case 3:
			return 0.3300000;
		// End:0x3C
		case 4:
			return 6.0000000;
		// End:0x47
		case 5:
			return 16.0000000;
		// End:0x52
		case 6:
			return 1.0000000;
		// End:0x5D
		case 7:
			return 6.0000000;
		// End:0x68
		case 8:
			return 16.0000000;
		// End:0x73
		case 9:
			return 0.2500000;
		// End:0x7E
		case 10:
			return 16.0000000;
		// End:0xFFFF
		default:
			return 1.0000000;
			break;
	}
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
	super.DoFireEffect();
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
	// End:0x98
	if(Pawn(Other) != none)
	{
		Resistance = FRand() * Pawn(Other).HealthMax;
	}
	// End:0xC2
	if(xPawn(Other) != none)
	{
		Resistance += xPawn(Other).ShieldStrength;
	}
	// End:0x10B
	if((Vehicle(Other) == none) && HitLocation.Z < (Other.Location.Z - float(5)))
	{
		Resistance *= 0.5000000;		
	}
	else
	{
		// End:0x17A
		if(((Vehicle(Other) == none) && Normal(Dir).Z > -0.5000000) && HitLocation.Z > (Other.Location.Z + (Other.CollisionHeight * 0.8000000)))
		{
			Resistance *= 0.5000000;
		}
	}
	// End:0x197
	if(float(PenetrateForce / (PenCount + 1)) > Resistance)
	{
		return true;
	}
	//return;	
}

final function float GetDamage(Actor Other, Vector HitLocation, Vector TraceStart, Vector Dir, out Actor Victim, optional out Class<DamageType> dt)
{
	local float Dmg;
	local Pawn DriverPawn;
	local Vector HeadLocation;

	Dmg = Damage;
	dt = DamageType;
	Victim = Other;
	// End:0x42
	if(bNoPositionalDamage || Monster(Other) != none)
	{
		return Dmg;
	}
	// End:0xAE
	if(Vehicle(Other) != none)
	{
		DriverPawn = Vehicle(Other).CheckForHeadShot(HitLocation, Dir, 1.0000000);
		// End:0xA8
		if(DriverPawn != none)
		{
			Victim = DriverPawn;
			Dmg *= HeadMult;
			dt = DamageTypeHead;
		}
		return Dmg;
	}
	// End:0x160
	if(Pawn(Other) != none)
	{
		HeadLocation = Other.GetBoneCoords('head').Origin;
		// End:0x121
		if(Class'BCoreProV55.BUtil'.static.GetClosestDistanceTo(HeadLocation, TraceStart, Dir) <= float(HeadRadius))
		{
			Dmg *= HeadMult;
			dt = DamageTypeHead;			
		}
		else
		{
			// End:0x160
			if(HitLocation.Z <= (Other.Location.Z - float(5)))
			{
				Dmg *= LimbMult;
				dt = DamageTypeArm;
			}
		}
	}
	return Dmg;
	//return;	
}

final function float GetDamageForCollision(UnlaggedPawnCollision Other, Vector HitLocation, Vector TraceStart, Vector Dir, optional out Class<DamageType> dt)
{
	local float Dmg;
	local Vector HeadPositionApprox;

	Dmg = Damage;
	dt = DamageType;
	HeadPositionApprox = Other.Location;
	HeadPositionApprox.Z += Other.CollisionHeight;
	HeadPositionApprox.Z -= float(HeadOffset);
	// End:0x9B
	if(Class'BCoreProV55.BUtil'.static.GetClosestDistanceTo(HeadPositionApprox, TraceStart, Dir) <= float(HeadRadius))
	{
		Dmg *= HeadMult;
		dt = DamageTypeHead;		
	}
	else
	{
		// End:0xDA
		if(HitLocation.Z <= (Other.Location.Z - float(5)))
		{
			Dmg *= LimbMult;
			dt = DamageTypeArm;
		}
	}
	return Dmg;
	//return;	
}

function Vector GetDamageHitLocation(Actor Other, Vector HitLocation, Vector TraceStart, Vector Dir)
{
	local Vector ClosestLocation;

	ClosestLocation = Other.Location;
	ClosestLocation.Z += HitLocation - Other.Location.Z;
	return Class'BCoreProV55.BUtil'.static.GetClosestPointTo(ClosestLocation, TraceStart, Dir);
	//return;	
}

final function float GetRangeAttenFactor(Vector Start, Vector End)
{
	local float dist, Alpha;

	dist = VSize(End - Start);
	// End:0x2E
	if(dist <= DecayRange.Min)
	{
		return 1.0000000;
	}
	// End:0x48
	if(dist >= DecayRange.Max)
	{
		return RangeAtten;
	}
	Alpha = (dist - DecayRange.Min) / (DecayRange.Max - DecayRange.Min);
	return Lerp(Alpha, 1.0000000, RangeAtten);
	//return;	
}

function float ResolveDamageFactors(Actor Other, Vector TraceStart, Vector HitLocation, int PenetrateCount, int WallCount, int WallPenForce, Vector WaterHitLocation)
{
	local float DamageFactor;
	local Vector RelativeVelocity;

	DamageFactor = 1.0000000;
	// End:0x31
	if(RangeAtten != 1.0000000)
	{
		DamageFactor *= GetRangeAttenFactor(TraceStart, HitLocation);
	}
	// End:0x81
	if((WaterRangeAtten != 1.0000000) && WaterHitLocation != vect(0.0000000, 0.0000000, 0.0000000))
	{
		DamageFactor *= Lerp(VSize(HitLocation - WaterHitLocation) / MaxWaterTraceRange, 1.0000000, WaterRangeAtten);
	}
	// End:0xA1
	if(PenetrateCount > 0)
	{
		DamageFactor *= (PDamageFactor * float(PenetrateCount));
	}
	// End:0xE5
	if((WallPenetrationForce > float(0)) && WallCount > 0)
	{
		DamageFactor *= (WallPDamageFactor * float(WallCount));
		DamageFactor *= (float(WallPenForce) / WallPenetrationForce);
	}
	// End:0x159
	if(bUseRunningDamage)
	{
		RelativeVelocity = Instigator.Velocity - Other.Velocity;
		DamageFactor += ((DamageFactor * (VSize(RelativeVelocity) / RunningSpeedThresh)) * (Normal(RelativeVelocity) Dot Normal(Other.Location - Instigator.Location)));
	}
	return DamageFactor;
	//return;	
}

function OnTraceHit(Actor Other, Vector HitLocation, Vector TraceStart, Vector Dir, int PenetrateCount, int WallCount, int WallPenForce, optional Vector WaterHitLocation)
{
	local float Dmg, ScaleFactor;
	local Class<DamageType> HitDT;
	local Actor Victim;
	local Vector DamageHitLocation;

	// End:0x76
	if(UnlaggedPawnCollision(Other) != none)
	{
		DamageHitLocation = GetDamageHitLocation(Other, HitLocation, TraceStart, Dir);
		Dmg = GetDamageForCollision(UnlaggedPawnCollision(Other), DamageHitLocation, TraceStart, Dir, HitDT);
		Victim = UnlaggedPawnCollision(Other).UnlaggedPawn;		
	}
	else
	{
		// End:0xCA
		if(Other.IsA('xPawn') && !Other.IsA('Monster'))
		{
			DamageHitLocation = GetDamageHitLocation(xPawn(Other), HitLocation, TraceStart, Dir);			
		}
		else
		{
			DamageHitLocation = HitLocation;
		}
		Dmg = GetDamage(Other, DamageHitLocation, TraceStart, Dir, Victim, HitDT);
	}
	ScaleFactor = ResolveDamageFactors(Other, TraceStart, HitLocation, PenetrateCount, WallCount, WallPenForce, WaterHitLocation);
	Dmg *= ScaleFactor;
	// End:0x164
	if(Pawn(Victim) != none)
	{
		ApplyForce(Pawn(Victim), TraceStart, ScaleFactor);
	}
	ApplyDamage(Victim, int(Ceil(Dmg)), Instigator, HitLocation, (float(KickForce) * Dir) * ScaleFactor, HitDT);
	//return;	
}

function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, float(Damage), Instigator, HitLocation, MomentumDir, DamageType);
	//return;	
}

function ApplyForce(Pawn Victim, Vector Start, float ScaleFactor)
{
	local Vector ForceDir;

	// End:0xBD
	if(((HookStopFactor != float(0)) && HookPullForce != float(0)) && Victim.bProjTarget)
	{
		ForceDir = Normal(Victim.Location - Start) * ScaleFactor;
		ForceDir.Z *= 0.3000000;
		Victim.AddVelocity(((Normal(Victim.Acceleration) * HookStopFactor) * -FMin(Victim.GroundSpeed, VSize(Victim.Velocity))) - (ForceDir * HookPullForce));
	}
	//return;	
}

function DoTrace(Vector InitialStart, Rotator Dir)
{
	local int PenCount, WallCount, WallPenForce;
	local Vector End, X, HitLocation, HitNormal, Start, WaterHitLoc,
		LastHitLoc, ExitNormal;

	local Material HitMaterial, ExitMaterial;
	local float dist;
	local Actor Other, LastOther;
	local bool bHitWall;

	// End:0x1A
	if((Weapon == none) || BW == none)
	{
		return;
	}
	WallPenForce = int(WallPenetrationForce);
	BW.UpdatePenetrationStatus(0);
	dist = TraceRange.Min + (FRand() * (TraceRange.Max - TraceRange.Min));
	Start = InitialStart;
	X = Normal(Vector(Dir));
	End = Start + (X * dist);
	LastHitLoc = End;
	Weapon.bTraceWater = true;
	J0xB2:

	// End:0x611 [Loop If]
	if(dist > float(0))
	{
		BW.UpdatePenetrationStatus(PenCount + WallCount);
		Other = Trace(HitLocation, HitNormal, End, Start, true,, HitMaterial);
		Weapon.bTraceWater = false;
		dist -= VSize(HitLocation - Start);
		// End:0x172
		if((int(Level.NetMode) == int(NM_Client)) && (int(Other.Role) != int(ROLE_Authority)) || Other.bWorldGeometry)
		{
			// [Explicit Break]
			goto J0x611;
		}
		// End:0x18B
		if(Other == none)
		{
			LastHitLoc = End;
			// [Explicit Break]
			goto J0x611;
		}
		// End:0x237
		if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
		{
			// End:0x1E7
			if(VSize(HitLocation - Start) > float(1))
			{
				WaterHitLoc = HitLocation;
			}
			Start = HitLocation;
			dist = float(Min(int(dist), int(MaxWaterTraceRange)));
			End = Start + (X * dist);
			Weapon.bTraceWater = false;			
		}
		else
		{
			LastHitLoc = HitLocation;
			// End:0x38D
			if(!Other.bWorldGeometry && Other != LastOther)
			{
				OnTraceHit(Other, HitLocation, InitialStart, X, PenCount, WallCount, WallPenForce, WaterHitLoc);
				LastOther = Other;
				// End:0x341
				if(CanPenetrate(Other, HitLocation, X, PenCount))
				{
					PenCount++;
					Start = HitLocation + ((X * Other.CollisionRadius) * float(2));
					End = Start + (X * dist);
					Weapon.bTraceWater = true;
					// End:0x33B
					if(Vehicle(Other) != none)
					{
						HitVehicleEffect(HitLocation, HitNormal, Other);
					}
					goto J0x60E;					
				}
				else
				{
					// End:0x37A
					if(Vehicle(Other) != none)
					{
						bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);						
					}
					else
					{
						// End:0x38D
						if(Mover(Other) == none)
						{
							// [Explicit Break]
							goto J0x611;
						}
					}
				}
			}
			// End:0x58F
			if(Other.bWorldGeometry || Mover(Other) != none)
			{
				WallCount++;
				// End:0x421
				if(Other.bCanBeDamaged)
				{
					bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);
					OnTraceHit(Other, HitLocation, InitialStart, X, PenCount, WallCount, WallPenForce, WaterHitLoc);
					// [Explicit Break]
					goto J0x611;
				}
				// End:0x566
				if(((WallCount < 5) && WallPenForce > 0) && Class'BCoreProV55.WallPenetrationUtil'.static.GoThroughWall(Weapon, Instigator, HitLocation, HitNormal, float(WallPenForce) * (SurfaceScale(Class'BCoreProV55.WallPenetrationUtil'.static.GetSurfaceType(Other, HitMaterial))), X, Start, ExitNormal, ExitMaterial))
				{
					WallPenForce -= int(VSize(Start - HitLocation) / (SurfaceScale(Class'BCoreProV55.WallPenetrationUtil'.static.GetSurfaceType(Other, HitMaterial))));
					Dir.Yaw += int(float(32) - (FRand() * float(64)));
					Dir.Pitch += int(float(32) - (FRand() * float(64)));
					X = Normal(Vector(Dir));
					WallPenetrateEffect(Other, HitLocation, HitNormal, HitMaterial);
					WallPenetrateEffect(Other, Start, ExitNormal, ExitMaterial, true);
					Weapon.bTraceWater = true;
					// [Explicit Continue]
					goto J0x60E;
				}
				bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);
				// [Explicit Break]
				goto J0x611;
			}
			// End:0x60B
			if((Other == Instigator) || Other == LastOther)
			{
				Start = HitLocation + (X * FMax(32.0000000, Other.CollisionRadius * float(2)));
				End = Start + (X * dist);
				Weapon.bTraceWater = true;				
			}
			else
			{
				// [Explicit Break]
				goto J0x611;
			}
		}
		J0x60E:

		// [Loop Continue]
		goto J0xB2;
	}
	J0x611:

	// End:0x636
	if(!bHitWall)
	{
		NoHitEffect(X, InitialStart, LastHitLoc, WaterHitLoc);
	}
	//return;	
}

function HitVehicleEffect(Vector HitLocation, Vector HitNormal, Actor Other)
{
	local int Surf;

	// End:0x0D
	if(Other == none)
	{
		return;
	}
	// End:0x3C
	if(int(Other.SurfaceType) > 0)
	{
		Surf = int(Other.SurfaceType);		
	}
	else
	{
		Surf = 3;
	}
	BallisticAttachment(Weapon.ThirdPersonActor).UpdateDirectHit(byte(ThisModeNum), HitLocation, HitNormal, Surf);
	//return;	
}

function WallPenetrateEffect(Actor Other, Vector HitLocation, Vector HitNormal, Material HitMat, optional bool bExit)
{
	local int Surf;

	// End:0x24
	if(HitMat == none)
	{
		Surf = int(Other.SurfaceType);		
	}
	else
	{
		Surf = int(HitMat.SurfaceType);
	}
	BallisticAttachment(Weapon.ThirdPersonActor).UpdateWallPenetrate(byte(ThisModeNum), HitLocation, HitNormal, Surf, bExit);
	//return;	
}

function NoHitEffect(Vector Dir, optional Vector Start, optional Vector HitLocation, optional Vector WaterHitLoc)
{
	// End:0xA2
	if((Weapon != none) && int(Level.NetMode) != int(NM_Client))
	{
		// End:0x70
		if((HitLocation != vect(0.0000000, 0.0000000, 0.0000000)) && HitLocation != WaterHitLoc)
		{
			SendFireEffect(none, HitLocation, vect(0.0000000, 0.0000000, 0.0000000), 0, WaterHitLoc);			
		}
		else
		{
			SendFireEffect(none, Start + (Dir * TraceRange.Max), vect(0.0000000, 0.0000000, 0.0000000), 0, WaterHitLoc);
		}
	}
	//return;	
}

simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
{
	local int Surf;

	// End:0x55
	if(((!Other.bWorldGeometry && Mover(Other) == none) && Vehicle(Other) == none) || int(Level.NetMode) == int(NM_Client))
	{
		return false;
	}
	// End:0x70
	if(Vehicle(Other) != none)
	{
		Surf = 3;		
	}
	else
	{
		// End:0x94
		if(HitMat == none)
		{
			Surf = int(Other.SurfaceType);			
		}
		else
		{
			Surf = int(HitMat.SurfaceType);
		}
	}
	SendFireEffect(Other, HitLocation, HitNormal, Surf, WaterHitLoc);
	// End:0xE5
	if(!bAISilent)
	{
		Instigator.MakeNoise(1.0000000);
	}
	return true;
	//return;	
}

function StartBerserk()
{
	// End:0x2D
	if((FireModes.Length == 0) || int(BW.CurrentWeaponMode) == 0)
	{
		super.StartBerserk();		
	}
	else
	{
		FireRate = FireModes[int(BW.CurrentWeaponMode) - 1].mFireRate * 0.7500000;
		FireAnimRate = default.FireAnimRate / 0.7500000;
		FireRecoil = FireModes[int(BW.CurrentWeaponMode) - 1].mRecoil * 0.7500000;
		FireChaos = FireModes[int(BW.CurrentWeaponMode) - 1].mFireChaos * 0.7500000;
	}
	//return;	
}

function StopBerserk()
{
	// End:0x2D
	if((FireModes.Length == 0) || int(BW.CurrentWeaponMode) == 0)
	{
		super.StopBerserk();		
	}
	else
	{
		FireRate = FireModes[int(BW.CurrentWeaponMode) - 1].mFireRate;
		FireAnimRate = default.FireAnimRate;
		FireRecoil = FireModes[int(BW.CurrentWeaponMode) - 1].mRecoil;
		FireChaos = FireModes[int(BW.CurrentWeaponMode) - 1].mFireChaos;
	}
	//return;	
}

simulated function SwitchWeaponMode(byte newmode)
{
	// End:0x347
	if(FireModes.Length > 0)
	{
		// End:0xE5
		if(int(newmode) == 0)
		{
			Damage = default.Damage;
			DamageType = default.DamageType;
			DamageTypeArm = default.DamageTypeArm;
			DamageTypeHead = default.DamageTypeHead;
			FireRate = default.FireRate;
			FireChaos = default.FireChaos;
			BallisticFireSound.Sound = default.BallisticFireSound.Sound;
			FireLoopAnim = default.FireLoopAnim;
			FireAnim = default.FireAnim;
			FireEndAnim = default.FireEndAnim;
			FireRecoil = default.FireRecoil;
			AmmoPerFire = default.AmmoPerFire;
			GotoState('None');
			bLeadTarget = default.bLeadTarget;
			bInstantHit = default.bInstantHit;
			bSplashDamage = default.bSplashDamage;
			bRecommendSplashDamage = default.bRecommendSplashDamage;			
		}
		else
		{
			newmode--;
			Damage = float(FireModes[int(newmode)].mDamage);
			DamageType = FireModes[int(newmode)].mDamageType;
			DamageTypeArm = FireModes[int(newmode)].mDamageType;
			DamageTypeHead = FireModes[int(newmode)].mDamageTypeHead;
			FireRate = FireModes[int(newmode)].mFireRate;
			FireChaos = FireModes[int(newmode)].mFireChaos;
			BallisticFireSound.Sound = FireModes[int(newmode)].mFireSound;
			// End:0x1D7
			if(FireModes[int(newmode)].bLoopedAnim)
			{
				FireLoopAnim = FireModes[int(newmode)].mFireAnim;
				FireAnim = 'None';				
			}
			else
			{
				FireLoopAnim = 'None';
				FireAnim = FireModes[int(newmode)].mFireAnim;
			}
			FireEndAnim = FireModes[int(newmode)].mFireEndAnim;
			FireRecoil = FireModes[int(newmode)].mRecoil;
			AmmoPerFire = FireModes[int(newmode)].mAmmoPerFire;
			GotoState(FireModes[int(newmode)].TargetState);
			bLeadTarget = FireModes[int(newmode)].bModeLead;
			bInstantHit = FireModes[int(newmode)].bModeInstantHit;
			bSplashDamage = FireModes[int(newmode)].bModeSplash;
			bRecommendSplashDamage = FireModes[int(newmode)].bModeRecommendSplash;
			newmode++;
		}
		// End:0x2FB
		if(Weapon.bBerserk)
		{
			FireRate *= 0.7500000;
			FireRecoil *= 0.7500000;
			FireChaos *= 0.7500000;
		}
		// End:0x33A
		if(Level.GRI.WeaponBerserk > 1.0000000)
		{
			FireRate /= Level.GRI.WeaponBerserk;
		}
		load = float(AmmoPerFire);
	}
	//return;	
}

defaultproperties
{
	HeadRadius=12
	HeadOffset=12
	TraceRange=(Min=5000.0000000,Max=5000.0000000)
	MaxWaterTraceRange=128.0000000
	HeadMult=2.0000000
	LimbMult=0.7500000
	RangeAtten=1.0000000
	PDamageFactor=0.7000000
	WallPDamageFactor=0.9500000
}
