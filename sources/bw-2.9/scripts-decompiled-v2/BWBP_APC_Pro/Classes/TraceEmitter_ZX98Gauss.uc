class TraceEmitter_ZX98Gauss extends BCTraceEmitter;

simulated function Initialize(float Distance, optional float Power)
{
	BeamEmitter(Emitters[0]).BeamDistanceRange.Min = FMax(0.0000000, Distance - float(100));
	BeamEmitter(Emitters[0]).BeamDistanceRange.Max = FMax(0.0000000, Distance - float(100));
	BeamEmitter(Emitters[2]).BeamDistanceRange.Min = Distance;
	BeamEmitter(Emitters[2]).BeamDistanceRange.Max = Distance;
	BeamEmitter(Emitters[4]).BeamDistanceRange.Max = Distance;
	//return;	
}

defaultproperties
{
	// Reference: BeamEmitter'BWBP_APC_Pro.TraceEmitter_ZX98Gauss.BeamEmitter1'
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
		Opacity=0.2500000
		FadeOutStartTime=0.1920000
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.1800000,RelativeSize=0.3000000)
		SizeScale[2]=(RelativeTime=0.5000000,RelativeSize=0.5000000)
		SizeScale[3]=(RelativeTime=1.2000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=15.0000000),Y=(Min=2.0000000,Max=15.0000000),Z=(Min=2.0000000,Max=15.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BWBP_SKC_Tex.Bulldog.BulldogSmokeCore'
		LifetimeRange=(Min=1.2000000,Max=1.2000000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=BeamEmitter1
	// Reference: SpriteEmitter'BWBP_APC_Pro.TraceEmitter_ZX98Gauss.SpriteEmitter0'
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
		Opacity=0.1000000
		FadeOutStartTime=1.0000000
		FadeInEndTime=0.3000000
		CoordinateSystem=1
		MaxParticles=3
		DetailMode=1
		StartLocationRange=(X=(Min=-15.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.2000000)
		StartSizeRange=(X=(Min=1.0000000,Max=5.0000000),Y=(Min=1.0000000,Max=5.0000000),Z=(Min=1.0000000,Max=5.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=SpriteEmitter0
	// Reference: BeamEmitter'BWBP_APC_Pro.TraceEmitter_ZX98Gauss.BeamEmitter3'
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
		Opacity=0.1000000
		FadeOutStartTime=0.0800000
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.3000000,RelativeSize=0.3000000)
		StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BWBP_SKC_Tex.BeamCannon.HMCSmokeCore'
		LifetimeRange=(Min=3.5000000,Max=3.5000000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[2]=BeamEmitter3
	// Reference: SpriteEmitter'BWBP_APC_Pro.TraceEmitter_ZX98Gauss.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.1000000
		FadeOutStartTime=2.0750000
		FadeInEndTime=0.1750000
		CoordinateSystem=1
		MaxParticles=60
		StartLocationRange=(X=(Min=0.0000000,Max=1000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=3.0000000,Max=6.0000000),Y=(Min=3.0000000,Max=6.0000000),Z=(Min=3.0000000,Max=6.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.5000000,Max=2.5000000)
		SpawnOnTriggerRange=(Min=100.0000000,Max=100.0000000)
		SpawnOnTriggerPPS=99999.0000000
		StartVelocityRange=(X=(Min=0.0000000,Max=100.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	end object
	Emitters[3]=SpriteEmitter1
	// Reference: BeamEmitter'BWBP_APC_Pro.TraceEmitter_ZX98Gauss.BeamEmitter4'
	begin object name="BeamEmitter4" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=5000.0000000,Max=5000.0000000)
		DetermineEndPointBy=1
		BeamTextureUScale=16.0000000
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=64,A=255))
		ColorScale[1]=(RelativeTime=0.1178570,Color=(R=128,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.2607140,Color=(R=160,G=160,B=160,A=255))
		ColorScale[3]=(RelativeTime=0.5000000,Color=(R=128,G=192,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=0.9000000),Y=(Min=0.9000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.1800000
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=4.0000000,Max=4.0000000),Z=(Min=4.0000000,Max=4.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BWBP_SKC_Tex.BeamCannon.HMCSmokeCore2'
		LifetimeRange=(Min=0.5000000,Max=0.7000000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[4]=BeamEmitter4
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BWBP_APC_Pro.TraceEmitter_ZX98Gauss.BeamEmitter1'
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
	Opacity=0.2500000
	FadeOutStartTime=0.1920000
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.1800000,RelativeSize=0.3000000)
	SizeScale[2]=(RelativeTime=0.5000000,RelativeSize=0.5000000)
	SizeScale[3]=(RelativeTime=1.2000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=15.0000000),Y=(Min=2.0000000,Max=15.0000000),Z=(Min=2.0000000,Max=15.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BWBP_SKC_Tex.Bulldog.BulldogSmokeCore'
	LifetimeRange=(Min=1.2000000,Max=1.2000000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_APC_Pro.TraceEmitter_ZX98Gauss.SpriteEmitter0'
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
	Opacity=0.1000000
	FadeOutStartTime=1.0000000
	FadeInEndTime=0.3000000
	CoordinateSystem=1
	MaxParticles=3
	DetailMode=1
	StartLocationRange=(X=(Min=-15.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.2000000)
	StartSizeRange=(X=(Min=1.0000000,Max=5.0000000),Y=(Min=1.0000000,Max=5.0000000),Z=(Min=1.0000000,Max=5.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: BeamEmitter'BWBP_APC_Pro.TraceEmitter_ZX98Gauss.BeamEmitter3'
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
	Opacity=0.1000000
	FadeOutStartTime=0.0800000
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.3000000,RelativeSize=0.3000000)
	StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BWBP_SKC_Tex.BeamCannon.HMCSmokeCore'
	LifetimeRange=(Min=3.5000000,Max=3.5000000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_APC_Pro.TraceEmitter_ZX98Gauss.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.1000000
	FadeOutStartTime=2.0750000
	FadeInEndTime=0.1750000
	CoordinateSystem=1
	MaxParticles=60
	StartLocationRange=(X=(Min=0.0000000,Max=1000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=3.0000000,Max=6.0000000),Y=(Min=3.0000000,Max=6.0000000),Z=(Min=3.0000000,Max=6.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.5000000,Max=2.5000000)
	SpawnOnTriggerRange=(Min=100.0000000,Max=100.0000000)
	SpawnOnTriggerPPS=99999.0000000
	StartVelocityRange=(X=(Min=0.0000000,Max=100.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
end object
// Reference: BeamEmitter'BWBP_APC_Pro.TraceEmitter_ZX98Gauss.BeamEmitter4'
begin object name="BeamEmitter4" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=5000.0000000,Max=5000.0000000)
	DetermineEndPointBy=1
	BeamTextureUScale=16.0000000
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=64,A=255))
	ColorScale[1]=(RelativeTime=0.1178570,Color=(R=128,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.2607140,Color=(R=160,G=160,B=160,A=255))
	ColorScale[3]=(RelativeTime=0.5000000,Color=(R=128,G=192,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=0.9000000),Y=(Min=0.9000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.1800000
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=4.0000000,Max=4.0000000),Z=(Min=4.0000000,Max=4.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BWBP_SKC_Tex.BeamCannon.HMCSmokeCore2'
	LifetimeRange=(Min=0.5000000,Max=0.7000000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
