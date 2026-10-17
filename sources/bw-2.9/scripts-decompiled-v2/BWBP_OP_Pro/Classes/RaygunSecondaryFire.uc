class RaygunSecondaryFire extends BallisticProInstantFire;

var() Sound ChargeSound;
var() byte ChargeSoundPitch;
var() float ChargeTime;
var() float DecayCharge;

simulated function bool AllowFire()
{
	// End:0x19
	if(Raygun(BW).bShieldOn)
	{
		return false;
	}
	// End:0x32
	if(Raygun(BW).bLockSecondary)
	{
		return false;
	}
	return super(BallisticFire).AllowFire();
	//return;	
}

simulated function PlayStartHold()
{
	HoldTime = FMax(DecayCharge, 0.1000000);
	Weapon.AmbientSound = ChargeSound;
	Weapon.ThirdPersonActor.AmbientSound = ChargeSound;
	Weapon.SoundVolume = byte(float(48) + ((FMin(ChargeTime, HoldTime) / ChargeTime) * float(128)));
	Weapon.SoundPitch = byte(float(ChargeSoundPitch) + ((FMin(ChargeTime, HoldTime) / ChargeTime) * float(ChargeSoundPitch)));
	Weapon.ThirdPersonActor.SoundVolume = byte(float(48) + ((FMin(ChargeTime, HoldTime) / ChargeTime) * float(128)));
	Weapon.ThirdPersonActor.SoundPitch = byte(float(ChargeSoundPitch) + ((FMin(ChargeTime, HoldTime) / ChargeTime) * float(ChargeSoundPitch)));
	Raygun(BW).BlendFireHold();
	BW.bPreventReload = true;
	BW.SafeLoopAnim('ChargeLoop', 1.0000000, TweenTime,, "IDLE");
	//return;	
}

simulated function ModeTick(float DeltaTime)
{
	super(BallisticFire).ModeTick(DeltaTime);
	// End:0xF5
	if(bIsFiring)
	{
		Weapon.ThirdPersonActor.SoundVolume = byte(float(48) + ((FMin(ChargeTime, HoldTime) / ChargeTime) * float(128)));
		Weapon.ThirdPersonActor.SoundPitch = byte(float(ChargeSoundPitch) + ((FMin(ChargeTime, HoldTime) / ChargeTime) * float(ChargeSoundPitch)));
		Weapon.SoundVolume = byte(float(48) + ((FMin(ChargeTime, HoldTime) / ChargeTime) * float(128)));
		Weapon.SoundPitch = byte(float(ChargeSoundPitch) + ((FMin(ChargeTime, HoldTime) / ChargeTime) * float(ChargeSoundPitch)));		
	}
	else
	{
		// End:0x234
		if(DecayCharge > float(0))
		{
			Weapon.ThirdPersonActor.SoundVolume = byte(float(48) + ((FMin(ChargeTime, DecayCharge) / ChargeTime) * float(128)));
			Weapon.ThirdPersonActor.SoundPitch = byte(float(ChargeSoundPitch) + ((FMin(ChargeTime, DecayCharge) / ChargeTime) * float(ChargeSoundPitch)));
			Weapon.SoundVolume = byte(float(48) + ((FMin(ChargeTime, DecayCharge) / ChargeTime) * float(128)));
			Weapon.SoundPitch = byte(float(ChargeSoundPitch) + ((FMin(ChargeTime, DecayCharge) / ChargeTime) * float(ChargeSoundPitch)));
			DecayCharge -= (DeltaTime * 2.5000000);
			// End:0x234
			if(DecayCharge < float(0))
			{
				DecayCharge = 0.0000000;
				Weapon.ThirdPersonActor.AmbientSound = none;
				Weapon.AmbientSound = none;
			}
		}
	}
	//return;	
}

function bool AllowPlague(Actor Other)
{
	return ((((Pawn(Other) != none) && Pawn(Other).Health > 0) && Vehicle(Other) == none) && (Pawn(Other).GetTeamNum() == 255) || Pawn(Other).GetTeamNum() != Instigator.GetTeamNum()) && (Level.TimeSeconds - Pawn(Other).SpawnTime) > DeathMatch(Level.Game).SpawnProtectionTime;
	//return;	
}

