class SMATSecondaryFire extends BallisticProjectileFire;

var float RailPower;
var float ChargeRate;
var float PowerLevel;
var int SoundAdjust;
var float MaxCharge;
var Sound ChargeSound;

simulated function bool AllowFire()
{
	// End:0x36
	if((SMATLauncher(BW).Heat > float(0)) || SMATLauncher(Weapon).bInUse)
	{
		return false;
	}
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
	// End:0x158
	if((RailPower + 0.0500000) >= PowerLevel)
	{
		BallisticFireSound.Volume = 0.7000000 + (RailPower * 0.8000000);
		BallisticFireSound.Radius = 280.0000000 + (RailPower * 350.0000000);
		SMATLauncher(BW).CoolRate = SMATLauncher(BW).default.CoolRate;
		Instigator.AmbientSound = BW.UsedAmbientSound;
		SMATLauncher(BW).PickupClass = none;
		SMATLauncher(BW).bExploded = true;
		super(BallisticFire).ModeDoFire();
		DoFireEffect();
		// End:0x155
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 200.0000000, Instigator, Instigator.Location, (-Vector(Instigator.GetViewRotation()) * float(30000)) + vect(0.0000000, 0.0000000, 10000.0000000), Class'BWBP_SKC_Pro.DTSMATSuicide');
			super(BallisticFire).ModeDoFire();
		}		
	}
	else
	{
		SMATLauncher(BW).Heat = 0.0000000;
		RailPower = 0.0000000;
	}
	SMATLauncher(BW).Heat += RailPower;
	RailPower = 0.0000000;
	//return;	
}

simulated function ModeTick(float dt)
{
	super(BallisticFire).ModeTick(dt);
	// End:0x5C
	if(SMATLauncher(Weapon).bInUse || SMATLauncher(BW).MagAmmo == 0)
	{
		Instigator.AmbientSound = BW.UsedAmbientSound;
		return;
	}
	// End:0xDF
	if(SMATLauncher(BW).Heat <= float(0))
	{
		MaxCharge = RailPower;
		// End:0xC2
		if(bIsFiring)
		{
			RailPower = FMin(RailPower + (ChargeRate * dt), PowerLevel);
			Instigator.AmbientSound = ChargeSound;			
		}
		else
		{
			Instigator.AmbientSound = BW.UsedAmbientSound;
		}
	}
	// End:0xEC
	if(!bIsFiring)
	{
		return;
	}
	// End:0x176
	if(RailPower >= PowerLevel)
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 400.0000000, Instigator, Instigator.Location, (-Vector(Instigator.GetViewRotation()) * float(30000)) + vect(0.0000000, 0.0000000, 10000.0000000), Class'BWBP_SKC_Pro.DTSMATSuicide');
		// End:0x176
		if(Weapon != none)
		{
			Weapon.ClientStopFire(ThisModeNum);
		}
	}
	//return;	
}

defaultproperties
{
	ChargeRate=0.7000000
	PowerLevel=1.0000000
	ChargeSound=Sound'BWBP_SKC_Sounds.SMAA.SMAT-Charge'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	bCockAfterFire=true
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	XInaccuracy=4.0000000
	YInaccuracy=4.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.BX5.BX5-Jump',Volume=9.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	bFireOnRelease=true
	bWaitForRelease=true
	bModeExclusive=false
	FireEndAnim="None"
	FireRate=0.8000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_SMAT'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=16.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.SMATGrenade'
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
}
