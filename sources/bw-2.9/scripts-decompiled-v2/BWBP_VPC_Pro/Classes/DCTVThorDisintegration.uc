class DCTVThorDisintegration extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.SpriteEmitter64'
	begin object name="SpriteEmitter64" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
		MaxParticles=3
		StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=0.0000000,Max=0.0000000))
		UseRotationFrom=1
		StartSizeRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=20.0000000
		Texture=Texture'ExplosionTex.Framed.SmokeReOrdered'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-300.0000000,Max=300.0000000),Y=(Min=-300.0000000,Max=300.0000000),Z=(Min=400.0000000,Max=500.0000000))
	end object
	Emitters[0]=SpriteEmitter64
	// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.SpriteEmitter68'
	begin object name="SpriteEmitter68" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=192))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		DetailMode=2
		AddLocationFromOtherEmitter=5
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Fire.MuchSmoke1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[1]=SpriteEmitter68
	// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.SpriteEmitter67'
	begin object name="SpriteEmitter67" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		DetailMode=2
		AddLocationFromOtherEmitter=5
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=80.0000000,Max=120.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'ExplosionTex.Framed.we1_frames'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.4000000,Max=0.6000000)
		AddVelocityFromOtherEmitter=5
		AddVelocityMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
	end object
	Emitters[2]=SpriteEmitter67
	// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.SpriteEmitter65'
	begin object name="SpriteEmitter65" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		MaxParticles=20
		DetailMode=1
		AddLocationFromOtherEmitter=0
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		InitialParticlesPerSecond=30.0000000
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[3]=SpriteEmitter65
	// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.SpriteEmitter66'
	begin object name="SpriteEmitter66" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		BlendBetweenSubdivisions=true
		MaxParticles=8
		StartLocationRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-120.0000000,Max=120.0000000),Z=(Min=-32.0000000,Max=32.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		Texture=Texture'ExplosionTex.Framed.exp2_frames'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.4000000,Max=0.6000000)
		StartVelocityRadialRange=(Min=-100.0000000,Max=-100.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[4]=SpriteEmitter66
	// Reference: MeshEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.MeshEmitter43'
	begin object name="MeshEmitter43" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BWBP_Vehicles_Static.ThorTank.ThorBustedTurret'
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=-30.0000000,Y=0.0000000,Z=40.0000000)
		UseRotationFrom=1
		SpinCCWorCW=(X=0.5000000,Y=0.0000000,Z=0.5000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		InitialParticlesPerSecond=5000.0000000
		LifetimeRange=(Min=1.5000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=1100.0000000,Max=1500.0000000))
	end object
	Emitters[5]=MeshEmitter43
	// Reference: MeshEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.MeshEmitter44'
	begin object name="MeshEmitter44" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'AW-2004Particles.Debris.Veh_Debris2'
		UseParticleColor=true
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
		MaxParticles=15
		DetailMode=2
		StartLocationShape=1
		SphereRadiusRange=(Min=8.0000000,Max=8.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.2000000),Z=(Min=0.0000000,Max=0.2000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		LifetimeRange=(Min=1.5000000,Max=2.0000000)
		InitialDelayRange=(Min=0.1500000,Max=0.1500000)
		StartVelocityRadialRange=(Min=300.0000000,Max=800.0000000)
		VelocityLossRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
		GetVelocityDirectionFrom=3
	end object
	Emitters[6]=MeshEmitter44
	// Reference: MeshEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.MeshEmitter45'
	begin object name="MeshEmitter45" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'AW-2004Particles.Debris.Veh_Debris1'
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
		MaxParticles=15
		DetailMode=2
		StartLocationShape=1
		SphereRadiusRange=(Min=8.0000000,Max=8.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.2000000),Z=(Min=0.0000000,Max=0.2000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		LifetimeRange=(Min=1.5000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=100.0000000,Max=300.0000000))
		StartVelocityRadialRange=(Min=300.0000000,Max=800.0000000)
		VelocityLossRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
		GetVelocityDirectionFrom=3
	end object
	Emitters[7]=MeshEmitter45
	// Reference: MeshEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.MeshEmitter6'
	begin object name="MeshEmitter6" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BWBP_Vehicles_Static.ThorTank.ThorBustedWheel'
		UseMeshBlendMode=false
		UseParticleColor=true
		UseCollision=true
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		DampRotation=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
		ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
		DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.3000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=-160.0000000,Y=-120.0000000,Z=0.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		MinSquaredVelocity=5000.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-300.0000000,Max=-100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	end object
	Emitters[8]=MeshEmitter6
	// Reference: MeshEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.MeshEmitter7'
	begin object name="MeshEmitter7" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BWBP_Vehicles_Static.ThorTank.ThorBustedWheel'
		UseMeshBlendMode=false
		UseParticleColor=true
		UseCollision=true
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		DampRotation=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
		ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
		DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.3000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=15.0000000,Y=120.0000000,Z=0.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		MinSquaredVelocity=5000.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=200.0000000,Max=400.0000000),Z=(Min=100.0000000,Max=100.0000000))
	end object
	Emitters[9]=MeshEmitter7
	// Reference: MeshEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.MeshEmitter8'
	begin object name="MeshEmitter8" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BWBP_Vehicles_Static.ThorTank.ThorBustedWheel'
		UseMeshBlendMode=false
		UseParticleColor=true
		UseCollision=true
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		DampRotation=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
		ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
		DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.3000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=103.0000000,Y=120.0000000,Z=0.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		MinSquaredVelocity=5000.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-100.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=400.0000000),Z=(Min=100.0000000,Max=100.0000000))
	end object
	Emitters[10]=MeshEmitter8
	AutoDestroy=true
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.SpriteEmitter64'
begin object name="SpriteEmitter64" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
	MaxParticles=3
	StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=0.0000000,Max=0.0000000))
	UseRotationFrom=1
	StartSizeRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=20.0000000
	Texture=Texture'ExplosionTex.Framed.SmokeReOrdered'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-300.0000000,Max=300.0000000),Y=(Min=-300.0000000,Max=300.0000000),Z=(Min=400.0000000,Max=500.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.SpriteEmitter68'
begin object name="SpriteEmitter68" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=192))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	DetailMode=2
	AddLocationFromOtherEmitter=5
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Fire.MuchSmoke1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.SpriteEmitter67'
begin object name="SpriteEmitter67" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	DetailMode=2
	AddLocationFromOtherEmitter=5
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=80.0000000,Max=120.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'ExplosionTex.Framed.we1_frames'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.4000000,Max=0.6000000)
	AddVelocityFromOtherEmitter=5
	AddVelocityMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.SpriteEmitter65'
