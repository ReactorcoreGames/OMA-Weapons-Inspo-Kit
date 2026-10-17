class ONSVehDeathRV extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathRV.SpriteEmitter20'
	begin object name="SpriteEmitter20" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.4000000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=6
		DetailMode=1
		StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-64.0000000,Max=64.0000000))
		AddLocationFromOtherEmitter=1
		StartLocationShape=1
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		Texture=Texture'ExplosionTex.Framed.SmokeReOrdered'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.6000000,Max=0.8000000)
		InitialDelayRange=(Min=0.1000000,Max=0.1000000)
		AddVelocityFromOtherEmitter=1
	end object
	Emitters[0]=SpriteEmitter20
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathRV.SpriteEmitter15'
	begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		MaxParticles=20
		StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-32.0000000,Max=32.0000000))
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		InitialParticlesPerSecond=100.0000000
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.4000000,Max=0.6000000)
		StartVelocityRadialRange=(Min=-50.0000000,Max=-100.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[1]=SpriteEmitter15
	// Reference: MeshEmitter'Onslaught.ONSVehDeathRV.MeshEmitter17'
	begin object name="MeshEmitter17" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSDeadVehicles-SM.RVexploded.RVgun'
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=-64.0000000,Y=0.0000000,Z=48.0000000)
		UseRotationFrom=1
		SpinCCWorCW=(X=0.5000000,Y=0.0000000,Z=0.5000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=0.0000000))
		InitialParticlesPerSecond=5000.0000000
		LifetimeRange=(Min=1.5000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-100.0000000,Max=-200.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=500.0000000,Max=800.0000000))
	end object
	Emitters[2]=MeshEmitter17
	// Reference: MeshEmitter'Onslaught.ONSVehDeathRV.MeshEmitter18'
	begin object name="MeshEmitter18" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSDeadVehicles-SM.RVexploded.RVrail'
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=0.0000000,Y=-20.0000000,Z=16.0000000)
		UseRotationFrom=1
		SpinCCWorCW=(X=0.5000000,Y=0.5000000,Z=1.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.1000000),Z=(Min=1.0000000,Max=2.0000000))
		InitialParticlesPerSecond=5000.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-300.0000000,Max=-400.0000000),Z=(Min=400.0000000,Max=500.0000000))
	end object
	Emitters[3]=MeshEmitter18
	// Reference: MeshEmitter'Onslaught.ONSVehDeathRV.MeshEmitter21'
	begin object name="MeshEmitter21" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSDeadVehicles-SM.RVexploded.RVrail'
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=0.0000000,Y=20.0000000,Z=16.0000000)
		UseRotationFrom=1
		SpinCCWorCW=(X=0.5000000,Y=0.5000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.1000000),Z=(Min=1.0000000,Max=2.0000000))
		StartSizeRange=(X=(Min=-1.0000000,Max=-1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		InitialParticlesPerSecond=5000.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=300.0000000,Max=400.0000000),Z=(Min=200.0000000,Max=300.0000000))
	end object
	Emitters[4]=MeshEmitter21
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathRV.SpriteEmitter28'
	begin object name="SpriteEmitter28" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=5
		DetailMode=2
		AddLocationFromOtherEmitter=6
		StartLocationShape=1
		SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=6.5000000
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[5]=SpriteEmitter28
	// Reference: MeshEmitter'Onslaught.ONSVehDeathRV.MeshEmitter22'
	begin object name="MeshEmitter22" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSDeadVehicles-SM.RVexploded.Rvtire'
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
		StartLocationOffset=(X=80.0000000,Y=64.0000000,Z=-32.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=300.0000000,Max=500.0000000),Y=(Min=300.0000000,Max=500.0000000),Z=(Min=100.0000000,Max=100.0000000))
	end object
	Emitters[6]=MeshEmitter22
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathRV.SpriteEmitter30'
	begin object name="SpriteEmitter30" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		MaxParticles=5
		DetailMode=2
		AddLocationFromOtherEmitter=8
		StartLocationShape=1
		SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=6.5000000
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[7]=SpriteEmitter30
	// Reference: MeshEmitter'Onslaught.ONSVehDeathRV.MeshEmitter23'
	begin object name="MeshEmitter23" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSDeadVehicles-SM.RVexploded.Rvtire'
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
		StartLocationOffset=(X=80.0000000,Y=-64.0000000,Z=-32.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=200.0000000,Max=300.0000000),Y=(Min=-300.0000000,Max=-500.0000000),Z=(Min=100.0000000,Max=100.0000000))
	end object
	Emitters[8]=MeshEmitter23
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathRV.SpriteEmitter31'
	begin object name="SpriteEmitter31" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		MaxParticles=5
		DetailMode=2
		AddLocationFromOtherEmitter=10
		StartLocationShape=1
		SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=6.5000000
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[9]=SpriteEmitter31
	// Reference: MeshEmitter'Onslaught.ONSVehDeathRV.MeshEmitter24'
	begin object name="MeshEmitter24" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSDeadVehicles-SM.RVexploded.Rvtire'
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
		StartLocationOffset=(X=-80.0000000,Y=64.0000000,Z=-32.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-300.0000000,Max=-400.0000000),Y=(Min=300.0000000,Max=500.0000000),Z=(Min=50.0000000,Max=100.0000000))
	end object
	Emitters[10]=MeshEmitter24
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathRV.SpriteEmitter32'
	begin object name="SpriteEmitter32" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		MaxParticles=5
		DetailMode=2
		AddLocationFromOtherEmitter=12
		StartLocationShape=1
		SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=6.5000000
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[11]=SpriteEmitter32
	// Reference: MeshEmitter'Onslaught.ONSVehDeathRV.MeshEmitter25'
	begin object name="MeshEmitter25" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSDeadVehicles-SM.RVexploded.Rvtire'
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
		StartLocationOffset=(X=-80.0000000,Y=-64.0000000,Z=-32.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-200.0000000,Max=-300.0000000),Y=(Min=-300.0000000,Max=-500.0000000),Z=(Min=100.0000000,Max=100.0000000))
	end object
	Emitters[12]=MeshEmitter25
	// Reference: MeshEmitter'Onslaught.ONSVehDeathRV.MeshEmitter5'
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
	Emitters[13]=MeshEmitter5
	// Reference: MeshEmitter'Onslaught.ONSVehDeathRV.MeshEmitter6'
	begin object name="MeshEmitter6" class=Engine.MeshEmitter
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
	Emitters[14]=MeshEmitter6
	AutoDestroy=true
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSVehDeathRV.SpriteEmitter20'
begin object name="SpriteEmitter20" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.4000000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=6
	DetailMode=1
	StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-64.0000000,Max=64.0000000))
	AddLocationFromOtherEmitter=1
	StartLocationShape=1
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	Texture=Texture'ExplosionTex.Framed.SmokeReOrdered'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.6000000,Max=0.8000000)
	InitialDelayRange=(Min=0.1000000,Max=0.1000000)
	AddVelocityFromOtherEmitter=1
