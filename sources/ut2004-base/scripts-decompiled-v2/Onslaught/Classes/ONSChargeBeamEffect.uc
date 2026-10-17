class ONSChargeBeamEffect extends Emitter;

var Vector HitLocation;

replication
{
	// Pos:0x000
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		HitLocation;
}

function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	// End:0x2A
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		LifeSpan = 1.0000000;
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	super(Actor).PostNetBeginPlay();
	// End:0x1C
	if(int(Role) < int(ROLE_Authority))
	{
		SetupBeam();
	}
	//return;	
}

simulated function SetupBeam()
{
	local ParticleBeamEndPoint End;
	local int X;
	local float Dist;
	local PlayerController PC;

	PC = Level.GetLocalPlayerController();
	// End:0x59
	if((PC != none) && !PC.BeyondViewDistance(HitLocation, 0.0000000))
	{
		SpawnEffects(HitLocation, Normal(HitLocation - Location));
	}
	End.offset.X.Min = HitLocation.X;
	End.offset.X.Max = HitLocation.X;
	End.offset.Y.Min = HitLocation.Y;
	End.offset.Y.Max = HitLocation.Y;
	End.offset.Z.Min = HitLocation.Z;
	End.offset.Z.Max = HitLocation.Z;
	Dist = VSize(HitLocation - Location);
	X = 0;
	J0x12E:

	// End:0x281 [Loop If]
	if(X < 4)
	{
		BeamEmitter(Emitters[X]).BeamDistanceRange.Min = Dist;
		BeamEmitter(Emitters[X]).BeamDistanceRange.Max = Dist;
		Emitters[X].StartSizeRange.X.Min *= DrawScale;
		Emitters[X].StartSizeRange.Y.Min *= DrawScale;
		Emitters[X].StartSizeRange.X.Max *= DrawScale;
		Emitters[X].StartSizeRange.Y.Max *= DrawScale;
		Emitters[X].LifetimeRange.Min *= DrawScale;
		Emitters[X].LifetimeRange.Max *= DrawScale;
		BeamEmitter(Emitters[X]).BeamEndPoints[0] = End;
		X++;
		// [Loop Continue]
		goto J0x12E;
	}
	//return;	
}

simulated function SpawnEffects(Vector HitLocation, Vector HitNormal)
{
	local Rotator HitRotation;

	HitRotation = Rotator(HitNormal);
	Spawn(Class'XEffects.ShockImpactFlareB',,, HitLocation, HitRotation);
	Spawn(Class'XEffects.ShockImpactRingB',,, HitLocation, HitRotation);
	Spawn(Class'XEffects.ShockImpactScorch',,, HitLocation, Rotator(-HitNormal));
	Spawn(Class'XEffects.ShockExplosionCoreB',,, HitLocation + (HitNormal * float(8)), HitRotation);
	//return;	
}

