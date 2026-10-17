class M46SecondaryFire extends BallisticProjectileFire;

var bool bLoaded;

simulated function bool CheckGrenade()
{
	local int Channel;
	local name seq;
	local float frame, Rate;

	// End:0x6B
	if(!bLoaded)
	{
		Weapon.GetAnimParams(Channel, seq, frame, Rate);
		// End:0x4D
		if(seq == M46AssaultRifle(Weapon).GrenadeLoadAnim)
		{
			return false;
		}
		M46AssaultRifle(Weapon).LoadGrenade();
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
	if(!super(BallisticFire).AllowFire() || !bLoaded)
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
	if(!CheckGrenade())
	{
		return;
	}
	super(BallisticFire).ModeDoFire();
	bLoaded = false;
	PreFireTime = 0.0000000;
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

function SpawnProjectile(Vector Start, Rotator Dir)
{
	proj = Spawn(ProjectileClass,,, Start, Dir);
	// End:0x5A
	if(proj != none)
	{
		proj.Instigator = Instigator;
		M46Grenade(proj).Rifle = M46AssaultRifle(BW);
	}
	//return;	
}

defaultproperties
{
	bLoaded=true
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	FlashBone="tip2"
	bUseWeaponMag=false
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.OA-AR.OA-AR_FireGren',Volume=1.7500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	bFireOnRelease=true
	PreFireTime=0.4500000
	PreFireAnim="GrenadePrepFire"
	FireAnim="GrenadeFire"
	FireForce="AssaultRifleAltFire"
	FireRate=0.7500000
	AmmoClass=Class'BallisticProV55.Ammo_M46Grenades'
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-300.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BallisticProV55.M46Grenade'
	BotRefireRate=0.3000000
	WarnTargetPct=0.8000000
}
