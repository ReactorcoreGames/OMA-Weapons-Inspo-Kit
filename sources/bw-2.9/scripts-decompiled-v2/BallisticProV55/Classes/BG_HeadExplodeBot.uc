class BG_HeadExplodeBot extends BW_HitGoreEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.BG_HeadExplodeBot.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.4000000,Max=1.0000000),Y=(Min=0.4000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
		FadeOutStartTime=0.0600000
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=2
		StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=40.0000000),Y=(Min=20.0000000,Max=40.0000000),Z=(Min=20.0000000,Max=40.0000000))
		InitialParticlesPerSecond=4000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
	end object
	Emitters[0]=SpriteEmitter8
	// Reference: SpriteEmitter'BallisticProV55.BG_HeadExplodeBot.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.7000000,Max=0.8000000))
		FadeOutStartTime=0.1820000
		MaxParticles=25
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=6.0000000,Max=16.0000000),Y=(Min=6.0000000,Max=16.0000000),Z=(Min=6.0000000,Max=16.0000000))
		InitialParticlesPerSecond=4000.0000000
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.6500000,Max=0.6500000)
		StartVelocityRange=(X=(Min=20.0000000,Max=500.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=0.0000000,Max=300.0000000))
	end object
	Emitters[1]=SpriteEmitter9
	// Reference: MeshEmitter'BallisticProV55.BG_HeadExplodeBot.MeshEmitter3'
	begin object name="MeshEmitter3" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip2'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1571430,Color=(R=255,G=255,B=128,A=255))
		ColorScale[2]=(RelativeTime=0.4821430,Color=(R=255,G=128,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		FadeOutStartTime=0.5840000
		MaxParticles=15
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=4.0000000),Z=(Min=0.0000000,Max=4.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=0.0500000,Max=0.3000000),Y=(Min=0.0500000,Max=0.3000000),Z=(Min=0.0500000,Max=0.3000000))
		InitialParticlesPerSecond=400.0000000
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=250.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=50.0000000,Max=200.0000000))
	end object
	Emitters[2]=MeshEmitter3
	// Reference: SpriteEmitter'BallisticProV55.BG_HeadExplodeBot.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.1000000,Max=0.3000000),Z=(Min=0.7000000,Max=1.0000000))
		FadeOutStartTime=0.1170000
		MaxParticles=25
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
		InitialParticlesPerSecond=100.0000000
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=-350.0000000,Max=350.0000000),Y=(Min=-220.0000000,Max=220.0000000),Z=(Min=100.0000000,Max=300.0000000))
	end object
	Emitters[3]=SpriteEmitter10
	// Reference: BeamEmitter'BallisticProV55.BG_HeadExplodeBot.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=10.0000000,Max=75.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
		HighFrequencyNoiseRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
		HighFrequencyPoints=5
		NoiseDeterminesEndPoint=true
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1500000,Color=(R=0,G=128,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.3321430,Color=(R=255,G=255,B=255,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		Opacity=0.6500000
		FadeOutStartTime=0.0600000
		FadeInEndTime=0.0360000
		MaxParticles=20
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.5000000)
		SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=0.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
		InitialParticlesPerSecond=30.0000000
		Texture=Texture'EpicParticles.Beams.BeamFalloff'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-1.0000000,Max=10.0000000))
	end object
	Emitters[4]=BeamEmitter0
	// Reference: SpriteEmitter'BallisticProV55.BG_HeadExplodeBot.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.3575100
		FadeInEndTime=0.0140200
		MaxParticles=14
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=0.7000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=40.0000000),Y=(Min=20.0000000,Max=40.0000000),Z=(Min=20.0000000,Max=40.0000000))
		InitialParticlesPerSecond=100.0000000
		DrawStyle=1
		Texture=Texture'BallisticBloodPro.Bot.Bot-Saw4'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7010000,Max=0.7010000)
		StartVelocityRange=(X=(Min=20.0000000,Max=150.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=200.0000000))
		VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	end object
	Emitters[5]=SpriteEmitter0
	// Reference: TrailEmitter'BallisticProV55.BG_HeadExplodeBot.TrailEmitter1'
	begin object name="TrailEmitter1" class=Engine.TrailEmitter
		TrailShadeType=4
		MaxPointsPerTrail=15
		DistanceThreshold=8.0000000
		PointLifeTime=2.0000000
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		MaxParticles=5
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=5.0000000)
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=2.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=400.0000000
		DrawStyle=1
		Texture=Texture'BallisticBloodPro.Bot.Bot-Explode2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=400.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=0.0000000,Max=200.0000000))
	end object
	Emitters[6]=TrailEmitter1
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.BG_HeadExplodeBot.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.4000000,Max=1.0000000),Y=(Min=0.4000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
	FadeOutStartTime=0.0600000
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=2
	StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=40.0000000),Y=(Min=20.0000000,Max=40.0000000),Z=(Min=20.0000000,Max=40.0000000))
	InitialParticlesPerSecond=4000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
