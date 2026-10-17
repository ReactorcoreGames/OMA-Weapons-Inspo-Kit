class SX45PrimaryFire extends BallisticProInstantFire;

var(SX45) Actor MuzzleFlashAmp1;
var(SX45) Actor MuzzleFlashAmp2;
var(SX45) Class<Actor> MuzzleFlashClassAmp1;
var(SX45) Class<Actor> MuzzleFlashClassAmp2;
var(SX45) name AmpFlashBone;
var(SX45) float AmpFlashScaleFactor1;
var(SX45) float AmpFlashScaleFactor2;
var(SX45) bool bAmped;
var(SX45) float AmpDrainPerShot;

function InitEffects()
{
	// End:0x1B
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x7F
	if((MuzzleFlashClass != none) && (MuzzleFlash == none) || MuzzleFlash.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	}
	// End:0xE3
	if((MuzzleFlashClassAmp1 != none) && (MuzzleFlashAmp1 == none) || MuzzleFlashAmp1.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashAmp1, MuzzleFlashClassAmp1, Weapon.DrawScale * AmpFlashScaleFactor1, Weapon, AmpFlashBone);
	}
	// End:0x147
	if((MuzzleFlashClassAmp2 != none) && (MuzzleFlashAmp2 == none) || MuzzleFlashAmp2.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashAmp2, MuzzleFlashClassAmp2, Weapon.DrawScale * AmpFlashScaleFactor2, Weapon, AmpFlashBone);
	}
	//return;	
}

function FlashMuzzleFlash()
{
	// End:0x36
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x74
	if(!Instigator.IsFirstPerson() || PlayerController(Instigator.Controller).ViewTarget != Instigator)
	{
		return;
	}
	// End:0xB8
	if((MuzzleFlashAmp1 != none) && int(SX45Pistol(Weapon).CurrentWeaponMode) == 1)
	{
		MuzzleFlashAmp1.Trigger(Weapon, Instigator);		
	}
	else
	{
		// End:0xFD
		if((MuzzleFlashAmp2 != none) && int(SX45Pistol(Weapon).CurrentWeaponMode) == 2)
		{
			MuzzleFlashAmp2.Trigger(Weapon, Instigator);			
		}
		else
		{
			MuzzleFlash.Trigger(Weapon, Instigator);
		}
	}
	// End:0x127
	if(!bBrassOnCock)
	{
		EjectBrass();
	}
	//return;	
}

simulated function DestroyEffects()
{
	super(BallisticFire).DestroyEffects();
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlash);
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashAmp1);
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashAmp2);
	//return;	
}

simulated function SwitchWeaponMode(byte newmode)
{
	// End:0x23
	if(int(newmode) == 0)
	{
		FlashBone = FlashBone;
		bAmped = false;		
	}
	else
	{
		// End:0x46
		if(int(newmode) == 1)
		{
			FlashBone = AmpFlashBone;
			bAmped = true;			
		}
		else
		{
			// End:0x6A
			if(int(newmode) == 2)
			{
				FlashBone = AmpFlashBone;
				bAmped = true;				
			}
			else
			{
				FlashBone = FlashBone;
				bAmped = false;
			}
		}
	}
	// End:0x9B
	if(Weapon.bBerserk)
	{
		FireRate *= 0.7500000;
	}
	// End:0xDA
	if(Level.GRI.WeaponBerserk > 1.0000000)
	{
		FireRate /= Level.GRI.WeaponBerserk;
	}
	//return;	
}

function PlayFiring()
{
	// End:0x5C
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		BW.IdleAnim = 'IdleOpen';
		BW.ReloadAnim = 'ReloadOpen';
		AimedFireAnim = 'SightFireOpen';
		FireAnim = 'FireOpen';		
	}
	else
	{
		BW.IdleAnim = 'Idle';
		BW.ReloadAnim = 'Reload';
		AimedFireAnim = 'SightFire';
		FireAnim = 'Fire';
	}
	super(BallisticFire).PlayFiring();
	// End:0xC2
	if(bAmped)
	{
		SX45Pistol(BW).AddHeat(AmpDrainPerShot);
	}
	//return;	
}

function DoFireEffect()
{
	super(BallisticInstantFire).DoFireEffect();
	// End:0x38
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		SX45Pistol(BW).AddHeat(AmpDrainPerShot);
	}
	//return;	
}

function ApplyDamage(Actor Target, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	super(BallisticInstantFire).ApplyDamage(Target, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0xA4
	if((((Pawn(Target) != none) && Pawn(Target).Health > 0) && Vehicle(Target) == none) && int(SX45Pistol(Weapon).CurrentWeaponMode) == 1)
	{
		Class'BCoreProV55.BCSprintControl'.static.AddSlowTo(Pawn(Target), 0.7000000, 0.3500000);		
	}
	else
	{
		// End:0xF6
		if(((Pawn(Target) != none) && Pawn(Target).bProjTarget) && int(SX45Pistol(Weapon).CurrentWeaponMode) == 2)
		{
			TryPlague(Target);
		}
	}
	//return;	
}

function bool AllowPlague(Actor Other)
{
	return ((((Pawn(Other) != none) && Pawn(Other).Health > 0) && Vehicle(Other) == none) && (Pawn(Other).GetTeamNum() == 255) || Pawn(Other).GetTeamNum() != Instigator.GetTeamNum()) && (Level.TimeSeconds - Pawn(Other).SpawnTime) > DeathMatch(Level.Game).SpawnProtectionTime;
	//return;	
}

function TryPlague(Actor Other)
{
	local SX45PlagueEffect RPE;

	// End:0xBD
	if(AllowPlague(Other))
	{
		// End:0x3C
		foreach Other.BasedActors(Class'BWBP_SKC_Pro.SX45PlagueEffect', RPE)
		{
			RPE.ExtendDuration(2.0000000);			
		}		
		// End:0xBD
		if(RPE == none)
		{
			RPE = Spawn(Class'BWBP_SKC_Pro.SX45PlagueEffect', Other,, Other.Location);
			RPE.Initialize(Other);
			// End:0xBD
			if(Instigator != none)
			{
				RPE.Instigator = Instigator;
				RPE.InstigatorController = Instigator.Controller;
			}
		}
	}
	//return;	
}

defaultproperties
{
	MuzzleFlashClassAmp1=Class'BWBP_SKC_Pro.SX45CryoFlash'
	MuzzleFlashClassAmp2=Class'BWBP_SKC_Pro.SX45RadMuzzleFlash'
	AmpFlashBone="tip2"
	AmpFlashScaleFactor1=1.0000000
	AmpFlashScaleFactor2=2.5000000
	AmpDrainPerShot=-0.8500000
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DamageType=Class'BWBP_SKC_Pro.DTSX45Pistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSX45PistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSX45Pistol'
	PenetrateForce=135
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	BrassOffset=(X=-14.0000000,Y=0.0000000,Z=-5.0000000)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SX45FlashEmitter'
	FlashScaleFactor=0.9000000
	AimedFireAnim="SightFire"
	FireRecoil=192.0000000
	FireChaos=0.2500000
	XInaccuracy=96.0000000
	YInaccuracy=96.0000000
	BallisticFireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.SX45.SX45-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireAnimRate=1.2500000
	FireRate=0.2000000
	AmmoClass=Class'BallisticProV55.Ammo_45HV'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-70.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.7500000
}
