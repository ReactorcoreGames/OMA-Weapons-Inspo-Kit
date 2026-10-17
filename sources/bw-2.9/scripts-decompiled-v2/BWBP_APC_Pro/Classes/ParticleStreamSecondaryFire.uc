class ParticleStreamSecondaryFire extends BallisticInstantFire;

struct ChainVic
{
	var float ZapTime;
	var Actor ZapVic;
};

var ParticleStreamer ProtonGun;
var Actor LockedTarget;
var Actor MuzzleFlashFast;
var Actor MuzzleFlashSlow;
var Actor LightMuzzleFlash;
var() Sound FireSoundLoop;
var() Sound FireSound2;
var bool bIsZapping;
var bool bPendingOwnerZap;
var float PendingZapDamage;
var bool bChainZapping;
var bool bPowerDrain;
var bool bShouldUseAltColor;
var bool bNoUseAmmo;
var array<ChainVic> ChainVics;

simulated function FiremodeChanged(byte newmode)
{
	// End:0x18
	if(int(newmode) == 1)
	{
		bPowerDrain = true;		
	}
	else
	{
		bPowerDrain = false;
	}
	//return;	
}

simulated event PostBeginPlay()
{
	super(WeaponFire).PostBeginPlay();
	ProtonGun = ParticleStreamer(Weapon);
	//return;	
}

function EndState()
{
	// End:0x0F
	if(bIsZapping)
	{
		StopLightning();
	}
	//return;	
}

function float MaxRange()
{
	return ProtonGun.MaxStreamRange;
	//return;	
}

function InitEffects()
{
	// End:0x1B
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	MuzzleFlash = MuzzleFlashSlow;
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	BW.FireCount++;
	// End:0xD1
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		ConsumedLoad += int(load);
		SetTimer(FMin(0.1000000, FireRate / float(2)), false);
		DoFireEffect();
		// End:0x86
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0xC2
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
	}
	// End:0xFE
	if(Instigator.IsLocallyControlled())
	{
		ShakeView();
		PlayFiring();
		FlashMuzzleFlash();
		StartMuzzleSmoke();		
	}
	else
	{
		ServerPlayFiring();
	}
	NextFireTime += FireRate;
	NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
	load = float(AmmoPerFire);
	HoldTime = 0.0000000;
	// End:0x157
	if(bNoUseAmmo)
	{
		load = 0.0000000;
	}
	// End:0x19C
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	//return;	
}

