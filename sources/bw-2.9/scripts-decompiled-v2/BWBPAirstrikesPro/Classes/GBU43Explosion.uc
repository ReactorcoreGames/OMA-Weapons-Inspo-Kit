class GBU43Explosion extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter53'
	begin object name="SpriteEmitter53" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.9071430,Color=(R=225,G=225,B=225,A=160))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		FadeOutStartTime=0.6861900
		DetailMode=1
		StartLocationRange=(X=(Min=-2992.5000000,Max=2992.5000000),Y=(Min=-2992.5000000,Max=2992.5000000),Z=(Min=0.0000000,Max=2394.0000000))
		SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
		SpinsPerSecondRange=(X=(Min=-0.0200000,Max=0.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=0.6500000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=4588.5000000,Max=4987.5000000),Y=(Min=4588.5000000,Max=4987.5000000),Z=(Min=4588.5000000,Max=4987.5000000))
		InitialParticlesPerSecond=80.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Explosions.Fire.Part_explode3'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=3.0000000,Max=4.0000000)
		StartVelocityRange=(X=(Min=-2394.0000000,Max=2394.0000000),Y=(Min=-2394.0000000,Max=2394.0000000),Z=(Min=0.0000000,Max=0.0000000))
		VelocityLossRange=(X=(Min=1.7500000,Max=1.7500000),Y=(Min=1.7500000,Max=1.7500000),Z=(Min=1.5000000,Max=1.5000000))
	end object
	Emitters[0]=SpriteEmitter53
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter54'
	begin object name="SpriteEmitter54" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.7000000
		FadeOutStartTime=0.1190000
		MaxParticles=6
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=3.9900000,Max=3.9900000))
		AddLocationFromOtherEmitter=0
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0100000)
		SizeScale[1]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[2]=(RelativeTime=0.2500000,RelativeSize=3.0000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=1915.2000000,Max=1915.2000000),Y=(Min=1915.2000000,Max=1915.2000000),Z=(Min=1915.2000000,Max=1915.2000000))
		InitialParticlesPerSecond=300.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Explosions.Fire.Fireballs1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
	end object
	Emitters[1]=SpriteEmitter54
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter55'
	begin object name="SpriteEmitter55" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
		MaxParticles=5
		StartLocationRange=(X=(Min=-4987.5000000,Max=4987.5000000),Y=(Min=-4987.5000000,Max=4987.5000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=5.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=1995.0000000,Max=1995.0000000),Y=(Min=1995.0000000,Max=1995.0000000),Z=(Min=1995.0000000,Max=1995.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=6
		Texture=Texture'EpicParticles.Flares.SoftFlare'
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		AddVelocityFromOtherEmitter=2
	end object
	Emitters[2]=SpriteEmitter55
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter56'
	begin object name="SpriteEmitter56" class=Engine.SpriteEmitter
		UseDirectionAs=4
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.5000000
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=100.0000000)
		StartSizeRange=(X=(Min=299.2500000,Max=299.2500000),Y=(Min=299.2500000,Max=299.2500000),Z=(Min=299.2500000,Max=299.2500000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Energy.SmoothRing'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[3]=SpriteEmitter56
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter57'
	begin object name="SpriteEmitter57" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.1500000,Color=(R=255,G=255,B=150,A=255))
		ColorScale[2]=(RelativeTime=0.3000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.5000000
		FadeOutStartTime=7.3500000
		FadeInEndTime=1.9500000
		MaxParticles=50
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=1500.0000000)
		StartLocationRange=(X=(Min=-3491.2500000,Max=3491.2500000),Y=(Min=-3491.2500000,Max=3491.2500000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=3990.0000000,Max=3990.0000000),Y=(Min=3990.0000000,Max=3990.0000000),Z=(Min=3990.0000000,Max=3990.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=20.0000000,Max=20.0000000)
		InitialDelayRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=997.5001000,Max=997.5001000))
	end object
	Emitters[4]=SpriteEmitter57
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter58'
	begin object name="SpriteEmitter58" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		VelocityFromMesh=true
		UniformMeshScale=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.5000000
		FadeOutStartTime=0.9200000
		FadeInEndTime=0.9200000
		MaxParticles=500
		MeshSpawningStaticMesh=StaticMesh'ParticleMeshes.Simple.ParticleRing'
		MeshSpawning=2
		VelocityScaleRange=(X=(Min=200.0000000,Max=3000.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		MeshScaleRange=(X=(Min=0.4000000,Max=60.0000000),Y=(Min=0.4000000,Max=60.0000000),Z=(Min=0.0100000,Max=0.0100000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=1500.0000000,Max=1500.0000000),Y=(Min=1500.0000000,Max=1500.0000000),Z=(Min=1500.0000000,Max=1500.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=14.0000000,Max=15.0000000)
		StartVelocityRadialRange=(Min=2500.0000000,Max=5000.0000000)
		VelocityLossRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		GetVelocityDirectionFrom=3
	end object
	Emitters[5]=SpriteEmitter58
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter59'
	begin object name="SpriteEmitter59" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.1500000,Color=(R=255,G=255,B=150,A=255))
		ColorScale[2]=(RelativeTime=0.3000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.5000000
		FadeOutStartTime=7.3500000
		FadeInEndTime=1.9500000
		MaxParticles=50
		StartLocationRange=(X=(Min=-5985.0000000,Max=5985.0000000),Y=(Min=-5985.0000000,Max=5985.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=3990.0000000,Max=3990.0000000),Y=(Min=3990.0000000,Max=3990.0000000),Z=(Min=3990.0000000,Max=3990.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=20.0000000,Max=20.0000000)
		InitialDelayRange=(Min=1.5000000,Max=1.5000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=997.5001000,Max=997.5001000))
	end object
	Emitters[6]=SpriteEmitter59
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter60'
	begin object name="SpriteEmitter60" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		MaxParticles=5
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.1400000,RelativeSize=10.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=11.0000000)
		SizeScale[2]=(RelativeTime=0.5000000,RelativeSize=12.0000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=13.0000000)
		StartSizeRange=(X=(Min=997.5001000,Max=997.5001000),Y=(Min=997.5001000,Max=997.5001000),Z=(Min=997.5001000,Max=997.5001000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Fire.GrenadeTest'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[7]=SpriteEmitter60
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter61'
	begin object name="SpriteEmitter61" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-5586.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=200,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=200,G=150,B=0,A=255))
		FadeOutStartTime=2.0000000
		FadeInEndTime=2.0000000
		MaxParticles=12
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Energy.BurnFlare'
		StartVelocityRange=(X=(Min=-5985.0000000,Max=5985.0000000),Y=(Min=-5985.0000000,Max=5985.0000000),Z=(Min=7980.0000000,Max=9975.0000000))
	end object
	Emitters[8]=SpriteEmitter61
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter62'
	begin object name="SpriteEmitter62" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.5000000
		MaxParticles=400
		AddLocationFromOtherEmitter=8
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=150.0000000,Max=150.0000000))
		InitialParticlesPerSecond=150.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Fire.SmokeFragment'
	end object
	Emitters[9]=SpriteEmitter62
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter63'
	begin object name="SpriteEmitter63" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.5000000
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=100.0000000)
		StartSizeRange=(X=(Min=299.2500000,Max=299.2500000),Y=(Min=299.2500000,Max=299.2500000),Z=(Min=299.2500000,Max=299.2500000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Energy.SmoothRing'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[10]=SpriteEmitter63
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter64'
	begin object name="SpriteEmitter64" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.5900000
		FadeOutStartTime=0.0933330
		FadeInEndTime=0.0933330
		MaxParticles=50
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=2493.7500000))
		SpinsPerSecondRange=(X=(Min=0.0750000,Max=0.1500000),Y=(Min=0.0750000,Max=0.1500000),Z=(Min=0.0750000,Max=0.1500000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=2493.7500000,Max=2493.7500000),Y=(Min=2493.7500000,Max=2493.7500000),Z=(Min=2493.7500000,Max=2493.7500000))
		InitialParticlesPerSecond=7500.0000000
		Texture=Texture'AW-2004Explosions.Fire.Part_explode2'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.3333330,Max=1.3333330)
		StartVelocityRange=(X=(Min=-9975.0000000,Max=9975.0000000),Y=(Min=-9975.0000000,Max=9975.0000000),Z=(Min=0.0000000,Max=0.0000000))
		VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=2.5000000,Max=2.5000000))
	end object
	Emitters[11]=SpriteEmitter64
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter65'
	begin object name="SpriteEmitter65" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=100,G=75,B=50,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=75,B=50,A=255))
		Opacity=0.2500000
		FadeOutStartTime=7.2000000
		FadeInEndTime=1.2000000
		MaxParticles=250
		StartLocationRange=(X=(Min=-897.7500000,Max=897.7500000),Y=(Min=-897.7500000,Max=897.7500000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=997.5001000,Max=997.5001000),Y=(Min=997.5001000,Max=997.5001000),Z=(Min=997.5001000,Max=997.5001000))
		InitialParticlesPerSecond=25.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Fire.SmokeFragment'
		LifetimeRange=(Min=10.0000000,Max=10.0000000)
		InitialDelayRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=997.5001000,Max=997.5001000))
		StartVelocityRadialRange=(Min=100.0000000,Max=100.0000000)
	end object
	Emitters[12]=SpriteEmitter65
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter66'
	begin object name="SpriteEmitter66" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=19.9500000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=100,G=75,B=50,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=75,B=50,A=255))
		FadeOutStartTime=4.2000000
		FadeInEndTime=1.3000000
		MaxParticles=250
		StartLocationRange=(X=(Min=-2992.5000000,Max=2992.5000000),Y=(Min=-2992.5000000,Max=2992.5000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=498.7500000,Max=498.7500000),Y=(Min=498.7500000,Max=498.7500000),Z=(Min=498.7500000,Max=498.7500000))
		InitialParticlesPerSecond=25.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Fire.SmokeFragment'
		LifetimeRange=(Min=15.0000000,Max=15.0000000)
		InitialDelayRange=(Min=0.0000000,Max=0.5000000)
		StartVelocityRadialRange=(Min=100.0000000,Max=100.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[13]=SpriteEmitter66
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter67'
	begin object name="SpriteEmitter67" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=250,G=150,B=0,A=255))
		Opacity=0.5000000
		MaxParticles=20
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=2500.0000000)
		StartLocationRange=(X=(Min=-2992.5000000,Max=2992.5000000),Y=(Min=-2992.5000000,Max=2992.5000000),Z=(Min=-2992.5000000,Max=997.5001000))
		AddLocationFromOtherEmitter=5
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=2660.0000000,Max=2660.0000000),Y=(Min=2660.0000000,Max=2660.0000000),Z=(Min=2660.0000000,Max=2660.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Energy.CloudLightning'
		LifetimeRange=(Min=7.0000000,Max=8.0000000)
		InitialDelayRange=(Min=0.0000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=997.5001000,Max=997.5001000))
	end object
	Emitters[14]=SpriteEmitter67
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter68'
	begin object name="SpriteEmitter68" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=250,G=150,B=0,A=255))
		Opacity=0.5000000
		MaxParticles=20
		StartLocationRange=(X=(Min=-4987.5000000,Max=4987.5000000),Y=(Min=-4987.5000000,Max=4987.5000000),Z=(Min=-2992.5000000,Max=997.5001000))
		AddLocationFromOtherEmitter=7
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=2660.0000000,Max=2660.0000000),Y=(Min=2660.0000000,Max=2660.0000000),Z=(Min=2660.0000000,Max=2660.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Energy.CloudLightning'
		LifetimeRange=(Min=7.0000000,Max=8.0000000)
		InitialDelayRange=(Min=0.0000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=997.5001000,Max=997.5001000))
	end object
	Emitters[15]=SpriteEmitter68
	AutoDestroy=true
	bNoDelete=false
	bNetTemporary=true
	RemoteRole=1
	bUnlit=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter53'
