class M763PrimaryFire extends BallisticProShotgunFire;

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
	// End:0x10E
	if(BW.MagAmmo < AmmoPerFire)
	{
		// End:0xAE
		if(!bPlayedDryFire && DryFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
			bPlayedDryFire = true;
		}
		// End:0xC8
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
		// End:0x125
		if(BW.bNeedReload)
		{
			return false;			
		}
		else
		{
			// End:0x152
			if(BW.bNeedCock || M763Shotgun(BW).bAltLoaded)
			{
				return false;
			}
		}
	}
	return true;
	//return;	
}

function PlayFiring()
{
	local float Rand;

	// End:0x48
	if(((BW.MagAmmo - ConsumedLoad) < 1) || Class'BCoreProV55.BallisticReplicationInfo'.static.IsRealism())
	{
		AimedFireAnim = 'FireSight';
		FireAnim = 'Fire';		
	}
	else
	{
		// End:0x11B
		if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassic())
		{
			Rand = FRand();
			// End:0x8A
			if(Rand > 0.8000000)
			{
				FireAnim = 'FireClassic';
				AimedFireAnim = 'FireSightClassic';				
			}
			else
			{
				// End:0xB2
				if(Rand > 0.6000000)
				{
					FireAnim = 'FireClassic2';
					AimedFireAnim = 'FireSightClassic';					
				}
				else
				{
					// End:0xDA
					if(Rand > 0.4000000)
					{
						FireAnim = 'FireClassic3';
						AimedFireAnim = 'FireSightClassic2';						
					}
					else
					{
						// End:0x102
						if(Rand > 0.2000000)
						{
							FireAnim = 'FireClassic4';
							AimedFireAnim = 'FireSightClassic2';							
						}
						else
						{
							FireAnim = 'FireClassic5';
							AimedFireAnim = 'FireSightClassic3';
						}
					}
				}
			}			
		}
		else
		{
			AimedFireAnim = 'FireCombinedSight';
			FireAnim = 'FireCombined';
		}
	}
	super(BallisticFire).PlayFiring();
	//return;	
}

function ServerPlayFiring()
{
	// End:0x48
	if(((BW.MagAmmo - ConsumedLoad) < 1) || Class'BCoreProV55.BallisticReplicationInfo'.static.IsRealism())
	{
		AimedFireAnim = 'FireSight';
		FireAnim = 'Fire';		
	}
	else
	{
		// End:0x73
		if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassic())
		{
			AimedFireAnim = 'FireCombinedSight';
			FireAnim = 'FireClassic';			
		}
		else
		{
			AimedFireAnim = 'FireCombinedSight';
			FireAnim = 'FireCombined';
		}
	}
	super(BallisticFire).ServerPlayFiring();
	//return;	
}

simulated function DestroyEffects()
{
	// End:0x17
	if(MuzzleFlash != none)
	{
		MuzzleFlash.Destroy();
	}
	super(BallisticFire).DestroyEffects();
	//return;	
}

defaultproperties
{
	HipSpreadFactor=4.0000000
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=3072.0000000,Max=3072.0000000)
	DamageType=Class'BallisticProV55.DTM763Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM763ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM763Shotgun'
	KickForce=500
	BrassClass=Class'BallisticProV55.Brass_Shotgun'
	BrassOffset=(X=-1.0000000,Y=0.0000000,Z=-1.0000000)
	MuzzleFlashClass=Class'BallisticProV55.M763FlashEmitter'
	AimedFireAnim="FireCombinedSight"
	FireRecoil=768.0000000
	FireChaos=0.3000000
	XInaccuracy=150.0000000
	YInaccuracy=150.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Fire1',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireAnim="FireCombined"
	FireEndAnim="None"
	FireAnimRate=0.9000000
	FireRate=0.8500000
	AmmoClass=Class'BallisticProV55.Ammo_12Gauge'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-300.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
}
