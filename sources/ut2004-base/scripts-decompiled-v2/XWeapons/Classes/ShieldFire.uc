class ShieldFire extends WeaponFire;

var Class<DamageType> DamageType;
var float ShieldRange;
var float MinHoldTime;
var float MinForce;
var float MaxForce;
var float MinDamage;
var float MaxDamage;
var float SelfForceScale;
var float SelfDamageScale;
var float MinSelfDamage;
var Sound ChargingSound;
var xEmitter ChargingEmitter;
var float AutoFireTestFreq;
var float FullyChargedTime;
var bool bAutoRelease;
var bool bStartedChargingForce;
var byte ChargingSoundVolume;
var Pawn AutoHitPawn;
var float AutoHitTime;
var string ChargingForce;

simulated function DestroyEffects()
{
	// End:0x17
	if(ChargingEmitter != none)
	{
		ChargingEmitter.Destroy();
	}
	super.DestroyEffects();
	//return;	
}

simulated function InitEffects()
{
	// End:0x41
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		ChargingEmitter = Weapon.Spawn(Class'XEffects.ShieldCharge');
		ChargingEmitter.mRegenPause = true;
	}
	bStartedChargingForce = false;
	super.InitEffects();
	//return;	
}

function DrawMuzzleFlash(Canvas Canvas)
{
	// End:0x65
	if(((ChargingEmitter != none) && HoldTime > 0.0000000) && !bNowWaiting)
	{
		ChargingEmitter.SetLocation(Weapon.GetEffectStart());
		Canvas.DrawActor(ChargingEmitter, false, false, Weapon.DisplayFOV);
	}
	// End:0xFF
	if(FlashEmitter != none)
	{
		FlashEmitter.SetLocation(Weapon.GetEffectStart());
		// End:0xC4
		if(Weapon.WeaponCentered())
		{
			FlashEmitter.SetRotation(Weapon.Instigator.GetViewRotation());			
		}
		else
		{
			FlashEmitter.SetRotation(Weapon.Rotation);
		}
		Canvas.DrawActor(FlashEmitter, false, false, Weapon.DisplayFOV);
	}
	// End:0x160
	if((Instigator.AmbientSound == ChargingSound) && (HoldTime <= 0.0000000) || bNowWaiting)
	{
		Instigator.AmbientSound = none;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
	}
	//return;	
}

function Rotator AdjustAim(Vector Start, float InAimError)
{
	local Rotator Aim, EnemyAim;

	// End:0x97
	if(AIController(Instigator.Controller) != none)
	{
		Aim = Instigator.Rotation;
		// End:0x8E
		if(Instigator.Controller.Enemy != none)
		{
			EnemyAim = Rotator(Instigator.Controller.Enemy.Location - Start);
			Aim.Pitch = EnemyAim.Pitch;
		}
		return Aim;		
	}
	else
	{
		return super.AdjustAim(Start, InAimError);
	}
	//return;	
}

function DoFireEffect()
{
	local Vector HitLocation, HitNormal, StartTrace, EndTrace, X, Y,
		Z;

	local Rotator Aim;
	local Actor Other;
	local float Scale, Damage, Force;

	Instigator.MakeNoise(1.0000000);
	Weapon.GetViewAxes(X, Y, Z);
	bAutoRelease = false;
	// End:0x8C
	if((AutoHitPawn != none) && (Level.TimeSeconds - AutoHitTime) < 0.1500000)
	{
		Other = AutoHitPawn;
		HitLocation = Other.Location;
		AutoHitPawn = none;		
	}
	else
	{
		StartTrace = Instigator.Location;
		Aim = AdjustAim(StartTrace, aimerror);
		EndTrace = StartTrace + (ShieldRange * Vector(Aim));
		Other = Weapon.Trace(HitLocation, HitNormal, EndTrace, StartTrace, true);
	}
	Scale = (FClamp(HoldTime, MinHoldTime, FullyChargedTime) - MinHoldTime) / (FullyChargedTime - MinHoldTime);
	Damage = MinDamage + (Scale * (MaxDamage - MinDamage));
	Force = MinForce + (Scale * (MaxForce - MinForce));
	Instigator.AmbientSound = none;
	Instigator.SoundVolume = Instigator.default.SoundVolume;
	// End:0x1AD
	if(ChargingEmitter != none)
	{
		ChargingEmitter.mRegenPause = true;
	}
	// End:0x302
	if((Other != none) && Other != Instigator)
	{
		// End:0x247
		if((Pawn(Other) != none) || (Decoration(Other) != none) && Decoration(Other).bDamageable)
		{
			Other.TakeDamage(int(Damage), Instigator, HitLocation, Force * (X + vect(0.0000000, 0.0000000, 0.5000000)), DamageType);			
		}
		else
		{
			// End:0x26A
			if(xPawn(Instigator).bBerserk)
			{
				Force *= 2.0000000;
			}
			Instigator.TakeDamage(int(MinSelfDamage + (SelfDamageScale * Damage)), Instigator, HitLocation, (-SelfForceScale * Force) * X, DamageType);
			// End:0x302
			if(DestroyableObjective(Other) != none)
			{
				Other.TakeDamage(int(Damage), Instigator, HitLocation, Force * (X + vect(0.0000000, 0.0000000, 0.5000000)), DamageType);
			}
		}
	}
	SetTimer(0.0000000, false);
	//return;	
}

