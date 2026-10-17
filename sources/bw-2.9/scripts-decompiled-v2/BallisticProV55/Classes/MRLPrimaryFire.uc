class MRLPrimaryFire extends BallisticProjectileFire;

var MRocketLauncher MRL;
var int ConsumedLoadTwo;

simulated event PostBeginPlay()
{
	super(WeaponFire).PostBeginPlay();
	MRL = MRocketLauncher(Weapon);
	//return;	
}

simulated function bool AllowFire()
{
	// End:0xB2
	if((int(MRL.LoadedFrontBarrels) < AmmoPerFire) && int(MRL.LoadedBackBarrels) < AmmoPerFire)
	{
		// End:0xB0
		if((MRL.MagAmmo + MRL.BigMagAmmo) < AmmoPerFire)
		{
			// End:0xB0
			if(((int(Weapon.ClientState) == int(4)) && BW.FireCount < 1) && Instigator.IsLocallyControlled())
			{
				BW.ServerStartReload();
			}
		}
		return false;
	}
	// End:0xBF
	if(!CheckReloading())
	{
		return false;
	}
	// End:0xCC
	if(!CheckWeaponMode())
	{
		return false;
	}
	// End:0x162
	if(!bUseWeaponMag || BW.bNoMag)
	{
		// End:0x15F
		if(!super(BallisticFire).AllowFire())
		{
			// End:0x15D
			if(DryFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
			}
			return false;
		}		
	}
	else
	{
		// End:0x266
		if((MRL.MagAmmo + MRL.BigMagAmmo) < AmmoPerFire)
		{
			// End:0x206
			if(!bPlayedDryFire && DryFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
				bPlayedDryFire = true;
			}
			// End:0x220
			if(bDryUncock)
			{
				BW.bNeedCock = true;
			}
			BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), 0.0000000);
			BW.EmptyFire(byte(ThisModeNum));
			return false;			
		}
		else
		{
			// End:0x27D
			if(BW.bNeedReload)
			{
				return false;				
			}
			else
			{
				// End:0x291
				if(BW.bNeedCock)
				{
					return false;
				}
			}
		}
	}
	return true;
	//return;	
}

function DoFireEffect()
{
	super.DoFireEffect();
	// End:0xA0
	if((InStr(Level.Game.GameName, "Freon") != -1) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo) != none)
	{
		Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo).AddFireStat(int(load), 1);
	}
	// End:0x181
	if((int(MRL.LoadedBackBarrels) > 0) && ((int(MRL.LoadedFrontBarrels) < 1) || MRL.BigMagAmmo < 1) || (float(MRL.BarrelIndex) / 3.0000000) == float(MRL.BarrelIndex / 3))
	{
		MRL.LoadedBackBarrels--;
		// End:0x16E
		if(int(MRL.LoadedFrontBarrels) < 1)
		{
			MRL.BarrelIndex = int(float((MRL.BarrelIndex / 3) + 1) * 3.0000000);			
		}
		else
		{
			MRL.BarrelIndex++;
		}		
	}
	else
	{
		MRL.LoadedFrontBarrels--;
		ConsumedLoad -= int(load);
		ConsumedLoadTwo += int(load);
		MRL.BarrelIndex++;
	}
	// End:0x1E2
	if(MRL.BarrelIndex >= 18)
	{
		MRL.BarrelIndex = 0;
	}
	//return;	
}

function PlayFiring()
{
	// End:0x13F
	if(int(Weapon.Role) < int(ROLE_Authority))
	{
		// End:0xFA
		if((int(MRL.LoadedBackBarrels) > 0) && ((int(MRL.LoadedFrontBarrels) < 1) || MRL.BigMagAmmo < 1) || (float(MRL.BarrelIndex) / 3.0000000) == float(MRL.BarrelIndex / 3))
		{
			MRL.LoadedBackBarrels--;
			// End:0xE7
			if(int(MRL.LoadedFrontBarrels) < 1)
			{
				MRL.BarrelIndex = int(float((MRL.BarrelIndex / 3) + 1) * 3.0000000);				
			}
			else
			{
				MRL.BarrelIndex++;
			}			
		}
		else
		{
			MRL.LoadedFrontBarrels--;
			MRL.BarrelIndex++;
		}
		// End:0x13F
		if(MRL.BarrelIndex >= 18)
		{
			MRL.BarrelIndex = 0;
		}
	}
	// End:0x188
	if((FireCount > 0) && Weapon.HasAnim(FireLoopAnim))
	{
		BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");		
	}
	else
	{
		BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
	}
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0x226
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	CheckClipFinished();
	//return;	
}

function ServerPlayFiring()
{
	// End:0x67
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	CheckClipFinished();
	// End:0xB6
	if((FireCount > 0) && Weapon.HasAnim(FireLoopAnim))
	{
		BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");		
	}
	else
	{
		BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
	}
	//return;	
}

simulated event Timer()
{
	// End:0x3B
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		MRL.ConsumeMRLAmmo(ThisModeNum, float(ConsumedLoad), float(ConsumedLoadTwo));
	}
	ConsumedLoad = 0;
	ConsumedLoadTwo = 0;
	//return;	
}

function InitEffects()
{
	// End:0x1B
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0xA1
	if((MuzzleFlashClass != none) && (MuzzleFlash == none) || MuzzleFlash.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
		MRLFlashEmitter(MuzzleFlash).InitMRLFlash(MuzzleFlash.DrawScale);
	}
	//return;	
}

function FlashMuzzleFlash()
{
	// End:0x36
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x74
	if(!Instigator.IsFirstPerson() || PlayerController(Instigator.Controller).ViewTarget != Instigator)
	{
		return;
	}
	// End:0xBA
	if(MuzzleFlash != none)
	{
		MRLFlashEmitter(MuzzleFlash).SetBarrelIndex(MRL.BarrelIndex);
		MuzzleFlash.Trigger(Weapon, Instigator);
	}
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=28.0000000,Y=10.0000000,Z=-8.0000000)
	MuzzleFlashClass=Class'BallisticProV55.MRLFlashEmitter'
	FireChaos=0.1700000
	XInaccuracy=128.0000000
	YInaccuracy=128.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.MRL.MRL-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireRate=0.1100000
	AmmoClass=Class'BallisticProV55.Ammo_MRL'
	ShakeRotMag=(X=32.0000000,Y=8.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.5000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	ProjectileClass=Class'BallisticProV55.MRLRocket'
	WarnTargetPct=0.2000000
}
