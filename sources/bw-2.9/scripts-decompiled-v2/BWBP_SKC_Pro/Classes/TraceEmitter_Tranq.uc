class TraceEmitter_Tranq extends BCTraceEmitter;

defaultproperties
{
	// Reference: MeshEmitter'BWBP_SKC_Pro.TraceEmitter_Tranq.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.TracerA1'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorMultiplierRange=(X=(Min=0.1000000,Max=0.2000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.4000000,Max=0.5000000))
		Opacity=0.7500000
		CoordinateSystem=1
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=2.0000000,Max=4.0000000))
		StartSizeRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.2000000,Max=0.2500000),Z=(Min=0.2000000,Max=0.2500000))
		InitialParticlesPerSecond=50000.0000000
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=5000.0000000,Max=5000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=MeshEmitter0
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BWBP_SKC_Pro.TraceEmitter_Tranq.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.TracerA1'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorMultiplierRange=(X=(Min=0.1000000,Max=0.2000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.4000000,Max=0.5000000))
	Opacity=0.7500000
	CoordinateSystem=1
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=2.0000000,Max=4.0000000))
	StartSizeRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.2000000,Max=0.2500000),Z=(Min=0.2000000,Max=0.2500000))
	InitialParticlesPerSecond=50000.0000000
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=5000.0000000,Max=5000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
