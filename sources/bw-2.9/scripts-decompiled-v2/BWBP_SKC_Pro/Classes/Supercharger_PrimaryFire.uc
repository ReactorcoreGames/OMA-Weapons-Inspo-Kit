class Supercharger_PrimaryFire extends BallisticInstantFire;

var Actor Ignition;
var Actor MuzzleFlame;
var Actor Heater;
var bool bIgnited;
var() Sound FireSoundLoop;
var() Sound BotFireSound;
var() bool bDoOverCharge;

function StartBerserk()
{
	FireRate = 0.0300000;
	FireAnimRate = default.FireAnimRate / 0.7500000;
	ReloadAnimRate = default.ReloadAnimRate / 0.7500000;
	//return;	
}

function StopBerserk()
{
	FireRate = default.FireRate;
	FireAnimRate = default.FireAnimRate;
	ReloadAnimRate = default.ReloadAnimRate;
	//return;	
}

function StartSuperBerserk()
{
	FireRate = 0.0300000;
	FireRate /= Level.GRI.WeaponBerserk;
	FireAnimRate = default.FireAnimRate * Level.GRI.WeaponBerserk;
	ReloadAnimRate = default.ReloadAnimRate * Level.GRI.WeaponBerserk;
	//return;	
}

function float MaxRange()
{
	return 6400.0000000;
	//return;	
}

function Supercharger_ChargeControl GetChargeControl()
{
	return Supercharger_AssaultWeapon(Weapon).GetChargeControl();
	//return;	
}

function DoFireEffect()
{
	local Vector Start, Dir, End, HitLocation, HitNormal;

	local Rotator Aim;
	local Actor Other;
	local float dist;
	local int i;

	Start = Instigator.Location + Instigator.EyePosition();
	Aim = GetFireAim(Start);
	Aim = Rotator((GetFireSpread()) >> Aim);
	DoTrace(Start, Aim);
	Dir = Vector(Aim);
	End = Start + (Dir * (MaxRange()));
	Weapon.bTraceWater = true;
	i = 0;
	J0x9B:

	// End:0x18A [Loop If]
	if(i < 20)
	{
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x14B
		if((((((Other == none) || Other.bWorldGeometry) || Mover(Other) != none) || Vehicle(Other) != none) || FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
		{
			// [Explicit Break]
			goto J0x18A;
		}
		Start = HitLocation + (Dir * FMax(32.0000000, (Other.CollisionRadius * float(2)) + float(4)));
		i++;
		// [Loop Continue]
		goto J0x9B;
	}
	J0x18A:

	Weapon.bTraceWater = false;
	// End:0x1B1
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x1F3
	if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
	{
		Other = none;
	}
	dist = VSize(HitLocation - Start);
	// End:0x272
	if((Other != none) && Other.bWorldGeometry || Mover(Other) != none)
	{
		GetChargeControl().FireShot(Start, HitLocation, dist, Other != none, HitNormal, Instigator, Other, 1);		
	}
	else
	{
		GetChargeControl().FireShot(Start, HitLocation, dist, Other != none, HitNormal, Instigator, none, 1);
	}
	SendFireEffect(Other, HitLocation, HitNormal, 0);
	super(BallisticFire).DoFireEffect();
	Supercharger_AssaultWeapon(Weapon).AddHeat(HeatPerShot);
	//return;	
}

function PlayFiring()
{
	// End:0x29
	if(int(ScopeDownOn) == int(1))
	{
		BW.TemporaryScopeDown(0.5000000, 0.0000000);
	}
	// End:0x9E
	if(int(Supercharger_AssaultWeapon(Weapon).CurrentWeaponMode) == 1)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);		
	}
	else
	{
		// End:0x10C
		if(AIController(Instigator.Controller) != none)
		{
			Weapon.PlayOwnedSound(BotFireSound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);			
		}
		else
		{
			// End:0x12B
			if(FireSoundLoop != none)
			{
				Instigator.AmbientSound = FireSoundLoop;
			}
		}
	}
	// End:0x1B5
	if(FireCount == 0)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		BW.SafePlayAnim('Fire', FireAnimRate, TweenTime,, "FIRE");		
	}
	else
	{
		// End:0x206
		if((FireCount > 0) && Supercharger_AssaultWeapon(Weapon).HeatLevel < float(7))
		{
			BW.SafeLoopAnim('FireLoop', FireAnimRate, TweenTime,, "FIRE");			
		}
		else
		{
			// End:0x254
			if((FireCount > 0) && Supercharger_AssaultWeapon(Weapon).HeatLevel > float(7))
			{
				BW.SafeLoopAnim('FireLoopHot', FireAnimRate, TweenTime,, "FIRE");
			}
		}
	}
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0x2D0
	if(!bIgnited)
	{
		bIgnited = true;
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	// End:0x313
	if(MuzzleFlame == none)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlame, Class'BallisticProV55.HVCMk9MuzzleFlash', Weapon.DrawScale * FlashScaleFactor, Weapon, 'tip');
	}
	// End:0x345
	if(int(Level.NetMode) == int(NM_Client))
	{
		Supercharger_AssaultWeapon(BW).AddHeat(HeatPerShot);
	}
	// End:0x412
	if(((int(Level.NetMode) != int(NM_Client)) && !bDoOverCharge) && Supercharger_AssaultWeapon(Weapon).HeatLevel > float(10))
	{
		bDoOverCharge = true;
		Weapon.PlaySound(Supercharger_AssaultWeapon(Weapon).OverheatSound, 0, 1.4000000,, 64.0000000, 1.0000000, true);
		Supercharger_AssaultWeapon(Weapon).ClientOverCharge();
		Weapon.ServerStopFire(byte(ThisModeNum));
		BW.SafePlayAnim('Overheat', FireAnimRate, TweenTime,, "FIRE");
	}
	//return;	
}

