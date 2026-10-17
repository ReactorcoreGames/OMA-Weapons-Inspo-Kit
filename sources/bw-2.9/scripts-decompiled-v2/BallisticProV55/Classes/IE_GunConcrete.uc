class IE_GunConcrete extends DGVEmitter;

simulated event PreBeginPlay()
{
	// End:0x2C
	if(int(Level.DetailMode) < int(2))
	{
		Emitters[0].Disabled = true;
	}
	super(Actor).PreBeginPlay();
	//return;	
}

defaultproperties
{
	// Reference: MeshEmitter'BallisticProV55.IE_GunConcrete.MeshEmitter6'
	begin object name="MeshEmitter6" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip2'
		UseMeshBlendMode=false
		UseParticleColor=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		FadeOutFactor=(W=1.0000000,X=0.5000000,Y=0.5000000,Z=0.5000000)
		FadeOutStartTime=0.5000000
		FadeInEndTime=0.1000000
		MaxParticles=5
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinCCWorCW=(X=0.5000000,Y=0.5000000,Z=1.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=3.0000000),Y=(Min=0.0000000,Max=3.0000000),Z=(Min=0.0000000,Max=3.0000000))
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=0.1000000,Max=0.5000000),Y=(Min=0.1000000,Max=0.5000000),Z=(Min=0.1000000,Max=0.5000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=0
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=50.0000000,Max=100.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	end object
	Emitters[0]=MeshEmitter6
	// Reference: SpriteEmitter'BallisticProV55.IE_GunConcrete.SpriteEmitter14'
	begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=240,B=230,A=128))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=240,B=230,A=255))
		FadeOutStartTime=0.1000000
		MaxParticles=5
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.3000000,RelativeSize=0.6000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=20.0000000,Max=60.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=30.0000000))
	end object
	Emitters[1]=SpriteEmitter14
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.IE_GunConcrete.MeshEmitter6'
begin object name="MeshEmitter6" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip2'
	UseMeshBlendMode=false
	UseParticleColor=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	FadeOutFactor=(W=1.0000000,X=0.5000000,Y=0.5000000,Z=0.5000000)
	FadeOutStartTime=0.5000000
	FadeInEndTime=0.1000000
	MaxParticles=5
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinCCWorCW=(X=0.5000000,Y=0.5000000,Z=1.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=3.0000000),Y=(Min=0.0000000,Max=3.0000000),Z=(Min=0.0000000,Max=3.0000000))
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=0.1000000,Max=0.5000000),Y=(Min=0.1000000,Max=0.5000000),Z=(Min=0.1000000,Max=0.5000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=0
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=50.0000000,Max=100.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_GunConcrete.SpriteEmitter14'
begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=240,B=230,A=128))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=240,B=230,A=255))
	FadeOutStartTime=0.1000000
	MaxParticles=5
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.3000000,RelativeSize=0.6000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=20.0000000,Max=60.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=30.0000000))
end object
