class BallisticHandGrenadeFire extends BallisticProjectileFire;

var() name NoClipPreFireAnim;

function FlashMuzzleFlash()
{
	// End:0x23
	if(BallisticHandGrenade(Weapon).ClipReleaseTime == 0.0000000)
	{
		EjectBrass();
	}
	//return;	
}

function PlayPreFire()
{
	Weapon.SetBoneScale(0, 1.0000000, BallisticHandGrenade(Weapon).GrenadeBone);
	Weapon.SetBoneScale(1, 0.0000000, BallisticHandGrenade(Weapon).PinBone);
	// End:0x97
	if(BallisticHandGrenade(Weapon).ClipReleaseTime > float(0))
	{
		Weapon.SetBoneScale(2, 0.0000000, BallisticHandGrenade(Weapon).ClipBone);		
	}
	else
	{
		Weapon.SetBoneScale(2, 1.0000000, BallisticHandGrenade(Weapon).ClipBone);
	}
	Weapon.PlayAnim(PreFireAnim, PreFireAnimRate, TweenTime);
	//return;	
}

function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x28
	if(Level.TimeSeconds < BallisticHandGrenade(Weapon).HandExplodeTime)
	{
		return false;
	}
	return super(WeaponFire).AllowFire();
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x4F
	if(BallisticHandGrenade(Weapon).ClipReleaseTime == float(0))
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(Weapon, BallisticHandGrenade(Weapon).ClipReleaseSound);
	}
	BallisticHandGrenade(Weapon).KillSmoke();
	super(BallisticFire).ModeDoFire();
	// End:0x9D
	if(BallisticHandGrenade(Weapon).ClipReleaseTime > float(0))
	{
		BallisticHandGrenade(Weapon).ClipReleaseTime = -1.0000000;
	}
	//return;	
}

function float CalculateThrowPower()
{
	// End:0x11
	if(BW == none)
	{
		return 1.0000000;
	}
	// End:0x69
	if(BW.WeaponModes[int(BW.CurrentWeaponMode)].Value > float(0))
	{
		return 1.0000000 / BW.WeaponModes[int(BW.CurrentWeaponMode)].Value;
	}
	return 0.2000000 + (FClamp(HoldTime - 0.2000000, 0.0000000, 1.0000000) * 0.8000000);
	//return;	
}

function float CalculateThrowSpeed(float projSpeed)
{
	local Vector enemyDir;

	// End:0x27
	if(PlayerController(Instigator.Controller) != none)
	{
		return projSpeed * (CalculateThrowPower());
	}
	// End:0xF6
	if(Instigator.Controller.Enemy != none)
	{
		enemyDir = Instigator.Controller.Enemy.Location - Instigator.Location;
		return FMin(projSpeed, ((1.0000000 + Normal(enemyDir).Z) * (VSize(enemyDir) / 1.5000000)) + (VSize(Instigator.Controller.Enemy.Velocity) * (Normal(Instigator.Controller.Enemy.Velocity) Dot Normal(enemyDir))));
	}
	return projSpeed;
	//return;	
}

function float CalculateDetonateDelay(float DetonateDelay)
{
	// End:0x48
	if(BallisticHandGrenade(Weapon).ClipReleaseTime > 0.0000000)
	{
		return DetonateDelay - (Level.TimeSeconds - BallisticHandGrenade(Weapon).ClipReleaseTime);
	}
	return DetonateDelay;
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	proj = Spawn(ProjectileClass,,, Start, Dir);
	proj.Instigator = Instigator;
	// End:0x43
	if(BallisticHandGrenadeProjectile(proj) == none)
	{
		return;
	}
	BallisticHandGrenadeProjectile(proj).SetSpeedAndDelay(CalculateThrowSpeed(proj.Speed), CalculateDetonateDelay(BallisticHandGrenadeProjectile(proj).DetonateDelay));
	//return;	
}

defaultproperties
{
	bAISilent=true
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	bFireOnRelease=true
	FireRate=1.2000000
	BotRefireRate=0.5000000
}
