class ONSRVRightBladeBreakOffEffect extends Emitter;

defaultproperties
{
	Emitters[0]=none
	// Reference: MeshEmitter'Onslaught.ONSRVRightBladeBreakOffEffect.MeshEmitter12'
	begin object name="MeshEmitter12" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSDeadVehicles-SM.RVexploded.ARM'
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
		MaxParticles=1
		StartLocationOffset=(X=-24.0000000,Y=64.0000000,Z=16.0000000)
		UseRotationFrom=1
		SpinCCWorCW=(X=0.0000000,Y=0.5000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.5000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSpinRange=(X=(Min=-0.2500000,Max=-0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-0.2500000,Max=-0.2500000))
		InitialParticlesPerSecond=500.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-400.0000000,Max=-500.0000000),Y=(Min=100.0000000,Max=200.0000000),Z=(Min=150.0000000,Max=200.0000000))
	end object
	Emitters[1]=MeshEmitter12
	bNoDelete=false
	bUnlit=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'Onslaught.ONSRVRightBladeBreakOffEffect.MeshEmitter12'
begin object name="MeshEmitter12" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.RVexploded.ARM'
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
	MaxParticles=1
	StartLocationOffset=(X=-24.0000000,Y=64.0000000,Z=16.0000000)
	UseRotationFrom=1
	SpinCCWorCW=(X=0.0000000,Y=0.5000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.5000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSpinRange=(X=(Min=-0.2500000,Max=-0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-0.2500000,Max=-0.2500000))
	InitialParticlesPerSecond=500.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-400.0000000,Max=-500.0000000),Y=(Min=100.0000000,Max=200.0000000),Z=(Min=150.0000000,Max=200.0000000))
end object
