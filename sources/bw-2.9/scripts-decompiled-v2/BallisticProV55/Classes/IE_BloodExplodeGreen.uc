class IE_BloodExplodeGreen extends DGVEmitter;

defaultproperties
{
	DisableDGV[0]=1
	DisableDGV[1]=0
	DisableDGV[2]=1
	// Reference: SpriteEmitter'BallisticProV55.IE_BloodExplodeGreen.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-20.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.4200000
		FadeOutStartTime=1.2000000
		FadeInEndTime=0.0800000
		MaxParticles=6
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=0.7000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=70.0000000,Max=70.0000000),Z=(Min=70.0000000,Max=70.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=0.0000000,Max=200.0000000))
		VelocityLossRange=(X=(Min=1.5000000,Max=1.5000000),Y=(Min=1.5000000,Max=1.5000000),Z=(Min=1.5000000,Max=1.5000000))
	end object
	Emitters[0]=SpriteEmitter2
	// Reference: TrailEmitter'BallisticProV55.IE_BloodExplodeGreen.TrailEmitter0'
	begin object name="TrailEmitter0" class=Engine.TrailEmitter
		TrailLocation=1
		MaxPointsPerTrail=15
		DistanceThreshold=10.0000000
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.5000000
		FadeInEndTime=0.0500000
		MaxParticles=2
		DetailMode=2
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-10.0000000,Max=30.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=70.0000000,Max=90.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		Texture=Texture'BallisticBloodPro.Particles.BloodMistShot1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
		StartVelocityRange=(X=(Min=300.0000000,Max=500.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=100.0000000,Max=120.0000000))
	end object
	Emitters[1]=TrailEmitter0
	// Reference: SpriteEmitter'BallisticProV55.IE_BloodExplodeGreen.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=1.3600000
		FadeInEndTime=0.1000000
		AlphaRef=128
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.3800000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=80.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-80.0000000,Max=80.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=150.0000000,Max=300.0000000))
	end object
	Emitters[2]=SpriteEmitter1
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.IE_BloodExplodeGreen.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-20.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.4200000
	FadeOutStartTime=1.2000000
	FadeInEndTime=0.0800000
	MaxParticles=6
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=0.7000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=70.0000000,Max=70.0000000),Z=(Min=70.0000000,Max=70.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=0.0000000,Max=200.0000000))
	VelocityLossRange=(X=(Min=1.5000000,Max=1.5000000),Y=(Min=1.5000000,Max=1.5000000),Z=(Min=1.5000000,Max=1.5000000))
end object
// Reference: TrailEmitter'BallisticProV55.IE_BloodExplodeGreen.TrailEmitter0'
begin object name="TrailEmitter0" class=Engine.TrailEmitter
	TrailLocation=1
	MaxPointsPerTrail=15
	DistanceThreshold=10.0000000
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.5000000
	FadeInEndTime=0.0500000
	MaxParticles=2
	DetailMode=2
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-10.0000000,Max=30.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=70.0000000,Max=90.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	Texture=Texture'BallisticBloodPro.Particles.BloodMistShot1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
	StartVelocityRange=(X=(Min=300.0000000,Max=500.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=100.0000000,Max=120.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_BloodExplodeGreen.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=1.3600000
	FadeInEndTime=0.1000000
	AlphaRef=128
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.3800000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=80.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-80.0000000,Max=80.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=150.0000000,Max=300.0000000))
end object
