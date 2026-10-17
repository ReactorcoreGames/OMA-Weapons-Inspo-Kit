class ONSGrenadeExplosionEffect extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'Onslaught.ONSGrenadeExplosionEffect.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=30.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=0,G=0,B=0,A=128))
		ColorScale[2]=(RelativeTime=0.3000000,Color=(R=0,G=0,B=0,A=128))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=2
		AddLocationFromOtherEmitter=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		Texture=Texture'EpicParticles.Smoke.Smokepuff2'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'Onslaught.ONSGrenadeExplosionEffect.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		UseVelocityScale=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=150,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=150,G=150,B=150,A=128))
		ColorScale[2]=(RelativeTime=0.5000000,Color=(R=150,G=150,B=150,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=150,G=150,B=150,A=0))
		MaxParticles=3
		StartLocationShape=1
		SphereRadiusRange=(Min=1.0000000,Max=1.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=3.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
		StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels2'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRadialRange=(Min=-50.0000000,Max=-100.0000000)
		GetVelocityDirectionFrom=3
		VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
		VelocityScale[1]=(RelativeTime=0.1000000,RelativeVelocity=(X=0.1000000,Y=0.1000000,Z=0.1000000))
		VelocityScale[2]=(RelativeTime=0.5000000,RelativeVelocity=(X=0.0500000,Y=0.0500000,Z=0.0500000))
		VelocityScale[3]=(RelativeTime=1.0000000,RelativeVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000))
	end object
	Emitters[1]=SpriteEmitter4
	// Reference: SpriteEmitter'Onslaught.ONSGrenadeExplosionEffect.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=25.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=0,G=0,B=0,A=128))
		ColorScale[2]=(RelativeTime=0.5000000,Color=(R=0,G=0,B=0,A=128))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=3
		DetailMode=1
		StartLocationShape=1
		SphereRadiusRange=(Min=1.0000000,Max=1.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=3.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels2'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
		StartVelocityRadialRange=(Min=-10.0000000,Max=-20.0000000)
		GetVelocityDirectionFrom=3
		VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
		VelocityScale[1]=(RelativeTime=0.1000000,RelativeVelocity=(X=0.1000000,Y=0.1000000,Z=0.1000000))
		VelocityScale[2]=(RelativeTime=0.5000000,RelativeVelocity=(X=0.0500000,Y=0.0500000,Z=0.0500000))
		VelocityScale[3]=(RelativeTime=1.0000000,RelativeVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000))
	end object
	Emitters[2]=SpriteEmitter2
	// Reference: SpriteEmitter'Onslaught.ONSGrenadeExplosionEffect.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.6500000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=3
		StartLocationShape=1
		SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'AW-2004Particles.Fire.GrenadeTest'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.3500000,Max=0.3500000)
		InitialDelayRange=(Min=0.0500000,Max=0.0500000)
	end object
	Emitters[3]=SpriteEmitter1
	// Reference: SpriteEmitter'Onslaught.ONSGrenadeExplosionEffect.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=241,G=137,B=22,A=0))
		ColorScale[1]=(RelativeTime=0.3000000,Color=(R=192,G=64,B=0,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.5000000
		MaxParticles=3
		DetailMode=1
		StartLocationShape=1
		SphereRadiusRange=(Min=0.0000000,Max=8.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'AW-2004Particles.Energy.AirBlast'
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
	end object
	Emitters[4]=SpriteEmitter3
	AutoDestroy=true
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSGrenadeExplosionEffect.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=25.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=0,G=0,B=0,A=128))
	ColorScale[2]=(RelativeTime=0.5000000,Color=(R=0,G=0,B=0,A=128))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=3
	DetailMode=1
	StartLocationShape=1
	SphereRadiusRange=(Min=1.0000000,Max=1.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=3.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels2'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
	StartVelocityRadialRange=(Min=-10.0000000,Max=-20.0000000)
	GetVelocityDirectionFrom=3
	VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
	VelocityScale[1]=(RelativeTime=0.1000000,RelativeVelocity=(X=0.1000000,Y=0.1000000,Z=0.1000000))
	VelocityScale[2]=(RelativeTime=0.5000000,RelativeVelocity=(X=0.0500000,Y=0.0500000,Z=0.0500000))
	VelocityScale[3]=(RelativeTime=1.0000000,RelativeVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSGrenadeExplosionEffect.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=30.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=0,G=0,B=0,A=128))
	ColorScale[2]=(RelativeTime=0.3000000,Color=(R=0,G=0,B=0,A=128))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=2
	AddLocationFromOtherEmitter=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	Texture=Texture'EpicParticles.Smoke.Smokepuff2'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSGrenadeExplosionEffect.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	UseVelocityScale=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=150,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=150,G=150,B=150,A=128))
	ColorScale[2]=(RelativeTime=0.5000000,Color=(R=150,G=150,B=150,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=150,G=150,B=150,A=0))
	MaxParticles=3
	StartLocationShape=1
	SphereRadiusRange=(Min=1.0000000,Max=1.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=3.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
	StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels2'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRadialRange=(Min=-50.0000000,Max=-100.0000000)
	GetVelocityDirectionFrom=3
	VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
	VelocityScale[1]=(RelativeTime=0.1000000,RelativeVelocity=(X=0.1000000,Y=0.1000000,Z=0.1000000))
	VelocityScale[2]=(RelativeTime=0.5000000,RelativeVelocity=(X=0.0500000,Y=0.0500000,Z=0.0500000))
	VelocityScale[3]=(RelativeTime=1.0000000,RelativeVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSGrenadeExplosionEffect.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.6500000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=3
	StartLocationShape=1
	SphereRadiusRange=(Min=0.0000000,Max=16.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'AW-2004Particles.Fire.GrenadeTest'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	LifetimeRange=(Min=0.3500000,Max=0.3500000)
	InitialDelayRange=(Min=0.0500000,Max=0.0500000)
end object
// Reference: SpriteEmitter'Onslaught.ONSGrenadeExplosionEffect.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=241,G=137,B=22,A=0))
	ColorScale[1]=(RelativeTime=0.3000000,Color=(R=192,G=64,B=0,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.5000000
	MaxParticles=3
	DetailMode=1
	StartLocationShape=1
	SphereRadiusRange=(Min=0.0000000,Max=8.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'AW-2004Particles.Energy.AirBlast'
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
end object
