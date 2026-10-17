class IE_Z250GasExplode extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_OP_Pro.IE_Z250GasExplode.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=177,G=232,B=151,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=128,B=128,A=255))
		Opacity=0.4700000
		FadeOutStartTime=0.3910000
		MaxParticles=30
		StartLocationShape=1
		SphereRadiusRange=(Min=1.0000000,Max=5.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=4.0000000,Max=20.0000000),Y=(Min=2.0000000,Max=10.0000000),Z=(Min=2.0000000,Max=10.0000000))
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaBubbleA1'
		LifetimeRange=(Min=1.0000000,Max=1.7000000)
		StartVelocityRadialRange=(Min=15.0000000,Max=250.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: SpriteEmitter'BWBP_OP_Pro.IE_Z250GasExplode.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-250.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.8000000,Max=0.8000000))
		Opacity=0.6300000
		FadeOutStartTime=0.0750000
		FadeInEndTime=0.0450000
		MaxParticles=20
		StartLocationShape=1
		SphereRadiusRange=(Min=1.0000000,Max=5.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=35.0000000),Y=(Min=15.0000000,Max=35.0000000),Z=(Min=15.0000000,Max=35.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke5'
		LifetimeRange=(Min=1.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-900.0000000,Max=900.0000000),Y=(Min=-900.0000000,Max=900.0000000),Z=(Min=0.0000000,Max=1300.0000000))
		VelocityLossRange=(X=(Min=0.0000000,Max=6.0000000),Y=(Min=0.0000000,Max=6.0000000),Z=(Min=0.0000000,Max=6.0000000))
		GetVelocityDirectionFrom=1
	end object
	Emitters[1]=SpriteEmitter3
	// Reference: SpriteEmitter'BWBP_OP_Pro.IE_Z250GasExplode.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.7000000,Max=0.7000000))
		Opacity=0.4000000
		FadeOutStartTime=0.1400000
		FadeInEndTime=0.0450000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		LifetimeRange=(Min=0.9000000,Max=0.9000000)
	end object
	Emitters[2]=SpriteEmitter5
	// Reference: SpriteEmitter'BWBP_OP_Pro.IE_Z250GasExplode.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.7000000,Max=0.7000000))
		Opacity=0.4000000
		FadeOutStartTime=0.1400000
		FadeInEndTime=0.0450000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
		LifetimeRange=(Min=0.9000000,Max=0.9000000)
	end object
	Emitters[3]=SpriteEmitter0
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_OP_Pro.IE_Z250GasExplode.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=177,G=232,B=151,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=128,B=128,A=255))
	Opacity=0.4700000
	FadeOutStartTime=0.3910000
	MaxParticles=30
	StartLocationShape=1
	SphereRadiusRange=(Min=1.0000000,Max=5.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=4.0000000,Max=20.0000000),Y=(Min=2.0000000,Max=10.0000000),Z=(Min=2.0000000,Max=10.0000000))
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaBubbleA1'
	LifetimeRange=(Min=1.0000000,Max=1.7000000)
	StartVelocityRadialRange=(Min=15.0000000,Max=250.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.IE_Z250GasExplode.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-250.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.8000000,Max=0.8000000))
	Opacity=0.6300000
	FadeOutStartTime=0.0750000
	FadeInEndTime=0.0450000
	MaxParticles=20
	StartLocationShape=1
	SphereRadiusRange=(Min=1.0000000,Max=5.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=35.0000000),Y=(Min=15.0000000,Max=35.0000000),Z=(Min=15.0000000,Max=35.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke5'
	LifetimeRange=(Min=1.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-900.0000000,Max=900.0000000),Y=(Min=-900.0000000,Max=900.0000000),Z=(Min=0.0000000,Max=1300.0000000))
	VelocityLossRange=(X=(Min=0.0000000,Max=6.0000000),Y=(Min=0.0000000,Max=6.0000000),Z=(Min=0.0000000,Max=6.0000000))
	GetVelocityDirectionFrom=1
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.IE_Z250GasExplode.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.7000000,Max=0.7000000))
	Opacity=0.4000000
	FadeOutStartTime=0.1400000
	FadeInEndTime=0.0450000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	LifetimeRange=(Min=0.9000000,Max=0.9000000)
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.IE_Z250GasExplode.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.7000000,Max=0.7000000))
	Opacity=0.4000000
	FadeOutStartTime=0.1400000
	FadeInEndTime=0.0450000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
	LifetimeRange=(Min=0.9000000,Max=0.9000000)
end object
