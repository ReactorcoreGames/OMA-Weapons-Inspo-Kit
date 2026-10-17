class LightningPrimaryFire extends BallisticProInstantFire;

const CHARGE_TO_AMMO_FACTOR = 4f;
const AMMO_TO_CHARGE_FACTOR = 0.25f;

var() name ChargeAnim;
var() FullSound LightningSound;
var() Sound ChargeLoopSound;
var() byte ChargeLoopSoundVolume;
var byte ChargeSoundPitch;
var float ChargeGainPerSecond;
var float ChargeDecayPerSecond;
var float ChargeOvertime;
var float MaxChargeOvertime;
var bool bAmmoHasBeenCalculated;
var float MaxDamageBonus;
var float TransferDamageMultiplier;
var int FullChargeAmmo;

final function float CalcBonusDamageFactor()
{
	return 1.0000000 + (LightningRifle(BW).ChargePower * MaxDamageBonus);
	//return;	
}

simulated function ModeDoFire()
{
	load = float(CalculateAmmoUse());
	bAmmoHasBeenCalculated = true;
	super.ModeDoFire();
	//return;	
}

simulated function PlayStartHold()
{
	// End:0x55
	if(int(BW.Role) == int(ROLE_Authority))
	{
		Instigator.AmbientSound = ChargeLoopSound;
		Instigator.SoundVolume = ChargeLoopSoundVolume;
		Instigator.SoundPitch = ChargeSoundPitch;
	}
	AdjustChargeVolume();
	BW.bPreventReload = true;
	BW.SafeLoopAnim(ChargeAnim, 1.0000000, TweenTime,, "IDLE");
	//return;	
}

function AdjustChargeVolume()
{
	Instigator.SoundVolume = byte(float(127) + (LightningRifle(BW).ChargePower * float(64)));
	Instigator.SoundPitch = byte(float(ChargeSoundPitch) * (float(1) + (FMax(LightningRifle(BW).ChargePower, 0.1000000) / float(2))));
	//return;	
}

simulated function int CalculateAmmoUse()
{
	load = float(Max(1, int(LightningRifle(BW).ChargePower * float(FullChargeAmmo))));
	return Min(BW.MagAmmo, int(load));
	//return;	
}

simulated function ModeTick(float DeltaTime)
{
	local float max_allowed_charge;

	// End:0xAC
	if(bIsFiring)
	{
		max_allowed_charge = FMin(float(BW.MagAmmo) * 0.2500000, 1.0000000);
		LightningRifle(BW).SetChargePower(FMin(max_allowed_charge, LightningRifle(BW).ChargePower + (ChargeGainPerSecond * DeltaTime)));
		// End:0xA9
		if(LightningRifle(BW).ChargePower >= max_allowed_charge)
		{
			ChargeOvertime += DeltaTime;
			// End:0xA9
			if(ChargeOvertime >= MaxChargeOvertime)
			{
				bIsFiring = false;
			}
		}		
	}
	else
	{
		// End:0x19F
		if((LightningRifle(BW).ChargePower > float(0)) && bAmmoHasBeenCalculated)
		{
			LightningRifle(BW).SetChargePower(FMax(0.0000000, LightningRifle(BW).ChargePower - (ChargeDecayPerSecond * DeltaTime)));
			// End:0x194
			if(LightningRifle(BW).ChargePower == float(0))
			{
				bAmmoHasBeenCalculated = false;
				// End:0x194
				if(int(Weapon.Role) == int(ROLE_Authority))
				{
					Instigator.AmbientSound = none;
					Instigator.SoundVolume = Instigator.default.SoundVolume;
					Instigator.SoundPitch = Instigator.default.SoundPitch;
				}
			}
			ChargeOvertime = 0.0000000;
		}
	}
	// End:0x1D8
	if((int(Weapon.Role) == int(ROLE_Authority)) && Instigator.AmbientSound == ChargeLoopSound)
	{
		AdjustChargeVolume();
	}
	super(BallisticFire).ModeTick(DeltaTime);
	//return;	
}

function ServerPlayFiring()
{
	super(BallisticFire).ServerPlayFiring();
	// End:0x6D
	if(LightningSound.Sound != none)
	{
		Weapon.PlayOwnedSound(LightningSound.Sound, LightningSound.Slot, LightningSound.Volume, LightningSound.bNoOverride, LightningSound.Radius, LightningSound.Pitch, LightningSound.bAtten);
	}
	//return;	
}

simulated function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	// End:0x6D
	if(LightningSound.Sound != none)
	{
		Weapon.PlayOwnedSound(LightningSound.Sound, LightningSound.Slot, LightningSound.Volume, LightningSound.bNoOverride, LightningSound.Radius, LightningSound.Pitch, LightningSound.bAtten);
	}
	//return;	
}

function ApplyDamage(Actor Target, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	local LightningConductor LConductor;

	Damage *= CalcBonusDamageFactor();
	super(BallisticInstantFire).ApplyDamage(Target, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x43
	if(LightningProjectile(Target) != none)
	{
		return;
	}
	// End:0x76
	if(!Class'BWBP_OP_Pro.LightningConductor'.static.ValidTarget(Instigator, Pawn(Target), Instigator.Level))
	{
		return;
	}
	LConductor = Spawn(Class'BWBP_OP_Pro.LightningConductor', Instigator,, HitLocation);
	// End:0x109
	if(LConductor != none)
	{
		LConductor.Instigator = Instigator;
		LConductor.Damage = int(float(Damage) * TransferDamageMultiplier);
		LConductor.ChargePower = LightningRifle(BW).ChargePower;
		LConductor.Initialize(Target);		
	}
	else
	{
		Log("ApplyDamage: Failed to spawn lightning conductor");
	}
	//return;	
}

defaultproperties
{
	ChargeAnim="ChargeLoop"
	LightningSound=(Sound=Sound'BWBP_OP_Sounds.Lightning.LightningGunCrackle',Volume=0.8000000,Radius=1024.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	ChargeLoopSound=Sound'IndoorAmbience.machinery18'
	ChargeLoopSoundVolume=200
	ChargeSoundPitch=32
	ChargeGainPerSecond=1.0000000
	ChargeDecayPerSecond=4.0000000
	MaxChargeOvertime=1.0000000
	MaxDamageBonus=0.5000000
	TransferDamageMultiplier=0.6700000
	FullChargeAmmo=4
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	MaxWaterTraceRange=30000.0000000
	WaterRangeAtten=0.8000000
	DamageType=Class'BWBP_OP_Pro.DT_LightningRifle'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_LightningHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_LightningRifle'
	PDamageFactor=0.8000000
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	bBrassOnCock=true
	BrassOffset=(X=-10.0000000,Y=1.0000000,Z=-1.0000000)
	MuzzleFlashClass=Class'BWBP_OP_Pro.LightningFlashEmitter'
	FlashScaleFactor=0.6000000
	FireRecoil=1024.0000000
	FirePushbackForce=256.0000000
	FireChaos=0.8000000
	BallisticFireSound=(Sound=Sound'BWBP_OP_Sounds.Lightning.LightningGunShot',Volume=1.6000000,Radius=1024.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bFireOnRelease=true
	FireAnim="FireCharged"
	FireAnimRate=0.8000000
	FireRate=0.8500000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_LightningRifle'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-70.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.4000000
	WarnTargetPct=0.5000000
	aimerror=800.0000000
}
