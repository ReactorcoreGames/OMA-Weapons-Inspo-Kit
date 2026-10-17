class IE_RocketExplosion extends BallisticEmitter;

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
	// Reference: SpriteEmitter'BallisticProV55.IE_RocketExplosion.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseCollision=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		AlphaTest=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		ExtentMultiplier=(X=0.4000000,Y=0.4000000,Z=0.4000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=225,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.0321430,Color=(R=255,G=255,B=128,A=255))
		ColorScale[2]=(RelativeTime=0.0642860,Color=(R=255,G=128,B=64,A=255))
		ColorScale[3]=(RelativeTime=0.1214290,Color=(R=128,G=128,B=128,A=255))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=150,A=255))
		Opacity=0.6500000
		FadeOutStartTime=3.0000000
		FadeInEndTime=1.3000000
		MaxParticles=30
		StartLocationShape=1
		SphereRadiusRange=(Min=2.0000000,Max=5.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=0.1400000,RelativeSize=0.7000000)
		SizeScale[3]=(RelativeTime=0.3400000,RelativeSize=0.9000000)
		SizeScale[4]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=100.0000000,Max=140.0000000),Y=(Min=100.0000000,Max=140.0000000),Z=(Min=100.0000000,Max=140.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1g'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=5.0000000,Max=5.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-200.0000000,Max=800.0000000))
		StartVelocityRadialRange=(Min=-600.0000000,Max=-300.0000000)
		VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=5.0000000,Max=5.0000000))
		GetVelocityDirectionFrom=3
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.IE_RocketExplosion.SpriteEmitter17'
	begin object name="SpriteEmitter17" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		ScaleSizeYByVelocity=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=140,B=45,A=255))
		ColorScale[1]=(RelativeTime=0.2142860,Color=(R=160,G=160,B=160,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
		Opacity=0.6800000
		FadeOutStartTime=0.2000000
		MaxParticles=140
		StartLocationRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
		AddLocationFromOtherEmitter=2
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=40.0000000,Max=50.0000000),Y=(Min=40.0000000,Max=50.0000000),Z=(Min=40.0000000,Max=50.0000000))
		ScaleSizeByVelocityMultiplier=(X=1.0000000,Y=0.0030000,Z=1.0000000)
		InitialParticlesPerSecond=140.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
		AddVelocityFromOtherEmitter=2
		AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1500000),Y=(Min=0.1000000,Max=0.1500000),Z=(Min=0.1000000,Max=0.1500000))
	end object
	Emitters[1]=SpriteEmitter17
	// Reference: MeshEmitter'BallisticProV55.IE_RocketExplosion.MeshEmitter2'
	begin object name="MeshEmitter2" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip2'
		UseMeshBlendMode=false
		UseParticleColor=true
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
		ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.3700000
		MaxParticles=9
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=4.0000000),Z=(Min=0.0000000,Max=4.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=0.4000000,Max=0.9000000),Y=(Min=0.4000000,Max=0.9000000),Z=(Min=0.4000000,Max=0.9000000))
		InitialParticlesPerSecond=5000.0000000
		SecondsBeforeInactive=0.0000000
		MinSquaredVelocity=5000.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-700.0000000,Max=700.0000000),Y=(Min=-700.0000000,Max=700.0000000),Z=(Min=-100.0000000,Max=800.0000000))
	end object
	Emitters[2]=MeshEmitter2
	// Reference: SpriteEmitter'BallisticProV55.IE_RocketExplosion.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
		FadeOutStartTime=0.2000000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[3]=SpriteEmitter1
	// Reference: SpriteEmitter'BallisticProV55.IE_RocketExplosion.SpriteEmitter24'
	begin object name="SpriteEmitter24" class=Engine.SpriteEmitter
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
		ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.7600000,Max=0.7600000),Z=(Min=0.4000000,Max=0.4000000))
		Opacity=0.3200000
		FadeOutStartTime=0.0900000
		FadeInEndTime=0.0440000
		MaxParticles=8
		StartLocationRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-40.0000000,Max=40.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=2.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=4.0000000)
		StartSizeRange=(X=(Min=50.0000000,Max=80.0000000),Y=(Min=50.0000000,Max=80.0000000),Z=(Min=50.0000000,Max=80.0000000))
		InitialParticlesPerSecond=15.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[4]=SpriteEmitter24
	// Reference: SpriteEmitter'BallisticProV55.IE_RocketExplosion.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.1000000
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[5]=SpriteEmitter3
	// Reference: SpriteEmitter'BallisticProV55.IE_RocketExplosion.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseCollision=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ExtentMultiplier=(X=0.3000000,Y=0.3000000,Z=0.3000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.7000000,Max=0.7000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.7000000,Max=0.8000000),Z=(Min=0.1000000,Max=0.2000000))
		Opacity=0.6300000
		FadeOutStartTime=0.0500000
		MaxParticles=9
		AddLocationFromOtherEmitter=5
		AlphaRef=128
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=20.0000000,Max=30.0000000),Y=(Min=20.0000000,Max=30.0000000),Z=(Min=20.0000000,Max=30.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.0500000,Max=0.0500000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-100.0000000,Max=0.0000000))
		VelocityLossRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.4000000))
		AddVelocityFromOtherEmitter=5
	end object
	Emitters[6]=SpriteEmitter4
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
// Reference: SpriteEmitter'BallisticProV55.IE_RocketExplosion.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseCollision=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	AlphaTest=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	ExtentMultiplier=(X=0.4000000,Y=0.4000000,Z=0.4000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=225,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.0321430,Color=(R=255,G=255,B=128,A=255))
	ColorScale[2]=(RelativeTime=0.0642860,Color=(R=255,G=128,B=64,A=255))
	ColorScale[3]=(RelativeTime=0.1214290,Color=(R=128,G=128,B=128,A=255))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=150,A=255))
	Opacity=0.6500000
	FadeOutStartTime=3.0000000
	FadeInEndTime=1.3000000
	MaxParticles=30
	StartLocationShape=1
	SphereRadiusRange=(Min=2.0000000,Max=5.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=0.1400000,RelativeSize=0.7000000)
	SizeScale[3]=(RelativeTime=0.3400000,RelativeSize=0.9000000)
	SizeScale[4]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=100.0000000,Max=140.0000000),Y=(Min=100.0000000,Max=140.0000000),Z=(Min=100.0000000,Max=140.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1g'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=5.0000000,Max=5.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-200.0000000,Max=800.0000000))
	StartVelocityRadialRange=(Min=-600.0000000,Max=-300.0000000)
	VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=5.0000000,Max=5.0000000))
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RocketExplosion.SpriteEmitter17'
begin object name="SpriteEmitter17" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	ScaleSizeYByVelocity=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=140,B=45,A=255))
	ColorScale[1]=(RelativeTime=0.2142860,Color=(R=160,G=160,B=160,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
	Opacity=0.6800000
	FadeOutStartTime=0.2000000
	MaxParticles=140
	StartLocationRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
	AddLocationFromOtherEmitter=2
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=40.0000000,Max=50.0000000),Y=(Min=40.0000000,Max=50.0000000),Z=(Min=40.0000000,Max=50.0000000))
	ScaleSizeByVelocityMultiplier=(X=1.0000000,Y=0.0030000,Z=1.0000000)
	InitialParticlesPerSecond=140.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
	AddVelocityFromOtherEmitter=2
	AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1500000),Y=(Min=0.1000000,Max=0.1500000),Z=(Min=0.1000000,Max=0.1500000))
