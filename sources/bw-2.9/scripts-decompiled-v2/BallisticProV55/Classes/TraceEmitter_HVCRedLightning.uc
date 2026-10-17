class TraceEmitter_HVCRedLightning extends BCTraceEmitter;

simulated function Initialize(float Distance, optional float Power)
{
	// End:0x5F
	if((Power > float(0)) && Power < float(1))
	{
		Emitters[0].Opacity = Power;
		Emitters[1].Opacity = Power;
		Emitters[4].Opacity = Power;
	}
	BeamEmitter(Emitters[0]).BeamEndPoints[0].offset.X.Min = Distance;
	BeamEmitter(Emitters[0]).BeamEndPoints[0].offset.X.Max = Distance;
	BeamEmitter(Emitters[4]).BeamEndPoints[0].offset.X = BeamEmitter(Emitters[0]).BeamEndPoints[0].offset.X;
	//return;	
}

defaultproperties
{
	// Reference: BeamEmitter'BallisticProV55.TraceEmitter_HVCRedLightning.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=1200.0000000,Max=1200.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=0.0000000)
		DetermineEndPointBy=2
		BeamTextureUScale=2.0000000
		LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-40.0000000,Max=40.0000000))
		HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		UseBranching=true
		BranchProbability=(Min=0.4000000,Max=0.4000000)
		BranchEmitter=1
		BranchSpawnAmountRange=(Min=1.0000000,Max=1.0000000)
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1428570,Color=(R=0,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[3]=(RelativeTime=0.4000000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[4]=(RelativeTime=0.5500000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		FadeOutStartTime=0.1600000
		CoordinateSystem=1
		MaxParticles=5
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.8000000)
		StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
		InitialParticlesPerSecond=40.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.LightningBolt2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=BeamEmitter0
	// Reference: BeamEmitter'BallisticProV55.TraceEmitter_HVCRedLightning.BeamEmitter1'
	begin object name="BeamEmitter1" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=100.0000000,Max=500.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
		HighFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		NoiseDeterminesEndPoint=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1357140,Color=(R=64,G=0,B=64,A=255))
		ColorScale[2]=(RelativeTime=0.2607140,Color=(R=255,G=192,B=64,A=255))
		ColorScale[3]=(RelativeTime=0.3857140,Color=(R=64,G=0,B=64,A=255))
		ColorScale[4]=(RelativeTime=0.5321430,Color=(R=255,G=128,B=0,A=255))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		FadeOutStartTime=0.1760000
		CoordinateSystem=1
		MaxParticles=30
		DetailMode=2
		StartSizeRange=(X=(Min=5.0000000,Max=12.0000000),Y=(Min=5.0000000,Max=12.0000000),Z=(Min=5.0000000,Max=12.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.LightningBoltCut2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
		StartVelocityRange=(X=(Min=0.5000000,Max=1.0100000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
	end object
	Emitters[1]=BeamEmitter1
	// Reference: SpriteEmitter'BallisticProV55.TraceEmitter_HVCRedLightning.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2500000,Color=(R=255,G=64,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		FadeOutStartTime=0.0640000
		CoordinateSystem=1
		MaxParticles=20
		DetailMode=2
		StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
		StartSpinRange=(X=(Min=0.2600000,Max=0.2600000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=30.0000000,Max=50.5000000),Y=(Min=30.0000000,Max=50.5000000),Z=(Min=30.0000000,Max=50.5000000))
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'EpicParticles.Beams.BeamFalloff'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		StartVelocityRange=(X=(Min=150.0000000,Max=3000.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
	end object
	Emitters[2]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.TraceEmitter_HVCRedLightning.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.1285710,Color=(R=255,G=128,B=64,A=255))
		ColorScale[2]=(RelativeTime=0.2500000,Color=(R=255,G=192,B=192,A=255))
		ColorScale[3]=(RelativeTime=0.4142860,Color=(R=64,G=32,B=64,A=255))
		ColorScale[4]=(RelativeTime=0.5607140,Color=(R=255,G=192,B=192,A=255))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		FadeOutStartTime=0.1760000
		CoordinateSystem=1
		MaxParticles=1
		StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
	end object
	Emitters[3]=SpriteEmitter1
	// Reference: BeamEmitter'BallisticProV55.TraceEmitter_HVCRedLightning.BeamEmitter3'
	begin object name="BeamEmitter3" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=1000.0000000,Max=1000.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=0.0000000)
		DetermineEndPointBy=2
		BeamTextureUScale=2.0000000
		LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
		HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1428570,Color=(R=64,G=0,B=64,A=255))
		ColorScale[2]=(RelativeTime=0.2607140,Color=(R=255,G=224,B=192,A=255))
		ColorScale[3]=(RelativeTime=0.3821430,Color=(R=64,G=0,B=64,A=255))
		ColorScale[4]=(RelativeTime=0.4857140,Color=(R=255,G=192,B=128,A=255))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		FadeOutStartTime=0.3430000
		CoordinateSystem=1
		MaxParticles=1
		StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.LightningBolt2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7000000,Max=0.7000000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[4]=BeamEmitter3
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BallisticProV55.TraceEmitter_HVCRedLightning.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=1200.0000000,Max=1200.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=0.0000000)
	DetermineEndPointBy=2
	BeamTextureUScale=2.0000000
	LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-40.0000000,Max=40.0000000))
	HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	UseBranching=true
	BranchProbability=(Min=0.4000000,Max=0.4000000)
	BranchEmitter=1
	BranchSpawnAmountRange=(Min=1.0000000,Max=1.0000000)
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1428570,Color=(R=0,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[3]=(RelativeTime=0.4000000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[4]=(RelativeTime=0.5500000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	FadeOutStartTime=0.1600000
	CoordinateSystem=1
	MaxParticles=5
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.8000000)
	StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
	InitialParticlesPerSecond=40.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.LightningBolt2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: BeamEmitter'BallisticProV55.TraceEmitter_HVCRedLightning.BeamEmitter1'
begin object name="BeamEmitter1" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=100.0000000,Max=500.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
	HighFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	NoiseDeterminesEndPoint=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1357140,Color=(R=64,G=0,B=64,A=255))
	ColorScale[2]=(RelativeTime=0.2607140,Color=(R=255,G=192,B=64,A=255))
	ColorScale[3]=(RelativeTime=0.3857140,Color=(R=64,G=0,B=64,A=255))
	ColorScale[4]=(RelativeTime=0.5321430,Color=(R=255,G=128,B=0,A=255))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	FadeOutStartTime=0.1760000
	CoordinateSystem=1
	MaxParticles=30
	DetailMode=2
	StartSizeRange=(X=(Min=5.0000000,Max=12.0000000),Y=(Min=5.0000000,Max=12.0000000),Z=(Min=5.0000000,Max=12.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.LightningBoltCut2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
	StartVelocityRange=(X=(Min=0.5000000,Max=1.0100000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.TraceEmitter_HVCRedLightning.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2500000,Color=(R=255,G=64,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	FadeOutStartTime=0.0640000
	CoordinateSystem=1
	MaxParticles=20
	DetailMode=2
	StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
	StartSpinRange=(X=(Min=0.2600000,Max=0.2600000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=30.0000000,Max=50.5000000),Y=(Min=30.0000000,Max=50.5000000),Z=(Min=30.0000000,Max=50.5000000))
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'EpicParticles.Beams.BeamFalloff'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	StartVelocityRange=(X=(Min=150.0000000,Max=3000.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.TraceEmitter_HVCRedLightning.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.1285710,Color=(R=255,G=128,B=64,A=255))
	ColorScale[2]=(RelativeTime=0.2500000,Color=(R=255,G=192,B=192,A=255))
	ColorScale[3]=(RelativeTime=0.4142860,Color=(R=64,G=32,B=64,A=255))
	ColorScale[4]=(RelativeTime=0.5607140,Color=(R=255,G=192,B=192,A=255))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	FadeOutStartTime=0.1760000
	CoordinateSystem=1
	MaxParticles=1
	StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
end object
// Reference: BeamEmitter'BallisticProV55.TraceEmitter_HVCRedLightning.BeamEmitter3'
begin object name="BeamEmitter3" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=1000.0000000,Max=1000.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=0.0000000)
	DetermineEndPointBy=2
	BeamTextureUScale=2.0000000
	LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
	HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1428570,Color=(R=64,G=0,B=64,A=255))
	ColorScale[2]=(RelativeTime=0.2607140,Color=(R=255,G=224,B=192,A=255))
	ColorScale[3]=(RelativeTime=0.3821430,Color=(R=64,G=0,B=64,A=255))
	ColorScale[4]=(RelativeTime=0.4857140,Color=(R=255,G=192,B=128,A=255))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	FadeOutStartTime=0.3430000
	CoordinateSystem=1
	MaxParticles=1
	StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.LightningBolt2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7000000,Max=0.7000000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
