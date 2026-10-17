class GRSXXSecondaryFire extends BallisticProInstantFire;

var() Sound FireSoundLoop;
var float StopFireTime;
var bool bLaserFiring;

simulated function bool AllowFire()
{
	// End:0x5A
	if((((Level.TimeSeconds - StopFireTime) < 0.8000000) || GRSXXPistol(Weapon).LaserAmmo <= float(0)) || !super(BallisticFire).AllowFire())
	{
		// End:0x58
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
	return GRSXXPistol(Weapon).LaserAmmo > float(0);
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
	GRSXXPistol(Weapon).LaserAmmo -= 0.1500000;
	GRSXXPistol(Weapon).ServerSwitchLaser(true);
	bLaserFiring = true;
	super(BallisticInstantFire).DoFireEffect();
	//return;	
}

function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	// End:0x25
	if(FireSoundLoop != none)
	{
		Instigator.AmbientSound = FireSoundLoop;
	}
	bLaserFiring = true;
	//return;	
}

function StopFiring()
{
	bLaserFiring = false;
	Instigator.AmbientSound = none;
	GRSXXPistol(Weapon).ServerSwitchLaser(false);
	StopFireTime = Level.TimeSeconds;
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x2F
	if(GRSXXPistol(Weapon).bBigLaser)
	{
		BallisticFireSound.Sound = default.BallisticFireSound.Sound;		
	}
	else
	{
		BallisticFireSound.Sound = none;
	}
	super.ModeDoFire();
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

simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
{
	BallisticWeapon(Weapon).TargetedHurtRadius(7.0000000, 20.0000000, Class'BallisticProV55.DTGRS9Laser', 0.0000000, HitLocation, Pawn(Other));
	return super(BallisticInstantFire).ImpactEffect(HitLocation, HitNormal, HitMat, Other, WaterHitLoc);
	//return;	
}

simulated state AmpAttach
{
	simulated event ModeDoFire()
	{
		// End:0x16
		if(!Instigator.IsLocallyControlled())
		{
			return;
		}
		// End:0x33
		if(AllowFire())
		{
			GRSXXPistol(Weapon).ToggleAmplifier();
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	FireSoundLoop=Sound'BWBP_SKC_Sounds.Glock_Gold.G-Glk-LaserBurn'
	DamageType=Class'BWBP_SKC_Pro.DTGRSXXLaser'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTGRSXXLaserHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTGRSXXLaser'
	PenetrateForce=200
	bPenetrate=true
	FlashBone="tip2"
	bUseWeaponMag=false
	FireChaos=0.0000000
	XInaccuracy=2.0000000
	YInaccuracy=2.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.Glock_Gold.G-Glk-LaserFire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireAnim="Idle"
	FireRate=0.0800000
	AmmoClass=Class'BallisticProV55.Ammo_GRSNine'
	AmmoPerFire=0
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
	aimerror=900.0000000
}
