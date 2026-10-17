class ONSPowerCoreBreachEffect extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'Onslaught.ONSPowerCoreBreachEffect.SpriteEmitter16'
	begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		AlphaTest=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		Opacity=2.0000000
		FadeOutStartTime=1.0000000
		MaxParticles=20
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=10.0000000)
		StartLocationShape=1
		SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		RotationDampingFactorRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=5.0000000,Max=5.0000000),Z=(Min=5.0000000,Max=5.0000000))
		SizeScale[0]=(RelativeTime=2.0000000,RelativeSize=6.0000000)
		StartSizeRange=(X=(Min=130.0000000,Max=180.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		Sounds[0]=(Sound=Sound'ONSVehicleSounds-S.Explosions.Explosion03',Radius=(Min=1024.0000000,Max=1024.0000000),Pitch=(Min=1.0000000,Max=1.0000000),Weight=0,Volume=(Min=1.5000000,Max=2.0000000),Probability=(Min=1.0000000,Max=1.0000000))
		SpawningSound=1
		SpawningSoundProbability=(Min=0.1500000,Max=0.1500000)
		InitialParticlesPerSecond=550.0000000
		Texture=Texture'VMparticleTextures.PowerNodeEXP.powerNodeEXPblueTEX'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		InitialDelayRange=(Min=0.7500000,Max=0.7500000)
		StartVelocityRange=(X=(Min=-2500.0000000,Max=2500.0000000),Y=(Min=-2500.0000000,Max=2500.0000000),Z=(Min=-2500.0000000,Max=2500.0000000))
		VelocityLossRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=6.0000000,Max=6.0000000))
		VelocityScale[0]=(RelativeTime=1.0000000,RelativeVelocity=(X=0.2000000,Y=0.2000000,Z=0.2000000))
	end object
	Emitters[0]=SpriteEmitter16
	// Reference: MeshEmitter'Onslaught.ONSPowerCoreBreachEffect.MeshEmitter16'
	begin object name="MeshEmitter16" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'VMStructures.CoreBreachGroup.CoreBreachFrontFLARE'
		UseParticleColor=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpawnOnlyInDirectionOfNormal=true
		AlphaTest=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		FadeOutStartTime=0.5000000
		FadeInEndTime=0.5000000
		CoordinateSystem=1
		MaxParticles=1
		MeshNormal=(X=0.0000000,Y=0.0000000,Z=0.0000000)
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=2.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=6.0000000,Max=6.0000000),Y=(Min=6.0000000,Max=6.0000000),Z=(Min=6.0000000,Max=6.0000000))
		InitialParticlesPerSecond=1.0000000
		Texture=none
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.2000000,Max=1.2000000)
	end object
	Emitters[1]=MeshEmitter16
	// Reference: MeshEmitter'Onslaught.ONSPowerCoreBreachEffect.MeshEmitter17'
	begin object name="MeshEmitter17" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'VMStructures.CoreBreachGroup.CoreBreachFrontDISC'
		UseParticleColor=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		FadeOutStartTime=1.0000000
		CoordinateSystem=1
		MaxParticles=1
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=2.0000000,RelativeSize=8.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
		InitialParticlesPerSecond=1.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
	end object
	Emitters[2]=MeshEmitter17
	// Reference: SpriteEmitter'Onslaught.ONSPowerCoreBreachEffect.SpriteEmitter17'
	begin object name="SpriteEmitter17" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		AlphaTest=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		FadeOutStartTime=1.0000000
		FadeInEndTime=0.2000000
		MaxParticles=1
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=2.0000000,RelativeSize=68.0000000)
		StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		InitialParticlesPerSecond=1.0000000
		Texture=Texture'ONSstructureTextures.CoreBreachGroup.CoreBreachShockRINGedge'
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
	end object
	Emitters[3]=SpriteEmitter17
	// Reference: MeshEmitter'Onslaught.ONSPowerCoreBreachEffect.MeshEmitter18'
	begin object name="MeshEmitter18" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'VMStructures.CoreBreachGroup.CoreBreachTopDISC'
		RenderTwoSided=true
		UseParticleColor=true
		FadeOut=true
		RespawnDeadParticles=false
		AlphaTest=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		FadeOutStartTime=1.0000000
		CoordinateSystem=1
		MaxParticles=1
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=2.0000000,RelativeSize=16.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
		InitialParticlesPerSecond=1.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
	end object
	Emitters[4]=MeshEmitter18
	// Reference: MeshEmitter'Onslaught.ONSPowerCoreBreachEffect.MeshEmitter19'
	begin object name="MeshEmitter19" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'VMStructures.CoreBreachGroup.CoreBreachTopRING'
		RenderTwoSided=true
		UseParticleColor=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		CoordinateSystem=1
		MaxParticles=1
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=2.0000000,RelativeSize=12.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
		Sounds[0]=(Sound=Sound'ONSVehicleSounds-S.Explosions.Explosion03',Radius=(Min=1024.0000000,Max=1024.0000000),Pitch=(Min=1.0000000,Max=1.0000000),Weight=0,Volume=(Min=1.5000000,Max=2.0000000),Probability=(Min=1.0000000,Max=1.0000000))
		SpawningSound=1
		SpawningSoundProbability=(Min=1.0000000,Max=1.0000000)
		InitialParticlesPerSecond=1.0000000
		DrawStyle=0
		Texture=none
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
	end object
	Emitters[5]=MeshEmitter19
	// Reference: SpriteEmitter'Onslaught.ONSPowerCoreBreachEffect.SpriteEmitter18'
	begin object name="SpriteEmitter18" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		MaxParticles=80
		StartLocationRange=(X=(Min=-250.0000000,Max=250.0000000),Y=(Min=-250.0000000,Max=250.0000000),Z=(Min=-250.0000000,Max=250.0000000))
		StartSpinRange=(X=(Min=0.2310000,Max=0.8530000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=350.0000000,Max=350.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Sounds[0]=(Sound=Sound'ONSVehicleSounds-S.Explosions.Explosion03',Radius=(Min=1024.0000000,Max=1024.0000000),Pitch=(Min=1.0000000,Max=1.0000000),Weight=0,Volume=(Min=1.5000000,Max=2.0000000),Probability=(Min=1.0000000,Max=1.0000000))
		Sounds[1]=(Sound=Sound'ONSVehicleSounds-S.Explosions.Explosion06',Radius=(Min=1024.0000000,Max=1024.0000000),Pitch=(Min=1.0000000,Max=1.0000000),Weight=0,Volume=(Min=1.5000000,Max=2.0000000),Probability=(Min=1.0000000,Max=1.0000000))
		Sounds[2]=(Sound=Sound'ONSVehicleSounds-S.Explosions.Explosion08',Radius=(Min=1024.0000000,Max=1024.0000000),Pitch=(Min=1.0000000,Max=1.0000000),Weight=0,Volume=(Min=1.5000000,Max=2.0000000),Probability=(Min=1.0000000,Max=1.0000000))
		SpawningSound=1
		SpawningSoundProbability=(Min=0.3000000,Max=0.3000000)
		InitialParticlesPerSecond=15.0000000
		Texture=Texture'ONSstructureTextures.CoreBreachGroup.exp7_framesBLUE'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		InitialDelayRange=(Min=2.0000000,Max=2.0000000)
	end object
	Emitters[6]=SpriteEmitter18
	// Reference: SpriteEmitter'Onslaught.ONSPowerCoreBreachEffect.SpriteEmitter19'
	begin object name="SpriteEmitter19" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		Opacity=0.5000000
		FadeOutStartTime=2.0000000
		FadeInEndTime=0.1000000
		MaxParticles=30
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=5.0000000,RelativeSize=20.0000000)
		StartSizeRange=(X=(Min=75.0000000,Max=100.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
		InitialParticlesPerSecond=6.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Fire.MuchSmoke1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		InitialDelayRange=(Min=7.0000000,Max=7.0000000)
		StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=220.0000000,Max=220.0000000))
	end object
	Emitters[7]=SpriteEmitter19
	// Reference: MeshEmitter'Onslaught.ONSPowerCoreBreachEffect.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'VMStructures.CoreBreachGroup.coreLightning'
		RenderTwoSided=true
		SpinParticles=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		MaxParticles=1
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
		StartSpinRange=(X=(Min=0.4500000,Max=0.7500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
		Sounds[0]=(Sound=Sound'IndoorAmbience.electricity1',Radius=(Min=1024.0000000,Max=1024.0000000),Pitch=(Min=1.0000000,Max=1.0000000),Weight=0,Volume=(Min=0.6000000,Max=0.6000000),Probability=(Min=1.0000000,Max=1.0000000))
		SpawningSound=1
		SpawningSoundProbability=(Min=0.2000000,Max=0.2000000)
		InitialParticlesPerSecond=4.0000000
		DrawStyle=0
		LifetimeRange=(Min=0.2500000,Max=0.6500000)
		InitialDelayRange=(Min=7.0000000,Max=10.0000000)
	end object
	Emitters[8]=MeshEmitter0
	// Reference: MeshEmitter'Onslaught.ONSPowerCoreBreachEffect.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'VMStructures.CoreBreachGroup.coreLightning1'
		RenderTwoSided=true
		SpinParticles=true
		UseRegularSizeScale=false
		MaxParticles=1
		StartSpinRange=(X=(Min=0.3570000,Max=0.7410000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=0.6500000,Max=1.0000000),Y=(Min=0.6500000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		Sounds[0]=(Sound=Sound'IndoorAmbience.electricity1',Radius=(Min=1024.0000000,Max=1024.0000000),Pitch=(Min=1.0000000,Max=1.0000000),Weight=0,Volume=(Min=0.6000000,Max=0.6000000),Probability=(Min=1.0000000,Max=1.0000000))
		SpawningSound=1
		SpawningSoundProbability=(Min=0.2000000,Max=0.2000000)
		LifetimeRange=(Min=0.2500000,Max=0.6500000)
		InitialDelayRange=(Min=7.0000000,Max=9.0000000)
	end object
	Emitters[9]=MeshEmitter1
	// Reference: SpriteEmitter'Onslaught.ONSPowerCoreBreachEffect.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		FadeOutStartTime=3.2500000
		FadeInEndTime=0.2500000
		MaxParticles=40
		StartLocationOffset=(X=-70.0000000,Y=-70.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=3.0000000,RelativeSize=4.0000000)
		StartSizeRange=(X=(Min=50.0000000,Max=70.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		DrawStyle=1
		Texture=Texture'VMparticleTextures.TankFiringP.TankDustKick'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		InitialDelayRange=(Min=7.0000000,Max=7.0000000)
		StartVelocityRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=200.0000000,Max=250.0000000))
	end object
	Emitters[10]=SpriteEmitter0
	// Reference: SpriteEmitter'Onslaught.ONSPowerCoreBreachEffect.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		FadeOutStartTime=1.5000000
		FadeInEndTime=0.2500000
		MaxParticles=40
		StartLocationOffset=(X=-100.0000000,Y=50.0000000,Z=100.0000000)
		SizeScale[0]=(RelativeTime=2.0000000,RelativeSize=6.0000000)
		StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=10.0000000
		DrawStyle=1
		Texture=Texture'VMparticleTextures.TankFiringP.TankDustKick1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		InitialDelayRange=(Min=7.0000000,Max=7.0000000)
		StartVelocityRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=180.0000000,Max=230.0000000))
	end object
	Emitters[11]=SpriteEmitter1
	AutoDestroy=true
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSPowerCoreBreachEffect.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	FadeOutStartTime=1.5000000
	FadeInEndTime=0.2500000
	MaxParticles=40
	StartLocationOffset=(X=-100.0000000,Y=50.0000000,Z=100.0000000)
	SizeScale[0]=(RelativeTime=2.0000000,RelativeSize=6.0000000)
	StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=10.0000000
	DrawStyle=1
	Texture=Texture'VMparticleTextures.TankFiringP.TankDustKick1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	InitialDelayRange=(Min=7.0000000,Max=7.0000000)
	StartVelocityRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=180.0000000,Max=230.0000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSPowerCoreBreachEffect.SpriteEmitter16'
begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	AlphaTest=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	Opacity=2.0000000
	FadeOutStartTime=1.0000000
	MaxParticles=20
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	StartLocationShape=1
	SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	RotationDampingFactorRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=5.0000000,Max=5.0000000),Z=(Min=5.0000000,Max=5.0000000))
	SizeScale[0]=(RelativeTime=2.0000000,RelativeSize=6.0000000)
	StartSizeRange=(X=(Min=130.0000000,Max=180.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	Sounds[0]=(Sound=Sound'ONSVehicleSounds-S.Explosions.Explosion03',Radius=(Min=1024.0000000,Max=1024.0000000),Pitch=(Min=1.0000000,Max=1.0000000),Weight=0,Volume=(Min=1.5000000,Max=2.0000000),Probability=(Min=1.0000000,Max=1.0000000))
	SpawningSound=1
	SpawningSoundProbability=(Min=0.1500000,Max=0.1500000)
	InitialParticlesPerSecond=550.0000000
	Texture=Texture'VMparticleTextures.PowerNodeEXP.powerNodeEXPblueTEX'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	InitialDelayRange=(Min=0.7500000,Max=0.7500000)
	StartVelocityRange=(X=(Min=-2500.0000000,Max=2500.0000000),Y=(Min=-2500.0000000,Max=2500.0000000),Z=(Min=-2500.0000000,Max=2500.0000000))
	VelocityLossRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=6.0000000,Max=6.0000000))
	VelocityScale[0]=(RelativeTime=1.0000000,RelativeVelocity=(X=0.2000000,Y=0.2000000,Z=0.2000000))
end object
// Reference: MeshEmitter'Onslaught.ONSPowerCoreBreachEffect.MeshEmitter16'
begin object name="MeshEmitter16" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'VMStructures.CoreBreachGroup.CoreBreachFrontFLARE'
	UseParticleColor=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpawnOnlyInDirectionOfNormal=true
	AlphaTest=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	FadeOutStartTime=0.5000000
	FadeInEndTime=0.5000000
	CoordinateSystem=1
	MaxParticles=1
	MeshNormal=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=2.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=6.0000000,Max=6.0000000),Y=(Min=6.0000000,Max=6.0000000),Z=(Min=6.0000000,Max=6.0000000))
	InitialParticlesPerSecond=1.0000000
	Texture=none
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.2000000,Max=1.2000000)
end object
// Reference: MeshEmitter'Onslaught.ONSPowerCoreBreachEffect.MeshEmitter17'
begin object name="MeshEmitter17" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'VMStructures.CoreBreachGroup.CoreBreachFrontDISC'
	UseParticleColor=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	FadeOutStartTime=1.0000000
	CoordinateSystem=1
	MaxParticles=1
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=2.0000000,RelativeSize=8.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
	InitialParticlesPerSecond=1.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSPowerCoreBreachEffect.SpriteEmitter17'
