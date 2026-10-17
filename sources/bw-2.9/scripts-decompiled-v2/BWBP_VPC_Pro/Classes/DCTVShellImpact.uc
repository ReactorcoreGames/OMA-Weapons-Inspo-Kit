class DCTVShellImpact extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVShellImpact.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-900.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.7000000),Y=(Min=0.3000000,Max=0.4000000),Z=(Min=0.1000000,Max=0.2500000))
		FadeOutStartTime=1.4400000
		MaxParticles=6
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=150.0000000,Max=200.0000000),Y=(Min=150.0000000,Max=200.0000000),Z=(Min=150.0000000,Max=200.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-600.0000000,Max=600.0000000),Y=(Min=-600.0000000,Max=600.0000000),Z=(Min=1000.0000000,Max=3000.0000000))
		VelocityLossRange=(X=(Min=2.5000000,Max=2.5000000),Y=(Min=2.5000000,Max=2.5000000),Z=(Min=2.5000000,Max=2.5000000))
	end object
	Emitters[0]=SpriteEmitter3
	// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVShellImpact.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.2500000,Max=0.2500000))
		FadeOutStartTime=1.4400000
		FadeInEndTime=0.1200000
		MaxParticles=4
		DetailMode=1
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=150.0000000)
		StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=0.0000000,Max=0.0000000))
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.2000000)
		StartSizeRange=(X=(Min=200.0000000,Max=250.0000000),Y=(Min=200.0000000,Max=250.0000000),Z=(Min=200.0000000,Max=250.0000000))
		InitialParticlesPerSecond=1000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke7c'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-500.0000000,Max=500.0000000),Y=(Min=-500.0000000,Max=500.0000000),Z=(Min=200.0000000,Max=800.0000000))
		VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
	end object
	Emitters[1]=SpriteEmitter4
	// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVShellImpact.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		UseCollision=true
		RespawnDeadParticles=false
		SpinParticles=true
		DampRotation=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
		ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.2500000,Max=0.2500000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		MaxParticles=15
		DetailMode=2
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=20.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		RotationDampingFactorRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
		StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		SecondsBeforeInactive=0.0000000
		MinSquaredVelocity=3000.0000000
		StartVelocityRange=(X=(Min=-800.0000000,Max=800.0000000),Y=(Min=-800.0000000,Max=800.0000000),Z=(Min=500.0000000,Max=2000.0000000))
	end object
	Emitters[2]=SpriteEmitter5
	// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVShellImpact.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.6000000,Max=0.6000000))
		FadeOutStartTime=0.1170000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=50.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=4.0000000)
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
	end object
	Emitters[3]=SpriteEmitter6
	// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVShellImpact.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.1500000,Max=0.1500000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.6900000
		FadeOutStartTime=0.1410000
		FadeInEndTime=0.0390000
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=250.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=250.0000000,Max=250.0000000),Y=(Min=250.0000000,Max=250.0000000),Z=(Min=250.0000000,Max=250.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		InitialDelayRange=(Min=0.1500000,Max=0.1500000)
	end object
	Emitters[4]=SpriteEmitter7
	// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVShellImpact.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		UseDirectionAs=1
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.3000000,Max=0.3000000))
		FadeOutStartTime=0.3400000
		FadeInEndTime=0.3200000
		MaxParticles=12
		DetailMode=2
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=60.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=80.0000000,Max=100.0000000),Y=(Min=100.0000000,Max=180.0000000),Z=(Min=100.0000000,Max=180.0000000))
		InitialParticlesPerSecond=4.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=50.0000000))
	end object
	Emitters[5]=SpriteEmitter8
	// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVShellImpact.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		UseDirectionAs=1
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ScaleSizeYByVelocity=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.7000000,Max=0.7000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.2000000,Max=0.2000000))
		FadeOutStartTime=0.5000000
		FadeInEndTime=0.1600000
		MaxParticles=13
		DetailMode=2
		AddLocationFromOtherEmitter=2
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
		StartSizeRange=(X=(Min=8.0000000,Max=10.0000000),Y=(Min=8.0000000,Max=10.0000000),Z=(Min=8.0000000,Max=10.0000000))
		ScaleSizeByVelocityMultiplier=(X=0.1500000,Y=0.2000000,Z=0.1500000)
		InitialParticlesPerSecond=1000.0000000
		DrawStyle=1
		Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=3.0000000)
		InitialDelayRange=(Min=0.2000000,Max=0.2000000)
		VelocityLossRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.8000000,Max=0.8000000))
		AddVelocityFromOtherEmitter=2
		AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
	end object
	Emitters[6]=SpriteEmitter10
	AutoDestroy=true
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVShellImpact.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-900.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.7000000),Y=(Min=0.3000000,Max=0.4000000),Z=(Min=0.1000000,Max=0.2500000))
	FadeOutStartTime=1.4400000
	MaxParticles=6
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=150.0000000,Max=200.0000000),Y=(Min=150.0000000,Max=200.0000000),Z=(Min=150.0000000,Max=200.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-600.0000000,Max=600.0000000),Y=(Min=-600.0000000,Max=600.0000000),Z=(Min=1000.0000000,Max=3000.0000000))
	VelocityLossRange=(X=(Min=2.5000000,Max=2.5000000),Y=(Min=2.5000000,Max=2.5000000),Z=(Min=2.5000000,Max=2.5000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVShellImpact.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.2500000,Max=0.2500000))
	FadeOutStartTime=1.4400000
	FadeInEndTime=0.1200000
	MaxParticles=4
	DetailMode=1
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=150.0000000)
	StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=0.0000000,Max=0.0000000))
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.2000000)
	StartSizeRange=(X=(Min=200.0000000,Max=250.0000000),Y=(Min=200.0000000,Max=250.0000000),Z=(Min=200.0000000,Max=250.0000000))
	InitialParticlesPerSecond=1000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke7c'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-500.0000000,Max=500.0000000),Y=(Min=-500.0000000,Max=500.0000000),Z=(Min=200.0000000,Max=800.0000000))
	VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVShellImpact.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	UseCollision=true
	RespawnDeadParticles=false
	SpinParticles=true
	DampRotation=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
	ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.2500000,Max=0.2500000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	MaxParticles=15
	DetailMode=2
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=20.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	RotationDampingFactorRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
	StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	SecondsBeforeInactive=0.0000000
	MinSquaredVelocity=3000.0000000
	StartVelocityRange=(X=(Min=-800.0000000,Max=800.0000000),Y=(Min=-800.0000000,Max=800.0000000),Z=(Min=500.0000000,Max=2000.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVShellImpact.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.6000000,Max=0.6000000))
	FadeOutStartTime=0.1170000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=50.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=4.0000000)
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVShellImpact.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.1500000,Max=0.1500000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.6900000
	FadeOutStartTime=0.1410000
	FadeInEndTime=0.0390000
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=250.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=250.0000000,Max=250.0000000),Y=(Min=250.0000000,Max=250.0000000),Z=(Min=250.0000000,Max=250.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	InitialDelayRange=(Min=0.1500000,Max=0.1500000)
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVShellImpact.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	UseDirectionAs=1
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.3000000,Max=0.3000000))
	FadeOutStartTime=0.3400000
	FadeInEndTime=0.3200000
	MaxParticles=12
	DetailMode=2
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=60.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=80.0000000,Max=100.0000000),Y=(Min=100.0000000,Max=180.0000000),Z=(Min=100.0000000,Max=180.0000000))
	InitialParticlesPerSecond=4.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=50.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVShellImpact.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	UseDirectionAs=1
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ScaleSizeYByVelocity=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.7000000,Max=0.7000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.2000000,Max=0.2000000))
	FadeOutStartTime=0.5000000
	FadeInEndTime=0.1600000
	MaxParticles=13
	DetailMode=2
	AddLocationFromOtherEmitter=2
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
	StartSizeRange=(X=(Min=8.0000000,Max=10.0000000),Y=(Min=8.0000000,Max=10.0000000),Z=(Min=8.0000000,Max=10.0000000))
	ScaleSizeByVelocityMultiplier=(X=0.1500000,Y=0.2000000,Z=0.1500000)
	InitialParticlesPerSecond=1000.0000000
	DrawStyle=1
	Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=3.0000000)
	InitialDelayRange=(Min=0.2000000,Max=0.2000000)
	VelocityLossRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.8000000,Max=0.8000000))
	AddVelocityFromOtherEmitter=2
	AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
end object
