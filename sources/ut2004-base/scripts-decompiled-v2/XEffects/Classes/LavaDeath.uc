class LavaDeath extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'XEffects.LavaDeath.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=15.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=200,G=152,B=51,A=0))
		ColorScale[1]=(RelativeTime=0.3000000,Color=(R=222,G=91,B=48,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=40
		StartLocationRange=(X=(Min=-8.0000000,Max=8.0000000),Y=(Min=-8.0000000,Max=8.0000000),Z=(Min=-32.0000000,Max=32.0000000))
		StartLocationShape=3
		SphereRadiusRange=(Min=48.0000000,Max=48.0000000)
		MeshSpawningStaticMesh=StaticMesh'ParticleMeshes.Simple.ParticleBomb'
		MeshScaleRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=40.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
		Texture=Texture'EpicParticles.Smoke.Smokepuff2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: SpriteEmitter'XEffects.LavaDeath.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=150.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=128))
		ColorScale[1]=(RelativeTime=0.3000000,Color=(R=179,G=80,B=47,A=255))
		ColorScale[2]=(RelativeTime=0.6000000,Color=(R=0,G=0,B=0,A=80))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=20
		StartLocationShape=1
		SphereRadiusRange=(Min=48.0000000,Max=48.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=40.0000000),Y=(Min=20.0000000,Max=40.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=80.0000000
		DrawStyle=1
		Texture=Texture'EpicParticles.Smoke.Smokepuff'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7000000,Max=0.7000000)
	end object
	Emitters[1]=SpriteEmitter2
	AutoDestroy=true
	bNoDelete=false
	bHighDetail=true
	bNetTemporary=true
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'XEffects.LavaDeath.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=15.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=200,G=152,B=51,A=0))
	ColorScale[1]=(RelativeTime=0.3000000,Color=(R=222,G=91,B=48,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=40
	StartLocationRange=(X=(Min=-8.0000000,Max=8.0000000),Y=(Min=-8.0000000,Max=8.0000000),Z=(Min=-32.0000000,Max=32.0000000))
	StartLocationShape=3
	SphereRadiusRange=(Min=48.0000000,Max=48.0000000)
	MeshSpawningStaticMesh=StaticMesh'ParticleMeshes.Simple.ParticleBomb'
	MeshScaleRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=40.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
	Texture=Texture'EpicParticles.Smoke.Smokepuff2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
end object
// Reference: SpriteEmitter'XEffects.LavaDeath.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=150.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=128))
	ColorScale[1]=(RelativeTime=0.3000000,Color=(R=179,G=80,B=47,A=255))
	ColorScale[2]=(RelativeTime=0.6000000,Color=(R=0,G=0,B=0,A=80))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=20
	StartLocationShape=1
	SphereRadiusRange=(Min=48.0000000,Max=48.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=40.0000000),Y=(Min=20.0000000,Max=40.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=80.0000000
	DrawStyle=1
	Texture=Texture'EpicParticles.Smoke.Smokepuff'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7000000,Max=0.7000000)
end object
