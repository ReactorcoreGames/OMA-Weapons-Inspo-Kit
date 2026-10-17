class IE_RSProjectileCombo extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.IE_RSProjectileCombo.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=0.5000000))
		Opacity=0.4700000
		FadeOutStartTime=0.2560000
		FadeInEndTime=0.0320000
		MaxParticles=5
		StartLocationRange=(X=(Min=-25.0000000,Max=25.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=-25.0000000,Max=25.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=50.0000000,Max=75.0000000),Y=(Min=50.0000000,Max=75.0000000),Z=(Min=50.0000000,Max=75.0000000))
		InitialParticlesPerSecond=20.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: BeamEmitter'BallisticProV55.IE_RSProjectileCombo.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=64.0000000,Max=200.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=-48.0000000,Max=48.0000000),Y=(Min=-48.0000000,Max=48.0000000),Z=(Min=-48.0000000,Max=48.0000000))
		HighFrequencyNoiseRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
		HighFrequencyPoints=8
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.8000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.0760000
		FadeInEndTime=0.0200000
		StartLocationShape=1
		SphereRadiusRange=(Min=24.0000000,Max=24.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=3.0000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
		InitialParticlesPerSecond=40.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		StartVelocityRadialRange=(Min=-1.0000000,Max=-1.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[1]=BeamEmitter0
	// Reference: SpriteEmitter'BallisticProV55.IE_RSProjectileCombo.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.0960000
		FadeInEndTime=0.0160000
		MaxParticles=3
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=2.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
		InitialParticlesPerSecond=8.0000000
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareC1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[2]=SpriteEmitter1
	// Reference: SpriteEmitter'BallisticProV55.IE_RSProjectileCombo.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-250.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.1928570,Color=(R=255,G=200,B=96,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=255,A=255))
		FadeOutStartTime=0.4000000
		StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=24.0000000),Y=(Min=10.0000000,Max=24.0000000),Z=(Min=10.0000000,Max=24.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-500.0000000,Max=500.0000000),Y=(Min=-500.0000000,Max=500.0000000),Z=(Min=-500.0000000,Max=500.0000000))
	end object
	Emitters[3]=SpriteEmitter2
	// Reference: SpriteEmitter'BallisticProV55.IE_RSProjectileCombo.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=128,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.7500000,Color=(R=255,G=200,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=0,A=255))
		FadeOutStartTime=0.2100000
		FadeInEndTime=0.1600000
		MaxParticles=200
		AddLocationFromOtherEmitter=3
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=6.0000000),Y=(Min=15.0000000,Max=25.0000000),Z=(Min=5.0000000,Max=5.0000000))
		InitialParticlesPerSecond=200.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke5'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		VelocityLossRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
		AddVelocityFromOtherEmitter=3
		AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
	end object
	Emitters[4]=SpriteEmitter6
	// Reference: SpriteEmitter'BallisticProV55.IE_RSProjectileCombo.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		Disabled=true
		Backup_Disabled=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=202,B=102,A=255))
		ColorScale[1]=(RelativeTime=0.1785710,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
		Opacity=0.6200000
		FadeOutStartTime=0.5600000
		FadeInEndTime=0.4400000
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		InitialParticlesPerSecond=50.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1f'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-250.0000000,Max=250.0000000),Y=(Min=-250.0000000,Max=250.0000000),Z=(Min=-250.0000000,Max=250.0000000))
		VelocityLossRange=(X=(Min=1.6000000,Max=1.6000000),Y=(Min=1.6000000,Max=1.6000000),Z=(Min=1.6000000,Max=1.6000000))
	end object
	Emitters[5]=SpriteEmitter7
	// Reference: SpriteEmitter'BallisticProV55.IE_RSProjectileCombo.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.1050000
		FadeInEndTime=0.0280000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[6]=SpriteEmitter8
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.IE_RSProjectileCombo.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=0.5000000))
	Opacity=0.4700000
	FadeOutStartTime=0.2560000
	FadeInEndTime=0.0320000
	MaxParticles=5
	StartLocationRange=(X=(Min=-25.0000000,Max=25.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=-25.0000000,Max=25.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=50.0000000,Max=75.0000000),Y=(Min=50.0000000,Max=75.0000000),Z=(Min=50.0000000,Max=75.0000000))
	InitialParticlesPerSecond=20.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
// Reference: BeamEmitter'BallisticProV55.IE_RSProjectileCombo.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=64.0000000,Max=200.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=-48.0000000,Max=48.0000000),Y=(Min=-48.0000000,Max=48.0000000),Z=(Min=-48.0000000,Max=48.0000000))
	HighFrequencyNoiseRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
	HighFrequencyPoints=8
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.8000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.0760000
	FadeInEndTime=0.0200000
	StartLocationShape=1
	SphereRadiusRange=(Min=24.0000000,Max=24.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=3.0000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
	InitialParticlesPerSecond=40.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	StartVelocityRadialRange=(Min=-1.0000000,Max=-1.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSProjectileCombo.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.0960000
	FadeInEndTime=0.0160000
	MaxParticles=3
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=2.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
	InitialParticlesPerSecond=8.0000000
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareC1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSProjectileCombo.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-250.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.1928570,Color=(R=255,G=200,B=96,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=255,A=255))
	FadeOutStartTime=0.4000000
	StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=24.0000000),Y=(Min=10.0000000,Max=24.0000000),Z=(Min=10.0000000,Max=24.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-500.0000000,Max=500.0000000),Y=(Min=-500.0000000,Max=500.0000000),Z=(Min=-500.0000000,Max=500.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSProjectileCombo.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=128,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.7500000,Color=(R=255,G=200,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=0,A=255))
	FadeOutStartTime=0.2100000
	FadeInEndTime=0.1600000
	MaxParticles=200
	AddLocationFromOtherEmitter=3
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=6.0000000),Y=(Min=15.0000000,Max=25.0000000),Z=(Min=5.0000000,Max=5.0000000))
	InitialParticlesPerSecond=200.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke5'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	VelocityLossRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
	AddVelocityFromOtherEmitter=3
	AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSProjectileCombo.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	Disabled=true
	Backup_Disabled=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=202,B=102,A=255))
	ColorScale[1]=(RelativeTime=0.1785710,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
	Opacity=0.6200000
	FadeOutStartTime=0.5600000
	FadeInEndTime=0.4400000
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	InitialParticlesPerSecond=50.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1f'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-250.0000000,Max=250.0000000),Y=(Min=-250.0000000,Max=250.0000000),Z=(Min=-250.0000000,Max=250.0000000))
	VelocityLossRange=(X=(Min=1.6000000,Max=1.6000000),Y=(Min=1.6000000,Max=1.6000000),Z=(Min=1.6000000,Max=1.6000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSProjectileCombo.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.1050000
	FadeInEndTime=0.0280000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
