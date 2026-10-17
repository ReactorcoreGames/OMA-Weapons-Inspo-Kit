class ONSVehicleIonExplosionEffect extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'Onslaught.ONSVehicleIonExplosionEffect.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		CoordinateSystem=1
		MaxParticles=600
		StartLocationRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-120.0000000,Max=120.0000000),Z=(Min=-32.0000000,Max=32.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=20.0000000,Max=60.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=300.0000000
		Texture=Texture'AW-2004Particles.Energy.ElecPanelsP'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
	end object
	Emitters[0]=SpriteEmitter3
	// Reference: SpriteEmitter'Onslaught.ONSVehicleIonExplosionEffect.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		CoordinateSystem=1
		MaxParticles=300
		StartLocationRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-120.0000000,Max=120.0000000),Z=(Min=-32.0000000,Max=32.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=50.0000000,Max=100.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=300.0000000
		Texture=Texture'AW-2004Particles.Energy.ElecPanelsP'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		InitialDelayRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[1]=SpriteEmitter7
	// Reference: SpriteEmitter'Onslaught.ONSVehicleIonExplosionEffect.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		UseDirectionAs=4
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.4000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=0))
		CoordinateSystem=1
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-40.0000000,Max=-20.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=5.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		InitialParticlesPerSecond=10.0000000
		Texture=Texture'AW-2004Particles.Energy.AirBlastP'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		InitialDelayRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[2]=SpriteEmitter5
	// Reference: SpriteEmitter'Onslaught.ONSVehicleIonExplosionEffect.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		StartLocationRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-30.0000000,Max=30.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=150.0000000,Max=200.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=1000.0000000
		Texture=Texture'ExplosionTex.Framed.exp2_framesP'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
		InitialDelayRange=(Min=1.5000000,Max=1.5000000)
	end object
	Emitters[3]=SpriteEmitter0
	// Reference: SpriteEmitter'Onslaught.ONSVehicleIonExplosionEffect.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		MaxParticles=6
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-30.0000000,Max=80.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		InitialParticlesPerSecond=1000.0000000
		Texture=Texture'ExplosionTex.Framed.exp2_framesP'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
		InitialDelayRange=(Min=1.6000000,Max=1.6000000)
	end object
	Emitters[4]=SpriteEmitter4
	// Reference: SpriteEmitter'Onslaught.ONSVehicleIonExplosionEffect.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.8500000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=2
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.7500000,RelativeSize=4.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Energy.PurpleSwell'
		LifetimeRange=(Min=1.2500000,Max=1.2500000)
		InitialDelayRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[5]=SpriteEmitter6
	AutoDestroy=true
	bNoDelete=false
	AmbientGlow=254
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSVehicleIonExplosionEffect.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	CoordinateSystem=1
	MaxParticles=600
	StartLocationRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-120.0000000,Max=120.0000000),Z=(Min=-32.0000000,Max=32.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=20.0000000,Max=60.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=300.0000000
	Texture=Texture'AW-2004Particles.Energy.ElecPanelsP'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSVehicleIonExplosionEffect.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	CoordinateSystem=1
	MaxParticles=300
	StartLocationRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-120.0000000,Max=120.0000000),Z=(Min=-32.0000000,Max=32.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=50.0000000,Max=100.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=300.0000000
	Texture=Texture'AW-2004Particles.Energy.ElecPanelsP'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	InitialDelayRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSVehicleIonExplosionEffect.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	UseDirectionAs=4
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.4000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=0))
	CoordinateSystem=1
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-40.0000000,Max=-20.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=5.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	InitialParticlesPerSecond=10.0000000
	Texture=Texture'AW-2004Particles.Energy.AirBlastP'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	InitialDelayRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSVehicleIonExplosionEffect.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	StartLocationRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-30.0000000,Max=30.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=150.0000000,Max=200.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=1000.0000000
	Texture=Texture'ExplosionTex.Framed.exp2_framesP'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
	InitialDelayRange=(Min=1.5000000,Max=1.5000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSVehicleIonExplosionEffect.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	MaxParticles=6
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-30.0000000,Max=80.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	InitialParticlesPerSecond=1000.0000000
	Texture=Texture'ExplosionTex.Framed.exp2_framesP'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
	InitialDelayRange=(Min=1.6000000,Max=1.6000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSVehicleIonExplosionEffect.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.8500000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=2
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.7500000,RelativeSize=4.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Energy.PurpleSwell'
	LifetimeRange=(Min=1.2500000,Max=1.2500000)
	InitialDelayRange=(Min=0.5000000,Max=0.5000000)
end object
