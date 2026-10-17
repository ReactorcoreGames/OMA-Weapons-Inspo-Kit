class MinigunFire extends InstantFire;

var() float MaxRollSpeed;
var() float RollSpeed;
var() float BarrelRotationsPerSec;
var() int RoundsPerRotation;
var() float FireTime;
var() Sound WindingSound;
var() Sound FiringSound;
var() byte MinigunSoundVolume;
var Minigun Gun;
var() float WindUpTime;
var() string FiringForce;
var() string WindingForce;

function StartBerserk()
{
	// End:0x39
	if((Level.GRI != none) && Level.GRI.WeaponBerserk > 1.0000000)
	{
		return;
	}
	DamageMin = int(float(default.DamageMin) * 1.3300000);
	DamageMax = int(float(default.DamageMax) * 1.3300000);
	//return;	
}

function StopBerserk()
{
	// End:0x39
	if((Level.GRI != none) && Level.GRI.WeaponBerserk > 1.0000000)
	{
		return;
	}
	DamageMin = default.DamageMin;
	DamageMax = default.DamageMax;
	//return;	
}

function StartSuperBerserk()
{
	DamageMin = int(float(default.DamageMin) * 1.5000000);
	DamageMax = int(float(default.DamageMax) * 1.5000000);
	BarrelRotationsPerSec = (default.BarrelRotationsPerSec * 0.6670000) * Level.GRI.WeaponBerserk;
	FireRate = 1.0000000 / (float(RoundsPerRotation) * BarrelRotationsPerSec);
	MaxRollSpeed = 65536.0000000 * BarrelRotationsPerSec;
	//return;	
}

function PostBeginPlay()
{
	super(WeaponFire).PostBeginPlay();
	FireRate = 1.0000000 / (float(RoundsPerRotation) * BarrelRotationsPerSec);
	MaxRollSpeed = 65536.0000000 * BarrelRotationsPerSec;
	Gun = Minigun(Weapon);
	//return;	
}

function FlashMuzzleFlash()
{
	local Rotator R;

	R.Roll = Rand(65536);
	Weapon.SetBoneRotation('Bone_Flash', R, 0, 1.0000000);
	super(WeaponFire).FlashMuzzleFlash();
	//return;	
}

function InitEffects()
{
	super(WeaponFire).InitEffects();
	// End:0x2A
	if(FlashEmitter != none)
	{
		Weapon.AttachToBone(FlashEmitter, 'Flash');
	}
	//return;	
}

function PlayAmbientSound(Sound ASound)
{
	// End:0x46
	if(((Minigun(Weapon) == none) || Instigator == none) || (ASound == none) && ThisModeNum != Gun.CurrentMode)
	{
		return;
	}
	// End:0x71
	if(ASound == none)
	{
		Instigator.SoundVolume = Instigator.default.SoundVolume;		
	}
	else
	{
		Instigator.SoundVolume = MinigunSoundVolume;
	}
	Instigator.AmbientSound = ASound;
	Gun.CurrentMode = ThisModeNum;
	//return;	
}

function StopRolling()
{
	// End:0x27
	if((Gun == none) || ThisModeNum != Gun.CurrentMode)
	{
		return;
	}
	RollSpeed = 0.0000000;
	Gun.RollSpeed = 0.0000000;
	//return;	
}

function PlayPreFire()
{
	//return;	
}

function PlayStartHold()
{
	//return;	
}

function PlayFiring()
{
	//return;	
}

function PlayFireEnd()
{
	//return;	
}

function StartFiring()
{
	//return;	
}

function StopFiring()
{
	//return;	
}

function bool IsIdle()
{
	return false;
	//return;	
}

auto state Idle
{
	function bool IsIdle()
	{
		return true;
		//return;		
	}

	function BeginState()
	{
		PlayAmbientSound(none);
		StopRolling();
		//return;		
	}

	function EndState()
	{
		PlayAmbientSound(WindingSound);
		//return;		
	}

	function StartFiring()
	{
		RollSpeed = 0.0000000;
		FireTime = (RollSpeed / MaxRollSpeed) * WindUpTime;
		GotoState('WindUp');
		//return;		
	}
	stop;	
}

