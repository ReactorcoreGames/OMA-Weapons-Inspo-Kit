class TraceEmitter_KF8XCrossbow extends BCTraceEmitter;

defaultproperties
{
	// Reference: MeshEmitter'BWBP_OP_Pro.TraceEmitter_KF8XCrossbow.CrossbowBoltEmitter'
	begin object name="CrossbowBoltEmitter" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.OA-SMG.OA-SMG_Dart'
		UseMeshBlendMode=false
		RenderTwoSided=true
		RespawnDeadParticles=false
		AlphaTest=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		CoordinateSystem=1
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=2.0000000,Max=4.0000000))
		StartSizeRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=0
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=15000.0000000,Max=15000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=CrossbowBoltEmitter
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BWBP_OP_Pro.TraceEmitter_KF8XCrossbow.CrossbowBoltEmitter'
begin object name="CrossbowBoltEmitter" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.OA-SMG.OA-SMG_Dart'
	UseMeshBlendMode=false
	RenderTwoSided=true
	RespawnDeadParticles=false
	AlphaTest=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	CoordinateSystem=1
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=2.0000000,Max=4.0000000))
	StartSizeRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=0
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=15000.0000000,Max=15000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
