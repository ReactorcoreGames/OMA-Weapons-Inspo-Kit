class ONSNodeBeamRedEffect extends Emitter;

defaultproperties
{
	// Reference: BeamEmitter'Onslaught.ONSNodeBeamRedEffect.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=10000.0000000,Max=10000.0000000)
		DetermineEndPointBy=1
		RotatingSheets=3
		AutomaticInitialSpawning=false
		MaxParticles=1
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=256.0000000)
		StartSizeRange=(X=(Min=110.0000000,Max=110.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Energy.PowerBeam'
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
	end object
	Emitters[0]=BeamEmitter0
	// Reference: BeamEmitter'Onslaught.ONSNodeBeamRedEffect.BeamEmitter3'
	begin object name="BeamEmitter3" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=10000.0000000,Max=10000.0000000)
		DetermineEndPointBy=1
		RotatingSheets=3
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
		MaxParticles=1
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=256.0000000)
		StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'AW-2004Particles.Energy.PowerBeam'
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
	end object
	Emitters[1]=BeamEmitter3
	// Reference: MeshEmitter'Onslaught.ONSNodeBeamRedEffect.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'AW-2004Particles.ONS.BeamMask'
		UseParticleColor=true
		Disabled=true
		Backup_Disabled=true
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.3000000,Max=0.3000000))
		Opacity=2.0000000
		MaxParticles=1
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=300.0000000)
		StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=1.0000000,Max=1.0000000))
		InitialParticlesPerSecond=50000.0000000
	end object
	Emitters[2]=MeshEmitter1
	bNoDelete=false
	AmbientGlow=254
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'Onslaught.ONSNodeBeamRedEffect.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=10000.0000000,Max=10000.0000000)
	DetermineEndPointBy=1
	RotatingSheets=3
	AutomaticInitialSpawning=false
	MaxParticles=1
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=256.0000000)
	StartSizeRange=(X=(Min=110.0000000,Max=110.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Energy.PowerBeam'
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
end object
// Reference: BeamEmitter'Onslaught.ONSNodeBeamRedEffect.BeamEmitter3'
begin object name="BeamEmitter3" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=10000.0000000,Max=10000.0000000)
	DetermineEndPointBy=1
	RotatingSheets=3
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
	MaxParticles=1
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=256.0000000)
	StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'AW-2004Particles.Energy.PowerBeam'
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
end object
// Reference: MeshEmitter'Onslaught.ONSNodeBeamRedEffect.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'AW-2004Particles.ONS.BeamMask'
	UseParticleColor=true
	Disabled=true
	Backup_Disabled=true
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.3000000,Max=0.3000000))
	Opacity=2.0000000
	MaxParticles=1
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=300.0000000)
	StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=1.0000000,Max=1.0000000))
	InitialParticlesPerSecond=50000.0000000
end object
