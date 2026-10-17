class IE_WillyPete extends DGVEmitterOversize;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	bDynamicLight = true;
	SetTimer(0.2000000, false);
	//return;	
}

simulated event Timer()
{
	super.Timer();
	bDynamicLight = false;
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_WillyPete.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=1.2000000
		FadeInEndTime=0.6800000
		MaxParticles=15
		DetailMode=1
		StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=150.0000000,Max=150.0000000))
		InitialParticlesPerSecond=20000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke5'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=7.0000000,Max=7.0000000)
		StartVelocityRange=(X=(Min=-125.0000000,Max=125.0000000),Y=(Min=-125.0000000,Max=125.0000000),Z=(Min=200.0000000,Max=500.0000000))
		VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=2.0000000,Max=3.0000000))
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_WillyPete.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
		ExtentMultiplier=(X=0.7000000,Y=0.7000000,Z=0.7000000)
		DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.6000000,Max=0.8000000),Z=(Min=0.4000000,Max=0.6000000))
		FadeOutStartTime=1.0000000
		MaxParticles=75
		DetailMode=2
		StartLocationShape=1
		SphereRadiusRange=(Min=10.0000000,Max=20.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=5.0000000,Max=8.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=1000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.FlamePartsAlpha'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		SubdivisionEnd=15
		SecondsBeforeInactive=0.0000000
		StartVelocityRadialRange=(Min=-500.0000000,Max=-800.0000000)
		VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=4.0000000,Max=4.0000000))
		GetVelocityDirectionFrom=3
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_WillyPete.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-450.0000000)
		DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.7500000),Z=(Min=0.2500000,Max=0.5500000))
		FadeOutStartTime=2.2800000
		FadeInEndTime=0.0900000
		MaxParticles=50
		AlphaRef=200
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=12.0000000,Max=12.0000000),Y=(Min=12.0000000,Max=12.0000000),Z=(Min=12.0000000,Max=12.0000000))
		InitialParticlesPerSecond=9999.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.5000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-650.0000000,Max=650.0000000),Y=(Min=-650.0000000,Max=650.0000000),Z=(Min=-100.0000000,Max=400.0000000))
		VelocityLossRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[2]=SpriteEmitter2
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_WillyPete.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.6000000))
		MaxParticles=1
		DetailMode=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7000000,Max=0.7000000)
	end object
	Emitters[3]=SpriteEmitter3
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_WillyPete.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseDirectionAs=4
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.6000000))
		MaxParticles=1
		DetailMode=2
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7000000,Max=0.7000000)
	end object
	Emitters[4]=SpriteEmitter4
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_WillyPete.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=128,A=0))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.5000000))
		FadeOutStartTime=0.2000000
		MaxParticles=1
		AlphaRef=128
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.1000000)
		StartSizeRange=(X=(Min=200.0000000,Max=300.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=20.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
		StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[5]=SpriteEmitter5
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_WillyPete.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		UseDirectionAs=1
		ProjectionNormal=(X=0.0000000,Y=-2.0000000,Z=1.0000000)
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
		FadeOutStartTime=0.2300000
		FadeInEndTime=0.0500000
		MaxParticles=3
		UseRotationFrom=3
		RotationOffset=(Pitch=63532,Yaw=63532,Roll=0)
		StartSpinRange=(X=(Min=-0.2000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		RotationNormal=(X=0.0000000,Y=0.0000000,Z=50.0000000)
		SizeScale[0]=(RelativeTime=0.1400000,RelativeSize=3.0000000)
		SizeScale[1]=(RelativeTime=0.5500000,RelativeSize=4.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=4.5000000)
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Dirt.BlastSpray2a'
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
		StartVelocityRange=(X=(Min=1.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[6]=SpriteEmitter6
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_WillyPete.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
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
		Opacity=0.6000000
		FadeOutStartTime=5.3200000
		FadeInEndTime=0.5600000
		MaxParticles=5
		StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=0.0000000,Max=150.0000000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.1700000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=3.4000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=3.5000000)
		SizeScale[3]=(RelativeTime=0.3100000,RelativeSize=3.2000000)
		SizeScale[4]=(RelativeTime=0.2500000,RelativeSize=2.7000000)
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
		LifetimeRange=(Min=6.0000000,Max=7.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=20.0000000,Max=20.0000000))
	end object
	Emitters[7]=SpriteEmitter7
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_WillyPete.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.6000000
		FadeOutStartTime=0.1000000
		MaxParticles=2
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'ONSBPTextures.fX.ExploTrans'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.9000000,Max=0.9000000)
	end object
	Emitters[8]=SpriteEmitter8
	AutoDestroy=true
	LightType=7
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=32.0000000
	LightPeriod=3
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_WillyPete.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=1.2000000
	FadeInEndTime=0.6800000
	MaxParticles=15
	DetailMode=1
	StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=150.0000000,Max=150.0000000))
	InitialParticlesPerSecond=20000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke5'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=7.0000000,Max=7.0000000)
	StartVelocityRange=(X=(Min=-125.0000000,Max=125.0000000),Y=(Min=-125.0000000,Max=125.0000000),Z=(Min=200.0000000,Max=500.0000000))
	VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=2.0000000,Max=3.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_WillyPete.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
	ExtentMultiplier=(X=0.7000000,Y=0.7000000,Z=0.7000000)
	DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.6000000,Max=0.8000000),Z=(Min=0.4000000,Max=0.6000000))
	FadeOutStartTime=1.0000000
	MaxParticles=75
	DetailMode=2
	StartLocationShape=1
	SphereRadiusRange=(Min=10.0000000,Max=20.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=5.0000000,Max=8.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=1000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.FlamePartsAlpha'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	SubdivisionEnd=15
	SecondsBeforeInactive=0.0000000
	StartVelocityRadialRange=(Min=-500.0000000,Max=-800.0000000)
	VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=4.0000000,Max=4.0000000))
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_WillyPete.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-450.0000000)
	DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.7500000),Z=(Min=0.2500000,Max=0.5500000))
	FadeOutStartTime=2.2800000
	FadeInEndTime=0.0900000
	MaxParticles=50
	AlphaRef=200
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=12.0000000,Max=12.0000000),Y=(Min=12.0000000,Max=12.0000000),Z=(Min=12.0000000,Max=12.0000000))
	InitialParticlesPerSecond=9999.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.5000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-650.0000000,Max=650.0000000),Y=(Min=-650.0000000,Max=650.0000000),Z=(Min=-100.0000000,Max=400.0000000))
	VelocityLossRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_WillyPete.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.6000000))
	MaxParticles=1
	DetailMode=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7000000,Max=0.7000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_WillyPete.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseDirectionAs=4
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.6000000))
	MaxParticles=1
	DetailMode=2
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7000000,Max=0.7000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_WillyPete.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=128,A=0))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.5000000))
	FadeOutStartTime=0.2000000
	MaxParticles=1
	AlphaRef=128
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.1000000)
	StartSizeRange=(X=(Min=200.0000000,Max=300.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=20.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
	StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_WillyPete.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	UseDirectionAs=1
	ProjectionNormal=(X=0.0000000,Y=-2.0000000,Z=1.0000000)
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
	FadeOutStartTime=0.2300000
	FadeInEndTime=0.0500000
	MaxParticles=3
	UseRotationFrom=3
	RotationOffset=(Pitch=63532,Yaw=63532,Roll=0)
	StartSpinRange=(X=(Min=-0.2000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	RotationNormal=(X=0.0000000,Y=0.0000000,Z=50.0000000)
	SizeScale[0]=(RelativeTime=0.1400000,RelativeSize=3.0000000)
	SizeScale[1]=(RelativeTime=0.5500000,RelativeSize=4.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=4.5000000)
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Dirt.BlastSpray2a'
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
	StartVelocityRange=(X=(Min=1.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_WillyPete.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
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
	Opacity=0.6000000
	FadeOutStartTime=5.3200000
	FadeInEndTime=0.5600000
	MaxParticles=5
	StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=0.0000000,Max=150.0000000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.1700000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=3.4000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=3.5000000)
	SizeScale[3]=(RelativeTime=0.3100000,RelativeSize=3.2000000)
	SizeScale[4]=(RelativeTime=0.2500000,RelativeSize=2.7000000)
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
	LifetimeRange=(Min=6.0000000,Max=7.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=20.0000000,Max=20.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_WillyPete.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.6000000
	FadeOutStartTime=0.1000000
	MaxParticles=2
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'ONSBPTextures.fX.ExploTrans'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	LifetimeRange=(Min=0.9000000,Max=0.9000000)
end object
