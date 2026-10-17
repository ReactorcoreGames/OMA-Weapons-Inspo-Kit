class PD97BeaconEffect extends Emitter;

defaultproperties
{
	// Reference: TrailEmitter'BWBP_OP_Pro.PD97BeaconEffect.TrailEmitter0'
	begin object name="TrailEmitter0" class=Engine.TrailEmitter
		TrailShadeType=3
		TrailLocation=1
		MaxPointsPerTrail=150
		DistanceThreshold=20.0000000
		UseCrossedSheets=true
		PointLifeTime=1.0000000
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=0.2000000,Max=0.3000000),Y=(Min=0.2000000,Max=0.3000000),Z=(Min=0.2000000,Max=0.3000000))
		MaxParticles=1
		StartSizeRange=(X=(Min=0.2000000,Max=1.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=2000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=999999.0000000,Max=999999.0000000)
	end object
	Emitters[0]=TrailEmitter0
	// Reference: SpriteEmitter'BWBP_OP_Pro.PD97BeaconEffect.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		UseColorScale=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=200,B=64,A=0))
		ColorScale[1]=(RelativeTime=0.7500000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.5900000
		CoordinateSystem=1
		MaxParticles=3
		StartLocationOffset=(X=-10.0000000,Y=0.0000000,Z=0.0000000)
		SpinCCWorCW=(X=0.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.0500000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=0.2500000,RelativeSize=0.7500000)
		SizeScale[3]=(RelativeTime=0.4000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=5.0000000,Max=7.5000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		InitialDelayRange=(Min=0.0500000,Max=0.0500000)
	end object
	Emitters[1]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_OP_Pro.PD97BeaconEffect.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=4,B=4,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=200,G=4,B=4,A=255))
		Opacity=0.1300000
		FadeOutStartTime=0.9900000
		FadeInEndTime=0.1600000
		MaxParticles=1
		DetailMode=2
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=10.5000000,Max=12.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.5000000,Max=3.0000000)
	end object
	Emitters[2]=SpriteEmitter3
	AutoDestroy=true
	bNoDelete=false
	Physics=10
	bHardAttach=true
	bDirectional=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: TrailEmitter'BWBP_OP_Pro.PD97BeaconEffect.TrailEmitter0'
begin object name="TrailEmitter0" class=Engine.TrailEmitter
	TrailShadeType=3
	TrailLocation=1
	MaxPointsPerTrail=150
	DistanceThreshold=20.0000000
	UseCrossedSheets=true
	PointLifeTime=1.0000000
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=0.2000000,Max=0.3000000),Y=(Min=0.2000000,Max=0.3000000),Z=(Min=0.2000000,Max=0.3000000))
	MaxParticles=1
	StartSizeRange=(X=(Min=0.2000000,Max=1.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=2000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=999999.0000000,Max=999999.0000000)
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.PD97BeaconEffect.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	UseColorScale=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=200,B=64,A=0))
	ColorScale[1]=(RelativeTime=0.7500000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.5900000
	CoordinateSystem=1
	MaxParticles=3
	StartLocationOffset=(X=-10.0000000,Y=0.0000000,Z=0.0000000)
	SpinCCWorCW=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.0500000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=0.2500000,RelativeSize=0.7500000)
	SizeScale[3]=(RelativeTime=0.4000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=5.0000000,Max=7.5000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	InitialDelayRange=(Min=0.0500000,Max=0.0500000)
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.PD97BeaconEffect.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=4,B=4,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=200,G=4,B=4,A=255))
	Opacity=0.1300000
	FadeOutStartTime=0.9900000
	FadeInEndTime=0.1600000
	MaxParticles=1
	DetailMode=2
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=10.5000000,Max=12.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.5000000,Max=3.0000000)
end object