end object
// Reference: MeshEmitter'BallisticProV55.IE_RocketExplosion.MeshEmitter2'
begin object name="MeshEmitter2" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip2'
	UseMeshBlendMode=false
	UseParticleColor=true
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
	ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.3700000
	MaxParticles=9
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=4.0000000),Z=(Min=0.0000000,Max=4.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=0.4000000,Max=0.9000000),Y=(Min=0.4000000,Max=0.9000000),Z=(Min=0.4000000,Max=0.9000000))
	InitialParticlesPerSecond=5000.0000000
	SecondsBeforeInactive=0.0000000
	MinSquaredVelocity=5000.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-700.0000000,Max=700.0000000),Y=(Min=-700.0000000,Max=700.0000000),Z=(Min=-100.0000000,Max=800.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RocketExplosion.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
	FadeOutStartTime=0.2000000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RocketExplosion.SpriteEmitter24'
begin object name="SpriteEmitter24" class=Engine.SpriteEmitter
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
	ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.7600000,Max=0.7600000),Z=(Min=0.4000000,Max=0.4000000))
	Opacity=0.3200000
	FadeOutStartTime=0.0900000
	FadeInEndTime=0.0440000
	MaxParticles=8
	StartLocationRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-40.0000000,Max=40.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=2.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=4.0000000)
	StartSizeRange=(X=(Min=50.0000000,Max=80.0000000),Y=(Min=50.0000000,Max=80.0000000),Z=(Min=50.0000000,Max=80.0000000))
	InitialParticlesPerSecond=15.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RocketExplosion.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.1000000
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RocketExplosion.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseCollision=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ExtentMultiplier=(X=0.3000000,Y=0.3000000,Z=0.3000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.7000000,Max=0.7000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.7000000,Max=0.8000000),Z=(Min=0.1000000,Max=0.2000000))
	Opacity=0.6300000
	FadeOutStartTime=0.0500000
	MaxParticles=9
	AddLocationFromOtherEmitter=5
	AlphaRef=128
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=20.0000000,Max=30.0000000),Y=(Min=20.0000000,Max=30.0000000),Z=(Min=20.0000000,Max=30.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.0500000,Max=0.0500000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-100.0000000,Max=0.0000000))
	VelocityLossRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.4000000))
	AddVelocityFromOtherEmitter=5
end object
