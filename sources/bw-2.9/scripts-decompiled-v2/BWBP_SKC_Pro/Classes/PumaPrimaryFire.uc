class PumaPrimaryFire extends BallisticProProjectileFire;

var float ModifiedDetonateDelay;
var byte LastFireMode;

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x66
	if(PumaRepeater(Weapon).bShieldUp)
	{
		PumaRepeater(BW).ParamsClasses[int(PumaRepeater(BW).GameStyleIndex)].static.OverrideFireParams(PumaRepeater(BW), 3);		
	}
	else
	{
		PumaRepeater(BW).ParamsClasses[int(PumaRepeater(BW).GameStyleIndex)].static.OverrideFireParams(PumaRepeater(BW), int(LastFireMode));
	}
	super.ModeDoFire();
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	local float DetonateDelay;

	proj = Spawn(ProjectileClass,,, Start, Dir);
	proj.Instigator = Instigator;
	// End:0x97
	if(PumaProjectileRanged(proj) != none)
	{
		// End:0x5E
		if(ModifiedDetonateDelay != default.ModifiedDetonateDelay)
		{
			DetonateDelay = ModifiedDetonateDelay;			
		}
		else
		{
			DetonateDelay = PumaProjectileRanged(proj).DetonateDelay;
		}
		PumaProjectileRanged(proj).NewDetonateDelay = FMax(DetonateDelay, 0.1000000);
	}
	//return;	
}

function SetDet(float DetDist)
{
	ModifiedDetonateDelay = DetDist;
	//return;	
}

simulated function AdjustProps(byte newmode)
{
	FireRate = Params.FireInterval;
	// End:0x7E
	if((PumaRepeater(BW).PriDetRangeM < 30) && int(newmode) == 2)
	{
		// End:0x73
		if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena() || Class'BCoreProV55.BallisticReplicationInfo'.static.IsTactical())
		{
			FireRate *= 1.2000000;			
		}
		else
		{
			FireRate *= float(2);
		}
	}
	// End:0x9C
	if(Weapon.bBerserk)
	{
		FireRate *= 0.5000000;
	}
	// End:0xDB
	if(Level.GRI.WeaponBerserk > 1.0000000)
	{
		FireRate /= Level.GRI.WeaponBerserk;
	}
	//return;	
}

simulated function SwitchCannonMode(byte newmode)
{
	LastFireMode = newmode;
	FireRate = Params.FireInterval;
	// End:0x89
	if((PumaRepeater(BW).PriDetRangeM < 30) && int(newmode) == 2)
	{
		// End:0x7E
		if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena() || Class'BCoreProV55.BallisticReplicationInfo'.static.IsTactical())
		{
			FireRate *= 1.2000000;			
		}
		else
		{
			FireRate *= float(2);
		}
	}
	// End:0xA7
	if(Weapon.bBerserk)
	{
		FireRate *= 0.5000000;
	}
	// End:0xE6
	if(Level.GRI.WeaponBerserk > 1.0000000)
	{
		FireRate /= Level.GRI.WeaponBerserk;
	}
	load = float(AmmoPerFire);
	//return;	
}

function StartBerserk()
{
	FireRate = Params.FireInterval;
	// End:0x87
	if((PumaRepeater(BW).PriDetRangeM < 30) && int(BW.CurrentWeaponMode) == 2)
	{
		// End:0x7C
		if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena() || Class'BCoreProV55.BallisticReplicationInfo'.static.IsTactical())
		{
			FireRate *= 1.2000000;			
		}
		else
		{
			FireRate *= float(2);
		}
	}
	FireRate *= 0.5000000;
	FireAnimRate = default.FireAnimRate / 0.7500000;
	ReloadAnimRate = default.ReloadAnimRate / 0.7500000;
	//return;	
}

function StopBerserk()
{
	FireRate = Params.FireInterval;
	// End:0x87
	if((PumaRepeater(BW).PriDetRangeM < 30) && int(BW.CurrentWeaponMode) == 2)
	{
		// End:0x7C
		if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena() || Class'BCoreProV55.BallisticReplicationInfo'.static.IsTactical())
		{
			FireRate *= 1.2000000;			
		}
		else
		{
			FireRate *= float(2);
		}
	}
	FireAnimRate = default.FireAnimRate;
	ReloadAnimRate = default.ReloadAnimRate;
	//return;	
}

function StartSuperBerserk()
{
	FireRate = Params.FireInterval;
	// End:0x87
	if((PumaRepeater(BW).PriDetRangeM < 30) && int(BW.CurrentWeaponMode) == 2)
	{
		// End:0x7C
		if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena() || Class'BCoreProV55.BallisticReplicationInfo'.static.IsTactical())
		{
			FireRate *= 1.2000000;			
		}
		else
		{
			FireRate *= float(2);
		}
	}
	FireRate /= Level.GRI.WeaponBerserk;
	FireAnimRate = default.FireAnimRate * Level.GRI.WeaponBerserk;
	ReloadAnimRate = default.ReloadAnimRate * Level.GRI.WeaponBerserk;
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	BrassClass=Class'BWBP_SKC_Pro.Brass_PUMA'
	BrassOffset=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	AimedFireAnim="SightFire"
	FireRecoil=128.0000000
	FireChaos=0.5000000
	XInaccuracy=32.0000000
	YInaccuracy=32.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	bModeExclusive=false
	FireForce="AssaultRifleAltFire"
	FireRate=0.9500000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_20mmPuma'
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-300.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.PumaProjectile'
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
}
