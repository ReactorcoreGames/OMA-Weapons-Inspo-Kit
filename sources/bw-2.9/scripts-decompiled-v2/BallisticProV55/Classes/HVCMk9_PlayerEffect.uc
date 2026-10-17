class HVCMk9_PlayerEffect extends DGVEmitter;

simulated function StartSound()
{
	AmbientSound = default.AmbientSound;
	//return;	
}

simulated function StopSound()
{
	AmbientSound = none;
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.HVCMk9_PlayerEffect.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1571430,Color=(R=128,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.3464290,Color=(R=64,G=192,B=255,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=255,A=255))
		FadeOutStartTime=0.1250000
		MaxParticles=2
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-20.0000000,Max=20.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.5000000)
		SizeScale[2]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=40.0000000,Max=60.0000000),Z=(Min=40.0000000,Max=60.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3500000,Max=0.5000000)
	end object
	Emitters[0]=SpriteEmitter7
	// Reference: SpriteEmitter'BallisticProV55.HVCMk9_PlayerEffect.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		SpinParticles=true
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3428570,Color=(R=64,G=160,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
		FadeOutStartTime=0.1320000
		CoordinateSystem=1
		MaxParticles=14
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		StartSpinRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=14.0000000,Max=24.0000000),Y=(Min=14.0000000,Max=24.0000000),Z=(Min=14.0000000,Max=24.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Beams.BeamFalloff'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		StartVelocityRange=(X=(Min=50.0000000,Max=400.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=-50.0000000,Max=200.0000000))
	end object
	Emitters[1]=SpriteEmitter8
	// Reference: SpriteEmitter'BallisticProV55.HVCMk9_PlayerEffect.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
		ExtentMultiplier=(X=0.1000000,Y=0.1000000,Z=0.1000000)
		DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.4000000,Max=0.4000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=1.2600000
		MaxParticles=120
		DetailMode=2
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-20.0000000,Max=20.0000000))
		StartSizeRange=(X=(Min=4.0000000,Max=7.0000000),Y=(Min=4.0000000,Max=7.0000000),Z=(Min=4.0000000,Max=7.0000000))
		InitialParticlesPerSecond=5.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		MinSquaredVelocity=1000.0000000
		LifetimeRange=(Min=2.5000000,Max=2.5000000)
		StartVelocityRange=(X=(Min=20.0000000,Max=100.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	end object
	Emitters[2]=SpriteEmitter9
	// Reference: BeamEmitter'BallisticProV55.HVCMk9_PlayerEffect.BeamEmitter3'
	begin object name="BeamEmitter3" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=100.0000000,Max=200.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
		HighFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		HighFrequencyPoints=8
		NoiseDeterminesEndPoint=true
		UseColorScale=true
		FadeOut=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2892860,Color=(R=64,G=128,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=255,B=128,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.0840000
		CoordinateSystem=1
		MaxParticles=6
		DetailMode=2
		StartLocationOffset=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-20.0000000,Max=20.0000000))
		StartSizeRange=(X=(Min=5.0000000,Max=7.0000000),Y=(Min=5.0000000,Max=7.0000000),Z=(Min=5.0000000,Max=7.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=-200.0000000,Max=200.0000000))
	end object
	Emitters[3]=BeamEmitter3
	AutoDestroy=true
	AmbientSound=Sound'BW_Core_WeaponSound.LightningGun.LG-Flesh'
	bHardAttach=true
	SoundVolume=255
	SoundRadius=128.0000000
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.HVCMk9_PlayerEffect.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1571430,Color=(R=128,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.3464290,Color=(R=64,G=192,B=255,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=255,A=255))
	FadeOutStartTime=0.1250000
	MaxParticles=2
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-20.0000000,Max=20.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.5000000)
	SizeScale[2]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=40.0000000,Max=60.0000000),Z=(Min=40.0000000,Max=60.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3500000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.HVCMk9_PlayerEffect.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	SpinParticles=true
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3428570,Color=(R=64,G=160,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
	FadeOutStartTime=0.1320000
	CoordinateSystem=1
	MaxParticles=14
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	StartSpinRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=14.0000000,Max=24.0000000),Y=(Min=14.0000000,Max=24.0000000),Z=(Min=14.0000000,Max=24.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Beams.BeamFalloff'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	StartVelocityRange=(X=(Min=50.0000000,Max=400.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=-50.0000000,Max=200.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.HVCMk9_PlayerEffect.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
	ExtentMultiplier=(X=0.1000000,Y=0.1000000,Z=0.1000000)
	DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.4000000,Max=0.4000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=1.2600000
	MaxParticles=120
	DetailMode=2
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-20.0000000,Max=20.0000000))
	StartSizeRange=(X=(Min=4.0000000,Max=7.0000000),Y=(Min=4.0000000,Max=7.0000000),Z=(Min=4.0000000,Max=7.0000000))
	InitialParticlesPerSecond=5.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	MinSquaredVelocity=1000.0000000
	LifetimeRange=(Min=2.5000000,Max=2.5000000)
	StartVelocityRange=(X=(Min=20.0000000,Max=100.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
end object
// Reference: BeamEmitter'BallisticProV55.HVCMk9_PlayerEffect.BeamEmitter3'
begin object name="BeamEmitter3" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=100.0000000,Max=200.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	HighFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	HighFrequencyPoints=8
	NoiseDeterminesEndPoint=true
	UseColorScale=true
	FadeOut=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2892860,Color=(R=64,G=128,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=255,B=128,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.0840000
	CoordinateSystem=1
	MaxParticles=6
	DetailMode=2
	StartLocationOffset=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-20.0000000,Max=20.0000000))
	StartSizeRange=(X=(Min=5.0000000,Max=7.0000000),Y=(Min=5.0000000,Max=7.0000000),Z=(Min=5.0000000,Max=7.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=-200.0000000,Max=200.0000000))
end object
