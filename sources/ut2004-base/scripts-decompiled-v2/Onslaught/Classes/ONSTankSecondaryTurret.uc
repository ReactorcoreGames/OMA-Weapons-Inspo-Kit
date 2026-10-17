class ONSTankSecondaryTurret extends ONSWeapon
	notplaceable;

var Class<Emitter> mTracerClass;
var() editinline Emitter mTracer;
var() float mTracerInterval;
var() float mTracerPullback;
var() float mTracerMinDistance;
var() float mTracerSpeed;
var float mLastTracerTime;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'VMparticleTextures.TankFiringP.CloudParticleOrangeBMPtex');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.TracerShot');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'VMparticleTextures.TankFiringP.CloudParticleOrangeBMPtex');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.TracerShot');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

function byte BestMode()
{
	return 0;
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(mTracer != none)
	{
		mTracer.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function UpdateTracer()
{
	local Vector SpawnDir, spawnVel;
	local float hitDist;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x34
	if(mTracer == none)
	{
		mTracer = Spawn(mTracerClass);
	}
	// End:0x76
	if(Level.bDropDetail || int(Level.DetailMode) == int(0))
	{
		mTracerInterval = 2.0000000 * default.mTracerInterval;		
	}
	else
	{
		mTracerInterval = default.mTracerInterval;
	}
	// End:0x2DD
	if((mTracer != none) && Level.TimeSeconds > (mLastTracerTime + mTracerInterval))
	{
		mTracer.SetLocation(WeaponFireLocation);
		hitDist = VSize(LastHitLocation - WeaponFireLocation) - mTracerPullback;
		// End:0x108
		if((Instigator != none) && Instigator.IsLocallyControlled())
		{
			SpawnDir = Vector(WeaponFireRotation);			
		}
		else
		{
			SpawnDir = Normal(LastHitLocation - WeaponFireLocation);
		}
		// End:0x2C9
		if(hitDist > mTracerMinDistance)
		{
			spawnVel = SpawnDir * mTracerSpeed;
			mTracer.Emitters[0].StartVelocityRange.X.Min = spawnVel.X;
			mTracer.Emitters[0].StartVelocityRange.X.Max = spawnVel.X;
			mTracer.Emitters[0].StartVelocityRange.Y.Min = spawnVel.Y;
			mTracer.Emitters[0].StartVelocityRange.Y.Max = spawnVel.Y;
			mTracer.Emitters[0].StartVelocityRange.Z.Min = spawnVel.Z;
			mTracer.Emitters[0].StartVelocityRange.Z.Max = spawnVel.Z;
			mTracer.Emitters[0].LifetimeRange.Min = hitDist / mTracerSpeed;
			mTracer.Emitters[0].LifetimeRange.Max = mTracer.Emitters[0].LifetimeRange.Min;
			mTracer.SpawnParticle(1);
		}
		mLastTracerTime = Level.TimeSeconds;
	}
	//return;	
}

simulated function FlashMuzzleFlash()
{
	super.FlashMuzzleFlash();
	// End:0x24
	if(int(Role) < int(ROLE_Authority))
	{
		DualFireOffset *= float(-1);
	}
	UpdateTracer();
	//return;	
}

defaultproperties
{
	mTracerClass=Class'XEffects.NewTracer'
	mTracerInterval=0.0600000
	mTracerPullback=150.0000000
	mTracerSpeed=15000.0000000
	YawBone="Object01"
	PitchBone="Object02"
	PitchUpLimit=12500
	PitchDownLimit=59500
	WeaponFireAttachmentBone="Object02"
	WeaponFireOffset=85.0000000
	DualFireOffset=5.0000000
	RotationsPerSecond=2.0000000
	bInstantRotation=true
	bInstantFire=true
	bDoOffsetTrace=true
	bAmbientFireSound=true
	bIsRepeatingFF=true
	Spread=0.0100000
	RedSkin=Shader'VMVehicles-TX.HoverTankGroup.HoverTankChassisFinalRED'
	BlueSkin=Shader'VMVehicles-TX.HoverTankGroup.HoverTankChassisFinalBLUE'
	FireInterval=0.1000000
	AmbientEffectEmitterClass=Class'Onslaught.ONSRVChainGunFireEffect'
	FireSoundClass=Sound'ONSVehicleSounds-S.Tank.TankMachineGun01'
	AmbientSoundScaling=1.3000000
	FireForce="minifireb"
	DamageType=Class'Onslaught.DamTypeONSChainGun'
	DamageMin=17
	DamageMax=17
	TraceRange=15000.0000000
	ShakeRotMag=(X=50.0000000,Y=50.0000000,Z=50.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=1.0000000,Y=1.0000000,Z=1.0000000)
	ShakeOffsetRate=(X=1000.0000000,Y=1000.0000000,Z=1000.0000000)
	ShakeOffsetTime=2.0000000
	AIInfo=(bTossed=false,bTrySplash=false,bLeadTarget=false,bInstantHit=true,bFireOnRelease=false,aimerror=750.0000000,WarnTargetPct=0.0000000,RefireRate=0.9000000)
	CullDistance=8000.0000000
	Mesh=SkeletalMesh'ONSWeapons-A.TankMachineGun'
}
