class IE_LandMineExplosion extends BallisticEmitter;

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
	// Reference: SpriteEmitter'BallisticProV55.IE_LandMineExplosion.SpriteEmitter15'
	begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.2500000,Max=0.3500000),Z=(Min=0.2000000,Max=0.2000000))
		FadeOutStartTime=1.4700000
		MaxParticles=20
		DetailMode=2
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=5.0000000)
		SphereRadiusRange=(Min=-40.0000000,Max=-40.0000000)
		StartLocationPolarRange=(X=(Min=-80.0000000,Max=80.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=0.0000000,Max=0.0000000))
		AlphaRef=128
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.2000000)
		StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=80.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-400.0000000,Max=400.0000000),Y=(Min=-400.0000000,Max=400.0000000),Z=(Min=100.0000000,Max=300.0000000))
		StartVelocityRadialRange=(Min=-300.0000000,Max=-300.0000000)
		VelocityLossRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=4.0000000,Max=4.0000000),Z=(Min=4.0000000,Max=4.0000000))
	end object
	Emitters[0]=SpriteEmitter15
	// Reference: SpriteEmitter'BallisticProV55.IE_LandMineExplosion.SpriteEmitter14'
	begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.3000000,Max=0.3000000))
		Opacity=0.8500000
		FadeOutStartTime=0.8100000
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.2000000)
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-600.0000000,Max=600.0000000),Y=(Min=-600.0000000,Max=600.0000000),Z=(Min=500.0000000,Max=500.0000000))
		VelocityLossRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=4.0000000,Max=4.0000000),Z=(Min=4.0000000,Max=4.0000000))
	end object
	Emitters[1]=SpriteEmitter14
	// Reference: SpriteEmitter'BallisticProV55.IE_LandMineExplosion.SpriteEmitter11'
	begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
		UseDirectionAs=4
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.5900000
		FadeOutStartTime=0.0210000
		MaxParticles=1
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=2.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[2]=SpriteEmitter11
	// Reference: MeshEmitter'BallisticProV55.IE_LandMineExplosion.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip2'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.6000000
		MaxParticles=15
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=10.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=2.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		InitialParticlesPerSecond=50000.0000000
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=600.0000000))
	end object
	Emitters[3]=MeshEmitter1
	// Reference: SpriteEmitter'BallisticProV55.IE_LandMineExplosion.SpriteEmitter12'
	begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.4000000))
		FadeOutStartTime=0.0760000
		FadeInEndTime=0.0260000
		MaxParticles=200
		DetailMode=2
		AddLocationFromOtherEmitter=3
		StartSizeRange=(X=(Min=5.0000000,Max=15.0000000),Y=(Min=5.0000000,Max=15.0000000),Z=(Min=5.0000000,Max=15.0000000))
		InitialParticlesPerSecond=100.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.2000000)
		AddVelocityFromOtherEmitter=3
	end object
	Emitters[4]=SpriteEmitter12
	// Reference: SpriteEmitter'BallisticProV55.IE_LandMineExplosion.SpriteEmitter13'
	begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1250000,Color=(R=255,G=128,B=64,A=255))
		ColorScale[2]=(RelativeTime=0.2750000,Color=(R=150,G=140,B=120,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=120,G=110,B=100,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
		Opacity=0.5000000
		FadeOutStartTime=0.4640000
		MaxParticles=500
		AddLocationFromOtherEmitter=3
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
		InitialParticlesPerSecond=250.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
		AddVelocityFromOtherEmitter=3
		AddVelocityMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
	end object
	Emitters[5]=SpriteEmitter13
	// Reference: MeshEmitter'BallisticProV55.IE_LandMineExplosion.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.VBlast'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.1600000
		MaxParticles=6
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=2.0000000,Max=8.0000000))
		InitialParticlesPerSecond=50000.0000000
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[6]=MeshEmitter0
	// Reference: SparkEmitter'BallisticProV55.IE_LandMineExplosion.SparkEmitter0'
	begin object name="SparkEmitter0" class=Engine.SparkEmitter
		LineSegmentsRange=(Min=1.0000000,Max=2.0000000)
		TimeBetweenSegmentsRange=(Min=0.0500000,Max=0.2000000)
		FadeOut=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.8000000),Z=(Min=0.2500000,Max=0.2500000))
		FadeOutStartTime=0.4300000
		MaxParticles=80
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=0.0000000,Max=500.0000000))
	end object
	Emitters[7]=SparkEmitter0
	AutoDestroy=true
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=32.0000000
	LightPeriod=3
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.IE_LandMineExplosion.SpriteEmitter15'
begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.2500000,Max=0.3500000),Z=(Min=0.2000000,Max=0.2000000))
	FadeOutStartTime=1.4700000
	MaxParticles=20
	DetailMode=2
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	SphereRadiusRange=(Min=-40.0000000,Max=-40.0000000)
	StartLocationPolarRange=(X=(Min=-80.0000000,Max=80.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=0.0000000,Max=0.0000000))
	AlphaRef=128
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.2000000)
	StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=80.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-400.0000000,Max=400.0000000),Y=(Min=-400.0000000,Max=400.0000000),Z=(Min=100.0000000,Max=300.0000000))
	StartVelocityRadialRange=(Min=-300.0000000,Max=-300.0000000)
	VelocityLossRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=4.0000000,Max=4.0000000),Z=(Min=4.0000000,Max=4.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_LandMineExplosion.SpriteEmitter14'
begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.3000000,Max=0.3000000))
	Opacity=0.8500000
	FadeOutStartTime=0.8100000
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.2000000)
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-600.0000000,Max=600.0000000),Y=(Min=-600.0000000,Max=600.0000000),Z=(Min=500.0000000,Max=500.0000000))
	VelocityLossRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=4.0000000,Max=4.0000000),Z=(Min=4.0000000,Max=4.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_LandMineExplosion.SpriteEmitter11'
begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
	UseDirectionAs=4
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.5900000
	FadeOutStartTime=0.0210000
	MaxParticles=1
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=2.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
// Reference: MeshEmitter'BallisticProV55.IE_LandMineExplosion.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip2'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.6000000
	MaxParticles=15
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=2.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	InitialParticlesPerSecond=50000.0000000
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=600.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_LandMineExplosion.SpriteEmitter12'
begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.4000000))
	FadeOutStartTime=0.0760000
	FadeInEndTime=0.0260000
	MaxParticles=200
	DetailMode=2
	AddLocationFromOtherEmitter=3
	StartSizeRange=(X=(Min=5.0000000,Max=15.0000000),Y=(Min=5.0000000,Max=15.0000000),Z=(Min=5.0000000,Max=15.0000000))
	InitialParticlesPerSecond=100.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.2000000)
	AddVelocityFromOtherEmitter=3
