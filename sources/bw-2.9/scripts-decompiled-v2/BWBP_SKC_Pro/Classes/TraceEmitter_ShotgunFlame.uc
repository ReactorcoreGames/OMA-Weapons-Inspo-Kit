class TraceEmitter_ShotgunFlame extends BCTraceEmitter;

simulated function Initialize(float Distance, optional float Power)
{
	//return;	
}

simulated event PostBeginPlay()
{
	super(BallisticEmitter).PostBeginPlay();
	// End:0x29
	if(WeaponAttachment(Owner) != none)
	{
		Emitters[1].ZTest = true;
	}
	//return;	
}

defaultproperties
{
	// Reference: SparkEmitter'BWBP_SKC_Pro.TraceEmitter_ShotgunFlame.SparkEmitter0'
	begin object name="SparkEmitter0" class=Engine.SparkEmitter
		LineSegmentsRange=(Min=1.0000000,Max=1.0000000)
		TimeBetweenSegmentsRange=(Min=0.1000000,Max=0.1000000)
		UseCollision=true
		UseMaxCollisions=true
		FadeOut=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
		MaxCollisions=(Min=1.0000000,Max=2.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.5107140,Color=(R=255,G=200,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=0,A=255))
		FadeOutStartTime=0.1100000
		CoordinateSystem=1
		MaxParticles=100
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=100.0000000,Max=4000.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=200.0000000))
	end object
	Emitters[0]=SparkEmitter0
	// Reference: MeshEmitter'BWBP_SKC_Pro.TraceEmitter_ShotgunFlame.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
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
		Opacity=0.3200000
		FadeOutStartTime=0.0450000
		FadeInEndTime=0.0100000
		CoordinateSystem=1
		MaxParticles=5
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
	Emitters[1]=MeshEmitter0
	// Reference: SpriteEmitter'BWBP_SKC_Pro.TraceEmitter_ShotgunFlame.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
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
	Emitters[2]=SpriteEmitter2
	// Reference: BeamEmitter'BWBP_SKC_Pro.TraceEmitter_ShotgunFlame.BeamEmitter8'
	begin object name="BeamEmitter8" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=600.0000000,Max=900.0000000)
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
		Opacity=0.5000000
		FadeOutStartTime=0.1106000
		CoordinateSystem=1
		MaxParticles=15
		StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.WaterSpray1Alpha'
		LifetimeRange=(Min=0.2690000,Max=0.2690000)
		StartVelocityRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	end object
	Emitters[3]=BeamEmitter8
	// Reference: SpriteEmitter'BWBP_SKC_Pro.TraceEmitter_ShotgunFlame.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		UseCollision=true
		UseMaxCollisions=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-75.0000000)
		ExtentMultiplier=(X=0.1000000,Y=0.1000000,Z=0.1000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.4884000
		FadeInEndTime=0.0660000
		CoordinateSystem=1
		MaxParticles=45
		DetailMode=2
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.6100000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.8000000)
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
		InitialParticlesPerSecond=400.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.6600000,Max=0.6600000)
		StartVelocityRange=(X=(Min=2250.0000000,Max=2700.0000000),Y=(Min=-120.0000000,Max=120.0000000),Z=(Min=-65.0000000,Max=120.0000000))
	end object
	Emitters[4]=SpriteEmitter9
	// Reference: SpriteEmitter'BWBP_SKC_Pro.TraceEmitter_ShotgunFlame.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		UseCollision=true
		UseMaxCollisions=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=128,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2892860,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.2000000,Max=1.0000000),Z=(Min=0.2000000,Max=0.4000000))
		Opacity=0.7700000
		FadeOutStartTime=0.3720000
		FadeInEndTime=0.1440000
		CoordinateSystem=1
		MaxParticles=25
		DetailMode=2
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.5500000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=100.0000000,Max=140.0000000),Y=(Min=100.0000000,Max=140.0000000),Z=(Min=100.0000000,Max=140.0000000))
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
		StartVelocityRange=(X=(Min=2700.0000000,Max=3300.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	end object
	Emitters[5]=SpriteEmitter10
	// Reference: SpriteEmitter'BWBP_SKC_Pro.TraceEmitter_ShotgunFlame.SpriteEmitter12'
	begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
		UseCollision=true
		UseMaxCollisions=true
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		ExtentMultiplier=(X=0.1000000,Y=0.1000000,Z=0.1000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3428570,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
		Opacity=0.4000000
		FadeOutStartTime=0.4200000
		FadeInEndTime=0.1080000
		CoordinateSystem=1
		DetailMode=1
		SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=0.8700000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=60.0000000,Max=80.0000000),Y=(Min=60.0000000,Max=80.0000000),Z=(Min=60.0000000,Max=80.0000000))
		InitialParticlesPerSecond=100.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
		StartVelocityRange=(X=(Min=2700.0000000,Max=3000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[6]=SpriteEmitter12
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SparkEmitter'BWBP_SKC_Pro.TraceEmitter_ShotgunFlame.SparkEmitter0'
begin object name="SparkEmitter0" class=Engine.SparkEmitter
	LineSegmentsRange=(Min=1.0000000,Max=1.0000000)
	TimeBetweenSegmentsRange=(Min=0.1000000,Max=0.1000000)
	UseCollision=true
	UseMaxCollisions=true
	FadeOut=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
	MaxCollisions=(Min=1.0000000,Max=2.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.5107140,Color=(R=255,G=200,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=0,A=255))
	FadeOutStartTime=0.1100000
	CoordinateSystem=1
	MaxParticles=100
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=100.0000000,Max=4000.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=200.0000000))
end object
// Reference: MeshEmitter'BWBP_SKC_Pro.TraceEmitter_ShotgunFlame.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
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
	Opacity=0.3200000
	FadeOutStartTime=0.0450000
	FadeInEndTime=0.0100000
	CoordinateSystem=1
	MaxParticles=5
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
// Reference: SpriteEmitter'BWBP_SKC_Pro.TraceEmitter_ShotgunFlame.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
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
// Reference: BeamEmitter'BWBP_SKC_Pro.TraceEmitter_ShotgunFlame.BeamEmitter8'
begin object name="BeamEmitter8" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=600.0000000,Max=900.0000000)
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
	Opacity=0.5000000
	FadeOutStartTime=0.1106000
	CoordinateSystem=1
	MaxParticles=15
	StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.WaterSpray1Alpha'
	LifetimeRange=(Min=0.2690000,Max=0.2690000)
	StartVelocityRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.TraceEmitter_ShotgunFlame.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	UseCollision=true
	UseMaxCollisions=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-75.0000000)
	ExtentMultiplier=(X=0.1000000,Y=0.1000000,Z=0.1000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.4884000
	FadeInEndTime=0.0660000
	CoordinateSystem=1
	MaxParticles=45
	DetailMode=2
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.6100000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.8000000)
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
	InitialParticlesPerSecond=400.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.6600000,Max=0.6600000)
	StartVelocityRange=(X=(Min=2250.0000000,Max=2700.0000000),Y=(Min=-120.0000000,Max=120.0000000),Z=(Min=-65.0000000,Max=120.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.TraceEmitter_ShotgunFlame.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	UseCollision=true
	UseMaxCollisions=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=128,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2892860,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.2000000,Max=1.0000000),Z=(Min=0.2000000,Max=0.4000000))
	Opacity=0.7700000
	FadeOutStartTime=0.3720000
	FadeInEndTime=0.1440000
	CoordinateSystem=1
	MaxParticles=25
	DetailMode=2
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.5500000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=100.0000000,Max=140.0000000),Y=(Min=100.0000000,Max=140.0000000),Z=(Min=100.0000000,Max=140.0000000))
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
	StartVelocityRange=(X=(Min=2700.0000000,Max=3300.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.TraceEmitter_ShotgunFlame.SpriteEmitter12'
begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
	UseCollision=true
	UseMaxCollisions=true
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	ExtentMultiplier=(X=0.1000000,Y=0.1000000,Z=0.1000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3428570,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
	Opacity=0.4000000
	FadeOutStartTime=0.4200000
	FadeInEndTime=0.1080000
	CoordinateSystem=1
	DetailMode=1
	SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=0.8700000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=60.0000000,Max=80.0000000),Y=(Min=60.0000000,Max=80.0000000),Z=(Min=60.0000000,Max=80.0000000))
	InitialParticlesPerSecond=100.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
	StartVelocityRange=(X=(Min=2700.0000000,Max=3000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
