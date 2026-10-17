class PumaProjTrailCorona extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.PumaProjTrailCorona.SpriteEmitter25'
	begin object name="SpriteEmitter25" class=Engine.SpriteEmitter
		UseDirectionAs=7
		UseColorScale=true
		UseRegularSizeScale=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=128,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=255,G=128,B=255,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=0))
		CoordinateSystem=1
		MaxParticles=2
		StartSizeRange=(X=(Min=30.0000000,Max=50.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'EpicParticles.Flares.OutSpark03aw'
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[0]=SpriteEmitter25
	// Reference: SpriteEmitter'BWBP_SKC_Pro.PumaProjTrailCorona.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=0,G=64,B=128,A=0))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=0,G=64,B=128,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=6
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'AW-2004Particles.Energy.BurnFlare'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[1]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_SKC_Pro.PumaProjTrailCorona.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=64,G=64,B=128,A=0))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=64,G=64,B=128,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.5000000
		CoordinateSystem=1
		MaxParticles=3
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
		LifetimeRange=(Min=0.0200000,Max=0.0200000)
		WarmupTicksPerSecond=1.0000000
		RelativeWarmupTime=1.0000000
	end object
	Emitters[2]=SpriteEmitter1
	// Reference: SpriteEmitter'BWBP_SKC_Pro.PumaProjTrailCorona.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.4000000,Color=(R=40,G=40,B=80,A=0))
		ColorScale[2]=(RelativeTime=0.6000000,Color=(R=40,G=40,B=80,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=3
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.2000000)
		StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'AW-2004Particles.Energy.EclipseCircle'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		WarmupTicksPerSecond=1.0000000
		RelativeWarmupTime=1.0000000
	end object
	Emitters[3]=SpriteEmitter4
	// Reference: TrailEmitter'BWBP_SKC_Pro.PumaProjTrailCorona.TrailEmitter8'
	begin object name="TrailEmitter8" class=Engine.TrailEmitter
		TrailShadeType=3
		TrailLocation=1
		MaxPointsPerTrail=150
		DistanceThreshold=50.0000000
		UseCrossedSheets=true
		PointLifeTime=2.0000000
		FadeOut=true
		UniformSize=true
		AutomaticInitialSpawning=false
		Opacity=0.3000000
		FadeOutStartTime=0.1000000
		MaxParticles=1
		DetailMode=2
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=3.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=9999.0000000,Max=9999.0000000)
	end object
	Emitters[4]=TrailEmitter8
	DrawScale=0.0100000
	Style=2
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.PumaProjTrailCorona.SpriteEmitter25'
begin object name="SpriteEmitter25" class=Engine.SpriteEmitter
	UseDirectionAs=7
	UseColorScale=true
	UseRegularSizeScale=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=128,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=255,G=128,B=255,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=0))
	CoordinateSystem=1
	MaxParticles=2
	StartSizeRange=(X=(Min=30.0000000,Max=50.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'EpicParticles.Flares.OutSpark03aw'
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.PumaProjTrailCorona.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=0,G=64,B=128,A=0))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=0,G=64,B=128,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=6
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'AW-2004Particles.Energy.BurnFlare'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.PumaProjTrailCorona.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=64,G=64,B=128,A=0))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=64,G=64,B=128,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.5000000
	CoordinateSystem=1
	MaxParticles=3
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
	LifetimeRange=(Min=0.0200000,Max=0.0200000)
	WarmupTicksPerSecond=1.0000000
	RelativeWarmupTime=1.0000000
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.PumaProjTrailCorona.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.4000000,Color=(R=40,G=40,B=80,A=0))
	ColorScale[2]=(RelativeTime=0.6000000,Color=(R=40,G=40,B=80,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=3
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.2000000)
	StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'AW-2004Particles.Energy.EclipseCircle'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	WarmupTicksPerSecond=1.0000000
	RelativeWarmupTime=1.0000000
end object
// Reference: TrailEmitter'BWBP_SKC_Pro.PumaProjTrailCorona.TrailEmitter8'
begin object name="TrailEmitter8" class=Engine.TrailEmitter
	TrailShadeType=3
	TrailLocation=1
	MaxPointsPerTrail=150
	DistanceThreshold=50.0000000
	UseCrossedSheets=true
	PointLifeTime=2.0000000
	FadeOut=true
	UniformSize=true
	AutomaticInitialSpawning=false
	Opacity=0.3000000
	FadeOutStartTime=0.1000000
	MaxParticles=1
	DetailMode=2
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=3.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=9999.0000000,Max=9999.0000000)
end object