begin object name="SpriteEmitter53" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.9071430,Color=(R=225,G=225,B=225,A=160))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	FadeOutStartTime=0.6861900
	DetailMode=1
	StartLocationRange=(X=(Min=-2992.5000000,Max=2992.5000000),Y=(Min=-2992.5000000,Max=2992.5000000),Z=(Min=0.0000000,Max=2394.0000000))
	SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
	SpinsPerSecondRange=(X=(Min=-0.0200000,Max=0.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=0.6500000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=4588.5000000,Max=4987.5000000),Y=(Min=4588.5000000,Max=4987.5000000),Z=(Min=4588.5000000,Max=4987.5000000))
	InitialParticlesPerSecond=80.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Explosions.Fire.Part_explode3'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=3.0000000,Max=4.0000000)
	StartVelocityRange=(X=(Min=-2394.0000000,Max=2394.0000000),Y=(Min=-2394.0000000,Max=2394.0000000),Z=(Min=0.0000000,Max=0.0000000))
	VelocityLossRange=(X=(Min=1.7500000,Max=1.7500000),Y=(Min=1.7500000,Max=1.7500000),Z=(Min=1.5000000,Max=1.5000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter54'
begin object name="SpriteEmitter54" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.7000000
	FadeOutStartTime=0.1190000
	MaxParticles=6
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=3.9900000,Max=3.9900000))
	AddLocationFromOtherEmitter=0
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0100000)
	SizeScale[1]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[2]=(RelativeTime=0.2500000,RelativeSize=3.0000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=1915.2000000,Max=1915.2000000),Y=(Min=1915.2000000,Max=1915.2000000),Z=(Min=1915.2000000,Max=1915.2000000))
	InitialParticlesPerSecond=300.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Explosions.Fire.Fireballs1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter55'
