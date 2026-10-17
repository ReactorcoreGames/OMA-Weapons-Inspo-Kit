class MRLTrailEmitter_C extends BallisticEmitter;

defaultproperties
{
	// Reference: TrailEmitter'BallisticProV55.MRLTrailEmitter_C.TrailEmitter0'
	begin object name="TrailEmitter0" class=Engine.TrailEmitter
		TrailShadeType=3
		TrailLocation=1
		MaxPointsPerTrail=150
		DistanceThreshold=20.0000000
		UseCrossedSheets=true
		PointLifeTime=0.7500000
		AutomaticInitialSpawning=false
		Opacity=0.5000000
		MaxParticles=1
		StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=999999.0000000,Max=999999.0000000)
	end object
	Emitters[0]=TrailEmitter0
	Physics=10
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: TrailEmitter'BallisticProV55.MRLTrailEmitter_C.TrailEmitter0'
begin object name="TrailEmitter0" class=Engine.TrailEmitter
	TrailShadeType=3
	TrailLocation=1
	MaxPointsPerTrail=150
	DistanceThreshold=20.0000000
	UseCrossedSheets=true
	PointLifeTime=0.7500000
	AutomaticInitialSpawning=false
	Opacity=0.5000000
	MaxParticles=1
	StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=999999.0000000,Max=999999.0000000)
end object
