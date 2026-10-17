class Xk2SecondaryFireOld extends BallisticProInstantFire;

simulated function bool AllowFire()
{
	// End:0x44
	if((XK2SubMachinegun(BW).IceCharge < 1) || (FireCount == 0) && XK2SubMachinegun(BW).IceCharge < 3)
	{
		return false;
	}
	return super(BallisticFire).AllowFire();
	//return;	
}

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
	// End:0x98
	if(MuzzleFlash != none)
	{
		MuzzleFlash.Trigger(Weapon, Instigator);
	}
	// End:0xA9
	if(!bBrassOnCock)
	{
		EjectBrass();
	}
	//return;	
}

function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	super(BallisticInstantFire).ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x84
	if(((Pawn(Victim) != none) && Pawn(Victim).Health > 0) && Vehicle(Victim) == none)
	{
		Class'BCoreProV55.BCSprintControl'.static.AddSlowTo(Pawn(Victim), 0.7000000, 0.2000000);
	}
	//return;	
}

simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
{
	Xk2Attachment(Weapon.ThirdPersonActor).IceUpdateHit(Other, HitLocation, HitNormal, Surf,, WaterHitLoc);
	//return;	
}

simulated event Timer()
{
	// End:0x6C
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		// End:0x42
		if(BW != none)
		{
			BW.ConsumeMagAmmo(ThisModeNum, float(ConsumedLoad));			
		}
		else
		{
			Weapon.ConsumeAmmo(ThisModeNum, float(ConsumedLoad));
		}
		// End:0x6C
		if(bPendingTryJam)
		{
			TryJam();
		}
	}
	XK2SubMachinegun(BW).IceCharge--;
	ConsumedLoad = 0;
	//return;	
}

function StopFiring()
{
	super(BallisticFire).StopFiring();
	XK2SubMachinegun(BW).LastChargeTime = Level.TimeSeconds;
	//return;	
}

simulated function DestroyEffects()
{
	super(BallisticFire).DestroyEffects();
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlash);
	//return;	
}

defaultproperties
{
	DamageType=Class'BallisticProV55.DTXK2Freeze'
	DamageTypeHead=Class'BallisticProV55.DTXK2Freeze'
	DamageTypeArm=Class'BallisticProV55.DTXK2Freeze'
	KickForce=500
	PenetrateForce=150
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	BrassOffset=(X=-25.0000000,Y=0.0000000,Z=-5.0000000)
	bDryUncock=true
	ClipFinishSound=(Sound=Sound'BW_Core_WeaponSound.Misc.ClipEnd-2',Volume=0.8000000,Radius=72.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.Misc.DryPistol',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.2500000
	AimedFireAnim="SightFire"
	FireRecoil=98.0000000
	FireChaos=0.0500000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.2400000,OutVal=1.0000000),(InVal=0.3500000,OutVal=1.5000000),(InVal=0.6600000,OutVal=2.2500000),(InVal=1.0000000,OutVal=3.5000000)))
	XInaccuracy=96.0000000
	YInaccuracy=96.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-Impact',Volume=0.7000000,Radius=384.0000000,Slot=0,Pitch=1.4000000,bAtten=false,bNoOverride=true)
	bPawnRapidFireAnim=true
	FireRate=0.0900000
	AmmoClass=Class'BallisticProV55.Ammo_9mm'
	ShakeRotMag=(X=64.0000000,Y=32.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
}
