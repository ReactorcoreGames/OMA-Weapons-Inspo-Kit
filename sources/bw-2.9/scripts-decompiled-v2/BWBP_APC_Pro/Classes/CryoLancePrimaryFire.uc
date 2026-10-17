class CryoLancePrimaryFire extends BallisticProInstantFire;

var() Sound FireSoundLoop;
var float StopFireTime;
var bool bLaserFiring;
var float LaserCharge;
var float MaxCharge;
var() Sound ChargeSound;

simulated function bool AllowFire()
{
	// End:0x20
	if((LaserCharge > float(0)) && LaserCharge < MaxCharge)
	{
		return false;
	}
	// End:0x3C
	if(!super(BallisticFire).AllowFire())
	{
		// End:0x3A
		if(bLaserFiring)
		{
			StopFiring();
		}
		return false;
	}
	return true;
	//return;	
}

simulated event Timer()
{
	super(BallisticFire).Timer();
	// End:0x63
	if(bLaserFiring && !IsFiring())
	{
		bLaserFiring = false;
		Instigator.AmbientSound = CryoLanceLauncher(BW).UsedAmbientSound;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
	}
	//return;	
}

simulated function PlayPreFire()
{
	Instigator.AmbientSound = ChargeSound;
	Instigator.SoundVolume = byte(255);
	super(BallisticFire).PlayPreFire();
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x8F
	if(((LaserCharge + 0.0100000) >= MaxCharge) || AIController(Instigator.Controller) != none)
	{
		super.ModeDoFire();
		CryoLanceLauncher(BW).CoolRate = CryoLanceLauncher(BW).default.CoolRate * (float(1) + (0.2000000 * float(int(BW.bBerserk))));		
	}
	else
	{
		CryoLanceLauncher(BW).CoolRate = (CryoLanceLauncher(BW).default.CoolRate * float(3)) * (float(1) + (0.2000000 * float(int(BW.bBerserk))));
	}
	//return;	
}

simulated function ModeTick(float dt)
{
	super(BallisticFire).ModeTick(dt);
	// End:0x9A
	if(((CryoLanceLauncher(BW).Heat > float(0)) || !bIsFiring) || CryoLanceLauncher(BW).MagAmmo == 0)
	{
		LaserCharge = FMax(0.0000000, LaserCharge - ((CryoLanceLauncher(BW).CoolRate * dt) * float(1 + (2 * int(BW.bBerserk)))));
		return;
	}
	LaserCharge = FMin(LaserCharge + ((CryoLanceLauncher(BW).ChargeRate * dt) * float(1 + (2 * int(BW.bBerserk)))), MaxCharge);
	//return;	
}

function DoFireEffect()
{
	bLaserFiring = true;
	super(BallisticInstantFire).DoFireEffect();
	//return;	
}

function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	Instigator.AmbientSound = CryoLanceLauncher(BW).UsedAmbientSound;
	Instigator.SoundVolume = Instigator.default.SoundVolume;
	bLaserFiring = true;
	//return;	
}

function ServerPlayFiring()
{
	super(BallisticFire).ServerPlayFiring();
	Instigator.AmbientSound = CryoLanceLauncher(BW).UsedAmbientSound;
	Instigator.SoundVolume = Instigator.default.SoundVolume;
	bLaserFiring = true;
	//return;	
}

function StopFiring()
{
	Instigator.AmbientSound = CryoLanceLauncher(BW).UsedAmbientSound;
	Instigator.SoundVolume = Instigator.default.SoundVolume;
	StopFireTime = Level.TimeSeconds;
	bLaserFiring = false;
	//return;	
}

defaultproperties
{
	FireSoundLoop=Sound'BWBP_SKC_Sounds.XM20.XM20-Lase'
	MaxCharge=1.0000000
	ChargeSound=Sound'BWBP_SKC_Sounds.LS440.LS440-SpinUp'
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	DecayRange=(Min=2048.0000000,Max=5120.0000000)
	WallPenetrationForce=16.0000000
	Damage=20.0000000
	RangeAtten=0.3500000
	DamageType=Class'BWBP_SKC_Pro.DT_MARSAssault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MARSAssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MARSAssault'
	PenetrateForce=150
	BrassClass=Class'BallisticProV55.Brass_MG'
	BrassOffset=(X=-80.0000000,Y=1.0000000,Z=0.0000000)
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MARSFlashEmitter'
	FlashScaleFactor=0.5000000
	AimedFireAnim="SightFire"
	FireRecoil=140.0000000
	FireChaos=0.0200000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.1600000,OutVal=1.0000000),(InVal=0.2500000,OutVal=1.5000000),(InVal=0.5000000,OutVal=2.2500000),(InVal=0.7500000,OutVal=3.5000000),(InVal=1.0000000,OutVal=5.0000000)))
	XInaccuracy=48.0000000
	YInaccuracy=48.0000000
	SilencedFireSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.F2000-SilFire2',Volume=1.1000000,Radius=192.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-RapidFire',Volume=1.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	PreFireAnim="LoopStart"
	FireLoopAnim="LoopFire"
	FireEndAnim="LoopEnd"
	FireRate=0.0800000
	AmmoClass=Class'BallisticProV55.Ammo_556mm'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	WarnTargetPct=0.2000000
	aimerror=900.0000000
}
