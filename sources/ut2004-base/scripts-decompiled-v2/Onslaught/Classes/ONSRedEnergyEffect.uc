class ONSRedEnergyEffect extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'Onslaught.ONSRedEnergyEffect.SpriteEmitter12'
	begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
		UseDirectionAs=4
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=128,G=128,B=0,A=0))
		ColorScale[2]=(RelativeTime=0.9000000,Color=(R=255,G=0,B=0,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=2
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=80.0000000,Max=100.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50.0000000
		Texture=Texture'AW-2004Particles.Fire.BlastMark'
		LifetimeRange=(Min=1.2000000,Max=1.2000000)
	end object
	Emitters[0]=SpriteEmitter12
	// Reference: SpriteEmitter'Onslaught.ONSRedEnergyEffect.SpriteEmitter13'
	begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
		UseDirectionAs=2
		UseColorScale=true
		RespawnDeadParticles=false
		UseRevolution=true
		UseRevolutionScale=true
		UniformSize=true
		DetermineVelocityByLocationDifference=true
		ScaleSizeXByVelocity=true
		AutomaticInitialSpawning=false
		UseVelocityScale=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=250,G=190,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=250,G=190,B=0,A=0))
		ColorScale[2]=(RelativeTime=0.4000000,Color=(R=255,G=0,B=0,A=0))
		ColorScale[3]=(RelativeTime=0.6000000,Color=(R=128,G=0,B=0,A=0))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=200
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=256.0000000))
		StartLocationShape=3
		StartLocationPolarRange=(X=(Min=0.0000000,Max=65536.0000000),Y=(Min=16384.0000000,Max=16384.0000000),Z=(Min=64.0000000,Max=96.0000000))
		RevolutionsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
		RevolutionScale[0]=(RelativeTime=0.0000000,RelativeRevolution=(X=1.0000000,Y=1.0000000,Z=1.0000000))
		RevolutionScale[1]=(RelativeTime=0.5000000,RelativeRevolution=(X=0.5000000,Y=0.5000000,Z=0.5000000))
		RevolutionScale[2]=(RelativeTime=1.0000000,RelativeRevolution=(X=0.0000000,Y=0.0000000,Z=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=0.4000000,RelativeSize=0.8000000)
		SizeScale[3]=(RelativeTime=0.6000000,RelativeSize=1.0000000)
		SizeScale[4]=(RelativeTime=0.8000000,RelativeSize=3.0000000)
		SizeScale[5]=(RelativeTime=1.0000000,RelativeSize=0.8000000)
		StartSizeRange=(X=(Min=2.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ScaleSizeByVelocityMultiplier=(X=0.0100000,Y=1.0000000,Z=1.0000000)
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'EpicParticles.Flares.FlashFlare1'
		LifetimeRange=(Min=1.2000000,Max=1.2000000)
		StartVelocityRadialRange=(Min=20.0000000,Max=20.0000000)
		GetVelocityDirectionFrom=3
		VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000))
		VelocityScale[1]=(RelativeTime=0.4000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
		VelocityScale[2]=(RelativeTime=0.8000000,RelativeVelocity=(X=20.0000000,Y=20.0000000,Z=-20.0000000))
		VelocityScale[3]=(RelativeTime=1.0000000,RelativeVelocity=(X=0.2000000,Y=0.2000000,Z=0.2000000))
	end object
	Emitters[1]=SpriteEmitter13
	AutoDestroy=true
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSRedEnergyEffect.SpriteEmitter12'
begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
	UseDirectionAs=4
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=128,G=128,B=0,A=0))
	ColorScale[2]=(RelativeTime=0.9000000,Color=(R=255,G=0,B=0,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=2
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=80.0000000,Max=100.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50.0000000
	Texture=Texture'AW-2004Particles.Fire.BlastMark'
	LifetimeRange=(Min=1.2000000,Max=1.2000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSRedEnergyEffect.SpriteEmitter13'
begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
	UseDirectionAs=2
	UseColorScale=true
	RespawnDeadParticles=false
	UseRevolution=true
	UseRevolutionScale=true
	UniformSize=true
	DetermineVelocityByLocationDifference=true
	ScaleSizeXByVelocity=true
	AutomaticInitialSpawning=false
	UseVelocityScale=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=250,G=190,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=250,G=190,B=0,A=0))
	ColorScale[2]=(RelativeTime=0.4000000,Color=(R=255,G=0,B=0,A=0))
	ColorScale[3]=(RelativeTime=0.6000000,Color=(R=128,G=0,B=0,A=0))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=200
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=256.0000000))
	StartLocationShape=3
	StartLocationPolarRange=(X=(Min=0.0000000,Max=65536.0000000),Y=(Min=16384.0000000,Max=16384.0000000),Z=(Min=64.0000000,Max=96.0000000))
	RevolutionsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
	RevolutionScale[0]=(RelativeTime=0.0000000,RelativeRevolution=(X=1.0000000,Y=1.0000000,Z=1.0000000))
	RevolutionScale[1]=(RelativeTime=0.5000000,RelativeRevolution=(X=0.5000000,Y=0.5000000,Z=0.5000000))
	RevolutionScale[2]=(RelativeTime=1.0000000,RelativeRevolution=(X=0.0000000,Y=0.0000000,Z=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=0.4000000,RelativeSize=0.8000000)
	SizeScale[3]=(RelativeTime=0.6000000,RelativeSize=1.0000000)
	SizeScale[4]=(RelativeTime=0.8000000,RelativeSize=3.0000000)
	SizeScale[5]=(RelativeTime=1.0000000,RelativeSize=0.8000000)
	StartSizeRange=(X=(Min=2.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ScaleSizeByVelocityMultiplier=(X=0.0100000,Y=1.0000000,Z=1.0000000)
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'EpicParticles.Flares.FlashFlare1'
	LifetimeRange=(Min=1.2000000,Max=1.2000000)
	StartVelocityRadialRange=(Min=20.0000000,Max=20.0000000)
	GetVelocityDirectionFrom=3
	VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000))
	VelocityScale[1]=(RelativeTime=0.4000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
	VelocityScale[2]=(RelativeTime=0.8000000,RelativeVelocity=(X=20.0000000,Y=20.0000000,Z=-20.0000000))
	VelocityScale[3]=(RelativeTime=1.0000000,RelativeVelocity=(X=0.2000000,Y=0.2000000,Z=0.2000000))
end object
