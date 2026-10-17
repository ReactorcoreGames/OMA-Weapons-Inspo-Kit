class ONSWheeledVehicleExplosionEffect extends ONSVehicleExplosionEffect;

defaultproperties
{
	Emitters[0]=SpriteEmitter'Onslaught.ONSVehicleExplosionEffect.SpriteEmitter0'
	Emitters[1]=SpriteEmitter'Onslaught.ONSVehicleExplosionEffect.SpriteEmitter1'
	Emitters[2]=SpriteEmitter'Onslaught.ONSVehicleExplosionEffect.SpriteEmitter2'
	Emitters[3]=SpriteEmitter'Onslaught.ONSVehicleExplosionEffect.SpriteEmitter11'
	Emitters[4]=SpriteEmitter'Onslaught.ONSVehicleExplosionEffect.SpriteEmitter3'
	Emitters[5]=SpriteEmitter'Onslaught.ONSVehicleExplosionEffect.SpriteEmitter7'
	// Reference: MeshEmitter'Onslaught.ONSWheeledVehicleExplosionEffect.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ONSDeadVehicles-SM.PRVWheelMesh'
		UseCollision=true
		UseColorScale=true
		RespawnDeadParticles=false
		AlphaTest=false
		SpinParticles=true
		DampRotation=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
		ExtentMultiplier=(X=1.0000000,Y=1.0000000,Z=0.5000000)
		DampingFactorRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.2000000,Max=0.2000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=0))
		FadeOutStartTime=2.0000000
		MaxParticles=1
		AddLocationFromOtherEmitter=0
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=1.0000000,Max=-1.0000000),Z=(Min=0.0000000,Max=0.5000000))
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.2500000,Max=0.2500000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.9000000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=0.9700000,RelativeSize=1.0000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=0.7000000,Max=0.7000000),Y=(Min=0.7000000,Max=0.7000000),Z=(Min=0.7000000,Max=0.7000000))
		InitialParticlesPerSecond=1000.0000000
		DrawStyle=0
		Texture=none
		LifetimeRange=(Min=5.0000000,Max=5.0000000)
		AddVelocityFromOtherEmitter=0
	end object
	Emitters[6]=MeshEmitter0
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'Onslaught.ONSWheeledVehicleExplosionEffect.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.PRVWheelMesh'
	UseCollision=true
	UseColorScale=true
	RespawnDeadParticles=false
	AlphaTest=false
	SpinParticles=true
	DampRotation=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
	ExtentMultiplier=(X=1.0000000,Y=1.0000000,Z=0.5000000)
	DampingFactorRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.2000000,Max=0.2000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=0))
	FadeOutStartTime=2.0000000
	MaxParticles=1
	AddLocationFromOtherEmitter=0
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=1.0000000,Max=-1.0000000),Z=(Min=0.0000000,Max=0.5000000))
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.2500000,Max=0.2500000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.9000000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=0.9700000,RelativeSize=1.0000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=0.7000000,Max=0.7000000),Y=(Min=0.7000000,Max=0.7000000),Z=(Min=0.7000000,Max=0.7000000))
	InitialParticlesPerSecond=1000.0000000
	DrawStyle=0
	Texture=none
	LifetimeRange=(Min=5.0000000,Max=5.0000000)
	AddVelocityFromOtherEmitter=0
end object
