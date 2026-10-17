class AssaultFire extends InstantFire;

var float LastFireTime;
var float ClickTime;

function InitEffects()
{
	super(WeaponFire).InitEffects();
	// End:0x2A
	if(FlashEmitter != none)
	{
		Weapon.AttachToBone(FlashEmitter, 'tip');
	}
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

event ModeDoFire()
{
	// End:0x2D
	if((Level.TimeSeconds - LastFireTime) > 0.5000000)
	{
		Spread = default.Spread;		
	}
	else
	{
		Spread = FMin(Spread + 0.0200000, 0.1200000);
	}
	LastFireTime = Level.TimeSeconds;
	super(WeaponFire).ModeDoFire();
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x0E
	if(super(WeaponFire).AllowFire())
	{
		return true;		
	}
	else
	{
		// End:0x6D
		if((PlayerController(Instigator.Controller) != none) && Level.TimeSeconds > ClickTime)
		{
			Instigator.PlaySound(ProceduralSound'WeaponSounds.PReload5.P1Reload5');
			ClickTime = Level.TimeSeconds + 0.2500000;
		}
		return false;
	}
	//return;	
}

function StartBerserk()
{
	DamageMin = int(float(default.DamageMin) * 1.3300000);
	DamageMax = int(float(default.DamageMax) * 1.3300000);
	//return;	
}

function StopBerserk()
{
	DamageMin = default.DamageMin;
	DamageMax = default.DamageMax;
	//return;	
}

function StartSuperBerserk()
{
	FireRate = (default.FireRate * 1.5000000) / Level.GRI.WeaponBerserk;
	FireAnimRate = (default.FireAnimRate * 0.6670000) * Level.GRI.WeaponBerserk;
	DamageMin = int(float(default.DamageMin) * 1.5000000);
	DamageMax = int(float(default.DamageMax) * 1.5000000);
	// End:0xB7
	if((AssaultRifle(Weapon) != none) && AssaultRifle(Weapon).bDualMode)
	{
		FireRate *= 0.5500000;
	}
	//return;	
}

defaultproperties
{
	DamageType=Class'XWeapons.DamTypeAssaultBullet'
	DamageMin=7
	DamageMax=7
	Momentum=0.0000000
	bPawnRapidFireAnim=true
	FireLoopAnim="None"
	FireEndAnim="None"
	FireSound=SoundGroup'WeaponSounds.AssaultRifle.AssaultRifleFire'
	FireForce="AssaultRifleFire"
	FireRate=0.1600000
	AmmoClass=Class'XWeapons.AssaultAmmo'
	AmmoPerFire=1
	ShakeRotMag=(X=50.0000000,Y=50.0000000,Z=50.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=1.0000000,Y=1.0000000,Z=1.0000000)
	ShakeOffsetRate=(X=1000.0000000,Y=1000.0000000,Z=1000.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.9900000
	FlashEmitterClass=Class'XEffects.AssaultMuzFlash1st'
	aimerror=800.0000000
	Spread=0.0200000
	SpreadStyle=1
}
