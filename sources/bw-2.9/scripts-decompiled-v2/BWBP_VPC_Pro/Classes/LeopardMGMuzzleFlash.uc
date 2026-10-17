class LeopardMGMuzzleFlash extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_VPC_Pro.LeopardMGMuzzleFlash.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
		Opacity=0.2500000
		FadeOutStartTime=3.0000000
		MaxParticles=2
		DetailMode=1
		SpinsPerSecondRange=(X=(Min=0.2500000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
		StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		InitialParticlesPerSecond=400.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		StartVelocityRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: SpriteEmitter'BWBP_VPC_Pro.LeopardMGMuzzleFlash.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-40.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=128,A=255))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=64,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		Opacity=0.5000000
		CoordinateSystem=1
		MaxParticles=2
		DetailMode=1
		SpinsPerSecondRange=(X=(Min=0.2500000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=0.5000000,Max=2.0000000),Y=(Min=0.5000000,Max=2.0000000),Z=(Min=0.5000000,Max=2.0000000))
		InitialParticlesPerSecond=400.0000000
		Texture=Texture'EpicParticles.Flares.Sharpstreaks2'
		TextureUSubdivisions=1
		TextureVSubdivisions=1
		StartVelocityRange=(X=(Min=3.0000000,Max=30.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=50.0000000))
	end object
	Emitters[1]=SpriteEmitter0
	// Reference: MeshEmitter'BWBP_VPC_Pro.LeopardMGMuzzleFlash.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'XEffects.MinigunFlashMesh'
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		AutoDestroy=true
		UniformMeshScale=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=192,B=128,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.8000000
		CoordinateSystem=1
		MaxParticles=4
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=2.0000000,Max=3.0000000))
		StartSizeRange=(X=(Min=0.1000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.3000000),Z=(Min=0.2000000,Max=0.3000000))
		InitialParticlesPerSecond=800.0000000
		DrawStyle=6
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		StartVelocityRange=(X=(Min=-6.0000000,Max=6.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[2]=MeshEmitter0
	// Reference: MeshEmitter'BWBP_VPC_Pro.LeopardMGMuzzleFlash.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'VMmeshEmitted.EJECTA.EjectedBRASSsm'
		UseCollision=true
		RespawnDeadParticles=false
		SpinParticles=true
		DampRotation=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		DampingFactorRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.8000000,Max=0.8000000))
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=2
		StartLocationRange=(X=(Min=-26.0000000,Max=-26.0000000),Y=(Min=-8.0000000,Max=-8.0000000),Z=(Min=2.0000000,Max=2.0000000))
		SpinsPerSecondRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=4.0000000),Z=(Min=1.0000000,Max=5.0000000))
		RotationDampingFactorRange=(X=(Min=0.0000000,Max=0.8000000),Y=(Min=0.0000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.8000000))
		StartSizeRange=(X=(Min=0.0250000,Max=0.0250000),Y=(Min=0.0250000,Max=0.0250000),Z=(Min=0.0250000,Max=0.0250000))
		InitialParticlesPerSecond=4.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-80.0000000,Max=-50.0000000),Z=(Min=-10.0000000,Max=50.0000000))
	end object
	Emitters[3]=MeshEmitter1
	// Reference: MeshEmitter'BWBP_VPC_Pro.LeopardMGMuzzleFlash.MeshEmitter2'
	begin object name="MeshEmitter2" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BWBP_Vehicles_Static.Effects.BulletLink'
		UseCollision=true
		RespawnDeadParticles=false
		SpinParticles=true
		DampRotation=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		DampingFactorRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.8000000,Max=0.8000000))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=2
		StartLocationRange=(X=(Min=-26.0000000,Max=-26.0000000),Y=(Min=-8.0000000,Max=-8.0000000),Z=(Min=2.0000000,Max=2.0000000))
		SpinsPerSecondRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=4.0000000),Z=(Min=1.0000000,Max=5.0000000))
		RotationDampingFactorRange=(X=(Min=0.0000000,Max=0.8000000),Y=(Min=0.0000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.8000000))
		StartSizeRange=(X=(Min=0.1500000,Max=0.1500000),Y=(Min=0.1500000,Max=0.1500000),Z=(Min=0.1500000,Max=0.1500000))
		InitialParticlesPerSecond=4.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-80.0000000,Max=-50.0000000),Z=(Min=-10.0000000,Max=50.0000000))
	end object
	Emitters[4]=MeshEmitter2
	AutoDestroy=true
	CullDistance=4000.0000000
	bNoDelete=false
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_VPC_Pro.LeopardMGMuzzleFlash.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
	Opacity=0.2500000
	FadeOutStartTime=3.0000000
	MaxParticles=2
	DetailMode=1
	SpinsPerSecondRange=(X=(Min=0.2500000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
	StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	InitialParticlesPerSecond=400.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	StartVelocityRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-5.0000000,Max=5.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.LeopardMGMuzzleFlash.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-40.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=128,A=255))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=64,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	Opacity=0.5000000
	CoordinateSystem=1
	MaxParticles=2
	DetailMode=1
	SpinsPerSecondRange=(X=(Min=0.2500000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=0.5000000,Max=2.0000000),Y=(Min=0.5000000,Max=2.0000000),Z=(Min=0.5000000,Max=2.0000000))
	InitialParticlesPerSecond=400.0000000
	Texture=Texture'EpicParticles.Flares.Sharpstreaks2'
	TextureUSubdivisions=1
	TextureVSubdivisions=1
	StartVelocityRange=(X=(Min=3.0000000,Max=30.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=50.0000000))
