class RX22APrimaryFire extends BallisticInstantFire;

var Actor Ignition;
var Actor MuzzleFlame;
var Actor Heater;
var bool bIgnited;
var() Sound FireSoundLoop;

function float MaxRange()
{
	return 1800.0000000;
	//return;	
}

function RX22AFireControl GetFireControl()
{
	return RX22AFlamer(Weapon).GetFireControl();
	//return;	
}

function DoFireEffect()
{
	local Vector TraceStart, Start, Dir, End, HitLocation, HitNormal;

	local Rotator Aim;
	local Actor Other;
	local float dist, NodeDist, DR;
	local int i;

	TraceStart = Instigator.Location + Instigator.EyePosition();
	Aim = GetFireAim(TraceStart);
	Aim = Rotator((GetFireSpread()) >> Aim);
	Dir = Vector(Aim);
	End = TraceStart + (Dir * (MaxRange()));
	Weapon.bTraceWater = true;
	Start = TraceStart;
	i = 0;
	J0x96:

	// End:0x185 [Loop If]
	if(i < 20)
	{
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x146
		if((((((Other == none) || Other.bWorldGeometry) || Mover(Other) != none) || Vehicle(Other) != none) || FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
		{
			// [Explicit Break]
			goto J0x185;
		}
		Start = HitLocation + (Dir * FMax(32.0000000, (Other.CollisionRadius * float(2)) + float(4)));
		i++;
		// [Loop Continue]
		goto J0x96;
	}
	J0x185:

	Weapon.bTraceWater = false;
	// End:0x1AC
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x1EE
	if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
	{
		Other = none;
	}
	dist = VSize(HitLocation - TraceStart);
	i = 0;
	J0x209:

	// End:0x3DC [Loop If]
	if(i < GetFireControl().GasNodes.Length)
	{
		// End:0x2A7
		if((GetFireControl().GasNodes[i] == none) || ((RX22AGasCloud(GetFireControl().GasNodes[i]) == none) && RX22AGasPatch(GetFireControl().GasNodes[i]) == none) && RX22AGasSoak(GetFireControl().GasNodes[i]) == none)
		{
			// [Explicit Continue]
			goto J0x3D2;
		}
		NodeDist = VSize(GetFireControl().GasNodes[i].Location - TraceStart);
		// End:0x2E6
		if(NodeDist > dist)
		{
			// [Explicit Continue]
			goto J0x3D2;
		}
		DR = Dir Dot Normal(GetFireControl().GasNodes[i].Location - TraceStart);
		// End:0x32C
		if(DR < 0.7500000)
		{
			// [Explicit Continue]
			goto J0x3D2;
		}
		NodeDist = VSize(GetFireControl().GasNodes[i].Location - (TraceStart + (Dir * (DR * NodeDist))));
		// End:0x3D2
		if(NodeDist < float(128))
		{
			GetFireControl().GasNodes[i].TakeDamage(5, Instigator, GetFireControl().GasNodes[i].Location, vect(0.0000000, 0.0000000, 0.0000000), Class'BallisticProV55.DTRX22ABurned');
		}
		J0x3D2:

		i++;
		// [Loop Continue]
		goto J0x209;
	}
	// End:0x446
	if((Other != none) && Other.bWorldGeometry || Mover(Other) != none)
	{
		GetFireControl().FireShot(TraceStart, HitLocation, dist, Other != none, HitNormal, Instigator, Other);		
	}
	else
	{
		GetFireControl().FireShot(TraceStart, HitLocation, dist, Other != none, HitNormal, Instigator, none);
	}
	SendFireEffect(Other, HitLocation, HitNormal, 0);
	super(BallisticFire).DoFireEffect();
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
	// End:0x2DE
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
		// End:0x2DB
		if((InStr(Level.Game.GameName, "Freon") != -1) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo) != none)
		{
			Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo).AddFireStat(int(load), 1);
		}		
	}
	else
	{
		// End:0x2F8
		if(!BW.bScopeView)
		{
			ApplyRecoil();
		}
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x342
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
	// End:0x38E
	if(bFireOnRelease)
	{
		// End:0x370
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
	// End:0x412
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x48C
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
		// End:0x48C
		if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
		{
			BW.bNeedCock = true;
		}
	}
	//return;	
}

function PlayFiring()
{
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0x31
	if(FireSoundLoop != none)
	{
		Weapon.AmbientSound = FireSoundLoop;
	}
	// End:0xE6
	if((Ignition != none) && !bIgnited)
	{
		BW.SafeLoopAnim(FireLoopAnim, FireAnimRate, TweenTime,, "FIRE");
		Ignition.Trigger(Weapon, Instigator);
		bIgnited = true;
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	// End:0x129
	if(MuzzleFlame == none)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlame, Class'BallisticProV55.RX22AMuzzleFlame', Weapon.DrawScale * FlashScaleFactor, Weapon, 'tip');
	}
	//return;	
}

function ServerPlayFiring()
{
	// End:0x6A
	if(!bIgnited)
	{
		bIgnited = true;
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x39
	if(!super(BallisticFire).AllowFire() || Instigator.HeadVolume.bWaterVolume)
	{
		// End:0x37
		if(bIgnited)
		{
			StopFiring();
		}
		return false;
	}
	return true;
	//return;	
}

function StopFiring()
{
	bIgnited = false;
	RX22AFlamer(Weapon).AmbientSound = none;
	// End:0x43
	if(MuzzleFlame != none)
	{
		Emitter(MuzzleFlame).Kill();
		MuzzleFlame = none;
	}
	//return;	
}

simulated function DestroyEffects()
{
	super(BallisticFire).DestroyEffects();
	// End:0x1D
	if(Ignition != none)
	{
		Ignition.Destroy();
	}
	// End:0x34
	if(Heater != none)
	{
		Heater.Destroy();
	}
	// End:0x4B
	if(MuzzleFlame != none)
	{
		MuzzleFlame.Destroy();
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
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Heater, Class'BallisticProV55.RX22AHeater', Weapon.DrawScale * FlashScaleFactor, Weapon, 'tip');
	}
	RX22AHeater(Heater).SetHeat(0.0000000);
	RX22AFlamer(Weapon).Heater = RX22AHeater(Heater);
	// End:0x100
	if((Ignition == none) || Ignition.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Ignition, Class'BallisticProV55.RX22AIgniter', Weapon.DrawScale * FlashScaleFactor, Weapon, 'tip2');
	}
	//return;	
}

defaultproperties
{
	FireSoundLoop=Sound'BW_Core_WeaponSound.RX22A.RX22A-FireLoop'
	TraceRange=(Min=1800.0000000,Max=1800.0000000)
	Damage=14.0000000
	KickForce=1000
	PenetrateForce=50
	FireChaos=0.0500000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.RX22A.RX22A-Ignite',Volume=0.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bSplashDamage=true
	bPawnRapidFireAnim=true
	FireAnim="FireLoop"
	FireEndAnim="None"
	FireRate=0.0900000
	AmmoClass=Class'BallisticProV55.Ammo_FlamerGas'
	ShakeRotMag=(X=64.0000000,Y=64.0000000,Z=64.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	BotRefireRate=0.9900000
	WarnTargetPct=0.4000000
}
