class ONSTankHitRockEffect extends Emitter;

simulated function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	// End:0xD3
	if(((Level.bDropDetail || int(Level.DetailMode) == int(0)) || (int(Level.DetailMode) < int(2)) && Instigator != Level.GetLocalPlayerController().Pawn) || VSize(Level.GetLocalPlayerController().ViewTarget.Location - Location) > float(6000))
	{
		Emitters[0].UseCollision = false;
		Emitters[0].FadeOutStartTime = 3.0000000;
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'Onslaught.ONSTankHitRockEffect.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseCollision=true
		UseMaxCollisions=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		MaxCollisions=(Min=6.0000000,Max=6.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=3.5000000
		MaxParticles=20
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=30.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=1000.0000000
		DrawStyle=1
		Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=4.0000000,Max=6.0000000)
		StartVelocityRange=(X=(Min=-1000.0000000,Max=1000.0000000),Y=(Min=-1000.0000000,Max=1000.0000000),Z=(Min=200.0000000,Max=1800.0000000))
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: SpriteEmitter'Onslaught.ONSTankHitRockEffect.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseDirectionAs=1
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ScaleSizeYByVelocity=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.1000000
		FadeInEndTime=0.1000000
		MaxParticles=80
		DetailMode=1
		AddLocationFromOtherEmitter=0
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=12.0000000)
		StartSizeRange=(X=(Min=4.0000000,Max=8.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ScaleSizeByVelocityMultiplier=(X=0.1500000,Y=0.1500000,Z=0.1500000)
		InitialParticlesPerSecond=150.0000000
		DrawStyle=5
		Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
		LifetimeRange=(Min=3.0000000,Max=1.0000000)
		InitialDelayRange=(Min=0.2500000,Max=0.2500000)
		VelocityLossRange=(X=(Min=0.9000000,Max=0.9000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.9000000,Max=0.9000000))
		AddVelocityFromOtherEmitter=0
		AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
	end object
	Emitters[1]=SpriteEmitter2
	// Reference: SpriteEmitter'Onslaught.ONSTankHitRockEffect.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
		FadeOutStartTime=3.5000000
		MaxParticles=75
		DetailMode=1
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=2.0000000,Max=25.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=1000.0000000
		DrawStyle=1
		Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		StartVelocityRange=(X=(Min=-400.0000000,Max=400.0000000),Y=(Min=-400.0000000,Max=400.0000000),Z=(Min=100.0000000,Max=1600.0000000))
	end object
	Emitters[2]=SpriteEmitter0
	// Reference: SpriteEmitter'Onslaught.ONSTankHitRockEffect.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=205,G=180,B=155,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=205,G=180,B=155,A=255))
		FadeOutStartTime=1.0000000
		FadeInEndTime=0.1000000
		CoordinateSystem=1
		MaxParticles=4
		StartLocationRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartLocationShape=2
		StartLocationPolarRange=(X=(Min=-128.0000000,Max=128.0000000),Y=(Min=-128.0000000,Max=128.0000000),Z=(Min=0.0000000,Max=0.0000000))
		AlphaRef=4
		SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
		StartSizeRange=(X=(Min=50.0000000,Max=100.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=1000.0000000
		DrawStyle=1
		Texture=Texture'BenTex01.Textures.SmokePuff01'
		LifetimeRange=(Min=1.5000000,Max=4.0000000)
		InitialDelayRange=(Min=0.0000000,Max=0.1000000)
		StartVelocityRange=(X=(Min=-600.0000000,Max=600.0000000),Y=(Min=-600.0000000,Max=600.0000000),Z=(Min=0.0000000,Max=50.0000000))
		StartVelocityRadialRange=(Min=100.0000000,Max=200.0000000)
		VelocityLossRange=(X=(Min=1.0000000,Max=3.0000000),Y=(Min=1.0000000,Max=3.0000000),Z=(Min=0.0000000,Max=0.0000000))
		RotateVelocityLossRange=true
		GetVelocityDirectionFrom=3
	end object
	Emitters[3]=SpriteEmitter3
	// Reference: SpriteEmitter'Onslaught.ONSTankHitRockEffect.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=205,G=180,B=155,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=205,G=180,B=155,A=255))
		FadeOutStartTime=1.0000000
		FadeInEndTime=0.1000000
		CoordinateSystem=1
		MaxParticles=5
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-32.0000000,Max=128.0000000))
		AlphaRef=4
		SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=12.0000000)
		StartSizeRange=(X=(Min=30.0000000,Max=60.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		Texture=Texture'BenTex01.Textures.SmokePuff01'
		LifetimeRange=(Min=1.5000000,Max=4.0000000)
		StartVelocityRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=50.0000000,Max=1400.0000000))
		VelocityLossRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
		RotateVelocityLossRange=true
	end object
	Emitters[4]=SpriteEmitter5
	// Reference: SpriteEmitter'Onslaught.ONSTankHitRockEffect.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=238,B=213,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=224,B=193,A=0))
		FadeOutStartTime=0.1000000
		CoordinateSystem=1
		MaxParticles=3
		StartLocationRange=(X=(Min=-64.0000000,Max=64.0000000),Y=(Min=-64.0000000,Max=64.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=75.0000000,Max=150.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=1000.0000000
		Texture=Texture'AW-2004Explosions.Fire.Part_explode2'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.2500000,Max=0.5000000)
	end object
	Emitters[5]=SpriteEmitter10
	// Reference: SpriteEmitter'Onslaught.ONSTankHitRockEffect.SpriteEmitter265'
	begin object name="SpriteEmitter265" class=Engine.SpriteEmitter
		UseDirectionAs=2
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UniformSize=true
		ScaleSizeXByVelocity=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=236,B=179,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=167,G=97,B=20,A=0))
		FadeOutStartTime=0.5000000
		FadeInEndTime=0.1000000
		MaxParticles=20
		DetailMode=2
		UseRotationFrom=1
		StartSizeRange=(X=(Min=4.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ScaleSizeByVelocityMultiplier=(X=0.0060000,Y=1.0000000,Z=1.0000000)
		InitialParticlesPerSecond=1000.0000000
		Texture=Texture'AW-2004Particles.Weapons.HardSpot'
		LifetimeRange=(Min=0.7500000,Max=1.2500000)
		StartVelocityRange=(X=(Min=-1200.0000000,Max=1200.0000000),Y=(Min=-1200.0000000,Max=1200.0000000),Z=(Min=400.0000000,Max=1400.0000000))
	end object
	Emitters[6]=SpriteEmitter265
	AutoDestroy=true
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSTankHitRockEffect.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseDirectionAs=1
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ScaleSizeYByVelocity=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.1000000
	FadeInEndTime=0.1000000
	MaxParticles=80
	DetailMode=1
	AddLocationFromOtherEmitter=0
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=12.0000000)
	StartSizeRange=(X=(Min=4.0000000,Max=8.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ScaleSizeByVelocityMultiplier=(X=0.1500000,Y=0.1500000,Z=0.1500000)
	InitialParticlesPerSecond=150.0000000
	DrawStyle=5
	Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
	LifetimeRange=(Min=3.0000000,Max=1.0000000)
	InitialDelayRange=(Min=0.2500000,Max=0.2500000)
	VelocityLossRange=(X=(Min=0.9000000,Max=0.9000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.9000000,Max=0.9000000))
	AddVelocityFromOtherEmitter=0
	AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSTankHitRockEffect.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
	FadeOutStartTime=3.5000000
	MaxParticles=75
	DetailMode=1
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=2.0000000,Max=25.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=1000.0000000
	DrawStyle=1
	Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	StartVelocityRange=(X=(Min=-400.0000000,Max=400.0000000),Y=(Min=-400.0000000,Max=400.0000000),Z=(Min=100.0000000,Max=1600.0000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSTankHitRockEffect.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseCollision=true
	UseMaxCollisions=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	MaxCollisions=(Min=6.0000000,Max=6.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=3.5000000
	MaxParticles=20
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=30.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=1000.0000000
	DrawStyle=1
	Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=4.0000000,Max=6.0000000)
	StartVelocityRange=(X=(Min=-1000.0000000,Max=1000.0000000),Y=(Min=-1000.0000000,Max=1000.0000000),Z=(Min=200.0000000,Max=1800.0000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSTankHitRockEffect.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=205,G=180,B=155,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=205,G=180,B=155,A=255))
	FadeOutStartTime=1.0000000
	FadeInEndTime=0.1000000
	CoordinateSystem=1
	MaxParticles=4
	StartLocationRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartLocationShape=2
	StartLocationPolarRange=(X=(Min=-128.0000000,Max=128.0000000),Y=(Min=-128.0000000,Max=128.0000000),Z=(Min=0.0000000,Max=0.0000000))
	AlphaRef=4
	SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
	StartSizeRange=(X=(Min=50.0000000,Max=100.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=1000.0000000
	DrawStyle=1
	Texture=Texture'BenTex01.Textures.SmokePuff01'
	LifetimeRange=(Min=1.5000000,Max=4.0000000)
	InitialDelayRange=(Min=0.0000000,Max=0.1000000)
	StartVelocityRange=(X=(Min=-600.0000000,Max=600.0000000),Y=(Min=-600.0000000,Max=600.0000000),Z=(Min=0.0000000,Max=50.0000000))
	StartVelocityRadialRange=(Min=100.0000000,Max=200.0000000)
	VelocityLossRange=(X=(Min=1.0000000,Max=3.0000000),Y=(Min=1.0000000,Max=3.0000000),Z=(Min=0.0000000,Max=0.0000000))
	RotateVelocityLossRange=true
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'Onslaught.ONSTankHitRockEffect.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=205,G=180,B=155,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=205,G=180,B=155,A=255))
	FadeOutStartTime=1.0000000
	FadeInEndTime=0.1000000
	CoordinateSystem=1
	MaxParticles=5
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-32.0000000,Max=128.0000000))
	AlphaRef=4
	SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=12.0000000)
	StartSizeRange=(X=(Min=30.0000000,Max=60.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	Texture=Texture'BenTex01.Textures.SmokePuff01'
	LifetimeRange=(Min=1.5000000,Max=4.0000000)
	StartVelocityRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=50.0000000,Max=1400.0000000))
	VelocityLossRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
	RotateVelocityLossRange=true
end object
// Reference: SpriteEmitter'Onslaught.ONSTankHitRockEffect.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=238,B=213,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=224,B=193,A=0))
	FadeOutStartTime=0.1000000
	CoordinateSystem=1
	MaxParticles=3
	StartLocationRange=(X=(Min=-64.0000000,Max=64.0000000),Y=(Min=-64.0000000,Max=64.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=75.0000000,Max=150.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=1000.0000000
	Texture=Texture'AW-2004Explosions.Fire.Part_explode2'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.2500000,Max=0.5000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSTankHitRockEffect.SpriteEmitter265'
begin object name="SpriteEmitter265" class=Engine.SpriteEmitter
	UseDirectionAs=2
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UniformSize=true
	ScaleSizeXByVelocity=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=236,B=179,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=167,G=97,B=20,A=0))
	FadeOutStartTime=0.5000000
	FadeInEndTime=0.1000000
	MaxParticles=20
	DetailMode=2
	UseRotationFrom=1
	StartSizeRange=(X=(Min=4.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ScaleSizeByVelocityMultiplier=(X=0.0060000,Y=1.0000000,Z=1.0000000)
	InitialParticlesPerSecond=1000.0000000
	Texture=Texture'AW-2004Particles.Weapons.HardSpot'
	LifetimeRange=(Min=0.7500000,Max=1.2500000)
	StartVelocityRange=(X=(Min=-1200.0000000,Max=1200.0000000),Y=(Min=-1200.0000000,Max=1200.0000000),Z=(Min=400.0000000,Max=1400.0000000))
end object
