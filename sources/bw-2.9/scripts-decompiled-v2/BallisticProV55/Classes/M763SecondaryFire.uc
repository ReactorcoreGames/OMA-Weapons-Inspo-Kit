class M763SecondaryFire extends BallisticProInstantFire;

var() Vector SpawnOffset;
var Projectile proj;

simulated function bool AllowFire()
{
	// End:0x0D
	if(!CheckReloading())
	{
		return false;
	}
	// End:0x1A
	if(!CheckWeaponMode())
	{
		return false;
	}
	// End:0x35
	if(!M763Shotgun(BW).bAltLoaded)
	{
		return false;
	}
	return true;
	//return;	
}

simulated function ModeDoFire()
{
	super.ModeDoFire();
	M763Shotgun(BW).bAltLoaded = false;
	M763Shotgun(BW).PrepPriFire();
	//return;	
}

simulated state GasSpray
{
	function DoTrace(Vector InitialStart, Rotator Dir)
	{
		local int PenCount, WallCount;
		local Vector End, X, HitLocation, HitNormal, Start, WaterHitLoc,
			LastHitLoc;

		local Material HitMaterial;
		local float dist;
		local Actor Other, LastOther;
		local bool bHitWall;

		dist = TraceRange.Min + (FRand() * (TraceRange.Max - TraceRange.Min));
		Start = InitialStart;
		X = Normal(Vector(Dir));
		End = Start + (X * dist);
		LastHitLoc = End;
		Weapon.bTraceWater = true;
		J0x7B:

		// End:0x410 [Loop If]
		if(dist > float(0))
		{
			Other = Trace(HitLocation, HitNormal, End, Start, true,, HitMaterial);
			Weapon.bTraceWater = false;
			dist -= VSize(HitLocation - Start);
			// End:0x120
			if((int(Level.NetMode) == int(NM_Client)) && (int(Other.Role) != int(ROLE_Authority)) || Other.bWorldGeometry)
			{
				// [Explicit Break]
				goto J0x410;
			}
			// End:0x3FF
			if(Other != none)
			{
				// End:0x1D7
				if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
				{
					// End:0x187
					if(VSize(HitLocation - Start) > float(1))
					{
						WaterHitLoc = HitLocation;
					}
					Start = HitLocation;
					dist = float(Min(int(dist), int(MaxWaterTraceRange)));
					End = Start + (X * dist);
					Weapon.bTraceWater = false;
					// [Explicit Continue]
					goto J0x40D;
				}
				LastHitLoc = HitLocation;
				// End:0x329
				if(!Other.bWorldGeometry && Other != LastOther)
				{
					OnTraceHit(Other, HitLocation, InitialStart, X, PenCount, WallCount, 0, WaterHitLoc);
					LastOther = Other;
					// End:0x2DD
					if(CanPenetrate(Other, HitLocation, X, PenCount))
					{
						PenCount++;
						Start = HitLocation + ((X * Other.CollisionRadius) * float(2));
						End = Start + (X * dist);
						Weapon.bTraceWater = true;
						// End:0x2D7
						if(Vehicle(Other) != none)
						{
							HitVehicleEffect(HitLocation, HitNormal, Other);
						}
						goto J0x40D;						
					}
					else
					{
						// End:0x316
						if(Vehicle(Other) != none)
						{
							bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);							
						}
						else
						{
							// End:0x329
							if(Mover(Other) == none)
							{
								// [Explicit Break]
								goto J0x410;
							}
						}
					}
				}
				// End:0x37D
				if(Other.bWorldGeometry || Mover(Other) != none)
				{
					WallCount++;
					bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);
					// [Explicit Break]
					goto J0x410;
				}
				// End:0x3F9
				if((Other == Instigator) || Other == LastOther)
				{
					Start = HitLocation + (X * FMax(32.0000000, Other.CollisionRadius * float(2)));
					End = Start + (X * dist);
					Weapon.bTraceWater = true;
					// [Explicit Continue]
					goto J0x40D;
				}
				// [Explicit Break]
				goto J0x410;				
			}
			else
			{
				LastHitLoc = End;
				// [Explicit Break]
				goto J0x410;
			}
			J0x40D:

			// [Loop Continue]
			goto J0x7B;
		}
		J0x410:

		// End:0x435
		if(!bHitWall)
		{
			NoHitEffect(X, InitialStart, LastHitLoc, WaterHitLoc);
		}
		M763Shotgun(BW).gc.SpawnColliders(InitialStart, LastHitLoc);
		//return;		
	}

	simulated function Vector GetFireSpread()
	{
		local float fX;
		local Rotator R;

		// End:0x19
		if(BW.bScopeView)
		{
			return super(BallisticProInstantFire).GetFireSpread();
		}
		fX = FRand();
		R.Yaw = int((float(512) * Sin(FMin(Sqrt(FRand()), 1.0000000) * 1.5707960)) * Sin(fX * 1.5707960));
		// End:0x7E
		if(FRand() > 0.5000000)
		{
			R.Yaw = -R.Yaw;
		}
		R.Pitch = int((float(512) * Sin(FMin(Sqrt(FRand()), 1.0000000) * 1.5707960)) * Cos(fX * 1.5707960));
		// End:0xDB
		if(FRand() > 0.5000000)
		{
			R.Pitch = -R.Pitch;
		}
		return Vector(R);
		//return;		
	}

	function bool CanPenetrate(Actor Other, Vector HitLocation, Vector Dir, int PenCount)
	{
		return true;
		//return;		
	}
	stop;	
}