function ServerPlayFiring()
{
	// End:0x8A
	if(FireCount == 0)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		BW.SafePlayAnim('Fire', FireAnimRate, TweenTime,, "FIRE");		
	}
	else
	{
		// End:0xDB
		if((FireCount > 0) && Supercharger_AssaultWeapon(Weapon).HeatLevel < float(7))
		{
			BW.SafeLoopAnim('FireLoop', FireAnimRate, TweenTime,, "FIRE");			
		}
		else
		{
			// End:0x129
			if((FireCount > 0) && Supercharger_AssaultWeapon(Weapon).HeatLevel > float(7))
			{
				BW.SafeLoopAnim('FireLoopHot', FireAnimRate, TweenTime,, "FIRE");
			}
		}
	}
	// End:0x193
	if(!bIgnited)
	{
		bIgnited = true;
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	// End:0x260
	if(((int(Weapon.Role) == int(ROLE_Authority)) && !bDoOverCharge) && Supercharger_AssaultWeapon(Weapon).HeatLevel > float(10))
	{
		bDoOverCharge = true;
		Weapon.PlaySound(Supercharger_AssaultWeapon(Weapon).OverheatSound, 0, 1.4000000,, 64.0000000, 1.0000000, true);
		Supercharger_AssaultWeapon(Weapon).ClientOverCharge();
		Weapon.ServerStopFire(byte(ThisModeNum));
		BW.SafePlayAnim('Overheat', FireAnimRate, TweenTime,, "FIRE");
	}
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x70
	if(((!super(BallisticFire).AllowFire() || Supercharger_AssaultWeapon(Weapon).HeatLevel >= float(10)) || Supercharger_AssaultWeapon(Weapon).bIsVenting) || Instigator.HeadVolume.bWaterVolume)
	{
		// End:0x6E
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
	Instigator.AmbientSound = none;
	// End:0x3E
	if(MuzzleFlame != none)
	{
		Emitter(MuzzleFlame).Kill();
		MuzzleFlame = none;
	}
	bDoOverCharge = false;
	//return;	
}

simulated function DestroyEffects()
{
	super(BallisticFire).DestroyEffects();
	// End:0x1D
	if(MuzzleFlame != none)
	{
		MuzzleFlame.Destroy();
	}
	//return;	
}

defaultproperties
{
	FireSoundLoop=Sound'BWBP_SKC_Sounds.SuperCharger.SC-FireLoop'
	BotFireSound=Sound'BWBP_SKC_Sounds.SuperCharger.SC-FireSingle'
	TraceRange=(Min=6400.0000000,Max=6400.0000000)
	DamageType=Class'BWBP_SKC_Pro.DT_SuperchargeZapped'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_SuperchargeZapped'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_SuperchargeZapped'
	KickForce=20000
	PenetrateForce=180
	RunningSpeedThresh=1000.0000000
	bCockAfterEmpty=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=0.2500000
	XInaccuracy=32.0000000
	YInaccuracy=32.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.SuperCharger.SC-FireEnd',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	HeatPerShot=0.1500000
	bPawnRapidFireAnim=true
	PreFireAnim="None"
	FireAnim="FireLoop"
	FireEndAnim="None"
	AmmoClass=Class'BallisticProV55.Ammo_HVCCells'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=1.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-160.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.0000000
	WarnTargetPct=0.2000000
	aimerror=900.0000000
}
