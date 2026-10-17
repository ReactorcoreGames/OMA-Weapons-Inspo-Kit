class IE_CryoExplosionLarge extends BallisticEmitter;

simulated event PreBeginPlay()
{
	// End:0x2D
	if(int(Level.DetailMode) < int(2))
	{
		Emitters[2].Disabled = true;
	}
	// End:0x59
	if(int(Level.DetailMode) < int(1))
	{
		Emitters[1].Disabled = true;
	}
	super(Actor).PreBeginPlay();
	//return;	
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	bDynamicLight = true;
	SetTimer(0.2000000, false);
	//return;	
}

simulated event Timer()
{
	super(Actor).Timer();
	bDynamicLight = false;
	//return;	
}

defaultproperties
{
	// Reference: SparkEmitter'BWBP_SKC_Pro.IE_CryoExplosionLarge.SparkEmitter2'
	begin object name="SparkEmitter2" class=Engine.SparkEmitter
		LineSegmentsRange=(Min=1.0000000,Max=2.0000000)
		TimeBeforeVisibleRange=(Min=0.0500000,Max=0.0500000)
		TimeBetweenSegmentsRange=(Min=0.1500000,Max=0.2500000)
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-40.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.9000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.3640000
		FadeInEndTime=0.0840000
		MaxParticles=50
		DetailMode=1
		InitialParticlesPerSecond=1000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=1.2000000)
		StartVelocityRange=(X=(Min=-300.0000000,Max=300.0000000),Y=(Min=-300.0000000,Max=300.0000000),Z=(Min=0.0000000,Max=500.0000000))
	end object
	Emitters[0]=SparkEmitter2
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_CryoExplosionLarge.SpriteEmitter104'
	begin object name="SpriteEmitter104" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=1.5000000
		FadeInEndTime=1.5000000
		MaxParticles=20
		StartLocationShape=1
		SphereRadiusRange=(Min=0.0000000,Max=75.0000000)
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		LifetimeRange=(Min=5.0000000,Max=6.0000000)
		StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=100.0000000,Max=400.0000000))
		VelocityLossRange=(X=(Min=1.9000000,Max=1.9000000),Y=(Min=1.9000000,Max=1.9000000),Z=(Min=1.9000000,Max=1.9000000))
	end object
	Emitters[1]=SpriteEmitter104
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_CryoExplosionLarge.SpriteEmitter105'
	begin object name="SpriteEmitter105" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
		DampingFactorRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=3.5600000
		FadeInEndTime=0.1600000
		MaxParticles=50
		StartLocationShape=1
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.FlamePartsAlpha'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=6.0000000,Max=6.0000000)
		StartVelocityRange=(X=(Min=-175.0000000,Max=175.0000000),Y=(Min=-175.0000000,Max=175.0000000),Z=(Min=25.0000000,Max=550.0000000))
	end object
	Emitters[2]=SpriteEmitter105
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_CryoExplosionLarge.SpriteEmitter106'
	begin object name="SpriteEmitter106" class=Engine.SpriteEmitter
		UseCollision=true
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		DampingFactorRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=100,G=150,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=150,B=255,A=255))
		FadeOutStartTime=0.7000000
		FadeInEndTime=0.1000000
		MaxParticles=50
		StartLocationShape=1
		SphereRadiusRange=(Min=10.0000000,Max=10.0000000)
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Specularity.BWSpecularity'
		LifetimeRange=(Min=3.0000000,Max=5.0000000)
		StartVelocityRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=150.0000000,Max=450.0000000))
	end object
	Emitters[3]=SpriteEmitter106
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_CryoExplosionLarge.SpriteEmitter107'
	begin object name="SpriteEmitter107" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=200,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=200,B=255,A=255))
		FadeOutStartTime=0.5600000
		FadeInEndTime=0.1500000
		MaxParticles=3
		StartLocationShape=1
		SphereRadiusRange=(Min=90.0000000,Max=150.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0700000,RelativeSize=3.0000000)
		SizeScale[1]=(RelativeTime=0.3400000,RelativeSize=4.0000000)
		SizeScale[2]=(RelativeTime=0.8100000,RelativeSize=5.0000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=90.0000000,Max=90.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1g'
		LifetimeRange=(Min=1.5000000,Max=2.5000000)
	end object
	Emitters[4]=SpriteEmitter107
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_CryoExplosionLarge.SpriteEmitter108'
	begin object name="SpriteEmitter108" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=200,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=200,B=255,A=255))
		FadeOutStartTime=0.0900000
		FadeInEndTime=0.0900000
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0700000,RelativeSize=3.0000000)
		SizeScale[1]=(RelativeTime=0.3400000,RelativeSize=4.0000000)
		SizeScale[2]=(RelativeTime=0.8100000,RelativeSize=5.0000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=175.0000000,Max=175.0000000),Y=(Min=175.0000000,Max=175.0000000),Z=(Min=175.0000000,Max=175.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=6
		Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[5]=SpriteEmitter108
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_CryoExplosionLarge.SpriteEmitter111'
	begin object name="SpriteEmitter111" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.0700000
		FadeInEndTime=0.0400000
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=900.0000000,Max=900.0000000),Y=(Min=900.0000000,Max=900.0000000),Z=(Min=900.0000000,Max=900.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
	end object
	Emitters[6]=SpriteEmitter111
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_CryoExplosionLarge.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.0060000
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=20.0000000)
		StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.GunFire.RailShock'
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
	end object
	Emitters[7]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_CryoExplosionLarge.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		UseCollision=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		ExtentMultiplier=(X=0.4000000,Y=0.4000000,Z=0.4000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=225,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.0321430,Color=(R=255,G=192,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.0642860,Color=(R=64,G=128,B=255,A=255))
		ColorScale[3]=(RelativeTime=0.1142860,Color=(R=128,G=128,B=255,A=255))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=255,A=255))
		Opacity=0.7000000
		FadeOutStartTime=10.0000000
		MaxParticles=35
		StartLocationShape=1
		SphereRadiusRange=(Min=10.0000000,Max=20.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		SizeScale[3]=(RelativeTime=0.3700000,RelativeSize=0.9000000)
		SizeScale[4]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=100.0000000,Max=120.0000000),Y=(Min=100.0000000,Max=120.0000000),Z=(Min=100.0000000,Max=120.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=10.0000000,Max=10.0000000)
		StartVelocityRadialRange=(Min=-500.0000000,Max=-300.0000000)
		VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=4.0000000,Max=4.0000000))
		GetVelocityDirectionFrom=3
	end object
	Emitters[8]=SpriteEmitter10
	AutoDestroy=true
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=32.0000000
	LightPeriod=3
	bDirectional=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SparkEmitter'BWBP_SKC_Pro.IE_CryoExplosionLarge.SparkEmitter2'
