class BioChargedFire extends ProjectileFire;

var() float GoopUpRate;
var() int MaxGoopLoad;
var() int GoopLoad;
var() Sound HoldSound;

function InitEffects()
{
	super(WeaponFire).InitEffects();
	// End:0x31
	if(FlashEmitter == none)
	{
		FlashEmitter = Weapon.GetFireMode(0).FlashEmitter;
	}
	//return;	
}

function DrawMuzzleFlash(Canvas Canvas)
{
	// End:0x25
	if(FlashEmitter != none)
	{
		FlashEmitter.SetRotation(Weapon.Rotation);
	}
	super(WeaponFire).DrawMuzzleFlash(Canvas);
	//return;	
}

function ModeHoldFire()
{
	// End:0x27
	if(Weapon.AmmoAmount(ThisModeNum) > 0)
	{
		super(WeaponFire).ModeHoldFire();
		GotoState('HOLD');
	}
	//return;	
}

function float MaxRange()
{
	return 1500.0000000;
	//return;	
}

simulated function bool AllowFire()
{
	return (Weapon.AmmoAmount(ThisModeNum) > 0) || GoopLoad > 0;
	//return;	
}

simulated function PlayStartHold()
{
	Weapon.PlayAnim('AltFire', 1.0000000 / (GoopUpRate * float(MaxGoopLoad)), 0.1000000);
	//return;	
}

simulated function PlayFiring()
{
	super(WeaponFire).PlayFiring();
	Weapon.OutOfAmmo();
	//return;	
}

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
	local BioGlob Glob;

	GotoState('None');
	// End:0x14
	if(GoopLoad == 0)
	{
		return none;
	}
	Glob = Weapon.Spawn(Class'XWeapons.BioGlob',,, Start, Dir);
	// End:0x7A
	if(Glob != none)
	{
		Glob.Damage *= DamageAtten;
		Glob.SetGoopLevel(GoopLoad);
		Glob.AdjustSpeed();
	}
	GoopLoad = 0;
	// End:0xAA
	if(Weapon.AmmoAmount(ThisModeNum) <= 0)
	{
		Weapon.OutOfAmmo();
	}
	return Glob;
	//return;	
}

function StartBerserk()
{
	// End:0x39
	if((Level.GRI != none) && Level.GRI.WeaponBerserk > 1.0000000)
	{
		return;
	}
	GoopUpRate = default.GoopUpRate * 0.7500000;
	//return;	
}

function StopBerserk()
{
	// End:0x39
	if((Level.GRI != none) && Level.GRI.WeaponBerserk > 1.0000000)
	{
		return;
	}
	GoopUpRate = default.GoopUpRate;
	//return;	
}

function StartSuperBerserk()
{
	GoopUpRate = default.GoopUpRate / Level.GRI.WeaponBerserk;
	//return;	
}

state HOLD
{
	simulated function BeginState()
	{
		GoopLoad = 0;
		SetTimer(GoopUpRate, true);
		Weapon.PlayOwnedSound(Sound'WeaponSounds.Misc.biorifle_charge', 3, TransientSoundVolume);
		Weapon.ClientPlayForceFeedback("BioRiflePowerUp");
		Timer();
		//return;		
	}

	simulated function Timer()
	{
		// End:0x21
		if(Weapon.AmmoAmount(ThisModeNum) > 0)
		{
			GoopLoad++;
		}
		Weapon.ConsumeAmmo(ThisModeNum, 1.0000000);
		// End:0xAA
		if((GoopLoad == MaxGoopLoad) || Weapon.AmmoAmount(ThisModeNum) == 0)
		{
			SetTimer(0.0000000, false);
			Instigator.AmbientSound = Sound'NewWeaponSounds.BioGoopLoop';
			Instigator.SoundRadius = 50.0000000;
			Instigator.SoundVolume = 50;
		}
		//return;		
	}

	simulated function EndState()
	{
		// End:0x35
		if((Instigator != none) && Instigator.AmbientSound == Sound'NewWeaponSounds.BioGoopLoop')
		{
			Instigator.AmbientSound = none;
		}
		Instigator.SoundRadius = Instigator.default.SoundRadius;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
		StopForceFeedback("BioRiflePowerUp");
		//return;		
	}
	stop;	
}

defaultproperties
{
	GoopUpRate=0.2500000
	MaxGoopLoad=10
	HoldSound=SoundGroup'WeaponSounds.BioRifle.BioRiflePowerUp'
	ProjSpawnOffset=(X=20.0000000,Y=9.0000000,Z=-6.0000000)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	bFireOnRelease=true
	FireEndAnim="None"
	FireSound=SoundGroup'WeaponSounds.BioRifle.BioRifleFire'
	FireForce="BioRifleFire"
	FireRate=0.3300000
	AmmoClass=Class'XWeapons.BioAmmo'
	ShakeRotMag=(X=100.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-4.0000000,Y=0.0000000,Z=-4.0000000)
	ShakeOffsetRate=(X=1000.0000000,Y=0.0000000,Z=1000.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'XWeapons.BioGlob'
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
}
