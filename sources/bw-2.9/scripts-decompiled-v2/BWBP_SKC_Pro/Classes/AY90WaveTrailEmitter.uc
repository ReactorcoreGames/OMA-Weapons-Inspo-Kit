class AY90WaveTrailEmitter extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.AY90WaveTrailEmitter.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=0,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=64,A=0))
		Opacity=0.7000000
		FadeOutStartTime=0.2000000
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=100.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.A73RedLayout.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3500000,Max=0.5000000)
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: BeamEmitter'BWBP_SKC_Pro.AY90WaveTrailEmitter.BeamEmitter12'
	begin object name="BeamEmitter12" class=Engine.BeamEmitter
		BeamEndPoints[0]=(ActorTag="Second",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
		DetermineEndPointBy=5
		BeamTextureUScale=2.0000000
		LowFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		LowFrequencyPoints=4
		Disabled=true
		Backup_Disabled=true
		ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.2000000,Max=0.2000000))
		MaxParticles=3
		StartSizeRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt03aw'
		LifetimeRange=(Min=0.0100000,Max=0.0100000)
	end object
	Emitters[1]=BeamEmitter12
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.AY90WaveTrailEmitter.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=0,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=64,A=0))
	Opacity=0.7000000
	FadeOutStartTime=0.2000000
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=100.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.A73RedLayout.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3500000,Max=0.5000000)
end object
// Reference: BeamEmitter'BWBP_SKC_Pro.AY90WaveTrailEmitter.BeamEmitter12'
begin object name="BeamEmitter12" class=Engine.BeamEmitter
	BeamEndPoints[0]=(ActorTag="Second",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
	DetermineEndPointBy=5
	BeamTextureUScale=2.0000000
	LowFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	LowFrequencyPoints=4
	Disabled=true
	Backup_Disabled=true
	ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.2000000,Max=0.2000000))
	MaxParticles=3
	StartSizeRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt03aw'
	LifetimeRange=(Min=0.0100000,Max=0.0100000)
end object
