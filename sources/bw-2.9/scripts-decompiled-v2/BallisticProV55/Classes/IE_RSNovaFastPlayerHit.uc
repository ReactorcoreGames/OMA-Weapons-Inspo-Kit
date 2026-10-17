class IE_RSNovaFastPlayerHit extends BallisticEmitter;

defaultproperties
{
	EmitterZTestSwitches[0]=2
	// Reference: SpriteEmitter'BallisticProV55.IE_RSNovaFastPlayerHit.SpriteEmitter27'
	begin object name="SpriteEmitter27" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		ZTest=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2285710,Color=(R=255,G=255,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=0,A=255))
		FadeOutStartTime=0.0225000
		FadeInEndTime=0.0125000
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.3400000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2500000,Max=0.2500000)
	end object
	Emitters[0]=SpriteEmitter27
	// Reference: BeamEmitter'BallisticProV55.IE_RSNovaFastPlayerHit.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=20.0000000,Max=80.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
		HighFrequencyNoiseRange=(X=(Min=-3.0000000,Max=3.0000000),Y=(Min=-3.0000000,Max=3.0000000),Z=(Min=-3.0000000,Max=3.0000000))
		HighFrequencyPoints=8
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1428570,Color=(R=0,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.3035710,Color=(R=255,G=255,B=255,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.8000000,Max=1.0000000))
		FadeOutStartTime=0.1160000
		CoordinateSystem=1
		MaxParticles=8
		StartSizeRange=(X=(Min=2.0000000,Max=8.0000000),Y=(Min=2.0000000,Max=8.0000000),Z=(Min=2.0000000,Max=8.0000000))
		InitialParticlesPerSecond=60.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
	end object
	Emitters[1]=BeamEmitter0
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.IE_RSNovaFastPlayerHit.SpriteEmitter27'
begin object name="SpriteEmitter27" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	ZTest=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2285710,Color=(R=255,G=255,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=0,A=255))
	FadeOutStartTime=0.0225000
	FadeInEndTime=0.0125000
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.3400000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2500000,Max=0.2500000)
end object
// Reference: BeamEmitter'BallisticProV55.IE_RSNovaFastPlayerHit.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=20.0000000,Max=80.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
	HighFrequencyNoiseRange=(X=(Min=-3.0000000,Max=3.0000000),Y=(Min=-3.0000000,Max=3.0000000),Z=(Min=-3.0000000,Max=3.0000000))
	HighFrequencyPoints=8
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1428570,Color=(R=0,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.3035710,Color=(R=255,G=255,B=255,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.8000000,Max=1.0000000))
	FadeOutStartTime=0.1160000
	CoordinateSystem=1
	MaxParticles=8
	StartSizeRange=(X=(Min=2.0000000,Max=8.0000000),Y=(Min=2.0000000,Max=8.0000000),Z=(Min=2.0000000,Max=8.0000000))
	InitialParticlesPerSecond=60.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
end object
