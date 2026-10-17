class IE_KnifeMetal extends DGVEmitter;

defaultproperties
{
	DisableDGV[0]=1
	// Reference: SpriteEmitter'BallisticProV55.IE_KnifeMetal.SpriteEmitter45'
	begin object name="SpriteEmitter45" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.9000000),Z=(Min=0.5000000,Max=0.7000000))
		FadeOutStartTime=0.0930000
		FadeInEndTime=0.0330000
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=2
		StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=20.0000000),Y=(Min=15.0000000,Max=20.0000000),Z=(Min=15.0000000,Max=20.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.3000000)
	end object
	Emitters[0]=SpriteEmitter45
	// Reference: SpriteEmitter'BallisticProV55.IE_KnifeMetal.SpriteEmitter46'
	begin object name="SpriteEmitter46" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3178570,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.5321430,Color=(R=255,G=255,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.7000000,Max=0.8000000))
		FadeOutStartTime=0.0630000
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=8.0000000,Max=12.0000000),Y=(Min=8.0000000,Max=12.0000000),Z=(Min=8.0000000,Max=12.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3500000,Max=0.3500000)
		StartVelocityRange=(X=(Min=0.0000000,Max=300.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=0.0000000,Max=100.0000000))
	end object
	Emitters[1]=SpriteEmitter46
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.IE_KnifeMetal.SpriteEmitter45'
begin object name="SpriteEmitter45" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.9000000),Z=(Min=0.5000000,Max=0.7000000))
	FadeOutStartTime=0.0930000
	FadeInEndTime=0.0330000
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=2
	StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=20.0000000),Y=(Min=15.0000000,Max=20.0000000),Z=(Min=15.0000000,Max=20.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.3000000)
end object
// Reference: SpriteEmitter'BallisticProV55.IE_KnifeMetal.SpriteEmitter46'
begin object name="SpriteEmitter46" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3178570,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.5321430,Color=(R=255,G=255,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.7000000,Max=0.8000000))
	FadeOutStartTime=0.0630000
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=8.0000000,Max=12.0000000),Y=(Min=8.0000000,Max=12.0000000),Z=(Min=8.0000000,Max=12.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3500000,Max=0.3500000)
	StartVelocityRange=(X=(Min=0.0000000,Max=300.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=0.0000000,Max=100.0000000))
end object
