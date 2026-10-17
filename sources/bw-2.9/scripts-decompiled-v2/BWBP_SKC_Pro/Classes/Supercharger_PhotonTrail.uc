class Supercharger_PhotonTrail extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.Supercharger_PhotonTrail.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=128,A=0))
		ColorScale[1]=(RelativeTime=0.3000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.6571430,Color=(R=0,G=255,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=255,A=0))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.7000000
		FadeOutStartTime=0.2000000
		CoordinateSystem=1
		MaxParticles=1
		StartSizeRange=(X=(Min=20.0000000,Max=30.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BWBP_SKC_Tex.LS14.EMPProj'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1500000,Max=0.2000000)
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: BeamEmitter'BWBP_SKC_Pro.Supercharger_PhotonTrail.BeamEmitter1'
	begin object name="BeamEmitter1" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=150.0000000,Max=150.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
		HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		UseColorScale=true
		FadeOut=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=64,B=255,A=64))
		ColorScale[1]=(RelativeTime=0.3000000,Color=(R=255,G=255,B=255,A=64))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=64))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.4160000
		CoordinateSystem=1
		MaxParticles=5
		DetailMode=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.5000000)
		SizeScale[1]=(RelativeTime=0.5500000,RelativeSize=2.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		InitialParticlesPerSecond=10.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
	end object
	Emitters[1]=BeamEmitter1
	// Reference: SpriteEmitter'BWBP_SKC_Pro.Supercharger_PhotonTrail.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=128,A=0))
		ColorScale[1]=(RelativeTime=0.3000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.6571430,Color=(R=0,G=255,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=255,A=0))
		ColorMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.5000000))
		Opacity=0.7000000
		FadeOutStartTime=0.2000000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=30.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BWBP_SKC_Tex.LS14.EMPProj'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1500000,Max=0.2000000)
	end object
	Emitters[2]=SpriteEmitter2
	// Reference: SpriteEmitter'BWBP_SKC_Pro.Supercharger_PhotonTrail.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=255,A=0))
		ColorMultiplierRange=(X=(Min=0.1000000,Max=0.4100000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.7000000
		FadeOutStartTime=0.4000000
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.5000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.GunFire.A42Projectile2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[3]=SpriteEmitter3
	// Reference: SpriteEmitter'BWBP_SKC_Pro.Supercharger_PhotonTrail.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseCollision=true
		UseColorScale=true
		FadeOut=true
		UniformSize=true
		TriggerDisabled=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
		DampingFactorRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.7000000,Max=0.7000000),Z=(Min=0.7000000,Max=0.7000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=255,A=0))
		FadeOutStartTime=1.0000000
		MaxParticles=5
		DetailMode=1
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		StartSizeRange=(X=(Min=12.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		SpawnOnTriggerRange=(Min=2.0000000,Max=5.0000000)
		SpawnOnTriggerPPS=500000.0000000
		StartVelocityRange=(X=(Min=-400.0000000,Max=400.0000000),Y=(Min=-800.0000000,Max=400.0000000),Z=(Min=-400.0000000,Max=400.0000000))
	end object
	Emitters[4]=SpriteEmitter4
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.Supercharger_PhotonTrail.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=128,A=0))
	ColorScale[1]=(RelativeTime=0.3000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.6571430,Color=(R=0,G=255,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=255,A=0))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.7000000
	FadeOutStartTime=0.2000000
	CoordinateSystem=1
	MaxParticles=1
	StartSizeRange=(X=(Min=20.0000000,Max=30.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BWBP_SKC_Tex.LS14.EMPProj'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1500000,Max=0.2000000)
end object
// Reference: BeamEmitter'BWBP_SKC_Pro.Supercharger_PhotonTrail.BeamEmitter1'
begin object name="BeamEmitter1" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=150.0000000,Max=150.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	UseColorScale=true
	FadeOut=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=64,B=255,A=64))
	ColorScale[1]=(RelativeTime=0.3000000,Color=(R=255,G=255,B=255,A=64))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=64))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.4160000
	CoordinateSystem=1
	MaxParticles=5
	DetailMode=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.5000000)
	SizeScale[1]=(RelativeTime=0.5500000,RelativeSize=2.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	InitialParticlesPerSecond=10.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.Supercharger_PhotonTrail.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=128,A=0))
	ColorScale[1]=(RelativeTime=0.3000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.6571430,Color=(R=0,G=255,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=255,A=0))
	ColorMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.5000000))
	Opacity=0.7000000
	FadeOutStartTime=0.2000000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=20.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=30.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BWBP_SKC_Tex.LS14.EMPProj'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1500000,Max=0.2000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.Supercharger_PhotonTrail.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=255,A=0))
	ColorMultiplierRange=(X=(Min=0.1000000,Max=0.4100000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.7000000
	FadeOutStartTime=0.4000000
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.5000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.GunFire.A42Projectile2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.Supercharger_PhotonTrail.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseCollision=true
	UseColorScale=true
	FadeOut=true
	UniformSize=true
	TriggerDisabled=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
	DampingFactorRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.7000000,Max=0.7000000),Z=(Min=0.7000000,Max=0.7000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=255,A=0))
	FadeOutStartTime=1.0000000
	MaxParticles=5
	DetailMode=1
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	StartSizeRange=(X=(Min=12.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	SpawnOnTriggerRange=(Min=2.0000000,Max=5.0000000)
	SpawnOnTriggerPPS=500000.0000000
	StartVelocityRange=(X=(Min=-400.0000000,Max=400.0000000),Y=(Min=-800.0000000,Max=400.0000000),Z=(Min=-400.0000000,Max=400.0000000))
end object