begin object name="SparkEmitter2" class=Engine.SparkEmitter
	LineSegmentsRange=(Min=1.0000000,Max=2.0000000)
	TimeBeforeVisibleRange=(Min=0.0500000,Max=0.0500000)
	TimeBetweenSegmentsRange=(Min=0.1500000,Max=0.2500000)
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-40.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.9000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.3640000
	FadeInEndTime=0.0840000
	MaxParticles=50
	DetailMode=1
	InitialParticlesPerSecond=1000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=1.2000000)
	StartVelocityRange=(X=(Min=-300.0000000,Max=300.0000000),Y=(Min=-300.0000000,Max=300.0000000),Z=(Min=0.0000000,Max=500.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_CryoExplosionLarge.SpriteEmitter104'
begin object name="SpriteEmitter104" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=1.5000000
	FadeInEndTime=1.5000000
	MaxParticles=20
	StartLocationShape=1
	SphereRadiusRange=(Min=0.0000000,Max=75.0000000)
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	LifetimeRange=(Min=5.0000000,Max=6.0000000)
	StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=100.0000000,Max=400.0000000))
	VelocityLossRange=(X=(Min=1.9000000,Max=1.9000000),Y=(Min=1.9000000,Max=1.9000000),Z=(Min=1.9000000,Max=1.9000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_CryoExplosionLarge.SpriteEmitter105'
begin object name="SpriteEmitter105" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
	DampingFactorRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=3.5600000
	FadeInEndTime=0.1600000
	MaxParticles=50
	StartLocationShape=1
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.FlamePartsAlpha'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=6.0000000,Max=6.0000000)
	StartVelocityRange=(X=(Min=-175.0000000,Max=175.0000000),Y=(Min=-175.0000000,Max=175.0000000),Z=(Min=25.0000000,Max=550.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_CryoExplosionLarge.SpriteEmitter106'
begin object name="SpriteEmitter106" class=Engine.SpriteEmitter
	UseCollision=true
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	DampingFactorRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=100,G=150,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=150,B=255,A=255))
	FadeOutStartTime=0.7000000
	FadeInEndTime=0.1000000
	MaxParticles=50
	StartLocationShape=1
	SphereRadiusRange=(Min=10.0000000,Max=10.0000000)
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Specularity.BWSpecularity'
	LifetimeRange=(Min=3.0000000,Max=5.0000000)
	StartVelocityRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=150.0000000,Max=450.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_CryoExplosionLarge.SpriteEmitter107'
begin object name="SpriteEmitter107" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=200,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=200,B=255,A=255))
	FadeOutStartTime=0.5600000
	FadeInEndTime=0.1500000
	MaxParticles=3
	StartLocationShape=1
	SphereRadiusRange=(Min=90.0000000,Max=150.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0700000,RelativeSize=3.0000000)
	SizeScale[1]=(RelativeTime=0.3400000,RelativeSize=4.0000000)
	SizeScale[2]=(RelativeTime=0.8100000,RelativeSize=5.0000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=90.0000000,Max=90.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1g'
	LifetimeRange=(Min=1.5000000,Max=2.5000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_CryoExplosionLarge.SpriteEmitter108'
begin object name="SpriteEmitter108" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=200,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=200,B=255,A=255))
	FadeOutStartTime=0.0900000
	FadeInEndTime=0.0900000
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0700000,RelativeSize=3.0000000)
	SizeScale[1]=(RelativeTime=0.3400000,RelativeSize=4.0000000)
	SizeScale[2]=(RelativeTime=0.8100000,RelativeSize=5.0000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=175.0000000,Max=175.0000000),Y=(Min=175.0000000,Max=175.0000000),Z=(Min=175.0000000,Max=175.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=6
	Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_CryoExplosionLarge.SpriteEmitter111'
begin object name="SpriteEmitter111" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.0700000
	FadeInEndTime=0.0400000
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=900.0000000,Max=900.0000000),Y=(Min=900.0000000,Max=900.0000000),Z=(Min=900.0000000,Max=900.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_CryoExplosionLarge.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.0060000
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=20.0000000)
	StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.GunFire.RailShock'
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_CryoExplosionLarge.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	UseCollision=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	ExtentMultiplier=(X=0.4000000,Y=0.4000000,Z=0.4000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=225,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.0321430,Color=(R=255,G=192,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.0642860,Color=(R=64,G=128,B=255,A=255))
	ColorScale[3]=(RelativeTime=0.1142860,Color=(R=128,G=128,B=255,A=255))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=255,A=255))
	Opacity=0.7000000
	FadeOutStartTime=10.0000000
	MaxParticles=35
	StartLocationShape=1
	SphereRadiusRange=(Min=10.0000000,Max=20.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	SizeScale[3]=(RelativeTime=0.3700000,RelativeSize=0.9000000)
	SizeScale[4]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=100.0000000,Max=120.0000000),Y=(Min=100.0000000,Max=120.0000000),Z=(Min=100.0000000,Max=120.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=10.0000000,Max=10.0000000)
	StartVelocityRadialRange=(Min=-500.0000000,Max=-300.0000000)
	VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=4.0000000,Max=4.0000000))
	GetVelocityDirectionFrom=3
end object
