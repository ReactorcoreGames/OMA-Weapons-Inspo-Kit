class BG_SawHit extends DGVEmitter;

defaultproperties
{
	bModifyLossRange=false
	// Reference: SpriteEmitter'BallisticProV55.BG_SawHit.SpriteEmitter31'
	begin object name="SpriteEmitter31" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		DampRotation=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		ExtentMultiplier=(X=0.3000000,Y=0.3000000,Z=0.3000000)
		DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.8000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.6000000,Max=0.6000000))
		FadeOutStartTime=3.4000000
		MaxParticles=3
		StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=1.0000000,Max=3.0000000),Y=(Min=1.0000000,Max=3.0000000),Z=(Min=1.0000000,Max=3.0000000))
		InitialParticlesPerSecond=30.0000000
		DrawStyle=1
		Texture=Texture'BallisticBloodPro.Sprites.LimbBits'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		MinSquaredVelocity=1000.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-100.0000000,Max=0.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=50.0000000,Max=100.0000000))
	end object
	Emitters[0]=SpriteEmitter31
	// Reference: SpriteEmitter'BallisticProV55.BG_SawHit.SpriteEmitter32'
	begin object name="SpriteEmitter32" class=Engine.SpriteEmitter
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
		ColorMultiplierRange=(X=(Min=0.4000000,Max=0.8000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.6100000
		FadeOutStartTime=0.9000000
		FadeInEndTime=0.2000000
		MaxParticles=1
		StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.3800000,RelativeSize=0.7000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=10.0000000,Max=15.0000000),Z=(Min=10.0000000,Max=15.0000000))
		InitialParticlesPerSecond=400.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.5000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-50.0000000,Max=0.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=30.0000000))
		VelocityLossRange=(X=(Min=1.5000000,Max=1.5000000),Y=(Min=1.5000000,Max=1.5000000),Z=(Min=3.0000000,Max=3.0000000))
	end object
	Emitters[1]=SpriteEmitter32
	// Reference: TrailEmitter'BallisticProV55.BG_SawHit.TrailEmitter10'
	begin object name="TrailEmitter10" class=Engine.TrailEmitter
		TrailShadeType=4
		MaxPointsPerTrail=15
		DistanceThreshold=8.0000000
		PointLifeTime=2.0000000
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		ColorMultiplierRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeInEndTime=0.1000000
		MaxParticles=1
		DetailMode=2
		StartLocationOffset=(X=8.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=400.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3500000,Max=0.3500000)
		StartVelocityRange=(X=(Min=-400.0000000,Max=-150.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-200.0000000,Max=150.0000000))
	end object
	Emitters[2]=TrailEmitter10
	// Reference: SpriteEmitter'BallisticProV55.BG_SawHit.SpriteEmitter33'
	begin object name="SpriteEmitter33" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutFactor=(W=0.5000000,X=1.0000000,Y=1.0000000,Z=1.0000000)
		FadeOutStartTime=0.0320000
		MaxParticles=1
		StartLocationOffset=(X=6.0000000,Y=0.0000000,Z=0.0000000)
		AlphaRef=96
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=30.0000000),Y=(Min=20.0000000,Max=30.0000000),Z=(Min=20.0000000,Max=30.0000000))
		InitialParticlesPerSecond=400.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		StartVelocityRange=(X=(Min=-200.0000000,Max=-50.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-100.0000000,Max=100.0000000))
	end object
	Emitters[3]=SpriteEmitter33
	// Reference: SpriteEmitter'BallisticProV55.BG_SawHit.SpriteEmitter35'
	begin object name="SpriteEmitter35" class=Engine.SpriteEmitter
		UseDirectionAs=1
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
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		ExtentMultiplier=(X=0.3000000,Y=0.3000000,Z=0.3000000)
		DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.8000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.1750000
		MaxParticles=3
		StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=0.0000000)
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.5600000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=8.0000000,Max=10.0000000),Y=(Min=8.0000000,Max=10.0000000),Z=(Min=8.0000000,Max=10.0000000))
		InitialParticlesPerSecond=30.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1Alpha'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		MinSquaredVelocity=1000.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		StartVelocityRange=(X=(Min=-100.0000000,Max=-50.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-100.0000000,Max=100.0000000))
	end object
	Emitters[4]=SpriteEmitter35
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.BG_SawHit.SpriteEmitter31'
begin object name="SpriteEmitter31" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	DampRotation=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	ExtentMultiplier=(X=0.3000000,Y=0.3000000,Z=0.3000000)
	DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.8000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.6000000,Max=0.6000000))
	FadeOutStartTime=3.4000000
	MaxParticles=3
	StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=1.0000000,Max=3.0000000),Y=(Min=1.0000000,Max=3.0000000),Z=(Min=1.0000000,Max=3.0000000))
	InitialParticlesPerSecond=30.0000000
	DrawStyle=1
	Texture=Texture'BallisticBloodPro.Sprites.LimbBits'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	MinSquaredVelocity=1000.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-100.0000000,Max=0.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=50.0000000,Max=100.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.BG_SawHit.SpriteEmitter32'
