class SMATPrimaryFire extends BallisticProjectileFire;

var() Class<Actor> HatchSmokeClass;
var Actor HatchSmoke;
var() Sound SteamSound;
var float RailPower;

simulated function bool AllowFire()
{
	return super(BallisticFire).AllowFire();
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	super(BallisticFire).ModeDoFire();
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

defaultproperties
{
	HatchSmokeClass=Class'BallisticProV55.G5HatchEmitter'
	SteamSound=Sound'BW_Core_WeaponSound.G5.G5-Steam'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	XInaccuracy=5.0000000
	YInaccuracy=5.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.SMAA.SMAT-Fire',Volume=9.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bSplashDamage=true
	bRecommendSplashDamage=true
	FireEndAnim="None"
	FireRate=0.0500000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_SMAT'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=16.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.5000000
	ShakeOffsetMag=(X=-50.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1600.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=5.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.SMATRocket'
	BotRefireRate=0.5000000
	WarnTargetPct=0.3000000
}