end object
// Reference: SpriteEmitter'Onslaught.ONSVehDeathRV.SpriteEmitter15'
begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	MaxParticles=20
	StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-32.0000000,Max=32.0000000))
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	InitialParticlesPerSecond=100.0000000
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.4000000,Max=0.6000000)
	StartVelocityRadialRange=(Min=-50.0000000,Max=-100.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathRV.MeshEmitter17'
begin object name="MeshEmitter17" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.RVexploded.RVgun'
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=-64.0000000,Y=0.0000000,Z=48.0000000)
	UseRotationFrom=1
	SpinCCWorCW=(X=0.5000000,Y=0.0000000,Z=0.5000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=0.0000000))
	InitialParticlesPerSecond=5000.0000000
	LifetimeRange=(Min=1.5000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-100.0000000,Max=-200.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=500.0000000,Max=800.0000000))
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathRV.MeshEmitter18'
begin object name="MeshEmitter18" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.RVexploded.RVrail'
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=0.0000000,Y=-20.0000000,Z=16.0000000)
	UseRotationFrom=1
	SpinCCWorCW=(X=0.5000000,Y=0.5000000,Z=1.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.1000000),Z=(Min=1.0000000,Max=2.0000000))
	InitialParticlesPerSecond=5000.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-300.0000000,Max=-400.0000000),Z=(Min=400.0000000,Max=500.0000000))
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathRV.MeshEmitter21'
begin object name="MeshEmitter21" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.RVexploded.RVrail'
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=0.0000000,Y=20.0000000,Z=16.0000000)
	UseRotationFrom=1
	SpinCCWorCW=(X=0.5000000,Y=0.5000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.1000000),Z=(Min=1.0000000,Max=2.0000000))
	StartSizeRange=(X=(Min=-1.0000000,Max=-1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	InitialParticlesPerSecond=5000.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=300.0000000,Max=400.0000000),Z=(Min=200.0000000,Max=300.0000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSVehDeathRV.SpriteEmitter28'
begin object name="SpriteEmitter28" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=5
	DetailMode=2
	AddLocationFromOtherEmitter=6
	StartLocationShape=1
	SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=6.5000000
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathRV.MeshEmitter22'
begin object name="MeshEmitter22" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.RVexploded.Rvtire'
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
	StartLocationOffset=(X=80.0000000,Y=64.0000000,Z=-32.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=300.0000000,Max=500.0000000),Y=(Min=300.0000000,Max=500.0000000),Z=(Min=100.0000000,Max=100.0000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSVehDeathRV.SpriteEmitter30'
begin object name="SpriteEmitter30" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	MaxParticles=5
	DetailMode=2
	AddLocationFromOtherEmitter=8
	StartLocationShape=1
	SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=6.5000000
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathRV.MeshEmitter23'
begin object name="MeshEmitter23" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.RVexploded.Rvtire'
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
	StartLocationOffset=(X=80.0000000,Y=-64.0000000,Z=-32.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=200.0000000,Max=300.0000000),Y=(Min=-300.0000000,Max=-500.0000000),Z=(Min=100.0000000,Max=100.0000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSVehDeathRV.SpriteEmitter31'
begin object name="SpriteEmitter31" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	MaxParticles=5
	DetailMode=2
	AddLocationFromOtherEmitter=10
	StartLocationShape=1
	SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=6.5000000
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathRV.MeshEmitter24'
begin object name="MeshEmitter24" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.RVexploded.Rvtire'
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
	StartLocationOffset=(X=-80.0000000,Y=64.0000000,Z=-32.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-300.0000000,Max=-400.0000000),Y=(Min=300.0000000,Max=500.0000000),Z=(Min=50.0000000,Max=100.0000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSVehDeathRV.SpriteEmitter32'
begin object name="SpriteEmitter32" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	MaxParticles=5
	DetailMode=2
	AddLocationFromOtherEmitter=12
	StartLocationShape=1
	SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=6.5000000
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathRV.MeshEmitter25'
begin object name="MeshEmitter25" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.RVexploded.Rvtire'
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
	StartLocationOffset=(X=-80.0000000,Y=-64.0000000,Z=-32.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.3000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-200.0000000,Max=-300.0000000),Y=(Min=-300.0000000,Max=-500.0000000),Z=(Min=100.0000000,Max=100.0000000))
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathRV.MeshEmitter5'
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
// Reference: MeshEmitter'Onslaught.ONSVehDeathRV.MeshEmitter6'
begin object name="MeshEmitter6" class=Engine.MeshEmitter
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
