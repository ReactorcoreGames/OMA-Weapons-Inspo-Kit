class HVCMk9_RedSpiral extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.HVCMk9_RedSpiral.SpriteEmitter15'
	begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
		UseDirectionAs=3
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.3600000
		FadeInEndTime=0.1300000
		CoordinateSystem=1
		MaxParticles=8
		StartLocationOffset=(X=-10.0000000,Y=0.0000000,Z=0.0000000)
		SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
		SpinsPerSecondRange=(X=(Min=-0.2500000,Max=-0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-0.4500000,Max=-0.4500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareC2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-50.0000000,Max=-50.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=SpriteEmitter15
	// Reference: BeamEmitter'BallisticProV55.HVCMk9_RedSpiral.BeamEmitter10'
	begin object name="BeamEmitter10" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=20.0000000,Max=30.0000000)
		DetermineEndPointBy=1
		BeamTextureUScale=2.0000000
		LowFrequencyPoints=2
		HighFrequencyPoints=2
		FadeOut=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.0400000
		CoordinateSystem=1
		DetailMode=2
		StartLocationOffset=(X=-12.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=-35.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=3.0000000,Max=4.0000000),Y=(Min=3.0000000,Max=4.0000000),Z=(Min=3.0000000,Max=4.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.LightningBoltCut2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		StartVelocityRange=(X=(Min=-0.2000000,Max=0.2000000),Y=(Min=-3.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=3.0000000))
	end object
	Emitters[1]=BeamEmitter10
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.HVCMk9_RedSpiral.SpriteEmitter15'
begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
	UseDirectionAs=3
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.3600000
	FadeInEndTime=0.1300000
	CoordinateSystem=1
	MaxParticles=8
	StartLocationOffset=(X=-10.0000000,Y=0.0000000,Z=0.0000000)
	SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
	SpinsPerSecondRange=(X=(Min=-0.2500000,Max=-0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-0.4500000,Max=-0.4500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareC2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-50.0000000,Max=-50.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: BeamEmitter'BallisticProV55.HVCMk9_RedSpiral.BeamEmitter10'
begin object name="BeamEmitter10" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=20.0000000,Max=30.0000000)
	DetermineEndPointBy=1
	BeamTextureUScale=2.0000000
	LowFrequencyPoints=2
	HighFrequencyPoints=2
	FadeOut=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.0400000
	CoordinateSystem=1
	DetailMode=2
	StartLocationOffset=(X=-12.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=-35.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=3.0000000,Max=4.0000000),Y=(Min=3.0000000,Max=4.0000000),Z=(Min=3.0000000,Max=4.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.LightningBoltCut2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	StartVelocityRange=(X=(Min=-0.2000000,Max=0.2000000),Y=(Min=-3.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=3.0000000))
end object
