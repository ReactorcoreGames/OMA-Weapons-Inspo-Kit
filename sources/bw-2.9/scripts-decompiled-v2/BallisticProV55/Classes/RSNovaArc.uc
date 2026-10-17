class RSNovaArc extends BallisticEmitter;

defaultproperties
{
	// Reference: BeamEmitter'BallisticProV55.RSNovaArc.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=18.0000000,Max=18.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=0.0000000)
		DetermineEndPointBy=2
		RotatingSheets=2
		LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=0.0000000))
		HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		HighFrequencyPoints=4
		FadeOut=true
		FadeIn=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.4000000,Max=0.6500000),Y=(Min=0.7000000,Max=0.8000000),Z=(Min=0.9000000,Max=1.0000000))
		FadeOutStartTime=0.0640000
		FadeInEndTime=0.0160000
		CoordinateSystem=1
		MaxParticles=2
		StartSizeRange=(X=(Min=2.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=25.0000000),Z=(Min=10.0000000,Max=25.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt01aw'
		LifetimeRange=(Min=0.1000000,Max=0.1500000)
	end object
	Emitters[0]=BeamEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RSNovaArc.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.4000000),Y=(Min=0.2000000,Max=0.5000000),Z=(Min=0.8000000,Max=1.0000000))
		FadeOutStartTime=0.1200000
		CoordinateSystem=1
		MaxParticles=1
		StartSizeRange=(X=(Min=8.0000000,Max=12.0000000),Y=(Min=8.0000000,Max=12.0000000),Z=(Min=8.0000000,Max=12.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		LifetimeRange=(Min=0.1000000,Max=0.2000000)
	end object
	Emitters[1]=SpriteEmitter0
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BallisticProV55.RSNovaArc.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=18.0000000,Max=18.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=0.0000000)
	DetermineEndPointBy=2
	RotatingSheets=2
	LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=0.0000000))
	HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	HighFrequencyPoints=4
	FadeOut=true
	FadeIn=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.4000000,Max=0.6500000),Y=(Min=0.7000000,Max=0.8000000),Z=(Min=0.9000000,Max=1.0000000))
	FadeOutStartTime=0.0640000
	FadeInEndTime=0.0160000
	CoordinateSystem=1
	MaxParticles=2
	StartSizeRange=(X=(Min=2.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=25.0000000),Z=(Min=10.0000000,Max=25.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt01aw'
	LifetimeRange=(Min=0.1000000,Max=0.1500000)
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaArc.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.4000000),Y=(Min=0.2000000,Max=0.5000000),Z=(Min=0.8000000,Max=1.0000000))
	FadeOutStartTime=0.1200000
	CoordinateSystem=1
	MaxParticles=1
	StartSizeRange=(X=(Min=8.0000000,Max=12.0000000),Y=(Min=8.0000000,Max=12.0000000),Z=(Min=8.0000000,Max=12.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	LifetimeRange=(Min=0.1000000,Max=0.2000000)
end object
