class CYLOSecondaryFire extends BallisticProShotgunFire;

var() Vector SpawnOffset;
var Projectile proj;

function CYLOFirestormFireControl GetFireControl()
{
	return CYLOUAW(Weapon).GetFireControl();
	//return;	
}

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
	// End:0x114
	if(CYLOUAW(Weapon).SGShells < 1)
	{
		// End:0xAF
		if(!bPlayedDryFire && DryFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
			bPlayedDryFire = true;
		}
		// End:0xCE
		if(bDryUncock)
		{
			CYLOUAW(BW).bAltNeedCock = true;
		}
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), 0.0000000);
		BW.EmptyFire(byte(ThisModeNum));
		return false;		
	}
	else
	{
		// End:0x12D
		if(CYLOUAW(BW).bAltNeedCock)
		{
			return false;
		}
	}
	return true;
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	super.ModeDoFire();
	CYLOUAW(Weapon).SGShells--;
	// End:0x72
	if((int(Weapon.Role) == int(ROLE_Authority)) && CYLOUAW(Weapon).SGShells == 0)
	{
		CYLOUAW(BW).bAltNeedCock = true;
	}
	//return;	
}

simulated state FireShot
{
	simulated function ApplyFireEffectParams(FireEffectParams Params)
	{
		local ShotgunEffectParams effect_params;

		super(BallisticProShotgunFire).ApplyFireEffectParams(Params);
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

	function DoFireEffect()
	{
		local Vector Start, Dir, End, HitLocation, HitNormal;

		local Rotator R, Aim;
		local Actor Other;
		local float dist, NodeDist, DR;
		local int i;

		Start = Instigator.Location + Instigator.EyePosition();
		Aim = GetFireAim(Start);
		Dir = Vector(Aim);
		End = Start + (Dir * (MaxRange()));
		Weapon.bTraceWater = true;
		i = 0;
		J0x75:

		// End:0x164 [Loop If]
		if(i < 20)
		{
			Other = Trace(HitLocation, HitNormal, End, Start, true);
			// End:0x125
			if((((((Other == none) || Other.bWorldGeometry) || Mover(Other) != none) || Vehicle(Other) != none) || FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
			{
				// [Explicit Break]
				goto J0x164;
			}
			Start = HitLocation + (Dir * FMax(32.0000000, (Other.CollisionRadius * float(2)) + float(4)));
			i++;
			// [Loop Continue]
			goto J0x75;
		}
		J0x164:

		Weapon.bTraceWater = false;
		// End:0x18B
		if(Other == none)
		{
			HitLocation = End;
		}
		// End:0x1CD
		if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
		{
			Other = none;
		}
		// End:0x1F5
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			BW.RewindCollisions();
		}
		i = 0;
		J0x1FC:

		// End:0x2E1 [Loop If]
		if(i < TraceCount)
		{
			R = Rotator((GetFireSpread()) >> Aim);
			DoTrace(Start, R);
			// End:0x2A0
			if((Other != none) && Other.bWorldGeometry || Mover(Other) != none)
			{
				GetFireControl().FireShotRotated(Start, HitLocation, dist, Other != none, HitNormal, Instigator, Other, R);
				// [Explicit Continue]
				goto J0x2D7;
			}
			GetFireControl().FireShotRotated(Start, HitLocation, dist, Other != none, HitNormal, Instigator, none, R);
			J0x2D7:

			i++;
			// [Loop Continue]
			goto J0x1FC;
		}
		// End:0x309
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			BW.RestoreCollisions();
		}
		ApplyHits();
		dist = VSize(HitLocation - Start);
		i = 0;
		J0x32A:

		// End:0x4FD [Loop If]
		if(i < GetFireControl().GasNodes.Length)
		{
			// End:0x3C8
			if((GetFireControl().GasNodes[i] == none) || ((RX22AGasCloud(GetFireControl().GasNodes[i]) == none) && RX22AGasPatch(GetFireControl().GasNodes[i]) == none) && RX22AGasSoak(GetFireControl().GasNodes[i]) == none)
			{
				// [Explicit Continue]
				goto J0x4F3;
			}
			NodeDist = VSize(GetFireControl().GasNodes[i].Location - Start);
			// End:0x407
			if(NodeDist > dist)
			{
				// [Explicit Continue]
				goto J0x4F3;
			}
			DR = Dir Dot Normal(GetFireControl().GasNodes[i].Location - Start);
			// End:0x44D
			if(DR < 0.7500000)
			{
				// [Explicit Continue]
				goto J0x4F3;
			}
			NodeDist = VSize(GetFireControl().GasNodes[i].Location - (Start + (Dir * (DR * NodeDist))));
			// End:0x4F3
			if(NodeDist < float(128))
			{
				GetFireControl().GasNodes[i].TakeDamage(5, Instigator, GetFireControl().GasNodes[i].Location, vect(0.0000000, 0.0000000, 0.0000000), Class'BWBP_SKC_Pro.DT_CYLOFirestormShotgun');
			}
			J0x4F3:

			i++;
			// [Loop Continue]
			goto J0x32A;
		}
		SendFireEffect(none, Vector(Aim) * TraceRange.Max, Start, 0);
		super(BallisticFire).DoFireEffect();
		//return;		
	}

	function NoHitEffect(Vector Dir, optional Vector Start, optional Vector HitLocation, optional Vector WaterHitLoc)
	{
		local Vector V;

		V = (Instigator.Location + Instigator.EyePosition()) + (Dir * TraceRange.Min);
		// End:0x124
		if(((((TracerClass != none) && int(Level.DetailMode) > int(0)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0) && VSize(V - BallisticAttachment(Instigator.Weapon.ThirdPersonActor).GetTipLocation()) > float(200)) && FRand() < TracerChance)
		{
			Spawn(TracerClass, Instigator,, BallisticAttachment(Instigator.Weapon.ThirdPersonActor).GetTipLocation(), Rotator(V - BallisticAttachment(Instigator.Weapon.ThirdPersonActor).GetTipLocation()));
		}
		// End:0x1B0
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
		// End:0x23E
		if((ImpactManager != none) && Weapon.EffectIsRelevant(HitLocation, false))
		{
			// End:0x110
			if(Vehicle(Other) != none)
			{
				Surf = 3;				
			}
			else
			{
				// End:0x134
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
			// End:0x23E
			if(((((TracerClass != none) && int(Level.DetailMode) > int(0)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0) && VSize(HitLocation - BallisticAttachment(Weapon.ThirdPersonActor).GetTipLocation()) > float(200)) && FRand() < TracerChance)
			{
				Spawn(TracerClass, Instigator,, BallisticAttachment(Weapon.ThirdPersonActor).GetTipLocation(), Rotator(HitLocation - BallisticAttachment(Weapon.ThirdPersonActor).GetTipLocation()));
			}
		}
		Weapon.HurtRadius(1.0000000, 128.0000000, DamageType, 1.0000000, HitLocation);
		return true;
		//return;		
	}
	stop;	
}

simulated state HESlug
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
	TraceCount=9
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=5000.0000000,Max=5000.0000000)
	DamageType=Class'BWBP_SKC_Pro.DTCYLOShotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTCYLOShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTCYLOShotgun'
	KickForce=400
	PenetrateForce=100
	bPenetrate=true
	FlashBone="Muzzle2"
	BrassClass=Class'BallisticProV55.Brass_Shotgun'
	bBrassOnCock=true
	BrassOffset=(X=-30.0000000,Y=-5.0000000,Z=5.0000000)
	bUseWeaponMag=false
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireRecoil=512.0000000
	FirePushbackForce=150.0000000
	FireChaos=0.5000000
	XInaccuracy=350.0000000
	YInaccuracy=350.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-FireSG',Volume=1.3000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	JamSound=(Sound=Sound'BW_Core_WeaponSound.Misc.ClipEnd-1',Volume=0.9000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	FireAnim="FireSG"
	FireEndAnim="None"
	FireRate=0.7000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_CYLOSG'
	AmmoPerFire=0
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-12.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.CYLOFirestormHEProjectile'
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
}
