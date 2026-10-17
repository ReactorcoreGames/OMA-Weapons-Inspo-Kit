class IE_HVCRedLightning extends BallisticEmitter;

simulated event PreBeginPlay()
{
	// End:0x50
	if(!FastTrace(Location + (Vector(Rotation) * float(8)), Level.GetLocalPlayerController().ViewTarget.Location))
	{
		Emitters[0].ZTest = true;
	}
	super(Actor).PreBeginPlay();
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.IE_HVCRedLightning.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		ZTest=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1357140,Color=(R=64,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.2607140,Color=(R=255,G=192,B=192,A=255))
		ColorScale[3]=(RelativeTime=0.3857140,Color=(R=64,G=0,B=0,A=255))
		ColorScale[4]=(RelativeTime=0.5107140,Color=(R=255,G=128,B=128,A=255))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		FadeOutStartTime=0.2240000
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
	end object
	Emitters[0]=SpriteEmitter2
	// Reference: BeamEmitter'BallisticProV55.IE_HVCRedLightning.BeamEmitter4'
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
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3035710,Color=(R=255,G=64,B=64,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		FadeOutStartTime=0.2160000
		CoordinateSystem=1
		MaxParticles=12
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=35.0000000),Y=(Min=20.0000000,Max=35.0000000),Z=(Min=20.0000000,Max=35.0000000))
		InitialParticlesPerSecond=20.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
		StartVelocityRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
	end object
	Emitters[1]=BeamEmitter4
	// Reference: SpriteEmitter'BallisticProV55.IE_HVCRedLightning.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3285710,Color=(R=255,G=64,B=64,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		FadeOutStartTime=0.0820000
		CoordinateSystem=1
		MaxParticles=28
		DetailMode=2
		StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=35.0000000,Max=45.0000000),Y=(Min=35.0000000,Max=45.0000000),Z=(Min=35.0000000,Max=45.0000000))
		InitialParticlesPerSecond=40.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		StartVelocityRange=(X=(Min=200.0000000,Max=2000.0000000),Y=(Min=-400.0000000,Max=400.0000000),Z=(Min=-400.0000000,Max=400.0000000))
	end object
	Emitters[2]=SpriteEmitter3
	// Reference: SpriteEmitter'BallisticProV55.IE_HVCRedLightning.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseDirectionAs=3
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1785710,Color=(R=255,G=128,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.7000000,Max=0.7000000),Y=(Min=0.7000000,Max=0.7000000),Z=(Min=0.7000000,Max=0.7000000))
		FadeOutStartTime=0.0240000
		FadeInEndTime=0.0240000
		CoordinateSystem=1
		MaxParticles=4
		StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.6100000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=250.0000000,Max=250.0000000),Y=(Min=250.0000000,Max=250.0000000),Z=(Min=250.0000000,Max=250.0000000))
		InitialParticlesPerSecond=8.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.ElectroShock'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[3]=SpriteEmitter4
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.IE_HVCRedLightning.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	ZTest=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1357140,Color=(R=64,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.2607140,Color=(R=255,G=192,B=192,A=255))
	ColorScale[3]=(RelativeTime=0.3857140,Color=(R=64,G=0,B=0,A=255))
	ColorScale[4]=(RelativeTime=0.5107140,Color=(R=255,G=128,B=128,A=255))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	FadeOutStartTime=0.2240000
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
end object
// Reference: BeamEmitter'BallisticProV55.IE_HVCRedLightning.BeamEmitter4'
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
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3035710,Color=(R=255,G=64,B=64,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	FadeOutStartTime=0.2160000
	CoordinateSystem=1
	MaxParticles=12
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=35.0000000),Y=(Min=20.0000000,Max=35.0000000),Z=(Min=20.0000000,Max=35.0000000))
	InitialParticlesPerSecond=20.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
	StartVelocityRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_HVCRedLightning.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3285710,Color=(R=255,G=64,B=64,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	FadeOutStartTime=0.0820000
	CoordinateSystem=1
	MaxParticles=28
	DetailMode=2
	StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=35.0000000,Max=45.0000000),Y=(Min=35.0000000,Max=45.0000000),Z=(Min=35.0000000,Max=45.0000000))
	InitialParticlesPerSecond=40.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	StartVelocityRange=(X=(Min=200.0000000,Max=2000.0000000),Y=(Min=-400.0000000,Max=400.0000000),Z=(Min=-400.0000000,Max=400.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_HVCRedLightning.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseDirectionAs=3
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1785710,Color=(R=255,G=128,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.7000000,Max=0.7000000),Y=(Min=0.7000000,Max=0.7000000),Z=(Min=0.7000000,Max=0.7000000))
	FadeOutStartTime=0.0240000
	FadeInEndTime=0.0240000
	CoordinateSystem=1
	MaxParticles=4
	StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.6100000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=250.0000000,Max=250.0000000),Y=(Min=250.0000000,Max=250.0000000),Z=(Min=250.0000000,Max=250.0000000))
	InitialParticlesPerSecond=8.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.ElectroShock'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
