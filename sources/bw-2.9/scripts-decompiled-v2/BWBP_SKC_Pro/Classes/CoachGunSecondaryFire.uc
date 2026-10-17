class CoachGunSecondaryFire extends BallisticProShotgunFire;

var() Actor MuzzleFlash2;
var() Vector SpawnOffset;
var Projectile proj;

event ModeDoFire()
{
	// End:0x7D
	if(AllowFire())
	{
		// End:0x51
		if(!CoachGun(Weapon).bLeftLoaded)
		{
			CoachGun(Weapon).bRightLoaded = false;
			FireAnim = 'SightFire';
			AimedFireAnim = 'SightFire';			
		}
		else
		{
			CoachGun(Weapon).bLeftLoaded = false;
			FireAnim = 'SightFire';
			AimedFireAnim = 'SightFire';
		}
	}
	super.ModeDoFire();
	//return;	
}

simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
{
	BallisticAttachment(Weapon.ThirdPersonActor).BallisticUpdateHit(Other, HitLocation, HitNormal, Surf, CoachGun(Weapon).bRightLoaded, WaterHitLoc);
	//return;	
}

function EjectBrass()
{
	BrassBone = 'EjectorL';
	BrassClass = Class'BallisticProV55.Brass_M290Left';
	super(BallisticFire).EjectBrass();
	BrassBone = 'EjectorR';
	BrassClass = Class'BallisticProV55.Brass_M290Right';
	super(BallisticFire).EjectBrass();
	//return;	
}

function InitEffects()
{
	super(BallisticFire).InitEffects();
	// End:0x6A
	if((MuzzleFlashClass != none) && (MuzzleFlash2 == none) || MuzzleFlash2.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash2, MuzzleFlashClass, Weapon.DrawScale * FlashScaleFactor, Weapon, 'tip2');
	}
	//return;	
}

function FlashMuzzleFlash()
{
	local Coords C;
	local Actor MuzzleSmoke;
	local Vector Start, X, Y, Z;

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
	// End:0xD0
	if(!CoachGun(Weapon).bRightLoaded && MuzzleFlash2 != none)
	{
		C = Weapon.GetBoneCoords('tip2');
		MuzzleFlash2.Trigger(Weapon, Instigator);		
	}
	else
	{
		// End:0x10E
		if(MuzzleFlash != none)
		{
			C = Weapon.GetBoneCoords('tip');
			MuzzleFlash.Trigger(Weapon, Instigator);
		}
	}
	// End:0x124
	if(!Class'BCoreProV55.BallisticMod'.default.bMuzzleSmoke)
	{
		return;
	}
	Weapon.GetViewAxes(X, Y, Z);
	Start = (C.Origin + (X * float(-180))) + (Y * float(3));
	MuzzleSmoke = Spawn(Class'BallisticProV55.MRT6Smoke', Weapon,, Start, Rotator(X));
	// End:0x1A3
	if(!bBrassOnCock)
	{
		EjectBrass();
	}
	//return;	
}

simulated state Projectile
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
		local Vector Start, X, Y, Z, End, HitLocation,
			HitNormal, StartTrace;

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
		End = Start + (Vector(Aim) * SpawnOffset.X);
		Other = Weapon.Trace(HitLocation, HitNormal, End, Start, false);
		// End:0x13A
		if(Other != none)
		{
			StartTrace = HitLocation;
		}
		End = Start + (Vector(Aim) * (MaxRange()));
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x196
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
		// End:0x3C
		if(proj != none)
		{
			proj.Instigator = Instigator;
		}
		//return;		
	}
	stop;	
}

simulated state ShotgunZap
{
	simulated function ApplyFireEffectParams(FireEffectParams Params)
	{
		local ShotgunEffectParams effect_params;

		super(BallisticProShotgunFire).ApplyFireEffectParams(Params);
		effect_params = ShotgunEffectParams(Params);
		HipSpreadFactor = effect_params.HipSpreadFactor;
		KickForce = 4500;
		MaxWaterTraceRange = 9000.0000000;
		//return;		
	}

	function DoFireEffect()
	{
		local Vector StartTrace;
		local Rotator R, Aim;
		local int i;

		Aim = GetFireAim(StartTrace);
		// End:0x39
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			BW.RewindCollisions();
		}
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
	stop;	
}

simulated state ShotgunHE
{
	simulated function ApplyFireEffectParams(FireEffectParams Params)
	{
		local ShotgunEffectParams effect_params;

		super(BallisticProShotgunFire).ApplyFireEffectParams(Params);
		effect_params = ShotgunEffectParams(Params);
		HipSpreadFactor = effect_params.HipSpreadFactor;
		CoachGunAttachment(Weapon.ThirdPersonActor).SwitchWeaponMode(0);
		//return;		
	}

	function DoFireEffect()
	{
		local Vector StartTrace;
		local Rotator R, Aim;
		local int i;

		Aim = GetFireAim(StartTrace);
		// End:0x39
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			BW.RewindCollisions();
		}
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
		// End:0x106
		if(BallisticShotgunAttachment(Weapon.ThirdPersonActor) != none)
		{
			BallisticShotgunAttachment(Weapon.ThirdPersonActor).XInaccuracy = GetXInaccuracy();
			BallisticShotgunAttachment(Weapon.ThirdPersonActor).YInaccuracy = GetYInaccuracy();
		}
		SendFireEffect(none, Vector(Aim) * TraceRange.Max, StartTrace, 0);
		super(BallisticFire).DoFireEffect();
		ApplyHits();
		//return;		
	}

	function ApplyDamage(Actor Target, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
	{
		super(BallisticInstantFire).ApplyDamage(Target, Damage, Instigator, HitLocation, MomentumDir, DamageType);
		// End:0x6A
		if(Target.bProjTarget)
		{
			BW.TargetedHurtRadius(float(Damage), 512.0000000, Class'BWBP_SKC_Pro.DT_CoachGunExplosive', 200.0000000, HitLocation, Pawn(Target));
		}
		//return;		
	}
	stop;	
}

