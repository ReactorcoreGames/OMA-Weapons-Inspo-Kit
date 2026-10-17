class ONSPRVRearGunCharge extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'Onslaught.ONSPRVRearGunCharge.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=50,G=50,B=50,A=0))
		ColorScale[1]=(RelativeTime=0.3000000,Color=(R=0,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=0.5000000,Color=(R=128,G=128,B=255,A=255))
		ColorScale[3]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=255,A=0))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=0.0000000,Y=12.0000000,Z=0.0000000)
		StartLocationShape=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=6
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
	end object
	Emitters[0]=SpriteEmitter4
	// Reference: SpriteEmitter'Onslaught.ONSPRVRearGunCharge.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=128,G=128,B=255,A=0))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=128,G=150,B=255,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=8
		StartLocationOffset=(X=0.0000000,Y=12.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=8.0000000
		Texture=Texture'AW-2004Particles.Energy.BurnFlare'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[1]=SpriteEmitter5
	// Reference: SpriteEmitter'Onslaught.ONSPRVRearGunCharge.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorMultiplierRange=(X=(Min=0.3000000,Max=0.4000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=1.0000000,Max=1.0000000))
		CoordinateSystem=1
		MaxParticles=100
		StartLocationShape=2
		StartLocationPolarRange=(X=(Min=-8192.0000000,Max=8192.0000000),Y=(Min=8192.0000000,Max=24576.0000000),Z=(Min=80.0000000,Max=80.0000000))
		StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=5.0000000,Max=5.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=100.0000000
		Texture=Texture'AW-2004Particles.Energy.SparkHead'
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
		StartVelocityRadialRange=(Min=-100.0000000,Max=-100.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[2]=SpriteEmitter6
	// Reference: SpriteEmitter'Onslaught.ONSPRVRearGunCharge.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=128,G=128,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=255,A=0))
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=0.0000000,Y=12.0000000,Z=0.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=2000.0000000
		DrawStyle=6
		Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
		LifetimeRange=(Min=0.0500000,Max=0.0500000)
		InitialDelayRange=(Min=1.5000000,Max=1.5000000)
	end object
	Emitters[3]=SpriteEmitter8
	// Reference: SpriteEmitter'Onslaught.ONSPRVRearGunCharge.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=128,G=128,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=255,A=0))
		CoordinateSystem=1
		MaxParticles=3
		StartLocationOffset=(X=0.0000000,Y=12.0000000,Z=0.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=2000.0000000
		DrawStyle=6
		Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		InitialDelayRange=(Min=1.5000000,Max=1.5000000)
	end object
	Emitters[4]=SpriteEmitter9
	// Reference: BeamEmitter'Onslaught.ONSPRVRearGunCharge.BeamEmitter1'
	begin object name="BeamEmitter1" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=60.0000000,Max=60.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		HighFrequencyNoiseRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
		UseColorScale=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=4
		StartLocationOffset=(X=-5.0000000,Y=12.0000000,Z=0.0000000)
		StartLocationShape=1
		SphereRadiusRange=(Min=4.0000000,Max=4.0000000)
		UseRotationFrom=3
		StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		InitialDelayRange=(Min=1.2500000,Max=1.2500000)
		StartVelocityRange=(X=(Min=-1.0000000,Max=-1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0500000,Max=0.0500000))
	end object
	Emitters[5]=BeamEmitter1
	// Reference: SpriteEmitter'Onslaught.ONSPRVRearGunCharge.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=50,G=50,B=50,A=0))
		ColorScale[1]=(RelativeTime=0.3000000,Color=(R=0,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=0.5000000,Color=(R=128,G=128,B=255,A=255))
		ColorScale[3]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=255,A=0))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=0.0000000,Y=-12.0000000,Z=0.0000000)
		StartLocationShape=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=6
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
	end object
	Emitters[6]=SpriteEmitter0
	// Reference: SpriteEmitter'Onslaught.ONSPRVRearGunCharge.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=128,G=128,B=255,A=0))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=128,G=150,B=255,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=8
		StartLocationOffset=(X=0.0000000,Y=-12.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=8.0000000
		Texture=Texture'AW-2004Particles.Energy.BurnFlare'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[7]=SpriteEmitter1
	// Reference: SpriteEmitter'Onslaught.ONSPRVRearGunCharge.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=128,G=128,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=255,A=0))
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=0.0000000,Y=-12.0000000,Z=0.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=2000.0000000
		DrawStyle=6
		Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		InitialDelayRange=(Min=1.5000000,Max=1.5000000)
	end object
	Emitters[8]=SpriteEmitter3
	// Reference: SpriteEmitter'Onslaught.ONSPRVRearGunCharge.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=128,G=128,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=255,A=0))
		CoordinateSystem=1
		MaxParticles=3
		StartLocationOffset=(X=0.0000000,Y=-12.0000000,Z=0.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=2000.0000000
		DrawStyle=6
		Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		InitialDelayRange=(Min=1.5000000,Max=1.5000000)
	end object
	Emitters[9]=SpriteEmitter7
	// Reference: BeamEmitter'Onslaught.ONSPRVRearGunCharge.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=60.0000000,Max=60.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		HighFrequencyNoiseRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
		UseColorScale=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=4
		StartLocationOffset=(X=-5.0000000,Y=-12.0000000,Z=0.0000000)
		StartLocationShape=1
		SphereRadiusRange=(Min=4.0000000,Max=4.0000000)
		UseRotationFrom=3
		StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		InitialDelayRange=(Min=1.2500000,Max=1.2500000)
		StartVelocityRange=(X=(Min=-1.0000000,Max=-1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0500000,Max=0.0500000))
	end object
	Emitters[10]=BeamEmitter0
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSPRVRearGunCharge.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=50,G=50,B=50,A=0))
	ColorScale[1]=(RelativeTime=0.3000000,Color=(R=0,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=0.5000000,Color=(R=128,G=128,B=255,A=255))
	ColorScale[3]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=255,A=0))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=0.0000000,Y=12.0000000,Z=0.0000000)
	StartLocationShape=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=6
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSPRVRearGunCharge.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=128,G=128,B=255,A=0))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=128,G=150,B=255,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=8
	StartLocationOffset=(X=0.0000000,Y=12.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=8.0000000
	Texture=Texture'AW-2004Particles.Energy.BurnFlare'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSPRVRearGunCharge.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorMultiplierRange=(X=(Min=0.3000000,Max=0.4000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=1.0000000,Max=1.0000000))
	CoordinateSystem=1
	MaxParticles=100
	StartLocationShape=2
	StartLocationPolarRange=(X=(Min=-8192.0000000,Max=8192.0000000),Y=(Min=8192.0000000,Max=24576.0000000),Z=(Min=80.0000000,Max=80.0000000))
	StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=5.0000000,Max=5.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=100.0000000
	Texture=Texture'AW-2004Particles.Energy.SparkHead'
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
	StartVelocityRadialRange=(Min=-100.0000000,Max=-100.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'Onslaught.ONSPRVRearGunCharge.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=128,G=128,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=255,A=0))
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=0.0000000,Y=12.0000000,Z=0.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=2000.0000000
	DrawStyle=6
	Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
	LifetimeRange=(Min=0.0500000,Max=0.0500000)
	InitialDelayRange=(Min=1.5000000,Max=1.5000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSPRVRearGunCharge.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=128,G=128,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=255,A=0))
	CoordinateSystem=1
	MaxParticles=3
	StartLocationOffset=(X=0.0000000,Y=12.0000000,Z=0.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=2000.0000000
	DrawStyle=6
	Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	InitialDelayRange=(Min=1.5000000,Max=1.5000000)
end object
// Reference: BeamEmitter'Onslaught.ONSPRVRearGunCharge.BeamEmitter1'
begin object name="BeamEmitter1" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=60.0000000,Max=60.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	HighFrequencyNoiseRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
	UseColorScale=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=4
	StartLocationOffset=(X=-5.0000000,Y=12.0000000,Z=0.0000000)
	StartLocationShape=1
	SphereRadiusRange=(Min=4.0000000,Max=4.0000000)
	UseRotationFrom=3
	StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	InitialDelayRange=(Min=1.2500000,Max=1.2500000)
	StartVelocityRange=(X=(Min=-1.0000000,Max=-1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0500000,Max=0.0500000))
end object
// Reference: SpriteEmitter'Onslaught.ONSPRVRearGunCharge.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=50,G=50,B=50,A=0))
	ColorScale[1]=(RelativeTime=0.3000000,Color=(R=0,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=0.5000000,Color=(R=128,G=128,B=255,A=255))
	ColorScale[3]=(RelativeTime=0.8500000,Color=(R=128,G=128,B=255,A=0))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=0.0000000,Y=-12.0000000,Z=0.0000000)
	StartLocationShape=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=6
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSPRVRearGunCharge.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=128,G=128,B=255,A=0))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=128,G=150,B=255,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=8
	StartLocationOffset=(X=0.0000000,Y=-12.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=8.0000000
	Texture=Texture'AW-2004Particles.Energy.BurnFlare'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSPRVRearGunCharge.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=128,G=128,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=255,A=0))
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=0.0000000,Y=-12.0000000,Z=0.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=2000.0000000
	DrawStyle=6
	Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	InitialDelayRange=(Min=1.5000000,Max=1.5000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSPRVRearGunCharge.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=128,G=128,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=255,A=0))
	CoordinateSystem=1
	MaxParticles=3
	StartLocationOffset=(X=0.0000000,Y=-12.0000000,Z=0.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=2000.0000000
	DrawStyle=6
	Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	InitialDelayRange=(Min=1.5000000,Max=1.5000000)
end object
// Reference: BeamEmitter'Onslaught.ONSPRVRearGunCharge.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=60.0000000,Max=60.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	HighFrequencyNoiseRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
	UseColorScale=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=4
	StartLocationOffset=(X=-5.0000000,Y=-12.0000000,Z=0.0000000)
	StartLocationShape=1
	SphereRadiusRange=(Min=4.0000000,Max=4.0000000)
	UseRotationFrom=3
	StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	InitialDelayRange=(Min=1.2500000,Max=1.2500000)
	StartVelocityRange=(X=(Min=-1.0000000,Max=-1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0500000,Max=0.0500000))
end object
