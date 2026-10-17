class KF8XPrimaryFire extends BallisticProjectileFire;

var() name NoMagFireAnim;

function ServerPlayFiring()
{
	// End:0x67
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	CheckClipFinished();
	// End:0xA9
	if(BW.MagAmmo == 1)
	{
		BW.SafePlayAnim(EmptyFireAnim, FireAnimRate, TweenTime,, "FIRE");		
	}
	else
	{
		// End:0xE3
		if(BW.bNoMag)
		{
			BW.SafePlayAnim(NoMagFireAnim, FireAnimRate, TweenTime,, "FIRE");			
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
	// End:0x2B
	if(KF8XCrossbow(BW).bNeedRotate)
	{
		KF8XCrossbow(BW).RotateClip();
	}
	// End:0x54
	if(int(ScopeDownOn) == int(1))
	{
		BW.TemporaryScopeDown(0.5000000, 0.9000000);
	}
	// End:0x90
	if(BW.MagAmmo == 1)
	{
		BW.SafePlayAnim(EmptyFireAnim, FireAnimRate, TweenTime,, "FIRE");		
	}
	else
	{
		// End:0xCA
		if(BW.bNoMag)
		{
			BW.SafePlayAnim(NoMagFireAnim, FireAnimRate, TweenTime,, "FIRE");			
		}
		else
		{
			BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
		}
	}
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0x168
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	CheckClipFinished();
	KF8XCrossbow(BW).bNeedRotate = true;
	//return;	
}

defaultproperties
{
	NoMagFireAnim="FireCycle"
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	EmptyFireAnim="FireCycle"
	XInaccuracy=6.0000000
	YInaccuracy=6.0000000
	BallisticFireSound=(Sound=Sound'BWBP_OP_Sounds.XBow.XBow-Fire',Volume=1.0000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bModeExclusive=false
	PreFireAnim="None"
	FireAnim="FireCycleRotate"
	FireForce="AssaultRifleAltFire"
	FireRate=1.5000000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_KF8XDarts'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-70.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_OP_Pro.KF8XToxicBolt'
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
}
