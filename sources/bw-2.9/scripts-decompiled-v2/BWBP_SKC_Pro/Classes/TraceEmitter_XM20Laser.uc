class TraceEmitter_XM20Laser extends BCTraceEmitter;

simulated function Initialize(float Distance, optional float Power)
{
	Power = Power / float(255);
	BeamEmitter(Emitters[0]).BeamDistanceRange.Min = FMax(0.0000000, Distance - float(100));
	BeamEmitter(Emitters[0]).BeamDistanceRange.Max = FMax(0.0000000, Distance - float(100));
	BeamEmitter(Emitters[1]).BeamDistanceRange.Min = Distance;
	BeamEmitter(Emitters[1]).BeamDistanceRange.Max = Distance;
	BeamEmitter(Emitters[4]).BeamDistanceRange.Min = Distance;
	BeamEmitter(Emitters[4]).BeamDistanceRange.Max = Distance;
	Emitters[5].LifetimeRange.Min = Distance / float(8000);
	Emitters[5].LifetimeRange.Max = Distance / float(8000);
	//return;	
}

defaultproperties
{
	// Reference: BeamEmitter'BWBP_SKC_Pro.TraceEmitter_XM20Laser.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=5000.0000000,Max=5000.0000000)
		DetermineEndPointBy=1
		BeamTextureUScale=8.0000000
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.8000000,Max=0.8000000))
		FadeOutStartTime=0.0250000
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=2
		StartLocationOffset=(X=700.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.6800000,RelativeSize=0.3000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.GunFire.RailCoreWave'
		LifetimeRange=(Min=0.3500000,Max=0.3500000)
		StartVelocityRange=(X=(Min=0.0100000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=BeamEmitter0
	// Reference: BeamEmitter'BWBP_SKC_Pro.TraceEmitter_XM20Laser.BeamEmitter1'
	begin object name="BeamEmitter1" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=5000.0000000,Max=5000.0000000)
		DetermineEndPointBy=1
		BeamTextureUScale=8.0000000
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=32,B=3,A=255))
		ColorScale[1]=(RelativeTime=0.2750000,Color=(R=232,G=137,B=9,A=255))
		ColorScale[2]=(RelativeTime=0.5214290,Color=(R=255,G=0,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=122,G=24,B=27,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=0.9000000),Y=(Min=0.9000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.1920000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BWBP_SKC_Tex.BeamCannon.HMCSmokeCore2'
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=BeamEmitter1
	// Reference: SpriteEmitter'BWBP_SKC_Pro.TraceEmitter_XM20Laser.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=2.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.4000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.3500000
		FadeOutStartTime=1.0340000
		FadeInEndTime=0.3960000
		CoordinateSystem=1
		MaxParticles=3
		DetailMode=1
		StartLocationOffset=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=-15.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.4000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.6000000)
		StartSizeRange=(X=(Min=5.0000000,Max=20.0000000),Y=(Min=5.0000000,Max=20.0000000),Z=(Min=5.0000000,Max=20.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BWBP_SKC_Tex.BFG.PlasmaSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[2]=SpriteEmitter2
	// Reference: BeamEmitter'BWBP_SKC_Pro.TraceEmitter_XM20Laser.BeamEmitter3'
	begin object name="BeamEmitter3" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=100.0000000,Max=100.0000000)
		DetermineEndPointBy=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=129,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.0250000
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=2
		StartLocationOffset=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.6800000,RelativeSize=0.3000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.GunFire.RailCoreWaveCap'
		LifetimeRange=(Min=0.3500000,Max=0.3500000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[3]=BeamEmitter3
	// Reference: BeamEmitter'BWBP_SKC_Pro.TraceEmitter_XM20Laser.BeamEmitter4'
	begin object name="BeamEmitter4" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=5000.0000000,Max=5000.0000000)
		DetermineEndPointBy=1
		BeamTextureUScale=16.0000000
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=64,A=255))
		ColorScale[1]=(RelativeTime=0.1142860,Color=(R=255,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.2571430,Color=(R=227,G=99,B=4,A=255))
		ColorScale[3]=(RelativeTime=0.8892860,Color=(R=238,G=17,B=78,A=255))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=200,G=0,B=0,A=255))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=0.9000000),Y=(Min=0.9000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.1800000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BWBP_SKC_Tex.BeamCannon.HMCSmokeCore2'
		LifetimeRange=(Min=0.3000000,Max=0.4000000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[4]=BeamEmitter4
	// Reference: SpriteEmitter'BWBP_SKC_Pro.TraceEmitter_XM20Laser.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		Opacity=0.7300000
		FadeOutStartTime=0.5250000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=1.0000000,Max=1.5000000),Y=(Min=1.0000000,Max=1.5000000),Z=(Min=1.0000000,Max=1.5000000))
		InitialParticlesPerSecond=200.0000000
		Texture=Texture'BWBP_SKC_Tex.A48.A48MuzzleFlash'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SubdivisionStart=1
		SubdivisionEnd=1
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3250000,Max=0.3250000)
		StartVelocityRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-40.0000000,Max=40.0000000))
	end object
	Emitters[5]=SpriteEmitter5
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BWBP_SKC_Pro.TraceEmitter_XM20Laser.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=5000.0000000,Max=5000.0000000)
	DetermineEndPointBy=1
	BeamTextureUScale=8.0000000
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.8000000,Max=0.8000000))
	FadeOutStartTime=0.0250000
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=2
	StartLocationOffset=(X=700.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.6800000,RelativeSize=0.3000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.GunFire.RailCoreWave'
	LifetimeRange=(Min=0.3500000,Max=0.3500000)
	StartVelocityRange=(X=(Min=0.0100000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: BeamEmitter'BWBP_SKC_Pro.TraceEmitter_XM20Laser.BeamEmitter1'
begin object name="BeamEmitter1" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=5000.0000000,Max=5000.0000000)
	DetermineEndPointBy=1
	BeamTextureUScale=8.0000000
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=32,B=3,A=255))
	ColorScale[1]=(RelativeTime=0.2750000,Color=(R=232,G=137,B=9,A=255))
	ColorScale[2]=(RelativeTime=0.5214290,Color=(R=255,G=0,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=122,G=24,B=27,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=0.9000000),Y=(Min=0.9000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.1920000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BWBP_SKC_Tex.BeamCannon.HMCSmokeCore2'
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.TraceEmitter_XM20Laser.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=2.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.4000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.3500000
	FadeOutStartTime=1.0340000
	FadeInEndTime=0.3960000
	CoordinateSystem=1
	MaxParticles=3
	DetailMode=1
	StartLocationOffset=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=-15.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.4000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.6000000)
	StartSizeRange=(X=(Min=5.0000000,Max=20.0000000),Y=(Min=5.0000000,Max=20.0000000),Z=(Min=5.0000000,Max=20.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BWBP_SKC_Tex.BFG.PlasmaSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: BeamEmitter'BWBP_SKC_Pro.TraceEmitter_XM20Laser.BeamEmitter3'
begin object name="BeamEmitter3" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=100.0000000,Max=100.0000000)
	DetermineEndPointBy=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=129,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.0250000
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=2
	StartLocationOffset=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.6800000,RelativeSize=0.3000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.GunFire.RailCoreWaveCap'
	LifetimeRange=(Min=0.3500000,Max=0.3500000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: BeamEmitter'BWBP_SKC_Pro.TraceEmitter_XM20Laser.BeamEmitter4'
begin object name="BeamEmitter4" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=5000.0000000,Max=5000.0000000)
	DetermineEndPointBy=1
	BeamTextureUScale=16.0000000
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=64,A=255))
	ColorScale[1]=(RelativeTime=0.1142860,Color=(R=255,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.2571430,Color=(R=227,G=99,B=4,A=255))
	ColorScale[3]=(RelativeTime=0.8892860,Color=(R=238,G=17,B=78,A=255))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=200,G=0,B=0,A=255))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=0.9000000),Y=(Min=0.9000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.1800000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BWBP_SKC_Tex.BeamCannon.HMCSmokeCore2'
	LifetimeRange=(Min=0.3000000,Max=0.4000000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.TraceEmitter_XM20Laser.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	Opacity=0.7300000
	FadeOutStartTime=0.5250000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=1.0000000,Max=1.5000000),Y=(Min=1.0000000,Max=1.5000000),Z=(Min=1.0000000,Max=1.5000000))
	InitialParticlesPerSecond=200.0000000
	Texture=Texture'BWBP_SKC_Tex.A48.A48MuzzleFlash'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SubdivisionStart=1
	SubdivisionEnd=1
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3250000,Max=0.3250000)
	StartVelocityRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-40.0000000,Max=40.0000000))
end object
