class FM13PrimaryFire extends BallisticProShotgunFire;

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
	// End:0x10E
	if(BW.MagAmmo < AmmoPerFire)
	{
		// End:0xAE
		if(!bPlayedDryFire && DryFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
			bPlayedDryFire = true;
		}
		// End:0xC8
		if(bDryUncock)
		{
			BW.bNeedCock = true;
		}
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), 0.0000000);
		BW.EmptyFire(byte(ThisModeNum));
		return false;		
	}
	else
	{
		// End:0x125
		if(BW.bNeedReload)
		{
			return false;			
		}
		else
		{
			// End:0x152
			if(BW.bNeedCock || FM13Shotgun(BW).bAltLoaded)
			{
				return false;
			}
		}
	}
	return true;
	//return;	
}

function PlayFiring()
{
	// End:0x34
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		AimedFireAnim = 'SightfireNoCock';
		FireAnim = 'FireNoCock';		
	}
	else
	{
		AimedFireAnim = 'SightFire';
		FireAnim = 'Fire';
	}
	super(BallisticFire).PlayFiring();
	//return;	
}

function ServerPlayFiring()
{
	// End:0x34
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		AimedFireAnim = 'SightfireNoCock';
		FireAnim = 'FireNoCock';		
	}
	else
	{
		AimedFireAnim = 'SightFire';
		FireAnim = 'Fire';
	}
	super(BallisticFire).ServerPlayFiring();
	//return;	
}

simulated function DestroyEffects()
{
	// End:0x17
	if(MuzzleFlash != none)
	{
		MuzzleFlash.Destroy();
	}
	super(BallisticFire).DestroyEffects();
	//return;	
}