state WindUp
{
	function BeginState()
	{
		ClientPlayForceFeedback(WindingForce);
		//return;		
	}

	function EndState()
	{
		// End:0x46
		if(ThisModeNum == 0)
		{
			// End:0x43
			if((Weapon == none) || !Weapon.GetFireMode(1).bIsFiring)
			{
				StopForceFeedback(WindingForce);
			}			
		}
		else
		{
			// End:0x7E
			if((Weapon == none) || !Weapon.GetFireMode(0).bIsFiring)
			{
				StopForceFeedback(WindingForce);
			}
		}
		//return;		
	}

	function ModeTick(float dt)
	{
		FireTime += dt;
		RollSpeed = (FireTime / WindUpTime) * MaxRollSpeed;
		// End:0x39
		if(!bIsFiring)
		{
			GotoState('WindDown');
			return;
		}
		// End:0x85
		if(RollSpeed >= MaxRollSpeed)
		{
			RollSpeed = MaxRollSpeed;
			FireTime = WindUpTime;
			Gun.UpdateRoll(dt, RollSpeed, ThisModeNum);
			GotoState('FireLoop');
			return;
		}
		Gun.UpdateRoll(dt, RollSpeed, ThisModeNum);
		//return;		
	}

	function StopFiring()
	{
		GotoState('WindDown');
		//return;		
	}
	stop;	
}

state FireLoop
{
	function BeginState()
	{
		NextFireTime = Level.TimeSeconds - 0.1000000;
		PlayAmbientSound(FiringSound);
		ClientPlayForceFeedback(FiringForce);
		Gun.LoopAnim(FireLoopAnim, FireLoopAnimRate, TweenTime);
		Gun.SpawnShells(float(RoundsPerRotation) * BarrelRotationsPerSec);
		//return;		
	}

	function StopFiring()
	{
		GotoState('WindDown');
		//return;		
	}

	function EndState()
	{
		PlayAmbientSound(WindingSound);
		StopForceFeedback(FiringForce);
		Gun.LoopAnim(Gun.IdleAnim, Gun.IdleAnimRate, TweenTime);
		Gun.SpawnShells(0.0000000);
		//return;		
	}

	function ModeTick(float dt)
	{
		super(WeaponFire).ModeTick(dt);
		Gun.UpdateRoll(dt, RollSpeed, ThisModeNum);
		// End:0x3D
		if(!bIsFiring)
		{
			GotoState('WindDown');
			return;
		}
		//return;		
	}
	stop;	
}

state WindDown
{
	function BeginState()
	{
		ClientPlayForceFeedback(WindingForce);
		//return;		
	}

	function EndState()
	{
		// End:0x46
		if(ThisModeNum == 0)
		{
			// End:0x43
			if((Weapon == none) || !Weapon.GetFireMode(1).bIsFiring)
			{
				StopForceFeedback(WindingForce);
			}			
		}
		else
		{
			// End:0x7E
			if((Weapon == none) || !Weapon.GetFireMode(0).bIsFiring)
			{
				StopForceFeedback(WindingForce);
			}
		}
		//return;		
	}

	function ModeTick(float dt)
	{
		FireTime -= dt;
		RollSpeed = (FireTime / WindUpTime) * MaxRollSpeed;
		// End:0x71
		if(RollSpeed <= 0.0000000)
		{
			RollSpeed = 0.0000000;
			FireTime = 0.0000000;
			Gun.UpdateRoll(dt, RollSpeed, ThisModeNum);
			GotoState('Idle');
			return;
		}
		Gun.UpdateRoll(dt, RollSpeed, ThisModeNum);
		//return;		
	}

	function StartFiring()
	{
		GotoState('WindUp');
		//return;		
	}
	stop;	
}

defaultproperties
{
	BarrelRotationsPerSec=3.0000000
	RoundsPerRotation=5
	WindingSound=Sound'WeaponSounds.Minigun.miniempty'
	FiringSound=Sound'NewWeaponSounds.NewMinigunFire'
	MinigunSoundVolume=220
	WindUpTime=0.2700000
	FiringForce="minifireb"
	WindingForce="miniempty"
	DamageType=Class'XWeapons.DamTypeMinigunBullet'
	DamageMin=7
	DamageMax=8
	Momentum=0.0000000
	bPawnRapidFireAnim=true
	PreFireTime=0.2700000
	FireLoopAnimRate=9.0000000
	AmmoClass=Class'XWeapons.MinigunAmmo'
	AmmoPerFire=1
	ShakeRotMag=(X=50.0000000,Y=50.0000000,Z=50.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=1.0000000,Y=1.0000000,Z=1.0000000)
	ShakeOffsetRate=(X=1000.0000000,Y=1000.0000000,Z=1000.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.9900000
	FlashEmitterClass=Class'XEffects.MinigunMuzFlash1st'
	SmokeEmitterClass=Class'XEffects.MinigunMuzzleSmoke'
	aimerror=900.0000000
	Spread=0.0800000
	SpreadStyle=1
}
