class GRSXXPrimaryFire extends BallisticProInstantFire;

var(GRSXX) Actor MuzzleFlashNaked;
var(GRSXX) Class<Actor> MuzzleFlashClassNaked;
var(GRSXX) name NakedFlashBone;
var(GRSXX) float NakedFlashScaleFactor;
var(GRSXX) bool bAmped;
var(GRSXX) float AmpDrainPerShot;
var(GRSXX) bool bRemovableAmp;

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
	if((MuzzleFlashClassNaked != none) && (MuzzleFlashNaked == none) || MuzzleFlashNaked.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashNaked, MuzzleFlashClassNaked, Weapon.DrawScale * NakedFlashScaleFactor, Weapon, NakedFlashBone);
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
	// End:0xD1
	if(((MuzzleFlashNaked != none) && int(GRSXXPistol(Weapon).CurrentWeaponMode) != 3) && bRemovableAmp || !bAmped)
	{
		MuzzleFlashNaked.Trigger(Weapon, Instigator);		
	}
	else
	{
		MuzzleFlash.Trigger(Weapon, Instigator);
	}
	// End:0xFB
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
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashNaked);
	//return;	
}

simulated function SwitchWeaponMode(byte newmode)
{
	// End:0x3C
	if((int(newmode) != 3) && bRemovableAmp || !bAmped)
	{
		FlashBone = NakedFlashBone;
		bAmped = false;		
	}
	else
	{
		// End:0x60
		if(int(newmode) == 3)
		{
			FlashBone = FlashBone;
			bAmped = true;			
		}
		else
		{
			FlashBone = FlashBone;
			bAmped = true;
		}
	}
	// End:0x91
	if(Weapon.bBerserk)
	{
		FireRate *= 0.7500000;
	}
	// End:0xD0
	if(Level.GRI.WeaponBerserk > 1.0000000)
	{
		FireRate /= Level.GRI.WeaponBerserk;
	}
	//return;	
}

function PlayFiring()
{
	// End:0x8E
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		BW.IdleAnim = 'OpenIdle';
		BW.ReloadAnim = 'OpenReload';
		GRSXXPistol(BW).AmplifierOnAnim = 'AMPApplyOpen';
		GRSXXPistol(BW).AmplifierOffAnim = 'AMPRemoveOpen';
		AimedFireAnim = 'SightFireOpen';
		FireAnim = 'OpenFire';		
	}
	else
	{
		BW.IdleAnim = 'Idle';
		BW.ReloadAnim = 'Reload';
		GRSXXPistol(BW).AmplifierOnAnim = 'AMPApply';
		GRSXXPistol(BW).AmplifierOffAnim = 'AMPRemove';
		AimedFireAnim = 'SightFire';
		FireAnim = 'Fire';
	}
	super(BallisticFire).PlayFiring();
	// End:0x131
	if(bAmped && bRemovableAmp)
	{
		GRSXXPistol(BW).AddHeat(AmpDrainPerShot);
	}
	//return;	
}

function DoFireEffect()
{
	super(BallisticInstantFire).DoFireEffect();
	// End:0x4E
	if(((int(Level.NetMode) == int(NM_DedicatedServer)) && bAmped) && bRemovableAmp)
	{
		GRSXXPistol(BW).AddHeat(AmpDrainPerShot);
	}
	//return;	
}

defaultproperties
{
	MuzzleFlashClassNaked=Class'BallisticProV55.XK2FlashEmitter_C'
	NakedFlashBone="Muzzle2"
	NakedFlashScaleFactor=1.5000000
	bAmped=true
	AmpDrainPerShot=-0.1500000
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=768.0000000,Max=2304.0000000)
	DamageType=Class'BWBP_SKC_Pro.DTGRSXXPistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTGRSXXPistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTGRSXXPistol'
	PenetrateForce=100
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_GRSNine'
	BrassBone="tip"
	BrassOffset=(X=-30.0000000,Y=1.0000000,Z=0.0000000)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.GRSXXFlashEmitter'
	FlashScaleFactor=2.5000000
	AimedFireAnim="'"
	FireRecoil=150.0000000
	FireChaos=0.1200000
	XInaccuracy=72.0000000
	YInaccuracy=72.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.Glock_Gold.GRSXX-Fire',Volume=1.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireAnimRate=1.7000000
	FireRate=0.0500000
	AmmoClass=Class'BallisticProV55.Ammo_GRSNine'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-60.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.9900000
	WarnTargetPct=0.2000000
}
