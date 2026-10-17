class RSNova_FreeZap extends BallisticEmitter;

event PostBeginPlay()
{
	super.PostBeginPlay();
	SetTimer(0.1000000, true);
	//return;	
}

event Timer()
{
	local Vector End, X, Y, Z;

	GetAxes(Rotation, X, Y, Z);
	End = X * float(4);
	BeamEmitter(Emitters[1]).StartVelocityRange = VtoRV(End, End);
	BeamEmitter(Emitters[1]).StartVelocityRange.X.Min -= (float(2) * Abs(X.Z));
	BeamEmitter(Emitters[1]).StartVelocityRange.X.Max += (float(2) * Abs(X.Z));
	BeamEmitter(Emitters[1]).StartVelocityRange.Y.Min -= (float(2) * Abs(X.X));
	BeamEmitter(Emitters[1]).StartVelocityRange.Y.Max += (float(2) * Abs(X.X));
	BeamEmitter(Emitters[1]).StartVelocityRange.Z.Min -= (float(2) * (float(1) - Abs(X.Z)));
	BeamEmitter(Emitters[1]).StartVelocityRange.Z.Max += (float(2) * (float(1) - Abs(X.Z)));
	BeamEmitter(Emitters[3]).StartVelocityRange = BeamEmitter(Emitters[1]).StartVelocityRange;
	//return;	
}

defaultproperties
{
	// Reference: BeamEmitter'BallisticProV55.RSNova_FreeZap.BeamEmitter1'
	begin object name="BeamEmitter1" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=1000.0000000,Max=1000.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=-200.0000000,Max=100.0000000),Z=(Min=-200.0000000,Max=100.0000000)),Weight=0.0000000)
		DetermineEndPointBy=4
		BeamTextureUScale=4.0000000
		LowFrequencyNoiseRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
		HighFrequencyNoiseRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-15.0000000,Max=15.0000000))
		NoiseDeterminesEndPoint=true
		UseBranching=true
		BranchProbability=(Min=0.2000000,Max=0.5000000)
		BranchEmitter=1
		BranchSpawnAmountRange=(Min=1.0000000,Max=1.0000000)
		UseColorScale=true
		FadeOut=true
		UseSizeScale=true
		UseRegularSizeScale=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3035710,Color=(R=32,G=128,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=64,B=255,A=255))
		FadeOutStartTime=0.0540000
		MaxParticles=6
		StartLocationOffset=(X=4.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=25.0000000,Max=30.0000000),Y=(Min=25.0000000,Max=30.0000000),Z=(Min=25.0000000,Max=30.0000000))
		Texture=Texture'EpicParticles.Beams.HotBeam02aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		StartVelocityRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=BeamEmitter1
	// Reference: BeamEmitter'BallisticProV55.RSNova_FreeZap.BeamEmitter2'
	begin object name="BeamEmitter2" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=100.0000000,Max=300.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
		HighFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3178570,Color=(R=32,G=128,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=64,B=255,A=255))
		FadeOutStartTime=0.0720000
		FadeInEndTime=0.0340000
		StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		StartVelocityRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
	end object
	Emitters[1]=BeamEmitter2
	// Reference: BeamEmitter'BallisticProV55.RSNova_FreeZap.BeamEmitter3'
	begin object name="BeamEmitter3" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000)),Weight=0.0000000)
		DetermineEndPointBy=4
		BeamTextureUScale=4.0000000
		LowFrequencyNoiseRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
		HighFrequencyNoiseRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
		HighFrequencyPoints=8
		NoiseDeterminesEndPoint=true
		UseBranching=true
		BranchProbability=(Min=0.2000000,Max=0.6000000)
		BranchEmitter=3
		BranchSpawnAmountRange=(Min=1.0000000,Max=1.0000000)
		UseColorScale=true
		FadeOut=true
		UseSizeScale=true
		UseRegularSizeScale=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2500000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=0,A=255))
		FadeOutStartTime=0.0420000
		MaxParticles=4
		DetailMode=2
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=20.0000000),Y=(Min=15.0000000,Max=20.0000000),Z=(Min=15.0000000,Max=20.0000000))
		Texture=Texture'EpicParticles.Beams.HotBeam02aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[2]=BeamEmitter3
	// Reference: BeamEmitter'BallisticProV55.RSNova_FreeZap.BeamEmitter4'
	begin object name="BeamEmitter4" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=100.0000000,Max=300.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
		HighFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3178570,Color=(R=255,G=255,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=0,A=255))
		FadeOutStartTime=0.0420000
		FadeInEndTime=0.0040000
		StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
		Texture=Texture'EpicParticles.Beams.BeamFalloff'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		StartVelocityRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
	end object
	Emitters[3]=BeamEmitter4
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BallisticProV55.RSNova_FreeZap.BeamEmitter1'
begin object name="BeamEmitter1" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=1000.0000000,Max=1000.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=-200.0000000,Max=100.0000000),Z=(Min=-200.0000000,Max=100.0000000)),Weight=0.0000000)
	DetermineEndPointBy=4
	BeamTextureUScale=4.0000000
	LowFrequencyNoiseRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
	HighFrequencyNoiseRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-15.0000000,Max=15.0000000))
	NoiseDeterminesEndPoint=true
	UseBranching=true
	BranchProbability=(Min=0.2000000,Max=0.5000000)
	BranchEmitter=1
	BranchSpawnAmountRange=(Min=1.0000000,Max=1.0000000)
	UseColorScale=true
	FadeOut=true
	UseSizeScale=true
	UseRegularSizeScale=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3035710,Color=(R=32,G=128,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=64,B=255,A=255))
	FadeOutStartTime=0.0540000
	MaxParticles=6
	StartLocationOffset=(X=4.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=25.0000000,Max=30.0000000),Y=(Min=25.0000000,Max=30.0000000),Z=(Min=25.0000000,Max=30.0000000))
	Texture=Texture'EpicParticles.Beams.HotBeam02aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	StartVelocityRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: BeamEmitter'BallisticProV55.RSNova_FreeZap.BeamEmitter2'
