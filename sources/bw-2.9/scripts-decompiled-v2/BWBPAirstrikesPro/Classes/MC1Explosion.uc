class MC1Explosion extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBPAirstrikesPro.MC1Explosion.SpriteEmitter18'
	begin object name="SpriteEmitter18" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		Acceleration=(X=4.0000000,Y=4.0000000,Z=0.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=150,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=150,B=150,A=255))
		ColorMultiplierRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.1500000,Max=0.1500000))
		Opacity=0.5000000
		FadeOutStartTime=27.0000000
		FadeInEndTime=1.2000000
		MaxParticles=250
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		StartLocationRange=(X=(Min=-1600.0000000,Max=1600.0000000),Y=(Min=-1600.0000000,Max=1600.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=400.0000000,Max=400.0000000),Y=(Min=400.0000000,Max=400.0000000),Z=(Min=400.0000000,Max=400.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.DustSmoke'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=28.0000000,Max=30.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=4.0000000,Max=4.0000000))
		MaxAbsVelocity=(X=1.0000000,Y=1.0000000,Z=0.0000000)
	end object
	Emitters[0]=SpriteEmitter18
	// Reference: SpriteEmitter'BWBPAirstrikesPro.MC1Explosion.SpriteEmitter19'
	begin object name="SpriteEmitter19" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-1800.0000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.5000000,Max=0.5000000))
		MaxParticles=25
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=24.0000000,Max=24.0000000),Y=(Min=24.0000000,Max=24.0000000),Z=(Min=24.0000000,Max=24.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-1400.0000000,Max=1400.0000000),Y=(Min=-1400.0000000,Max=1400.0000000),Z=(Min=800.0000000,Max=2200.0000000))
	end object
	Emitters[1]=SpriteEmitter19
	// Reference: SpriteEmitter'BWBPAirstrikesPro.MC1Explosion.SpriteEmitter20'
	begin object name="SpriteEmitter20" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		Acceleration=(X=4.0000000,Y=4.0000000,Z=0.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=150,B=150,A=255))
		ColorMultiplierRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.1500000,Max=0.1500000))
		Opacity=0.5000000
		FadeOutStartTime=27.0000000
		FadeInEndTime=1.2000000
		MaxParticles=60
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=350.0000000)
		StartLocationRange=(X=(Min=-800.0000000,Max=800.0000000),Y=(Min=-800.0000000,Max=800.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=400.0000000,Max=400.0000000),Y=(Min=400.0000000,Max=400.0000000),Z=(Min=400.0000000,Max=400.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.DustSmoke'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=28.0000000,Max=30.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=4.0000000,Max=4.0000000))
		MaxAbsVelocity=(X=1.0000000,Y=1.0000000,Z=0.0000000)
	end object
	Emitters[2]=SpriteEmitter20
	// Reference: SpriteEmitter'BWBPAirstrikesPro.MC1Explosion.SpriteEmitter21'
	begin object name="SpriteEmitter21" class=Engine.SpriteEmitter
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
		ColorMultiplierRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.1500000,Max=0.1500000))
		FadeOutStartTime=27.6000000
		FadeInEndTime=1.2000000
		MaxParticles=500
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		MeshSpawningStaticMesh=StaticMesh'ParticleMeshes.Simple.ParticleRing'
		MeshSpawning=2
		VelocityScaleRange=(X=(Min=100.0000000,Max=1500.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		MeshScaleRange=(X=(Min=0.1000000,Max=14.0000000),Y=(Min=0.1000000,Max=14.0000000),Z=(Min=0.0100000,Max=0.0100000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=500.0000000,Max=500.0000000),Y=(Min=500.0000000,Max=500.0000000),Z=(Min=500.0000000,Max=500.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.DustSmoke'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=29.0000000,Max=30.0000000)
		VelocityLossRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[3]=SpriteEmitter21
	// Reference: SpriteEmitter'BWBPAirstrikesPro.MC1Explosion.SpriteEmitter22'
	begin object name="SpriteEmitter22" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.7500000
		FadeOutStartTime=0.0050000
		FadeInEndTime=0.0050000
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=25.0000000)
		StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=5
		Texture=Texture'AW-2004Particles.Energy.AirBlast'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[4]=SpriteEmitter22
	// Reference: SpriteEmitter'BWBPAirstrikesPro.MC1Explosion.SpriteEmitter23'
	begin object name="SpriteEmitter23" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=100,G=100,B=100,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=255))
		ColorMultiplierRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.1500000,Max=0.1500000))
		Opacity=0.5000000
		FadeOutStartTime=3.0000000
		MaxParticles=750
		AddLocationFromOtherEmitter=1
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
		InitialParticlesPerSecond=1500.0000000
		Texture=Texture'AW-2004Particles.Energy.CloudLightning'
		LifetimeRange=(Min=4.0000000,Max=5.0000000)
		InitialDelayRange=(Min=0.2500000,Max=0.2500000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=20.0000000,Max=20.0000000))
	end object
	Emitters[5]=SpriteEmitter23
	// Reference: SpriteEmitter'BWBPAirstrikesPro.MC1Explosion.SpriteEmitter24'
	begin object name="SpriteEmitter24" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		VelocityFromMesh=true
		UniformMeshScale=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.1500000,Max=0.1500000))
		Opacity=0.5000000
		FadeOutStartTime=2.2000000
		FadeInEndTime=0.0500000
		MaxParticles=125
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		MeshSpawningStaticMesh=StaticMesh'ParticleMeshes.Simple.ParticleRing'
		MeshSpawning=2
		VelocityScaleRange=(X=(Min=100.0000000,Max=1500.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		MeshScaleRange=(X=(Min=0.1000000,Max=14.0000000),Y=(Min=0.1000000,Max=14.0000000),Z=(Min=0.0100000,Max=0.0100000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
		LifetimeRange=(Min=4.0000000,Max=5.0000000)
		VelocityLossRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[6]=SpriteEmitter24
	// Reference: SpriteEmitter'BWBPAirstrikesPro.MC1Explosion.SpriteEmitter25'
	begin object name="SpriteEmitter25" class=Engine.SpriteEmitter
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
		ColorMultiplierRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.1500000,Max=0.1500000))
		FadeOutStartTime=27.6000000
		FadeInEndTime=1.2000000
		MaxParticles=100
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		MeshSpawningStaticMesh=StaticMesh'ParticleMeshes.Simple.ParticleRing'
		MeshSpawning=2
		VelocityScaleRange=(X=(Min=100.0000000,Max=1500.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		MeshScaleRange=(X=(Min=0.1000000,Max=14.0000000),Y=(Min=0.1000000,Max=14.0000000),Z=(Min=0.0100000,Max=0.0100000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=400.0000000,Max=400.0000000),Y=(Min=400.0000000,Max=400.0000000),Z=(Min=400.0000000,Max=400.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels2'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=29.0000000,Max=30.0000000)
		VelocityLossRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[7]=SpriteEmitter25
	// Reference: SpriteEmitter'BWBPAirstrikesPro.MC1Explosion.SpriteEmitter26'
	begin object name="SpriteEmitter26" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.1500000,Max=0.1500000))
		Opacity=0.1000000
		MaxParticles=40
		StartSpinRange=(X=(Min=0.2500000,Max=0.7500000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.2500000,RelativeSize=3.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=500.0000000,Max=500.0000000),Y=(Min=1000.0000000,Max=1000.0000000),Z=(Min=500.0000000,Max=500.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Dirt.BlastSpray2a'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[8]=SpriteEmitter26
	// Reference: SpriteEmitter'BWBPAirstrikesPro.MC1Explosion.SpriteEmitter27'
	begin object name="SpriteEmitter27" class=Engine.SpriteEmitter
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
		MaxParticles=2
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.5000000,RelativeSize=5.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
		StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=6
		Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[9]=SpriteEmitter27
	AutoDestroy=true
	bNoDelete=false
	bNetTemporary=true
	RemoteRole=1
	bUnlit=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBPAirstrikesPro.MC1Explosion.SpriteEmitter18'
begin object name="SpriteEmitter18" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	Acceleration=(X=4.0000000,Y=4.0000000,Z=0.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=150,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=150,B=150,A=255))
	ColorMultiplierRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.1500000,Max=0.1500000))
	Opacity=0.5000000
	FadeOutStartTime=27.0000000
	FadeInEndTime=1.2000000
	MaxParticles=250
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	StartLocationRange=(X=(Min=-1600.0000000,Max=1600.0000000),Y=(Min=-1600.0000000,Max=1600.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=400.0000000,Max=400.0000000),Y=(Min=400.0000000,Max=400.0000000),Z=(Min=400.0000000,Max=400.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.DustSmoke'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=28.0000000,Max=30.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=4.0000000,Max=4.0000000))
	MaxAbsVelocity=(X=1.0000000,Y=1.0000000,Z=0.0000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.MC1Explosion.SpriteEmitter19'
begin object name="SpriteEmitter19" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-1800.0000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.5000000,Max=0.5000000))
	MaxParticles=25
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=24.0000000,Max=24.0000000),Y=(Min=24.0000000,Max=24.0000000),Z=(Min=24.0000000,Max=24.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-1400.0000000,Max=1400.0000000),Y=(Min=-1400.0000000,Max=1400.0000000),Z=(Min=800.0000000,Max=2200.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.MC1Explosion.SpriteEmitter20'
begin object name="SpriteEmitter20" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	Acceleration=(X=4.0000000,Y=4.0000000,Z=0.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=150,B=150,A=255))
	ColorMultiplierRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.1500000,Max=0.1500000))
	Opacity=0.5000000
	FadeOutStartTime=27.0000000
	FadeInEndTime=1.2000000
	MaxParticles=60
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=350.0000000)
	StartLocationRange=(X=(Min=-800.0000000,Max=800.0000000),Y=(Min=-800.0000000,Max=800.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=400.0000000,Max=400.0000000),Y=(Min=400.0000000,Max=400.0000000),Z=(Min=400.0000000,Max=400.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.DustSmoke'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=28.0000000,Max=30.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=4.0000000,Max=4.0000000))
	MaxAbsVelocity=(X=1.0000000,Y=1.0000000,Z=0.0000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.MC1Explosion.SpriteEmitter21'
begin object name="SpriteEmitter21" class=Engine.SpriteEmitter
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
	ColorMultiplierRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.1500000,Max=0.1500000))
	FadeOutStartTime=27.6000000
	FadeInEndTime=1.2000000
	MaxParticles=500
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	MeshSpawningStaticMesh=StaticMesh'ParticleMeshes.Simple.ParticleRing'
	MeshSpawning=2
	VelocityScaleRange=(X=(Min=100.0000000,Max=1500.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	MeshScaleRange=(X=(Min=0.1000000,Max=14.0000000),Y=(Min=0.1000000,Max=14.0000000),Z=(Min=0.0100000,Max=0.0100000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=500.0000000,Max=500.0000000),Y=(Min=500.0000000,Max=500.0000000),Z=(Min=500.0000000,Max=500.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.DustSmoke'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=29.0000000,Max=30.0000000)
	VelocityLossRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.MC1Explosion.SpriteEmitter22'
begin object name="SpriteEmitter22" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.7500000
	FadeOutStartTime=0.0050000
	FadeInEndTime=0.0050000
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=25.0000000)
	StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=5
	Texture=Texture'AW-2004Particles.Energy.AirBlast'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.MC1Explosion.SpriteEmitter23'
begin object name="SpriteEmitter23" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=100,G=100,B=100,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=255))
	ColorMultiplierRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.1500000,Max=0.1500000))
	Opacity=0.5000000
	FadeOutStartTime=3.0000000
	MaxParticles=750
	AddLocationFromOtherEmitter=1
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
	InitialParticlesPerSecond=1500.0000000
	Texture=Texture'AW-2004Particles.Energy.CloudLightning'
	LifetimeRange=(Min=4.0000000,Max=5.0000000)
	InitialDelayRange=(Min=0.2500000,Max=0.2500000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=20.0000000,Max=20.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.MC1Explosion.SpriteEmitter24'
begin object name="SpriteEmitter24" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	VelocityFromMesh=true
	UniformMeshScale=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.1500000,Max=0.1500000))
	Opacity=0.5000000
	FadeOutStartTime=2.2000000
	FadeInEndTime=0.0500000
	MaxParticles=125
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	MeshSpawningStaticMesh=StaticMesh'ParticleMeshes.Simple.ParticleRing'
	MeshSpawning=2
	VelocityScaleRange=(X=(Min=100.0000000,Max=1500.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	MeshScaleRange=(X=(Min=0.1000000,Max=14.0000000),Y=(Min=0.1000000,Max=14.0000000),Z=(Min=0.0100000,Max=0.0100000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
	LifetimeRange=(Min=4.0000000,Max=5.0000000)
	VelocityLossRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.MC1Explosion.SpriteEmitter25'
begin object name="SpriteEmitter25" class=Engine.SpriteEmitter
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
	ColorMultiplierRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.1500000,Max=0.1500000))
	FadeOutStartTime=27.6000000
	FadeInEndTime=1.2000000
	MaxParticles=100
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	MeshSpawningStaticMesh=StaticMesh'ParticleMeshes.Simple.ParticleRing'
	MeshSpawning=2
	VelocityScaleRange=(X=(Min=100.0000000,Max=1500.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	MeshScaleRange=(X=(Min=0.1000000,Max=14.0000000),Y=(Min=0.1000000,Max=14.0000000),Z=(Min=0.0100000,Max=0.0100000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=400.0000000,Max=400.0000000),Y=(Min=400.0000000,Max=400.0000000),Z=(Min=400.0000000,Max=400.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels2'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=29.0000000,Max=30.0000000)
	VelocityLossRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.MC1Explosion.SpriteEmitter26'
begin object name="SpriteEmitter26" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.1500000,Max=0.1500000))
	Opacity=0.1000000
	MaxParticles=40
	StartSpinRange=(X=(Min=0.2500000,Max=0.7500000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.2500000,RelativeSize=3.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=500.0000000,Max=500.0000000),Y=(Min=1000.0000000,Max=1000.0000000),Z=(Min=500.0000000,Max=500.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Dirt.BlastSpray2a'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.MC1Explosion.SpriteEmitter27'
begin object name="SpriteEmitter27" class=Engine.SpriteEmitter
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
	MaxParticles=2
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.5000000,RelativeSize=5.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
	StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=6
	Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