end object
// Reference: MeshEmitter'BWBP_VPC_Pro.LeopardMGMuzzleFlash.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'XEffects.MinigunFlashMesh'
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	AutoDestroy=true
	UniformMeshScale=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=192,B=128,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.8000000
	CoordinateSystem=1
	MaxParticles=4
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=2.0000000,Max=3.0000000))
	StartSizeRange=(X=(Min=0.1000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.3000000),Z=(Min=0.2000000,Max=0.3000000))
	InitialParticlesPerSecond=800.0000000
	DrawStyle=6
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	StartVelocityRange=(X=(Min=-6.0000000,Max=6.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: MeshEmitter'BWBP_VPC_Pro.LeopardMGMuzzleFlash.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'VMmeshEmitted.EJECTA.EjectedBRASSsm'
	UseCollision=true
	RespawnDeadParticles=false
	SpinParticles=true
	DampRotation=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	DampingFactorRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.8000000,Max=0.8000000))
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=2
	StartLocationRange=(X=(Min=-26.0000000,Max=-26.0000000),Y=(Min=-8.0000000,Max=-8.0000000),Z=(Min=2.0000000,Max=2.0000000))
	SpinsPerSecondRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=4.0000000),Z=(Min=1.0000000,Max=5.0000000))
	RotationDampingFactorRange=(X=(Min=0.0000000,Max=0.8000000),Y=(Min=0.0000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.8000000))
	StartSizeRange=(X=(Min=0.0250000,Max=0.0250000),Y=(Min=0.0250000,Max=0.0250000),Z=(Min=0.0250000,Max=0.0250000))
	InitialParticlesPerSecond=4.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-80.0000000,Max=-50.0000000),Z=(Min=-10.0000000,Max=50.0000000))
end object
// Reference: MeshEmitter'BWBP_VPC_Pro.LeopardMGMuzzleFlash.MeshEmitter2'
begin object name="MeshEmitter2" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BWBP_Vehicles_Static.Effects.BulletLink'
	UseCollision=true
	RespawnDeadParticles=false
	SpinParticles=true
	DampRotation=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	DampingFactorRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.8000000,Max=0.8000000))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=2
	StartLocationRange=(X=(Min=-26.0000000,Max=-26.0000000),Y=(Min=-8.0000000,Max=-8.0000000),Z=(Min=2.0000000,Max=2.0000000))
	SpinsPerSecondRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=4.0000000),Z=(Min=1.0000000,Max=5.0000000))
	RotationDampingFactorRange=(X=(Min=0.0000000,Max=0.8000000),Y=(Min=0.0000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.8000000))
	StartSizeRange=(X=(Min=0.1500000,Max=0.1500000),Y=(Min=0.1500000,Max=0.1500000),Z=(Min=0.1500000,Max=0.1500000))
	InitialParticlesPerSecond=4.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-80.0000000,Max=-50.0000000),Z=(Min=-10.0000000,Max=50.0000000))
end object