simulated state FireFromFireControl
{
	function FM13FireControl GetFireControl()
	{
		return FM13Shotgun(Weapon).GetFireControl();
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
		Start = Instigator.Location + Instigator.EyePosition();
		Aim = GetFireAim(Start);
		Aim = Rotator((GetFireSpread()) >> Aim);
		Dir = Vector(Aim);
		End = Start + (Dir * (MaxRange()));
		Weapon.bTraceWater = true;
		i = 0;
		J0x138:

		// End:0x227 [Loop If]
		if(i < 20)
		{
			Other = Trace(HitLocation, HitNormal, End, Start, true);
			// End:0x1E8
			if((((((Other == none) || Other.bWorldGeometry) || Mover(Other) != none) || Vehicle(Other) != none) || FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
			{
				// [Explicit Break]
				goto J0x227;
			}
			Start = HitLocation + (Dir * FMax(32.0000000, (Other.CollisionRadius * float(2)) + float(4)));
			i++;
			// [Loop Continue]
			goto J0x138;
		}
		J0x227:

		Weapon.bTraceWater = false;
		// End:0x24E
		if(Other == none)
		{
			HitLocation = End;
		}
		// End:0x290
		if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
		{
			Other = none;
		}
		i = 0;
		J0x297:

		// End:0x36C [Loop If]
		if(i < TraceCount)
		{
			R = Rotator((GetFireSpread()) >> Aim);
			// End:0x32B
			if((Other != none) && Other.bWorldGeometry || Mover(Other) != none)
			{
				GetFireControl().FireShotRotated(Start, HitLocation, dist, Other != none, HitNormal, Instigator, Other, R);
				// [Explicit Continue]
				goto J0x362;
			}
			GetFireControl().FireShotRotated(Start, HitLocation, dist, Other != none, HitNormal, Instigator, none, R);
			J0x362:

			i++;
			// [Loop Continue]
			goto J0x297;
		}
		dist = VSize(HitLocation - Start);
		i = 0;
		J0x387:

		// End:0x55A [Loop If]
		if(i < GetFireControl().GasNodes.Length)
		{
			// End:0x425
			if((GetFireControl().GasNodes[i] == none) || ((RX22AGasCloud(GetFireControl().GasNodes[i]) == none) && RX22AGasPatch(GetFireControl().GasNodes[i]) == none) && RX22AGasSoak(GetFireControl().GasNodes[i]) == none)
			{
				// [Explicit Continue]
				goto J0x550;
			}
			NodeDist = VSize(GetFireControl().GasNodes[i].Location - Start);
			// End:0x464
			if(NodeDist > dist)
			{
				// [Explicit Continue]
				goto J0x550;
			}
			DR = Dir Dot Normal(GetFireControl().GasNodes[i].Location - Start);
			// End:0x4AA
			if(DR < 0.7500000)
			{
				// [Explicit Continue]
				goto J0x550;
			}
			NodeDist = VSize(GetFireControl().GasNodes[i].Location - (Start + (Dir * (DR * NodeDist))));
			// End:0x550
			if(NodeDist < float(128))
			{
				GetFireControl().GasNodes[i].TakeDamage(5, Instigator, GetFireControl().GasNodes[i].Location, vect(0.0000000, 0.0000000, 0.0000000), Class'BallisticProV55.DTRX22ABurned');
			}
			J0x550:

			i++;
			// [Loop Continue]
			goto J0x387;
		}
		SendFireEffect(none, Vector(Aim) * TraceRange.Max, Start, 0);
		super(BallisticFire).DoFireEffect();
		//return;		
	}
	stop;	
}

simulated state FireFromImpact
{
	simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
	{
		BW.TargetedHurtRadius(5.0000000, 96.0000000, DamageType, 1.0000000, HitLocation, Pawn(Other));
		return super(BallisticShotgunFire).ImpactEffect(HitLocation, HitNormal, HitMat, Other, WaterHitLoc);
		//return;		
	}

	function ApplyDamage(Actor Target, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
	{
		local int i;
		local FM13ActorFire Burner;

		super(BallisticInstantFire).ApplyDamage(Target, Damage, Instigator, HitLocation, MomentumDir, DamageType);
		// End:0x172
		if(((Pawn(Target) != none) && Pawn(Target).Health > 0) && Vehicle(Target) == none)
		{
			i = 0;
			J0x68:

			// End:0xD5 [Loop If]
			if(i < Target.Attached.Length)
			{
				// End:0xCB
				if(FM13ActorFire(Target.Attached[i]) != none)
				{
					FM13ActorFire(Target.Attached[i]).AddFuel(2.0000000);
					// [Explicit Break]
					goto J0xD5;
				}
				i++;
				// [Loop Continue]
				goto J0x68;
			}
			J0xD5:

			// End:0x172
			if(i >= Target.Attached.Length)
			{
				Burner = Spawn(Class'BWBP_OP_Pro.FM13ActorFire', Target,, Target.Location + vect(0.0000000, 0.0000000, -30.0000000));
				Burner.Initialize(Target);
				// End:0x172
				if(Instigator != none)
				{
					Burner.Instigator = Instigator;
					Burner.InstigatorController = Instigator.Controller;
				}
			}
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	HipSpreadFactor=3.0000000
	TraceCount=10
	TracerClass=Class'BWBP_OP_Pro.TraceEmitter_ShotgunFlame'
	ImpactManager=Class'BWBP_OP_Pro.IM_FireShot'
	TraceRange=(Min=3072.0000000,Max=3072.0000000)
	DecayRange=(Min=512.0000000,Max=1562.0000000)
	Damage=10.0000000
	RangeAtten=0.1500000
	DamageType=Class'BWBP_OP_Pro.DT_FM13Shotgun'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_FM13ShotgunHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_FM13Shotgun'
	KickForce=5000
	BrassClass=Class'BallisticProV55.Brass_Shotgun'
	BrassOffset=(X=-1.0000000,Y=0.0000000,Z=-1.0000000)
	ClipFinishSound=(Sound=Sound'BWBP_OP_Sounds.FM13.FM13-Roar',Volume=1.9000000,Radius=1024.0000000,Slot=0,Pitch=0.5000000,bAtten=false,bNoOverride=true)
	MuzzleFlashClass=Class'BWBP_OP_Pro.FM13FlashEmitter'
	AimedFireAnim="FireCombinedSight"
	FireRecoil=768.0000000
	FireChaos=0.3000000
	XInaccuracy=150.0000000
	YInaccuracy=150.0000000
	BallisticFireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FM13.FM13-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireAnim="FireCombined"
	FireEndAnim="None"
	FireAnimRate=0.9000000
	FireRate=0.8500000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_8GaugeHE'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
}
