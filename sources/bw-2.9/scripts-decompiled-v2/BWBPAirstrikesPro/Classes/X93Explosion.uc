class X93Explosion extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBPAirstrikesPro.X93Explosion.SpriteEmitter51'
	begin object name="SpriteEmitter51" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-1500.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=2.0000000
		FadeInEndTime=2.0000000
		MaxParticles=20
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Flares.OutSpark02aw'
		LifetimeRange=(Min=5.0000000,Max=5.0000000)
		StartVelocityRange=(X=(Min=-1600.0000000,Max=1600.0000000),Y=(Min=-1600.0000000,Max=1600.0000000),Z=(Min=2000.0000000,Max=3000.0000000))
	end object
	Emitters[0]=SpriteEmitter51
	// Reference: SpriteEmitter'BWBPAirstrikesPro.X93Explosion.SpriteEmitter52'
	begin object name="SpriteEmitter52" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=255,B=255,A=255))
		Opacity=0.5000000
		FadeOutStartTime=1.0000000
		FadeInEndTime=1.0000000
		MaxParticles=50
		StartLocationRange=(X=(Min=-400.0000000,Max=400.0000000),Y=(Min=-400.0000000,Max=400.0000000),Z=(Min=-400.0000000,Max=400.0000000))
		StartLocationShape=1
		SphereRadiusRange=(Min=100.0000000,Max=100.0000000)
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=1000.0000000,Max=1000.0000000),Z=(Min=1000.0000000,Max=1000.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'EpicParticles.Smoke.Smokepuff'
		LifetimeRange=(Min=8.0000000,Max=8.0000000)
		StartVelocityRange=(X=(Min=-2500.0000000,Max=2500.0000000),Y=(Min=-2500.0000000,Max=2500.0000000),Z=(Min=0.0000000,Max=2500.0000000))
		VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.7500000,Max=0.7500000))
	end object
	Emitters[1]=SpriteEmitter52
	// Reference: SpriteEmitter'BWBPAirstrikesPro.X93Explosion.SpriteEmitter53'
	begin object name="SpriteEmitter53" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.5000000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=100.0000000)
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Energy.SmoothRing'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[2]=SpriteEmitter53
	// Reference: SpriteEmitter'BWBPAirstrikesPro.X93Explosion.SpriteEmitter54'
	begin object name="SpriteEmitter54" class=Engine.SpriteEmitter
		UseDirectionAs=4
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.5000000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=100.0000000)
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Energy.SmoothRing'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[3]=SpriteEmitter54
	// Reference: SpriteEmitter'BWBPAirstrikesPro.X93Explosion.SpriteEmitter56'
	begin object name="SpriteEmitter56" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=255,B=255,A=255))
		Opacity=0.7500000
		MaxParticles=2
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.1400000,RelativeSize=10.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=11.0000000)
		SizeScale[2]=(RelativeTime=0.5000000,RelativeSize=12.0000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=13.0000000)
		StartSizeRange=(X=(Min=500.0000000,Max=500.0000000),Y=(Min=500.0000000,Max=500.0000000),Z=(Min=500.0000000,Max=500.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Explosions.Fire.Part_explode2s'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
	end object
	Emitters[4]=SpriteEmitter56
	// Reference: SpriteEmitter'BWBPAirstrikesPro.X93Explosion.SpriteEmitter57'
	begin object name="SpriteEmitter57" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=1.0000000
		FadeInEndTime=1.0000000
		MaxParticles=50
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=500.0000000)
		StartLocationShape=1
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Flares.OutSpark02aw'
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-4500.0000000,Max=4500.0000000),Y=(Min=-4500.0000000,Max=4500.0000000),Z=(Min=0.0000000,Max=4500.0000000))
		VelocityLossRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.7500000,Max=0.7500000))
	end object
	Emitters[5]=SpriteEmitter57
	// Reference: SpriteEmitter'BWBPAirstrikesPro.X93Explosion.SpriteEmitter55'
	begin object name="SpriteEmitter55" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=255,B=255,A=255))
		MaxParticles=1
		StartSizeRange=(X=(Min=5000.0000000,Max=5000.0000000),Y=(Min=5000.0000000,Max=5000.0000000),Z=(Min=5000.0000000,Max=5000.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Flares.SoftFlare'
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
	end object
	Emitters[6]=SpriteEmitter55
	// Reference: SpriteEmitter'BWBPAirstrikesPro.X93Explosion.SpriteEmitter58'
	begin object name="SpriteEmitter58" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		VelocityFromMesh=true
		UniformMeshScale=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=255,B=255,A=255))
		MaxParticles=150
		MeshSpawningStaticMesh=StaticMesh'ParticleMeshes.Simple.ParticleRing'
		MeshSpawning=2
		VelocityScaleRange=(X=(Min=2000.0000000,Max=2000.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		MeshScaleRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=1.0000000,Max=1.0000000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=500.0000000,Max=500.0000000),Y=(Min=500.0000000,Max=500.0000000),Z=(Min=500.0000000,Max=500.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'EpicParticles.Smoke.Smokepuff'
		LifetimeRange=(Min=1.5000000,Max=2.0000000)
	end object
	Emitters[7]=SpriteEmitter58
	// Reference: BeamEmitter'BWBPAirstrikesPro.X93Explosion.BeamEmitter2'
	begin object name="BeamEmitter2" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=100000.0000000,Max=100000.0000000)
		DetermineEndPointBy=1
		RotatingSheets=2
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=200,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=200,G=255,B=255,A=255))
		FadeOutStartTime=0.5000000
		MaxParticles=1
		StartSizeRange=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=1000.0000000,Max=1000.0000000),Z=(Min=1000.0000000,Max=1000.0000000))
		InitialParticlesPerSecond=10000.0000000
		Texture=Texture'VMParticleTextures.LeviathanParticleEffects.LEVmainPartBeam'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=100.0000000,Max=100.0000000))
	end object
	Emitters[8]=BeamEmitter2
	// Reference: SpriteEmitter'BWBPAirstrikesPro.X93Explosion.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=255,B=255,A=255))
		FadeOutStartTime=0.3000000
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=500.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[9]=SpriteEmitter0
	// Reference: MeshEmitter'BWBPAirstrikesPro.X93Explosion.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'VMmeshEmitted.EJECTA.Sphere'
		RenderTwoSided=true
		UseParticleColor=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.5000000
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
		StartSizeRange=(X=(Min=250.0000000,Max=250.0000000),Y=(Min=250.0000000,Max=250.0000000),Z=(Min=250.0000000,Max=250.0000000))
		InitialParticlesPerSecond=5000.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[10]=MeshEmitter0
	// Reference: SpriteEmitter'BWBPAirstrikesPro.X93Explosion.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		MaxParticles=50
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=1000.0000000,Max=1000.0000000),Z=(Min=1000.0000000,Max=1000.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'VMParticleTextures.PowerNodeEXP.powerNodeEXPblueTEX'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=2.0000000,Max=2.5000000)
		StartVelocityRange=(X=(Min=-1600.0000000,Max=1600.0000000),Y=(Min=-1600.0000000,Max=1600.0000000),Z=(Min=0.0000000,Max=100.0000000))
	end object
	Emitters[11]=SpriteEmitter1
	// Reference: SparkEmitter'BWBPAirstrikesPro.X93Explosion.SparkEmitter0'
	begin object name="SparkEmitter0" class=Engine.SparkEmitter
		LineSegmentsRange=(Min=1.0000000,Max=1.0000000)
		TimeBetweenSegmentsRange=(Min=0.2000000,Max=0.2000000)
		FadeOut=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-1500.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.5000000
		MaxParticles=50
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'VMParticleTextures.VEHICLEtrailsGROUP.JetExhaustORANGEtex'
		InitialDelayRange=(Min=0.0000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=-1500.0000000,Max=1500.0000000),Y=(Min=-1500.0000000,Max=1500.0000000),Z=(Min=3500.0000000,Max=4500.0000000))
	end object
	Emitters[12]=SparkEmitter0
	AutoDestroy=true
	bNoDelete=false
	bNetTemporary=true
	RemoteRole=1
	bUnlit=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBPAirstrikesPro.X93Explosion.SpriteEmitter51'