function ModeHoldFire()
{
	SetTimer(AutoFireTestFreq, true);
	//return;	
}

function bool IsFiring()
{
	return bIsFiring || bAutoRelease;
	//return;	
}

function Timer()
{
	local Actor Other;
	local Vector HitLocation, HitNormal, StartTrace, EndTrace;
	local Rotator Aim;
	local float Regen, ChargeScale;

	// End:0x262
	if((HoldTime > 0.0000000) && !bNowWaiting)
	{
		StartTrace = Instigator.Location;
		Aim = AdjustAim(StartTrace, aimerror);
		EndTrace = StartTrace + (ShieldRange * Vector(Aim));
		Other = Weapon.Trace(HitLocation, HitNormal, EndTrace, StartTrace, true);
		// End:0x129
		if((Pawn(Other) != none) && Other != Instigator)
		{
			bAutoRelease = true;
			bIsFiring = false;
			Instigator.AmbientSound = none;
			Instigator.SoundVolume = Instigator.default.SoundVolume;
			AutoHitPawn = Pawn(Other);
			AutoHitTime = Level.TimeSeconds;
			// End:0x126
			if(ChargingEmitter != none)
			{
				ChargingEmitter.mRegenPause = true;
			}			
		}
		else
		{
			Instigator.AmbientSound = ChargingSound;
			Instigator.SoundVolume = ChargingSoundVolume;
			ChargeScale = FMin(HoldTime, FullyChargedTime);
			// End:0x241
			if(ChargingEmitter != none)
			{
				ChargingEmitter.mRegenPause = false;
				Regen = (ChargeScale * float(10)) + float(20);
				ChargingEmitter.mRegenRange[0] = Regen;
				ChargingEmitter.mRegenRange[1] = Regen;
				ChargingEmitter.mSpeedRange[0] = ChargeScale * -15.0000000;
				ChargingEmitter.mSpeedRange[1] = ChargeScale * -15.0000000;
				Regen = FMax(ChargeScale / 30.0000000, 0.2000000);
				ChargingEmitter.mLifeRange[0] = Regen;
				ChargingEmitter.mLifeRange[1] = Regen;
			}
			// End:0x25F
			if(!bStartedChargingForce)
			{
				bStartedChargingForce = true;
				ClientPlayForceFeedback(ChargingForce);
			}
		}		
	}
	else
	{
		// End:0x2A7
		if(Instigator.AmbientSound == ChargingSound)
		{
			Instigator.AmbientSound = none;
			Instigator.SoundVolume = Instigator.default.SoundVolume;
		}
		SetTimer(0.0000000, false);
	}
	//return;	
}

simulated function Vector GetFireStart(Vector X, Vector Y, Vector Z)
{
	return Instigator.Location;
	//return;	
}

function StartBerserk()
{
	// End:0x39
	if((Level.GRI != none) && Level.GRI.WeaponBerserk > 1.0000000)
	{
		return;
	}
	MaxHoldTime = default.MaxHoldTime * 0.7500000;
	FullyChargedTime = default.FullyChargedTime * 0.7500000;
	//return;	
}

function StopBerserk()
{
	// End:0x39
	if((Level.GRI != none) && Level.GRI.WeaponBerserk > 1.0000000)
	{
		return;
	}
	MaxHoldTime = default.MaxHoldTime;
	FullyChargedTime = default.FullyChargedTime;
	//return;	
}

function StartSuperBerserk()
{
	MaxHoldTime = default.MaxHoldTime / Level.GRI.WeaponBerserk;
	FullyChargedTime = default.FullyChargedTime / Level.GRI.WeaponBerserk;
	MinDamage = default.MinDamage * Level.GRI.WeaponBerserk;
	MaxDamage = default.MaxDamage * Level.GRI.WeaponBerserk;
	//return;	
}

function PlayPreFire()
{
	Weapon.PlayAnim('Charge', 1.0000000 / FullyChargedTime, 0.1000000);
	//return;	
}

function PlayFiring()
{
	bStartedChargingForce = false;
	StopForceFeedback(ChargingForce);
	super.PlayFiring();
	//return;	
}

defaultproperties
{
	DamageType=Class'XWeapons.DamTypeShieldImpact'
	ShieldRange=112.0000000
	MinHoldTime=0.4000000
	MinForce=65000.0000000
	MaxForce=100000.0000000
	MinDamage=40.0000000
	MaxDamage=150.0000000
	SelfForceScale=1.0000000
	SelfDamageScale=0.3000000
	MinSelfDamage=8.0000000
	ChargingSound=Sound'WeaponSounds.Misc.shieldgun_charge'
	AutoFireTestFreq=0.1500000
	FullyChargedTime=2.5000000
	ChargingSoundVolume=200
	ChargingForce="shieldgun_charge"
	bFireOnRelease=true
	TransientSoundVolume=1.0000000
	PreFireAnim="Charge"
	FireLoopAnim="None"
	FireEndAnim="None"
	TweenTime=0.0000000
	FireSound=ProceduralSound'WeaponSounds.PShieldGunFire.P1ShieldGunFire'
	FireForce="ShieldGunFire"
	FireRate=0.6000000
	AmmoClass=Class'XWeapons.ShieldAmmo'
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=1.0000000
	WarnTargetPct=0.1000000
	FlashEmitterClass=Class'XEffects.ForceRingA'
}