simulated state GasSlug
{
	simulated function ApplyFireEffectParams(FireEffectParams Params)
	{
		local ProjectileEffectParams effect_params;

		super(BallisticFire).ApplyFireEffectParams(Params);
		effect_params = ProjectileEffectParams(Params);
		ProjectileClass = effect_params.ProjectileClass;
		SpawnOffset = effect_params.SpawnOffset;
		default.ProjectileClass = effect_params.ProjectileClass;
		default.SpawnOffset = effect_params.SpawnOffset;
		//return;		
	}

	function float MaxRange()
	{
		// End:0x155
		if(ProjectileClass.default.MaxSpeed > ProjectileClass.default.Speed)
		{
			// End:0xFE
			if((Class<BallisticProjectile>(ProjectileClass) != none) && Class<BallisticProjectile>(ProjectileClass).default.AccelSpeed > float(0))
			{
				// End:0xA7
				if(ProjectileClass.default.LifeSpan <= float(0))
				{
					return FMin(ProjectileClass.default.MaxSpeed, (ProjectileClass.default.Speed + (Class<BallisticProjectile>(ProjectileClass).default.AccelSpeed * float(2))) * float(2));					
				}
				else
				{
					return FMin(ProjectileClass.default.MaxSpeed, (ProjectileClass.default.Speed + (Class<BallisticProjectile>(ProjectileClass).default.AccelSpeed * ProjectileClass.default.LifeSpan)) * ProjectileClass.default.LifeSpan);
				}				
			}
			else
			{
				// End:0x12C
				if(ProjectileClass.default.LifeSpan <= float(0))
				{
					return ProjectileClass.default.MaxSpeed * float(2);					
				}
				else
				{
					return (ProjectileClass.default.MaxSpeed * ProjectileClass.default.LifeSpan) * 0.7500000;
				}
			}			
		}
		else
		{
			// End:0x183
			if(ProjectileClass.default.LifeSpan <= float(0))
			{
				return ProjectileClass.default.Speed * float(2);				
			}
			else
			{
				return ProjectileClass.default.Speed * ProjectileClass.default.LifeSpan;
			}
		}
		//return;		
	}

	function DoFireEffect()
	{
		local Vector StartTrace, X, Y, Z, Start, End,
			HitLocation, HitNormal;

		local Rotator Aim;
		local Actor Other;

		Weapon.GetViewAxes(X, Y, Z);
		Start = Instigator.Location + Instigator.EyePosition();
		StartTrace = (Start + (X * SpawnOffset.X)) + (Z * SpawnOffset.Z);
		// End:0xB6
		if(!Weapon.WeaponCentered())
		{
			StartTrace = StartTrace + ((Weapon.hand * Y) * SpawnOffset.Y);
		}
		Aim = GetFireAim(StartTrace);
		Aim = Rotator((GetFireSpread()) >> Aim);
		End = Start + (Vector(Aim) * (MaxRange()));
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x139
		if(Other != none)
		{
			Aim = Rotator(HitLocation - StartTrace);
		}
		SpawnProjectile(StartTrace, Aim);
		SendFireEffect(none, vect(0.0000000, 0.0000000, 0.0000000), StartTrace, 0);
		super(BallisticFire).DoFireEffect();
		//return;		
	}

	function SpawnProjectile(Vector Start, Rotator Dir)
	{
		proj = Spawn(ProjectileClass,,, Start, Dir);
		proj.Instigator = Instigator;
		//return;		
	}
	stop;	
}

defaultproperties
{
	SpawnOffset=(X=0.0000000,Y=20.0000000,Z=-20.0000000)
	TraceRange=(Min=768.0000000,Max=768.0000000)
	Damage=35.0000000
	RangeAtten=0.2500000
	DamageType=Class'BallisticProV55.DTM763Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM763ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM763Shotgun'
	PenetrateForce=100
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Shotgun'
	BrassOffset=(X=-1.0000000,Y=0.0000000,Z=-1.0000000)
	bUseWeaponMag=false
	FlashScaleFactor=2.0000000
	AimedFireAnim="FireCombinedSight"
	FireRecoil=1280.0000000
	FireChaos=0.5000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Fire1',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	FireAnim="FireCombined"
	FireEndAnim="None"
	FireAnimRate=1.1000000
	FireRate=0.7500000
	AmmoClass=Class'BallisticProV55.Ammo_12GaugeGas'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-300.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BallisticProV55.M763GasSlug'
	BotRefireRate=0.3000000
	WarnTargetPct=0.7500000
}