begin object name="SpriteEmitter51" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-1500.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=2.0000000
	FadeInEndTime=2.0000000
	MaxParticles=20
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Flares.OutSpark02aw'
	LifetimeRange=(Min=5.0000000,Max=5.0000000)
	StartVelocityRange=(X=(Min=-1600.0000000,Max=1600.0000000),Y=(Min=-1600.0000000,Max=1600.0000000),Z=(Min=2000.0000000,Max=3000.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.X93Explosion.SpriteEmitter52'
begin object name="SpriteEmitter52" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=255,B=255,A=255))
	Opacity=0.5000000
	FadeOutStartTime=1.0000000
	FadeInEndTime=1.0000000
	MaxParticles=50
	StartLocationRange=(X=(Min=-400.0000000,Max=400.0000000),Y=(Min=-400.0000000,Max=400.0000000),Z=(Min=-400.0000000,Max=400.0000000))
	StartLocationShape=1
	SphereRadiusRange=(Min=100.0000000,Max=100.0000000)
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=1000.0000000,Max=1000.0000000),Z=(Min=1000.0000000,Max=1000.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'EpicParticles.Smoke.Smokepuff'
	LifetimeRange=(Min=8.0000000,Max=8.0000000)
	StartVelocityRange=(X=(Min=-2500.0000000,Max=2500.0000000),Y=(Min=-2500.0000000,Max=2500.0000000),Z=(Min=0.0000000,Max=2500.0000000))
	VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.7500000,Max=0.7500000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.X93Explosion.SpriteEmitter53'
begin object name="SpriteEmitter53" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.5000000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=100.0000000)
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Energy.SmoothRing'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.X93Explosion.SpriteEmitter54'
begin object name="SpriteEmitter54" class=Engine.SpriteEmitter
	UseDirectionAs=4
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.5000000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=100.0000000)
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Energy.SmoothRing'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.X93Explosion.SpriteEmitter56'
begin object name="SpriteEmitter56" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=255,B=255,A=255))
	Opacity=0.7500000
	MaxParticles=2
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.1400000,RelativeSize=10.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=11.0000000)
	SizeScale[2]=(RelativeTime=0.5000000,RelativeSize=12.0000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=13.0000000)
	StartSizeRange=(X=(Min=500.0000000,Max=500.0000000),Y=(Min=500.0000000,Max=500.0000000),Z=(Min=500.0000000,Max=500.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Explosions.Fire.Part_explode2s'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.X93Explosion.SpriteEmitter57'
begin object name="SpriteEmitter57" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=1.0000000
	FadeInEndTime=1.0000000
	MaxParticles=50
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=500.0000000)
	StartLocationShape=1
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Flares.OutSpark02aw'
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-4500.0000000,Max=4500.0000000),Y=(Min=-4500.0000000,Max=4500.0000000),Z=(Min=0.0000000,Max=4500.0000000))
	VelocityLossRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.7500000,Max=0.7500000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.X93Explosion.SpriteEmitter55'
