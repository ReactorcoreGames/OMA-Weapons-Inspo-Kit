class GBU38Explosion extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter20'
	begin object name="SpriteEmitter20" class=Engine.SpriteEmitter
		UseCollision=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		AlphaTest=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=187.5000000)
		ExtentMultiplier=(X=0.4000000,Y=0.4000000,Z=0.4000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=225,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.0321430,Color=(R=255,G=255,B=128,A=255))
		ColorScale[2]=(RelativeTime=0.0642860,Color=(R=255,G=128,B=64,A=255))
		ColorScale[3]=(RelativeTime=0.1214290,Color=(R=128,G=128,B=128,A=255))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=150,A=255))
		Opacity=0.6500000
		FadeOutStartTime=6.0000000
		FadeInEndTime=2.6000000
		MaxParticles=30
		StartLocationShape=1
		SphereRadiusRange=(Min=2.0000000,Max=5.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0250000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=0.1400000,RelativeSize=0.7000000)
		SizeScale[3]=(RelativeTime=0.3400000,RelativeSize=0.9000000)
		SizeScale[4]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=750.0000000,Max=1050.0000000),Y=(Min=750.0000000,Max=1050.0000000),Z=(Min=750.0000000,Max=1050.0000000))
		InitialParticlesPerSecond=25000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Fire.SmokeFragment'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=10.0000000,Max=10.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-750.0000000,Max=3000.0000000))
		StartVelocityRadialRange=(Min=-600.0000000,Max=-300.0000000)
		VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=2.5000000,Max=2.5000000))
		GetVelocityDirectionFrom=3
	end object
	Emitters[0]=SpriteEmitter20
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter21'
	begin object name="SpriteEmitter21" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		ScaleSizeYByVelocity=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=140,B=45,A=255))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=160,G=160,B=160,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
		Opacity=0.6800000
		FadeOutStartTime=0.4000000
		MaxParticles=500
		StartLocationRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-15.0000000,Max=15.0000000))
		AddLocationFromOtherEmitter=2
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=7.5000000,Max=75.0000000),Y=(Min=7.5000000,Max=75.0000000),Z=(Min=7.5000000,Max=75.0000000))
		ScaleSizeByVelocityMultiplier=(X=1.0000000,Y=0.0030000,Z=1.0000000)
		InitialParticlesPerSecond=250.0000000
		Texture=Texture'AW-2004Particles.Energy.CloudLightning'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.6000000,Max=1.6000000)
		AddVelocityFromOtherEmitter=2
		AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1500000),Y=(Min=0.1000000,Max=0.1500000),Z=(Min=0.1000000,Max=0.1500000))
	end object
	Emitters[1]=SpriteEmitter21
	// Reference: MeshEmitter'BWBPAirstrikesPro.GBU38Explosion.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'EffectMeshes.Particles.DirtChunk_01aw'
		UseMeshBlendMode=false
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-1000.0000000)
		ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.7400000
		MaxParticles=9
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=2.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		InitialParticlesPerSecond=2500.0000000
		SecondsBeforeInactive=0.0000000
		MinSquaredVelocity=2500.0000000
		StartVelocityRange=(X=(Min=-750.0000000,Max=1050.0000000),Y=(Min=-750.0000000,Max=1050.0000000),Z=(Min=950.0000000,Max=1250.0000000))
	end object
	Emitters[2]=MeshEmitter0
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter22'
	begin object name="SpriteEmitter22" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.0100000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=750.0000000,Max=750.0000000),Y=(Min=750.0000000,Max=750.0000000),Z=(Min=750.0000000,Max=750.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'AW-2004Particles.Energy.SmoothRing'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[3]=SpriteEmitter22
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter24'
	begin object name="SpriteEmitter24" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.5900000
		FadeOutStartTime=0.0933330
		FadeInEndTime=0.0933330
		MaxParticles=50
		StartLocationRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=0.0000000,Max=375.0000000))
		SpinsPerSecondRange=(X=(Min=0.0750000,Max=0.1500000),Y=(Min=0.0750000,Max=0.1500000),Z=(Min=0.0750000,Max=0.1500000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=375.0000000,Max=375.0000000),Y=(Min=375.0000000,Max=375.0000000),Z=(Min=375.0000000,Max=375.0000000))
		InitialParticlesPerSecond=7500.0000000
		Texture=Texture'ONSBPTextures.fX.ExploTrans'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=1.3333330,Max=1.3333330)
		VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=2.5000000,Max=2.5000000))
		AddVelocityFromOtherEmitter=0
	end object
	Emitters[4]=SpriteEmitter24
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter25'
	begin object name="SpriteEmitter25" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		DampRotation=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-1425.0000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=7.5000000
		FadeInEndTime=1.6000000
		MaxParticles=500
		StartLocationRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=750.0000000,Max=750.0000000))
		SphereRadiusRange=(Min=1.0000000,Max=1.0000000)
		StartLocationPolarRange=(X=(Min=-16384.0000000,Max=256.0000000),Y=(Min=-256.0000000,Max=256.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=7.5000000,Max=15.0000000),Y=(Min=7.5000000,Max=15.0000000),Z=(Min=7.5000000,Max=15.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=8.0000000,Max=10.0000000)
		StartVelocityRange=(X=(Min=-750.0000000,Max=750.0000000),Y=(Min=-750.0000000,Max=750.0000000),Z=(Min=150.0000000,Max=2250.0000000))
	end object
	Emitters[5]=SpriteEmitter25
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter26'
	begin object name="SpriteEmitter26" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=100,G=100,B=100,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=255))
		Opacity=0.2000000
		FadeOutStartTime=4.8600000
		FadeInEndTime=0.4800000
		MaxParticles=250
		StartLocationRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartLocationShape=1
		SphereRadiusRange=(Min=100.0000000,Max=100.0000000)
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=5
		Texture=Texture'AW-2004Particles.Energy.CloudLightning'
		LifetimeRange=(Min=6.0000000,Max=6.0000000)
		StartVelocityRange=(X=(Min=-15000.0000000,Max=15000.0000000),Y=(Min=-15000.0000000,Max=15000.0000000),Z=(Min=0.0000000,Max=0.0000000))
		VelocityLossRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[6]=SpriteEmitter26
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter27'
	begin object name="SpriteEmitter27" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		StartLocationRange=(X=(Min=-600.0000000,Max=600.0000000),Y=(Min=-600.0000000,Max=600.0000000),Z=(Min=-75.0000000,Max=225.0000000))
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=375.0000000,Max=375.0000000),Y=(Min=375.0000000,Max=375.0000000),Z=(Min=375.0000000,Max=375.0000000))
		InitialParticlesPerSecond=20.0000000
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[7]=SpriteEmitter27
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter28'
	begin object name="SpriteEmitter28" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		MaxParticles=20
		DetailMode=1
		StartLocationRange=(X=(Min=-600.0000000,Max=600.0000000),Y=(Min=-600.0000000,Max=600.0000000),Z=(Min=-75.0000000,Max=225.0000000))
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=375.0000000,Max=375.0000000),Y=(Min=375.0000000,Max=375.0000000),Z=(Min=375.0000000,Max=375.0000000))
		InitialParticlesPerSecond=100.0000000
		Texture=Texture'ExplosionTex.Framed.we1_frames'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[8]=SpriteEmitter28
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter29'
	begin object name="SpriteEmitter29" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		MaxParticles=20
		StartLocationRange=(X=(Min=-600.0000000,Max=600.0000000),Y=(Min=-600.0000000,Max=600.0000000),Z=(Min=-75.0000000,Max=225.0000000))
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=375.0000000,Max=375.0000000),Y=(Min=375.0000000,Max=375.0000000),Z=(Min=375.0000000,Max=375.0000000))
		InitialParticlesPerSecond=100.0000000
		Texture=Texture'ExplosionTex.Framed.exp2_frames'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRadialRange=(Min=-40.0000000,Max=-50.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[9]=SpriteEmitter29
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter30'
	begin object name="SpriteEmitter30" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		MaxParticles=3
		DetailMode=1
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		StartLocationRange=(X=(Min=-75.0000000,Max=75.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=600.0000000,Max=600.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=150.0000000,Max=150.0000000))
		InitialParticlesPerSecond=20.0000000
		Texture=Texture'ExplosionTex.Framed.exp2_frames'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.7000000,Max=0.7000000)
	end object
	Emitters[10]=SpriteEmitter30
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter31'
	begin object name="SpriteEmitter31" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		MaxParticles=20
		StartLocationOffset=(X=0.0000000,Y=10.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-15.0000000,Max=15.0000000))
		AddLocationFromOtherEmitter=13
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=150.0000000,Max=225.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=150.0000000,Max=150.0000000))
		InitialParticlesPerSecond=40.0000000
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		InitialDelayRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[11]=SpriteEmitter31
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter32'
	begin object name="SpriteEmitter32" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=100,G=100,B=100,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=255))
		FadeOutStartTime=1.5000000
		FadeInEndTime=1.5000000
		MaxParticles=50
		StartLocationRange=(X=(Min=-300.0000000,Max=300.0000000),Y=(Min=-300.0000000,Max=300.0000000),Z=(Min=-300.0000000,Max=300.0000000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=375.0000000,Max=375.0000000),Y=(Min=375.0000000,Max=375.0000000),Z=(Min=375.0000000,Max=375.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.DustSmoke'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=5.0000000,Max=5.0000000)
		InitialDelayRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-75.0000000,Max=75.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=75.0000000,Max=75.0000000))
	end object
	Emitters[12]=SpriteEmitter32
	// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter33'
	begin object name="SpriteEmitter33" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-450.0000000)
		DampingFactorRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.2500000,Max=0.2500000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.5900000
		MaxParticles=3
		StartLocationShape=1
		SphereRadiusRange=(Min=50.0000000,Max=50.0000000)
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=75.0000000,Max=75.0000000),Y=(Min=75.0000000,Max=75.0000000),Z=(Min=75.0000000,Max=75.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
		StartVelocityRange=(X=(Min=-375.0000000,Max=375.0000000),Y=(Min=-375.0000000,Max=375.0000000),Z=(Min=825.0000000,Max=825.0000000))
	end object
	Emitters[13]=SpriteEmitter33
	AutoDestroy=true
	bNoDelete=false
	bNetTemporary=true
	RemoteRole=1
	bUnlit=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter20'
begin object name="SpriteEmitter20" class=Engine.SpriteEmitter
	UseCollision=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	AlphaTest=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=187.5000000)
	ExtentMultiplier=(X=0.4000000,Y=0.4000000,Z=0.4000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=225,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.0321430,Color=(R=255,G=255,B=128,A=255))
	ColorScale[2]=(RelativeTime=0.0642860,Color=(R=255,G=128,B=64,A=255))
	ColorScale[3]=(RelativeTime=0.1214290,Color=(R=128,G=128,B=128,A=255))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=150,A=255))
	Opacity=0.6500000
	FadeOutStartTime=6.0000000
	FadeInEndTime=2.6000000
	MaxParticles=30
	StartLocationShape=1
	SphereRadiusRange=(Min=2.0000000,Max=5.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0250000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=0.1400000,RelativeSize=0.7000000)
	SizeScale[3]=(RelativeTime=0.3400000,RelativeSize=0.9000000)
	SizeScale[4]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=750.0000000,Max=1050.0000000),Y=(Min=750.0000000,Max=1050.0000000),Z=(Min=750.0000000,Max=1050.0000000))
	InitialParticlesPerSecond=25000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Fire.SmokeFragment'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=10.0000000,Max=10.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-750.0000000,Max=3000.0000000))
	StartVelocityRadialRange=(Min=-600.0000000,Max=-300.0000000)
	VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=2.5000000,Max=2.5000000))
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter21'
begin object name="SpriteEmitter21" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	ScaleSizeYByVelocity=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=140,B=45,A=255))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=160,G=160,B=160,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
	Opacity=0.6800000
	FadeOutStartTime=0.4000000
	MaxParticles=500
	StartLocationRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-15.0000000,Max=15.0000000))
	AddLocationFromOtherEmitter=2
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=7.5000000,Max=75.0000000),Y=(Min=7.5000000,Max=75.0000000),Z=(Min=7.5000000,Max=75.0000000))
	ScaleSizeByVelocityMultiplier=(X=1.0000000,Y=0.0030000,Z=1.0000000)
	InitialParticlesPerSecond=250.0000000
	Texture=Texture'AW-2004Particles.Energy.CloudLightning'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.6000000,Max=1.6000000)
	AddVelocityFromOtherEmitter=2
	AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1500000),Y=(Min=0.1000000,Max=0.1500000),Z=(Min=0.1000000,Max=0.1500000))
