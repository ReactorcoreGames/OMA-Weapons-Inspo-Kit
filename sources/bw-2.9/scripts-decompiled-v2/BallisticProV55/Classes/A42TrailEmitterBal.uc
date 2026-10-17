class A42TrailEmitterBal extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.A42TrailEmitterBal.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=30,A=0))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=255,G=180,B=130,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=192,G=255,B=128,A=0))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
		Opacity=0.4500000
		FadeOutStartTime=0.1000000
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.2000000)
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: TrailEmitter'BallisticProV55.A42TrailEmitterBal.TrailEmitter0'
	begin object name="TrailEmitter0" class=Engine.TrailEmitter
		TrailShadeType=3
		TrailLocation=1
		MaxPointsPerTrail=150
		DistanceThreshold=50.0000000
		UseCrossedSheets=true
		PointLifeTime=0.7500000
		FadeOut=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=0.2500000,Max=0.3500000),Z=(Min=0.1000000,Max=0.1500000))
		Opacity=0.3000000
		FadeOutStartTime=0.1000000
		MaxParticles=1
		StartSizeRange=(X=(Min=2.0000000,Max=3.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=9999.0000000,Max=9999.0000000)
	end object
	Emitters[1]=TrailEmitter0
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.A42TrailEmitterBal.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=30,A=0))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=255,G=180,B=130,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=192,G=255,B=128,A=0))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
	Opacity=0.4500000
	FadeOutStartTime=0.1000000
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.2000000)
end object
// Reference: TrailEmitter'BallisticProV55.A42TrailEmitterBal.TrailEmitter0'
begin object name="TrailEmitter0" class=Engine.TrailEmitter
	TrailShadeType=3
	TrailLocation=1
	MaxPointsPerTrail=150
	DistanceThreshold=50.0000000
	UseCrossedSheets=true
	PointLifeTime=0.7500000
	FadeOut=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=0.2500000,Max=0.3500000),Z=(Min=0.1000000,Max=0.1500000))
	Opacity=0.3000000
	FadeOutStartTime=0.1000000
	MaxParticles=1
	StartSizeRange=(X=(Min=2.0000000,Max=3.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=9999.0000000,Max=9999.0000000)
end object