begin object name="SpriteEmitter17" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	AlphaTest=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	FadeOutStartTime=1.0000000
	FadeInEndTime=0.2000000
	MaxParticles=1
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=2.0000000,RelativeSize=68.0000000)
	StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	InitialParticlesPerSecond=1.0000000
	Texture=Texture'ONSstructureTextures.CoreBreachGroup.CoreBreachShockRINGedge'
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
end object
// Reference: MeshEmitter'Onslaught.ONSPowerCoreBreachEffect.MeshEmitter18'
begin object name="MeshEmitter18" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'VMStructures.CoreBreachGroup.CoreBreachTopDISC'
	RenderTwoSided=true
	UseParticleColor=true
	FadeOut=true
	RespawnDeadParticles=false
	AlphaTest=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	FadeOutStartTime=1.0000000
	CoordinateSystem=1
	MaxParticles=1
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=2.0000000,RelativeSize=16.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
	InitialParticlesPerSecond=1.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
end object
// Reference: MeshEmitter'Onslaught.ONSPowerCoreBreachEffect.MeshEmitter19'
begin object name="MeshEmitter19" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'VMStructures.CoreBreachGroup.CoreBreachTopRING'
	RenderTwoSided=true
	UseParticleColor=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	CoordinateSystem=1
	MaxParticles=1
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=2.0000000,RelativeSize=12.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
	Sounds[0]=(Sound=Sound'ONSVehicleSounds-S.Explosions.Explosion03',Radius=(Min=1024.0000000,Max=1024.0000000),Pitch=(Min=1.0000000,Max=1.0000000),Weight=0,Volume=(Min=1.5000000,Max=2.0000000),Probability=(Min=1.0000000,Max=1.0000000))
	SpawningSound=1
	SpawningSoundProbability=(Min=1.0000000,Max=1.0000000)
	InitialParticlesPerSecond=1.0000000
	DrawStyle=0
	Texture=none
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSPowerCoreBreachEffect.SpriteEmitter18'
begin object name="SpriteEmitter18" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	MaxParticles=80
	StartLocationRange=(X=(Min=-250.0000000,Max=250.0000000),Y=(Min=-250.0000000,Max=250.0000000),Z=(Min=-250.0000000,Max=250.0000000))
	StartSpinRange=(X=(Min=0.2310000,Max=0.8530000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=350.0000000,Max=350.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Sounds[0]=(Sound=Sound'ONSVehicleSounds-S.Explosions.Explosion03',Radius=(Min=1024.0000000,Max=1024.0000000),Pitch=(Min=1.0000000,Max=1.0000000),Weight=0,Volume=(Min=1.5000000,Max=2.0000000),Probability=(Min=1.0000000,Max=1.0000000))
	Sounds[1]=(Sound=Sound'ONSVehicleSounds-S.Explosions.Explosion06',Radius=(Min=1024.0000000,Max=1024.0000000),Pitch=(Min=1.0000000,Max=1.0000000),Weight=0,Volume=(Min=1.5000000,Max=2.0000000),Probability=(Min=1.0000000,Max=1.0000000))
	Sounds[2]=(Sound=Sound'ONSVehicleSounds-S.Explosions.Explosion08',Radius=(Min=1024.0000000,Max=1024.0000000),Pitch=(Min=1.0000000,Max=1.0000000),Weight=0,Volume=(Min=1.5000000,Max=2.0000000),Probability=(Min=1.0000000,Max=1.0000000))
	SpawningSound=1
	SpawningSoundProbability=(Min=0.3000000,Max=0.3000000)
	InitialParticlesPerSecond=15.0000000
	Texture=Texture'ONSstructureTextures.CoreBreachGroup.exp7_framesBLUE'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	InitialDelayRange=(Min=2.0000000,Max=2.0000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSPowerCoreBreachEffect.SpriteEmitter19'
begin object name="SpriteEmitter19" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	Opacity=0.5000000
	FadeOutStartTime=2.0000000
	FadeInEndTime=0.1000000
	MaxParticles=30
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=5.0000000,RelativeSize=20.0000000)
	StartSizeRange=(X=(Min=75.0000000,Max=100.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
	InitialParticlesPerSecond=6.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Fire.MuchSmoke1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	InitialDelayRange=(Min=7.0000000,Max=7.0000000)
	StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=220.0000000,Max=220.0000000))
end object
// Reference: MeshEmitter'Onslaught.ONSPowerCoreBreachEffect.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'VMStructures.CoreBreachGroup.coreLightning'
	RenderTwoSided=true
	SpinParticles=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	MaxParticles=1
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
	StartSpinRange=(X=(Min=0.4500000,Max=0.7500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
	Sounds[0]=(Sound=Sound'IndoorAmbience.electricity1',Radius=(Min=1024.0000000,Max=1024.0000000),Pitch=(Min=1.0000000,Max=1.0000000),Weight=0,Volume=(Min=0.6000000,Max=0.6000000),Probability=(Min=1.0000000,Max=1.0000000))
	SpawningSound=1
	SpawningSoundProbability=(Min=0.2000000,Max=0.2000000)
	InitialParticlesPerSecond=4.0000000
	DrawStyle=0
	LifetimeRange=(Min=0.2500000,Max=0.6500000)
	InitialDelayRange=(Min=7.0000000,Max=10.0000000)
end object
// Reference: MeshEmitter'Onslaught.ONSPowerCoreBreachEffect.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'VMStructures.CoreBreachGroup.coreLightning1'
	RenderTwoSided=true
	SpinParticles=true
	UseRegularSizeScale=false
	MaxParticles=1
	StartSpinRange=(X=(Min=0.3570000,Max=0.7410000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=0.6500000,Max=1.0000000),Y=(Min=0.6500000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	Sounds[0]=(Sound=Sound'IndoorAmbience.electricity1',Radius=(Min=1024.0000000,Max=1024.0000000),Pitch=(Min=1.0000000,Max=1.0000000),Weight=0,Volume=(Min=0.6000000,Max=0.6000000),Probability=(Min=1.0000000,Max=1.0000000))
	SpawningSound=1
	SpawningSoundProbability=(Min=0.2000000,Max=0.2000000)
	LifetimeRange=(Min=0.2500000,Max=0.6500000)
	InitialDelayRange=(Min=7.0000000,Max=9.0000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSPowerCoreBreachEffect.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	FadeOutStartTime=3.2500000
	FadeInEndTime=0.2500000
	MaxParticles=40
	StartLocationOffset=(X=-70.0000000,Y=-70.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=3.0000000,RelativeSize=4.0000000)
	StartSizeRange=(X=(Min=50.0000000,Max=70.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	DrawStyle=1
	Texture=Texture'VMparticleTextures.TankFiringP.TankDustKick'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	InitialDelayRange=(Min=7.0000000,Max=7.0000000)
	StartVelocityRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=200.0000000,Max=250.0000000))
end object
