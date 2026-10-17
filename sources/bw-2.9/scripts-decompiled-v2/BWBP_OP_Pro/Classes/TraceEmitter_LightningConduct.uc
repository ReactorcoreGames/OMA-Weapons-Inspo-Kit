class TraceEmitter_LightningConduct extends BCTraceEmitter;

simulated function Initialize(float Distance, optional float Power)
{
	BeamEmitter(Emitters[0]).BeamEndPoints[0].offset.X.Min = Distance;
	BeamEmitter(Emitters[0]).BeamEndPoints[0].offset.X.Max = Distance;
	BeamEmitter(Emitters[3]).BeamEndPoints[0].offset.X = BeamEmitter(Emitters[0]).BeamEndPoints[0].offset.X;
	BeamEmitter(Emitters[0]).BeamDistanceRange.Min = FMax(0.0000000, Distance - float(100));
	BeamEmitter(Emitters[0]).BeamDistanceRange.Max = FMax(0.0000000, Distance - float(100));
	BeamEmitter(Emitters[3]).BeamDistanceRange.Min = Distance;
	BeamEmitter(Emitters[3]).BeamDistanceRange.Max = Distance;
	//return;	
}

defaultproperties
{
	// Reference: BeamEmitter'BWBP_OP_Pro.TraceEmitter_LightningConduct.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=0.0000000,Max=65536.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=65536.0000000,Max=65536.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=0.0000000)
		DetermineEndPointBy=2
		BeamTextureUScale=2.0000000
		LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
		UseBranching=true
		BranchProbability=(Min=0.8000000,Max=0.8000000)
		BranchEmitter=1
		BranchSpawnAmountRange=(Min=1.0000000,Max=1.0000000)
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1357140,Color=(R=0,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[3]=(RelativeTime=0.4000000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[4]=(RelativeTime=0.5500000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.1600000
		FadeOutStartTime=0.4480000
		CoordinateSystem=1
		MaxParticles=15
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.5000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=2.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.6000000)
		StartSizeRange=(X=(Min=3.0000000,Max=6.0000000),Y=(Min=3.0000000,Max=6.0000000),Z=(Min=3.0000000,Max=6.0000000))
		InitialParticlesPerSecond=80.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt03aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=BeamEmitter0
	// Reference: BeamEmitter'BWBP_OP_Pro.TraceEmitter_LightningConduct.BeamEmitter1'
	begin object name="BeamEmitter1" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=0.0000000,Max=500.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		HighFrequencyNoiseRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
		NoiseDeterminesEndPoint=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1285710,Color=(R=0,G=0,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.2571430,Color=(R=255,G=255,B=0,A=255))
		ColorScale[3]=(RelativeTime=0.3821430,Color=(R=255,G=255,B=255,A=255))
		ColorScale[4]=(RelativeTime=0.5321430,Color=(R=0,G=255,B=0,A=255))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.5800000
		FadeOutStartTime=0.4260000
		CoordinateSystem=1
		MaxParticles=50
		DetailMode=2
		StartSizeRange=(X=(Min=0.3000000,Max=3.0000000),Y=(Min=0.3000000,Max=3.0000000),Z=(Min=0.3000000,Max=3.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		StartVelocityRange=(X=(Min=0.5000000,Max=1.0100000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
	end object
	Emitters[1]=BeamEmitter1
	// Reference: SpriteEmitter'BWBP_OP_Pro.TraceEmitter_LightningConduct.SpriteEmitter0'
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
		ColorScale[1]=(RelativeTime=0.2500000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.5785710,Color=(R=255,G=255,B=255,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.4640000
		CoordinateSystem=1
		MaxParticles=20
		DetailMode=2
		StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=1.0000000,Max=5.5000000),Y=(Min=1.0000000,Max=5.5000000),Z=(Min=1.0000000,Max=5.5000000))
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'EpicParticles.Beams.BeamFalloff'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		StartVelocityRange=(X=(Min=150.0000000,Max=3000.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
	end object
	Emitters[2]=SpriteEmitter0
	// Reference: BeamEmitter'BWBP_OP_Pro.TraceEmitter_LightningConduct.BeamEmitter3'
	begin object name="BeamEmitter3" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=1000.0000000,Max=1000.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=0.0000000)
		DetermineEndPointBy=2
		BeamTextureUScale=2.0000000
		LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3821430,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=128,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.4430000
		CoordinateSystem=1
		MaxParticles=20
		StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt03aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[3]=BeamEmitter3
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BWBP_OP_Pro.TraceEmitter_LightningConduct.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=0.0000000,Max=65536.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=65536.0000000,Max=65536.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=0.0000000)
	DetermineEndPointBy=2
	BeamTextureUScale=2.0000000
	LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
	UseBranching=true
	BranchProbability=(Min=0.8000000,Max=0.8000000)
	BranchEmitter=1
	BranchSpawnAmountRange=(Min=1.0000000,Max=1.0000000)
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1357140,Color=(R=0,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[3]=(RelativeTime=0.4000000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[4]=(RelativeTime=0.5500000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.1600000
	FadeOutStartTime=0.4480000
	CoordinateSystem=1
	MaxParticles=15
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.5000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=2.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.6000000)
	StartSizeRange=(X=(Min=3.0000000,Max=6.0000000),Y=(Min=3.0000000,Max=6.0000000),Z=(Min=3.0000000,Max=6.0000000))
	InitialParticlesPerSecond=80.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt03aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: BeamEmitter'BWBP_OP_Pro.TraceEmitter_LightningConduct.BeamEmitter1'
begin object name="BeamEmitter1" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=0.0000000,Max=500.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	HighFrequencyNoiseRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
	NoiseDeterminesEndPoint=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1285710,Color=(R=0,G=0,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.2571430,Color=(R=255,G=255,B=0,A=255))
	ColorScale[3]=(RelativeTime=0.3821430,Color=(R=255,G=255,B=255,A=255))
	ColorScale[4]=(RelativeTime=0.5321430,Color=(R=0,G=255,B=0,A=255))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.5800000
	FadeOutStartTime=0.4260000
	CoordinateSystem=1
	MaxParticles=50
	DetailMode=2
	StartSizeRange=(X=(Min=0.3000000,Max=3.0000000),Y=(Min=0.3000000,Max=3.0000000),Z=(Min=0.3000000,Max=3.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	StartVelocityRange=(X=(Min=0.5000000,Max=1.0100000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.TraceEmitter_LightningConduct.SpriteEmitter0'
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
	ColorScale[1]=(RelativeTime=0.2500000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.5785710,Color=(R=255,G=255,B=255,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.4640000
	CoordinateSystem=1
	MaxParticles=20
	DetailMode=2
	StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=1.0000000,Max=5.5000000),Y=(Min=1.0000000,Max=5.5000000),Z=(Min=1.0000000,Max=5.5000000))
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'EpicParticles.Beams.BeamFalloff'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	StartVelocityRange=(X=(Min=150.0000000,Max=3000.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
end object
// Reference: BeamEmitter'BWBP_OP_Pro.TraceEmitter_LightningConduct.BeamEmitter3'
begin object name="BeamEmitter3" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=1000.0000000,Max=1000.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=0.0000000)
	DetermineEndPointBy=2
	BeamTextureUScale=2.0000000
	LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3821430,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=128,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.4430000
	CoordinateSystem=1
	MaxParticles=20
	StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt03aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
