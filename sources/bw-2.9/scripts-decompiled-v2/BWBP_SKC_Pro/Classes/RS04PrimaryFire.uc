class RS04PrimaryFire extends BallisticProInstantFire;

simulated function OnEffectParamsChanged(int EffectIndex)
{
	super(BallisticFire).OnEffectParamsChanged(EffectIndex);
	// End:0x28
	if(RS04Pistol(Weapon).bHasKnife)
	{
		ApplyTacKnifeEffectParams();
	}
	//return;	
}

simulated function ApplyTacKnifeEffectParams()
{
	FireRecoil *= 1.5000000;
	FireChaos = 1.0000000;
	XInaccuracy = 256.0000000;
	YInaccuracy = 256.0000000;
	//return;	
}

simulated function PlayFireAnimations()
{
	// End:0x8B
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		BW.IdleAnim = 'IdleOpen';
		BW.ReloadAnim = 'ReloadOpen';
		// End:0x72
		if(int(BW.CurrentWeaponMode) == 1)
		{
			AimedFireAnim = 'FireOpen';
			FireAnim = 'FireDualOpen';			
		}
		else
		{
			AimedFireAnim = 'SightFireOpen';
			FireAnim = 'FireOpen';
		}		
	}
	else
	{
		BW.IdleAnim = 'Idle';
		BW.ReloadAnim = 'Reload';
		// End:0xE2
		if(int(BW.CurrentWeaponMode) == 1)
		{
			FireAnim = 'FireDual';
			AimedFireAnim = 'Fire';			
		}
		else
		{
			AimedFireAnim = 'SightFire';
			FireAnim = 'Fire';
		}
	}
	super(BallisticFire).PlayFireAnimations();
	//return;	
}

defaultproperties
{
	TraceRange=(Min=5000.0000000,Max=5500.0000000)
	DamageType=Class'BWBP_SKC_Pro.DTRS04Pistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTRS04PistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTRS04Pistol'
	KickForce=15000
	PenetrateForce=150
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	BrassOffset=(X=-25.0000000,Y=0.0000000,Z=0.0000000)
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FireRecoil=215.0000000
	FireChaos=0.2000000
	XInaccuracy=16.0000000
	YInaccuracy=16.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.M1911.M1911-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bModeExclusive=false
	FireEndAnim="None"
	FireAnimRate=1.7500000
	FireRate=0.1800000
	AmmoClass=Class'BallisticProV55.Ammo_45HV'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-60.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.1000000
	aimerror=900.0000000
}
