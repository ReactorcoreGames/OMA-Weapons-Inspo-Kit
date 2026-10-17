class ThorLCPrimaryFire extends BallisticInstantFire;

struct ChainVic
{
	var float ZapTime;
	var Actor ZapVic;
};

var ThorLightningCannon LightningGun;
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
	LightningGun = ThorLightningCannon(Weapon);
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
	return LightningGun.MaxStreamRange;
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
	local Actor Target, Victims;
	local float TargetAngle, DR;
	local Vector ForceDir, EndEffect, HitLocation, HitNormal;
	local int AdjustedDamage;
	local bool bWasAlive, bDidHeal;

	// End:0x5E
	if(ThorLCAttachment(Weapon.ThirdPersonActor).StreamEffect == none)
	{
		ThorLCAttachment(Weapon.ThirdPersonActor).bUseAlt = false;
		ThorLCAttachment(Weapon.ThirdPersonActor).StartStream();
	}
	ThorLCAttachment(Weapon.ThirdPersonActor).bUseAltColor = bShouldUseAltColor;
	bIsZapping = true;
	bNoUseAmmo = false;
	// End:0xAE
	if(!bAISilent)
	{
		Instigator.MakeNoise(1.0000000);
	}
	TargetAngle = 0.9200000;
	// End:0x310
	foreach Instigator.VisibleCollidingActors(Class'Engine.Actor', Victims, 700.0000000, Instigator.Location)
	{
		// End:0x30F
		if(((((((Victims != none) && Victims != Instigator) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && !Victims.bWorldGeometry) && Victims.bCanBeDamaged || RSDarkFlameProjectile(Victims) != none) && !Victims.PhysicsVolume.bWaterVolume || (Pawn(Victims) != none) && !Pawn(Victims).HeadVolume.bWaterVolume)
		{
			DR = Normal(Victims.Location - Instigator.Location) Dot Vector(Instigator.GetViewRotation());
			// End:0x284
			if((RSDarkProjectile(Victims) != none) || RSDarkFastProjectile(Victims) != none)
			{
				// End:0x281
				if(DR > 0.9000000)
				{
					Victims.TakeDamage(10, Instigator, Victims.Location, Normal(Instigator.Location - Victims.Location) * float(1000), Class'BWBP_OP_Pro.DTProtonStreamer');
				}
				// End:0x30F
				continue;
			}
			// End:0x297
			if(RSDarkFlameProjectile(Victims) != none)
			{
				// End:0x30F
				continue;
			}
			// End:0x2C3
			if(RSBlackHole(Victims) != none)
			{
				RSBlackHole(Victims).AddCharge(0.2000000);
				// End:0x30F
				continue;
			}
			// End:0x2EB
			if(DR > TargetAngle)
			{
				Target = Victims;
				TargetAngle = DR;
				// End:0x30F
				continue;
			}
			// End:0x30F
			if(Projectile(Victims) != none)
			{
				Victims.Destroy();
				bNoUseAmmo = true;
			}
		}		
	}	
	// End:0x6A0
	if(Target != none)
	{
		LockedTarget = Target;
		ThorLCAttachment(Weapon.ThirdPersonActor).SetLockedTarget(Target);
		// End:0x470
		if((Pawn(Target) != none) && Instigator.Controller.SameTeamAs(Pawn(Target).Controller))
		{
			bDidHeal = true;
			AdjustedDamage = int(Damage * Instigator.DamageScaling);
			// End:0x3CB
			if(Instigator.HasUDamage())
			{
				AdjustedDamage *= float(2);
			}
			// End:0x40E
			if(BallisticPawn(Target) != none)
			{
				BallisticPawn(Target).GiveAttributedHealth(5, int(Pawn(Target).SuperHealthMax), Instigator);				
			}
			else
			{
				Pawn(Target).GiveHealth(5, int(Pawn(Target).SuperHealthMax));
			}
			// End:0x46E
			if(float(Pawn(Target).Health) >= Pawn(Target).SuperHealthMax)
			{
				bNoUseAmmo = true;
			}
			return;
		}
		// End:0x4D2
		if((xPawn(Target) != none) && Pawn(Target).Health > 0)
		{
			// End:0x4CF
			if((Monster(Target) == none) || Pawn(Target).default.Health > 100)
			{
				bWasAlive = true;
			}			
		}
		else
		{
			// End:0x529
			if(((Vehicle(Target) != none) && Vehicle(Target).Driver != none) && Vehicle(Target).Driver.Health > 0)
			{
				bWasAlive = true;
			}
		}
		ForceDir = (Instigator.Location + (Vector(Instigator.GetViewRotation()) * float(700))) - Target.Location;
		// End:0x609
		if(bDidHeal)
		{
			bShouldUseAltColor = true;
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Target, 0.0000000, Instigator, Target.Location + (Normal(Target.Location - Instigator.Location) * float(-24)), (float(10000) * FMax(0.1000000, 1.0000000 - (VSize(ForceDir) / float(2000)))) * Normal(ForceDir), Class'BWBP_OP_Pro.DTProtonStreamer');			
		}
		else
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Target, Damage, Instigator, Target.Location + (Normal(Target.Location - Instigator.Location) * float(-24)), (float(30000) * FMax(0.1000000, 1.0000000 - (VSize(ForceDir) / float(2000)))) * Normal(ForceDir), Class'BWBP_OP_Pro.DTProtonStreamer');
			bShouldUseAltColor = false;
		}		
	}
	else
	{
		EndEffect = Instigator.Location + (Normal(Vector(Instigator.GetViewRotation())) * LightningGun.MaxStreamRange);
		Trace(HitLocation, HitNormal, EndEffect, Instigator.Location, true);
		// End:0x732
		if(VSize(Instigator.Location - EndEffect) < LightningGun.MaxStreamRange)
		{
			EndEffect = HitLocation;
		}
		ThorLCAttachment(Weapon.ThirdPersonActor).SetLockedTarget(none);
		ThorLCAttachment(Weapon.ThirdPersonActor).SetUnlockedEnd(EndEffect);
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
	// End:0x53
	if(BW.MagAmmo < AmmoPerFire)
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
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(LightMuzzleFlash, Class'BallisticProV55.HVCMk9MuzzleFlash', Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
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
	ThorLCAttachment(Weapon.ThirdPersonActor).EndStream();
	//return;	
}

function StopFiring()
{
	super(BallisticFire).StopFiring();
	ThorLightningCannon(BW).DrainTarget = none;
	StopLightning();
	// End:0x57
	if(int(Instigator.Role) == int(ROLE_Authority))
	{
		ThorLCAttachment(Weapon.ThirdPersonActor).EndStream();
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

defaultproperties
{
	Damage=3.0000000
	DamageType=Class'BWBP_OP_Pro.DTProtonStreamer'
	MuzzleFlashClass=Class'BWBP_APC_Pro.ThorLCFlashEmitter'
	FireRecoil=1.0000000
	bPawnRapidFireAnim=true
	FireAnim="FireLoop"
	FireRate=0.0700000
	AmmoClass=Class'BWBP_APC_Pro.Ammo_ThorLC'
	ShakeRotMag=(X=32.0000000,Y=8.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.5000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	WarnTargetPct=0.2000000
}
