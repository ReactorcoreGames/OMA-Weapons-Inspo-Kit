class TraceEmitter_ShotgunHE extends BCTraceEmitter;

simulated function Initialize(float Distance, optional float Power)
{
	//return;	
}

defaultproperties
{
	// Reference: SparkEmitter'BWBP_OP_Pro.TraceEmitter_ShotgunHE.SparkEmitter6'
	begin object name="SparkEmitter6" class=Engine.SparkEmitter
		LineSegmentsRange=(Min=1.0000000,Max=1.0000000)
		TimeBetweenSegmentsRange=(Min=0.0100000,Max=0.0500000)
		UseCollision=true
		UseMaxCollisions=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=128,A=255))
		ColorScale[1]=(RelativeTime=0.1071430,Color=(R=255,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
		FadeOutStartTime=0.1100000
		CoordinateSystem=1
		MaxParticles=12
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=100.0000000,Max=4000.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=200.0000000))
	end object
	Emitters[0]=SparkEmitter6
	// Reference: MeshEmitter'BWBP_OP_Pro.TraceEmitter_ShotgunHE.MeshEmitter15'
	begin object name="MeshEmitter15" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.VBlast'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.2000000,Max=0.3000000),Z=(Min=0.2000000,Max=0.5000000))
		Opacity=0.3200000
		FadeOutStartTime=0.0450000
		FadeInEndTime=0.0100000
		CoordinateSystem=1
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-0.2500000,Max=-0.2500000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.5600000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=0.5000000,Max=1.2000000),Y=(Min=0.5000000,Max=1.2000000),Z=(Min=2.0000000,Max=8.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=100.0000000,Max=300.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=MeshEmitter15
	// Reference: SpriteEmitter'BWBP_OP_Pro.TraceEmitter_ShotgunHE.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UniformSize=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.6000000
		FadeOutStartTime=0.0500000
		FadeInEndTime=0.0040000
		MaxParticles=2
		StartLocationRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.SmokeWisp-Alpha'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[2]=SpriteEmitter3
	// Reference: BeamEmitter'BWBP_OP_Pro.TraceEmitter_ShotgunHE.BeamEmitter3'
	begin object name="BeamEmitter3" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=100.0000000,Max=100.0000000)
		DetermineEndPointBy=1
		HighFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		HighFrequencyPoints=5
		UseBranching=true
		BranchProbability=(Min=1.0000000,Max=1.0000000)
		BranchEmitter=0
		BranchSpawnAmountRange=(Min=4.0000000,Max=4.0000000)
		FadeOut=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.2000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.1400000
		FadeOutStartTime=0.1106000
		CoordinateSystem=1
		MaxParticles=8
		StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=5.0000000,Max=5.0000000),Z=(Min=5.0000000,Max=5.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.WaterSpray1Alpha'
		LifetimeRange=(Min=0.2690000,Max=0.2690000)
		StartVelocityRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	end object
	Emitters[3]=BeamEmitter3
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SparkEmitter'BWBP_OP_Pro.TraceEmitter_ShotgunHE.SparkEmitter6'
begin object name="SparkEmitter6" class=Engine.SparkEmitter
	LineSegmentsRange=(Min=1.0000000,Max=1.0000000)
	TimeBetweenSegmentsRange=(Min=0.0100000,Max=0.0500000)
	UseCollision=true
	UseMaxCollisions=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=128,A=255))
	ColorScale[1]=(RelativeTime=0.1071430,Color=(R=255,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
	FadeOutStartTime=0.1100000
	CoordinateSystem=1
	MaxParticles=12
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=100.0000000,Max=4000.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=200.0000000))
end object
// Reference: MeshEmitter'BWBP_OP_Pro.TraceEmitter_ShotgunHE.MeshEmitter15'
begin object name="MeshEmitter15" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.VBlast'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.2000000,Max=0.3000000),Z=(Min=0.2000000,Max=0.5000000))
	Opacity=0.3200000
	FadeOutStartTime=0.0450000
	FadeInEndTime=0.0100000
	CoordinateSystem=1
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-0.2500000,Max=-0.2500000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.5600000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=0.5000000,Max=1.2000000),Y=(Min=0.5000000,Max=1.2000000),Z=(Min=2.0000000,Max=8.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=100.0000000,Max=300.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.TraceEmitter_ShotgunHE.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UniformSize=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.6000000
	FadeOutStartTime=0.0500000
	FadeInEndTime=0.0040000
	MaxParticles=2
	StartLocationRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.SmokeWisp-Alpha'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
// Reference: BeamEmitter'BWBP_OP_Pro.TraceEmitter_ShotgunHE.BeamEmitter3'
begin object name="BeamEmitter3" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=100.0000000,Max=100.0000000)
	DetermineEndPointBy=1
	HighFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	HighFrequencyPoints=5
	UseBranching=true
	BranchProbability=(Min=1.0000000,Max=1.0000000)
	BranchEmitter=0
	BranchSpawnAmountRange=(Min=4.0000000,Max=4.0000000)
	FadeOut=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.2000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.1400000
	FadeOutStartTime=0.1106000
	CoordinateSystem=1
	MaxParticles=8
	StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=5.0000000,Max=5.0000000),Z=(Min=5.0000000,Max=5.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.WaterSpray1Alpha'
	LifetimeRange=(Min=0.2690000,Max=0.2690000)
	StartVelocityRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
end object
