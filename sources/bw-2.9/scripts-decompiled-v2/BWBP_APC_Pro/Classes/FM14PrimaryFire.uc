class FM14PrimaryFire extends BallisticProShotgunFire;

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
			if(BW.bNeedCock || FM14Shotgun(BW).bAltLoaded)
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
	// End:0x34
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		AimedFireAnim = 'SightfireNoCock';
		FireAnim = 'FireNoCock';		
	}
	else
	{
		AimedFireAnim = 'SightFire';
		FireAnim = 'Fire';
	}
	super(BallisticFire).PlayFiring();
	//return;	
}

function ServerPlayFiring()
{
	// End:0x34
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		AimedFireAnim = 'SightfireNoCock';
		FireAnim = 'FireNoCock';		
	}
	else
	{
		AimedFireAnim = 'SightFire';
		FireAnim = 'Fire';
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

simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
{
	BW.TargetedHurtRadius(5.0000000, 96.0000000, DamageType, 1.0000000, HitLocation, Pawn(Other));
	return super(BallisticShotgunFire).ImpactEffect(HitLocation, HitNormal, HitMat, Other, WaterHitLoc);
	//return;	
}

defaultproperties
{
	HipSpreadFactor=3.0000000
	TraceCount=1
	TracerClass=Class'BallisticProV55.TraceEmitter_AP'
	ImpactManager=Class'BallisticProV55.IM_BigBulletHMG'
	TraceRange=(Min=3072.0000000,Max=3072.0000000)
	DecayRange=(Min=1562.0000000,Max=3124.0000000)
	Damage=80.0000000
	RangeAtten=0.1500000
	DamageType=Class'BWBP_APC_Pro.DTFM14Shotgun'
	DamageTypeHead=Class'BWBP_APC_Pro.DTFM14ShotgunHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTFM14Shotgun'
	KickForce=5000
	BrassClass=Class'BallisticProV55.Brass_Shotgun'
	BrassOffset=(X=-1.0000000,Y=0.0000000,Z=-1.0000000)
	MuzzleFlashClass=Class'BWBP_APC_Pro.FM14FlashEmitter'
	AimedFireAnim="FireCombinedSight"
	FireRecoil=768.0000000
	FireChaos=0.3000000
	XInaccuracy=150.0000000
	YInaccuracy=150.0000000
	BallisticFireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FM13.FM13-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireAnim="FireCombined"
	FireEndAnim="None"
	FireAnimRate=0.9000000
	FireRate=0.8500000
	AmmoClass=Class'BWBP_APC_Pro.Ammo_FM14SlugGauge'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
}
