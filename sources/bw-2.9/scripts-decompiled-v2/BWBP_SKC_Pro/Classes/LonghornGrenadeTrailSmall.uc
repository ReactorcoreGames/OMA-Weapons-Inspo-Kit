class LonghornGrenadeTrailSmall extends BallisticEmitter;

simulated function ActivateBeacon()
{
	Emitters[3].Disabled = false;
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornGrenadeTrailSmall.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=196,G=128,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.8000000
		FadeOutStartTime=0.5000000
		CoordinateSystem=1
		MaxParticles=2
		SpinsPerSecondRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=10.0000000))
		InitialParticlesPerSecond=200.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornGrenadeTrailSmall.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=196,G=128,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.1000000
		FadeOutStartTime=0.5000000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationRange=(X=(Min=-8.0000000,Max=-8.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.1500000,Max=0.1500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=20.0000000,Max=25.0000000),Z=(Min=20.0000000,Max=25.0000000))
		InitialParticlesPerSecond=200.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[1]=SpriteEmitter5
	// Reference: TrailEmitter'BWBP_SKC_Pro.LonghornGrenadeTrailSmall.TrailEmitter1'
	begin object name="TrailEmitter1" class=Engine.TrailEmitter
		TrailShadeType=4
		TrailLocation=1
		MaxPointsPerTrail=20
		DistanceThreshold=100.0000000
		PointLifeTime=1.0000000
		FadeOut=true
		FadeIn=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=64,B=64,A=128))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=64,A=128))
		Opacity=0.1000000
		FadeOutStartTime=0.4000000
		FadeInEndTime=0.2000000
		MaxParticles=3
		DetailMode=1
		StartSizeRange=(X=(Min=70.0000000,Max=80.0000000),Y=(Min=25.0000000,Max=27.0000000),Z=(Min=25.0000000,Max=27.0000000))
		InitialParticlesPerSecond=500000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7500000,Max=1.0000000)
	end object
	Emitters[2]=TrailEmitter1
	// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornGrenadeTrailSmall.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		FadeOut=true
		Disabled=true
		Backup_Disabled=true
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=196,G=128,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.1604000
		CoordinateSystem=1
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
		InitialParticlesPerSecond=1.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		LifetimeRange=(Min=0.4010000,Max=0.4010000)
	end object
	Emitters[3]=SpriteEmitter7
	AutoDestroy=true
	bHardAttach=true
	bDirectional=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornGrenadeTrailSmall.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=196,G=128,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.8000000
	FadeOutStartTime=0.5000000
	CoordinateSystem=1
	MaxParticles=2
	SpinsPerSecondRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=10.0000000))
	InitialParticlesPerSecond=200.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornGrenadeTrailSmall.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=196,G=128,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.1000000
	FadeOutStartTime=0.5000000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationRange=(X=(Min=-8.0000000,Max=-8.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.1500000,Max=0.1500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=20.0000000,Max=25.0000000),Z=(Min=20.0000000,Max=25.0000000))
	InitialParticlesPerSecond=200.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: TrailEmitter'BWBP_SKC_Pro.LonghornGrenadeTrailSmall.TrailEmitter1'
begin object name="TrailEmitter1" class=Engine.TrailEmitter
	TrailShadeType=4
	TrailLocation=1
	MaxPointsPerTrail=20
	DistanceThreshold=100.0000000
	PointLifeTime=1.0000000
	FadeOut=true
	FadeIn=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=64,B=64,A=128))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=64,A=128))
	Opacity=0.1000000
	FadeOutStartTime=0.4000000
	FadeInEndTime=0.2000000
	MaxParticles=3
	DetailMode=1
	StartSizeRange=(X=(Min=70.0000000,Max=80.0000000),Y=(Min=25.0000000,Max=27.0000000),Z=(Min=25.0000000,Max=27.0000000))
	InitialParticlesPerSecond=500000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7500000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornGrenadeTrailSmall.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	FadeOut=true
	Disabled=true
	Backup_Disabled=true
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=196,G=128,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.1604000
	CoordinateSystem=1
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
	InitialParticlesPerSecond=1.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	LifetimeRange=(Min=0.4010000,Max=0.4010000)
end object
