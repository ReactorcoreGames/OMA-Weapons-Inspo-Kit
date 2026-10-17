class BWPlayerSpawnFX extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.BWPlayerSpawnFX.SpriteEmitter14'
	begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
		UseDirectionAs=4
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.4857140,Color=(R=0,G=0,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
		FadeOutStartTime=0.0720000
		FadeInEndTime=0.0240000
		MaxParticles=1
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-40.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.1000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BallisticBloodPro.DeRez.Symbol1-Small'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[0]=SpriteEmitter14
	// Reference: SpriteEmitter'BallisticProV55.BWPlayerSpawnFX.SpriteEmitter15'
	begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
		UseDirectionAs=4
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.3950000
		FadeInEndTime=0.0700000
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-45.0000000)
		SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
		SpinsPerSecondRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		InitialParticlesPerSecond=10.0000000
		Texture=Texture'BallisticBloodPro.DeRez.Symbol1-Small'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=200.0000000,Max=200.0000000))
	end object
	Emitters[1]=SpriteEmitter15
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.BWPlayerSpawnFX.SpriteEmitter14'
begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
	UseDirectionAs=4
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.4857140,Color=(R=0,G=0,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
	FadeOutStartTime=0.0720000
	FadeInEndTime=0.0240000
	MaxParticles=1
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-40.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.1000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BallisticBloodPro.DeRez.Symbol1-Small'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.BWPlayerSpawnFX.SpriteEmitter15'
begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
	UseDirectionAs=4
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.3950000
	FadeInEndTime=0.0700000
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-45.0000000)
	SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
	SpinsPerSecondRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	InitialParticlesPerSecond=10.0000000
	Texture=Texture'BallisticBloodPro.DeRez.Symbol1-Small'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=200.0000000,Max=200.0000000))
end object