end object
// Reference: SpriteEmitter'BallisticProV55.BG_HeadExplodeBot.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.7000000,Max=0.8000000))
	FadeOutStartTime=0.1820000
	MaxParticles=25
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=6.0000000,Max=16.0000000),Y=(Min=6.0000000,Max=16.0000000),Z=(Min=6.0000000,Max=16.0000000))
	InitialParticlesPerSecond=4000.0000000
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.6500000,Max=0.6500000)
	StartVelocityRange=(X=(Min=20.0000000,Max=500.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=0.0000000,Max=300.0000000))
end object
// Reference: MeshEmitter'BallisticProV55.BG_HeadExplodeBot.MeshEmitter3'
begin object name="MeshEmitter3" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip2'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1571430,Color=(R=255,G=255,B=128,A=255))
	ColorScale[2]=(RelativeTime=0.4821430,Color=(R=255,G=128,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	FadeOutStartTime=0.5840000
	MaxParticles=15
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=4.0000000),Z=(Min=0.0000000,Max=4.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=0.0500000,Max=0.3000000),Y=(Min=0.0500000,Max=0.3000000),Z=(Min=0.0500000,Max=0.3000000))
	InitialParticlesPerSecond=400.0000000
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=250.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=50.0000000,Max=200.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.BG_HeadExplodeBot.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.1000000,Max=0.3000000),Z=(Min=0.7000000,Max=1.0000000))
	FadeOutStartTime=0.1170000
	MaxParticles=25
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
	InitialParticlesPerSecond=100.0000000
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=-350.0000000,Max=350.0000000),Y=(Min=-220.0000000,Max=220.0000000),Z=(Min=100.0000000,Max=300.0000000))
end object
// Reference: BeamEmitter'BallisticProV55.BG_HeadExplodeBot.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=10.0000000,Max=75.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
	HighFrequencyNoiseRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
	HighFrequencyPoints=5
	NoiseDeterminesEndPoint=true
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1500000,Color=(R=0,G=128,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.3321430,Color=(R=255,G=255,B=255,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	Opacity=0.6500000
	FadeOutStartTime=0.0600000
	FadeInEndTime=0.0360000
	MaxParticles=20
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.5000000)
	SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=0.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
	InitialParticlesPerSecond=30.0000000
	Texture=Texture'EpicParticles.Beams.BeamFalloff'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-1.0000000,Max=10.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.BG_HeadExplodeBot.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.3575100
	FadeInEndTime=0.0140200
	MaxParticles=14
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=0.7000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=40.0000000),Y=(Min=20.0000000,Max=40.0000000),Z=(Min=20.0000000,Max=40.0000000))
	InitialParticlesPerSecond=100.0000000
	DrawStyle=1
	Texture=Texture'BallisticBloodPro.Bot.Bot-Saw4'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7010000,Max=0.7010000)
	StartVelocityRange=(X=(Min=20.0000000,Max=150.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=200.0000000))
	VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
end object
// Reference: TrailEmitter'BallisticProV55.BG_HeadExplodeBot.TrailEmitter1'
begin object name="TrailEmitter1" class=Engine.TrailEmitter
	TrailShadeType=4
	MaxPointsPerTrail=15
	DistanceThreshold=8.0000000
	PointLifeTime=2.0000000
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	MaxParticles=5
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=2.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=400.0000000
	DrawStyle=1
	Texture=Texture'BallisticBloodPro.Bot.Bot-Explode2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=400.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=0.0000000,Max=200.0000000))
end object
