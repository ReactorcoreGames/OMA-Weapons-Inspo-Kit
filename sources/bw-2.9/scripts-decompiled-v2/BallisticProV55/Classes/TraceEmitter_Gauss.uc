class TraceEmitter_Gauss extends BCTraceEmitter;

simulated function Initialize(float Distance, optional float Power)
{
	BeamEmitter(Emitters[0]).BeamEndPoints[0].offset.X.Min = Distance;
	BeamEmitter(Emitters[0]).BeamEndPoints[0].offset.X.Max = Distance;
	BeamEmitter(Emitters[3]).BeamEndPoints[0].offset.X = BeamEmitter(Emitters[0]).BeamEndPoints[0].offset.X;
	Emitters[7].StartLocationRange.X.Max = FMin(2000.0000000, Distance);
	Emitters[7].SpawnOnTriggerRange.Min = FMin(120.0000000, Distance * 0.0600000);
	Emitters[7].SpawnOnTriggerRange.Max = Emitters[3].SpawnOnTriggerRange.Min;
	BeamEmitter(Emitters[4]).BeamDistanceRange.Min = FMax(0.0000000, Distance - float(100));
	BeamEmitter(Emitters[4]).BeamDistanceRange.Max = FMax(0.0000000, Distance - float(100));
	BeamEmitter(Emitters[6]).BeamDistanceRange.Min = Distance;
	BeamEmitter(Emitters[6]).BeamDistanceRange.Max = Distance;
	BeamEmitter(Emitters[8]).BeamDistanceRange.Max = Distance;
	//return;	
}

