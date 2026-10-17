class HMCSecondaryFire extends BallisticProInstantFire;

var bool bLaserFiring;
var Actor MuzzleFlashBeam;
var Actor MuzzleFlashBlue;
var Actor MuzzleFlashRed;
var int HealReductionMult;
var() Sound ChargeSound;
var() bool bDoOverCharge;
var() Sound FireSoundLoop;
var() Sound FireSoundLoopRed;
var() Sound FireSoundLoopPush;
var() Sound FireSoundLoopPull;
var() Sound TractorStartSound;
var() Sound RepulsorStartSound;
var int SoundAdjust;
var float StopFireTime;
var Emitter LaserDot;
var Vector ZForce;

function DoDamage(Actor Other, Vector HitLocation, Vector TraceStart, Vector Dir, int PenetrateCount, int WallCount, optional Vector WaterHitLocation)
{
	local float Dmg;
	local Class<DamageType> HitDT;
	local Actor Victim;
	local Vector RelativeVelocity, ForceDir;

	Dmg = GetDamage(Other, HitLocation, TraceStart, Dir, Victim, HitDT);
	// End:0x66
	if(RangeAtten != 1.0000000)
	{
		Dmg *= Lerp(VSize(HitLocation - TraceStart) / TraceRange.Max, 1.0000000, RangeAtten);
	}
	// End:0x86
	if(PenetrateCount > 0)
	{
		Dmg *= (PDamageFactor ** float(PenetrateCount));
	}
	// End:0xA6
	if(WallCount > 0)
	{
		Dmg *= (WallPDamageFactor ** float(WallCount));
	}
	// End:0x11A
	if(bUseRunningDamage)
	{
		RelativeVelocity = Instigator.Velocity - Other.Velocity;
		Dmg += ((Dmg * (VSize(RelativeVelocity) / RunningSpeedThresh)) * (Normal(RelativeVelocity) Dot Normal(Other.Location - Instigator.Location)));
	}
	// End:0x2E7
	if((((((HookStopFactor != float(0)) && HookPullForce != float(0)) && Pawn(Victim) != none) && Pawn(Victim).bProjTarget) && Pawn(Victim).DrivenVehicle == none) && (Pawn(Victim).Controller == none) || !Pawn(Victim).Controller.SameTeamAs(Instigator.Controller))
	{
		ForceDir = Normal(Other.Location - TraceStart);
		// End:0x27E
		if(int(Victim.Physics) == int(2))
		{
			ForceDir *= 0.3000000;
			Pawn(Victim).AddVelocity(((ZForce * 0.2500000) + ((Normal(Victim.Acceleration) * HookStopFactor) * -FMin(Pawn(Victim).GroundSpeed, VSize(Victim.Velocity)))) - (ForceDir * HookPullForce));			
		}
		else
		{
			Pawn(Victim).AddVelocity((ZForce + ((Normal(Victim.Acceleration) * HookStopFactor) * -FMin(Pawn(Victim).GroundSpeed, VSize(Victim.Velocity)))) - (ForceDir * HookPullForce));
		}
	}
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, Dmg, Instigator, HitLocation, float(KickForce) * Dir, HitDT);
	//return;	
}

function InitEffects()
{
	// End:0x1B
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x72
	if((MuzzleFlashBlue == none) || MuzzleFlashBlue.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashBlue, Class'BWBP_SKC_Pro.HMCFlashEmitter', Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	}
	// End:0xC9
	if((MuzzleFlashRed == none) || MuzzleFlashRed.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashRed, Class'BWBP_SKC_Pro.HMCRedEmitter', Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	}
	MuzzleFlash = MuzzleFlashBlue;
	//return;	
}

simulated function DestroyEffects()
{
	super(WeaponFire).DestroyEffects();
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x54
	if(((HMCBeamCannon(Weapon).Heat >= 1.0000000) || HMCBeamCannon(Weapon).bIsCharging) || !super(BallisticFire).AllowFire())
	{
		// End:0x52
		if(bLaserFiring)
		{
			PlayFireEnd();
		}
		return false;
	}
	return super(BallisticFire).AllowFire();
	//return;	
}

function PlayFireEnd()
{
	// End:0x20
	if(bLaserFiring || bIsFiring)
	{
		super(WeaponFire).PlayFireEnd();
		StopFiring();
	}
	StopFiring();
	//return;	
}

simulated function SpawnLaserDot(Vector loc)
{
	// End:0x9C
	if(LaserDot == none)
	{
		// End:0x84
		if(((Instigator.PlayerReplicationInfo.Team != none) && Instigator.PlayerReplicationInfo.Team.TeamIndex == 0) || HMCBeamCannon(BW).bRedTeam)
		{
			LaserDot = Spawn(Class'BallisticProV55.IE_GRS9LaserHit',,, loc);			
		}
		else
		{
			LaserDot = Spawn(Class'BWBP_SKC_Pro.IE_HMCLase',,, loc);
		}
	}
	//return;	
}