simulated state ShotgunIncendiary
{
	simulated function ApplyFireEffectParams(FireEffectParams Params)
	{
		local ShotgunEffectParams effect_params;

		super(BallisticProShotgunFire).ApplyFireEffectParams(Params);
		effect_params = ShotgunEffectParams(Params);
		HipSpreadFactor = effect_params.HipSpreadFactor;
		//return;		
	}

	function CoachGunFireControl GetFireControl()
	{
		return CoachGun(Weapon).GetFireControl();
		//return;		
	}

	function DoFireEffect()
	{
		local Vector Start, Dir, End, HitLocation, HitNormal;

		local Rotator R, Aim;
		local Actor Other;
		local float dist, NodeDist, DR;
		local int i;

		Aim = GetFireAim(Start);
		// End:0x39
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			BW.RewindCollisions();
		}
		i = 0;
		J0x40:

		// End:0x7F [Loop If]
		if(i < TraceCount)
		{
			R = Rotator((GetFireSpread()) >> Aim);
			DoTrace(Start, R);
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
		Start = Instigator.Location + Instigator.EyePosition();
		Aim = GetFireAim(Start);
		Aim = Rotator((GetFireSpread()) >> Aim);
		Dir = Vector(Aim);
		End = Start + (Dir * (MaxRange()));
		Weapon.bTraceWater = true;
		i = 0;
		J0x197:

		// End:0x286 [Loop If]
		if(i < 20)
		{
			Other = Trace(HitLocation, HitNormal, End, Start, true);
			// End:0x247
			if((((((Other == none) || Other.bWorldGeometry) || Mover(Other) != none) || Vehicle(Other) != none) || FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
			{
				// [Explicit Break]
				goto J0x286;
			}
			Start = HitLocation + (Dir * FMax(32.0000000, (Other.CollisionRadius * float(2)) + float(4)));
			i++;
			// [Loop Continue]
			goto J0x197;
		}
		J0x286:

		Weapon.bTraceWater = false;
		// End:0x2AD
		if(Other == none)
		{
			HitLocation = End;
		}
		// End:0x2EF
		if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
		{
			Other = none;
		}
		i = 0;
		J0x2F6:

		// End:0x3CB [Loop If]
		if(i < TraceCount)
		{
			R = Rotator((GetFireSpread()) >> Aim);
			// End:0x38A
			if((Other != none) && Other.bWorldGeometry || Mover(Other) != none)
			{
				GetFireControl().FireShotRotated(Start, HitLocation, dist, Other != none, HitNormal, Instigator, Other, R);
				// [Explicit Continue]
				goto J0x3C1;
			}
			GetFireControl().FireShotRotated(Start, HitLocation, dist, Other != none, HitNormal, Instigator, none, R);
			J0x3C1:

			i++;
			// [Loop Continue]
			goto J0x2F6;
		}
		dist = VSize(HitLocation - Start);
		i = 0;
		J0x3E6:

		// End:0x5B9 [Loop If]
		if(i < GetFireControl().GasNodes.Length)
		{
			// End:0x484
			if((GetFireControl().GasNodes[i] == none) || ((RX22AGasCloud(GetFireControl().GasNodes[i]) == none) && RX22AGasPatch(GetFireControl().GasNodes[i]) == none) && RX22AGasSoak(GetFireControl().GasNodes[i]) == none)
			{
				// [Explicit Continue]
				goto J0x5AF;
			}
			NodeDist = VSize(GetFireControl().GasNodes[i].Location - Start);
			// End:0x4C3
			if(NodeDist > dist)
			{
				// [Explicit Continue]
				goto J0x5AF;
			}
			DR = Dir Dot Normal(GetFireControl().GasNodes[i].Location - Start);
			// End:0x509
			if(DR < 0.7500000)
			{
				// [Explicit Continue]
				goto J0x5AF;
			}
			NodeDist = VSize(GetFireControl().GasNodes[i].Location - (Start + (Dir * (DR * NodeDist))));
			// End:0x5AF
			if(NodeDist < float(128))
			{
				GetFireControl().GasNodes[i].TakeDamage(5, Instigator, GetFireControl().GasNodes[i].Location, vect(0.0000000, 0.0000000, 0.0000000), Class'BallisticProV55.DTRX22ABurned');
			}
			J0x5AF:

			i++;
			// [Loop Continue]
			goto J0x3E6;
		}
		SendFireEffect(none, Vector(Aim) * TraceRange.Max, Start, 0);
		super(BallisticFire).DoFireEffect();
		//return;		
	}
	stop;	
}

defaultproperties
{
	HipSpreadFactor=1.0000000
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2560.0000000,Max=2560.0000000)
	DamageType=Class'BWBP_SKC_Pro.DT_CoachShot'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachShot'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachShot'
	KickForce=600
	PenetrateForce=100
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_M290Left'
	BrassBone="EjectorR"
	bBrassOnCock=true
	BrassOffset=(X=-30.0000000,Y=-5.0000000,Z=5.0000000)
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=2.0000000
	FireRecoil=768.0000000
	FirePushbackForce=600.0000000
	FireChaos=0.2500000
	XInaccuracy=256.0000000
	YInaccuracy=256.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.Redwood.Redwood-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireAnim="SightFire"
	FireRate=0.4000000
	AmmoClass=Class'BallisticProV55.Ammo_MRS138Shells'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-12.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
}
