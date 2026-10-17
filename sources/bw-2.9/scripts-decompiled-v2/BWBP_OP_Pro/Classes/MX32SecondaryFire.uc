class MX32SecondaryFire extends BallisticProProjectileFire;

var() int Rockets;

simulated function AdjustLaserParams(bool bLaserOn)
{
	// End:0x0C
	if(bLaserOn)
	{		
	}
	// End:0x2A
	if(Weapon.bBerserk)
	{
		FireRate *= 0.7500000;
	}
	// End:0x69
	if(Level.GRI.WeaponBerserk > 1.0000000)
	{
		FireRate /= Level.GRI.WeaponBerserk;
	}
	//return;	
}

simulated function bool CheckRockets()
{
	local int Channel;
	local name seq;
	local float frame, Rate;

	// End:0x6B
	if(Rockets <= 0)
	{
		Weapon.GetAnimParams(Channel, seq, frame, Rate);
		// End:0x4D
		if(seq == MX32Weapon(Weapon).RocketsLoadAnim)
		{
			return false;
		}
		MX32Weapon(Weapon).LoadRockets();
		bIsFiring = false;
		return false;
	}
	return true;
	//return;	
}

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
	// End:0xAC
	if(!super(BallisticFire).AllowFire() || Rockets <= 0)
	{
		// End:0x99
		if(DryFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
		}
		BW.EmptyFire(1);
		return false;
	}
	return true;
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x1A
	if(!CheckRockets())
	{
		return;
	}
	super.ModeDoFire();
	// End:0x32
	if(Rockets > 0)
	{
		Rockets--;
	}
	//return;	
}

function StopFiring()
{
	local int Channel;
	local name seq;
	local float frame, Rate;

	Weapon.GetAnimParams(Channel, seq, frame, Rate);
	// End:0x56
	if(seq == PreFireAnim)
	{
		Weapon.PlayAnim(Weapon.IdleAnim, 1.0000000, 0.5000000);
	}
	//return;	
}

function DoFireEffect()
{
	super(BallisticProjectileFire).DoFireEffect();
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	super(BallisticProjectileFire).SpawnProjectile(Start, Dir);
	// End:0x6D
	if(MX32Weapon(Weapon).bLaserOn)
	{
		MX32SeekerRocket(proj).Weapon = MX32Weapon(BW);
		MX32SeekerRocket(proj).LastLoc = MX32Weapon(BW).GetRocketDir();
	}
	//return;	
}

defaultproperties
{
	Rockets=18
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	FlashBone="RocketTip6"
	bUseWeaponMag=false
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FlashScaleFactor=0.5000000
	AimedFireAnim="SightFire"
	FireRecoil=192.0000000
	FireChaos=0.0600000
	XInaccuracy=96.0000000
	YInaccuracy=48.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.AIMS-Fire2',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bModeExclusive=false
	FireAnim="RocketFire"
	FireRate=0.1250000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_MX32Rockets'
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_OP_Pro.MX32Rocket'
	BotRefireRate=0.6000000
	WarnTargetPct=0.3000000
}
