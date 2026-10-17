class PugSecondaryFire extends BallisticProProjectileFire;

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
	// End:0x35
	if(PugAssaultCannon(BW).Grenades < 1)
	{
		return false;
	}
	// End:0x4E
	if(PugAssaultCannon(BW).bAltNeedCock)
	{
		return false;
	}
	// End:0xE4
	if(!bUseWeaponMag || BW.bNoMag)
	{
		// End:0xE1
		if(!super(BallisticFire).AllowFire())
		{
			// End:0xDF
			if(DryFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
			}
			return false;
		}		
	}
	else
	{
		// End:0x1D8
		if(BW.MagAmmo < AmmoPerFire)
		{
			// End:0x178
			if(!bPlayedDryFire && DryFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
				bPlayedDryFire = true;
			}
			// End:0x192
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
			// End:0x1EC
			if(BW.bNeedReload)
			{
				return false;
			}
		}
	}
	return true;
	//return;	
}

simulated function ModeDoFire()
{
	super.ModeDoFire();
	PugAssaultCannon(BW).FragFired();
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

simulated function Vector GetFireSpread()
{
	local float fX;
	local Rotator R;

	// End:0x19
	if(BW.bScopeView)
	{
		return super(BallisticFire).GetFireSpread();
	}
	fX = FRand();
	R.Yaw = int((float(512) * Sin(FMin(Sqrt(FRand()), 1.0000000) * 1.5707960)) * Sin(fX * 1.5707960));
	// End:0x7E
	if(FRand() > 0.5000000)
	{
		R.Yaw = -R.Yaw;
	}
	R.Pitch = int((float(512) * Sin(FMin(Sqrt(FRand()), 1.0000000) * 1.5707960)) * Cos(fX * 1.5707960));
	// End:0xDB
	if(FRand() > 0.5000000)
	{
		R.Pitch = -R.Pitch;
	}
	return Vector(R);
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	BrassClass=Class'BWBP_SKC_Pro.Brass_FRAGSpent'
	BrassOffset=(X=-30.0000000,Y=1.0000000,Z=0.0000000)
	bUseWeaponMag=false
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireRecoil=2048.0000000
	FirePushbackForce=100.0000000
	FireChaos=1.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.PUG.PUG-FireSlug',Volume=2.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bFireOnRelease=true
	bWaitForRelease=true
	FireForce="AssaultRifleAltFire"
	FireRate=0.8000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_20mmGrenade'
	AmmoPerFire=0
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.PUGRocket'
	BotRefireRate=0.5000000
	WarnTargetPct=0.7500000
}
