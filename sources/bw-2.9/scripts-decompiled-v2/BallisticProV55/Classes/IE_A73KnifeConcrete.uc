class IE_A73KnifeConcrete extends DGVEmitter;

simulated event PreBeginPlay()
{
	// End:0x2C
	if(int(Level.DetailMode) < int(1))
	{
		Emitters[0].Disabled = true;
	}
	super(Actor).PreBeginPlay();
	//return;	
}

defaultproperties
{
	bVerticalZ=false
	// Reference: MeshEmitter'BallisticProV55.IE_A73KnifeConcrete.MeshEmitter9'
	begin object name="MeshEmitter9" class=Engine.MeshEmitter
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
	Emitters[0]=MeshEmitter9
	// Reference: SparkEmitter'BallisticProV55.IE_A73KnifeConcrete.SparkEmitter8'
	begin object name="SparkEmitter8" class=Engine.SparkEmitter
		LineSegmentsRange=(Min=3.0000000,Max=3.0000000)
		TimeBeforeVisibleRange=(Min=5.0000000,Max=5.0000000)
		TimeBetweenSegmentsRange=(Min=0.2000000,Max=0.2000000)
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=255,A=0))
		FadeOutFactor=(W=1.0000000,X=0.5000000,Y=0.5000000,Z=0.5000000)
		FadeOutStartTime=0.3000000
		MaxParticles=20
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=50.0000000,Max=200.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=50.0000000))
	end object
	Emitters[1]=SparkEmitter8
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.IE_A73KnifeConcrete.MeshEmitter9'
begin object name="MeshEmitter9" class=Engine.MeshEmitter
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
// Reference: SparkEmitter'BallisticProV55.IE_A73KnifeConcrete.SparkEmitter8'
begin object name="SparkEmitter8" class=Engine.SparkEmitter
	LineSegmentsRange=(Min=3.0000000,Max=3.0000000)
	TimeBeforeVisibleRange=(Min=5.0000000,Max=5.0000000)
	TimeBetweenSegmentsRange=(Min=0.2000000,Max=0.2000000)
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=255,A=0))
	FadeOutFactor=(W=1.0000000,X=0.5000000,Y=0.5000000,Z=0.5000000)
	FadeOutStartTime=0.3000000
	MaxParticles=20
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=50.0000000,Max=200.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=50.0000000))
end object
