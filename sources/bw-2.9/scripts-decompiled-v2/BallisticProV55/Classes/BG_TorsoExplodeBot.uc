class BG_TorsoExplodeBot extends BW_HitGoreEmitter;

defaultproperties
{
	DisableDGV[0]=0
	DisableDGV[1]=0
	DisableDGV[2]=0
	DisableDGV[3]=0
	DisableDGV[4]=1
	// Reference: SpriteEmitter'BallisticProV55.BG_TorsoExplodeBot.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
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
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
		ExtentMultiplier=(X=0.3000000,Y=0.3000000,Z=0.3000000)
		DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.1350000
		MaxParticles=25
		AlphaRef=32
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=25.0000000,Max=50.0000000),Y=(Min=25.0000000,Max=50.0000000),Z=(Min=25.0000000,Max=50.0000000))
		InitialParticlesPerSecond=400.0000000
		DrawStyle=1
		Texture=Texture'BallisticBloodPro.Bot.Bot-Saw2'
		SecondsBeforeInactive=0.0000000
		MinSquaredVelocity=1000.0000000
		LifetimeRange=(Min=0.7500000,Max=0.7500000)
		StartVelocityRange=(X=(Min=-100.0000000,Max=400.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=0.0000000,Max=250.0000000))
	end object
	Emitters[0]=SpriteEmitter3
	// Reference: SpriteEmitter'BallisticProV55.BG_TorsoExplodeBot.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
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
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.3000000,Max=0.7000000),Z=(Min=0.5000000,Max=0.8000000))
		Opacity=0.7200000
		FadeOutStartTime=1.1600000
		FadeInEndTime=0.2800000
		MaxParticles=12
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.7000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=30.0000000,Max=40.0000000),Y=(Min=30.0000000,Max=40.0000000),Z=(Min=30.0000000,Max=40.0000000))
		InitialParticlesPerSecond=400.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		StartVelocityRange=(X=(Min=-10.0000000,Max=60.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=0.0000000,Max=200.0000000))
		VelocityLossRange=(X=(Min=1.3000000,Max=1.3000000),Y=(Min=1.3000000,Max=1.3000000),Z=(Min=3.0000000,Max=3.0000000))
	end object
	Emitters[1]=SpriteEmitter7
	// Reference: SpriteEmitter'BallisticProV55.BG_TorsoExplodeBot.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.4000000,Max=0.7000000),Z=(Min=0.5000000,Max=0.8000000))
		FadeOutStartTime=0.6800000
		MaxParticles=6
		AlphaRef=128
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.6800000,RelativeSize=0.7000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=80.0000000,Max=100.0000000),Y=(Min=80.0000000,Max=100.0000000),Z=(Min=80.0000000,Max=100.0000000))
		InitialParticlesPerSecond=400.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-20.0000000,Max=80.0000000),Y=(Min=-60.0000000,Max=60.0000000),Z=(Min=140.0000000,Max=220.0000000))
		VelocityLossRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[2]=SpriteEmitter8
	// Reference: SpriteEmitter'BallisticProV55.BG_TorsoExplodeBot.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		UseDirectionAs=1
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.4000000,Max=0.8000000),Y=(Min=0.4000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.2850000
		FadeInEndTime=0.0400000
		MaxParticles=35
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=32.0000000))
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=10.0000000,Max=15.0000000),Z=(Min=10.0000000,Max=15.0000000))
		InitialParticlesPerSecond=150.0000000
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=-300.0000000,Max=300.0000000),Y=(Min=-300.0000000,Max=300.0000000),Z=(Min=0.0000000,Max=400.0000000))
	end object
	Emitters[3]=SpriteEmitter9
	// Reference: BeamEmitter'BallisticProV55.BG_TorsoExplodeBot.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=75.0000000,Max=110.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
		HighFrequencyNoiseRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
		HighFrequencyPoints=5
		NoiseDeterminesEndPoint=true
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1500000,Color=(R=0,G=128,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.3321430,Color=(R=255,G=255,B=255,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		Opacity=0.6500000
		FadeOutStartTime=0.0600000
		FadeInEndTime=0.0360000
		MaxParticles=25
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.5000000)
		SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=0.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=25.0000000,Max=40.0000000),Y=(Min=25.0000000,Max=40.0000000),Z=(Min=25.0000000,Max=40.0000000))
		InitialParticlesPerSecond=15.0000000
		Texture=Texture'EpicParticles.Beams.BeamFalloff'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=15.0000000))
	end object
	Emitters[4]=BeamEmitter0
	// Reference: SpriteEmitter'BallisticProV55.BG_TorsoExplodeBot.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseDirectionAs=4
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.6000000,Max=0.9000000),Z=(Min=0.7000000,Max=0.9000000))
		FadeOutStartTime=0.0900000
		FadeInEndTime=0.0250000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=1.2500000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.2500000)
		InitialParticlesPerSecond=50.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.WaterRing1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[5]=SpriteEmitter0
	// Reference: MeshEmitter'BallisticProV55.BG_TorsoExplodeBot.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip2'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1571430,Color=(R=255,G=255,B=128,A=255))
		ColorScale[2]=(RelativeTime=0.4821430,Color=(R=255,G=128,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=255,A=255))
		FadeOutStartTime=0.5840000
		MaxParticles=50
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=4.0000000),Z=(Min=0.0000000,Max=4.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=0.0500000,Max=0.3000000),Y=(Min=0.0500000,Max=0.3000000),Z=(Min=0.0500000,Max=0.3000000))
		InitialParticlesPerSecond=400.0000000
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=350.0000000),Y=(Min=-125.0000000,Max=125.0000000),Z=(Min=50.0000000,Max=300.0000000))
	end object
	Emitters[6]=MeshEmitter1
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.BG_TorsoExplodeBot.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
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
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
	ExtentMultiplier=(X=0.3000000,Y=0.3000000,Z=0.3000000)
	DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.1350000
	MaxParticles=25
	AlphaRef=32
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=25.0000000,Max=50.0000000),Y=(Min=25.0000000,Max=50.0000000),Z=(Min=25.0000000,Max=50.0000000))
	InitialParticlesPerSecond=400.0000000
	DrawStyle=1
	Texture=Texture'BallisticBloodPro.Bot.Bot-Saw2'
	SecondsBeforeInactive=0.0000000
	MinSquaredVelocity=1000.0000000
	LifetimeRange=(Min=0.7500000,Max=0.7500000)
	StartVelocityRange=(X=(Min=-100.0000000,Max=400.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=0.0000000,Max=250.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.BG_TorsoExplodeBot.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
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
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.3000000,Max=0.7000000),Z=(Min=0.5000000,Max=0.8000000))
	Opacity=0.7200000
	FadeOutStartTime=1.1600000
	FadeInEndTime=0.2800000
	MaxParticles=12
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.7000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=30.0000000,Max=40.0000000),Y=(Min=30.0000000,Max=40.0000000),Z=(Min=30.0000000,Max=40.0000000))
	InitialParticlesPerSecond=400.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	StartVelocityRange=(X=(Min=-10.0000000,Max=60.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=0.0000000,Max=200.0000000))
	VelocityLossRange=(X=(Min=1.3000000,Max=1.3000000),Y=(Min=1.3000000,Max=1.3000000),Z=(Min=3.0000000,Max=3.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.BG_TorsoExplodeBot.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.4000000,Max=0.7000000),Z=(Min=0.5000000,Max=0.8000000))
	FadeOutStartTime=0.6800000
	MaxParticles=6
	AlphaRef=128
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.6800000,RelativeSize=0.7000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=80.0000000,Max=100.0000000),Y=(Min=80.0000000,Max=100.0000000),Z=(Min=80.0000000,Max=100.0000000))
	InitialParticlesPerSecond=400.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-20.0000000,Max=80.0000000),Y=(Min=-60.0000000,Max=60.0000000),Z=(Min=140.0000000,Max=220.0000000))
	VelocityLossRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.BG_TorsoExplodeBot.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	UseDirectionAs=1
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.4000000,Max=0.8000000),Y=(Min=0.4000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.2850000
	FadeInEndTime=0.0400000
	MaxParticles=35
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=32.0000000))
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=10.0000000,Max=15.0000000),Z=(Min=10.0000000,Max=15.0000000))
	InitialParticlesPerSecond=150.0000000
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=-300.0000000,Max=300.0000000),Y=(Min=-300.0000000,Max=300.0000000),Z=(Min=0.0000000,Max=400.0000000))
end object
// Reference: BeamEmitter'BallisticProV55.BG_TorsoExplodeBot.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=75.0000000,Max=110.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
	HighFrequencyNoiseRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
	HighFrequencyPoints=5
	NoiseDeterminesEndPoint=true
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1500000,Color=(R=0,G=128,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.3321430,Color=(R=255,G=255,B=255,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	Opacity=0.6500000
	FadeOutStartTime=0.0600000
	FadeInEndTime=0.0360000
	MaxParticles=25
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.5000000)
	SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=0.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=25.0000000,Max=40.0000000),Y=(Min=25.0000000,Max=40.0000000),Z=(Min=25.0000000,Max=40.0000000))
	InitialParticlesPerSecond=15.0000000
	Texture=Texture'EpicParticles.Beams.BeamFalloff'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=15.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.BG_TorsoExplodeBot.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseDirectionAs=4
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.6000000,Max=0.9000000),Z=(Min=0.7000000,Max=0.9000000))
	FadeOutStartTime=0.0900000
	FadeInEndTime=0.0250000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=1.2500000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.2500000)
	InitialParticlesPerSecond=50.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.WaterRing1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: MeshEmitter'BallisticProV55.BG_TorsoExplodeBot.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip2'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1571430,Color=(R=255,G=255,B=128,A=255))
	ColorScale[2]=(RelativeTime=0.4821430,Color=(R=255,G=128,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=255,A=255))
	FadeOutStartTime=0.5840000
	MaxParticles=50
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=4.0000000),Z=(Min=0.0000000,Max=4.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=0.0500000,Max=0.3000000),Y=(Min=0.0500000,Max=0.3000000),Z=(Min=0.0500000,Max=0.3000000))
	InitialParticlesPerSecond=400.0000000
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=350.0000000),Y=(Min=-125.0000000,Max=125.0000000),Z=(Min=50.0000000,Max=300.0000000))
end object
