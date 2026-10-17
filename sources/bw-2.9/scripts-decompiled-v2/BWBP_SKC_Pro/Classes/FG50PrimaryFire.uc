class FG50PrimaryFire extends BallisticProInstantFire;

var() Sound SpecialFireSound;
var Actor Heater;

simulated function bool AllowFire()
{
	// End:0x41
	if(((FG50MachineGun(Weapon).HeatLevel >= float(10)) && !Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassic()) || !super(BallisticFire).AllowFire())
	{
		return false;
	}
	return true;
	//return;	
}

simulated state HEAmmo
{
	function DoTrace(Vector InitialStart, Rotator Dir)
	{
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

		// End:0x363 [Loop If]
		if(dist > float(0))
		{
			Other = Trace(HitLocation, HitNormal, End, Start, true,, HitMaterial);
			Weapon.bTraceWater = false;
			dist -= VSize(HitLocation - Start);
			// End:0x120
			if((int(Level.NetMode) == int(NM_Client)) && (int(Other.Role) != int(ROLE_Authority)) || Other.bWorldGeometry)
			{
				// [Explicit Break]
				goto J0x363;
			}
			// End:0x352
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
					goto J0x360;
				}
				LastHitLoc = HitLocation;
				// End:0x283
				if(!Other.bWorldGeometry && Other != LastOther)
				{
					OnTraceHit(Other, HitLocation, InitialStart, X, 0, 0, 0, WaterHitLoc);
					LastOther = Other;
					// End:0x270
					if(Pawn(Other) != none)
					{
						bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);
						// [Explicit Break]
						goto J0x363;						
					}
					else
					{
						// End:0x283
						if(Mover(Other) == none)
						{
							// [Explicit Break]
							goto J0x363;
						}
					}
				}
				// End:0x2D0
				if(Other.bWorldGeometry || Mover(Other) != none)
				{
					bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);
					// [Explicit Break]
					goto J0x363;
				}
				// End:0x34C
				if((Other == Instigator) || Other == LastOther)
				{
					Start = HitLocation + (X * FMax(32.0000000, Other.CollisionRadius * float(2)));
					End = Start + (X * dist);
					Weapon.bTraceWater = true;
					// [Explicit Continue]
					goto J0x360;
				}
				// [Explicit Break]
				goto J0x363;				
			}
			else
			{
				LastHitLoc = End;
				// [Explicit Break]
				goto J0x363;
			}
			J0x360:

			// [Loop Continue]
			goto J0x7B;
		}
		J0x363:

		// End:0x388
		if(!bHitWall)
		{
			NoHitEffect(X, InitialStart, LastHitLoc, WaterHitLoc);
		}
		//return;		
	}

	simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
	{
		local int Surf;

		// End:0x55
		if(((!Other.bWorldGeometry && Mover(Other) == none) && Pawn(Other) == none) || int(Level.NetMode) == int(NM_Client))
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

	function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
	{
		super(BallisticInstantFire).ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
		// End:0xB1
		if(Victim.bProjTarget)
		{
			// End:0x7D
			if(BallisticShield(Victim) != none)
			{
				BW.TargetedHurtRadius(float(Damage), 192.0000000, Class'BWBP_SKC_Pro.DT_FG50Explosion', 500.0000000, HitLocation, Pawn(Victim));				
			}
			else
			{
				BW.TargetedHurtRadius(float(Damage), 512.0000000, Class'BWBP_SKC_Pro.DT_FG50Explosion', 500.0000000, HitLocation, Pawn(Victim));
			}
		}
		//return;		
	}
	stop;	
}

simulated state IncAmmo
{
	function PlayFiring()
	{
		super(BallisticFire).PlayFiring();
		FG50MachineGun(BW).AddHeat(HeatPerShot);
		//return;		
	}

	function DoFireEffect()
	{
		super(BallisticInstantFire).DoFireEffect();
		// End:0x38
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			FG50MachineGun(BW).AddHeat(HeatPerShot);
		}
		//return;		
	}

	simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
	{
		local int Surf;

		// End:0x55
		if(((!Other.bWorldGeometry && Mover(Other) == none) && Pawn(Other) == none) || int(Level.NetMode) == int(NM_Client))
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
		// End:0xF1
		if((Other == none) || Other.bWorldGeometry)
		{
			BW.TargetedHurtRadius(5.0000000, 96.0000000, Class'BWBP_SKC_Pro.DT_FG50Explosion', 50.0000000, HitLocation);
		}
		SendFireEffect(Other, HitLocation, HitNormal, Surf, WaterHitLoc);
		// End:0x12C
		if(!bAISilent)
		{
			Instigator.MakeNoise(1.0000000);
		}
		return true;
		//return;		
	}

	simulated function InitEffects()
	{
		// End:0x1B
		if(AIController(Instigator.Controller) != none)
		{
			return;
		}
		// End:0x72
		if((Heater == none) || Heater.bDeleteMe)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Heater, Class'BWBP_SKC_Pro.FG50Heater', Weapon.DrawScale * FlashScaleFactor, Weapon, 'tip3');
		}
		FG50Heater(Heater).SetHeat(0.0000000);
		FG50MachineGun(Weapon).Heater = FG50Heater(Heater);
		super(BallisticFire).InitEffects();
		//return;		
	}
	stop;	
}

simulated state APAmmo
{
	function PlayFiring()
	{
		super(BallisticFire).PlayFiring();
		FG50MachineGun(BW).AddHeat(HeatPerShot);
		//return;		
	}

	function DoFireEffect()
	{
		super(BallisticInstantFire).DoFireEffect();
		// End:0x38
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			FG50MachineGun(BW).AddHeat(HeatPerShot);
		}
		//return;		
	}

	simulated function InitEffects()
	{
		// End:0x1B
		if(AIController(Instigator.Controller) != none)
		{
			return;
		}
		// End:0x72
		if((Heater == none) || Heater.bDeleteMe)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Heater, Class'BWBP_SKC_Pro.FG50Heater', Weapon.DrawScale * FlashScaleFactor, Weapon, 'tip3');
		}
		FG50Heater(Heater).SetHeat(0.0000000);
		FG50MachineGun(Weapon).Heater = FG50Heater(Heater);
		super(BallisticFire).InitEffects();
		//return;		
	}
	stop;	
}

defaultproperties
{
	SpecialFireSound=Sound'BWBP_SKC_Sounds.X82.X82-Fire2'
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	DamageType=Class'BWBP_SKC_Pro.DT_FG50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_FG50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_FG50Limb'
	KickForce=1000
	PenetrateForce=150
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8000000
	BrassClass=Class'BWBP_SKC_Pro.Brass_BMGInc'
	BrassBone="tip"
	BrassOffset=(X=-80.0000000,Y=1.0000000,Z=0.0000000)
	bCockAfterEmpty=true
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.FG50FlashEmitter'
	AimedFireAnim="SGCFireAimed"
	FireRecoil=512.0000000
	FirePushbackForce=150.0000000
	FireChaos=0.2000000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.2400000,OutVal=1.0000000),(InVal=0.3500000,OutVal=1.5000000),(InVal=0.6600000,OutVal=2.2500000),(InVal=1.0000000,OutVal=3.5000000)))
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.AS50.FG50-Fire',Volume=7.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireAnimRate=2.4000000
	FireRate=0.2300000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_50IncDrum'
	ShakeRotMag=(X=512.0000000,Y=512.0000000,Z=0.0000000)
	ShakeRotRate=(X=20000.0000000,Y=20000.0000000,Z=20000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-400.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	WarnTargetPct=0.4000000
	aimerror=900.0000000
}
