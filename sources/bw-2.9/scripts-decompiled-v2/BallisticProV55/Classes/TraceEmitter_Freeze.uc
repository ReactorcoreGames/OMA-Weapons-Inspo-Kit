class TraceEmitter_Freeze extends BCTraceEmitter;

simulated function Initialize(float Distance, optional float Power)
{
	Emitters[1].LifetimeRange.Min = Distance / float(9000);
	Emitters[1].LifetimeRange.Max = Distance / float(9000);
	//return;	
}

defaultproperties
{
	// Reference: MeshEmitter'BallisticProV55.TraceEmitter_Freeze.FreezeBullets'
	begin object name="FreezeBullets" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Fifty9.Fifty9Tracer'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=0.7000000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.7500000
		CoordinateSystem=1
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=2.0000000,Max=4.0000000))
		StartSizeRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.7000000),Z=(Min=0.5000000,Max=0.7000000))
		InitialParticlesPerSecond=50000.0000000
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=9000.0000000,Max=9000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=FreezeBullets
	// Reference: SpriteEmitter'BallisticProV55.TraceEmitter_Freeze.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.3000000,Max=0.7000000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.1000000
		FadeOutStartTime=0.5250000
		CoordinateSystem=1
		MaxParticles=100
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=3.0000000,Max=7.0000000),Y=(Min=5.0000000,Max=15.0000000),Z=(Min=5.0000000,Max=15.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.9000000,Max=0.9000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=9000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=SpriteEmitter0
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.TraceEmitter_Freeze.FreezeBullets'
begin object name="FreezeBullets" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Fifty9.Fifty9Tracer'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=0.7000000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.7500000
	CoordinateSystem=1
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=2.0000000,Max=4.0000000))
	StartSizeRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.7000000),Z=(Min=0.5000000,Max=0.7000000))
	InitialParticlesPerSecond=50000.0000000
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=9000.0000000,Max=9000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.TraceEmitter_Freeze.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.3000000,Max=0.7000000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.1000000
	FadeOutStartTime=0.5250000
	CoordinateSystem=1
	MaxParticles=100
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=3.0000000,Max=7.0000000),Y=(Min=5.0000000,Max=15.0000000),Z=(Min=5.0000000,Max=15.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.9000000,Max=0.9000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=9000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
