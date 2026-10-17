class ONSHoverBikeBuildEffectRed extends ONSVehicleBuildEffect;

defaultproperties
{
	// Reference: SpriteEmitter'Onslaught.ONSHoverBikeBuildEffectRed.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=0))
		FadeOutStartTime=0.1200000
		FadeInEndTime=0.0500000
		MaxParticles=32
		StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=150.0000000,Max=200.0000000),Y=(Min=150.0000000,Max=200.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ScaleSizeByVelocityMultiplier=(X=0.1000000,Y=0.0050000,Z=1.0000000)
		ScaleSizeByVelocityMax=5000.0000000
		InitialParticlesPerSecond=60.0000000
		Texture=Texture'VMparticleTextures.buildEffects.PC_buildStreaks'
		LifetimeRange=(Min=0.1500000,Max=0.1500000)
		InitialDelayRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=2000.0000000,Max=2500.0000000))
	end object
	Emitters[0]=SpriteEmitter3
	// Reference: SpriteEmitter'Onslaught.ONSHoverBikeBuildEffectRed.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseDirectionAs=4
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=0))
		FadeOutStartTime=0.2500000
		FadeInEndTime=0.1000000
		CoordinateSystem=1
		MaxParticles=35
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
		StartLocationRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-50.0000000,Max=-50.0000000))
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=0.7500000)
		StartSizeRange=(X=(Min=250.0000000,Max=250.0000000),Y=(Min=250.0000000,Max=250.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=15.0000000
		Texture=Texture'VMparticleTextures.buildEffects.PC_buildBorderNew'
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=800.0000000,Max=800.0000000))
	end object
	Emitters[1]=SpriteEmitter4
	// Reference: MeshEmitter'Onslaught.ONSHoverBikeBuildEffectRed.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'VMStructures.CoreGroup.CoreShieldSM'
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=0))
		FadeOutStartTime=0.5000000
		FadeInEndTime=0.1000000
		CoordinateSystem=1
		MaxParticles=3
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-40.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-20.0000000,Max=-20.0000000))
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.3570000,Max=0.7830000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=1.0000000,Max=1.0000000))
		InitialParticlesPerSecond=60.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		InitialDelayRange=(Min=2.0000000,Max=2.0000000)
	end object
	Emitters[2]=MeshEmitter0
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSHoverBikeBuildEffectRed.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=0))
	FadeOutStartTime=0.1200000
	FadeInEndTime=0.0500000
	MaxParticles=32
	StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=150.0000000,Max=200.0000000),Y=(Min=150.0000000,Max=200.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ScaleSizeByVelocityMultiplier=(X=0.1000000,Y=0.0050000,Z=1.0000000)
	ScaleSizeByVelocityMax=5000.0000000
	InitialParticlesPerSecond=60.0000000
	Texture=Texture'VMparticleTextures.buildEffects.PC_buildStreaks'
	LifetimeRange=(Min=0.1500000,Max=0.1500000)
	InitialDelayRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=2000.0000000,Max=2500.0000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSHoverBikeBuildEffectRed.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseDirectionAs=4
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=0))
	FadeOutStartTime=0.2500000
	FadeInEndTime=0.1000000
	CoordinateSystem=1
	MaxParticles=35
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
	StartLocationRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-50.0000000,Max=-50.0000000))
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=0.7500000)
	StartSizeRange=(X=(Min=250.0000000,Max=250.0000000),Y=(Min=250.0000000,Max=250.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=15.0000000
	Texture=Texture'VMparticleTextures.buildEffects.PC_buildBorderNew'
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=800.0000000,Max=800.0000000))
end object
// Reference: MeshEmitter'Onslaught.ONSHoverBikeBuildEffectRed.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'VMStructures.CoreGroup.CoreShieldSM'
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=0))
	FadeOutStartTime=0.5000000
	FadeInEndTime=0.1000000
	CoordinateSystem=1
	MaxParticles=3
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-40.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-20.0000000,Max=-20.0000000))
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.3570000,Max=0.7830000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=1.0000000,Max=1.0000000))
	InitialParticlesPerSecond=60.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	InitialDelayRange=(Min=2.0000000,Max=2.0000000)
end object
