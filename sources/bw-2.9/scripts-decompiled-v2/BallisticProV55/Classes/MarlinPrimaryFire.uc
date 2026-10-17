class MarlinPrimaryFire extends BallisticProInstantFire;

var() FullSound GaussSound;
var bool bGauss;

function ServerPlayFiring()
{
	// End:0x67
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	// End:0xD9
	if((GaussSound.Sound != none) && bGauss)
	{
		Weapon.PlayOwnedSound(GaussSound.Sound, GaussSound.Slot, GaussSound.Volume, GaussSound.bNoOverride, GaussSound.Radius, GaussSound.Pitch, GaussSound.bAtten);
	}
	CheckClipFinished();
	// End:0x157
	if(AimedFireAnim != 'None')
	{
		// End:0x12A
		if(!BW.bScopeView)
		{
			BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");			
		}
		else
		{
			BW.SafePlayAnim(AimedFireAnim, FireAnimRate, TweenTime,, "AIMEDFIRE");
		}		
	}
	else
	{
		// End:0x1A0
		if((FireCount > 0) && Weapon.HasAnim(FireLoopAnim))
		{
			BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");			
		}
		else
		{
			BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
		}
	}
	//return;	
}

function PlayFiring()
{
	// End:0x29
	if(int(ScopeDownOn) == int(1))
	{
		BW.TemporaryScopeDown(0.5000000, 0.9000000);
	}
	// End:0xA1
	if(AimedFireAnim != 'None')
	{
		// End:0x74
		if(!BW.bScopeView)
		{
			BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");			
		}
		else
		{
			BW.SafePlayAnim(AimedFireAnim, FireAnimRate, TweenTime,, "AIMEDFIRE");
		}		
	}
	else
	{
		// End:0xEA
		if((FireCount > 0) && Weapon.HasAnim(FireLoopAnim))
		{
			BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");			
		}
		else
		{
			BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
		}
	}
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0x188
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	// End:0x1FA
	if((GaussSound.Sound != none) && bGauss)
	{
		Weapon.PlayOwnedSound(GaussSound.Sound, GaussSound.Slot, GaussSound.Volume, GaussSound.bNoOverride, GaussSound.Radius, GaussSound.Pitch, GaussSound.bAtten);
	}
	CheckClipFinished();
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	bGauss = MarlinRifle(BW).bHasGauss && MarlinRifle(BW).GaussLevel == MarlinRifle(BW).MaxGaussLevel;
	super.ModeDoFire();
	// End:0x119
	if(bGauss)
	{
		// End:0x9C
		if(MarlinRifle(BW).GaussGlow1 != none)
		{
			MarlinRifle(BW).GaussGlow1.bHidden = true;
		}
		// End:0xD4
		if(MarlinRifle(BW).GaussGlow2 != none)
		{
			MarlinRifle(BW).GaussGlow2.bHidden = true;
		}
		MarlinRifle(BW).GaussLevel = 0.0000000;
		MarlinRifle(BW).ServerSwitchWeaponMode(0);
		MarlinRifle(BW).ClientSwitchWeaponMode(0);
	}
	//return;	
}

simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
{
	MarlinAttachment(Weapon.ThirdPersonActor).bGauss = bGauss;
	super(BallisticFire).SendFireEffect(Other, HitLocation, HitNormal, Surf, WaterHitLoc);
	//return;	
}

defaultproperties
{
	GaussSound=(Sound=Sound'BW_Core_WeaponSound.LightningGun.LG-FireStart2',Volume=0.8000000,Radius=1024.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	WallPenetrationForce=24.0000000
	RangeAtten=0.7500000
	WaterRangeAtten=0.8000000
	DamageType=Class'BallisticProV55.DTMarlinRifle'
	DamageTypeHead=Class'BallisticProV55.DTMarlinRifleHead'
	DamageTypeArm=Class'BallisticProV55.DTMarlinRifle'
	PenetrateForce=150
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	bBrassOnCock=true
	BrassOffset=(X=-70.0000000,Y=-12.0000000,Z=10.0000000)
	bCockAfterFire=true
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	AimedFireAnim="SightFireCock"
	FireRecoil=768.0000000
	FireChaos=0.8000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.Marlin.Mar-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireAnimRate=1.1500000
	FireRate=0.8000000
	AmmoClass=Class'BallisticProV55.Ammo_Marlin'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-300.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
}
