class BallisticShotgunFire extends BallisticInstantFire;

struct HitActorInfo
{
	var() Actor HitActor;
	var() int Damage;
	var() Vector LastHitLocation;
	var() int TotalHits;
	var() int HeadHits;
};

var() int TraceCount;
var() Class<Emitter> TracerClass;
var() float TracerChance;
var() Class<BCImpactManager> ImpactManager;
var() bool bDoWaterSplash;
var() int MaxHits;
var array<HitActorInfo> HitActorInfos;

simulated function PostNetBeginPlay()
{
	super(WeaponFire).PostNetBeginPlay();
	// End:0x53
	if((TracerChance < float(2)) && (int(Level.DetailMode) == int(1)) || int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) == 1)
	{
		TracerChance *= 0.3000000;
	}
	//return;	
}

simulated function ApplyFireEffectParams(FireEffectParams Params)
{
	local ShotgunEffectParams effect_params;

	super.ApplyFireEffectParams(Params);
	effect_params = ShotgunEffectParams(Params);
	TraceCount = effect_params.TraceCount;
	TracerClass = effect_params.TracerClass;
	ImpactManager = effect_params.ImpactManager;
	MaxHits = effect_params.MaxHits;
	default.TraceCount = effect_params.TraceCount;
	default.TracerClass = effect_params.TracerClass;
	default.ImpactManager = effect_params.ImpactManager;
	default.MaxHits = effect_params.MaxHits;
	//return;	
}

function int GetXInaccuracy()
{
	return int(XInaccuracy);
	//return;	
}

function int GetYInaccuracy()
{
	return int(YInaccuracy);
	//return;	
}

function DoFireEffect()
{
	local Vector StartTrace;
	local Rotator R, Aim;
	local int i;

	// End:0x28
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		BW.RewindCollisions();
	}
	Aim = GetFireAim(StartTrace);
	i = 0;
	J0x40:

	// End:0x7F [Loop If]
	if(i < TraceCount)
	{
		R = Rotator((GetFireSpread()) >> Aim);
		DoTrace(StartTrace, R);
		i++;
		// [Loop Continue]
		goto J0x40;
	}
	// End:0xA7
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		BW.RestoreCollisions();
	}
	ApplyHits();
	// End:0x10C
	if(BallisticShotgunAttachment(Weapon.ThirdPersonActor) != none)
	{
		BallisticShotgunAttachment(Weapon.ThirdPersonActor).XInaccuracy = GetXInaccuracy();
		BallisticShotgunAttachment(Weapon.ThirdPersonActor).YInaccuracy = GetYInaccuracy();
	}
	SendFireEffect(none, Vector(Aim) * TraceRange.Max, StartTrace, 0);
	super(BallisticFire).DoFireEffect();
	//return;	
}

function OnTraceHit(Actor Other, Vector HitLocation, Vector TraceStart, Vector Dir, int PenetrateCount, int WallCount, int WallPenForce, optional Vector WaterHitLocation)
{
	local float Dmg, ScaleFactor;
	local Class<DamageType> HitDT;
	local Class<BallisticDamageType> BDT;
	local Actor Victim;
	local Vector DamageHitLocation;
	local bool bHeadshot;

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
	BDT = Class<BallisticDamageType>(HitDT);
	// End:0x19B
	if((BDT != none) && BDT.default.bHeaddie)
	{
		bHeadshot = true;
	}
	TrackHit(Victim, int(Dmg), HitLocation, bHeadshot);
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

	WallPenForce = int(WallPenetrationForce);
	BW.UpdatePenetrationStatus(0);
	dist = TraceRange.Min + (FRand() * (TraceRange.Max - TraceRange.Min));
	Start = InitialStart;
	X = Normal(Vector(Dir));
	End = Start + (X * dist);
	LastHitLoc = End;
	Weapon.bTraceWater = true;
	J0x98:

	// End:0x5A9 [Loop If]
	if(dist > float(0))
	{
		BW.UpdatePenetrationStatus(WallCount);
		Other = Trace(HitLocation, HitNormal, End, Start, true,, HitMaterial);
		Weapon.bTraceWater = false;
		dist -= VSize(HitLocation - Start);
		// End:0x151
		if((int(Level.NetMode) == int(NM_Client)) && (int(Other.Role) != int(ROLE_Authority)) || Other.bWorldGeometry)
		{
			// [Explicit Break]
			goto J0x5A9;
		}
		// End:0x16A
		if(Other == none)
		{
			LastHitLoc = End;
			// [Explicit Break]
			goto J0x5A9;
		}
		// End:0x216
		if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
		{
			// End:0x1C6
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
			// End:0x36C
			if(!Other.bWorldGeometry && Other != LastOther)
			{
				OnTraceHit(Other, HitLocation, InitialStart, X, PenCount, WallCount, WallPenForce, WaterHitLoc);
				LastOther = Other;
				// End:0x320
				if(CanPenetrate(Other, HitLocation, X, PenCount))
				{
					PenCount++;
					Start = HitLocation + ((X * Other.CollisionRadius) * float(2));
					End = Start + (X * dist);
					Weapon.bTraceWater = true;
					// End:0x31A
					if(Vehicle(Other) != none)
					{
						HitVehicleEffect(HitLocation, HitNormal, Other);
					}
					goto J0x5A6;					
				}
				else
				{
					// End:0x359
					if(Vehicle(Other) != none)
					{
						bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);						
					}
					else
					{
						// End:0x36C
						if(Mover(Other) == none)
						{
							// [Explicit Break]
							goto J0x5A9;
						}
					}
				}
			}
			// End:0x527
			if(Other.bWorldGeometry || Mover(Other) != none)
			{
				WallCount++;
				// End:0x400
				if(Other.bCanBeDamaged)
				{
					bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);
					OnTraceHit(Other, HitLocation, InitialStart, X, PenCount, WallCount, WallPenForce, WaterHitLoc);
					// [Explicit Break]
					goto J0x5A9;
				}
				// End:0x4FE
				if(((WallCount < 5) && WallPenForce > 0) && Class'BCoreProV55.WallPenetrationUtil'.static.GoThroughWall(Weapon, Instigator, HitLocation, HitNormal, float(WallPenForce) * (SurfaceScale(Class'BCoreProV55.WallPenetrationUtil'.static.GetSurfaceType(Other, HitMaterial))), X, Start, ExitNormal, ExitMaterial))
				{
					WallPenForce -= int(VSize(Start - HitLocation) / (SurfaceScale(Class'BCoreProV55.WallPenetrationUtil'.static.GetSurfaceType(Other, HitMaterial))));
					WallPenetrateEffect(Other, HitLocation, HitNormal, HitMaterial);
					WallPenetrateEffect(Other, Start, ExitNormal, ExitMaterial, true);
					Weapon.bTraceWater = true;
					// [Explicit Continue]
					goto J0x5A6;
				}
				bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);
				// [Explicit Break]
				goto J0x5A9;
			}
			// End:0x5A3
			if((Other == Instigator) || Other == LastOther)
			{
				Start = HitLocation + (X * FMax(32.0000000, Other.CollisionRadius * float(2)));
				End = Start + (X * dist);
				Weapon.bTraceWater = true;				
			}
			else
			{
				// [Explicit Break]
				goto J0x5A9;
			}
		}
		J0x5A6:

		// [Loop Continue]
		goto J0x98;
	}
	J0x5A9:

	// End:0x5CE
	if(!bHitWall)
	{
		NoHitEffect(X, InitialStart, LastHitLoc, WaterHitLoc);
	}
	//return;	
}

