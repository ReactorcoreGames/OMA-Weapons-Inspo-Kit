class ONSRVChainGunFireEffect extends ONSWeaponAmbientEmitter;

simulated function SetEmitterStatus(bool bEnabled)
{
	Emitters[0].UseCollision = (!Level.bDropDetail && int(Level.DetailMode) != int(0)) && VSize(Level.GetLocalPlayerController().ViewTarget.Location - Location) < float(1600);
	// End:0x100
	if(bEnabled)
	{
		Emitters[0].ParticlesPerSecond = 20.0000000;
		Emitters[0].InitialParticlesPerSecond = 20.0000000;
		Emitters[0].AllParticlesDead = false;
		Emitters[1].ParticlesPerSecond = 30.0000000;
		Emitters[1].InitialParticlesPerSecond = 30.0000000;
		Emitters[1].AllParticlesDead = false;		
	}
	else
	{
		Emitters[0].ParticlesPerSecond = 0.0000000;
		Emitters[0].InitialParticlesPerSecond = 0.0000000;
		Emitters[1].ParticlesPerSecond = 0.0000000;
		Emitters[1].InitialParticlesPerSecond = 0.0000000;
	}
	//return;	
}

defaultproperties
{
	// Reference: MeshEmitter'Onslaught.ONSRVChainGunFireEffect.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'VMmeshEmitted.EJECTA.EjectedBRASSsm'
		UseCollision=true
		RespawnDeadParticles=false
		SpawnOnlyInDirectionOfNormal=true
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		MaxParticles=30
		StartLocationOffset=(X=-80.0000000,Y=-6.0000000,Z=10.0000000)
		MeshNormal=(X=0.0000000,Y=0.0000000,Z=0.0000000)
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.1000000,Max=1.0000000),Y=(Min=0.1000000,Max=1.0000000),Z=(Min=0.1000000,Max=1.0000000))
		StartSizeRange=(X=(Min=0.0500000,Max=0.0500000),Y=(Min=0.0500000,Max=0.0500000),Z=(Min=0.0500000,Max=0.0500000))
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
		StartVelocityRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-250.0000000,Max=-250.0000000),Z=(Min=50.0000000,Max=150.0000000))
		StartVelocityRadialRange=(Min=-250.0000000,Max=250.0000000)
	end object
	Emitters[0]=MeshEmitter0
	// Reference: SpriteEmitter'Onslaught.ONSRVChainGunFireEffect.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		CoordinateSystem=1
		MaxParticles=6
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=10.0000000)
		StartLocationShape=1
		UseRotationFrom=3
		SpinsPerSecondRange=(X=(Min=7.0000000,Max=11.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.2500000,RelativeSize=0.7500000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=0.1000000)
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'VMparticleTextures.TankFiringP.CloudParticleOrangeBMPtex'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.0500000,Max=0.0500000)
		WarmupTicksPerSecond=50.0000000
		RelativeWarmupTime=2.0000000
	end object
	Emitters[1]=SpriteEmitter0
	CullDistance=4000.0000000
	bNoDelete=false
	DrawScale3D=(X=0.2500000,Y=0.2500000,Z=0.2500000)
	bUnlit=false
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'Onslaught.ONSRVChainGunFireEffect.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'VMmeshEmitted.EJECTA.EjectedBRASSsm'
	UseCollision=true
	RespawnDeadParticles=false
	SpawnOnlyInDirectionOfNormal=true
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	MaxParticles=30
	StartLocationOffset=(X=-80.0000000,Y=-6.0000000,Z=10.0000000)
	MeshNormal=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.1000000,Max=1.0000000),Y=(Min=0.1000000,Max=1.0000000),Z=(Min=0.1000000,Max=1.0000000))
	StartSizeRange=(X=(Min=0.0500000,Max=0.0500000),Y=(Min=0.0500000,Max=0.0500000),Z=(Min=0.0500000,Max=0.0500000))
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
	StartVelocityRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-250.0000000,Max=-250.0000000),Z=(Min=50.0000000,Max=150.0000000))
	StartVelocityRadialRange=(Min=-250.0000000,Max=250.0000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSRVChainGunFireEffect.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	CoordinateSystem=1
	MaxParticles=6
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	StartLocationShape=1
	UseRotationFrom=3
	SpinsPerSecondRange=(X=(Min=7.0000000,Max=11.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.2500000,RelativeSize=0.7500000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=0.1000000)
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'VMparticleTextures.TankFiringP.CloudParticleOrangeBMPtex'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.0500000,Max=0.0500000)
	WarmupTicksPerSecond=50.0000000
	RelativeWarmupTime=2.0000000
end object
