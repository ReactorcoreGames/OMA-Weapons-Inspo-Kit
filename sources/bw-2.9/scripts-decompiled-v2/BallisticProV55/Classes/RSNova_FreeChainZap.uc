class RSNova_FreeChainZap extends BallisticEmitter;

defaultproperties
{
	// Reference: BeamEmitter'BallisticProV55.RSNova_FreeChainZap.BeamEmitter1'
	begin object name="BeamEmitter1" class=Engine.BeamEmitter
		DetermineEndPointBy=2
		BeamTextureUScale=0.8000000
		RotatingSheets=2
		LowFrequencyNoiseRange=(X=(Min=50.0000000,Max=100.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
		LowFrequencyPoints=5
		HighFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=96,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=255,A=255))
		FadeOutStartTime=0.1325000
		FadeInEndTime=0.0275000
		CoordinateSystem=1
		MaxParticles=5
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.2500000)
		StartSizeRange=(X=(Min=15.0000000,Max=25.0000000),Y=(Min=15.0000000,Max=25.0000000),Z=(Min=15.0000000,Max=25.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt02aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2500000,Max=0.2500000)
	end object
	Emitters[0]=BeamEmitter1
	// Reference: SpriteEmitter'BallisticProV55.RSNova_FreeChainZap.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=255,A=255))
		FadeOutStartTime=0.0765000
		FadeInEndTime=0.0195000
		CoordinateSystem=1
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=35.0000000,Max=40.0000000),Y=(Min=35.0000000,Max=40.0000000),Z=(Min=35.0000000,Max=40.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1500000,Max=0.1500000)
	end object
	Emitters[1]=SpriteEmitter3
	// Reference: BeamEmitter'BallisticProV55.RSNova_FreeChainZap.BeamEmitter2'
	begin object name="BeamEmitter2" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=128.0000000,Max=512.0000000)
		LowFrequencyNoiseRange=(X=(Min=150.0000000,Max=250.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
		HighFrequencyNoiseRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
		HighFrequencyPoints=8
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=128,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2428570,Color=(R=0,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.5000000,Color=(R=128,G=192,B=255,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.3200000
		FadeInEndTime=0.0600000
		CoordinateSystem=1
		MaxParticles=1
		SphereRadiusRange=(Min=24.0000000,Max=24.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=0.2500000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=35.0000000),Y=(Min=15.0000000,Max=35.0000000),Z=(Min=15.0000000,Max=35.0000000))
		InitialParticlesPerSecond=5.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRadialRange=(Min=-1.0000000,Max=-1.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[2]=BeamEmitter2
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BallisticProV55.RSNova_FreeChainZap.BeamEmitter1'
begin object name="BeamEmitter1" class=Engine.BeamEmitter
	DetermineEndPointBy=2
	BeamTextureUScale=0.8000000
	RotatingSheets=2
	LowFrequencyNoiseRange=(X=(Min=50.0000000,Max=100.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	LowFrequencyPoints=5
	HighFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=96,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=255,A=255))
	FadeOutStartTime=0.1325000
	FadeInEndTime=0.0275000
	CoordinateSystem=1
	MaxParticles=5
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.2500000)
	StartSizeRange=(X=(Min=15.0000000,Max=25.0000000),Y=(Min=15.0000000,Max=25.0000000),Z=(Min=15.0000000,Max=25.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt02aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2500000,Max=0.2500000)
end object
// Reference: SpriteEmitter'BallisticProV55.RSNova_FreeChainZap.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=255,A=255))
	FadeOutStartTime=0.0765000
	FadeInEndTime=0.0195000
	CoordinateSystem=1
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=35.0000000,Max=40.0000000),Y=(Min=35.0000000,Max=40.0000000),Z=(Min=35.0000000,Max=40.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1500000,Max=0.1500000)
end object
// Reference: BeamEmitter'BallisticProV55.RSNova_FreeChainZap.BeamEmitter2'
begin object name="BeamEmitter2" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=128.0000000,Max=512.0000000)
	LowFrequencyNoiseRange=(X=(Min=150.0000000,Max=250.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
	HighFrequencyNoiseRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
	HighFrequencyPoints=8
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=128,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2428570,Color=(R=0,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.5000000,Color=(R=128,G=192,B=255,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.3200000
	FadeInEndTime=0.0600000
	CoordinateSystem=1
	MaxParticles=1
	SphereRadiusRange=(Min=24.0000000,Max=24.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=0.2500000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=35.0000000),Y=(Min=15.0000000,Max=35.0000000),Z=(Min=15.0000000,Max=35.0000000))
	InitialParticlesPerSecond=5.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRadialRange=(Min=-1.0000000,Max=-1.0000000)
	GetVelocityDirectionFrom=3
end object
