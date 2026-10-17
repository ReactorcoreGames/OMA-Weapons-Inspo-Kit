class LonghornPrimaryFire extends BallisticProProjectileFire;

var() Actor MuzzleFlash2;
var LonghornGrenade LastGrenade;
var float ArtilleryDelay;

function ServerPlayFiring()
{
	super(BallisticFire).ServerPlayFiring();
	LonghornLauncher(Weapon).LonghornFired();
	//return;	
}

function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	LonghornLauncher(Weapon).LonghornFired();
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	proj = Spawn(ProjectileClass,,, Start, Dir);
	proj.Instigator = Instigator;
	LastGrenade = LonghornGrenade(proj);
	//return;	
}

function StopFiring()
{
	super(BallisticFire).StopFiring();
	// End:0x97
	if((int(Weapon.Role) == int(ROLE_Authority)) && LastGrenade != none)
	{
		// End:0x86
		if(HoldTime > 0.3600000)
		{
			// End:0x73
			if((HoldTime > ArtilleryDelay) && !LastGrenade.bNoArtillery)
			{
				LastGrenade.ManualDetonate(true);				
			}
			else
			{
				LastGrenade.ManualDetonate(false);
			}			
		}
		else
		{
			LastGrenade.bFireReleased = true;
		}
	}
	HoldTime = 0.0000000;
	//return;	
}

simulated function Vector GetFireSpread()
{
	local float fX;
	local Rotator R;

	// End:0x1C
	if(BW.bScopeView)
	{
		return super.GetFireSpread();		
	}
	else
	{
		fX = FRand();
		R.Yaw = int((float(384) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
		R.Pitch = int((float(384) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
		return Vector(R);
	}
	//return;	
}

simulated event ModeHoldFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0xEC
	if(bIsJammed)
	{
		// End:0xC3
		if(BW.FireCount == 0)
		{
			bIsJammed = false;
			// End:0x6A
			if(bJamWastesAmmo && int(Weapon.Role) == int(ROLE_Authority))
			{
				ConsumedLoad += int(load);
				Timer();
			}
			// End:0xB3
			if(int(UnjamMethod) == int(3))
			{
				NextFireTime += FireRate;
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
				BW.FireCount++;
				return;
			}
			// End:0xC0
			if(!AllowFire())
			{
				return;
			}			
		}
		else
		{
			NextFireTime += FireRate;
			NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
			return;
		}
	}
	// End:0x16C
	if(BW != none)
	{
		BW.bPreventReload = true;
		BW.FireCount++;
		// End:0x16C
		if(int(BW.ReloadState) != int(0))
		{
			// End:0x15B
			if(int(Weapon.Role) == int(ROLE_Authority))
			{
				BW.bServerReloading = false;
			}
			BW.ReloadState = 0;
		}
	}
	ConsumedLoad += int(load);
	SetTimer(FMin(0.1000000, FireRate / float(2)), false);
	// End:0x220
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		DoFireEffect();
		// End:0x1D5
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x211
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x26A
	if(Instigator.IsLocallyControlled())
	{
		ShakeView();
		PlayFiring();
		FlashMuzzleFlash();
		StartMuzzleSmoke();		
	}
	else
	{
		ServerPlayFiring();
	}
	load = float(AmmoPerFire);
	// End:0x2C2
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x2FA
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
	}
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x53
	if(bFireOnRelease)
	{
		// End:0x35
		if(bIsFiring)
		{
			NextFireTime += (MaxHoldTime + FireRate);			
		}
		else
		{
			NextFireTime = Level.TimeSeconds + FireRate;
		}		
	}
	else
	{
		NextFireTime += FireRate;
		NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
	}
	// End:0x100
	if(BW != none)
	{
		// End:0xC7
		if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
		{
			BW.bNeedCock = true;
		}
		// End:0x100
		if(!BW.bPreventReload && BW.bNeedCock)
		{
			BW.CommonCockGun(0);
		}
	}
	//return;	
}

static function int GetDPSec()
{
	return int(default.ProjectileClass.default.Damage / 1.2500000);
	//return;	
}

simulated state ComboCharge
{
	function SpawnProjectile(Vector Start, Rotator Dir)
	{
		proj = Spawn(ProjectileClass,,, Start, Dir);
		proj.Instigator = Instigator;
		LonghornGrenade(proj).DetonationType = 1;
		LastGrenade = LonghornGrenade(proj);
		//return;		
	}
	stop;	
}

simulated state TimedCharge
{
	function SpawnProjectile(Vector Start, Rotator Dir)
	{
		proj = Spawn(ProjectileClass,,, Start, Dir);
		proj.Instigator = Instigator;
		LonghornGrenade(proj).DetonationType = 1;
		LonghornGrenade(proj).bFireReleased = true;
		LastGrenade = LonghornGrenade(proj);
		//return;		
	}
	stop;	
}

defaultproperties
{
	ArtilleryDelay=1.2500000
	BrassClass=Class'BWBP_SKC_Pro.Brass_Longhorn'
	bBrassOnCock=true
	BrassOffset=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	bFireOnRelease=true
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_Longhorn'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-300.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
}