begin object name="SpriteEmitter65" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	MaxParticles=20
	DetailMode=1
	AddLocationFromOtherEmitter=0
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	InitialParticlesPerSecond=30.0000000
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.SpriteEmitter66'
begin object name="SpriteEmitter66" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	BlendBetweenSubdivisions=true
	MaxParticles=8
	StartLocationRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-120.0000000,Max=120.0000000),Z=(Min=-32.0000000,Max=32.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	Texture=Texture'ExplosionTex.Framed.exp2_frames'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.4000000,Max=0.6000000)
	StartVelocityRadialRange=(Min=-100.0000000,Max=-100.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: MeshEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.MeshEmitter43'
begin object name="MeshEmitter43" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BWBP_Vehicles_Static.ThorTank.ThorBustedTurret'
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=-30.0000000,Y=0.0000000,Z=40.0000000)
	UseRotationFrom=1
	SpinCCWorCW=(X=0.5000000,Y=0.0000000,Z=0.5000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	InitialParticlesPerSecond=5000.0000000
	LifetimeRange=(Min=1.5000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=1100.0000000,Max=1500.0000000))
end object
// Reference: MeshEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.MeshEmitter44'
begin object name="MeshEmitter44" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'AW-2004Particles.Debris.Veh_Debris2'
	UseParticleColor=true
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
	MaxParticles=15
	DetailMode=2
	StartLocationShape=1
	SphereRadiusRange=(Min=8.0000000,Max=8.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.2000000),Z=(Min=0.0000000,Max=0.2000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	LifetimeRange=(Min=1.5000000,Max=2.0000000)
	InitialDelayRange=(Min=0.1500000,Max=0.1500000)
	StartVelocityRadialRange=(Min=300.0000000,Max=800.0000000)
	VelocityLossRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
	GetVelocityDirectionFrom=3
end object
// Reference: MeshEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.MeshEmitter45'
begin object name="MeshEmitter45" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'AW-2004Particles.Debris.Veh_Debris1'
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
	MaxParticles=15
	DetailMode=2
	StartLocationShape=1
	SphereRadiusRange=(Min=8.0000000,Max=8.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.2000000),Z=(Min=0.0000000,Max=0.2000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	LifetimeRange=(Min=1.5000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=100.0000000,Max=300.0000000))
	StartVelocityRadialRange=(Min=300.0000000,Max=800.0000000)
	VelocityLossRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
	GetVelocityDirectionFrom=3
end object
// Reference: MeshEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.MeshEmitter6'
begin object name="MeshEmitter6" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BWBP_Vehicles_Static.ThorTank.ThorBustedWheel'
	UseMeshBlendMode=false
	UseParticleColor=true
	UseCollision=true
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	DampRotation=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
	ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
	DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.3000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=-160.0000000,Y=-120.0000000,Z=0.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	MinSquaredVelocity=5000.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-300.0000000,Max=-100.0000000),Z=(Min=100.0000000,Max=100.0000000))
end object
// Reference: MeshEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.MeshEmitter7'
begin object name="MeshEmitter7" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BWBP_Vehicles_Static.ThorTank.ThorBustedWheel'
	UseMeshBlendMode=false
	UseParticleColor=true
	UseCollision=true
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	DampRotation=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
	ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
	DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.3000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=15.0000000,Y=120.0000000,Z=0.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	MinSquaredVelocity=5000.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=200.0000000,Max=400.0000000),Z=(Min=100.0000000,Max=100.0000000))
end object
// Reference: MeshEmitter'BWBP_VPC_Pro.DCTVThorDisintegration.MeshEmitter8'
begin object name="MeshEmitter8" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BWBP_Vehicles_Static.ThorTank.ThorBustedWheel'
	UseMeshBlendMode=false
	UseParticleColor=true
	UseCollision=true
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	DampRotation=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
	ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
	DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.3000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=103.0000000,Y=120.0000000,Z=0.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	MinSquaredVelocity=5000.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-100.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=400.0000000),Z=(Min=100.0000000,Max=100.0000000))
end object
