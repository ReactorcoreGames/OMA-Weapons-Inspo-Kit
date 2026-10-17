class AM67SecondaryLaserFire extends BallisticInstantFire;

var() Sound FireSoundLoop;
var bool bLaserFiring;
var float StopFireTime;
var() float LaserAmmoPerFire;

simulated function PreBeginPlay()
{
	super(WeaponFire).PreBeginPlay();
	BW = BallisticWeapon(Weapon);
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x94
	if(((((AM67Pistol(Weapon).LaserAmmo < AM67Pistol(Weapon).default.LaserAmmo) && !bLaserFiring) || (Level.TimeSeconds - StopFireTime) < 0.7500000) || AM67Pistol(Weapon).LaserAmmo <= float(0)) || !super(BallisticFire).AllowFire())
	{
		// End:0x92
		if(bLaserFiring)
		{
			StopFiring();
		}
		return false;
	}
	return true;
	//return;	
}

simulated function bool HasAmmo()
{
	return AM67Pistol(Weapon).LaserAmmo > float(0);
	//return;	
}

simulated function bool CheckWeaponMode()
{
	// End:0x2C
	if(Weapon.IsInState('DualAction') || Weapon.IsInState('PendingDualAction'))
	{
		return false;
	}
	return true;
	//return;	
}

function DoFireEffect()
{
	AM67Pistol(Weapon).LaserAmmo -= LaserAmmoPerFire;
	AM67Pistol(Weapon).ServerSwitchLaser(true);
	bLaserFiring = true;
	super.DoFireEffect();
	//return;	
}

function PlayFiring()
{
	// End:0x29
	if(int(ScopeDownOn) == int(1))
	{
		BW.TemporaryScopeDown(0.5000000, 0.9000000);
	}
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0xA2
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	CheckClipFinished();
	// End:0xC7
	if(FireSoundLoop != none)
	{
		Weapon.AmbientSound = FireSoundLoop;
	}
	bLaserFiring = true;
	//return;	
}

function StopFiring()
{
	bLaserFiring = false;
	Weapon.AmbientSound = none;
	AM67Pistol(Weapon).ServerSwitchLaser(false);
	StopFireTime = Level.TimeSeconds;
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x23
	if(!bLaserFiring)
	{
		BallisticFireSound.Sound = default.BallisticFireSound.Sound;		
	}
	else
	{
		BallisticFireSound.Sound = none;
	}
	LaserAmmoPerFire = default.LaserAmmoPerFire * (float(1) + (float(5) * FMax(0.0000000, AM67Pistol(Weapon).LaserAmmo - 0.5000000)));
	super(BallisticFire).ModeDoFire();
	//return;	
}

simulated function ApplyRecoil()
{
	// End:0x26
	if(BW != none)
	{
		BW.AddRecoil(FireRecoil, float(ThisModeNum));
	}
	//return;	
}

function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	super.ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x96
	if(Victim.bProjTarget)
	{
		BW.TargetedHurtRadius(3.0000000 * (float(1) + (float(5) * FMax(0.0000000, AM67Pistol(Weapon).LaserAmmo - 0.5000000))), 10.0000000, Class'BallisticProV55.DTAM67Laser', 0.0000000, HitLocation, Pawn(Victim));
	}
	//return;	
}

defaultproperties
{
	FireSoundLoop=Sound'BW_Core_WeaponSound.Glock.Glk-LaserBurn'
	LaserAmmoPerFire=0.0500000
	RangeAtten=0.1000000
	DamageType=Class'BallisticProV55.DTAM67Laser'
	DamageTypeHead=Class'BallisticProV55.DTAM67LaserHead'
	DamageTypeArm=Class'BallisticProV55.DTAM67Laser'
	PenetrateForce=10
	bPenetrate=true
	FlashBone="tip2"
	bUseWeaponMag=false
	XInaccuracy=2.0000000
	YInaccuracy=2.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-LaserFire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bModeExclusive=false
	FireAnim="Idle"
	FireRate=0.0500000
	AmmoClass=Class'BallisticProV55.Ammo_50HV'
	AmmoPerFire=0
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
	aimerror=400.0000000
}
