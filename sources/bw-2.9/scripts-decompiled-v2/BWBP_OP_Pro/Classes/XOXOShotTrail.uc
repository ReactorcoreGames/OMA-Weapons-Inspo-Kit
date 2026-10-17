class XOXOShotTrail extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_OP_Pro.XOXOShotTrail.SpriteEmitter114'
	begin object name="SpriteEmitter114" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=192,A=0))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=160,G=192,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=255,B=192,A=0))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
		Opacity=0.5500000
		FadeOutStartTime=0.3000000
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=1
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1500000,Max=0.3000000)
	end object
	Emitters[0]=SpriteEmitter114
	// Reference: TrailEmitter'BWBP_OP_Pro.XOXOShotTrail.TrailEmitter1'
	begin object name="TrailEmitter1" class=Engine.TrailEmitter
		TrailShadeType=3
		TrailLocation=1
		MaxPointsPerTrail=150
		DistanceThreshold=100.0000000
		UseCrossedSheets=true
		PointLifeTime=0.3750000
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.7000000,Max=0.7000000))
		Opacity=0.6000000
		MaxParticles=1
		StartSizeRange=(X=(Min=3.0000000,Max=4.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=999999.0000000,Max=999999.0000000)
	end object
	Emitters[1]=TrailEmitter1
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_OP_Pro.XOXOShotTrail.SpriteEmitter114'
begin object name="SpriteEmitter114" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=192,A=0))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=160,G=192,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=255,B=192,A=0))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
	Opacity=0.5500000
	FadeOutStartTime=0.3000000
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=1
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1500000,Max=0.3000000)
end object
// Reference: TrailEmitter'BWBP_OP_Pro.XOXOShotTrail.TrailEmitter1'
begin object name="TrailEmitter1" class=Engine.TrailEmitter
	TrailShadeType=3
	TrailLocation=1
	MaxPointsPerTrail=150
	DistanceThreshold=100.0000000
	UseCrossedSheets=true
	PointLifeTime=0.3750000
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.7000000,Max=0.7000000))
	Opacity=0.6000000
	MaxParticles=1
	StartSizeRange=(X=(Min=3.0000000,Max=4.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=999999.0000000,Max=999999.0000000)
end object
