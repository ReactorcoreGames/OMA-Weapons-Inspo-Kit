class M575PrimaryFire extends BallisticProInstantFire;

var(M575) Actor MuzzleFlashAmp;
var(M575) Class<Actor> MuzzleFlashClassAmp;
var(M575) name AmpFlashBone;
var(M575) float AmpFlashScaleFactor;
var(M575) bool bAmped;
var(M575) float AmpDrainPerShot;

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
	if((MuzzleFlashClassAmp != none) && (MuzzleFlashAmp == none) || MuzzleFlashAmp.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashAmp, MuzzleFlashClassAmp, Weapon.DrawScale * AmpFlashScaleFactor, Weapon, FlashBone);
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
	// End:0xB6
	if(!M575Machinegun(Weapon).bAmped && MuzzleFlash != none)
	{
		MuzzleFlash.Trigger(Weapon, Instigator);		
	}
	else
	{
		// End:0xF8
		if((MuzzleFlashAmp != none) && int(M575Machinegun(Weapon).CurrentWeaponMode) == 4)
		{
			MuzzleFlashAmp.Trigger(Weapon, Instigator);
		}
	}
	// End:0x109
	if(!bBrassOnCock)
	{
		EjectBrass();
	}
	//return;	
}

simulated function SwitchWeaponMode(byte newmode)
{
	// End:0x1E
	if(Weapon.bBerserk)
	{
		FireRate *= 0.7500000;
	}
	// End:0x5D
	if(Level.GRI.WeaponBerserk > 1.0000000)
	{
		FireRate /= Level.GRI.WeaponBerserk;
	}
	// End:0xAC
	if(int(newmode) == 4)
	{
		bAmped = true;
		WaterRangeAtten = 0.6000000;
		DecayRange.Max = 4200.0000000;
		DecayRange.Min = 1500.0000000;
		WallPenetrationForce = 24.0000000;		
	}
	else
	{
		bAmped = false;
	}
	//return;	
}

function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	super(BallisticInstantFire).ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x8F
	if(((bAmped && Pawn(Victim) != none) && Pawn(Victim).Health > 0) && Vehicle(Victim) == none)
	{
		Class'BCoreProV55.BCSprintControl'.static.AddSlowTo(Pawn(Victim), 0.7000000, 0.5000000);
	}
	//return;	
}

simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
{
	// End:0x45
	if(!bAmped)
	{
		BallisticAttachment(Weapon.ThirdPersonActor).BallisticUpdateHit(Other, HitLocation, HitNormal, Surf,, WaterHitLoc);		
	}
	else
	{
		M575Attachment(Weapon.ThirdPersonActor).IceUpdateHit(Other, HitLocation, HitNormal, Surf,, WaterHitLoc);
	}
	//return;	
}

function ServerPlayFiring()
{
	Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	PlayFireAnimations();
	CheckClipFinished();
	//return;	
}

function PlayFiring()
{
	PlayFireAnimations();
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume,, BallisticFireSound.Radius);
	CheckClipFinished();
	// End:0x78
	if(bAmped)
	{
		M575Machinegun(BW).AddHeat(AmpDrainPerShot);
	}
	//return;	
}

function DoFireEffect()
{
	super(BallisticInstantFire).DoFireEffect();
	// End:0x38
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		M575Machinegun(BW).AddHeat(AmpDrainPerShot);
	}
	//return;	
}

simulated function DestroyEffects()
{
	super(BallisticFire).DestroyEffects();
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlash);
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashAmp);
	//return;	
}

event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	BallisticMachinegun(Weapon).SetBeltVisibility(BallisticMachinegun(Weapon).MagAmmo);
	super.ModeDoFire();
	//return;	
}

simulated function Vector GetFireDir(out Vector StartTrace)
{
	// End:0x4E
	if(BallisticTurret(Instigator) != none)
	{
		StartTrace = (Instigator.Location + Instigator.EyePosition()) + (Vector(Instigator.GetViewRotation()) * float(64));
	}
	return super(BallisticFire).GetFireDir(StartTrace);
	//return;	
}

defaultproperties
{
	MuzzleFlashClassAmp=Class'BWBP_SKC_Pro.SX45CryoFlash'
	AmpFlashBone="tip2"
	AmpFlashScaleFactor=0.7000000
	AmpDrainPerShot=-0.1000000
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	WaterRangeAtten=0.8000000
	DamageType=Class'BWBP_OP_Pro.DTM575MG'
	DamageTypeHead=Class'BWBP_OP_Pro.DTM575MGHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DTM575MG'
	KickForce=2000
	PenetrateForce=150
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_MG'
	BrassOffset=(X=6.0000000,Y=10.0000000,Z=0.0000000)
	bCockAfterEmpty=true
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.Misc.DryRifle',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BWBP_OP_Pro.M575FlashEmitter'
	FlashScaleFactor=0.3000000
	AimedFireAnim="SightFire"
	FireRecoil=80.0000000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.2400000,OutVal=1.0000000),(InVal=0.3500000,OutVal=1.5000000),(InVal=0.6600000,OutVal=2.2500000),(InVal=1.0000000,OutVal=3.5000000)))
	XInaccuracy=16.0000000
	YInaccuracy=16.0000000
	BallisticFireSound=(Sound=SoundGroup'BWBP_OP_Sounds.M575.M575-Fire',Volume=1.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireRate=0.0820000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_762mmBelt'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-300.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	WarnTargetPct=0.2000000
	aimerror=900.0000000
}
