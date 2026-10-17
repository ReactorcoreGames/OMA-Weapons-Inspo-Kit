class ONSTurretBeamEffectBlue extends ONSTurretBeamEffect;

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
		Spawn(Class'XEffects.ShockImpactFlare',,, HitLocation, HitRotation);
		Spawn(Class'XEffects.ShockExplosionCore',,, HitLocation + (HitNormal * float(8)), HitRotation);
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
		Spawn(Class'XEffects.ShockImpactRing',,, HitLocation, HitRotation);
		Spawn(Class'XEffects.ShockImpactScorch',,, HitLocation, Rotator(-HitNormal));
	}
	//return;	
}

defaultproperties
{
	// Reference: BeamEmitter'Onslaught.ONSTurretBeamEffectBlue.BeamEmitter4'
	begin object name="BeamEmitter4" class=Engine.BeamEmitter
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
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=50,G=50,B=128,A=0))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=100,G=100,B=192,A=128))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=1
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=75.0000000,Max=75.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'TurretParticles.Beams.TurretBeam5'
		LifetimeRange=(Min=0.1500000,Max=0.1500000)
		StartVelocityRange=(X=(Min=500.0000000,Max=500.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=BeamEmitter4
	// Reference: BeamEmitter'Onslaught.ONSTurretBeamEffectBlue.BeamEmitter5'
	begin object name="BeamEmitter5" class=Engine.BeamEmitter
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
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=0,G=0,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.8000000
		MaxParticles=1
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Flares.SoftFlare'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=500.0000000,Max=500.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=BeamEmitter5
	// Reference: SpriteEmitter'Onslaught.ONSTurretBeamEffectBlue.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=128,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=64,A=0))
		MaxParticles=2
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=150.0000000,Max=200.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=2000.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaMuzzleBlue'
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[2]=SpriteEmitter0
	// Reference: SpriteEmitter'Onslaught.ONSTurretBeamEffectBlue.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=55,G=83,B=140,A=0))
		ColorScale[2]=(RelativeTime=0.6500000,Color=(R=0,G=23,B=132,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=6
		StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=64.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-8.0000000,Max=8.0000000))
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=2000.0000000
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=15.0000000))
		WarmupTicksPerSecond=1.0000000
		RelativeWarmupTime=0.2000000
	end object
	Emitters[3]=SpriteEmitter1
	// Reference: SpriteEmitter'Onslaught.ONSTurretBeamEffectBlue.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=128,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=0,G=128,B=255,A=0))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=0,G=128,B=255,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=4
		StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=2000.0000000
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[4]=SpriteEmitter2
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'Onslaught.ONSTurretBeamEffectBlue.BeamEmitter4'
begin object name="BeamEmitter4" class=Engine.BeamEmitter
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
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=50,G=50,B=128,A=0))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=100,G=100,B=192,A=128))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=1
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=75.0000000,Max=75.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'TurretParticles.Beams.TurretBeam5'
	LifetimeRange=(Min=0.1500000,Max=0.1500000)
	StartVelocityRange=(X=(Min=500.0000000,Max=500.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: BeamEmitter'Onslaught.ONSTurretBeamEffectBlue.BeamEmitter5'
begin object name="BeamEmitter5" class=Engine.BeamEmitter
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
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=0,G=0,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.8000000
	MaxParticles=1
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Flares.SoftFlare'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=500.0000000,Max=500.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSTurretBeamEffectBlue.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=128,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=64,A=0))
	MaxParticles=2
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=150.0000000,Max=200.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=2000.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaMuzzleBlue'
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSTurretBeamEffectBlue.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=55,G=83,B=140,A=0))
	ColorScale[2]=(RelativeTime=0.6500000,Color=(R=0,G=23,B=132,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=6
	StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=64.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-8.0000000,Max=8.0000000))
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=2000.0000000
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=15.0000000))
	WarmupTicksPerSecond=1.0000000
	RelativeWarmupTime=0.2000000
end object
// Reference: SpriteEmitter'Onslaught.ONSTurretBeamEffectBlue.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=128,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=0,G=128,B=255,A=0))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=0,G=128,B=255,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=4
	StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=2000.0000000
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