end object
// Reference: MeshEmitter'BWBPAirstrikesPro.GBU38Explosion.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'EffectMeshes.Particles.DirtChunk_01aw'
	UseMeshBlendMode=false
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-1000.0000000)
	ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.7400000
	MaxParticles=9
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=2.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	InitialParticlesPerSecond=2500.0000000
	SecondsBeforeInactive=0.0000000
	MinSquaredVelocity=2500.0000000
	StartVelocityRange=(X=(Min=-750.0000000,Max=1050.0000000),Y=(Min=-750.0000000,Max=1050.0000000),Z=(Min=950.0000000,Max=1250.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter22'
begin object name="SpriteEmitter22" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.0100000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=750.0000000,Max=750.0000000),Y=(Min=750.0000000,Max=750.0000000),Z=(Min=750.0000000,Max=750.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'AW-2004Particles.Energy.SmoothRing'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter24'
begin object name="SpriteEmitter24" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.5900000
	FadeOutStartTime=0.0933330
	FadeInEndTime=0.0933330
	MaxParticles=50
	StartLocationRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=0.0000000,Max=375.0000000))
	SpinsPerSecondRange=(X=(Min=0.0750000,Max=0.1500000),Y=(Min=0.0750000,Max=0.1500000),Z=(Min=0.0750000,Max=0.1500000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=375.0000000,Max=375.0000000),Y=(Min=375.0000000,Max=375.0000000),Z=(Min=375.0000000,Max=375.0000000))
	InitialParticlesPerSecond=7500.0000000
	Texture=Texture'ONSBPTextures.fX.ExploTrans'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	LifetimeRange=(Min=1.3333330,Max=1.3333330)
	VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=2.5000000,Max=2.5000000))
	AddVelocityFromOtherEmitter=0
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter25'
begin object name="SpriteEmitter25" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	DampRotation=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-1425.0000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=7.5000000
	FadeInEndTime=1.6000000
	MaxParticles=500
	StartLocationRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=750.0000000,Max=750.0000000))
	SphereRadiusRange=(Min=1.0000000,Max=1.0000000)
	StartLocationPolarRange=(X=(Min=-16384.0000000,Max=256.0000000),Y=(Min=-256.0000000,Max=256.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=7.5000000,Max=15.0000000),Y=(Min=7.5000000,Max=15.0000000),Z=(Min=7.5000000,Max=15.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=8.0000000,Max=10.0000000)
	StartVelocityRange=(X=(Min=-750.0000000,Max=750.0000000),Y=(Min=-750.0000000,Max=750.0000000),Z=(Min=150.0000000,Max=2250.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter26'
begin object name="SpriteEmitter26" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=100,G=100,B=100,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=255))
	Opacity=0.2000000
	FadeOutStartTime=4.8600000
	FadeInEndTime=0.4800000
	MaxParticles=250
	StartLocationRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartLocationShape=1
	SphereRadiusRange=(Min=100.0000000,Max=100.0000000)
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=5
	Texture=Texture'AW-2004Particles.Energy.CloudLightning'
	LifetimeRange=(Min=6.0000000,Max=6.0000000)
	StartVelocityRange=(X=(Min=-15000.0000000,Max=15000.0000000),Y=(Min=-15000.0000000,Max=15000.0000000),Z=(Min=0.0000000,Max=0.0000000))
	VelocityLossRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter27'
begin object name="SpriteEmitter27" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	StartLocationRange=(X=(Min=-600.0000000,Max=600.0000000),Y=(Min=-600.0000000,Max=600.0000000),Z=(Min=-75.0000000,Max=225.0000000))
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=375.0000000,Max=375.0000000),Y=(Min=375.0000000,Max=375.0000000),Z=(Min=375.0000000,Max=375.0000000))
	InitialParticlesPerSecond=20.0000000
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter28'
begin object name="SpriteEmitter28" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	MaxParticles=20
	DetailMode=1
	StartLocationRange=(X=(Min=-600.0000000,Max=600.0000000),Y=(Min=-600.0000000,Max=600.0000000),Z=(Min=-75.0000000,Max=225.0000000))
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=375.0000000,Max=375.0000000),Y=(Min=375.0000000,Max=375.0000000),Z=(Min=375.0000000,Max=375.0000000))
	InitialParticlesPerSecond=100.0000000
	Texture=Texture'ExplosionTex.Framed.we1_frames'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter29'
