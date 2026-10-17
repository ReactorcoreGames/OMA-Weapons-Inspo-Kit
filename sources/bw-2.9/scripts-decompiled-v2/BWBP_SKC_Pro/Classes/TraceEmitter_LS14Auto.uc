class TraceEmitter_LS14Auto extends BCTraceEmitter;

simulated function Initialize(float Distance, optional float Power)
{
	local float AdjustedPower;

	AdjustedPower = Power / float(255);
	AdjustedPower = 1.0000000 - (0.6000000 * AdjustedPower);
	Emitters[0].Opacity = Emitters[0].default.Opacity * AdjustedPower;
	Emitters[3].Opacity = Emitters[3].default.Opacity * AdjustedPower;
	BeamEmitter(Emitters[1]).BeamDistanceRange.Min = Distance;
	BeamEmitter(Emitters[1]).BeamDistanceRange.Max = Distance;
	BeamEmitter(Emitters[3]).BeamDistanceRange.Min = Distance;
	BeamEmitter(Emitters[3]).BeamDistanceRange.Max = Distance;
	//return;	
}

defaultproperties
{
	// Reference: BeamEmitter'BWBP_SKC_Pro.TraceEmitter_LS14Auto.BeamEmitter1'
	begin object name="BeamEmitter1" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=5000.0000000,Max=5000.0000000)
		DetermineEndPointBy=1
		BeamTextureUScale=8.0000000
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=64,A=255))
		ColorScale[1]=(RelativeTime=0.2750000,Color=(R=0,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.4964290,Color=(R=64,G=192,B=255,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=43,B=88,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=0.9000000),Y=(Min=0.9000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.1920000
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=3.0000000),Y=(Min=2.0000000,Max=3.0000000),Z=(Min=2.0000000,Max=3.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BWBP_SKC_Tex.Glock_Gold.GRSXX-LaserBeamBlue'
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=BeamEmitter1
	// Reference: SpriteEmitter'BWBP_SKC_Pro.TraceEmitter_LS14Auto.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=2.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.4000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.8000000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.3500000
		FadeOutStartTime=0.1000000
		FadeInEndTime=0.0600000
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=1
		StartLocationRange=(X=(Min=-15.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.2000000)
		StartSizeRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=5.0000000,Max=10.0000000),Z=(Min=5.0000000,Max=10.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=SpriteEmitter0
	// Reference: SparkEmitter'BWBP_SKC_Pro.TraceEmitter_LS14Auto.SparkEmitter0'
	begin object name="SparkEmitter0" class=Engine.SparkEmitter
		LineSegmentsRange=(Min=1.0000000,Max=1.0000000)
		TimeBetweenSegmentsRange=(Min=0.1000000,Max=0.1000000)
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=80,G=192,B=64,A=255))
		ColorScale[1]=(RelativeTime=0.3571430,Color=(R=0,G=64,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.7642860,Color=(R=0,G=128,B=255,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
		FadeOutStartTime=0.5300000
		CoordinateSystem=1
		MaxParticles=3
		DetailMode=2
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=50.0000000,Max=3000.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=-200.0000000,Max=200.0000000))
	end object
	Emitters[2]=SparkEmitter0
	// Reference: BeamEmitter'BWBP_SKC_Pro.TraceEmitter_LS14Auto.BeamEmitter3'
	begin object name="BeamEmitter3" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=5000.0000000,Max=5000.0000000)
		DetermineEndPointBy=1
		BeamTextureUScale=16.0000000
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=192,B=64,A=255))
		ColorScale[1]=(RelativeTime=0.1178570,Color=(R=128,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.2607140,Color=(R=128,G=86,B=128,A=255))
		ColorScale[3]=(RelativeTime=0.5000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=0.9000000),Y=(Min=0.9000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.1800000
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=1.5000000,Max=1.5000000),Y=(Min=1.5000000,Max=1.5000000),Z=(Min=1.5000000,Max=1.5000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BWBP_SKC_Tex.Glock_Gold.GRSXX-LaserBeamBlue'
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[3]=BeamEmitter3
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BWBP_SKC_Pro.TraceEmitter_LS14Auto.BeamEmitter1'
begin object name="BeamEmitter1" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=5000.0000000,Max=5000.0000000)
	DetermineEndPointBy=1
	BeamTextureUScale=8.0000000
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=64,A=255))
	ColorScale[1]=(RelativeTime=0.2750000,Color=(R=0,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.4964290,Color=(R=64,G=192,B=255,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=43,B=88,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=0.9000000),Y=(Min=0.9000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.1920000
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=3.0000000),Y=(Min=2.0000000,Max=3.0000000),Z=(Min=2.0000000,Max=3.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BWBP_SKC_Tex.Glock_Gold.GRSXX-LaserBeamBlue'
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.TraceEmitter_LS14Auto.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=2.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.4000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.8000000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.3500000
	FadeOutStartTime=0.1000000
	FadeInEndTime=0.0600000
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=1
	StartLocationRange=(X=(Min=-15.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.2000000)
	StartSizeRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=5.0000000,Max=10.0000000),Z=(Min=5.0000000,Max=10.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SparkEmitter'BWBP_SKC_Pro.TraceEmitter_LS14Auto.SparkEmitter0'
begin object name="SparkEmitter0" class=Engine.SparkEmitter
	LineSegmentsRange=(Min=1.0000000,Max=1.0000000)
	TimeBetweenSegmentsRange=(Min=0.1000000,Max=0.1000000)
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=80,G=192,B=64,A=255))
	ColorScale[1]=(RelativeTime=0.3571430,Color=(R=0,G=64,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.7642860,Color=(R=0,G=128,B=255,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
	FadeOutStartTime=0.5300000
	CoordinateSystem=1
	MaxParticles=3
	DetailMode=2
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=50.0000000,Max=3000.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=-200.0000000,Max=200.0000000))
end object
// Reference: BeamEmitter'BWBP_SKC_Pro.TraceEmitter_LS14Auto.BeamEmitter3'
begin object name="BeamEmitter3" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=5000.0000000,Max=5000.0000000)
	DetermineEndPointBy=1
	BeamTextureUScale=16.0000000
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=192,B=64,A=255))
	ColorScale[1]=(RelativeTime=0.1178570,Color=(R=128,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.2607140,Color=(R=128,G=86,B=128,A=255))
	ColorScale[3]=(RelativeTime=0.5000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=0.9000000),Y=(Min=0.9000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.1800000
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=1.5000000,Max=1.5000000),Y=(Min=1.5000000,Max=1.5000000),Z=(Min=1.5000000,Max=1.5000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BWBP_SKC_Tex.Glock_Gold.GRSXX-LaserBeamBlue'
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
