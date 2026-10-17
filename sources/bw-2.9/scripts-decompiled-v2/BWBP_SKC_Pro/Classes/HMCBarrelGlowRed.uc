class HMCBarrelGlowRed extends BallisticEmitter;

defaultproperties
{
	// Reference: BeamEmitter'BWBP_SKC_Pro.HMCBarrelGlowRed.BeamEmitter3'
	begin object name="BeamEmitter3" class=Engine.BeamEmitter
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=-80.0000000,Max=-80.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=0.0000000)
		DetermineEndPointBy=2
		BeamTextureUScale=0.5000000
		HighFrequencyNoiseRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-1.0000000,Max=1.0000000))
		HighFrequencyPoints=4
		UseColorScale=true
		FadeOut=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.9142860,Color=(R=0,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.1000000,Max=0.2000000))
		FadeOutStartTime=0.0800000
		CoordinateSystem=1
		MaxParticles=4
		StartSizeRange=(X=(Min=4.0000000,Max=14.0000000),Y=(Min=4.0000000,Max=14.0000000),Z=(Min=4.0000000,Max=14.0000000))
		InitialParticlesPerSecond=1.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt03aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5010000,Max=0.5010000)
	end object
	Emitters[0]=BeamEmitter3
	// Reference: SpriteEmitter'BWBP_SKC_Pro.HMCBarrelGlowRed.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.8000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.3000000
		FadeOutStartTime=0.0300000
		FadeInEndTime=0.0300000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=8.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-8.0000000,Max=8.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		LifetimeRange=(Min=0.1000000,Max=0.2000000)
	end object
	Emitters[1]=SpriteEmitter9
	// Reference: SpriteEmitter'BWBP_SKC_Pro.HMCBarrelGlowRed.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.8300000
		FadeOutStartTime=0.0580000
		FadeInEndTime=0.0290000
		CoordinateSystem=1
		StartLocationOffset=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.5000000,Max=1.5000000),Z=(Min=-1.5000000,Max=1.5000000))
		StartSizeRange=(X=(Min=1.0000000,Max=10.0000000),Y=(Min=1.0000000,Max=10.0000000),Z=(Min=1.0000000,Max=10.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaBubbleA1'
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		StartVelocityRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[2]=SpriteEmitter10
	// Reference: SparkEmitter'BWBP_SKC_Pro.HMCBarrelGlowRed.SparkEmitter2'
	begin object name="SparkEmitter2" class=Engine.SparkEmitter
		LineSegmentsRange=(Min=2.0000000,Max=2.0000000)
		TimeBetweenSegmentsRange=(Min=0.1000000,Max=0.3000000)
		UseColorScale=true
		FadeOut=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.2500000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.2160000
		CoordinateSystem=1
		MaxParticles=80
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=300.0000000),Y=(Min=-300.0000000,Max=300.0000000),Z=(Min=-200.0000000,Max=200.0000000))
	end object
	Emitters[3]=SparkEmitter2
	// Reference: SpriteEmitter'BWBP_SKC_Pro.HMCBarrelGlowRed.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.8000000),Y=(Min=0.0000000,Max=0.6000000),Z=(Min=0.0000000,Max=0.2000000))
		Opacity=0.8300000
		FadeOutStartTime=0.0580000
		FadeInEndTime=0.0290000
		CoordinateSystem=1
		StartLocationOffset=(X=-80.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.5000000,Max=1.5000000),Z=(Min=-1.5000000,Max=1.5000000))
		StartSizeRange=(X=(Min=1.0000000,Max=12.0000000),Y=(Min=1.0000000,Max=12.0000000),Z=(Min=1.0000000,Max=12.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		StartVelocityRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[4]=SpriteEmitter4
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BWBP_SKC_Pro.HMCBarrelGlowRed.BeamEmitter3'
begin object name="BeamEmitter3" class=Engine.BeamEmitter
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=-80.0000000,Max=-80.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=0.0000000)
	DetermineEndPointBy=2
	BeamTextureUScale=0.5000000
	HighFrequencyNoiseRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-1.0000000,Max=1.0000000))
	HighFrequencyPoints=4
	UseColorScale=true
	FadeOut=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.9142860,Color=(R=0,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.1000000,Max=0.2000000))
	FadeOutStartTime=0.0800000
	CoordinateSystem=1
	MaxParticles=4
	StartSizeRange=(X=(Min=4.0000000,Max=14.0000000),Y=(Min=4.0000000,Max=14.0000000),Z=(Min=4.0000000,Max=14.0000000))
	InitialParticlesPerSecond=1.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt03aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5010000,Max=0.5010000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.HMCBarrelGlowRed.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.8000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.3000000
	FadeOutStartTime=0.0300000
	FadeInEndTime=0.0300000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=8.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-8.0000000,Max=8.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	LifetimeRange=(Min=0.1000000,Max=0.2000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.HMCBarrelGlowRed.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.8300000
	FadeOutStartTime=0.0580000
	FadeInEndTime=0.0290000
	CoordinateSystem=1
	StartLocationOffset=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.5000000,Max=1.5000000),Z=(Min=-1.5000000,Max=1.5000000))
	StartSizeRange=(X=(Min=1.0000000,Max=10.0000000),Y=(Min=1.0000000,Max=10.0000000),Z=(Min=1.0000000,Max=10.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaBubbleA1'
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	StartVelocityRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SparkEmitter'BWBP_SKC_Pro.HMCBarrelGlowRed.SparkEmitter2'
begin object name="SparkEmitter2" class=Engine.SparkEmitter
	LineSegmentsRange=(Min=2.0000000,Max=2.0000000)
	TimeBetweenSegmentsRange=(Min=0.1000000,Max=0.3000000)
	UseColorScale=true
	FadeOut=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.2500000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.2160000
	CoordinateSystem=1
	MaxParticles=80
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=300.0000000),Y=(Min=-300.0000000,Max=300.0000000),Z=(Min=-200.0000000,Max=200.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.HMCBarrelGlowRed.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.8000000),Y=(Min=0.0000000,Max=0.6000000),Z=(Min=0.0000000,Max=0.2000000))
	Opacity=0.8300000
	FadeOutStartTime=0.0580000
	FadeInEndTime=0.0290000
	CoordinateSystem=1
	StartLocationOffset=(X=-80.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.5000000,Max=1.5000000),Z=(Min=-1.5000000,Max=1.5000000))
	StartSizeRange=(X=(Min=1.0000000,Max=12.0000000),Y=(Min=1.0000000,Max=12.0000000),Z=(Min=1.0000000,Max=12.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	StartVelocityRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
