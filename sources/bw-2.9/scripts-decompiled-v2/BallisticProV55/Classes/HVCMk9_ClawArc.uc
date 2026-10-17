class HVCMk9_ClawArc extends BallisticEmitter;

defaultproperties
{
	// Reference: BeamEmitter'BallisticProV55.HVCMk9_ClawArc.BeamEmitter2'
	begin object name="BeamEmitter2" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=17.0000000,Max=17.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=160.0000000,Max=160.0000000),Y=(Min=719.0000000,Max=719.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
		DetermineEndPointBy=5
		LowFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		HighFrequencyNoiseRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
		HighFrequencyPoints=8
		UseColorScale=true
		FadeOut=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=128,A=255))
		ColorScale[1]=(RelativeTime=0.4392860,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		FadeOutStartTime=0.0220000
		MaxParticles=2
		StartLocationOffset=(X=-1.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=20.0000000),Y=(Min=2.0000000,Max=20.0000000),Z=(Min=2.0000000,Max=20.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt01aw'
		LifetimeRange=(Min=0.1000000,Max=0.1500000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
	end object
	Emitters[0]=BeamEmitter2
	// Reference: SpriteEmitter'BallisticProV55.HVCMk9_ClawArc.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.4000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.8000000),Z=(Min=1.0000000,Max=1.0000000))
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=2
		StartSizeRange=(X=(Min=15.0000000,Max=20.0000000),Y=(Min=15.0000000,Max=20.0000000),Z=(Min=15.0000000,Max=20.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
	end object
	Emitters[1]=SpriteEmitter5
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BallisticProV55.HVCMk9_ClawArc.BeamEmitter2'
begin object name="BeamEmitter2" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=17.0000000,Max=17.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=160.0000000,Max=160.0000000),Y=(Min=719.0000000,Max=719.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
	DetermineEndPointBy=5
	LowFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	HighFrequencyNoiseRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
	HighFrequencyPoints=8
	UseColorScale=true
	FadeOut=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=128,A=255))
	ColorScale[1]=(RelativeTime=0.4392860,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	FadeOutStartTime=0.0220000
	MaxParticles=2
	StartLocationOffset=(X=-1.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=20.0000000),Y=(Min=2.0000000,Max=20.0000000),Z=(Min=2.0000000,Max=20.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt01aw'
	LifetimeRange=(Min=0.1000000,Max=0.1500000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.HVCMk9_ClawArc.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.4000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.8000000),Z=(Min=1.0000000,Max=1.0000000))
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=2
	StartSizeRange=(X=(Min=15.0000000,Max=20.0000000),Y=(Min=15.0000000,Max=20.0000000),Z=(Min=15.0000000,Max=20.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
end object
