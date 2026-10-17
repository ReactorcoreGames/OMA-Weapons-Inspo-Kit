class HydraPrimaryFire extends BallisticProProjectileFire;

var() Class<Actor> HatchSmokeClass;
var Actor HatchSmoke;
var() Sound SteamSound;
var int MinMortarRange;

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x54
	if(Class'BCoreProV55.BallisticReplicationInfo'.default.bNoReloading && BW.AmmoAmount(0) > 1)
	{
		Weapon.SetBoneScale(0, 1.0000000, 'Rocket');		
	}
	else
	{
		// End:0x83
		if(BW.MagAmmo < 2)
		{
			Weapon.SetBoneScale(0, 0.0000000, 'Rocket');
		}
	}
	super.ModeDoFire();
	//return;	
}

function DoFireEffect()
{
	local Vector Start, End, X;
	local Rotator Aim;

	Aim = GetFireAim(Start);
	Aim = Rotator((GetFireSpread()) >> Aim);
	X = Normal(Vector(Aim));
	End = Start + (X * float(MinMortarRange));
	super(BallisticProjectileFire).DoFireEffect();
	//return;	
}

simulated function InitEffects()
{
	// End:0xFF
	if((HatchSmokeClass != none) && (HatchSmoke == none) || HatchSmoke.bDeleteMe)
	{
		HatchSmoke = Spawn(HatchSmokeClass, Weapon);
		// End:0x66
		if(HatchSmoke != none)
		{
			Weapon.AttachToBone(HatchSmoke, 'tip');
		}
		// End:0xA7
		if(Emitter(HatchSmoke) != none)
		{
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(HatchSmoke), Weapon.DrawScale * FlashScaleFactor);			
		}
		else
		{
			HatchSmoke.SetDrawScale((HatchSmoke.DrawScale * Weapon.DrawScale) * FlashScaleFactor);
		}
		// End:0xFF
		if(DGVEmitter(HatchSmoke) != none)
		{
			DGVEmitter(HatchSmoke).InitDGV();
		}
	}
	super(BallisticFire).InitEffects();
	//return;	
}

simulated function FlashHatchSmoke()
{
	// End:0x1B
	if(int(Level.DetailMode) < int(1))
	{
		return;
	}
	// End:0x112
	if((HatchSmoke != none) && Level.TimeSeconds < (NextFireTime + 3.0000000))
	{
		Weapon.PlaySound(SteamSound, 1, 0.3000000);
		Emitter(HatchSmoke).Emitters[0].SpawnOnTriggerRange.Min = Lerp(((NextFireTime + 3.0000000) - Level.TimeSeconds) / 3.8000000, 10.0000000, 70.0000000);
		Emitter(HatchSmoke).Emitters[0].SpawnOnTriggerRange.Max = Emitter(HatchSmoke).Emitters[0].SpawnOnTriggerRange.Min;
		HatchSmoke.Trigger(Weapon, Instigator);
	}
	//return;	
}

simulated function DestroyEffects()
{
	super(BallisticFire).DestroyEffects();
	// End:0x44
	if(HatchSmoke != none)
	{
		// End:0x38
		if(Emitter(HatchSmoke) != none)
		{
			Emitter(HatchSmoke).Kill();			
		}
		else
		{
			HatchSmoke.Destroy();
		}
	}
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	super(BallisticProjectileFire).SpawnProjectile(Start, Dir);
	// End:0x66
	if(HydraSeekerRocket(proj) != none)
	{
		HydraSeekerRocket(proj).Weapon = HydraBazooka(BW);
		HydraSeekerRocket(proj).LastLoc = HydraBazooka(BW).GetRocketDir();
	}
	//return;	
}

defaultproperties
{
	HatchSmokeClass=Class'BWBP_APC_Pro.HydraHatchEmitter'
	SteamSound=Sound'BW_Core_WeaponSound.G5.G5-Steam'
	MinMortarRange=1024
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	MuzzleFlashClass=Class'BWBP_APC_Pro.HydraFlashEmitter'
	FireRecoil=64.0000000
	FireChaos=0.5000000
	XInaccuracy=4.0000000
	YInaccuracy=4.0000000
	bSplashDamage=true
	bRecommendSplashDamage=true
	FireEndAnim="None"
	FireRate=0.8000000
	AmmoClass=Class'BWBP_APC_Pro.Ammo_HRPG'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=16.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.5000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.5000000
	ProjectileClass=Class'BWBP_APC_Pro.HydraRocket'
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
}
