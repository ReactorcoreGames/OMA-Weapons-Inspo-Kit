class ONSTurretBeamEffect extends Emitter;

simulated function SpawnEffects(Vector HitLocation, Vector HitNormal)
{
	local Rotator HitRotation;
	local PlayerController PC;
	local bool bFogDist;

	HitRotation = Rotator(HitNormal);
	PC = Level.GetLocalPlayerController();
	// End:0x7D
	if(!PC.BeyondViewDistance(HitLocation, 0.0000000))
	{
		bFogDist = true;
		Spawn(Class'XEffects.ShockImpactFlareB',,, HitLocation, HitRotation);
		Spawn(Class'XEffects.ShockExplosionCoreB',,, HitLocation + (HitNormal * float(8)), HitRotation);
	}
	// End:0xFB
	if((PC.ViewTarget == none) || VSize(PC.ViewTarget.Location - Location) > float(4000))
	{
		Emitters[2].Disabled = true;
		Emitters[3].Disabled = true;
		Emitters[4].Disabled = true;
	}
	// End:0x150
	if(bFogDist && !PC.BeyondViewDistance(HitLocation, 4000.0000000))
	{
		Spawn(Class'XEffects.ShockImpactRingB',,, HitLocation, HitRotation);
		Spawn(Class'XEffects.ShockImpactScorch',,, HitLocation, Rotator(-HitNormal));
	}
	//return;	
}

defaultproperties
{
	// Reference: BeamEmitter'Onslaught.ONSTurretBeamEffect.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=512.0000000,Max=512.0000000)
		DetermineEndPointBy=1
		RotatingSheets=3
		LowFrequencyPoints=2
		HighFrequencyPoints=2
		BranchProbability=(Min=0.0000000,Max=1.0000000)
		BranchSpawnAmountRange=(Min=0.0000000,Max=2.0000000)
		UseColorScale=true
		RespawnDeadParticles=false
		AlphaTest=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=32,B=32,A=0))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=255,G=128,B=128,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=1
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'TurretParticles.Beams.TurretBeam5'
		LifetimeRange=(Min=0.1500000,Max=0.1500000)
		StartVelocityRange=(X=(Min=500.0000000,Max=500.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=BeamEmitter0
	// Reference: BeamEmitter'Onslaught.ONSTurretBeamEffect.BeamEmitter1'
	begin object name="BeamEmitter1" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=512.0000000,Max=512.0000000)
		DetermineEndPointBy=1
		RotatingSheets=3
		LowFrequencyPoints=2
		HighFrequencyPoints=2
		BranchProbability=(Min=0.0000000,Max=1.0000000)
		BranchSpawnAmountRange=(Min=0.0000000,Max=2.0000000)
		UseColorScale=true
		RespawnDeadParticles=false
		AlphaTest=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=64,B=64,A=0))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=255,G=0,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.8000000
		MaxParticles=1
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=100.0000000,Max=100.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Flares.SoftFlare'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=500.0000000,Max=500.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=BeamEmitter1
	// Reference: SpriteEmitter'Onslaught.ONSTurretBeamEffect.SpriteEmitter17'
	begin object name="SpriteEmitter17" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=128,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=64,A=0))
		MaxParticles=2
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=150.0000000,Max=200.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=20.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar2'
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[2]=SpriteEmitter17
	// Reference: SpriteEmitter'Onslaught.ONSTurretBeamEffect.SpriteEmitter19'
	begin object name="SpriteEmitter19" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=128,A=0))
		ColorScale[1]=(RelativeTime=0.6500000,Color=(R=132,G=23,B=0,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=8
		StartLocationOffset=(X=16.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=64.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=2.0000000))
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=0.0250000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=900.0000000
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=15.0000000))
		WarmupTicksPerSecond=1.0000000
		RelativeWarmupTime=0.2000000
	end object
	Emitters[3]=SpriteEmitter19
	// Reference: SpriteEmitter'Onslaught.ONSTurretBeamEffect.SpriteEmitter20'
	begin object name="SpriteEmitter20" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=32,B=32,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=32,B=32,A=0))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=255,G=64,B=64,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=3
		StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=3000.0000000
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[4]=SpriteEmitter20
	AutoDestroy=true
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'Onslaught.ONSTurretBeamEffect.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=512.0000000,Max=512.0000000)
	DetermineEndPointBy=1
	RotatingSheets=3
	LowFrequencyPoints=2
	HighFrequencyPoints=2
	BranchProbability=(Min=0.0000000,Max=1.0000000)
	BranchSpawnAmountRange=(Min=0.0000000,Max=2.0000000)
	UseColorScale=true
	RespawnDeadParticles=false
	AlphaTest=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=32,B=32,A=0))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=255,G=128,B=128,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=1
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'TurretParticles.Beams.TurretBeam5'
	LifetimeRange=(Min=0.1500000,Max=0.1500000)
	StartVelocityRange=(X=(Min=500.0000000,Max=500.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: BeamEmitter'Onslaught.ONSTurretBeamEffect.BeamEmitter1'
begin object name="BeamEmitter1" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=512.0000000,Max=512.0000000)
	DetermineEndPointBy=1
	RotatingSheets=3
	LowFrequencyPoints=2
	HighFrequencyPoints=2
	BranchProbability=(Min=0.0000000,Max=1.0000000)
	BranchSpawnAmountRange=(Min=0.0000000,Max=2.0000000)
	UseColorScale=true
	RespawnDeadParticles=false
	AlphaTest=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=64,B=64,A=0))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=255,G=0,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.8000000
	MaxParticles=1
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=100.0000000,Max=100.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Flares.SoftFlare'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=500.0000000,Max=500.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSTurretBeamEffect.SpriteEmitter17'
begin object name="SpriteEmitter17" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=128,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=64,A=0))
	MaxParticles=2
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=150.0000000,Max=200.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=20.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStar2'
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSTurretBeamEffect.SpriteEmitter19'
begin object name="SpriteEmitter19" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=128,A=0))
	ColorScale[1]=(RelativeTime=0.6500000,Color=(R=132,G=23,B=0,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=8
	StartLocationOffset=(X=16.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=64.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=2.0000000))
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=0.0250000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=900.0000000
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=15.0000000))
	WarmupTicksPerSecond=1.0000000
	RelativeWarmupTime=0.2000000
end object
// Reference: SpriteEmitter'Onslaught.ONSTurretBeamEffect.SpriteEmitter20'
begin object name="SpriteEmitter20" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=32,B=32,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=32,B=32,A=0))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=255,G=64,B=64,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=3
	StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=3000.0000000
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
