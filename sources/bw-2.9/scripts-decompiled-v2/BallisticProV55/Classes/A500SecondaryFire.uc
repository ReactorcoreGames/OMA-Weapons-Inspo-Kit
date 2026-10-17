class A500SecondaryFire extends BallisticProProjectileFire;

var Sound ChargingSound;
var int AcidLoad;
var const int MaxAcidLoad;

function ModeHoldFire()
{
	// End:0x5F
	if(BW.HasMagAmmo(byte(ThisModeNum)) && Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena() || Class'BCoreProV55.BallisticReplicationInfo'.static.IsTactical())
	{
		super(WeaponFire).ModeHoldFire();
		BW.bPreventReload = true;
		GotoState('HOLD');
	}
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	GotoState('None');
	// End:0x14
	if(AcidLoad == 0)
	{
		return;
	}
	proj = Spawn(ProjectileClass,,, Start, Dir);
	// End:0x88
	if(proj != none)
	{
		proj.Instigator = Instigator;
		A500AltProjectile(proj).AcidLoad = float(AcidLoad) / float(MaxAcidLoad);
		A500AltProjectile(proj).AdjustSpeed();
	}
	//return;	
}

state HOLD
{
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
		// End:0x119
		if((BW.MagAmmo == 0) && HoldTime == float(0))
		{
			// End:0xB9
			if(!bPlayedDryFire && DryFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
				bPlayedDryFire = true;
			}
			// End:0xD3
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
			// End:0x130
			if(BW.bNeedReload)
			{
				return false;				
			}
			else
			{
				// End:0x144
				if(BW.bNeedCock)
				{
					return false;
				}
			}
		}
		return true;
		//return;		
	}

	simulated function BeginState()
	{
		AcidLoad = 0;
		SetTimer(0.5000000, true);
		Instigator.AmbientSound = ChargingSound;
		Instigator.SoundRadius = 256.0000000;
		Instigator.SoundVolume = byte(255);
		Timer();
		//return;		
	}

	simulated function Timer()
	{
		// End:0x39
		if(BW.HasMagAmmo(byte(ThisModeNum)))
		{
			AcidLoad++;
			BW.ConsumeMagAmmo(ThisModeNum, 1.0000000);
		}
		// End:0x71
		if((AcidLoad == MaxAcidLoad) || !BW.HasMagAmmo(byte(ThisModeNum)))
		{
			SetTimer(0.0000000, false);
		}
		//return;		
	}

	simulated function EndState()
	{
		// End:0x73
		if((Weapon != none) && Instigator != none)
		{
			BW.bPreventReload = false;
			Instigator.AmbientSound = none;
			Instigator.SoundRadius = Instigator.default.SoundRadius;
			Instigator.SoundVolume = Instigator.default.SoundVolume;
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	ChargingSound=Sound'GeneralAmbience.texture22'
	AcidLoad=1
	MaxAcidLoad=8
	bTossed=true
	bInstantHit=true
	bFireOnRelease=true
	AmmoClass=Class'BallisticProV55.Ammo_A500Cells'
	AmmoPerFire=0
	ShakeRotMag=(X=32.0000000,Y=8.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.5000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-300.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	BotRefireRate=0.5000000
}