begin object name="SpriteEmitter55" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
	MaxParticles=5
	StartLocationRange=(X=(Min=-4987.5000000,Max=4987.5000000),Y=(Min=-4987.5000000,Max=4987.5000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=5.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=1995.0000000,Max=1995.0000000),Y=(Min=1995.0000000,Max=1995.0000000),Z=(Min=1995.0000000,Max=1995.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=6
	Texture=Texture'EpicParticles.Flares.SoftFlare'
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	AddVelocityFromOtherEmitter=2
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter56'
begin object name="SpriteEmitter56" class=Engine.SpriteEmitter
	UseDirectionAs=4
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.5000000
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=100.0000000)
	StartSizeRange=(X=(Min=299.2500000,Max=299.2500000),Y=(Min=299.2500000,Max=299.2500000),Z=(Min=299.2500000,Max=299.2500000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Energy.SmoothRing'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter57'
begin object name="SpriteEmitter57" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.1500000,Color=(R=255,G=255,B=150,A=255))
	ColorScale[2]=(RelativeTime=0.3000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.5000000
	FadeOutStartTime=7.3500000
	FadeInEndTime=1.9500000
	MaxParticles=50
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=1500.0000000)
	StartLocationRange=(X=(Min=-3491.2500000,Max=3491.2500000),Y=(Min=-3491.2500000,Max=3491.2500000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=3990.0000000,Max=3990.0000000),Y=(Min=3990.0000000,Max=3990.0000000),Z=(Min=3990.0000000,Max=3990.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=20.0000000,Max=20.0000000)
	InitialDelayRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=997.5001000,Max=997.5001000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter58'
begin object name="SpriteEmitter58" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	VelocityFromMesh=true
	UniformMeshScale=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.5000000
	FadeOutStartTime=0.9200000
	FadeInEndTime=0.9200000
	MaxParticles=500
	MeshSpawningStaticMesh=StaticMesh'ParticleMeshes.Simple.ParticleRing'
	MeshSpawning=2
	VelocityScaleRange=(X=(Min=200.0000000,Max=3000.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	MeshScaleRange=(X=(Min=0.4000000,Max=60.0000000),Y=(Min=0.4000000,Max=60.0000000),Z=(Min=0.0100000,Max=0.0100000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=1500.0000000,Max=1500.0000000),Y=(Min=1500.0000000,Max=1500.0000000),Z=(Min=1500.0000000,Max=1500.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=14.0000000,Max=15.0000000)
	StartVelocityRadialRange=(Min=2500.0000000,Max=5000.0000000)
	VelocityLossRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter59'
begin object name="SpriteEmitter59" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.1500000,Color=(R=255,G=255,B=150,A=255))
	ColorScale[2]=(RelativeTime=0.3000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.5000000
	FadeOutStartTime=7.3500000
	FadeInEndTime=1.9500000
	MaxParticles=50
	StartLocationRange=(X=(Min=-5985.0000000,Max=5985.0000000),Y=(Min=-5985.0000000,Max=5985.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=3990.0000000,Max=3990.0000000),Y=(Min=3990.0000000,Max=3990.0000000),Z=(Min=3990.0000000,Max=3990.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=20.0000000,Max=20.0000000)
	InitialDelayRange=(Min=1.5000000,Max=1.5000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=997.5001000,Max=997.5001000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter60'
begin object name="SpriteEmitter60" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	MaxParticles=5
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.1400000,RelativeSize=10.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=11.0000000)
	SizeScale[2]=(RelativeTime=0.5000000,RelativeSize=12.0000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=13.0000000)
	StartSizeRange=(X=(Min=997.5001000,Max=997.5001000),Y=(Min=997.5001000,Max=997.5001000),Z=(Min=997.5001000,Max=997.5001000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Fire.GrenadeTest'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter61'
begin object name="SpriteEmitter61" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-5586.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=200,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=200,G=150,B=0,A=255))
	FadeOutStartTime=2.0000000
	FadeInEndTime=2.0000000
	MaxParticles=12
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Energy.BurnFlare'
	StartVelocityRange=(X=(Min=-5985.0000000,Max=5985.0000000),Y=(Min=-5985.0000000,Max=5985.0000000),Z=(Min=7980.0000000,Max=9975.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter62'
begin object name="SpriteEmitter62" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.5000000
	MaxParticles=400
	AddLocationFromOtherEmitter=8
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=150.0000000,Max=150.0000000))
	InitialParticlesPerSecond=150.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Fire.SmokeFragment'
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter63'
begin object name="SpriteEmitter63" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.5000000
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=100.0000000)
	StartSizeRange=(X=(Min=299.2500000,Max=299.2500000),Y=(Min=299.2500000,Max=299.2500000),Z=(Min=299.2500000,Max=299.2500000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Energy.SmoothRing'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter64'
begin object name="SpriteEmitter64" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.5900000
	FadeOutStartTime=0.0933330
	FadeInEndTime=0.0933330
	MaxParticles=50
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=2493.7500000))
	SpinsPerSecondRange=(X=(Min=0.0750000,Max=0.1500000),Y=(Min=0.0750000,Max=0.1500000),Z=(Min=0.0750000,Max=0.1500000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=2493.7500000,Max=2493.7500000),Y=(Min=2493.7500000,Max=2493.7500000),Z=(Min=2493.7500000,Max=2493.7500000))
	InitialParticlesPerSecond=7500.0000000
	Texture=Texture'AW-2004Explosions.Fire.Part_explode2'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.3333330,Max=1.3333330)
	StartVelocityRange=(X=(Min=-9975.0000000,Max=9975.0000000),Y=(Min=-9975.0000000,Max=9975.0000000),Z=(Min=0.0000000,Max=0.0000000))
	VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=2.5000000,Max=2.5000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter65'
begin object name="SpriteEmitter65" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=100,G=75,B=50,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=75,B=50,A=255))
	Opacity=0.2500000
	FadeOutStartTime=7.2000000
	FadeInEndTime=1.2000000
	MaxParticles=250
	StartLocationRange=(X=(Min=-897.7500000,Max=897.7500000),Y=(Min=-897.7500000,Max=897.7500000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=997.5001000,Max=997.5001000),Y=(Min=997.5001000,Max=997.5001000),Z=(Min=997.5001000,Max=997.5001000))
	InitialParticlesPerSecond=25.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Fire.SmokeFragment'
	LifetimeRange=(Min=10.0000000,Max=10.0000000)
	InitialDelayRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=997.5001000,Max=997.5001000))
	StartVelocityRadialRange=(Min=100.0000000,Max=100.0000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter66'
begin object name="SpriteEmitter66" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=19.9500000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=100,G=75,B=50,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=75,B=50,A=255))
	FadeOutStartTime=4.2000000
	FadeInEndTime=1.3000000
	MaxParticles=250
	StartLocationRange=(X=(Min=-2992.5000000,Max=2992.5000000),Y=(Min=-2992.5000000,Max=2992.5000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=498.7500000,Max=498.7500000),Y=(Min=498.7500000,Max=498.7500000),Z=(Min=498.7500000,Max=498.7500000))
	InitialParticlesPerSecond=25.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Fire.SmokeFragment'
	LifetimeRange=(Min=15.0000000,Max=15.0000000)
	InitialDelayRange=(Min=0.0000000,Max=0.5000000)
	StartVelocityRadialRange=(Min=100.0000000,Max=100.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter67'
begin object name="SpriteEmitter67" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=250,G=150,B=0,A=255))
	Opacity=0.5000000
	MaxParticles=20
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=2500.0000000)
	StartLocationRange=(X=(Min=-2992.5000000,Max=2992.5000000),Y=(Min=-2992.5000000,Max=2992.5000000),Z=(Min=-2992.5000000,Max=997.5001000))
	AddLocationFromOtherEmitter=5
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=2660.0000000,Max=2660.0000000),Y=(Min=2660.0000000,Max=2660.0000000),Z=(Min=2660.0000000,Max=2660.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Energy.CloudLightning'
	LifetimeRange=(Min=7.0000000,Max=8.0000000)
	InitialDelayRange=(Min=0.0000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=997.5001000,Max=997.5001000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU43Explosion.SpriteEmitter68'
begin object name="SpriteEmitter68" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=250,G=150,B=0,A=255))
	Opacity=0.5000000
	MaxParticles=20
	StartLocationRange=(X=(Min=-4987.5000000,Max=4987.5000000),Y=(Min=-4987.5000000,Max=4987.5000000),Z=(Min=-2992.5000000,Max=997.5001000))
	AddLocationFromOtherEmitter=7
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=2660.0000000,Max=2660.0000000),Y=(Min=2660.0000000,Max=2660.0000000),Z=(Min=2660.0000000,Max=2660.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Energy.CloudLightning'
	LifetimeRange=(Min=7.0000000,Max=8.0000000)
	InitialDelayRange=(Min=0.0000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=997.5001000,Max=997.5001000))
end object
