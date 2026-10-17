class ONSVehicleExplosionEffect extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'Onslaught.ONSVehicleExplosionEffect.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		MaxParticles=1
		StartSizeRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'AW-2004Particles.Energy.SparkHead'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=500.0000000,Max=500.0000000))
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'Onslaught.ONSVehicleExplosionEffect.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=5
		StartLocationRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=10.0000000))
		AddLocationFromOtherEmitter=0
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.2500000)
		InitialParticlesPerSecond=10.0000000
		DrawStyle=1
		Texture=Texture'ExplosionTex.Framed.exp2_frames'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: SpriteEmitter'Onslaught.ONSVehicleExplosionEffect.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		BlendBetweenSubdivisions=true
		MaxParticles=8
		StartLocationRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		AddLocationFromOtherEmitter=0
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		InitialParticlesPerSecond=10.0000000
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
		AddVelocityFromOtherEmitter=0
		AddVelocityMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
	end object
	Emitters[2]=SpriteEmitter2
	// Reference: SpriteEmitter'Onslaught.ONSVehicleExplosionEffect.SpriteEmitter11'
	begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.3000000,Color=(R=255,G=196,B=106,A=255))
		ColorScale[2]=(RelativeTime=0.5000000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=5
		DetailMode=1
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=15.0000000))
		StartLocationShape=3
		StartLocationPolarRange=(X=(Min=0.0000000,Max=65536.0000000),Y=(Min=16384.0000000,Max=16384.0000000),Z=(Min=100.0000000,Max=100.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		Texture=Texture'ExplosionTex.Framed.we1_frames'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[3]=SpriteEmitter11
	// Reference: SpriteEmitter'Onslaught.ONSVehicleExplosionEffect.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseVelocityScale=true
		MaxParticles=5
		DetailMode=1
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=15.0000000))
		StartLocationShape=3
		StartLocationPolarRange=(X=(Min=0.0000000,Max=65536.0000000),Y=(Min=16384.0000000,Max=16384.0000000),Z=(Min=100.0000000,Max=100.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		InitialParticlesPerSecond=30.0000000
		Texture=Texture'ExplosionTex.Framed.exp2_frames'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.7000000,Max=0.7000000)
		StartVelocityRadialRange=(Min=-150.0000000,Max=-150.0000000)
		GetVelocityDirectionFrom=3
		VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
		VelocityScale[1]=(RelativeTime=0.5000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
		VelocityScale[2]=(RelativeTime=0.7500000,RelativeVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000))
		VelocityScale[3]=(RelativeTime=1.0000000,RelativeVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000))
	end object
	Emitters[4]=SpriteEmitter3
	// Reference: SpriteEmitter'Onslaught.ONSVehicleExplosionEffect.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		Opacity=0.5000000
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=15.0000000))
		StartLocationShape=3
		StartLocationPolarRange=(X=(Min=0.0000000,Max=65536.0000000),Y=(Min=16384.0000000,Max=16384.0000000),Z=(Min=80.0000000,Max=150.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		InitialParticlesPerSecond=50.0000000
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.7000000,Max=0.7000000)
		InitialDelayRange=(Min=0.1500000,Max=0.1500000)
	end object
	Emitters[5]=SpriteEmitter7
	AutoDestroy=true
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSVehicleExplosionEffect.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	Opacity=0.5000000
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=15.0000000))
	StartLocationShape=3
	StartLocationPolarRange=(X=(Min=0.0000000,Max=65536.0000000),Y=(Min=16384.0000000,Max=16384.0000000),Z=(Min=80.0000000,Max=150.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	InitialParticlesPerSecond=50.0000000
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.7000000,Max=0.7000000)
	InitialDelayRange=(Min=0.1500000,Max=0.1500000)
end object
// Reference: SpriteEmitter'Onslaught.ONSVehicleExplosionEffect.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	MaxParticles=1
	StartSizeRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'AW-2004Particles.Energy.SparkHead'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=500.0000000,Max=500.0000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSVehicleExplosionEffect.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=5
	StartLocationRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=10.0000000))
	AddLocationFromOtherEmitter=0
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.2500000)
	InitialParticlesPerSecond=10.0000000
	DrawStyle=1
	Texture=Texture'ExplosionTex.Framed.exp2_frames'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSVehicleExplosionEffect.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	BlendBetweenSubdivisions=true
	MaxParticles=8
	StartLocationRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	AddLocationFromOtherEmitter=0
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	InitialParticlesPerSecond=10.0000000
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
	AddVelocityFromOtherEmitter=0
	AddVelocityMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSVehicleExplosionEffect.SpriteEmitter11'
begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.3000000,Color=(R=255,G=196,B=106,A=255))
	ColorScale[2]=(RelativeTime=0.5000000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=5
	DetailMode=1
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=15.0000000))
	StartLocationShape=3
	StartLocationPolarRange=(X=(Min=0.0000000,Max=65536.0000000),Y=(Min=16384.0000000,Max=16384.0000000),Z=(Min=100.0000000,Max=100.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	Texture=Texture'ExplosionTex.Framed.we1_frames'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSVehicleExplosionEffect.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseVelocityScale=true
	MaxParticles=5
	DetailMode=1
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=15.0000000))
	StartLocationShape=3
	StartLocationPolarRange=(X=(Min=0.0000000,Max=65536.0000000),Y=(Min=16384.0000000,Max=16384.0000000),Z=(Min=100.0000000,Max=100.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	InitialParticlesPerSecond=30.0000000
	Texture=Texture'ExplosionTex.Framed.exp2_frames'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.7000000,Max=0.7000000)
	StartVelocityRadialRange=(Min=-150.0000000,Max=-150.0000000)
	GetVelocityDirectionFrom=3
	VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
	VelocityScale[1]=(RelativeTime=0.5000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
	VelocityScale[2]=(RelativeTime=0.7500000,RelativeVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000))
	VelocityScale[3]=(RelativeTime=1.0000000,RelativeVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000))
end object
