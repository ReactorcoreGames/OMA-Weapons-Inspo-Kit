class ONSGrenadeBeaconBlue extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'Onslaught.ONSGrenadeBeaconBlue.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=255,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		FadeInEndTime=0.2500000
		CoordinateSystem=1
		MaxParticles=2
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=7.0000000,Max=7.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=4.0000000
		Texture=Texture'AW-2004Particles.Energy.AirBlast'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		InitialDelayRange=(Min=0.3000000,Max=0.3000000)
	end object
	Emitters[0]=SpriteEmitter2
	// Reference: SpriteEmitter'Onslaught.ONSGrenadeBeaconBlue.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.7500000,Color=(R=0,G=0,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.2500000
		CoordinateSystem=1
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=17.0000000,Max=17.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=4.0000000
		Texture=Texture'AW-2004Particles.Energy.EclipseCircle'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		InitialDelayRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[1]=SpriteEmitter3
	// Reference: MeshEmitter'Onslaught.ONSGrenadeBeaconBlue.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'VMWeaponsSM.PlayerWeaponsGroup.VMGrenade'
		UseMeshBlendMode=false
		UseParticleColor=true
		UseColorScale=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=0,G=0,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.2500000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=0.0750000,Max=0.0750000),Y=(Min=0.0750000,Max=0.0750000),Z=(Min=0.0750000,Max=0.0750000))
		Sounds[0]=(Sound=Sound'AssaultSounds.HumanShip.TargetCycle01',Radius=(Min=24.0000000,Max=24.0000000),Pitch=(Min=0.4500000,Max=0.5250000),Weight=0,Volume=(Min=1.0000000,Max=1.0000000),Probability=(Min=1.0000000,Max=1.0000000))
		SpawningSound=2
		SpawningSoundProbability=(Min=1.0000000,Max=1.0000000)
		InitialParticlesPerSecond=5000.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		InitialDelayRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[2]=MeshEmitter0
	TimeTillResetRange=(Min=5.0000000,Max=5.0000000)
	AutoReset=true
	CullDistance=5000.0000000
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSGrenadeBeaconBlue.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=255,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	FadeInEndTime=0.2500000
	CoordinateSystem=1
	MaxParticles=2
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=7.0000000,Max=7.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=4.0000000
	Texture=Texture'AW-2004Particles.Energy.AirBlast'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	InitialDelayRange=(Min=0.3000000,Max=0.3000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSGrenadeBeaconBlue.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.7500000,Color=(R=0,G=0,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.2500000
	CoordinateSystem=1
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=17.0000000,Max=17.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=4.0000000
	Texture=Texture'AW-2004Particles.Energy.EclipseCircle'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	InitialDelayRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: MeshEmitter'Onslaught.ONSGrenadeBeaconBlue.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'VMWeaponsSM.PlayerWeaponsGroup.VMGrenade'
	UseMeshBlendMode=false
	UseParticleColor=true
	UseColorScale=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=0,G=0,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.2500000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=0.0750000,Max=0.0750000),Y=(Min=0.0750000,Max=0.0750000),Z=(Min=0.0750000,Max=0.0750000))
	Sounds[0]=(Sound=Sound'AssaultSounds.HumanShip.TargetCycle01',Radius=(Min=24.0000000,Max=24.0000000),Pitch=(Min=0.4500000,Max=0.5250000),Weight=0,Volume=(Min=1.0000000,Max=1.0000000),Probability=(Min=1.0000000,Max=1.0000000))
	SpawningSound=2
	SpawningSoundProbability=(Min=1.0000000,Max=1.0000000)
	InitialParticlesPerSecond=5000.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	InitialDelayRange=(Min=0.5000000,Max=0.5000000)
end object
