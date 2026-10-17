class LUU4explosion extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBPAirstrikesPro.LUU4explosion.SpriteEmitter16'
	begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.1000000
		MaxParticles=1
		StartSizeRange=(X=(Min=500.0000000,Max=500.0000000),Y=(Min=500.0000000,Max=500.0000000),Z=(Min=500.0000000,Max=500.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Flares.BurnFlare1'
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[0]=SpriteEmitter16
	// Reference: SpriteEmitter'BWBPAirstrikesPro.LUU4explosion.SpriteEmitter17'
	begin object name="SpriteEmitter17" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=9.3000000
		MaxParticles=2
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=400.0000000,Max=400.0000000),Y=(Min=400.0000000,Max=400.0000000),Z=(Min=400.0000000,Max=400.0000000))
		InitialParticlesPerSecond=9999.0000000
		Texture=Texture'EpicParticles.Flares.Sharpstreaks'
		LifetimeRange=(Min=9.0000000,Max=10.0000000)
	end object
	Emitters[1]=SpriteEmitter17
	// Reference: SpriteEmitter'BWBPAirstrikesPro.LUU4explosion.SpriteEmitter18'
	begin object name="SpriteEmitter18" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=9.3000000
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=400.0000000,Max=400.0000000),Y=(Min=400.0000000,Max=400.0000000),Z=(Min=400.0000000,Max=400.0000000))
		InitialParticlesPerSecond=9999.0000000
		Texture=Texture'EpicParticles.Flares.SoftFlare'
		LifetimeRange=(Min=9.0000000,Max=10.0000000)
	end object
	Emitters[2]=SpriteEmitter18
	AutoDestroy=true
	bNoDelete=false
	bNetTemporary=true
	RemoteRole=1
	bUnlit=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBPAirstrikesPro.LUU4explosion.SpriteEmitter16'
begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.1000000
	MaxParticles=1
	StartSizeRange=(X=(Min=500.0000000,Max=500.0000000),Y=(Min=500.0000000,Max=500.0000000),Z=(Min=500.0000000,Max=500.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Flares.BurnFlare1'
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.LUU4explosion.SpriteEmitter17'
begin object name="SpriteEmitter17" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=9.3000000
	MaxParticles=2
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=400.0000000,Max=400.0000000),Y=(Min=400.0000000,Max=400.0000000),Z=(Min=400.0000000,Max=400.0000000))
	InitialParticlesPerSecond=9999.0000000
	Texture=Texture'EpicParticles.Flares.Sharpstreaks'
	LifetimeRange=(Min=9.0000000,Max=10.0000000)
end object
// Reference: SpriteEmitter'BWBPAirstrikesPro.LUU4explosion.SpriteEmitter18'
begin object name="SpriteEmitter18" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=9.3000000
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=400.0000000,Max=400.0000000),Y=(Min=400.0000000,Max=400.0000000),Z=(Min=400.0000000,Max=400.0000000))
	InitialParticlesPerSecond=9999.0000000
	Texture=Texture'EpicParticles.Flares.SoftFlare'
	LifetimeRange=(Min=9.0000000,Max=10.0000000)
end object
