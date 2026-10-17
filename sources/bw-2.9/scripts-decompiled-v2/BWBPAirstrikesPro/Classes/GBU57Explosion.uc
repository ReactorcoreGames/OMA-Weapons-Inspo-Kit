class GBU57Explosion extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter25'
	begin object name="SpriteEmitter25" class=Engine.SpriteEmitter
		UseCollision=true
		UseMaxCollisions=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-2400.0000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		MaxCollisions=(Min=6.0000000,Max=6.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=3.5000000
		MaxParticles=60
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
		InitialParticlesPerSecond=1000.0000000
		DrawStyle=1
		Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=4.0000000,Max=6.0000000)
		StartVelocityRange=(X=(Min=-3000.0000000,Max=3000.0000000),Y=(Min=-3000.0000000,Max=3000.0000000),Z=(Min=600.0000000,Max=5400.0000000))
	end object
	Emitters[0]=SpriteEmitter25
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter69'
	begin object name="SpriteEmitter69" class=Engine.SpriteEmitter
		UseDirectionAs=1
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ScaleSizeYByVelocity=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.1000000
		FadeInEndTime=0.1000000
		MaxParticles=80
		DetailMode=1
		AddLocationFromOtherEmitter=0
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=12.0000000)
		StartSizeRange=(X=(Min=12.0000000,Max=24.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
		ScaleSizeByVelocityMultiplier=(X=0.1500000,Y=0.1500000,Z=0.1500000)
		InitialParticlesPerSecond=150.0000000
		DrawStyle=5
		Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
		LifetimeRange=(Min=3.0000000,Max=1.0000000)
		InitialDelayRange=(Min=0.5000000,Max=0.5000000)
		VelocityLossRange=(X=(Min=0.9000000,Max=0.9000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.9000000,Max=0.9000000))
		AddVelocityFromOtherEmitter=0
		AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
	end object
	Emitters[1]=SpriteEmitter69
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter70'
	begin object name="SpriteEmitter70" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-1800.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=3.5000000
		MaxParticles=75
		DetailMode=1
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=6.0000000,Max=75.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
		InitialParticlesPerSecond=1000.0000000
		DrawStyle=1
		Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		StartVelocityRange=(X=(Min=-1200.0000000,Max=1200.0000000),Y=(Min=-1200.0000000,Max=1200.0000000),Z=(Min=300.0000000,Max=4800.0000000))
	end object
	Emitters[2]=SpriteEmitter70
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter71'
	begin object name="SpriteEmitter71" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=205,G=180,B=155,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=205,G=180,B=155,A=255))
		FadeOutStartTime=1.0000000
		FadeInEndTime=0.1000000
		CoordinateSystem=1
		MaxParticles=4
		StartLocationRange=(X=(Min=-600.0000000,Max=600.0000000),Y=(Min=-600.0000000,Max=600.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartLocationShape=2
		StartLocationPolarRange=(X=(Min=-128.0000000,Max=128.0000000),Y=(Min=-128.0000000,Max=128.0000000),Z=(Min=0.0000000,Max=0.0000000))
		AlphaRef=4
		SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
		StartSizeRange=(X=(Min=150.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
		InitialParticlesPerSecond=1000.0000000
		DrawStyle=1
		Texture=Texture'BenTex01.textures.SmokePuff01'
		LifetimeRange=(Min=6.5000000,Max=7.0000000)
		InitialDelayRange=(Min=0.0000000,Max=0.1000000)
		StartVelocityRange=(X=(Min=-1800.0000000,Max=1800.0000000),Y=(Min=-1800.0000000,Max=1800.0000000),Z=(Min=0.0000000,Max=150.0000000))
		StartVelocityRadialRange=(Min=100.0000000,Max=200.0000000)
		VelocityLossRange=(X=(Min=1.0000000,Max=3.0000000),Y=(Min=1.0000000,Max=3.0000000),Z=(Min=0.0000000,Max=0.0000000))
		RotateVelocityLossRange=true
		GetVelocityDirectionFrom=3
	end object
	Emitters[3]=SpriteEmitter71
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter72'
	begin object name="SpriteEmitter72" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=205,G=180,B=155,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=205,G=180,B=155,A=255))
		FadeOutStartTime=1.0000000
		FadeInEndTime=0.1000000
		CoordinateSystem=1
		MaxParticles=5
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-96.0000000,Max=384.0000000))
		AlphaRef=4
		SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=12.0000000)
		StartSizeRange=(X=(Min=90.0000000,Max=180.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		Texture=Texture'BenTex01.textures.SmokePuff01'
		LifetimeRange=(Min=6.5000000,Max=7.0000000)
		StartVelocityRange=(X=(Min=-300.0000000,Max=300.0000000),Y=(Min=-300.0000000,Max=300.0000000),Z=(Min=150.0000000,Max=4200.0000000))
		VelocityLossRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
		RotateVelocityLossRange=true
	end object
	Emitters[4]=SpriteEmitter72
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter73'
	begin object name="SpriteEmitter73" class=Engine.SpriteEmitter
		UseCollision=true
		UseMaxCollisions=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-7200.0000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		MaxCollisions=(Min=6.0000000,Max=6.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=3.5000000
		MaxParticles=50
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=90.0000000,Max=90.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
		InitialParticlesPerSecond=1000.0000000
		DrawStyle=1
		Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=4.0000000,Max=6.0000000)
		StartVelocityRange=(X=(Min=-9000.0000000,Max=9000.0000000),Y=(Min=-9000.0000000,Max=9000.0000000),Z=(Min=1800.0000000,Max=16200.0000000))
	end object
	Emitters[5]=SpriteEmitter73
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter74'
	begin object name="SpriteEmitter74" class=Engine.SpriteEmitter
		UseDirectionAs=1
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ScaleSizeYByVelocity=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.1000000
		FadeInEndTime=0.1000000
		MaxParticles=80
		DetailMode=1
		AddLocationFromOtherEmitter=5
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=7.0000000)
		StartSizeRange=(X=(Min=36.0000000,Max=72.0000000),Y=(Min=900.0000000,Max=900.0000000),Z=(Min=900.0000000,Max=900.0000000))
		ScaleSizeByVelocityMultiplier=(X=0.1500000,Y=0.1500000,Z=0.1500000)
		InitialParticlesPerSecond=150.0000000
		DrawStyle=5
		Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
		LifetimeRange=(Min=3.0000000,Max=1.0000000)
		InitialDelayRange=(Min=0.5000000,Max=0.5000000)
		VelocityLossRange=(X=(Min=0.9000000,Max=0.9000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.9000000,Max=0.9000000))
		AddVelocityFromOtherEmitter=5
		AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
	end object
	Emitters[6]=SpriteEmitter74
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter75'
	begin object name="SpriteEmitter75" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-2700.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=3.5000000
		MaxParticles=150
		DetailMode=1
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=20.5000000,Max=50.5000000),Y=(Min=20.5000000,Max=50.5000000),Z=(Min=20.5000000,Max=50.5000000))
		InitialParticlesPerSecond=1000.0000000
		DrawStyle=1
		Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		StartVelocityRange=(X=(Min=-1800.0000000,Max=1800.0000000),Y=(Min=-1800.0000000,Max=1800.0000000),Z=(Min=450.0000000,Max=7200.0000000))
	end object
	Emitters[7]=SpriteEmitter75
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter76'
	begin object name="SpriteEmitter76" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=205,G=180,B=155,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=205,G=180,B=155,A=255))
		FadeOutStartTime=1.0000000
		FadeInEndTime=0.1000000
		CoordinateSystem=1
		MaxParticles=4
		StartLocationRange=(X=(Min=-2700.0000000,Max=2700.0000000),Y=(Min=-2700.0000000,Max=2700.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartLocationShape=2
		StartLocationPolarRange=(X=(Min=-128.0000000,Max=128.0000000),Y=(Min=-128.0000000,Max=128.0000000),Z=(Min=0.0000000,Max=0.0000000))
		AlphaRef=4
		SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
		StartSizeRange=(X=(Min=675.0000000,Max=1350.0000000),Y=(Min=1350.0000000,Max=1350.0000000),Z=(Min=1350.0000000,Max=1350.0000000))
		InitialParticlesPerSecond=1000.0000000
		DrawStyle=1
		Texture=Texture'BenTex01.textures.SmokePuff01'
		LifetimeRange=(Min=6.5000000,Max=7.5000000)
		StartVelocityRange=(X=(Min=-8100.0000000,Max=8100.0000000),Y=(Min=-8100.0000000,Max=8100.0000000),Z=(Min=0.0000000,Max=675.0000000))
		StartVelocityRadialRange=(Min=100.0000000,Max=200.0000000)
		VelocityLossRange=(X=(Min=1.0000000,Max=3.0000000),Y=(Min=1.0000000,Max=3.0000000),Z=(Min=0.0000000,Max=0.0000000))
		RotateVelocityLossRange=true
		GetVelocityDirectionFrom=3
	end object
	Emitters[8]=SpriteEmitter76
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter77'
	begin object name="SpriteEmitter77" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-135.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=205,G=180,B=155,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=205,G=180,B=155,A=255))
		FadeOutStartTime=1.0000000
		FadeInEndTime=0.1000000
		CoordinateSystem=1
		MaxParticles=5
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-432.0000000,Max=1728.0000000))
		AlphaRef=4
		SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=12.0000000)
		StartSizeRange=(X=(Min=405.0000000,Max=810.0000000),Y=(Min=1350.0000000,Max=1350.0000000),Z=(Min=1350.0000000,Max=1350.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		Texture=Texture'BenTex01.textures.SmokePuff01'
		LifetimeRange=(Min=6.5000000,Max=7.5000000)
		StartVelocityRange=(X=(Min=-1350.0000000,Max=1350.0000000),Y=(Min=-1350.0000000,Max=1350.0000000),Z=(Min=675.0000000,Max=18900.0000000))
		VelocityLossRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
		RotateVelocityLossRange=true
	end object
	Emitters[9]=SpriteEmitter77
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter85'
	begin object name="SpriteEmitter85" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		DampRotation=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		TriggerDisabled=false
		ResetOnTrigger=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-17057.2500000)
		DampingFactorRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.2500000,Max=0.2500000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=7.7000000
		MaxParticles=500
		SpinsPerSecondRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=25.5500000,Max=50.5500000),Y=(Min=25.5500000,Max=50.5500000),Z=(Min=25.5500000,Max=50.5500000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=8.0000000,Max=10.0000000)
		StartVelocityRange=(X=(Min=-4488.7500000,Max=4488.7500000),Y=(Min=-4488.7500000,Max=4488.7500000),Z=(Min=2700.0000000,Max=17955.0000000))
	end object
	Emitters[10]=SpriteEmitter85
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter86'
	begin object name="SpriteEmitter86" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		TriggerDisabled=false
		ResetOnTrigger=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-7500.2500000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=238,G=141,B=34,A=0))
		ColorScale[1]=(RelativeTime=0.2500000,Color=(R=77,G=68,B=43,A=0))
		ColorScale[2]=(RelativeTime=0.8964290,Color=(R=51,G=51,B=51,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.7500000,Max=0.7500000))
		FadeOutFactor=(W=0.2500000,X=0.1000000,Y=0.1000000,Z=0.1000000)
		FadeOutStartTime=0.7500000
		MaxParticles=25
		SpinsPerSecondRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.5000000,RelativeSize=10.0000000)
		StartSizeRange=(X=(Min=269.3250000,Max=269.3250000),Y=(Min=269.3250000,Max=269.3250000),Z=(Min=269.3250000,Max=269.3250000))
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'EmitterTextures.MultiFrame.smokelight_a'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=3.0000000,Max=4.0000000)
		StartVelocityRange=(X=(Min=-897.7500000,Max=897.7500000),Y=(Min=-897.7500000,Max=897.7500000),Z=(Min=7182.0000000,Max=16159.5000000))
		RelativeWarmupTime=1.0000000
	end object
	Emitters[11]=SpriteEmitter86
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter87'
	begin object name="SpriteEmitter87" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-12000.2500000)
		DampingFactorRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.3000000
		FadeInEndTime=0.3000000
		MaxParticles=25
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=1795.5000000,Max=1795.5000000),Y=(Min=1795.5000000,Max=1795.5000000),Z=(Min=1795.5000000,Max=1795.5000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'VMParticleTextures.TankFiringP.DirtPuffTEX'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-897.7500000,Max=897.7500000),Y=(Min=-897.7500000,Max=897.7500000),Z=(Min=2693.2500000,Max=17955.0000000))
	end object
	Emitters[12]=SpriteEmitter87
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter88'
	begin object name="SpriteEmitter88" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-5000.7500000)
		DampingFactorRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.3000000
		FadeInEndTime=0.3000000
		MaxParticles=25
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=1795.5000000,Max=1795.5000000),Y=(Min=1795.5000000,Max=1795.5000000),Z=(Min=1795.5000000,Max=1795.5000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'VMParticleTextures.TankFiringP.DirtPuffTEX'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-3386.5000000,Max=3386.5000000),Y=(Min=-3386.5000000,Max=3386.5000000),Z=(Min=538.6500000,Max=6284.2500000))
	end object
	Emitters[13]=SpriteEmitter88
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter89'
	begin object name="SpriteEmitter89" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.5000000
		FadeInEndTime=0.5000000
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=2693.2500000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.2500000,RelativeSize=10.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=15.0000000)
		StartSizeRange=(X=(Min=179.5500000,Max=179.5500000),Y=(Min=179.5500000,Max=179.5500000),Z=(Min=179.5500000,Max=179.5500000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Explosions.Fire.Part_explode2s'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.3500000,Max=0.5000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1795.5000000))
	end object
	Emitters[14]=SpriteEmitter89
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter90'
	begin object name="SpriteEmitter90" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=100,G=75,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=50,B=0,A=255))
		Opacity=0.5000000
		MaxParticles=25
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.3100000,RelativeSize=5.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
		StartSizeRange=(X=(Min=538.6500000,Max=1256.8500000),Y=(Min=538.6500000,Max=1256.8500000),Z=(Min=538.6500000,Max=1256.8500000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Dirt.BlastSpray2a'
		LifetimeRange=(Min=1.0000000,Max=1.5000000)
	end object
	Emitters[15]=SpriteEmitter90
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter91'
	begin object name="SpriteEmitter91" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.1500000
		MaxParticles=2
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=100.0000000)
		StartSizeRange=(X=(Min=90.0000000,Max=90.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Weapons.GrenExpl'
		LifetimeRange=(Min=0.2500000,Max=0.2500000)
	end object
	Emitters[16]=SpriteEmitter91
	AutoDestroy=true
	bNoDelete=false
	bNetTemporary=true
	RemoteRole=1
	Skins[0]=Texture'EpicParticles.Beams.RadialBands'
	bUnlit=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter25'
begin object name="SpriteEmitter25" class=Engine.SpriteEmitter
	UseCollision=true
	UseMaxCollisions=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-2400.0000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	MaxCollisions=(Min=6.0000000,Max=6.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=3.5000000
	MaxParticles=60
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
	InitialParticlesPerSecond=1000.0000000
	DrawStyle=1
	Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=4.0000000,Max=6.0000000)
	StartVelocityRange=(X=(Min=-3000.0000000,Max=3000.0000000),Y=(Min=-3000.0000000,Max=3000.0000000),Z=(Min=600.0000000,Max=5400.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter69'
begin object name="SpriteEmitter69" class=Engine.SpriteEmitter
	UseDirectionAs=1
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ScaleSizeYByVelocity=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.1000000
	FadeInEndTime=0.1000000
	MaxParticles=80
	DetailMode=1
	AddLocationFromOtherEmitter=0
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=12.0000000)
	StartSizeRange=(X=(Min=12.0000000,Max=24.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
	ScaleSizeByVelocityMultiplier=(X=0.1500000,Y=0.1500000,Z=0.1500000)
	InitialParticlesPerSecond=150.0000000
	DrawStyle=5
	Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
	LifetimeRange=(Min=3.0000000,Max=1.0000000)
	InitialDelayRange=(Min=0.5000000,Max=0.5000000)
	VelocityLossRange=(X=(Min=0.9000000,Max=0.9000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.9000000,Max=0.9000000))
	AddVelocityFromOtherEmitter=0
	AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter70'
begin object name="SpriteEmitter70" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-1800.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=3.5000000
	MaxParticles=75
	DetailMode=1
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=6.0000000,Max=75.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
	InitialParticlesPerSecond=1000.0000000
	DrawStyle=1
	Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	StartVelocityRange=(X=(Min=-1200.0000000,Max=1200.0000000),Y=(Min=-1200.0000000,Max=1200.0000000),Z=(Min=300.0000000,Max=4800.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter71'
begin object name="SpriteEmitter71" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=205,G=180,B=155,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=205,G=180,B=155,A=255))
	FadeOutStartTime=1.0000000
	FadeInEndTime=0.1000000
	CoordinateSystem=1
	MaxParticles=4
	StartLocationRange=(X=(Min=-600.0000000,Max=600.0000000),Y=(Min=-600.0000000,Max=600.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartLocationShape=2
	StartLocationPolarRange=(X=(Min=-128.0000000,Max=128.0000000),Y=(Min=-128.0000000,Max=128.0000000),Z=(Min=0.0000000,Max=0.0000000))
	AlphaRef=4
	SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
	StartSizeRange=(X=(Min=150.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
	InitialParticlesPerSecond=1000.0000000
	DrawStyle=1
	Texture=Texture'BenTex01.textures.SmokePuff01'
	LifetimeRange=(Min=6.5000000,Max=7.0000000)
	InitialDelayRange=(Min=0.0000000,Max=0.1000000)
	StartVelocityRange=(X=(Min=-1800.0000000,Max=1800.0000000),Y=(Min=-1800.0000000,Max=1800.0000000),Z=(Min=0.0000000,Max=150.0000000))
	StartVelocityRadialRange=(Min=100.0000000,Max=200.0000000)
	VelocityLossRange=(X=(Min=1.0000000,Max=3.0000000),Y=(Min=1.0000000,Max=3.0000000),Z=(Min=0.0000000,Max=0.0000000))
	RotateVelocityLossRange=true
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter72'
begin object name="SpriteEmitter72" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=205,G=180,B=155,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=205,G=180,B=155,A=255))
	FadeOutStartTime=1.0000000
	FadeInEndTime=0.1000000
	CoordinateSystem=1
	MaxParticles=5
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-96.0000000,Max=384.0000000))
	AlphaRef=4
	SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=12.0000000)
	StartSizeRange=(X=(Min=90.0000000,Max=180.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	Texture=Texture'BenTex01.textures.SmokePuff01'
	LifetimeRange=(Min=6.5000000,Max=7.0000000)
	StartVelocityRange=(X=(Min=-300.0000000,Max=300.0000000),Y=(Min=-300.0000000,Max=300.0000000),Z=(Min=150.0000000,Max=4200.0000000))
	VelocityLossRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
	RotateVelocityLossRange=true
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter73'
begin object name="SpriteEmitter73" class=Engine.SpriteEmitter
	UseCollision=true
	UseMaxCollisions=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-7200.0000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	MaxCollisions=(Min=6.0000000,Max=6.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=3.5000000
	MaxParticles=50
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=90.0000000,Max=90.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
	InitialParticlesPerSecond=1000.0000000
	DrawStyle=1
	Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=4.0000000,Max=6.0000000)
	StartVelocityRange=(X=(Min=-9000.0000000,Max=9000.0000000),Y=(Min=-9000.0000000,Max=9000.0000000),Z=(Min=1800.0000000,Max=16200.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter74'
begin object name="SpriteEmitter74" class=Engine.SpriteEmitter
	UseDirectionAs=1
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ScaleSizeYByVelocity=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.1000000
	FadeInEndTime=0.1000000
	MaxParticles=80
	DetailMode=1
	AddLocationFromOtherEmitter=5
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=7.0000000)
	StartSizeRange=(X=(Min=36.0000000,Max=72.0000000),Y=(Min=900.0000000,Max=900.0000000),Z=(Min=900.0000000,Max=900.0000000))
	ScaleSizeByVelocityMultiplier=(X=0.1500000,Y=0.1500000,Z=0.1500000)
	InitialParticlesPerSecond=150.0000000
	DrawStyle=5
	Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
	LifetimeRange=(Min=3.0000000,Max=1.0000000)
	InitialDelayRange=(Min=0.5000000,Max=0.5000000)
	VelocityLossRange=(X=(Min=0.9000000,Max=0.9000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.9000000,Max=0.9000000))
	AddVelocityFromOtherEmitter=5
	AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter75'
begin object name="SpriteEmitter75" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-2700.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=3.5000000
	MaxParticles=150
	DetailMode=1
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=20.5000000,Max=50.5000000),Y=(Min=20.5000000,Max=50.5000000),Z=(Min=20.5000000,Max=50.5000000))
	InitialParticlesPerSecond=1000.0000000
	DrawStyle=1
	Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	StartVelocityRange=(X=(Min=-1800.0000000,Max=1800.0000000),Y=(Min=-1800.0000000,Max=1800.0000000),Z=(Min=450.0000000,Max=7200.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter76'
begin object name="SpriteEmitter76" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=205,G=180,B=155,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=205,G=180,B=155,A=255))
	FadeOutStartTime=1.0000000
	FadeInEndTime=0.1000000
	CoordinateSystem=1
	MaxParticles=4
	StartLocationRange=(X=(Min=-2700.0000000,Max=2700.0000000),Y=(Min=-2700.0000000,Max=2700.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartLocationShape=2
	StartLocationPolarRange=(X=(Min=-128.0000000,Max=128.0000000),Y=(Min=-128.0000000,Max=128.0000000),Z=(Min=0.0000000,Max=0.0000000))
	AlphaRef=4
	SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
	StartSizeRange=(X=(Min=675.0000000,Max=1350.0000000),Y=(Min=1350.0000000,Max=1350.0000000),Z=(Min=1350.0000000,Max=1350.0000000))
	InitialParticlesPerSecond=1000.0000000
	DrawStyle=1
	Texture=Texture'BenTex01.textures.SmokePuff01'
	LifetimeRange=(Min=6.5000000,Max=7.5000000)
	StartVelocityRange=(X=(Min=-8100.0000000,Max=8100.0000000),Y=(Min=-8100.0000000,Max=8100.0000000),Z=(Min=0.0000000,Max=675.0000000))
	StartVelocityRadialRange=(Min=100.0000000,Max=200.0000000)
	VelocityLossRange=(X=(Min=1.0000000,Max=3.0000000),Y=(Min=1.0000000,Max=3.0000000),Z=(Min=0.0000000,Max=0.0000000))
	RotateVelocityLossRange=true
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter77'
begin object name="SpriteEmitter77" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-135.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=205,G=180,B=155,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=205,G=180,B=155,A=255))
	FadeOutStartTime=1.0000000
	FadeInEndTime=0.1000000
	CoordinateSystem=1
	MaxParticles=5
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-432.0000000,Max=1728.0000000))
	AlphaRef=4
	SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=12.0000000)
	StartSizeRange=(X=(Min=405.0000000,Max=810.0000000),Y=(Min=1350.0000000,Max=1350.0000000),Z=(Min=1350.0000000,Max=1350.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	Texture=Texture'BenTex01.textures.SmokePuff01'
	LifetimeRange=(Min=6.5000000,Max=7.5000000)
	StartVelocityRange=(X=(Min=-1350.0000000,Max=1350.0000000),Y=(Min=-1350.0000000,Max=1350.0000000),Z=(Min=675.0000000,Max=18900.0000000))
	VelocityLossRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
	RotateVelocityLossRange=true
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter85'
begin object name="SpriteEmitter85" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	DampRotation=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	TriggerDisabled=false
	ResetOnTrigger=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-17057.2500000)
	DampingFactorRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.2500000,Max=0.2500000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=7.7000000
	MaxParticles=500
	SpinsPerSecondRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=25.5500000,Max=50.5500000),Y=(Min=25.5500000,Max=50.5500000),Z=(Min=25.5500000,Max=50.5500000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=8.0000000,Max=10.0000000)
	StartVelocityRange=(X=(Min=-4488.7500000,Max=4488.7500000),Y=(Min=-4488.7500000,Max=4488.7500000),Z=(Min=2700.0000000,Max=17955.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter86'
begin object name="SpriteEmitter86" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	TriggerDisabled=false
	ResetOnTrigger=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-7500.2500000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=238,G=141,B=34,A=0))
	ColorScale[1]=(RelativeTime=0.2500000,Color=(R=77,G=68,B=43,A=0))
	ColorScale[2]=(RelativeTime=0.8964290,Color=(R=51,G=51,B=51,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.7500000,Max=0.7500000))
	FadeOutFactor=(W=0.2500000,X=0.1000000,Y=0.1000000,Z=0.1000000)
	FadeOutStartTime=0.7500000
	MaxParticles=25
	SpinsPerSecondRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.5000000,RelativeSize=10.0000000)
	StartSizeRange=(X=(Min=269.3250000,Max=269.3250000),Y=(Min=269.3250000,Max=269.3250000),Z=(Min=269.3250000,Max=269.3250000))
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'EmitterTextures.MultiFrame.smokelight_a'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=3.0000000,Max=4.0000000)
	StartVelocityRange=(X=(Min=-897.7500000,Max=897.7500000),Y=(Min=-897.7500000,Max=897.7500000),Z=(Min=7182.0000000,Max=16159.5000000))
	RelativeWarmupTime=1.0000000
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter87'
begin object name="SpriteEmitter87" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-12000.2500000)
	DampingFactorRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.3000000
	FadeInEndTime=0.3000000
	MaxParticles=25
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=1795.5000000,Max=1795.5000000),Y=(Min=1795.5000000,Max=1795.5000000),Z=(Min=1795.5000000,Max=1795.5000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'VMParticleTextures.TankFiringP.DirtPuffTEX'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-897.7500000,Max=897.7500000),Y=(Min=-897.7500000,Max=897.7500000),Z=(Min=2693.2500000,Max=17955.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter88'
begin object name="SpriteEmitter88" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-5000.7500000)
	DampingFactorRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.3000000
	FadeInEndTime=0.3000000
	MaxParticles=25
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=1795.5000000,Max=1795.5000000),Y=(Min=1795.5000000,Max=1795.5000000),Z=(Min=1795.5000000,Max=1795.5000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'VMParticleTextures.TankFiringP.DirtPuffTEX'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-3386.5000000,Max=3386.5000000),Y=(Min=-3386.5000000,Max=3386.5000000),Z=(Min=538.6500000,Max=6284.2500000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter89'
begin object name="SpriteEmitter89" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.5000000
	FadeInEndTime=0.5000000
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=2693.2500000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.2500000,RelativeSize=10.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=15.0000000)
	StartSizeRange=(X=(Min=179.5500000,Max=179.5500000),Y=(Min=179.5500000,Max=179.5500000),Z=(Min=179.5500000,Max=179.5500000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Explosions.Fire.Part_explode2s'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.3500000,Max=0.5000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1795.5000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter90'
begin object name="SpriteEmitter90" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=100,G=75,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=50,B=0,A=255))
	Opacity=0.5000000
	MaxParticles=25
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.3100000,RelativeSize=5.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
	StartSizeRange=(X=(Min=538.6500000,Max=1256.8500000),Y=(Min=538.6500000,Max=1256.8500000),Z=(Min=538.6500000,Max=1256.8500000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Dirt.BlastSpray2a'
	LifetimeRange=(Min=1.0000000,Max=1.5000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU57Explosion.SpriteEmitter91'
begin object name="SpriteEmitter91" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.1500000
	MaxParticles=2
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=100.0000000)
	StartSizeRange=(X=(Min=90.0000000,Max=90.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Weapons.GrenExpl'
	LifetimeRange=(Min=0.2500000,Max=0.2500000)
end object
