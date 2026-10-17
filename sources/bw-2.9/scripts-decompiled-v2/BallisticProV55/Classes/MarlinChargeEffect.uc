class MarlinChargeEffect extends BallisticEmitter;

defaultproperties
{
	// Reference: BeamEmitter'BallisticProV55.MarlinChargeEffect.MarlinChargeEffectEmitter0'
	begin object name="MarlinChargeEffectEmitter0" class=Engine.BeamEmitter
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=18.0000000,Max=18.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=0.0000000)
		DetermineEndPointBy=2
		BeamTextureUScale=0.5000000
		HighFrequencyNoiseRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-1.0000000,Max=1.0000000))
		HighFrequencyPoints=4
		FadeOut=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.8000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.4000000
		FadeOutStartTime=0.0840000
		CoordinateSystem=1
		MaxParticles=4
		StartLocationOffset=(X=8.0000000,Y=-9.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=1.0000000,Max=4.0000000),Y=(Min=1.0000000,Max=4.0000000),Z=(Min=1.0000000,Max=4.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt03aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.4000000)
	end object
	Emitters[0]=MarlinChargeEffectEmitter0
	// Reference: SpriteEmitter'BallisticProV55.MarlinChargeEffect.MarlinChargeEffectEmitter2'
	begin object name="MarlinChargeEffectEmitter2" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.8000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.8000000,Max=0.9000000))
		Opacity=0.1000000
		FadeOutStartTime=0.0580000
		FadeInEndTime=0.0290000
		CoordinateSystem=1
		StartLocationOffset=(X=4.0000000,Y=-9.5000000,Z=0.0000000)
		StartLocationRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.5000000,Max=1.5000000),Z=(Min=-1.5000000,Max=1.5000000))
		StartSizeRange=(X=(Min=3.0000000,Max=4.0000000),Y=(Min=3.0000000,Max=4.0000000),Z=(Min=3.0000000,Max=4.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		StartVelocityRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=MarlinChargeEffectEmitter2
	// Reference: SparkEmitter'BallisticProV55.MarlinChargeEffect.MarlinChargeEffectEmitter3'
	begin object name="MarlinChargeEffectEmitter3" class=Engine.SparkEmitter
		LineSegmentsRange=(Min=1.0000000,Max=1.0000000)
		TimeBetweenSegmentsRange=(Min=0.1000000,Max=0.3000000)
		FadeOut=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.7000000,Max=0.8000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.2000000
		FadeOutStartTime=0.2160000
		CoordinateSystem=1
		MaxParticles=40
		StartLocationOffset=(X=8.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-8.0000000,Max=8.0000000),Z=(Min=0.0000000,Max=0.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
		StartVelocityRange=(X=(Min=80.0000000,Max=300.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=-200.0000000,Max=200.0000000))
	end object
	Emitters[2]=MarlinChargeEffectEmitter3
	// Reference: SpriteEmitter'BallisticProV55.MarlinChargeEffect.MarlinChargeEffectEmitter4'
	begin object name="MarlinChargeEffectEmitter4" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.8000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.8000000,Max=1.0000000))
		Opacity=0.1000000
		FadeOutStartTime=0.0580000
		FadeInEndTime=0.0290000
		CoordinateSystem=1
		StartLocationOffset=(X=4.0000000,Y=9.5000000,Z=0.0000000)
		StartLocationRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.5000000,Max=1.5000000),Z=(Min=-1.5000000,Max=1.5000000))
		StartSizeRange=(X=(Min=3.0000000,Max=4.0000000),Y=(Min=3.0000000,Max=4.0000000),Z=(Min=3.0000000,Max=4.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		StartVelocityRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[3]=MarlinChargeEffectEmitter4
	AutoDestroy=true
	bHidden=true
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BallisticProV55.MarlinChargeEffect.MarlinChargeEffectEmitter0'
begin object name="MarlinChargeEffectEmitter0" class=Engine.BeamEmitter
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=18.0000000,Max=18.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=0.0000000)
	DetermineEndPointBy=2
	BeamTextureUScale=0.5000000
	HighFrequencyNoiseRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-1.0000000,Max=1.0000000))
	HighFrequencyPoints=4
	FadeOut=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.8000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.4000000
	FadeOutStartTime=0.0840000
	CoordinateSystem=1
	MaxParticles=4
	StartLocationOffset=(X=8.0000000,Y=-9.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=1.0000000,Max=4.0000000),Y=(Min=1.0000000,Max=4.0000000),Z=(Min=1.0000000,Max=4.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt03aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.4000000)
end object
// Reference: SpriteEmitter'BallisticProV55.MarlinChargeEffect.MarlinChargeEffectEmitter2'
begin object name="MarlinChargeEffectEmitter2" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.8000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.8000000,Max=0.9000000))
	Opacity=0.1000000
	FadeOutStartTime=0.0580000
	FadeInEndTime=0.0290000
	CoordinateSystem=1
	StartLocationOffset=(X=4.0000000,Y=-9.5000000,Z=0.0000000)
	StartLocationRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.5000000,Max=1.5000000),Z=(Min=-1.5000000,Max=1.5000000))
	StartSizeRange=(X=(Min=3.0000000,Max=4.0000000),Y=(Min=3.0000000,Max=4.0000000),Z=(Min=3.0000000,Max=4.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	StartVelocityRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SparkEmitter'BallisticProV55.MarlinChargeEffect.MarlinChargeEffectEmitter3'
begin object name="MarlinChargeEffectEmitter3" class=Engine.SparkEmitter
	LineSegmentsRange=(Min=1.0000000,Max=1.0000000)
	TimeBetweenSegmentsRange=(Min=0.1000000,Max=0.3000000)
	FadeOut=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.7000000,Max=0.8000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.2000000
	FadeOutStartTime=0.2160000
	CoordinateSystem=1
	MaxParticles=40
	StartLocationOffset=(X=8.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-8.0000000,Max=8.0000000),Z=(Min=0.0000000,Max=0.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
	StartVelocityRange=(X=(Min=80.0000000,Max=300.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=-200.0000000,Max=200.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.MarlinChargeEffect.MarlinChargeEffectEmitter4'
begin object name="MarlinChargeEffectEmitter4" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.8000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.8000000,Max=1.0000000))
	Opacity=0.1000000
	FadeOutStartTime=0.0580000
	FadeInEndTime=0.0290000
	CoordinateSystem=1
	StartLocationOffset=(X=4.0000000,Y=9.5000000,Z=0.0000000)
	StartLocationRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.5000000,Max=1.5000000),Z=(Min=-1.5000000,Max=1.5000000))
	StartSizeRange=(X=(Min=3.0000000,Max=4.0000000),Y=(Min=3.0000000,Max=4.0000000),Z=(Min=3.0000000,Max=4.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	StartVelocityRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
