class ONSVehDeathPRV extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathPRV.SpriteEmitter14'
	begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=8))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=0,G=0,B=0,A=96))
		ColorScale[2]=(RelativeTime=0.5000000,Color=(R=0,G=0,B=0,A=96))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		DetailMode=1
		AddLocationFromOtherEmitter=1
		StartLocationShape=2
		StartLocationPolarRange=(X=(Min=0.0000000,Max=65536.0000000),Y=(Min=16384.0000000,Max=16384.0000000),Z=(Min=50.0000000,Max=150.0000000))
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Fire.MuchSmoke1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
	end object
	Emitters[0]=SpriteEmitter14
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathPRV.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		MaxParticles=5
		StartLocationShape=2
		StartLocationPolarRange=(X=(Min=0.0000000,Max=65536.0000000),Y=(Min=16384.0000000,Max=16384.0000000),Z=(Min=50.0000000,Max=100.0000000))
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
		InitialParticlesPerSecond=50.0000000
		Texture=Texture'ExplosionTex.Framed.exp2_frames'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRadialRange=(Min=-50.0000000,Max=-50.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[1]=SpriteEmitter7
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathPRV.SpriteEmitter13'
	begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		MaxParticles=5
		DetailMode=1
		StartLocationShape=2
		StartLocationPolarRange=(X=(Min=0.0000000,Max=65536.0000000),Y=(Min=16384.0000000,Max=16384.0000000),Z=(Min=100.0000000,Max=150.0000000))
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=100.0000000,Max=150.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.4000000,Max=0.6000000)
		StartVelocityRadialRange=(Min=-50.0000000,Max=-80.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[2]=SpriteEmitter13
	// Reference: MeshEmitter'Onslaught.ONSVehDeathPRV.MeshEmitter6'
	begin object name="MeshEmitter6" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSDeadVehicles-SM.HELLbenderExploded.HellTire'
		UseMeshBlendMode=false
		UseParticleColor=true
		UseCollision=true
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		DampRotation=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
		DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.3000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=120.0000000,Y=96.0000000,Z=-32.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=300.0000000,Max=500.0000000),Z=(Min=100.0000000,Max=100.0000000))
	end object
	Emitters[3]=MeshEmitter6
	// Reference: MeshEmitter'Onslaught.ONSVehDeathPRV.MeshEmitter7'
	begin object name="MeshEmitter7" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSDeadVehicles-SM.HELLbenderExploded.HellTire'
		UseMeshBlendMode=false
		UseParticleColor=true
		UseCollision=true
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		DampRotation=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
		DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.3000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=120.0000000,Y=-96.0000000,Z=-32.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=150.0000000,Max=200.0000000),Y=(Min=-300.0000000,Max=-500.0000000),Z=(Min=100.0000000,Max=100.0000000))
	end object
	Emitters[4]=MeshEmitter7
	// Reference: MeshEmitter'Onslaught.ONSVehDeathPRV.MeshEmitter8'
	begin object name="MeshEmitter8" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSDeadVehicles-SM.HELLbenderExploded.HellTire'
		UseCollision=true
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		DampRotation=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
		DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.3000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=-140.0000000,Y=96.0000000,Z=-32.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-150.0000000,Max=-200.0000000),Y=(Min=300.0000000,Max=500.0000000),Z=(Min=50.0000000,Max=100.0000000))
	end object
	Emitters[5]=MeshEmitter8
	// Reference: MeshEmitter'Onslaught.ONSVehDeathPRV.MeshEmitter9'
	begin object name="MeshEmitter9" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSDeadVehicles-SM.HELLbenderExploded.HellTire'
		UseMeshBlendMode=false
		UseParticleColor=true
		UseCollision=true
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		DampRotation=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
		DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.3000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=-140.0000000,Y=-96.0000000,Z=-32.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-150.0000000,Max=-200.0000000),Y=(Min=-300.0000000,Max=-500.0000000),Z=(Min=100.0000000,Max=100.0000000))
	end object
	Emitters[6]=MeshEmitter9
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathPRV.SpriteEmitter38'
	begin object name="SpriteEmitter38" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		MaxParticles=5
		DetailMode=1
		AddLocationFromOtherEmitter=8
		StartLocationShape=1
		SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=50.0000000,Max=80.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=13.0000000
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[7]=SpriteEmitter38
	// Reference: MeshEmitter'Onslaught.ONSVehDeathPRV.MeshEmitter20'
	begin object name="MeshEmitter20" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSDeadVehicles-SM.HELLbenderExploded.HellDoor'
		UseCollision=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=1.0000000,Max=1.0000000))
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=0.0000000,Y=80.0000000,Z=30.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=2.0000000))
		StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=-1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		InitialParticlesPerSecond=500.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=500.0000000,Max=800.0000000),Z=(Min=50.0000000,Max=100.0000000))
	end object
	Emitters[8]=MeshEmitter20
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathPRV.SpriteEmitter49'
	begin object name="SpriteEmitter49" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		MaxParticles=5
		DetailMode=1
		AddLocationFromOtherEmitter=10
		StartLocationShape=1
		SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=50.0000000,Max=80.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=13.0000000
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[9]=SpriteEmitter49
	// Reference: MeshEmitter'Onslaught.ONSVehDeathPRV.MeshEmitter31'
	begin object name="MeshEmitter31" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSDeadVehicles-SM.HELLbenderExploded.HellDoor'
		UseCollision=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
		DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.3000000))
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=0.0000000,Y=-80.0000000,Z=30.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=2.0000000))
		StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=-1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		InitialParticlesPerSecond=500.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-500.0000000,Max=-800.0000000),Z=(Min=50.0000000,Max=100.0000000))
	end object
	Emitters[10]=MeshEmitter31
	// Reference: MeshEmitter'Onslaught.ONSVehDeathPRV.MeshEmitter33'
	begin object name="MeshEmitter33" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSDeadVehicles-SM.HELLbenderExploded.HellGun'
		UseMeshBlendMode=false
		UseParticleColor=true
		UseCollision=true
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-900.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=-180.0000000,Y=0.0000000,Z=80.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=2.0000000),Z=(Min=0.2000000,Max=1.0000000))
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
		StartVelocityRange=(X=(Min=-500.0000000,Max=-500.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=700.0000000,Max=800.0000000))
	end object
	Emitters[11]=MeshEmitter33
	// Reference: MeshEmitter'Onslaught.ONSVehDeathPRV.MeshEmitter5'
	begin object name="MeshEmitter5" class=Engine.MeshEmitter
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
		StartVelocityRadialRange=(Min=300.0000000,Max=800.0000000)
		VelocityLossRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
		GetVelocityDirectionFrom=3
	end object
	Emitters[12]=MeshEmitter5
	// Reference: MeshEmitter'Onslaught.ONSVehDeathPRV.MeshEmitter50'
	begin object name="MeshEmitter50" class=Engine.MeshEmitter
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
	Emitters[13]=MeshEmitter50
	AutoDestroy=true
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSVehDeathPRV.SpriteEmitter14'
begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=8))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=0,G=0,B=0,A=96))
	ColorScale[2]=(RelativeTime=0.5000000,Color=(R=0,G=0,B=0,A=96))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	DetailMode=1
	AddLocationFromOtherEmitter=1
	StartLocationShape=2
	StartLocationPolarRange=(X=(Min=0.0000000,Max=65536.0000000),Y=(Min=16384.0000000,Max=16384.0000000),Z=(Min=50.0000000,Max=150.0000000))
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Fire.MuchSmoke1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSVehDeathPRV.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	MaxParticles=5
	StartLocationShape=2
	StartLocationPolarRange=(X=(Min=0.0000000,Max=65536.0000000),Y=(Min=16384.0000000,Max=16384.0000000),Z=(Min=50.0000000,Max=100.0000000))
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
	InitialParticlesPerSecond=50.0000000
	Texture=Texture'ExplosionTex.Framed.exp2_frames'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRadialRange=(Min=-50.0000000,Max=-50.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'Onslaught.ONSVehDeathPRV.SpriteEmitter13'
begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	MaxParticles=5
	DetailMode=1
	StartLocationShape=2
	StartLocationPolarRange=(X=(Min=0.0000000,Max=65536.0000000),Y=(Min=16384.0000000,Max=16384.0000000),Z=(Min=100.0000000,Max=150.0000000))
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=100.0000000,Max=150.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.4000000,Max=0.6000000)
	StartVelocityRadialRange=(Min=-50.0000000,Max=-80.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathPRV.MeshEmitter6'
begin object name="MeshEmitter6" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.HELLbenderExploded.HellTire'
	UseMeshBlendMode=false
	UseParticleColor=true
	UseCollision=true
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	DampRotation=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
	DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.3000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=120.0000000,Y=96.0000000,Z=-32.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=300.0000000,Max=500.0000000),Z=(Min=100.0000000,Max=100.0000000))
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathPRV.MeshEmitter7'
begin object name="MeshEmitter7" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.HELLbenderExploded.HellTire'
	UseMeshBlendMode=false
	UseParticleColor=true
	UseCollision=true
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	DampRotation=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
	DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.3000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=120.0000000,Y=-96.0000000,Z=-32.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=150.0000000,Max=200.0000000),Y=(Min=-300.0000000,Max=-500.0000000),Z=(Min=100.0000000,Max=100.0000000))
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathPRV.MeshEmitter8'
begin object name="MeshEmitter8" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.HELLbenderExploded.HellTire'
	UseCollision=true
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	DampRotation=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
	DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.3000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=-140.0000000,Y=96.0000000,Z=-32.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-150.0000000,Max=-200.0000000),Y=(Min=300.0000000,Max=500.0000000),Z=(Min=50.0000000,Max=100.0000000))
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathPRV.MeshEmitter9'
begin object name="MeshEmitter9" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.HELLbenderExploded.HellTire'
	UseMeshBlendMode=false
	UseParticleColor=true
	UseCollision=true
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	DampRotation=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
	DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.3000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=-140.0000000,Y=-96.0000000,Z=-32.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-150.0000000,Max=-200.0000000),Y=(Min=-300.0000000,Max=-500.0000000),Z=(Min=100.0000000,Max=100.0000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSVehDeathPRV.SpriteEmitter38'
begin object name="SpriteEmitter38" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	MaxParticles=5
	DetailMode=1
	AddLocationFromOtherEmitter=8
	StartLocationShape=1
	SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=50.0000000,Max=80.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=13.0000000
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathPRV.MeshEmitter20'
begin object name="MeshEmitter20" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.HELLbenderExploded.HellDoor'
	UseCollision=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=1.0000000,Max=1.0000000))
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=0.0000000,Y=80.0000000,Z=30.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=2.0000000))
	StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=-1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	InitialParticlesPerSecond=500.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=500.0000000,Max=800.0000000),Z=(Min=50.0000000,Max=100.0000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSVehDeathPRV.SpriteEmitter49'
begin object name="SpriteEmitter49" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	MaxParticles=5
	DetailMode=1
	AddLocationFromOtherEmitter=10
	StartLocationShape=1
	SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=50.0000000,Max=80.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=13.0000000
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathPRV.MeshEmitter31'
begin object name="MeshEmitter31" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.HELLbenderExploded.HellDoor'
	UseCollision=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
	DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.3000000))
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=0.0000000,Y=-80.0000000,Z=30.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=2.0000000))
	StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=-1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	InitialParticlesPerSecond=500.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-500.0000000,Max=-800.0000000),Z=(Min=50.0000000,Max=100.0000000))
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathPRV.MeshEmitter33'
begin object name="MeshEmitter33" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.HELLbenderExploded.HellGun'
	UseMeshBlendMode=false
	UseParticleColor=true
	UseCollision=true
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-900.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=-180.0000000,Y=0.0000000,Z=80.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=2.0000000),Z=(Min=0.2000000,Max=1.0000000))
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
	StartVelocityRange=(X=(Min=-500.0000000,Max=-500.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=700.0000000,Max=800.0000000))
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathPRV.MeshEmitter5'
begin object name="MeshEmitter5" class=Engine.MeshEmitter
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
	StartVelocityRadialRange=(Min=300.0000000,Max=800.0000000)
	VelocityLossRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
	GetVelocityDirectionFrom=3
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathPRV.MeshEmitter50'
begin object name="MeshEmitter50" class=Engine.MeshEmitter
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