function DoFireEffect()
{
	local Actor Target, Victims, Other;
	local float TargetAngle, DR;
	local Vector ForceDir, EndEffect, HitLocation, HitNormal;
	local bool bWasAlive, bDidHeal;

	// End:0x5E
	if(ParticleStreamAttachment(Weapon.ThirdPersonActor).StreamEffect == none)
	{
		ParticleStreamAttachment(Weapon.ThirdPersonActor).bUseAlt = true;
		ParticleStreamAttachment(Weapon.ThirdPersonActor).StartStream();
	}
	ParticleStreamAttachment(Weapon.ThirdPersonActor).bUseAltColor = bShouldUseAltColor;
	bIsZapping = true;
	bNoUseAmmo = false;
	// End:0xAE
	if(!bAISilent)
	{
		Instigator.MakeNoise(1.0000000);
	}
	TargetAngle = 0.9200000;
	// End:0x212
	foreach Instigator.VisibleCollidingActors(Class'Engine.Actor', Victims, 700.0000000, Instigator.Location)
	{
		// End:0x211
		if(((((((Victims != none) && Victims != Instigator) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && !Victims.bWorldGeometry) && Victims.bCanBeDamaged) && !Victims.PhysicsVolume.bWaterVolume || (Pawn(Victims) != none) && !Pawn(Victims).HeadVolume.bWaterVolume)
		{
			DR = Normal(Victims.Location - Instigator.Location) Dot Vector(Instigator.GetViewRotation());
			// End:0x211
			if(DR > TargetAngle)
			{
				Target = Victims;
				TargetAngle = DR;
			}
		}		
	}	
	// End:0x3E9
	if(Target != none)
	{
		LockedTarget = Target;
		ParticleStreamAttachment(Weapon.ThirdPersonActor).SetLockedTarget(Target);
		// End:0x295
		if((Pawn(Target) != none) && Instigator.Controller.SameTeamAs(Pawn(Target).Controller))
		{
			bDidHeal = true;
			return;
		}
		// End:0x2F7
		if((xPawn(Target) != none) && Pawn(Target).Health > 0)
		{
			// End:0x2F4
			if((Monster(Target) == none) || Pawn(Target).default.Health > 100)
			{
				bWasAlive = true;
			}			
		}
		else
		{
			// End:0x34E
			if(((Vehicle(Target) != none) && Vehicle(Target).Driver != none) && Vehicle(Target).Driver.Health > 0)
			{
				bWasAlive = true;
			}
		}
		ForceDir = (Instigator.Location + (Vector(Instigator.GetViewRotation()) * float(700))) - Target.Location;
		// End:0x3C0
		if(bDidHeal)
		{
			ParticleStreamer(BW).BoostTarget = Pawn(Other);
			bShouldUseAltColor = true;			
		}
		else
		{
			ParticleStreamer(BW).DrainTarget = Pawn(Other);
			bShouldUseAltColor = false;
		}		
	}
	else
	{
		EndEffect = Instigator.Location + (Normal(Vector(Instigator.GetViewRotation())) * ProtonGun.MaxStreamRange);
		Trace(HitLocation, HitNormal, EndEffect, Instigator.Location, true);
		// End:0x47B
		if(VSize(Instigator.Location - EndEffect) < ProtonGun.MaxStreamRange)
		{
			EndEffect = HitLocation;
		}
		ParticleStreamAttachment(Weapon.ThirdPersonActor).SetLockedTarget(none);
		ParticleStreamAttachment(Weapon.ThirdPersonActor).SetUnlockedEnd(EndEffect);
	}
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x39
	if(!super(BallisticFire).AllowFire() || Instigator.PhysicsVolume.bWaterVolume)
	{
		// End:0x37
		if(bIsZapping)
		{
			PlayFireEnd();
		}
		return false;
	}
	// End:0x6C
	if((BW.MagAmmo < AmmoPerFire) || ParticleStreamer(BW).bShieldOn)
	{
		return false;
	}
	return true;
	//return;	
}

function ServerPlayFiring()
{
	// End:0x7C
	if(BW.FireCount < 2)
	{
		// End:0x7C
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		}
	}
	// End:0xAE
	if(FireSoundLoop != none)
	{
		Instigator.AmbientSound = FireSoundLoop;
		Instigator.SoundVolume = byte(255);
	}
	//return;	
}

function PlayFiring()
{
	// End:0x6E
	if(Instigator.PhysicsVolume.bWaterVolume)
	{
		StopLightning();
		PlayFireEnd();
		// End:0x60
		if(Weapon.HasAnim(FireLoopAnim))
		{
			BW.SafeLoopAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");
		}
		NextFireTime += 2.0000000;
		return;
	}
	// End:0x11C
	if(FireCount < 1)
	{
		// End:0xB2
		if(Weapon.HasAnim(FireLoopAnim))
		{
			BW.SafeLoopAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");
		}
		// End:0x119
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		}		
	}
	else
	{
		// End:0x192
		if(FireCount == Max(1, int(Level.TimeDilation * 5.0000000)))
		{
			Weapon.PlayOwnedSound(FireSound2, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		}
	}
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0x1C5
	if(int(Level.NetMode) == int(NM_Client))
	{
		bIsZapping = true;
	}
	// End:0x21C
	if((LightMuzzleFlash == none) || LightMuzzleFlash.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(LightMuzzleFlash, Class'BWBP_APC_Pro.ParticleFlashEmitter', Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	}
	// End:0x24E
	if(FireSoundLoop != none)
	{
		Instigator.AmbientSound = FireSoundLoop;
		Instigator.SoundVolume = byte(255);
	}
	//return;	
}

function PlayFireEnd()
{
	// End:0x0F
	if(bIsZapping)
	{
		super(WeaponFire).PlayFireEnd();
	}
	StopLightning();
	ParticleStreamAttachment(Weapon.ThirdPersonActor).EndStream();
	//return;	
}

function StopFiring()
{
	super(BallisticFire).StopFiring();
	ParticleStreamer(BW).DrainTarget = none;
	ParticleStreamer(BW).BoostTarget = none;
	StopLightning();
	// End:0x6C
	if(int(Instigator.Role) == int(ROLE_Authority))
	{
		ParticleStreamAttachment(Weapon.ThirdPersonActor).EndStream();
	}
	//return;	
}

function StopLightning()
{
	bIsZapping = false;
	// End:0x2E
	if(LightMuzzleFlash != none)
	{
		Emitter(LightMuzzleFlash).Kill();
		LightMuzzleFlash = none;
	}
	Instigator.AmbientSound = BW.UsedAmbientSound;
	Instigator.SoundVolume = Weapon.default.SoundVolume;
	//return;	
}

function FlashMuzzleFlash()
{
	//return;	
}

defaultproperties
{
	DamageType=Class'BWBP_OP_Pro.DTProtonStreamer'
	MuzzleFlashClass=Class'BWBP_APC_Pro.ParticleFlashEmitter'
	FireRecoil=1.0000000
	bPawnRapidFireAnim=true
	FireAnim="FireLoop"
	FireRate=0.0700000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_ProtonCharge'
	ShakeRotMag=(X=32.0000000,Y=8.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.5000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	WarnTargetPct=0.2000000
}
