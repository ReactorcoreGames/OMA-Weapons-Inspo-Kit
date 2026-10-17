class ONSAvrilSmokeTrail extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'Onslaught.ONSAvrilSmokeTrail.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=85,G=157,B=210,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=226,B=130,A=0))
		ColorScale[2]=(RelativeTime=0.3000000,Color=(R=225,G=135,B=0,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=8
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ParticlesPerSecond=120.0000000
		InitialParticlesPerSecond=120.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
	end object
	Emitters[0]=SpriteEmitter8
	// Reference: SpriteEmitter'Onslaught.ONSAvrilSmokeTrail.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		Backup_Disabled=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=160,G=160,B=160,A=255))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=120,G=120,B=120,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=0))
		MaxParticles=1000
		StartLocationShape=1
		SphereRadiusRange=(Min=0.0000000,Max=8.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.5500000,Max=0.4500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.1500000,RelativeSize=2.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ParticlesPerSecond=150.0000000
		InitialParticlesPerSecond=150.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Fire.MuchSmoke1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=2.0000000,Max=2.5000000)
		StartVelocityRange=(X=(Min=-5.0000000,Max=-5.0000000),Y=(Min=-5.0000000,Max=-5.0000000),Z=(Min=-5.0000000,Max=-5.0000000))
	end object
	Emitters[1]=SpriteEmitter9
	AutoDestroy=true
	bNoDelete=false
	AmbientSound=Sound'WeaponSounds.RocketLauncher.RocketLauncherProjectile'
	bHardAttach=true
	SoundVolume=255
	SoundRadius=100.0000000
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSAvrilSmokeTrail.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=85,G=157,B=210,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=226,B=130,A=0))
	ColorScale[2]=(RelativeTime=0.3000000,Color=(R=225,G=135,B=0,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=8
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ParticlesPerSecond=120.0000000
	InitialParticlesPerSecond=120.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSAvrilSmokeTrail.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	Backup_Disabled=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=160,G=160,B=160,A=255))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=120,G=120,B=120,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=0))
	MaxParticles=1000
	StartLocationShape=1
	SphereRadiusRange=(Min=0.0000000,Max=8.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.5500000,Max=0.4500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.1500000,RelativeSize=2.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ParticlesPerSecond=150.0000000
	InitialParticlesPerSecond=150.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Fire.MuchSmoke1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=2.0000000,Max=2.5000000)
	StartVelocityRange=(X=(Min=-5.0000000,Max=-5.0000000),Y=(Min=-5.0000000,Max=-5.0000000),Z=(Min=-5.0000000,Max=-5.0000000))
end object
