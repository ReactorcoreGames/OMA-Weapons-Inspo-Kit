class ClusterExplosion extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBPAirstrikesPro.ClusterExplosion.SpriteEmitter72'
	begin object name="SpriteEmitter72" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		StartLocationShape=1
		SphereRadiusRange=(Min=-200.0000000,Max=200.0000000)
		StartSpinRange=(X=(Min=1.0550000,Max=2.3550000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		InitialParticlesPerSecond=1500.0000000
		Texture=Texture'VMParticleTextures.VehicleExplosions.VMExp2_framesANIM'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[0]=SpriteEmitter72
	// Reference: SpriteEmitter'BWBPAirstrikesPro.ClusterExplosion.SpriteEmitter75'
	begin object name="SpriteEmitter75" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.2500000
		MaxParticles=5
		StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[1]=SpriteEmitter75
	// Reference: SpriteEmitter'BWBPAirstrikesPro.ClusterExplosion.SpriteEmitter76'
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
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=100,G=100,B=100,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=255))
		FadeOutStartTime=4.7400000
		FadeInEndTime=0.9000000
		MaxParticles=8
		StartLocationRange=(X=(Min=-250.0000000,Max=250.0000000),Y=(Min=-250.0000000,Max=250.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels2'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=5.0000000,Max=7.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=20.0000000,Max=20.0000000))
	end object
	Emitters[2]=SpriteEmitter76
	// Reference: SpriteEmitter'BWBPAirstrikesPro.ClusterExplosion.SpriteEmitter77'
	begin object name="SpriteEmitter77" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.0500000
		MaxParticles=1
		StartSizeRange=(X=(Min=700.0000000,Max=700.0000000),Y=(Min=700.0000000,Max=700.0000000),Z=(Min=700.0000000,Max=700.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Flares.SoftFlare'
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
	end object
	Emitters[3]=SpriteEmitter77
	AutoDestroy=true
	bNoDelete=false
	bNetTemporary=true
	RemoteRole=1
	Skins[0]=Texture'EpicParticles.Beams.RadialBands'
	bUnlit=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBPAirstrikesPro.ClusterExplosion.SpriteEmitter72'
begin object name="SpriteEmitter72" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	StartLocationShape=1
	SphereRadiusRange=(Min=-200.0000000,Max=200.0000000)
	StartSpinRange=(X=(Min=1.0550000,Max=2.3550000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	InitialParticlesPerSecond=1500.0000000
	Texture=Texture'VMParticleTextures.VehicleExplosions.VMExp2_framesANIM'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.ClusterExplosion.SpriteEmitter75'
begin object name="SpriteEmitter75" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.2500000
	MaxParticles=5
	StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.ClusterExplosion.SpriteEmitter76'
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
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=100,G=100,B=100,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=255))
	FadeOutStartTime=4.7400000
	FadeInEndTime=0.9000000
	MaxParticles=8
	StartLocationRange=(X=(Min=-250.0000000,Max=250.0000000),Y=(Min=-250.0000000,Max=250.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels2'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=5.0000000,Max=7.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=20.0000000,Max=20.0000000))
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.ClusterExplosion.SpriteEmitter77'
begin object name="SpriteEmitter77" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.0500000
	MaxParticles=1
	StartSizeRange=(X=(Min=700.0000000,Max=700.0000000),Y=(Min=700.0000000,Max=700.0000000),Z=(Min=700.0000000,Max=700.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Flares.SoftFlare'
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
end object
