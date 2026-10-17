class TraceEmitter_M763Gas extends BCTraceEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.TraceEmitter_M763Gas.M763GasConeEmitter'
	begin object name="M763GasConeEmitter" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.5200000
		FadeOutStartTime=1.0000000
		FadeInEndTime=0.9000000
		CoordinateSystem=1
		MaxParticles=15
		StartLocationRange=(X=(Min=5.0000000,Max=500.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=-32.0000000,Max=32.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=75.0000000,Max=100.0000000),Y=(Min=75.0000000,Max=100.0000000),Z=(Min=75.0000000,Max=100.0000000))
		InitialParticlesPerSecond=30.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Effects.Smoke7'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=5.0000000,Max=5.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-10.0000000,Max=0.0000000))
		VelocityLossRange=(X=(Min=0.0000000,Max=11.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=M763GasConeEmitter
	// Reference: SpriteEmitter'BallisticProV55.TraceEmitter_M763Gas.M763LingeringGas'
	begin object name="M763LingeringGas" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.2500000
		FadeOutStartTime=0.3200000
		FadeInEndTime=0.1800000
		CoordinateSystem=1
		MaxParticles=50
		StartLocationRange=(X=(Min=-64.0000000,Max=64.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.0400000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=0.3700000,RelativeSize=0.6000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=55.0000000,Max=75.0000000),Y=(Min=55.0000000,Max=75.0000000),Z=(Min=55.0000000,Max=75.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=6.0000000,Max=6.0000000)
		StartVelocityRange=(X=(Min=5.0000000,Max=3000.0000000),Y=(Min=-120.0000000,Max=120.0000000),Z=(Min=-120.0000000,Max=120.0000000))
		VelocityLossRange=(X=(Min=0.0000000,Max=11.0000000),Y=(Min=0.0000000,Max=3.0000000),Z=(Min=0.0000000,Max=3.0000000))
	end object
	Emitters[1]=M763LingeringGas
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.TraceEmitter_M763Gas.M763GasConeEmitter'
begin object name="M763GasConeEmitter" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.5200000
	FadeOutStartTime=1.0000000
	FadeInEndTime=0.9000000
	CoordinateSystem=1
	MaxParticles=15
	StartLocationRange=(X=(Min=5.0000000,Max=500.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=-32.0000000,Max=32.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=75.0000000,Max=100.0000000),Y=(Min=75.0000000,Max=100.0000000),Z=(Min=75.0000000,Max=100.0000000))
	InitialParticlesPerSecond=30.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Effects.Smoke7'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=5.0000000,Max=5.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-10.0000000,Max=0.0000000))
	VelocityLossRange=(X=(Min=0.0000000,Max=11.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.TraceEmitter_M763Gas.M763LingeringGas'
begin object name="M763LingeringGas" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.2500000
	FadeOutStartTime=0.3200000
	FadeInEndTime=0.1800000
	CoordinateSystem=1
	MaxParticles=50
	StartLocationRange=(X=(Min=-64.0000000,Max=64.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.0400000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=0.3700000,RelativeSize=0.6000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=55.0000000,Max=75.0000000),Y=(Min=55.0000000,Max=75.0000000),Z=(Min=55.0000000,Max=75.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=6.0000000,Max=6.0000000)
	StartVelocityRange=(X=(Min=5.0000000,Max=3000.0000000),Y=(Min=-120.0000000,Max=120.0000000),Z=(Min=-120.0000000,Max=120.0000000))
	VelocityLossRange=(X=(Min=0.0000000,Max=11.0000000),Y=(Min=0.0000000,Max=3.0000000),Z=(Min=0.0000000,Max=3.0000000))
end object
