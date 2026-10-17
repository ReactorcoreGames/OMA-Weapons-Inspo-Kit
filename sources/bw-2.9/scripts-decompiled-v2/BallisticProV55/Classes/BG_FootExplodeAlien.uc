class BG_FootExplodeAlien extends BW_HitGoreEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.BG_FootExplodeAlien.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		DampRotation=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
		ExtentMultiplier=(X=0.3000000,Y=0.3000000,Z=0.3000000)
		DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.7000000,Max=0.8000000),Z=(Min=0.6000000,Max=0.6000000))
		FadeOutStartTime=3.4000000
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=2.0000000,Max=5.0000000),Y=(Min=2.0000000,Max=5.0000000),Z=(Min=2.0000000,Max=5.0000000))
		InitialParticlesPerSecond=400.0000000
		DrawStyle=1
		Texture=Texture'BallisticBloodPro.AlienSprites.Alien-LimbBits'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		MinSquaredVelocity=1000.0000000
		StartVelocityRange=(X=(Min=2.0000000,Max=250.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=50.0000000,Max=200.0000000))
	end object
	Emitters[0]=SpriteEmitter7
	// Reference: SpriteEmitter'BallisticProV55.BG_FootExplodeAlien.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
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
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.4000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.7200000
		FadeOutStartTime=0.6900000
		FadeInEndTime=0.1200000
		MaxParticles=4
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-6.0000000,Max=6.0000000),Z=(Min=-12.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.7000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=10.0000000,Max=15.0000000),Z=(Min=10.0000000,Max=15.0000000))
		InitialParticlesPerSecond=400.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
		StartVelocityRange=(X=(Min=-10.0000000,Max=40.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=60.0000000))
		VelocityLossRange=(X=(Min=1.5000000,Max=1.5000000),Y=(Min=1.5000000,Max=1.5000000),Z=(Min=3.0000000,Max=3.0000000))
	end object
	Emitters[1]=SpriteEmitter8
	// Reference: TrailEmitter'BallisticProV55.BG_FootExplodeAlien.TrailEmitter2'
	begin object name="TrailEmitter2" class=Engine.TrailEmitter
		TrailShadeType=4
		MaxPointsPerTrail=15
		DistanceThreshold=8.0000000
		PointLifeTime=2.0000000
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		MaxParticles=1
		DetailMode=2
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-5.0000000)
		StartSizeRange=(X=(Min=3.0000000,Max=8.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=400.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7000000,Max=0.7000000)
		StartVelocityRange=(X=(Min=150.0000000,Max=300.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=100.0000000))
	end object
	Emitters[2]=TrailEmitter2
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.BG_FootExplodeAlien.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	DampRotation=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
	ExtentMultiplier=(X=0.3000000,Y=0.3000000,Z=0.3000000)
	DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.7000000,Max=0.8000000),Z=(Min=0.6000000,Max=0.6000000))
	FadeOutStartTime=3.4000000
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=2.0000000,Max=5.0000000),Y=(Min=2.0000000,Max=5.0000000),Z=(Min=2.0000000,Max=5.0000000))
	InitialParticlesPerSecond=400.0000000
	DrawStyle=1
	Texture=Texture'BallisticBloodPro.AlienSprites.Alien-LimbBits'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	MinSquaredVelocity=1000.0000000
	StartVelocityRange=(X=(Min=2.0000000,Max=250.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=50.0000000,Max=200.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.BG_FootExplodeAlien.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
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
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.4000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.7200000
	FadeOutStartTime=0.6900000
	FadeInEndTime=0.1200000
	MaxParticles=4
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-6.0000000,Max=6.0000000),Z=(Min=-12.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.7000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=10.0000000,Max=15.0000000),Z=(Min=10.0000000,Max=15.0000000))
	InitialParticlesPerSecond=400.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
	StartVelocityRange=(X=(Min=-10.0000000,Max=40.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=60.0000000))
	VelocityLossRange=(X=(Min=1.5000000,Max=1.5000000),Y=(Min=1.5000000,Max=1.5000000),Z=(Min=3.0000000,Max=3.0000000))
end object
// Reference: TrailEmitter'BallisticProV55.BG_FootExplodeAlien.TrailEmitter2'
begin object name="TrailEmitter2" class=Engine.TrailEmitter
	TrailShadeType=4
	MaxPointsPerTrail=15
	DistanceThreshold=8.0000000
	PointLifeTime=2.0000000
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	MaxParticles=1
	DetailMode=2
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-5.0000000)
	StartSizeRange=(X=(Min=3.0000000,Max=8.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=400.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7000000,Max=0.7000000)
	StartVelocityRange=(X=(Min=150.0000000,Max=300.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=100.0000000))
end object