defaultproperties
{
	// Reference: BeamEmitter'Onslaught.ONSChargeBeamEffect.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=512.0000000,Max=512.0000000)
		DetermineEndPointBy=5
		RotatingSheets=3
		LowFrequencyPoints=2
		HighFrequencyPoints=2
		BranchProbability=(Min=0.0000000,Max=1.0000000)
		BranchSpawnAmountRange=(Min=0.0000000,Max=2.0000000)
		UseColorScale=true
		RespawnDeadParticles=false
		AlphaTest=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=0))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=128,G=255,B=128,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=1
		StartLocationOffset=(X=0.0000000,Y=-12.0000000,Z=0.0000000)
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.2500000)
		StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Energy.BeamBolt1a'
		LifetimeRange=(Min=0.4500000,Max=0.4500000)
	end object
	Emitters[0]=BeamEmitter0
	// Reference: BeamEmitter'Onslaught.ONSChargeBeamEffect.BeamEmitter1'
	begin object name="BeamEmitter1" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=512.0000000,Max=512.0000000)
		DetermineEndPointBy=5
		RotatingSheets=3
		LowFrequencyPoints=2
		HighFrequencyPoints=2
		BranchProbability=(Min=0.0000000,Max=1.0000000)
		BranchSpawnAmountRange=(Min=0.0000000,Max=2.0000000)
		UseColorScale=true
		RespawnDeadParticles=false
		AlphaTest=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=64,B=64,A=0))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=128,G=192,B=192,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.4000000
		MaxParticles=1
		StartLocationOffset=(X=0.0000000,Y=-12.0000000,Z=0.0000000)
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Flares.SoftFlare'
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
	end object
	Emitters[1]=BeamEmitter1
	// Reference: BeamEmitter'Onslaught.ONSChargeBeamEffect.BeamEmitter2'
	begin object name="BeamEmitter2" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=512.0000000,Max=512.0000000)
		DetermineEndPointBy=5
		RotatingSheets=3
		LowFrequencyPoints=2
		HighFrequencyPoints=2
		BranchProbability=(Min=0.0000000,Max=1.0000000)
		BranchSpawnAmountRange=(Min=0.0000000,Max=2.0000000)
		UseColorScale=true
		RespawnDeadParticles=false
		AlphaTest=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=0))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=128,G=255,B=128,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=1
		StartLocationOffset=(X=0.0000000,Y=12.0000000,Z=0.0000000)
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.2500000)
		StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Energy.BeamBolt1a'
		LifetimeRange=(Min=0.4500000,Max=0.4500000)
	end object
	Emitters[2]=BeamEmitter2
	// Reference: BeamEmitter'Onslaught.ONSChargeBeamEffect.BeamEmitter3'
	begin object name="BeamEmitter3" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=512.0000000,Max=512.0000000)
		DetermineEndPointBy=5
		RotatingSheets=3
		LowFrequencyPoints=2
		HighFrequencyPoints=2
		BranchProbability=(Min=0.0000000,Max=1.0000000)
		BranchSpawnAmountRange=(Min=0.0000000,Max=2.0000000)
		UseColorScale=true
		RespawnDeadParticles=false
		AlphaTest=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=64,B=64,A=0))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=128,G=192,B=192,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.4000000
		MaxParticles=1
		StartLocationOffset=(X=0.0000000,Y=12.0000000,Z=0.0000000)
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Flares.SoftFlare'
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
	end object
	Emitters[3]=BeamEmitter3
	AutoDestroy=true
	bNoDelete=false
	bNetTemporary=true
	bNetInitialRotation=true
	RemoteRole=2
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'Onslaught.ONSChargeBeamEffect.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=512.0000000,Max=512.0000000)
	DetermineEndPointBy=5
	RotatingSheets=3
	LowFrequencyPoints=2
	HighFrequencyPoints=2
	BranchProbability=(Min=0.0000000,Max=1.0000000)
	BranchSpawnAmountRange=(Min=0.0000000,Max=2.0000000)
	UseColorScale=true
	RespawnDeadParticles=false
	AlphaTest=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=0))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=128,G=255,B=128,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=1
	StartLocationOffset=(X=0.0000000,Y=-12.0000000,Z=0.0000000)
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.2500000)
	StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Energy.BeamBolt1a'
	LifetimeRange=(Min=0.4500000,Max=0.4500000)
end object
// Reference: BeamEmitter'Onslaught.ONSChargeBeamEffect.BeamEmitter1'
begin object name="BeamEmitter1" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=512.0000000,Max=512.0000000)
	DetermineEndPointBy=5
	RotatingSheets=3
	LowFrequencyPoints=2
	HighFrequencyPoints=2
	BranchProbability=(Min=0.0000000,Max=1.0000000)
	BranchSpawnAmountRange=(Min=0.0000000,Max=2.0000000)
	UseColorScale=true
	RespawnDeadParticles=false
	AlphaTest=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=64,B=64,A=0))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=128,G=192,B=192,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.4000000
	MaxParticles=1
	StartLocationOffset=(X=0.0000000,Y=-12.0000000,Z=0.0000000)
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Flares.SoftFlare'
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
end object
// Reference: BeamEmitter'Onslaught.ONSChargeBeamEffect.BeamEmitter2'
begin object name="BeamEmitter2" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=512.0000000,Max=512.0000000)
	DetermineEndPointBy=5
	RotatingSheets=3
	LowFrequencyPoints=2
	HighFrequencyPoints=2
	BranchProbability=(Min=0.0000000,Max=1.0000000)
	BranchSpawnAmountRange=(Min=0.0000000,Max=2.0000000)
	UseColorScale=true
	RespawnDeadParticles=false
	AlphaTest=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=0))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=128,G=255,B=128,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=1
	StartLocationOffset=(X=0.0000000,Y=12.0000000,Z=0.0000000)
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.2500000)
	StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Energy.BeamBolt1a'
	LifetimeRange=(Min=0.4500000,Max=0.4500000)
end object
// Reference: BeamEmitter'Onslaught.ONSChargeBeamEffect.BeamEmitter3'
begin object name="BeamEmitter3" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=512.0000000,Max=512.0000000)
	DetermineEndPointBy=5
	RotatingSheets=3
	LowFrequencyPoints=2
	HighFrequencyPoints=2
	BranchProbability=(Min=0.0000000,Max=1.0000000)
	BranchSpawnAmountRange=(Min=0.0000000,Max=2.0000000)
	UseColorScale=true
	RespawnDeadParticles=false
	AlphaTest=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=64,B=64,A=0))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=128,G=192,B=192,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.4000000
	MaxParticles=1
	StartLocationOffset=(X=0.0000000,Y=12.0000000,Z=0.0000000)
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Flares.SoftFlare'
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
end object