function ApplyDamage(Actor Target, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	super(BallisticInstantFire).ApplyDamage(Target, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x58
	if((Pawn(Target) != none) && Pawn(Target).bProjTarget)
	{
		TryPlague(Target);
	}
	//return;	
}

function TryPlague(Actor Other)
{
	local RaygunPlagueEffect RPE;

	// End:0xBD
	if(AllowPlague(Other))
	{
		// End:0x3C
		foreach Other.BasedActors(Class'BWBP_OP_Pro.RaygunPlagueEffect', RPE)
		{
			RPE.ExtendDuration(4.0000000);			
		}		
		// End:0xBD
		if(RPE == none)
		{
			RPE = Spawn(Class'BWBP_OP_Pro.RaygunPlagueEffect', Other,, Other.Location);
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

simulated event ModeDoFire()
{
	// End:0x98
	if((HoldTime >= ChargeTime) || (int(Level.NetMode) == int(NM_DedicatedServer)) && HoldTime >= (ChargeTime - 0.1000000))
	{
		super.ModeDoFire();
		Raygun(BW).PassDelay(FireRate);
		Weapon.ThirdPersonActor.AmbientSound = none;
		Weapon.AmbientSound = none;
		DecayCharge = 0.0000000;		
	}
	else
	{
		DecayCharge = FMin(ChargeTime, HoldTime);
		NextFireTime = Level.TimeSeconds + (DecayCharge * 0.3500000);
		BW.AnimBlendParams(1, 0.0000000);
	}
	HoldTime = 0.0000000;
	//return;	
}

simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
{
	local int Surf;

	// End:0x55
	if(((!Other.bWorldGeometry && Mover(Other) == none) && Pawn(Other) == none) || int(Level.NetMode) == int(NM_Client))
	{
		return false;
	}
	// End:0x70
	if(Vehicle(Other) != none)
	{
		Surf = 3;		
	}
	else
	{
		// End:0x94
		if(HitMat == none)
		{
			Surf = int(Other.SurfaceType);			
		}
		else
		{
			Surf = int(HitMat.SurfaceType);
		}
	}
	// End:0x105
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism() && (Other == none) || Other.bWorldGeometry)
	{
		BW.TargetedHurtRadius(70.0000000, 386.0000000, Class'BWBP_OP_Pro.DTRaygunChargedRadius', 50.0000000, HitLocation);
	}
	SendFireEffect(Other, HitLocation, HitNormal, Surf, WaterHitLoc);
	// End:0x140
	if(!bAISilent)
	{
		Instigator.MakeNoise(1.0000000);
	}
	return true;
	//return;	
}

defaultproperties
{
	ChargeSound=Sound'IndoorAmbience.machinery18'
	ChargeSoundPitch=32
	ChargeTime=1.2500000
	MaxWaterTraceRange=5000.0000000
	DamageType=Class'BWBP_OP_Pro.DTRaygunCharged'
	DamageTypeHead=Class'BWBP_OP_Pro.DTRaygunCharged'
	DamageTypeArm=Class'BWBP_OP_Pro.DTRaygunCharged'
	MuzzleFlashClass=Class'BWBP_OP_Pro.RaygunMuzzleFlash'
	FlashScaleFactor=4.0000000
	AimedFireAnim="Fire"
	FireRecoil=960.0000000
	FireChaos=0.3200000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.1600000,OutVal=1.0000000),(InVal=0.2500000,OutVal=1.5000000),(InVal=0.5000000,OutVal=2.2500000),(InVal=0.7500000,OutVal=3.5000000),(InVal=1.0000000,OutVal=5.0000000)))
	BallisticFireSound=(Sound=Sound'BWBP_OP_Sounds.Raygun.Raygun-FireBig',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	bFireOnRelease=true
	MaxHoldTime=2.5000000
	FireAnim="ChargedFire"
	FireEndAnim="None"
	FireRate=1.2000000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_RaygunCells'
	AmmoPerFire=8
	ShakeRotMag=(X=64.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=960.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-300.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.2500000
	WarnTargetPct=0.5000000
}