defaultproperties
{
	// Reference: BeamEmitter'BallisticProV55.TraceEmitter_Gauss.BeamEmitter0'
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
		ColorScale[1]=(RelativeTime=0.1357140,Color=(R=0,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[3]=(RelativeTime=0.4000000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[4]=(RelativeTime=0.5500000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.1600000
		FadeOutStartTime=0.0480000
		CoordinateSystem=1
		MaxParticles=5
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.8000000)
		StartSizeRange=(X=(Min=1.0000000,Max=5.0000000),Y=(Min=1.0000000,Max=5.0000000),Z=(Min=1.0000000,Max=5.0000000))
		InitialParticlesPerSecond=80.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt03aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=BeamEmitter0
	// Reference: BeamEmitter'BallisticProV55.TraceEmitter_Gauss.BeamEmitter1'
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
		ColorScale[1]=(RelativeTime=0.1285710,Color=(R=0,G=0,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.2571430,Color=(R=255,G=255,B=0,A=255))
		ColorScale[3]=(RelativeTime=0.3821430,Color=(R=255,G=255,B=255,A=255))
		ColorScale[4]=(RelativeTime=0.5321430,Color=(R=0,G=255,B=0,A=255))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.3800000
		FadeOutStartTime=0.0260000
		CoordinateSystem=1
		MaxParticles=30
		DetailMode=2
		StartSizeRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.LightningBoltCut2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		StartVelocityRange=(X=(Min=0.5000000,Max=1.0100000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
	end object
	Emitters[1]=BeamEmitter1
	// Reference: SpriteEmitter'BallisticProV55.TraceEmitter_Gauss.SpriteEmitter0'
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
		FadeOutStartTime=0.0640000
		CoordinateSystem=1
		MaxParticles=5
		DetailMode=2
		StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
		StartSpinRange=(X=(Min=0.2600000,Max=0.2600000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=3.0000000,Max=10.5000000),Y=(Min=3.0000000,Max=10.5000000),Z=(Min=3.0000000,Max=10.5000000))
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'EpicParticles.Beams.BeamFalloff'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		StartVelocityRange=(X=(Min=150.0000000,Max=3000.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
	end object
	Emitters[2]=SpriteEmitter0
	// Reference: BeamEmitter'BallisticProV55.TraceEmitter_Gauss.BeamEmitter3'
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
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3821430,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=128,A=255))
		FadeOutStartTime=0.0430000
		CoordinateSystem=1
		MaxParticles=1
		StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt03aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[3]=BeamEmitter3
	// Reference: BeamEmitter'BallisticProV55.TraceEmitter_Gauss.BeamEmitter41'
	begin object name="BeamEmitter41" class=Engine.BeamEmitter
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
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[4]=BeamEmitter41
	// Reference: SpriteEmitter'BallisticProV55.TraceEmitter_Gauss.SpriteEmitter40'
	begin object name="SpriteEmitter40" class=Engine.SpriteEmitter
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
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[5]=SpriteEmitter40
	// Reference: BeamEmitter'BallisticProV55.TraceEmitter_Gauss.BeamEmitter53'
	begin object name="BeamEmitter53" class=Engine.BeamEmitter
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
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[6]=BeamEmitter53
	// Reference: SpriteEmitter'BallisticProV55.TraceEmitter_Gauss.SpriteEmitter71'
	begin object name="SpriteEmitter71" class=Engine.SpriteEmitter
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
		MaxParticles=120
		StartLocationRange=(X=(Min=0.0000000,Max=1000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=3.0000000,Max=6.0000000),Y=(Min=3.0000000,Max=6.0000000),Z=(Min=3.0000000,Max=6.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		SpawnOnTriggerRange=(Min=100.0000000,Max=100.0000000)
		SpawnOnTriggerPPS=99999.0000000
		StartVelocityRange=(X=(Min=0.0000000,Max=100.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	end object
	Emitters[7]=SpriteEmitter71
	// Reference: BeamEmitter'BallisticProV55.TraceEmitter_Gauss.BeamEmitter84'
	begin object name="BeamEmitter84" class=Engine.BeamEmitter
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
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[8]=BeamEmitter84
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BallisticProV55.TraceEmitter_Gauss.BeamEmitter0'
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
	ColorScale[1]=(RelativeTime=0.1357140,Color=(R=0,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[3]=(RelativeTime=0.4000000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[4]=(RelativeTime=0.5500000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.1600000
	FadeOutStartTime=0.0480000
	CoordinateSystem=1
	MaxParticles=5
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.8000000)
	StartSizeRange=(X=(Min=1.0000000,Max=5.0000000),Y=(Min=1.0000000,Max=5.0000000),Z=(Min=1.0000000,Max=5.0000000))
	InitialParticlesPerSecond=80.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt03aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: BeamEmitter'BallisticProV55.TraceEmitter_Gauss.BeamEmitter1'
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
	ColorScale[1]=(RelativeTime=0.1285710,Color=(R=0,G=0,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.2571430,Color=(R=255,G=255,B=0,A=255))
	ColorScale[3]=(RelativeTime=0.3821430,Color=(R=255,G=255,B=255,A=255))
	ColorScale[4]=(RelativeTime=0.5321430,Color=(R=0,G=255,B=0,A=255))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.3800000
	FadeOutStartTime=0.0260000
	CoordinateSystem=1
	MaxParticles=30
	DetailMode=2
	StartSizeRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.LightningBoltCut2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	StartVelocityRange=(X=(Min=0.5000000,Max=1.0100000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.TraceEmitter_Gauss.SpriteEmitter0'
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
	FadeOutStartTime=0.0640000
	CoordinateSystem=1
	MaxParticles=5
	DetailMode=2
	StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
	StartSpinRange=(X=(Min=0.2600000,Max=0.2600000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=3.0000000,Max=10.5000000),Y=(Min=3.0000000,Max=10.5000000),Z=(Min=3.0000000,Max=10.5000000))
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'EpicParticles.Beams.BeamFalloff'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	StartVelocityRange=(X=(Min=150.0000000,Max=3000.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
end object
// Reference: BeamEmitter'BallisticProV55.TraceEmitter_Gauss.BeamEmitter3'
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
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3821430,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=128,A=255))
	FadeOutStartTime=0.0430000
	CoordinateSystem=1
	MaxParticles=1
	StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt03aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: BeamEmitter'BallisticProV55.TraceEmitter_Gauss.BeamEmitter41'
begin object name="BeamEmitter41" class=Engine.BeamEmitter
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
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.TraceEmitter_Gauss.SpriteEmitter40'
begin object name="SpriteEmitter40" class=Engine.SpriteEmitter
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
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: BeamEmitter'BallisticProV55.TraceEmitter_Gauss.BeamEmitter53'
begin object name="BeamEmitter53" class=Engine.BeamEmitter
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
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.TraceEmitter_Gauss.SpriteEmitter71'
begin object name="SpriteEmitter71" class=Engine.SpriteEmitter
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
	MaxParticles=120
	StartLocationRange=(X=(Min=0.0000000,Max=1000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=3.0000000,Max=6.0000000),Y=(Min=3.0000000,Max=6.0000000),Z=(Min=3.0000000,Max=6.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	SpawnOnTriggerRange=(Min=100.0000000,Max=100.0000000)
	SpawnOnTriggerPPS=99999.0000000
	StartVelocityRange=(X=(Min=0.0000000,Max=100.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
end object
// Reference: BeamEmitter'BallisticProV55.TraceEmitter_Gauss.BeamEmitter84'
begin object name="BeamEmitter84" class=Engine.BeamEmitter
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
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
