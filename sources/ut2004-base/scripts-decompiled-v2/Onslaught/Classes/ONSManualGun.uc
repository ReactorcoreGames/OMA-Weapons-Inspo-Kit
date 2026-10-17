class ONSManualGun extends ONSWeapon
	notplaceable;

var Class<ONSTurretBeamEffect> BeamEffectClass[2];

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'TurretParticles.Beams.TurretBeam5');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaMuzzleBlue');
	L.AddPrecacheMaterial(Texture'EpicParticles.Flares.SoftFlare');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaStar2');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.SmokePanels1');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_flare_a');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_ring_b');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_mark_heat');
	L.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_core');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'TurretParticles.Beams.TurretBeam5');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaMuzzleBlue');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Flares.SoftFlare');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaStar2');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.SmokePanels1');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_flare_a');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_ring_b');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_mark_heat');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_core');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

function TraceFire(Vector Start, Rotator Dir)
{
	local Vector X, End, HitLocation, HitNormal;
	local Actor Other;
	local int Damage;

	X = Vector(Dir);
	End = Start + (TraceRange * X);
	// End:0xB0
	if((ONSVehicle(Instigator) != none) && ONSVehicle(Instigator).Driver != none)
	{
		ONSVehicle(Instigator).Driver.bBlockZeroExtentTraces = false;
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		ONSVehicle(Instigator).Driver.bBlockZeroExtentTraces = true;		
	}
	else
	{
		Other = Trace(HitLocation, HitNormal, End, Start, true);
	}
	// End:0x16F
	if(Other != none)
	{
		// End:0x16C
		if(!Other.bWorldGeometry)
		{
			Damage = DamageMin + Rand(DamageMax - DamageMin);
			// End:0x159
			if((ONSPowerCore(Other) == none) && ONSPowerNodeEnergySphere(Other) == none)
			{
				Other.TakeDamage(Damage, Instigator, HitLocation, Momentum * X, DamageType);
			}
			HitNormal = vect(0.0000000, 0.0000000, 0.0000000);
		}		
	}
	else
	{
		HitLocation = End;
		HitNormal = vect(0.0000000, 0.0000000, 0.0000000);
	}
	HitCount++;
	LastHitLocation = HitLocation;
	SpawnHitEffects(Other, HitLocation, HitNormal);
	//return;	
}

state InstantFireMode
{
	simulated function SpawnHitEffects(Actor HitActor, Vector HitLocation, Vector HitNormal)
	{
		local ONSTurretBeamEffect Beam;

		// End:0x198
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			// End:0x3D
			if(int(Role) < int(ROLE_Authority))
			{
				CalcWeaponFire();
				DualFireOffset *= float(-1);
			}
			// End:0x8C
			if(!Level.bDropDetail && int(Level.DetailMode) != int(0))
			{
				// End:0x84
				if(DualFireOffset < float(0))
				{
					PlayAnim('RightFire');					
				}
				else
				{
					PlayAnim('LeftFire');
				}
			}
			Beam = Spawn(BeamEffectClass[int(Team)],,, WeaponFireLocation, Rotator(HitLocation - WeaponFireLocation));
			BeamEmitter(Beam.Emitters[0]).BeamDistanceRange.Min = VSize(WeaponFireLocation - HitLocation);
			BeamEmitter(Beam.Emitters[0]).BeamDistanceRange.Max = VSize(WeaponFireLocation - HitLocation);
			BeamEmitter(Beam.Emitters[1]).BeamDistanceRange.Min = VSize(WeaponFireLocation - HitLocation);
			BeamEmitter(Beam.Emitters[1]).BeamDistanceRange.Max = VSize(WeaponFireLocation - HitLocation);
			Beam.SpawnEffects(HitLocation, HitNormal);
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	BeamEffectClass[0]=Class'Onslaught.ONSTurretBeamEffect'
	BeamEffectClass[1]=Class'Onslaught.ONSTurretBeamEffectBlue'
	YawBone="TurretBase"
	PitchBone="Dummy01"
	PitchUpLimit=15000
	PitchDownLimit=52500
	WeaponFireAttachmentBone="TurretCockpit"
	GunnerAttachmentBone="TurretCockpit"
	WeaponFireOffset=25.0000000
	DualFireOffset=75.0000000
	bInstantRotation=true
	bInstantFire=true
	bDualIndependantTargeting=true
	FireInterval=0.3000000
	FireSoundClass=Sound'WeaponSounds.Misc.instagib_rifleshot'
	FireForce="Laser01"
	DamageType=Class'Onslaught.DamTypeTurretBeam'
	DamageMin=30
	DamageMax=30
	TraceRange=20000.0000000
	Momentum=50000.0000000
	AIInfo=(bTossed=false,bTrySplash=false,bLeadTarget=false,bInstantHit=true,bFireOnRelease=false,aimerror=820.0000000,WarnTargetPct=0.0000000,RefireRate=0.9000000)
	Mesh=SkeletalMesh'ONSWeapons-A.NewManualGun'
	CollisionRadius=50.0000000
	CollisionHeight=70.0000000
}
