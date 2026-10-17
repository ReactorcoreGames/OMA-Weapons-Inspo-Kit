class RSDark2Trail extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.RSDark2Trail.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.2500000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.5800000
		CoordinateSystem=1
		MaxParticles=1
		StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=35.0000000,Max=35.0000000),Z=(Min=35.0000000,Max=35.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.5000000)
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RSDark2Trail.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseDirectionAs=4
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.6000000
		FadeInEndTime=0.2500000
		CoordinateSystem=1
		MaxParticles=2
		SpinsPerSecondRange=(X=(Min=0.5000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=10.0000000,Max=15.0000000),Z=(Min=10.0000000,Max=15.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaBubbleA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7000000,Max=1.0000000)
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: SpriteEmitter'BallisticProV55.RSDark2Trail.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseDirectionAs=4
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.4200000
		FadeOutStartTime=0.5000000
		CoordinateSystem=1
		MaxParticles=2
		SpinsPerSecondRange=(X=(Min=0.5000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[2]=SpriteEmitter2
	// Reference: TrailEmitter'BallisticProV55.RSDark2Trail.TrailEmitter0'
	begin object name="TrailEmitter0" class=Engine.TrailEmitter
		TrailShadeType=3
		TrailLocation=1
		MaxPointsPerTrail=150
		DistanceThreshold=50.0000000
		UseCrossedSheets=true
		PointLifeTime=2.0000000
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorMultiplierRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.5000000,Max=0.5000000))
		Opacity=0.6000000
		FadeOutStartTime=0.1000000
		MaxParticles=1
		StartSizeRange=(X=(Min=3.0000000,Max=4.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=9999.0000000,Max=9999.0000000)
	end object
	Emitters[3]=TrailEmitter0
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.RSDark2Trail.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.2500000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.5800000
	CoordinateSystem=1
	MaxParticles=1
	StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=35.0000000,Max=35.0000000),Z=(Min=35.0000000,Max=35.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RSDark2Trail.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseDirectionAs=4
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.6000000
	FadeInEndTime=0.2500000
	CoordinateSystem=1
	MaxParticles=2
	SpinsPerSecondRange=(X=(Min=0.5000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=10.0000000,Max=15.0000000),Z=(Min=10.0000000,Max=15.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaBubbleA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RSDark2Trail.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseDirectionAs=4
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.4200000
	FadeOutStartTime=0.5000000
	CoordinateSystem=1
	MaxParticles=2
	SpinsPerSecondRange=(X=(Min=0.5000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: TrailEmitter'BallisticProV55.RSDark2Trail.TrailEmitter0'
begin object name="TrailEmitter0" class=Engine.TrailEmitter
	TrailShadeType=3
	TrailLocation=1
	MaxPointsPerTrail=150
	DistanceThreshold=50.0000000
	UseCrossedSheets=true
	PointLifeTime=2.0000000
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorMultiplierRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.5000000,Max=0.5000000))
	Opacity=0.6000000
	FadeOutStartTime=0.1000000
	MaxParticles=1
	StartSizeRange=(X=(Min=3.0000000,Max=4.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=9999.0000000,Max=9999.0000000)
end object
