class A49PrimaryFire extends BallisticProProjectileFire;

var() bool bChargable;
var() float ChargeRate;
var() int MaxChargeLevel;
var() int ChargeLevel;
var() int ChargeIncrement;
var() float ChargeRadiusBonus;
var() Sound ChargeSound;
var() Sound ChargeLoopSound;
var bool bVariableHeatProps;
var float StopFireTime;

simulated function bool AllowFire()
{
	// End:0x2B
	if((A49SkrithBlaster(Weapon).HeatLevel >= float(10)) || !super(BallisticFire).AllowFire())
	{
		return false;
	}
	return true;
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x1D
	if(bChargable && IsInState('HOLD'))
	{
		GotoState('ChargeFire');
	}
	// End:0xC1
	if((int(Level.NetMode) == int(NM_Standalone)) && bVariableHeatProps)
	{
		// End:0x91
		if(A49SkrithBlaster(BW).HeatLevel >= float(5))
		{
			FireRate = (default.FireRate - (FRand() / float(20))) - (0.1000000 / A49SkrithBlaster(BW).HeatLevel);			
		}
		else
		{
			FireRate = (default.FireRate - (FRand() / float(8))) + (A49SkrithBlaster(BW).HeatLevel / float(25));
		}
	}
	super.ModeDoFire();
	//return;	
}

simulated event ModeTick(float dt)
{
	super(BallisticFire).ModeTick(dt);
	// End:0x7E
	if(int(Weapon.SoundPitch) != 56)
	{
		// End:0x4A
		if(Instigator.DrivenVehicle != none)
		{
			Weapon.SoundPitch = 56;			
		}
		else
		{
			Weapon.SoundPitch = byte(Max(56, int(float(Weapon.SoundPitch) - (float(8) * dt))));
		}
	}
	// End:0xD3
	if(bVariableHeatProps)
	{
		XInaccuracy = FMax(16.0000000, A49SkrithBlaster(BW).HeatLevel * float(100));
		YInaccuracy = FMax(16.0000000, A49SkrithBlaster(BW).HeatLevel * float(100));
	}
	//return;	
}

function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	// End:0x56
	if(bVariableHeatProps && A49SkrithBlaster(BW).HeatLevel < float(5))
	{
		A49SkrithBlaster(BW).AddHeat((HeatPerShot + float(ChargeLevel)) * 1.6000000);
	}
	A49SkrithBlaster(BW).AddHeat(HeatPerShot + float(ChargeLevel));
	//return;	
}

function DoFireEffect()
{
	super(BallisticProjectileFire).DoFireEffect();
	// End:0x91
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		// End:0x6F
		if(bVariableHeatProps && A49SkrithBlaster(BW).HeatLevel < float(5))
		{
			A49SkrithBlaster(BW).AddHeat((HeatPerShot + float(ChargeLevel)) * 1.6000000);
		}
		A49SkrithBlaster(BW).AddHeat(HeatPerShot + float(ChargeLevel));
	}
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	// End:0x13
	if(bChargable)
	{
		GotoState('ChargeFire');		
	}
	else
	{
		GotoState('None');
	}
	proj = Spawn(ProjectileClass,,, Start, Dir);
	// End:0xF8
	if(((proj != none) && BallisticProjectile(proj) != none) && bChargable)
	{
		proj.Damage += ((BallisticProjectile(proj).DamageSpecial * float(ChargeLevel)) / float(MaxChargeLevel));
		proj.DamageRadius += ((ChargeRadiusBonus * float(ChargeLevel)) / float(MaxChargeLevel));
		proj.Instigator = Instigator;
		proj.SetDrawScale(float(ChargeLevel + 1) * proj.default.DrawScale);
	}
	ChargeLevel = 0;
	//return;	
}

simulated state ChargeFire
{
	simulated function ApplyFireEffectParams(FireEffectParams effect_params)
	{
		super(BallisticProjectileFire).ApplyFireEffectParams(effect_params);
		bFireOnRelease = true;
		bModeExclusive = true;
		bChargable = true;
		ChargeIncrement = AmmoPerFire;
		// End:0x3F
		if(bFireOnRelease)
		{
			bWaitForRelease = true;
		}
		// End:0x50
		if(bWaitForRelease)
		{
			bNowWaiting = true;
		}
		//return;		
	}

	function ModeHoldFire()
	{
		// End:0x25
		if(BW.MagAmmo > ChargeIncrement)
		{
			super(WeaponFire).ModeHoldFire();
			GotoState('HOLD');
		}
		//return;		
	}
	stop;	
}

state HOLD
{
	simulated function BeginState()
	{
		ChargeLevel = 0;
		SetTimer(ChargeRate, true);
		Instigator.AmbientSound = ChargeSound;
		//return;		
	}

	simulated function Timer()
	{
		// End:0x3A
		if(BW.MagAmmo > ChargeIncrement)
		{
			ChargeLevel++;
			BW.ConsumeMagAmmo(ThisModeNum, float(ChargeIncrement));
		}
		A49SkrithBlaster(BW).SetGlowSize(float(ChargeLevel) / float(MaxChargeLevel));
		// End:0xE3
		if((ChargeLevel == MaxChargeLevel) || BW.AmmoAmount(ThisModeNum) < ChargeIncrement)
		{
			SetTimer(0.0000000, false);
			Instigator.AmbientSound = ChargeLoopSound;
			Instigator.SoundPitch = 150;
			Instigator.SoundRadius = 50.0000000;
			Instigator.SoundVolume = 250;
		}
		//return;		
	}

	simulated function EndState()
	{
		// End:0x4F
		if((Instigator != none) && (Instigator.AmbientSound == ChargeLoopSound) || Instigator.AmbientSound == ChargeSound)
		{
			Instigator.AmbientSound = none;
		}
		A49SkrithBlaster(BW).SetGlowSize(0.0000000);
		Instigator.SoundPitch = Instigator.default.SoundPitch;
		Instigator.SoundRadius = Instigator.default.SoundRadius;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
		//return;		
	}
	stop;	
}

defaultproperties
{
	ChargeRate=0.6500000
	MaxChargeLevel=3
	ChargeIncrement=10
	ChargeRadiusBonus=30.0000000
	ChargeSound=Sound'BWBP_SKC_Sounds.Typhon.Typhon-Overcharge'
	ChargeLoopSound=Sound'BW_Core_WeaponSound.A73.A73Hum1'
	FlashBone="MuzzleTip"
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.1600000,OutVal=1.0000000),(InVal=0.2500000,OutVal=1.5000000),(InVal=0.5000000,OutVal=2.2500000),(InVal=0.7500000,OutVal=3.5000000),(InVal=1.0000000,OutVal=5.0000000)))
	HeatPerShot=0.5000000
	bInstantHit=true
	bPawnRapidFireAnim=true
	AmmoClass=Class'BallisticProV55.Ammo_Cells'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-70.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.9900000
}
