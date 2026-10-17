class BG_ArmExplodeBot extends BW_HitGoreEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.BG_ArmExplodeBot.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		DampRotation=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		ExtentMultiplier=(X=0.3000000,Y=0.3000000,Z=0.3000000)
		DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.3525000
		MaxParticles=25
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=8.0000000),Z=(Min=-8.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.2500000)
		StartSizeRange=(X=(Min=15.0000000,Max=35.0000000),Y=(Min=15.0000000,Max=35.0000000),Z=(Min=15.0000000,Max=35.0000000))
		InitialParticlesPerSecond=400.0000000
		DrawStyle=1
		Texture=Texture'BallisticBloodPro.Bot.Bot-Saw2'
		SecondsBeforeInactive=0.0000000
		MinSquaredVelocity=1000.0000000
		LifetimeRange=(Min=0.7500000,Max=0.7500000)
		StartVelocityRange=(X=(Min=-50.0000000,Max=250.0000000),Y=(Min=-10.0000000,Max=100.0000000),Z=(Min=-50.0000000,Max=150.0000000))
	end object
	Emitters[0]=SpriteEmitter4
	// Reference: SpriteEmitter'BallisticProV55.BG_ArmExplodeBot.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.3000000,Max=0.7000000),Z=(Min=0.4000000,Max=0.8000000))
		Opacity=0.5600000
		FadeOutStartTime=0.8600000
		FadeInEndTime=0.2200000
		MaxParticles=8
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=8.0000000),Z=(Min=-4.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.7000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=10.0000000,Max=15.0000000),Z=(Min=10.0000000,Max=15.0000000))
		InitialParticlesPerSecond=400.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=50.0000000),Y=(Min=-10.0000000,Max=40.0000000),Z=(Min=-10.0000000,Max=40.0000000))
		VelocityLossRange=(X=(Min=1.8000000,Max=1.8000000),Y=(Min=1.8000000,Max=1.8000000),Z=(Min=3.0000000,Max=3.0000000))
	end object
	Emitters[1]=SpriteEmitter10
	// Reference: TrailEmitter'BallisticProV55.BG_ArmExplodeBot.TrailEmitter0'
	begin object name="TrailEmitter0" class=Engine.TrailEmitter
		TrailShadeType=4
		MaxPointsPerTrail=15
		DistanceThreshold=8.0000000
		PointLifeTime=1.0000000
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.6000000,Max=1.0000000),Z=(Min=0.6000000,Max=1.0000000))
		MaxParticles=3
		DetailMode=2
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=5.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=12.0000000),Z=(Min=-4.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=2.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=400.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7000000,Max=0.7000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=400.0000000),Y=(Min=-10.0000000,Max=100.0000000),Z=(Min=-20.0000000,Max=150.0000000))
	end object
	Emitters[2]=TrailEmitter0
	// Reference: SpriteEmitter'BallisticProV55.BG_ArmExplodeBot.SpriteEmitter11'
	begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.7000000,Max=0.8000000))
		FadeOutStartTime=0.0630000
		MaxParticles=25
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=6.0000000,Max=12.0000000),Y=(Min=6.0000000,Max=12.0000000),Z=(Min=6.0000000,Max=12.0000000))
		InitialParticlesPerSecond=100.0000000
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3500000,Max=0.3500000)
		StartVelocityRange=(X=(Min=50.0000000,Max=500.0000000),Y=(Min=-350.0000000,Max=350.0000000),Z=(Min=-100.0000000,Max=300.0000000))
	end object
	Emitters[3]=SpriteEmitter11
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.BG_ArmExplodeBot.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	DampRotation=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	ExtentMultiplier=(X=0.3000000,Y=0.3000000,Z=0.3000000)
	DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.3525000
	MaxParticles=25
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=8.0000000),Z=(Min=-8.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.2500000)
	StartSizeRange=(X=(Min=15.0000000,Max=35.0000000),Y=(Min=15.0000000,Max=35.0000000),Z=(Min=15.0000000,Max=35.0000000))
	InitialParticlesPerSecond=400.0000000
	DrawStyle=1
	Texture=Texture'BallisticBloodPro.Bot.Bot-Saw2'
	SecondsBeforeInactive=0.0000000
	MinSquaredVelocity=1000.0000000
	LifetimeRange=(Min=0.7500000,Max=0.7500000)
	StartVelocityRange=(X=(Min=-50.0000000,Max=250.0000000),Y=(Min=-10.0000000,Max=100.0000000),Z=(Min=-50.0000000,Max=150.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.BG_ArmExplodeBot.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.3000000,Max=0.7000000),Z=(Min=0.4000000,Max=0.8000000))
	Opacity=0.5600000
	FadeOutStartTime=0.8600000
	FadeInEndTime=0.2200000
	MaxParticles=8
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=8.0000000),Z=(Min=-4.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.7000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=10.0000000,Max=15.0000000),Z=(Min=10.0000000,Max=15.0000000))
	InitialParticlesPerSecond=400.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=50.0000000),Y=(Min=-10.0000000,Max=40.0000000),Z=(Min=-10.0000000,Max=40.0000000))
	VelocityLossRange=(X=(Min=1.8000000,Max=1.8000000),Y=(Min=1.8000000,Max=1.8000000),Z=(Min=3.0000000,Max=3.0000000))
end object
// Reference: TrailEmitter'BallisticProV55.BG_ArmExplodeBot.TrailEmitter0'
begin object name="TrailEmitter0" class=Engine.TrailEmitter
	TrailShadeType=4
	MaxPointsPerTrail=15
	DistanceThreshold=8.0000000
	PointLifeTime=1.0000000
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.6000000,Max=1.0000000),Z=(Min=0.6000000,Max=1.0000000))
	MaxParticles=3
	DetailMode=2
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=12.0000000),Z=(Min=-4.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=2.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=400.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7000000,Max=0.7000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=400.0000000),Y=(Min=-10.0000000,Max=100.0000000),Z=(Min=-20.0000000,Max=150.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.BG_ArmExplodeBot.SpriteEmitter11'
begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.7000000,Max=0.8000000))
	FadeOutStartTime=0.0630000
	MaxParticles=25
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=6.0000000,Max=12.0000000),Y=(Min=6.0000000,Max=12.0000000),Z=(Min=6.0000000,Max=12.0000000))
	InitialParticlesPerSecond=100.0000000
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3500000,Max=0.3500000)
	StartVelocityRange=(X=(Min=50.0000000,Max=500.0000000),Y=(Min=-350.0000000,Max=350.0000000),Z=(Min=-100.0000000,Max=300.0000000))
end object
