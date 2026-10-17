class IE_AkeronBlast extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_OP_Pro.IE_AkeronBlast.SpriteEmitter23'
	begin object name="SpriteEmitter23" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.1380000
		CoordinateSystem=1
		MaxParticles=25
		StartLocationRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.1400000,RelativeSize=0.9000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.2500000)
		StartSizeRange=(X=(Min=15.0000000,Max=35.0000000),Y=(Min=15.0000000,Max=35.0000000),Z=(Min=15.0000000,Max=35.0000000))
		InitialParticlesPerSecond=1000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Explosions.Fire.Fireballs1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.4000000,Max=0.6000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=1600.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=-150.0000000,Max=150.0000000))
		VelocityLossRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		GetVelocityDirectionFrom=1
	end object
	Emitters[0]=SpriteEmitter23
	// Reference: SpriteEmitter'BWBP_OP_Pro.IE_AkeronBlast.SpriteEmitter24'
	begin object name="SpriteEmitter24" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
		Opacity=0.2800000
		FadeOutStartTime=1.7200000
		FadeInEndTime=0.6800000
		CoordinateSystem=1
		MaxParticles=35
		StartLocationRange=(X=(Min=-1.0000000,Max=-1.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		StartSizeRange=(X=(Min=30.0000000,Max=55.0000000),Y=(Min=30.0000000,Max=55.0000000),Z=(Min=30.0000000,Max=55.0000000))
		InitialParticlesPerSecond=1000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1g'
		StartVelocityRange=(X=(Min=50.0000000,Max=1000.0000000),Y=(Min=-260.0000000,Max=250.0000000),Z=(Min=-260.0000000,Max=250.0000000))
		VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
		GetVelocityDirectionFrom=1
	end object
	Emitters[1]=SpriteEmitter24
	// Reference: SpriteEmitter'BWBP_OP_Pro.IE_AkeronBlast.SpriteEmitter0'
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
		Opacity=0.6600000
		FadeOutStartTime=0.1740000
		FadeInEndTime=0.1200000
		CoordinateSystem=1
		StartLocationRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=35.0000000,Max=75.0000000),Y=(Min=35.0000000,Max=75.0000000),Z=(Min=35.0000000,Max=75.0000000))
		InitialParticlesPerSecond=100.0000000
		Texture=Texture'AW-2004Explosions.Fire.Fireball2'
		LifetimeRange=(Min=0.4000000,Max=0.6000000)
		StartVelocityRange=(X=(Min=1500.0000000,Max=2500.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
		VelocityLossRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		GetVelocityDirectionFrom=1
	end object
	Emitters[2]=SpriteEmitter0
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_OP_Pro.IE_AkeronBlast.SpriteEmitter23'
begin object name="SpriteEmitter23" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.1380000
	CoordinateSystem=1
	MaxParticles=25
	StartLocationRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.1400000,RelativeSize=0.9000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.2500000)
	StartSizeRange=(X=(Min=15.0000000,Max=35.0000000),Y=(Min=15.0000000,Max=35.0000000),Z=(Min=15.0000000,Max=35.0000000))
	InitialParticlesPerSecond=1000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Explosions.Fire.Fireballs1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.4000000,Max=0.6000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=1600.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=-150.0000000,Max=150.0000000))
	VelocityLossRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	GetVelocityDirectionFrom=1
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.IE_AkeronBlast.SpriteEmitter24'
begin object name="SpriteEmitter24" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
	Opacity=0.2800000
	FadeOutStartTime=1.7200000
	FadeInEndTime=0.6800000
	CoordinateSystem=1
	MaxParticles=35
	StartLocationRange=(X=(Min=-1.0000000,Max=-1.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	StartSizeRange=(X=(Min=30.0000000,Max=55.0000000),Y=(Min=30.0000000,Max=55.0000000),Z=(Min=30.0000000,Max=55.0000000))
	InitialParticlesPerSecond=1000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1g'
	StartVelocityRange=(X=(Min=50.0000000,Max=1000.0000000),Y=(Min=-260.0000000,Max=250.0000000),Z=(Min=-260.0000000,Max=250.0000000))
	VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
	GetVelocityDirectionFrom=1
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.IE_AkeronBlast.SpriteEmitter0'
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
	Opacity=0.6600000
	FadeOutStartTime=0.1740000
	FadeInEndTime=0.1200000
	CoordinateSystem=1
	StartLocationRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=35.0000000,Max=75.0000000),Y=(Min=35.0000000,Max=75.0000000),Z=(Min=35.0000000,Max=75.0000000))
	InitialParticlesPerSecond=100.0000000
	Texture=Texture'AW-2004Explosions.Fire.Fireball2'
	LifetimeRange=(Min=0.4000000,Max=0.6000000)
	StartVelocityRange=(X=(Min=1500.0000000,Max=2500.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
	VelocityLossRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	GetVelocityDirectionFrom=1
end object