function DoFireEffect()
{
	HMCBeamCannon(Weapon).ServerSwitchLaser(true);
	// End:0x8A
	if(((Instigator.PlayerReplicationInfo.Team != none) && Instigator.PlayerReplicationInfo.Team.TeamIndex == 0) || HMCBeamCannon(BW).bRedTeam)
	{
		Instigator.AmbientSound = FireSoundLoopRed;		
	}
	else
	{
		Instigator.AmbientSound = FireSoundLoop;
	}
	// End:0xD0
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		HMCBeamCannon(BW).AddHeat(HeatPerShot);
	}
	super(BallisticInstantFire).DoFireEffect();
	//return;	
}

function PlayFiring()
{
	HMCBeamCannon(BW).AddHeat(HeatPerShot);
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	bLaserFiring = true;
	//return;	
}

function ServerPlayFiring()
{
	// End:0x2C
	if((FireSoundLoop != none) && !bLaserFiring)
	{
		Instigator.AmbientSound = FireSoundLoop;
	}
	bLaserFiring = true;
	//return;	
}

function StopFiring()
{
	HMCBeamCannon(Weapon).ServerSwitchLaser(false);
	StopFireTime = Level.TimeSeconds;
	super(BallisticFire).StopFiring();
	bLaserFiring = false;
	// End:0x49
	if(MuzzleFlash != none)
	{
		MuzzleFlash = none;
	}
	Instigator.AmbientSound = BW.UsedAmbientSound;
	Instigator.SoundVolume = Instigator.default.SoundVolume;
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x5C
	if(HMCBeamCannon(Weapon).Heat >= 1.1000000)
	{
		NextFireTime = Level.TimeSeconds + 1.5000000;
		DoJam();
		BW.ClientJamMode(1);
	}
	BallisticFireSound.Sound = none;
	BallisticFireSound.Volume = 0.7000000;
	BallisticFireSound.Radius = 280.0000000;
	super.ModeDoFire();
	//return;	
}

simulated event ModeTick(float dt)
{
	// End:0x5E
	if(HMCBeamCannon(Weapon).Heat > 1.0000000)
	{
		HMCBeamCannon(Weapon).ClientOverCharge();
		HMCBeamCannon(Weapon).ServerStopFire(1);
		DoJam();
		BW.ClientJamMode(1);
	}
	// End:0xCA
	if(((Instigator.PlayerReplicationInfo.Team != none) && Instigator.PlayerReplicationInfo.Team.TeamIndex == 0) || HMCBeamCannon(BW).bRedTeam)
	{
		MuzzleFlash = MuzzleFlashRed;		
	}
	else
	{
		MuzzleFlash = MuzzleFlashBlue;
	}
	super(BallisticFire).ModeTick(dt);
	// End:0xED
	if(!bIsFiring)
	{
		return;
	}
	// End:0x12E
	if(Instigator.PhysicsVolume.bWaterVolume)
	{
		HMCBeamCannon(Weapon).AddHeat((dt * HeatPerShot) * float(10));
	}
	//return;	
}

simulated function ModeHoldFire()
{
	Instigator.SoundVolume = byte(255);
	Instigator.SoundRadius = 280.0000000;
	super(WeaponFire).ModeHoldFire();
	//return;	
}

