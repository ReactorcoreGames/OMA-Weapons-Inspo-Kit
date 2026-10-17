class ONSVehDeathAttackCraft extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.3000000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.5000000
		MaxParticles=3
		DetailMode=2
		StartLocationRange=(X=(Min=0.0000000,Max=-80.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartLocationShape=3
		SphereRadiusRange=(Min=32.0000000,Max=32.0000000)
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
		InitialParticlesPerSecond=60000.0000000
		DrawStyle=1
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.0000000,Max=1.2000000)
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		MaxParticles=6
		StartLocationRange=(X=(Min=-100.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartLocationShape=3
		SphereRadiusRange=(Min=32.0000000,Max=32.0000000)
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		InitialParticlesPerSecond=4000.0000000
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.4000000,Max=0.6000000)
	end object
	Emitters[1]=SpriteEmitter0
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter16'
	begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		MaxParticles=4
		StartLocationRange=(X=(Min=50.0000000,Max=-200.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=20.0000000))
		SphereRadiusRange=(Min=32.0000000,Max=64.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'ExplosionTex.Framed.exp2_frames'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.6000000,Max=0.8000000)
		InitialDelayRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[2]=SpriteEmitter16
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.8500000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.5000000
		MaxParticles=5
		DetailMode=2
		AddLocationFromOtherEmitter=2
		StartLocationShape=1
		SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.8000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels2'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.6000000)
		InitialDelayRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[3]=SpriteEmitter3
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=0))
		ColorScale[1]=(RelativeTime=0.6000000,Color=(R=128,G=128,B=128,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=12
		DetailMode=2
		StartLocationRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
		AddLocationFromOtherEmitter=5
		StartLocationShape=1
		SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		InitialParticlesPerSecond=14.0000000
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.6000000)
		InitialDelayRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[4]=SpriteEmitter2
	// Reference: MeshEmitter'Onslaught.ONSVehDeathAttackCraft.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSDeadVehicles-SM.RAPTORexploded.RaptorWing'
		UseMeshBlendMode=false
		UseParticleColor=true
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=0))
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=0.0000000,Y=60.0000000,Z=38.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=0.0000000,Max=2.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		InitialDelayRange=(Min=0.2000000,Max=0.2000000)
		StartVelocityRadialRange=(Min=-300.0000000,Max=-800.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[5]=MeshEmitter0
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=0))
		ColorScale[1]=(RelativeTime=0.6000000,Color=(R=128,G=128,B=128,A=0))
		MaxParticles=12
		DetailMode=2
		StartLocationRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
		AddLocationFromOtherEmitter=8
		StartLocationShape=1
		SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.3000000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		InitialParticlesPerSecond=14.0000000
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.6000000)
		InitialDelayRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[6]=SpriteEmitter5
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.8500000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.5000000
		MaxParticles=5
		DetailMode=2
		AddLocationFromOtherEmitter=8
		StartLocationShape=1
		SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.8000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels2'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.6000000)
		InitialDelayRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[7]=SpriteEmitter4
	// Reference: MeshEmitter'Onslaught.ONSVehDeathAttackCraft.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSDeadVehicles-SM.RAPTORexploded.RaptorWing'
		UseMeshBlendMode=false
		UseParticleColor=true
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=0))
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=0.0000000,Y=-60.0000000,Z=38.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=0.0000000,Max=2.0000000))
		StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=-1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		InitialDelayRange=(Min=0.2000000,Max=0.2000000)
		StartVelocityRadialRange=(Min=-300.0000000,Max=-800.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[8]=MeshEmitter1
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.8500000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.5000000
		MaxParticles=5
		DetailMode=2
		AddLocationFromOtherEmitter=11
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.8000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels2'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.6000000)
		InitialDelayRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[9]=SpriteEmitter9
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=0))
		ColorScale[1]=(RelativeTime=0.6000000,Color=(R=128,G=128,B=128,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=12
		DetailMode=2
		StartLocationRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
		AddLocationFromOtherEmitter=11
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		InitialParticlesPerSecond=14.0000000
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.6000000)
		InitialDelayRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[10]=SpriteEmitter10
	// Reference: MeshEmitter'Onslaught.ONSVehDeathAttackCraft.MeshEmitter2'
	begin object name="MeshEmitter2" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSDeadVehicles-SM.RAPTORexploded.RaptorTailWing'
		UseMeshBlendMode=false
		UseParticleColor=true
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=-150.0000000,Y=40.0000000,Z=60.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=0.0000000,Max=2.0000000))
		StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=-1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		InitialDelayRange=(Min=0.2000000,Max=0.2000000)
		StartVelocityRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartVelocityRadialRange=(Min=-600.0000000,Max=-800.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[11]=MeshEmitter2
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter11'
	begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.8500000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.5000000
		MaxParticles=5
		DetailMode=2
		AddLocationFromOtherEmitter=14
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.8000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels2'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.6000000)
		InitialDelayRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[12]=SpriteEmitter11
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter12'
	begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=0))
		ColorScale[1]=(RelativeTime=0.6000000,Color=(R=128,G=128,B=128,A=0))
		MaxParticles=12
		DetailMode=2
		StartLocationRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
		AddLocationFromOtherEmitter=14
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.3000000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=14.0000000
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.6000000)
		InitialDelayRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[13]=SpriteEmitter12
	// Reference: MeshEmitter'Onslaught.ONSVehDeathAttackCraft.MeshEmitter3'
	begin object name="MeshEmitter3" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSDeadVehicles-SM.RAPTORexploded.RaptorTailWing'
		UseMeshBlendMode=false
		UseParticleColor=true
		UseColorScale=true
		RespawnDeadParticles=false
		AlphaTest=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=0))
		FadeOutStartTime=0.5000000
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=-150.0000000,Y=-40.0000000,Z=60.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=0.0000000,Max=2.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		InitialDelayRange=(Min=0.2000000,Max=0.2000000)
		StartVelocityRadialRange=(Min=-200.0000000,Max=-500.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[14]=MeshEmitter3
	// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		MaxParticles=28
		DetailMode=2
		AddLocationFromOtherEmitter=16
		StartLocationShape=1
		SphereRadiusRange=(Min=0.0000000,Max=6.0000000)
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=32.0000000
		Texture=Texture'ExplosionTex.Framed.exp2_frames'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.4000000,Max=0.5000000)
		InitialDelayRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[15]=SpriteEmitter8
	Emitters[16]=MeshEmitter'Onslaught.ONSPRVComboEffect.MeshEmitter5'
	// Reference: MeshEmitter'Onslaught.ONSVehDeathAttackCraft.MeshEmitter5'
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
		InitialDelayRange=(Min=0.1500000,Max=0.1500000)
		StartVelocityRadialRange=(Min=300.0000000,Max=800.0000000)
		VelocityLossRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
		GetVelocityDirectionFrom=3
	end object
	Emitters[17]=MeshEmitter5
	// Reference: MeshEmitter'Onslaught.ONSVehDeathAttackCraft.MeshEmitter6'
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
		InitialDelayRange=(Min=0.1500000,Max=0.1500000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=100.0000000,Max=300.0000000))
		StartVelocityRadialRange=(Min=300.0000000,Max=800.0000000)
		VelocityLossRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
		GetVelocityDirectionFrom=3
	end object
	Emitters[18]=MeshEmitter6
	AutoDestroy=true
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.3000000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.5000000
	MaxParticles=3
	DetailMode=2
	StartLocationRange=(X=(Min=0.0000000,Max=-80.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartLocationShape=3
	SphereRadiusRange=(Min=32.0000000,Max=32.0000000)
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
	InitialParticlesPerSecond=60000.0000000
	DrawStyle=1
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.0000000,Max=1.2000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	MaxParticles=6
	StartLocationRange=(X=(Min=-100.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartLocationShape=3
	SphereRadiusRange=(Min=32.0000000,Max=32.0000000)
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	InitialParticlesPerSecond=4000.0000000
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.4000000,Max=0.6000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter16'
begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	MaxParticles=4
	StartLocationRange=(X=(Min=50.0000000,Max=-200.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=20.0000000))
	SphereRadiusRange=(Min=32.0000000,Max=64.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'ExplosionTex.Framed.exp2_frames'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.6000000,Max=0.8000000)
	InitialDelayRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.8500000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.5000000
	MaxParticles=5
	DetailMode=2
	AddLocationFromOtherEmitter=2
	StartLocationShape=1
	SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.8000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels2'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.6000000)
	InitialDelayRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=0))
	ColorScale[1]=(RelativeTime=0.6000000,Color=(R=128,G=128,B=128,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=12
	DetailMode=2
	StartLocationRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
	AddLocationFromOtherEmitter=5
	StartLocationShape=1
	SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	InitialParticlesPerSecond=14.0000000
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.6000000)
	InitialDelayRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathAttackCraft.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.RAPTORexploded.RaptorWing'
	UseMeshBlendMode=false
	UseParticleColor=true
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=0))
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=0.0000000,Y=60.0000000,Z=38.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=0.0000000,Max=2.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	InitialDelayRange=(Min=0.2000000,Max=0.2000000)
	StartVelocityRadialRange=(Min=-300.0000000,Max=-800.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=0))
	ColorScale[1]=(RelativeTime=0.6000000,Color=(R=128,G=128,B=128,A=0))
	MaxParticles=12
	DetailMode=2
	StartLocationRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
	AddLocationFromOtherEmitter=8
	StartLocationShape=1
	SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.3000000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	InitialParticlesPerSecond=14.0000000
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.6000000)
	InitialDelayRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.8500000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.5000000
	MaxParticles=5
	DetailMode=2
	AddLocationFromOtherEmitter=8
	StartLocationShape=1
	SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.8000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels2'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.6000000)
	InitialDelayRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathAttackCraft.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.RAPTORexploded.RaptorWing'
	UseMeshBlendMode=false
	UseParticleColor=true
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=0))
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=0.0000000,Y=-60.0000000,Z=38.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=0.0000000,Max=2.0000000))
	StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=-1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	InitialDelayRange=(Min=0.2000000,Max=0.2000000)
	StartVelocityRadialRange=(Min=-300.0000000,Max=-800.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.8500000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.5000000
	MaxParticles=5
	DetailMode=2
	AddLocationFromOtherEmitter=11
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.8000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels2'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.6000000)
	InitialDelayRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=0))
	ColorScale[1]=(RelativeTime=0.6000000,Color=(R=128,G=128,B=128,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=12
	DetailMode=2
	StartLocationRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
	AddLocationFromOtherEmitter=11
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	InitialParticlesPerSecond=14.0000000
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.6000000)
	InitialDelayRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathAttackCraft.MeshEmitter2'
begin object name="MeshEmitter2" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.RAPTORexploded.RaptorTailWing'
	UseMeshBlendMode=false
	UseParticleColor=true
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=-150.0000000,Y=40.0000000,Z=60.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=0.0000000,Max=2.0000000))
	StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=-1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	InitialDelayRange=(Min=0.2000000,Max=0.2000000)
	StartVelocityRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartVelocityRadialRange=(Min=-600.0000000,Max=-800.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter11'
begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.8500000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.5000000
	MaxParticles=5
	DetailMode=2
	AddLocationFromOtherEmitter=14
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.8000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels2'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.6000000)
	InitialDelayRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter12'
begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=0))
	ColorScale[1]=(RelativeTime=0.6000000,Color=(R=128,G=128,B=128,A=0))
	MaxParticles=12
	DetailMode=2
	StartLocationRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
	AddLocationFromOtherEmitter=14
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.3000000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=14.0000000
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.6000000)
	InitialDelayRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathAttackCraft.MeshEmitter3'
