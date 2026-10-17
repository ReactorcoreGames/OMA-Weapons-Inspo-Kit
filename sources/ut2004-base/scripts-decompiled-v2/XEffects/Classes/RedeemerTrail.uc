class RedeemerTrail extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'XEffects.RedeemerTrail.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=140,G=223,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=254,G=255,B=206,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=232,B=151,A=0))
		FadeInEndTime=0.0500000
		CoordinateSystem=1
		StartLocationShape=1
		SphereRadiusRange=(Min=2.0000000,Max=2.0000000)
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=5.0000000,Max=5.0000000))
		Texture=Texture'EpicParticles.Smoke.Smokepuff2'
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=-125.0000000,Max=-150.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
		StartVelocityRadialRange=(Min=-10.0000000,Max=-10.0000000)
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'XEffects.RedeemerTrail.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=223,B=176,A=0))
		ColorScale[1]=(RelativeTime=0.1250000,Color=(R=255,G=223,B=176,A=190))
		ColorScale[2]=(RelativeTime=0.5000000,Color=(R=200,G=200,B=200,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=80,G=80,B=80,A=255))
		FadeInEndTime=0.5000000
		MaxParticles=80
		StartLocationOffset=(X=-16.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=-16.0000000,Max=16.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=-0.2000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=40.0000000
		DrawStyle=1
		Texture=Texture'EpicParticles.Smoke.Smokepuff'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[1]=SpriteEmitter1
	AutoDestroy=true
	bNoDelete=false
	Style=2
	bHardAttach=true
	bDirectional=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'XEffects.RedeemerTrail.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=223,B=176,A=0))
	ColorScale[1]=(RelativeTime=0.1250000,Color=(R=255,G=223,B=176,A=190))
	ColorScale[2]=(RelativeTime=0.5000000,Color=(R=200,G=200,B=200,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=80,G=80,B=80,A=255))
	FadeInEndTime=0.5000000
	MaxParticles=80
	StartLocationOffset=(X=-16.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=-16.0000000,Max=16.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=-0.2000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=40.0000000
	DrawStyle=1
	Texture=Texture'EpicParticles.Smoke.Smokepuff'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'XEffects.RedeemerTrail.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=140,G=223,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=254,G=255,B=206,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=232,B=151,A=0))
	FadeInEndTime=0.0500000
	CoordinateSystem=1
	StartLocationShape=1
	SphereRadiusRange=(Min=2.0000000,Max=2.0000000)
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=5.0000000,Max=5.0000000))
	Texture=Texture'EpicParticles.Smoke.Smokepuff2'
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=-125.0000000,Max=-150.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
	StartVelocityRadialRange=(Min=-10.0000000,Max=-10.0000000)
end object
