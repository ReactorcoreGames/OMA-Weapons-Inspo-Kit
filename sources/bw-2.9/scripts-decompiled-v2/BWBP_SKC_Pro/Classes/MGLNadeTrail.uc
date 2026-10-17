class MGLNadeTrail extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.MGLNadeTrail.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=196,G=128,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.1604000
		CoordinateSystem=1
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=5.0000000,Max=5.0000000),Z=(Min=5.0000000,Max=5.0000000))
		InitialParticlesPerSecond=1.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		LifetimeRange=(Min=0.4010000,Max=0.4010000)
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: TrailEmitter'BWBP_SKC_Pro.MGLNadeTrail.TrailEmitter0'
	begin object name="TrailEmitter0" class=Engine.TrailEmitter
		TrailShadeType=3
		TrailLocation=1
		MaxPointsPerTrail=350
		DistanceThreshold=30.0000000
		PointLifeTime=0.1000000
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		MaxParticles=1
		StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=999999.0000000,Max=999999.0000000)
	end object
	Emitters[1]=TrailEmitter0
	Physics=10
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.MGLNadeTrail.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=196,G=128,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.1604000
	CoordinateSystem=1
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=5.0000000,Max=5.0000000),Z=(Min=5.0000000,Max=5.0000000))
	InitialParticlesPerSecond=1.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	LifetimeRange=(Min=0.4010000,Max=0.4010000)
end object
// Reference: TrailEmitter'BWBP_SKC_Pro.MGLNadeTrail.TrailEmitter0'
begin object name="TrailEmitter0" class=Engine.TrailEmitter
	TrailShadeType=3
	TrailLocation=1
	MaxPointsPerTrail=350
	DistanceThreshold=30.0000000
	PointLifeTime=0.1000000
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	MaxParticles=1
	StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=999999.0000000,Max=999999.0000000)
end object