begin object name="BeamEmitter2" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=100.0000000,Max=300.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	HighFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3178570,Color=(R=32,G=128,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=64,B=255,A=255))
	FadeOutStartTime=0.0720000
	FadeInEndTime=0.0340000
	StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	StartVelocityRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
end object
// Reference: BeamEmitter'BallisticProV55.RSNova_FreeZap.BeamEmitter3'
begin object name="BeamEmitter3" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000)),Weight=0.0000000)
	DetermineEndPointBy=4
	BeamTextureUScale=4.0000000
	LowFrequencyNoiseRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
	HighFrequencyNoiseRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
	HighFrequencyPoints=8
	NoiseDeterminesEndPoint=true
	UseBranching=true
	BranchProbability=(Min=0.2000000,Max=0.6000000)
	BranchEmitter=3
	BranchSpawnAmountRange=(Min=1.0000000,Max=1.0000000)
	UseColorScale=true
	FadeOut=true
	UseSizeScale=true
	UseRegularSizeScale=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2500000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=0,A=255))
	FadeOutStartTime=0.0420000
	MaxParticles=4
	DetailMode=2
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=20.0000000),Y=(Min=15.0000000,Max=20.0000000),Z=(Min=15.0000000,Max=20.0000000))
	Texture=Texture'EpicParticles.Beams.HotBeam02aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: BeamEmitter'BallisticProV55.RSNova_FreeZap.BeamEmitter4'
begin object name="BeamEmitter4" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=100.0000000,Max=300.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	HighFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3178570,Color=(R=255,G=255,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=0,A=255))
	FadeOutStartTime=0.0420000
	FadeInEndTime=0.0040000
	StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
	Texture=Texture'EpicParticles.Beams.BeamFalloff'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	StartVelocityRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
end object
