class Supercharger_EMPTrail extends BallisticEmitter;

defaultproperties
{
	Emitters[0]=none
	// Reference: SpriteEmitter'BWBP_SKC_Pro.Supercharger_EMPTrail.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=128,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=255,A=0))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=2.0000000,Max=4.0000000))
		Opacity=0.7000000
		FadeOutStartTime=0.2000000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BWBP_SKC_Tex.LS14.EMPProj'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1500000,Max=0.2000000)
	end object
	Emitters[1]=SpriteEmitter1
	Emitters[2]=none
	Emitters[3]=none
	Emitters[4]=none
	Emitters[5]=none
	Emitters[6]=none
	Emitters[7]=none
	// Reference: BeamEmitter'BWBP_SKC_Pro.Supercharger_EMPTrail.BeamEmitter4'
	begin object name="BeamEmitter4" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=250.0000000,Max=250.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
		HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=64,B=255,A=64))
		ColorScale[1]=(RelativeTime=0.3035710,Color=(R=64,G=64,B=255,A=64))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=64))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=2.0000000,Max=4.0000000))
		FadeOutStartTime=0.4160000
		CoordinateSystem=1
		MaxParticles=12
		DetailMode=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.5000000)
		SizeScale[1]=(RelativeTime=0.5500000,RelativeSize=2.0000000)
		SizeScale[2]=(RelativeTime=1.5000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=5.0000000,Max=0.0000000),Z=(Min=5.0000000,Max=0.0000000))
		InitialParticlesPerSecond=20.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
	end object
	Emitters[8]=BeamEmitter4
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.Supercharger_EMPTrail.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=128,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=255,A=0))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=2.0000000,Max=4.0000000))
	Opacity=0.7000000
	FadeOutStartTime=0.2000000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BWBP_SKC_Tex.LS14.EMPProj'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1500000,Max=0.2000000)
end object
// Reference: BeamEmitter'BWBP_SKC_Pro.Supercharger_EMPTrail.BeamEmitter4'
begin object name="BeamEmitter4" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=250.0000000,Max=250.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=64,B=255,A=64))
	ColorScale[1]=(RelativeTime=0.3035710,Color=(R=64,G=64,B=255,A=64))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=64))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=2.0000000,Max=4.0000000))
	FadeOutStartTime=0.4160000
	CoordinateSystem=1
	MaxParticles=12
	DetailMode=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.5000000)
	SizeScale[1]=(RelativeTime=0.5500000,RelativeSize=2.0000000)
	SizeScale[2]=(RelativeTime=1.5000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=5.0000000,Max=0.0000000),Z=(Min=5.0000000,Max=0.0000000))
	InitialParticlesPerSecond=20.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
end object
