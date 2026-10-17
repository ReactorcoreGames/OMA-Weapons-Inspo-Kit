class BWDeresFX extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.BWDeresFX.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=87,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.1857140,Color=(R=255,G=128,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.4000000,Color=(R=255,G=210,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7500000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.5900000
		FadeOutStartTime=0.3600000
		FadeInEndTime=0.1600000
		MaxParticles=35
		StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=25.0000000,Max=40.0000000),Y=(Min=25.0000000,Max=40.0000000),Z=(Min=25.0000000,Max=40.0000000))
		InitialParticlesPerSecond=8.0000000
		Texture=Texture'BallisticBloodPro.DeRez.Wisp2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=5.0000000,Max=25.0000000))
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.BWDeresFX.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=87,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.1857140,Color=(R=255,G=128,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.4000000,Color=(R=255,G=210,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.5900000
		FadeOutStartTime=0.5400000
		FadeInEndTime=0.3200000
		MaxParticles=20
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=15.0000000)
		StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2400000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=25.0000000,Max=40.0000000),Y=(Min=25.0000000,Max=40.0000000),Z=(Min=25.0000000,Max=40.0000000))
		InitialParticlesPerSecond=5.0000000
		DrawStyle=5
		Texture=Texture'BallisticBloodPro.DeRez.Wisp1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=10.0000000,Max=35.0000000))
	end object
	Emitters[1]=SpriteEmitter2
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.BWDeresFX.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=87,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.1857140,Color=(R=255,G=128,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.4000000,Color=(R=255,G=210,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7500000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.5900000
	FadeOutStartTime=0.3600000
	FadeInEndTime=0.1600000
	MaxParticles=35
	StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=25.0000000,Max=40.0000000),Y=(Min=25.0000000,Max=40.0000000),Z=(Min=25.0000000,Max=40.0000000))
	InitialParticlesPerSecond=8.0000000
	Texture=Texture'BallisticBloodPro.DeRez.Wisp2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=5.0000000,Max=25.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.BWDeresFX.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=87,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.1857140,Color=(R=255,G=128,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.4000000,Color=(R=255,G=210,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.5900000
	FadeOutStartTime=0.5400000
	FadeInEndTime=0.3200000
	MaxParticles=20
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=15.0000000)
	StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2400000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=25.0000000,Max=40.0000000),Y=(Min=25.0000000,Max=40.0000000),Z=(Min=25.0000000,Max=40.0000000))
	InitialParticlesPerSecond=5.0000000
	DrawStyle=5
	Texture=Texture'BallisticBloodPro.DeRez.Wisp1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=10.0000000,Max=35.0000000))
end object