begin object name="SpriteEmitter55" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=255,B=255,A=255))
	MaxParticles=1
	StartSizeRange=(X=(Min=5000.0000000,Max=5000.0000000),Y=(Min=5000.0000000,Max=5000.0000000),Z=(Min=5000.0000000,Max=5000.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Flares.SoftFlare'
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.X93Explosion.SpriteEmitter58'
begin object name="SpriteEmitter58" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	VelocityFromMesh=true
	UniformMeshScale=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=255,B=255,A=255))
	MaxParticles=150
	MeshSpawningStaticMesh=StaticMesh'ParticleMeshes.Simple.ParticleRing'
	MeshSpawning=2
	VelocityScaleRange=(X=(Min=2000.0000000,Max=2000.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	MeshScaleRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=1.0000000,Max=1.0000000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=500.0000000,Max=500.0000000),Y=(Min=500.0000000,Max=500.0000000),Z=(Min=500.0000000,Max=500.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'EpicParticles.Smoke.Smokepuff'
	LifetimeRange=(Min=1.5000000,Max=2.0000000)
end object
// Reference: BeamEmitter'BWBPAirstrikesPro.X93Explosion.BeamEmitter2'
begin object name="BeamEmitter2" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=100000.0000000,Max=100000.0000000)
	DetermineEndPointBy=1
	RotatingSheets=2
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=200,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=200,G=255,B=255,A=255))
	FadeOutStartTime=0.5000000
	MaxParticles=1
	StartSizeRange=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=1000.0000000,Max=1000.0000000),Z=(Min=1000.0000000,Max=1000.0000000))
	InitialParticlesPerSecond=10000.0000000
	Texture=Texture'VMParticleTextures.LeviathanParticleEffects.LEVmainPartBeam'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=100.0000000,Max=100.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.X93Explosion.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=255,B=255,A=255))
	FadeOutStartTime=0.3000000
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=500.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: MeshEmitter'BWBPAirstrikesPro.X93Explosion.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'VMmeshEmitted.EJECTA.Sphere'
	RenderTwoSided=true
	UseParticleColor=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.5000000
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
	StartSizeRange=(X=(Min=250.0000000,Max=250.0000000),Y=(Min=250.0000000,Max=250.0000000),Z=(Min=250.0000000,Max=250.0000000))
	InitialParticlesPerSecond=5000.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.X93Explosion.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	MaxParticles=50
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=1000.0000000,Max=1000.0000000),Z=(Min=1000.0000000,Max=1000.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'VMParticleTextures.PowerNodeEXP.powerNodeEXPblueTEX'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=2.0000000,Max=2.5000000)
	StartVelocityRange=(X=(Min=-1600.0000000,Max=1600.0000000),Y=(Min=-1600.0000000,Max=1600.0000000),Z=(Min=0.0000000,Max=100.0000000))
end object
// Reference: SparkEmitter'BWBPAirstrikesPro.X93Explosion.SparkEmitter0'
begin object name="SparkEmitter0" class=Engine.SparkEmitter
	LineSegmentsRange=(Min=1.0000000,Max=1.0000000)
	TimeBetweenSegmentsRange=(Min=0.2000000,Max=0.2000000)
	FadeOut=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-1500.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.5000000
	MaxParticles=50
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'VMParticleTextures.VEHICLEtrailsGROUP.JetExhaustORANGEtex'
	InitialDelayRange=(Min=0.0000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=-1500.0000000,Max=1500.0000000),Y=(Min=-1500.0000000,Max=1500.0000000),Z=(Min=3500.0000000,Max=4500.0000000))
end object
