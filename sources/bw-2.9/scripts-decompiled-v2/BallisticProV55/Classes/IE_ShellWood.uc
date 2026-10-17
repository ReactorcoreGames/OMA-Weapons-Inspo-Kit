class IE_ShellWood extends DGVEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.IE_ShellWood.SpriteEmitter42'
	begin object name="SpriteEmitter42" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=180,G=150,B=110,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=160,G=150,B=140,A=255))
		FadeOutStartTime=0.5200000
		FadeInEndTime=0.1200000
		MaxParticles=4
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-15.0000000,Max=15.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=100000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=20.0000000,Max=50.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	end object
	Emitters[0]=SpriteEmitter42
	// Reference: MeshEmitter'BallisticProV55.IE_ShellWood.MeshEmitter14'
	begin object name="MeshEmitter14" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.WoodChipA1'
		UseParticleColor=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-150.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.5000000
		FadeInEndTime=0.1000000
		MaxParticles=7
		DetailMode=2
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=2.0000000))
		StartSizeRange=(X=(Min=0.0500000,Max=0.2000000),Y=(Min=0.0500000,Max=0.2000000),Z=(Min=0.0500000,Max=0.1500000))
		InitialParticlesPerSecond=100000.0000000
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
		StartVelocityRange=(X=(Min=50.0000000,Max=150.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=50.0000000))
	end object
	Emitters[1]=MeshEmitter14
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.IE_ShellWood.SpriteEmitter42'
begin object name="SpriteEmitter42" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=180,G=150,B=110,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=160,G=150,B=140,A=255))
	FadeOutStartTime=0.5200000
	FadeInEndTime=0.1200000
	MaxParticles=4
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-15.0000000,Max=15.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=100000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=20.0000000,Max=50.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
end object
// Reference: MeshEmitter'BallisticProV55.IE_ShellWood.MeshEmitter14'
begin object name="MeshEmitter14" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.WoodChipA1'
	UseParticleColor=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-150.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.5000000
	FadeInEndTime=0.1000000
	MaxParticles=7
	DetailMode=2
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=2.0000000))
	StartSizeRange=(X=(Min=0.0500000,Max=0.2000000),Y=(Min=0.0500000,Max=0.2000000),Z=(Min=0.0500000,Max=0.1500000))
	InitialParticlesPerSecond=100000.0000000
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
	StartVelocityRange=(X=(Min=50.0000000,Max=150.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=50.0000000))
end object