begin object name="SpriteEmitter29" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	MaxParticles=20
	StartLocationRange=(X=(Min=-600.0000000,Max=600.0000000),Y=(Min=-600.0000000,Max=600.0000000),Z=(Min=-75.0000000,Max=225.0000000))
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=375.0000000,Max=375.0000000),Y=(Min=375.0000000,Max=375.0000000),Z=(Min=375.0000000,Max=375.0000000))
	InitialParticlesPerSecond=100.0000000
	Texture=Texture'ExplosionTex.Framed.exp2_frames'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRadialRange=(Min=-40.0000000,Max=-50.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter30'
begin object name="SpriteEmitter30" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	MaxParticles=3
	DetailMode=1
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	StartLocationRange=(X=(Min=-75.0000000,Max=75.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=600.0000000,Max=600.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=150.0000000,Max=150.0000000))
	InitialParticlesPerSecond=20.0000000
	Texture=Texture'ExplosionTex.Framed.exp2_frames'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.7000000,Max=0.7000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter31'
begin object name="SpriteEmitter31" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	MaxParticles=20
	StartLocationOffset=(X=0.0000000,Y=10.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-15.0000000,Max=15.0000000))
	AddLocationFromOtherEmitter=13
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=150.0000000,Max=225.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=150.0000000,Max=150.0000000))
	InitialParticlesPerSecond=40.0000000
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	InitialDelayRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter32'
begin object name="SpriteEmitter32" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=100,G=100,B=100,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=255))
	FadeOutStartTime=1.5000000
	FadeInEndTime=1.5000000
	MaxParticles=50
	StartLocationRange=(X=(Min=-300.0000000,Max=300.0000000),Y=(Min=-300.0000000,Max=300.0000000),Z=(Min=-300.0000000,Max=300.0000000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=375.0000000,Max=375.0000000),Y=(Min=375.0000000,Max=375.0000000),Z=(Min=375.0000000,Max=375.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.DustSmoke'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=5.0000000,Max=5.0000000)
	InitialDelayRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-75.0000000,Max=75.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=75.0000000,Max=75.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.GBU38Explosion.SpriteEmitter33'
begin object name="SpriteEmitter33" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-450.0000000)
	DampingFactorRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.2500000,Max=0.2500000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.5900000
	MaxParticles=3
	StartLocationShape=1
	SphereRadiusRange=(Min=50.0000000,Max=50.0000000)
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=75.0000000,Max=75.0000000),Y=(Min=75.0000000,Max=75.0000000),Z=(Min=75.0000000,Max=75.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
	StartVelocityRange=(X=(Min=-375.0000000,Max=375.0000000),Y=(Min=-375.0000000,Max=375.0000000),Z=(Min=825.0000000,Max=825.0000000))
end object
