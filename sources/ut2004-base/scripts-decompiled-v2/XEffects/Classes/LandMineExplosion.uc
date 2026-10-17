class LandMineExplosion extends Emitter;

defaultproperties
{
	// Reference: MeshEmitter'XEffects.LandMineExplosion.MeshEmitter18'
	begin object name="MeshEmitter18" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ArboreaLanscape.Cliffs.littlerock01'
		UseCollision=true
		ResetAfterChange=true
		RespawnDeadParticles=false
		UniformMeshScale=false
		UniformVelocityScale=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ResetOnTrigger=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-950.0000000)
		DampingFactorRange=(X=(Min=-0.5000000,Max=-0.2500000),Y=(Min=-0.5000000,Max=-0.2500000),Z=(Min=-0.5000000,Max=-0.2500000))
		MaxParticles=30
		StartMassRange=(Min=100.0000000,Max=500.0000000)
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=-0.0500000,Max=0.0250000),Y=(Min=0.0500000,Max=0.0250000),Z=(Min=0.0500000,Max=0.0250000))
		InitialParticlesPerSecond=500.0000000
		LifetimeRange=(Min=2.0000000,Max=4.0000000)
		StartVelocityRange=(X=(Min=-250.0000000,Max=250.0000000),Y=(Min=-250.0000000,Max=250.0000000),Z=(Min=500.0000000,Max=800.0000000))
	end object
	Emitters[0]=MeshEmitter18
	// Reference: MeshEmitter'XEffects.LandMineExplosion.MeshEmitter19'
	begin object name="MeshEmitter19" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'ArboreaLanscape.Cliffs.littlerock01'
		ResetAfterChange=true
		RespawnDeadParticles=false
		UniformMeshScale=false
		UniformVelocityScale=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ResetOnTrigger=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-950.0000000)
		MaxParticles=25
		SpinsPerSecondRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=0.0250000,Max=0.0500000),Y=(Min=0.0250000,Max=0.0500000),Z=(Min=0.0250000,Max=0.0500000))
		InitialParticlesPerSecond=1100.0000000
		LifetimeRange=(Min=2.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=500.0000000,Max=800.0000000))
	end object
	Emitters[1]=MeshEmitter19
	// Reference: SpriteEmitter'XEffects.LandMineExplosion.SpriteEmitter27'
	begin object name="SpriteEmitter27" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		TriggerDisabled=false
		ResetOnTrigger=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-950.0000000)
		SpinsPerSecondRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=800.0000000,Max=1000.0000000))
	end object
	Emitters[2]=SpriteEmitter27
	// Reference: SpriteEmitter'XEffects.LandMineExplosion.SpriteEmitter28'
	begin object name="SpriteEmitter28" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		TriggerDisabled=false
		ResetOnTrigger=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-750.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=238,G=141,B=34,A=0))
		ColorScale[1]=(RelativeTime=0.2500000,Color=(R=77,G=68,B=43,A=0))
		ColorScale[2]=(RelativeTime=0.9000000,Color=(R=51,G=51,B=51,A=0))
		ColorMultiplierRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.7500000,Max=0.7500000))
		FadeOutFactor=(W=0.2500000,X=0.1000000,Y=0.1000000,Z=0.1000000)
		FadeOutStartTime=0.7500000
		MaxParticles=25
		SpinsPerSecondRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.5000000,RelativeSize=10.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'EmitterTextures.MultiFrame.smokelight_a'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=3.0000000,Max=4.0000000)
		StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=400.0000000,Max=900.0000000))
		RelativeWarmupTime=1.0000000
	end object
	Emitters[3]=SpriteEmitter28
	AutoDestroy=true
	bLightChanged=true
	bNoDelete=false
	bNetTemporary=true
	RemoteRole=1
	bUnlit=false
	ForceType=2
	ForceRadius=1000.0000000
	ForceScale=10.0000000
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'XEffects.LandMineExplosion.MeshEmitter18'
begin object name="MeshEmitter18" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ArboreaLanscape.Cliffs.littlerock01'
	UseCollision=true
	ResetAfterChange=true
	RespawnDeadParticles=false
	UniformMeshScale=false
	UniformVelocityScale=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ResetOnTrigger=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-950.0000000)
	DampingFactorRange=(X=(Min=-0.5000000,Max=-0.2500000),Y=(Min=-0.5000000,Max=-0.2500000),Z=(Min=-0.5000000,Max=-0.2500000))
	MaxParticles=30
	StartMassRange=(Min=100.0000000,Max=500.0000000)
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=-0.0500000,Max=0.0250000),Y=(Min=0.0500000,Max=0.0250000),Z=(Min=0.0500000,Max=0.0250000))
	InitialParticlesPerSecond=500.0000000
	LifetimeRange=(Min=2.0000000,Max=4.0000000)
	StartVelocityRange=(X=(Min=-250.0000000,Max=250.0000000),Y=(Min=-250.0000000,Max=250.0000000),Z=(Min=500.0000000,Max=800.0000000))
end object
// Reference: MeshEmitter'XEffects.LandMineExplosion.MeshEmitter19'
begin object name="MeshEmitter19" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'ArboreaLanscape.Cliffs.littlerock01'
	ResetAfterChange=true
	RespawnDeadParticles=false
	UniformMeshScale=false
	UniformVelocityScale=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ResetOnTrigger=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-950.0000000)
	MaxParticles=25
	SpinsPerSecondRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=0.0250000,Max=0.0500000),Y=(Min=0.0250000,Max=0.0500000),Z=(Min=0.0250000,Max=0.0500000))
	InitialParticlesPerSecond=1100.0000000
	LifetimeRange=(Min=2.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=500.0000000,Max=800.0000000))
end object
// Reference: SpriteEmitter'XEffects.LandMineExplosion.SpriteEmitter27'
begin object name="SpriteEmitter27" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	TriggerDisabled=false
	ResetOnTrigger=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-950.0000000)
	SpinsPerSecondRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=800.0000000,Max=1000.0000000))
end object
// Reference: SpriteEmitter'XEffects.LandMineExplosion.SpriteEmitter28'
begin object name="SpriteEmitter28" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	TriggerDisabled=false
	ResetOnTrigger=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-750.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=238,G=141,B=34,A=0))
	ColorScale[1]=(RelativeTime=0.2500000,Color=(R=77,G=68,B=43,A=0))
	ColorScale[2]=(RelativeTime=0.9000000,Color=(R=51,G=51,B=51,A=0))
	ColorMultiplierRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.7500000,Max=0.7500000))
	FadeOutFactor=(W=0.2500000,X=0.1000000,Y=0.1000000,Z=0.1000000)
	FadeOutStartTime=0.7500000
	MaxParticles=25
	SpinsPerSecondRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.5000000,RelativeSize=10.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'EmitterTextures.MultiFrame.smokelight_a'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=3.0000000,Max=4.0000000)
	StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=400.0000000,Max=900.0000000))
	RelativeWarmupTime=1.0000000
end object
