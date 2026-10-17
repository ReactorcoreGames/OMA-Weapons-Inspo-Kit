class ONSPRVRearGun extends ONSWeapon
	notplaceable;

var Class<ONSChargeBeamEffect> BeamEffectClass;
var float StartHoldTime;
var float MaxHoldTime;
var float damageScale;
var float MinDamageScale;
var bool bHoldingFire;
var Sound ChargingSound;
var Sound ChargedLoop;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'EpicParticles.Flares.SoftFlare');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.BeamBolt1a');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_flare_a');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_ring_b');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_mark_heat');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_core');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaFlare');
	L.AddPrecacheMaterial(Texture'EpicParticles.Beams.HotBolt04aw');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.BurnFlare');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'EpicParticles.Flares.SoftFlare');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.BeamBolt1a');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_flare_a');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_ring_b');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_mark_heat');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_core');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaFlare');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Beams.HotBolt04aw');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.BurnFlare');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function SetFireRateModifier(float Modifier)
{
	super.SetFireRateModifier(Modifier);
	MaxHoldTime = default.MaxHoldTime / Modifier;
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x30
	if(bHoldingFire)
	{
		return FMin(Level.TimeSeconds - StartHoldTime, MaxHoldTime) / MaxHoldTime;		
	}
	else
	{
		return 0.0000000;
	}
	//return;	
}

function SpawnBeamEffect(Vector Start, Rotator Dir, Vector HitLocation, Vector HitNormal, int ReflectNum)
{
	local ONSChargeBeamEffect Beam;

	// End:0x16
	if(ReflectNum == 0)
	{
		Start = WeaponFireLocation;
	}
	Beam = Spawn(BeamEffectClass,,, Start, Dir);
	Beam.SetDrawScale(damageScale);
	Beam.HitLocation = HitLocation;
	// End:0x80
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Beam.SetupBeam();
	}
	//return;	
}

simulated function InitEffects()
{
	super.InitEffects();
	// End:0x26
	if(FlashEmitter != none)
	{
		FlashEmitter.Trigger(self, Instigator);
	}
	//return;	
}

state InstantFireMode
{
	simulated function OwnerEffects()
	{
		// End:0x53
		if((int(Role) < int(ROLE_Authority)) && !bHoldingFire)
		{
			bHoldingFire = true;
			StartHoldTime = Level.TimeSeconds;
			// End:0x53
			if(FlashEmitter != none)
			{
				FlashEmitter.Reset();
			}
		}
		//return;		
	}

	simulated function ClientStopFire(Controller C, bool bWasAltFire)
	{
		super(ONSWeapon).ClientStopFire(C, bWasAltFire);
		// End:0x2F
		if(FireCountdown <= float(0))
		{
			ClientPlayForceFeedback(FireForce);
			ShakeView();
		}
		// End:0xA5
		if(int(Role) < int(ROLE_Authority))
		{
			bHoldingFire = false;
			// End:0xA5
			if(FireCountdown <= float(0))
			{
				// End:0x6B
				if(bIsAltFire)
				{
					FireCountdown = AltFireInterval;					
				}
				else
				{
					FireCountdown = FireInterval;
				}
				FlashMuzzleFlash();
				// End:0xA5
				if(!bIsAltFire)
				{
					PlaySound(FireSoundClass, 0, FireSoundVolume / 255.0000000,, FireSoundRadius,, false);
				}
			}
		}
		//return;		
	}

	function Fire(Controller C)
	{
		// End:0x64
		if(!bHoldingFire)
		{
			StartHoldTime = Level.TimeSeconds;
			bHoldingFire = true;
			// End:0x41
			if(FlashEmitter != none)
			{
				FlashEmitter.Reset();
			}
			bClientTrigger = !bClientTrigger;
			AmbientSound = ChargingSound;
			SetTimer(MaxHoldTime, false);
		}
		//return;		
	}

	function Timer()
	{
		// End:0x14
		if(bHoldingFire)
		{
			AmbientSound = ChargedLoop;
		}
		//return;		
	}

	function CeaseFire(Controller C)
	{
		// End:0x0D
		if(!bHoldingFire)
		{
			return;
		}
		ClientPlayForceFeedback(FireForce);
		AmbientSound = none;
		CalcWeaponFire();
		// End:0x3B
		if(bCorrectAim)
		{
			WeaponFireRotation = AdjustAim(false);
		}
		damageScale = FClamp((Level.TimeSeconds - StartHoldTime) / MaxHoldTime, MinDamageScale, 1.0000000);
		DamageMin = int(float(default.DamageMin) * damageScale);
		DamageMax = int(float(default.DamageMax) * damageScale);
		Momentum = default.Momentum * damageScale;
		FireSoundPitch = 2.0000000 - damageScale;
		Fire(C);
		FireCountdown = FireInterval;
		bHoldingFire = false;
		//return;		
	}

	simulated function ClientTrigger()
	{
		// End:0x3D
		if(((Instigator != none) && !Instigator.IsLocallyControlled()) && FlashEmitter != none)
		{
			FlashEmitter.Reset();
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	BeamEffectClass=Class'Onslaught.ONSChargeBeamEffect'
	MaxHoldTime=2.5000000
	MinDamageScale=0.1500000
	ChargingSound=Sound'ONSVehicleSounds-S.PRV.PRVChargeUp'
	ChargedLoop=Sound'ONSVehicleSounds-S.PRV.PRVChargeLoop'
	YawBone="REARgunBASE"
	PitchBone="REARgunTURRET"
	PitchUpLimit=15000
	PitchDownLimit=57500
	WeaponFireAttachmentBone="Dummy02"
	GunnerAttachmentBone="REARgunBASE"
	bInstantRotation=true
	bInstantFire=true
	bShowChargingBar=true
	bDoOffsetTrace=true
	RedSkin=Shader'VMVehicles-TX.NEWprvGroup.newPRVredSHAD'
	BlueSkin=Shader'VMVehicles-TX.NEWprvGroup.newPRVshad'
	FireInterval=0.7500000
	FlashEmitterClass=Class'Onslaught.ONSPRVRearGunCharge'
	FireSoundClass=Sound'ONSVehicleSounds-S.PRV.PRVFire04'
	FireForce="PRVRearFire"
	DamageType=Class'Onslaught.DamTypeChargingBeam'
	DamageMin=200
	DamageMax=200
	TraceRange=20000.0000000
	Momentum=150000.0000000
	AIInfo=(bTossed=false,bTrySplash=false,bLeadTarget=false,bInstantHit=true,bFireOnRelease=true,aimerror=600.0000000,WarnTargetPct=0.0000000,RefireRate=0.8500000)
	Mesh=SkeletalMesh'ONSWeapons-A.PRVrearGUN'
	DrawScale=0.8000000
}