end object
// Reference: SpriteEmitter'BallisticProV55.IE_LandMineExplosion.SpriteEmitter13'
begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1250000,Color=(R=255,G=128,B=64,A=255))
	ColorScale[2]=(RelativeTime=0.2750000,Color=(R=150,G=140,B=120,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=120,G=110,B=100,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
	Opacity=0.5000000
	FadeOutStartTime=0.4640000
	MaxParticles=500
	AddLocationFromOtherEmitter=3
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
	InitialParticlesPerSecond=250.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
	AddVelocityFromOtherEmitter=3
	AddVelocityMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
end object
// Reference: MeshEmitter'BallisticProV55.IE_LandMineExplosion.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.VBlast'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.1600000
	MaxParticles=6
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=2.0000000,Max=8.0000000))
	InitialParticlesPerSecond=50000.0000000
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SparkEmitter'BallisticProV55.IE_LandMineExplosion.SparkEmitter0'
begin object name="SparkEmitter0" class=Engine.SparkEmitter
	LineSegmentsRange=(Min=1.0000000,Max=2.0000000)
	TimeBetweenSegmentsRange=(Min=0.0500000,Max=0.2000000)
	FadeOut=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.8000000),Z=(Min=0.2500000,Max=0.2500000))
	FadeOutStartTime=0.4300000
	MaxParticles=80
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=0.0000000,Max=500.0000000))
end object
