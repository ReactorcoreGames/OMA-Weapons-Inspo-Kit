class IE_BulletPlant extends DGVEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.IE_BulletPlant.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=25.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=64,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=192,B=64,A=0))
		FadeOutStartTime=0.5000000
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=25.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=10000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-50.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-25.0000000,Max=25.0000000))
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: MeshEmitter'BallisticProV55.IE_BulletPlant.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip1'
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=0,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=0,A=0))
		FadeOutStartTime=0.5000000
		MaxParticles=7
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=3.0000000),Y=(Min=0.0000000,Max=3.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=0.1250000,Max=0.3750000),Y=(Min=0.1250000,Max=0.3750000),Z=(Min=0.1250000,Max=0.3750000))
		InitialParticlesPerSecond=10000.0000000
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=40.0000000,Max=70.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-25.0000000,Max=50.0000000))
	end object
	Emitters[1]=MeshEmitter0
	// Reference: MeshEmitter'BallisticProV55.IE_BulletPlant.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip1'
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-80.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=64,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=255,B=64,A=0))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		FadeOutStartTime=0.5000000
		MaxParticles=15
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=3.0000000),Y=(Min=0.0000000,Max=3.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=0.1250000,Max=0.3750000),Y=(Min=0.1250000,Max=0.3750000),Z=(Min=0.1250000,Max=0.3750000))
		InitialParticlesPerSecond=250.0000000
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-120.0000000,Max=-50.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=10.0000000))
	end object
	Emitters[2]=MeshEmitter1
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.IE_BulletPlant.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=25.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=64,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=192,B=64,A=0))
	FadeOutStartTime=0.5000000
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=25.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=10000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-50.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-25.0000000,Max=25.0000000))
end object
// Reference: MeshEmitter'BallisticProV55.IE_BulletPlant.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip1'
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=0,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=0,A=0))
	FadeOutStartTime=0.5000000
	MaxParticles=7
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=3.0000000),Y=(Min=0.0000000,Max=3.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=0.1250000,Max=0.3750000),Y=(Min=0.1250000,Max=0.3750000),Z=(Min=0.1250000,Max=0.3750000))
	InitialParticlesPerSecond=10000.0000000
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=40.0000000,Max=70.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-25.0000000,Max=50.0000000))
end object
// Reference: MeshEmitter'BallisticProV55.IE_BulletPlant.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip1'
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-80.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=64,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=255,B=64,A=0))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	FadeOutStartTime=0.5000000
	MaxParticles=15
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=3.0000000),Y=(Min=0.0000000,Max=3.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=0.1250000,Max=0.3750000),Y=(Min=0.1250000,Max=0.3750000),Z=(Min=0.1250000,Max=0.3750000))
	InitialParticlesPerSecond=250.0000000
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-120.0000000,Max=-50.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=10.0000000))
end object
