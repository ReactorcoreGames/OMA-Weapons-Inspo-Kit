class HAMRShellTrail extends DGVEmitter;

defaultproperties
{
	// Reference: MeshEmitter'BallisticProV55.HAMRShellTrail.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.M806.PistolMuzzleFlash'
		UseMeshBlendMode=false
		RenderTwoSided=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.0590000
		FadeInEndTime=0.0120000
		CoordinateSystem=1
		MaxParticles=2
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=0.0600000,Max=0.0800000),Y=(Min=0.0400000,Max=0.0400000),Z=(Min=0.0400000,Max=0.0400000))
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
	end object
	Emitters[0]=MeshEmitter0
	// Reference: SpriteEmitter'BallisticProV55.HAMRShellTrail.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=25.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=64,A=255))
		Opacity=0.7500000
		FadeOutStartTime=0.9200000
		FadeInEndTime=0.5600000
		MaxParticles=250
		StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=10.0000000,Max=15.0000000),Z=(Min=10.0000000,Max=15.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1f'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=15.0000000))
	end object
	Emitters[1]=SpriteEmitter2
	// Reference: TrailEmitter'BallisticProV55.HAMRShellTrail.TrailEmitter1'
	begin object name="TrailEmitter1" class=Engine.TrailEmitter
		TrailShadeType=3
		TrailLocation=1
		MaxPointsPerTrail=350
		DistanceThreshold=30.0000000
		PointLifeTime=1.5000000
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7500000,Max=1.0000000),Z=(Min=0.5000000,Max=0.6000000))
		MaxParticles=1
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		InitialParticlesPerSecond=500000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=99.0000000,Max=99.0000000)
	end object
	Emitters[2]=TrailEmitter1
	AutoDestroy=true
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.HAMRShellTrail.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M806.PistolMuzzleFlash'
	UseMeshBlendMode=false
	RenderTwoSided=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.0590000
	FadeInEndTime=0.0120000
	CoordinateSystem=1
	MaxParticles=2
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=0.0600000,Max=0.0800000),Y=(Min=0.0400000,Max=0.0400000),Z=(Min=0.0400000,Max=0.0400000))
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
end object
// Reference: SpriteEmitter'BallisticProV55.HAMRShellTrail.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=25.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=64,A=255))
	Opacity=0.7500000
	FadeOutStartTime=0.9200000
	FadeInEndTime=0.5600000
	MaxParticles=250
	StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=10.0000000,Max=15.0000000),Z=(Min=10.0000000,Max=15.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1f'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=15.0000000))
end object
// Reference: TrailEmitter'BallisticProV55.HAMRShellTrail.TrailEmitter1'
begin object name="TrailEmitter1" class=Engine.TrailEmitter
	TrailShadeType=3
	TrailLocation=1
	MaxPointsPerTrail=350
	DistanceThreshold=30.0000000
	PointLifeTime=1.5000000
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7500000,Max=1.0000000),Z=(Min=0.5000000,Max=0.6000000))
	MaxParticles=1
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	InitialParticlesPerSecond=500000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=99.0000000,Max=99.0000000)
end object
