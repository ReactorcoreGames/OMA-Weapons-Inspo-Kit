class TraceEmitter_Pistol extends BCTraceEmitter;

defaultproperties
{
	// Reference: MeshEmitter'BallisticProV55.TraceEmitter_Pistol.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.TracerA1'
		UseMeshBlendMode=false
		RenderTwoSided=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3000000,Max=1.0000000),Z=(Min=0.3000000,Max=1.0000000))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=50.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=2.0000000,Max=4.0000000))
		StartSizeRange=(X=(Min=0.3000000,Max=0.5000000),Y=(Min=0.1500000,Max=0.1500000),Z=(Min=0.1500000,Max=0.1500000))
		InitialParticlesPerSecond=50000.0000000
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=8000.0000000,Max=8000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=MeshEmitter0
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.TraceEmitter_Pistol.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.TracerA1'
	UseMeshBlendMode=false
	RenderTwoSided=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3000000,Max=1.0000000),Z=(Min=0.3000000,Max=1.0000000))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=50.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=2.0000000,Max=4.0000000))
	StartSizeRange=(X=(Min=0.3000000,Max=0.5000000),Y=(Min=0.1500000,Max=0.1500000),Z=(Min=0.1500000,Max=0.1500000))
	InitialParticlesPerSecond=50000.0000000
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=8000.0000000,Max=8000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