state RepulsorBeamMode
{
	function DoDamage(Actor Other, Vector HitLocation, Vector TraceStart, Vector Dir, int PenetrateCount, int WallCount, optional Vector WaterHitLocation)
	{
		local float Dmg;
		local Class<DamageType> HitDT;
		local Actor Victim;
		local Vector RelativeVelocity, ForceDir;

		Dmg = GetDamage(Other, HitLocation, TraceStart, Dir, Victim, HitDT);
		// End:0x66
		if(RangeAtten != 1.0000000)
		{
			Dmg *= Lerp(VSize(HitLocation - TraceStart) / TraceRange.Max, 1.0000000, RangeAtten);
		}
		// End:0x86
		if(PenetrateCount > 0)
		{
			Dmg *= (PDamageFactor ** float(PenetrateCount));
		}
		// End:0xA6
		if(WallCount > 0)
		{
			Dmg *= (WallPDamageFactor ** float(WallCount));
		}
		// End:0x11A
		if(bUseRunningDamage)
		{
			RelativeVelocity = Instigator.Velocity - Other.Velocity;
			Dmg += ((Dmg * (VSize(RelativeVelocity) / RunningSpeedThresh)) * (Normal(RelativeVelocity) Dot Normal(Other.Location - Instigator.Location)));
		}
		// End:0x2E7
		if((((((HookStopFactor != float(0)) && HookPullForce != float(0)) && Pawn(Victim) != none) && Pawn(Victim).bProjTarget) && Pawn(Victim).DrivenVehicle == none) && (Pawn(Victim).Controller == none) || !Pawn(Victim).Controller.SameTeamAs(Instigator.Controller))
		{
			ForceDir = Normal(TraceStart - Other.Location);
			// End:0x27E
			if(int(Victim.Physics) == int(2))
			{
				ForceDir *= 0.3000000;
				Pawn(Victim).AddVelocity(((ZForce * 0.2500000) + ((Normal(Victim.Acceleration) * HookStopFactor) * -FMin(Pawn(Victim).GroundSpeed, VSize(Victim.Velocity)))) - (ForceDir * HookPullForce));				
			}
			else
			{
				Pawn(Victim).AddVelocity((ZForce + ((Normal(Victim.Acceleration) * HookStopFactor) * -FMin(Pawn(Victim).GroundSpeed, VSize(Victim.Velocity)))) - (ForceDir * HookPullForce));
			}
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, Dmg, Instigator, HitLocation, float(KickForce) * Dir, HitDT);
		//return;		
	}

	function DoFireEffect()
	{
		HMCBeamCannon(Weapon).ServerSwitchLaser(true);
		// End:0xCA
		if(!bLaserFiring)
		{
			// End:0x7D
			if(HookPullForce < float(0))
			{
				Weapon.PlayOwnedSound(TractorStartSound, BallisticFireSound.Slot, 2.0000000, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);				
			}
			else
			{
				Weapon.PlayOwnedSound(RepulsorStartSound, BallisticFireSound.Slot, 2.0000000, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}
		}
		bLaserFiring = true;
		// End:0xF6
		if(HookPullForce < float(0))
		{
			Instigator.AmbientSound = FireSoundLoopPull;			
		}
		else
		{
			Instigator.AmbientSound = FireSoundLoopPush;
		}
		// End:0x13C
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			HMCBeamCannon(BW).AddHeat(HeatPerShot);
		}
		super(BallisticInstantFire).DoFireEffect();
		//return;		
	}
	stop;	
}

state HealBeamMode
{
	function DoDamage(Actor Other, Vector HitLocation, Vector TraceStart, Vector Dir, int PenetrateCount, int WallCount, optional Vector WaterHitLocation)
	{
		local float Dmg;
		local Class<DamageType> HitDT;
		local Actor Victim;
		local Pawn HealTarget;

		Dmg = GetDamage(Other, HitLocation, TraceStart, Dir, Victim, HitDT);
		HealTarget = Pawn(Other);
		// End:0x10D
		if(((HealTarget != none) && HealTarget.PlayerReplicationInfo != none) && HealTarget.PlayerReplicationInfo.Team == Instigator.PlayerReplicationInfo.Team)
		{
			// End:0xDC
			if(BallisticPawn(Other) != none)
			{
				BallisticPawn(HealTarget).GiveAttributedHealth(int(Dmg / float(HealReductionMult)), int(HealTarget.SuperHealthMax), Instigator);				
			}
			else
			{
				HealTarget.GiveHealth(int(Dmg / float(HealReductionMult)), int(HealTarget.SuperHealthMax));
			}
			return;
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, Dmg, Instigator, HitLocation, float(KickForce) * Dir, HitDT);
		//return;		
	}
	stop;	
}

defaultproperties
{
	HealReductionMult=2
	ChargeSound=Sound'BWBP_SKC_Sounds.BeamCannon.Beam-Loop'
	FireSoundLoop=Sound'BWBP_SKC_Sounds.BeamCannon.Beam-Loop'
	FireSoundLoopRed=Sound'BWBP_SKC_Sounds.BeamCannon.RedBeam-Loop'
	FireSoundLoopPush=Sound'BWBP_SKC_Sounds.BeamCannon.HMC-RepulsorLoop'
	FireSoundLoopPull=Sound'BWBP_SKC_Sounds.BeamCannon.HMC-TractorLoop'
	TractorStartSound=Sound'BWBP_SKC_Sounds.BeamCannon.HMC-TractorStart'
	RepulsorStartSound=Sound'BWBP_SKC_Sounds.BeamCannon.HMC-RepulsorStart'
	ZForce=(X=0.0000000,Y=0.0000000,Z=225.0000000)
	TraceRange=(Min=6000.0000000,Max=6000.0000000)
	Damage=6.0000000
	RangeAtten=0.7500000
	WaterRangeAtten=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DTHMCBeam'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTHMCBeamHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTHMCBeam'
	HookStopFactor=0.3000000
	HookPullForce=240.0000000
	PenetrateForce=200
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.HMCFlashEmitter'
	FlashScaleFactor=0.7000000
	FireChaos=0.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Fire',Volume=1.2000000,Radius=255.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	UnjamMethod=4
	bModeExclusive=false
	FireAnim="FireLoop"
	FireEndAnim="None"
	FireRate=0.0800000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_HVPCCells'
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
	aimerror=400.0000000
}
