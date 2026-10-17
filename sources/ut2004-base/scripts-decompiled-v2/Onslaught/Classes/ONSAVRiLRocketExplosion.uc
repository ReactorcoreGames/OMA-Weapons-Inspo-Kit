class ONSAVRiLRocketExplosion extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'Onslaught.ONSAVRiLRocketExplosion.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=64,B=64,A=255))
		ColorScale[1]=(RelativeTime=0.6000000,Color=(R=32,G=32,B=32,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=2
		AddLocationFromOtherEmitter=1
		StartLocationShape=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.DustSmoke'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[0]=SpriteEmitter7
	// Reference: SpriteEmitter'Onslaught.ONSAVRiLRocketExplosion.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
		Opacity=0.8000000
		MaxParticles=8
		StartLocationShape=1
		SphereRadiusRange=(Min=32.0000000,Max=64.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=75.0000000,Max=75.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=2000.0000000
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[1]=SpriteEmitter5
	// Reference: SpriteEmitter'Onslaught.ONSAVRiLRocketExplosion.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=245,G=180,B=0,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.5000000
		MaxParticles=2
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Energy.JumpDuck'
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
	end object
	Emitters[2]=SpriteEmitter9
	// Reference: SpriteEmitter'Onslaught.ONSAVRiLRocketExplosion.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.7000000,Color=(R=255,G=187,B=60,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=25
		StartLocationShape=1
		SphereRadiusRange=(Min=32.0000000,Max=32.0000000)
		StartSizeRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=12.0000000,Max=12.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Energy.SparkHead'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRadialRange=(Min=-100.0000000,Max=-500.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[3]=SpriteEmitter8
	AutoDestroy=true
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSAVRiLRocketExplosion.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=64,B=64,A=255))
	ColorScale[1]=(RelativeTime=0.6000000,Color=(R=32,G=32,B=32,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=2
	AddLocationFromOtherEmitter=1
	StartLocationShape=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.DustSmoke'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSAVRiLRocketExplosion.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
	Opacity=0.8000000
	MaxParticles=8
	StartLocationShape=1
	SphereRadiusRange=(Min=32.0000000,Max=64.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=75.0000000,Max=75.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=2000.0000000
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSAVRiLRocketExplosion.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=245,G=180,B=0,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.5000000
	MaxParticles=2
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Energy.JumpDuck'
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSAVRiLRocketExplosion.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.7000000,Color=(R=255,G=187,B=60,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=25
	StartLocationShape=1
	SphereRadiusRange=(Min=32.0000000,Max=32.0000000)
	StartSizeRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=12.0000000,Max=12.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Energy.SparkHead'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRadialRange=(Min=-100.0000000,Max=-500.0000000)
	GetVelocityDirectionFrom=3
end object