begin object name="MeshEmitter3" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.RAPTORexploded.RaptorTailWing'
	UseMeshBlendMode=false
	UseParticleColor=true
	UseColorScale=true
	RespawnDeadParticles=false
	AlphaTest=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=0))
	FadeOutStartTime=0.5000000
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=-150.0000000,Y=-40.0000000,Z=60.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=0.0000000,Max=2.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	InitialDelayRange=(Min=0.2000000,Max=0.2000000)
	StartVelocityRadialRange=(Min=-200.0000000,Max=-500.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'Onslaught.ONSVehDeathAttackCraft.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	MaxParticles=28
	DetailMode=2
	AddLocationFromOtherEmitter=16
	StartLocationShape=1
	SphereRadiusRange=(Min=0.0000000,Max=6.0000000)
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=32.0000000
	Texture=Texture'ExplosionTex.Framed.exp2_frames'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.4000000,Max=0.5000000)
	InitialDelayRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathAttackCraft.MeshEmitter5'
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
	InitialDelayRange=(Min=0.1500000,Max=0.1500000)
	StartVelocityRadialRange=(Min=300.0000000,Max=800.0000000)
	VelocityLossRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
	GetVelocityDirectionFrom=3
end object
// Reference: MeshEmitter'Onslaught.ONSVehDeathAttackCraft.MeshEmitter6'
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
	InitialDelayRange=(Min=0.1500000,Max=0.1500000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=100.0000000,Max=300.0000000))
	StartVelocityRadialRange=(Min=300.0000000,Max=800.0000000)
	VelocityLossRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
	GetVelocityDirectionFrom=3
end object
