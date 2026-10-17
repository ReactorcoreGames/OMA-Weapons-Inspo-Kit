class ONSRVWebProjectileEffect extends Emitter;

defaultproperties
{
	// Reference: BeamEmitter'Onslaught.ONSRVWebProjectileEffect.BeamEmitter8'
	begin object name="BeamEmitter8" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=32.0000000,Max=64.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		HighFrequencyNoiseRange=(X=(Min=-0.7000000,Max=0.7000000),Y=(Min=-0.7000000,Max=0.7000000),Z=(Min=-0.7000000,Max=0.7000000))
		HighFrequencyPoints=5
		BranchProbability=(Min=1.0000000,Max=1.0000000)
		BranchHFPointsRange=(Min=1.0000000,Max=3.0000000)
		BranchSpawnAmountRange=(Min=1.0000000,Max=1.0000000)
		LinkupLifetime=true
		UseColorScale=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.2000000,Max=0.2000000))
		CoordinateSystem=1
		MaxParticles=5
		StartLocationShape=1
		SphereRadiusRange=(Min=0.1000000,Max=0.1000000)
		StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'AW-2004Particles.Energy.PowerBolt'
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		StartVelocityRadialRange=(Min=1.0000000,Max=1.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[0]=BeamEmitter8
	// Reference: SpriteEmitter'Onslaught.ONSRVWebProjectileEffect.SpriteEmitter11'
	begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.2000000,Max=0.2000000))
		CoordinateSystem=1
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=20.0000000,Max=25.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'AW-2004Particles.Energy.ElecPanels'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
	end object
	Emitters[1]=SpriteEmitter11
	// Reference: BeamEmitter'Onslaught.ONSRVWebProjectileEffect.BeamEmitter12'
	begin object name="BeamEmitter12" class=Engine.BeamEmitter
		BeamEndPoints[0]=(ActorTag="Second",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
		DetermineEndPointBy=5
		BeamTextureUScale=2.0000000
		LowFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		LowFrequencyPoints=4
		Disabled=true
		ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.2000000,Max=0.2000000))
		MaxParticles=3
		StartSizeRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt03aw'
		LifetimeRange=(Min=0.0100000,Max=0.0100000)
	end object
	Emitters[2]=BeamEmitter12
	// Reference: SpriteEmitter'Onslaught.ONSRVWebProjectileEffect.SpriteEmitter12'
	begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.2000000,Max=0.2000000))
		Opacity=0.2000000
		CoordinateSystem=1
		MaxParticles=2
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=20.0000000
		Texture=Texture'AW-2004Particles.Weapons.HardSpot'
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
	end object
	Emitters[3]=SpriteEmitter12
	bNoDelete=false
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'Onslaught.ONSRVWebProjectileEffect.BeamEmitter8'
begin object name="BeamEmitter8" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=32.0000000,Max=64.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	HighFrequencyNoiseRange=(X=(Min=-0.7000000,Max=0.7000000),Y=(Min=-0.7000000,Max=0.7000000),Z=(Min=-0.7000000,Max=0.7000000))
	HighFrequencyPoints=5
	BranchProbability=(Min=1.0000000,Max=1.0000000)
	BranchHFPointsRange=(Min=1.0000000,Max=3.0000000)
	BranchSpawnAmountRange=(Min=1.0000000,Max=1.0000000)
	LinkupLifetime=true
	UseColorScale=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.2000000,Max=0.2000000))
	CoordinateSystem=1
	MaxParticles=5
	StartLocationShape=1
	SphereRadiusRange=(Min=0.1000000,Max=0.1000000)
	StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'AW-2004Particles.Energy.PowerBolt'
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	StartVelocityRadialRange=(Min=1.0000000,Max=1.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'Onslaught.ONSRVWebProjectileEffect.SpriteEmitter11'
begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.2000000,Max=0.2000000))
	CoordinateSystem=1
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=20.0000000,Max=25.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'AW-2004Particles.Energy.ElecPanels'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
end object
// Reference: BeamEmitter'Onslaught.ONSRVWebProjectileEffect.BeamEmitter12'
begin object name="BeamEmitter12" class=Engine.BeamEmitter
	BeamEndPoints[0]=(ActorTag="Second",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
	DetermineEndPointBy=5
	BeamTextureUScale=2.0000000
	LowFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	LowFrequencyPoints=4
	Disabled=true
	ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.2000000,Max=0.2000000))
	MaxParticles=3
	StartSizeRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt03aw'
	LifetimeRange=(Min=0.0100000,Max=0.0100000)
end object
// Reference: SpriteEmitter'Onslaught.ONSRVWebProjectileEffect.SpriteEmitter12'
begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.2000000,Max=0.2000000))
	Opacity=0.2000000
	CoordinateSystem=1
	MaxParticles=2
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=20.0000000
	Texture=Texture'AW-2004Particles.Weapons.HardSpot'
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
end object