function TrackHit(Actor Target, int Damage, Vector HitLocation, bool bHeadshot)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x3D [Loop If]
	if((i < HitActorInfos.Length) && HitActorInfos[i].HitActor != Target)
	{
		++i;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0x86
	if(i == HitActorInfos.Length)
	{
		HitActorInfos.Insert(HitActorInfos.Length, 1);
		HitActorInfos[i].HitActor = Target;
		HitActorInfos[i].LastHitLocation = HitLocation;
	}
	// End:0xAF
	if((MaxHits > 0) && HitActorInfos[i].TotalHits == MaxHits)
	{
		return;
	}
	HitActorInfos[i].Damage += Damage;
	++HitActorInfos[i].TotalHits;
	// End:0xF3
	if(bHeadshot)
	{
		++HitActorInfos[i].HeadHits;
	}
	//return;	
}

function ApplyHits()
{
	local int i;
	local Vector MomentumDir;
	local Class<DamageType> HitDamageType;

	i = 0;
	J0x07:

	// End:0xFF [Loop If]
	if(i < HitActorInfos.Length)
	{
		// End:0x4E
		if((HitActorInfos[i].HeadHits * 2) >= HitActorInfos[i].TotalHits)
		{
			HitDamageType = DamageTypeHead;			
		}
		else
		{
			HitDamageType = DamageType;
		}
		MomentumDir = Normal(HitActorInfos[i].LastHitLocation - Instigator.Location);
		ApplyDamage(HitActorInfos[i].HitActor, HitActorInfos[i].Damage, Instigator, HitActorInfos[i].LastHitLocation, (MomentumDir * float(KickForce)) * float(HitActorInfos[i].TotalHits), HitDamageType);
		HitActorInfos[i].HitActor = none;
		++i;
		// [Loop Continue]
		goto J0x07;
	}
	HitActorInfos.Remove(0, HitActorInfos.Length);
	//return;	
}

function NoHitEffect(Vector Dir, optional Vector Start, optional Vector HitLocation, optional Vector WaterHitLoc)
{
	local Vector V;

	V = (Instigator.Location + Instigator.EyePosition()) + (Dir * TraceRange.Min);
	// End:0x109
	if(((((TracerClass != none) && int(Level.DetailMode) > int(0)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0) && VSize(V - BallisticAttachment(Weapon.ThirdPersonActor).GetModeTipLocation()) > float(200)) && FRand() < TracerChance)
	{
		Spawn(TracerClass, Instigator,, BallisticAttachment(Weapon.ThirdPersonActor).GetModeTipLocation(), Rotator(V - BallisticAttachment(Weapon.ThirdPersonActor).GetModeTipLocation()));
	}
	// End:0x195
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
	// End:0xF9
	if((ImpactManager == none) || !Weapon.EffectIsRelevant(HitLocation, false))
	{
		return false;
	}
	// End:0x114
	if(Vehicle(Other) != none)
	{
		Surf = 3;		
	}
	else
	{
		// End:0x138
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
	// End:0x242
	if(((((TracerClass != none) && int(Level.DetailMode) > int(0)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0) && VSize(HitLocation - BallisticAttachment(Weapon.ThirdPersonActor).GetModeTipLocation()) > float(200)) && FRand() < TracerChance)
	{
		Spawn(TracerClass, Instigator,, BallisticAttachment(Weapon.ThirdPersonActor).GetModeTipLocation(), Rotator(HitLocation - BallisticAttachment(Weapon.ThirdPersonActor).GetModeTipLocation()));
	}
	return true;
	//return;	
}

defaultproperties
{
	TracerChance=0.5000000
	TraceRange=(Min=500.0000000,Max=2000.0000000)
	FireSpreadMode=1
}
