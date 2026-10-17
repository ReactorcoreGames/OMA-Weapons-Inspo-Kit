class HVPCSmallTrailEmitter extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.HVPCSmallTrailEmitter.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=0,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=64,A=0))
		Opacity=0.7000000
		FadeOutStartTime=0.2000000
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=100.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=160.0000000,Max=180.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.A73RedLayout.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3500000,Max=0.5000000)
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: TrailEmitter'BWBP_SKC_Pro.HVPCSmallTrailEmitter.TrailEmitter1'
	begin object name="TrailEmitter1" class=Engine.TrailEmitter
		TrailShadeType=4
		TrailLocation=1
		MaxPointsPerTrail=1000
		DistanceThreshold=1000.0000000
		PointLifeTime=3.5000000
		FadeOut=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=2.0000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.2000000))
		Opacity=0.4000000
		FadeOutStartTime=0.1000000
		MaxParticles=1
		DetailMode=2
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.5500000,RelativeSize=1.2000000)
		SizeScale[2]=(RelativeTime=1.5000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=4.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500000.0000000
		Texture=Texture'BW_Core_WeaponTex.A73RedLayout.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=6.0000000,Max=6.0000000)
	end object
	Emitters[1]=TrailEmitter1
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.HVPCSmallTrailEmitter.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=0,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=64,A=0))
	Opacity=0.7000000
	FadeOutStartTime=0.2000000
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=100.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=160.0000000,Max=180.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.A73RedLayout.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3500000,Max=0.5000000)
end object
// Reference: TrailEmitter'BWBP_SKC_Pro.HVPCSmallTrailEmitter.TrailEmitter1'
begin object name="TrailEmitter1" class=Engine.TrailEmitter
	TrailShadeType=4
	TrailLocation=1
	MaxPointsPerTrail=1000
	DistanceThreshold=1000.0000000
	PointLifeTime=3.5000000
	FadeOut=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=2.0000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.2000000))
	Opacity=0.4000000
	FadeOutStartTime=0.1000000
	MaxParticles=1
	DetailMode=2
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.5500000,RelativeSize=1.2000000)
	SizeScale[2]=(RelativeTime=1.5000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=4.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500000.0000000
	Texture=Texture'BW_Core_WeaponTex.A73RedLayout.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=6.0000000,Max=6.0000000)
end object
