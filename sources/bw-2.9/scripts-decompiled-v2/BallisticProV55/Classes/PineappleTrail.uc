class PineappleTrail extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.PineappleTrail.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		Disabled=true
		Backup_Disabled=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.9000000),Z=(Min=0.5000000,Max=0.7000000))
		Opacity=0.3500000
		FadeOutStartTime=1.0000000
		CoordinateSystem=1
		MaxParticles=1
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		InitialParticlesPerSecond=20.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
	end object
	Emitters[0]=SpriteEmitter8
	// Reference: TrailEmitter'BallisticProV55.PineappleTrail.TrailEmitter1'
	begin object name="TrailEmitter1" class=Engine.TrailEmitter
		TrailShadeType=4
		TrailLocation=1
		MaxPointsPerTrail=50
		DistanceThreshold=40.0000000
		PointLifeTime=1.0000000
		FadeOut=true
		FadeIn=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8500000,Max=0.9000000),Z=(Min=0.6500000,Max=0.7000000))
		Opacity=0.2000000
		FadeOutStartTime=0.4000000
		FadeInEndTime=0.2000000
		MaxParticles=1
		StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=20.0000000))
		InitialParticlesPerSecond=500000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
	end object
	Emitters[1]=TrailEmitter1
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.PineappleTrail.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	Disabled=true
	Backup_Disabled=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.9000000),Z=(Min=0.5000000,Max=0.7000000))
	Opacity=0.3500000
	FadeOutStartTime=1.0000000
	CoordinateSystem=1
	MaxParticles=1
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	InitialParticlesPerSecond=20.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
end object
// Reference: TrailEmitter'BallisticProV55.PineappleTrail.TrailEmitter1'
begin object name="TrailEmitter1" class=Engine.TrailEmitter
	TrailShadeType=4
	TrailLocation=1
	MaxPointsPerTrail=50
	DistanceThreshold=40.0000000
	PointLifeTime=1.0000000
	FadeOut=true
	FadeIn=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8500000,Max=0.9000000),Z=(Min=0.6500000,Max=0.7000000))
	Opacity=0.2000000
	FadeOutStartTime=0.4000000
	FadeInEndTime=0.2000000
	MaxParticles=1
	StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=20.0000000))
	InitialParticlesPerSecond=500000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
end object