begin object name="SpriteEmitter32" class=Engine.SpriteEmitter
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
	ColorMultiplierRange=(X=(Min=0.4000000,Max=0.8000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.6100000
	FadeOutStartTime=0.9000000
	FadeInEndTime=0.2000000
	MaxParticles=1
	StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.3800000,RelativeSize=0.7000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=10.0000000,Max=15.0000000),Z=(Min=10.0000000,Max=15.0000000))
	InitialParticlesPerSecond=400.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.5000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-50.0000000,Max=0.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=30.0000000))
	VelocityLossRange=(X=(Min=1.5000000,Max=1.5000000),Y=(Min=1.5000000,Max=1.5000000),Z=(Min=3.0000000,Max=3.0000000))
end object
// Reference: TrailEmitter'BallisticProV55.BG_SawHit.TrailEmitter10'
begin object name="TrailEmitter10" class=Engine.TrailEmitter
	TrailShadeType=4
	MaxPointsPerTrail=15
	DistanceThreshold=8.0000000
	PointLifeTime=2.0000000
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	ColorMultiplierRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeInEndTime=0.1000000
	MaxParticles=1
	DetailMode=2
	StartLocationOffset=(X=8.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=400.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3500000,Max=0.3500000)
	StartVelocityRange=(X=(Min=-400.0000000,Max=-150.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-200.0000000,Max=150.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.BG_SawHit.SpriteEmitter33'
begin object name="SpriteEmitter33" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutFactor=(W=0.5000000,X=1.0000000,Y=1.0000000,Z=1.0000000)
	FadeOutStartTime=0.0320000
	MaxParticles=1
	StartLocationOffset=(X=6.0000000,Y=0.0000000,Z=0.0000000)
	AlphaRef=96
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=30.0000000),Y=(Min=20.0000000,Max=30.0000000),Z=(Min=20.0000000,Max=30.0000000))
	InitialParticlesPerSecond=400.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	StartVelocityRange=(X=(Min=-200.0000000,Max=-50.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-100.0000000,Max=100.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.BG_SawHit.SpriteEmitter35'
begin object name="SpriteEmitter35" class=Engine.SpriteEmitter
	UseDirectionAs=1
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
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	ExtentMultiplier=(X=0.3000000,Y=0.3000000,Z=0.3000000)
	DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.8000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.1750000
	MaxParticles=3
	StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=0.0000000)
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.5600000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=8.0000000,Max=10.0000000),Y=(Min=8.0000000,Max=10.0000000),Z=(Min=8.0000000,Max=10.0000000))
	InitialParticlesPerSecond=30.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1Alpha'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	MinSquaredVelocity=1000.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	StartVelocityRange=(X=(Min=-100.0000000,Max=-50.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-100.0000000,Max=100.0000000))
end object
