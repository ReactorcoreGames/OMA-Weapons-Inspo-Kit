class LAWRocketTrail extends DGVEmitter;

defaultproperties
{
	DisableDGV[0]=1
	DisableDGV[1]=0
	DisableDGV[2]=1
	DisableDGV[3]=0
	DisableDGV[4]=1
	// Reference: TrailEmitter'BWBP_SKC_Pro.LAWRocketTrail.TrailEmitter0'
	begin object name="TrailEmitter0" class=Engine.TrailEmitter
		TrailShadeType=3
		TrailLocation=1
		MaxPointsPerTrail=150
		DistanceThreshold=20.0000000
		UseCrossedSheets=true
		PointLifeTime=1.0000000
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.7000000,Max=0.9000000),Z=(Min=0.4000000,Max=0.7000000))
		MaxParticles=1
		InitialParticlesPerSecond=2000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=999999.0000000,Max=999999.0000000)
	end object
	Emitters[0]=TrailEmitter0
	// Reference: SpriteEmitter'BWBP_SKC_Pro.LAWRocketTrail.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=64,A=0))
		ColorScale[1]=(RelativeTime=0.7500000,Color=(R=255,G=200,B=64,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.5900000
		CoordinateSystem=1
		MaxParticles=3
		StartLocationOffset=(X=-10.0000000,Y=0.0000000,Z=0.0000000)
		SpinCCWorCW=(X=0.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.5000000)
		SizeScale[2]=(RelativeTime=0.1400000,RelativeSize=1.0000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=0.7500000)
		StartSizeRange=(X=(Min=5.0000000,Max=7.5000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		InitialDelayRange=(Min=0.0500000,Max=0.0500000)
	end object
	Emitters[1]=SpriteEmitter0
	// Reference: MeshEmitter'BWBP_SKC_Pro.LAWRocketTrail.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.M806.PistolMuzzleFlash'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		FadeOut=true
		SpinParticles=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutFactor=(W=1.0000000,X=0.5000000,Y=0.5000000,Z=0.5000000)
		FadeOutStartTime=0.1000000
		CoordinateSystem=1
		MaxParticles=1
		SpinCCWorCW=(X=0.5000000,Y=0.5000000,Z=1.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=3.0000000))
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=0.2000000,Max=0.3000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.7000000)
	end object
	Emitters[2]=MeshEmitter1
	// Reference: SpriteEmitter'BWBP_SKC_Pro.LAWRocketTrail.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=10.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=192,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.1300000
		FadeOutStartTime=0.9900000
		FadeInEndTime=0.6600000
		MaxParticles=350
		DetailMode=2
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=0.7500000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=2.5000000,Max=25.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.5000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[3]=SpriteEmitter3
	// Reference: SpriteEmitter'BWBP_SKC_Pro.LAWRocketTrail.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=160,G=160,B=160,A=255))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=120,G=120,B=120,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=0))
		Opacity=0.7400000
		MaxParticles=850
		StartLocationShape=1
		SphereRadiusRange=(Min=0.0000000,Max=8.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.5500000,Max=0.4500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.1400000,RelativeSize=2.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=25.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ParticlesPerSecond=150.0000000
		InitialParticlesPerSecond=150.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Fire.MuchSmoke1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=2.0000000,Max=2.5000000)
		StartVelocityRange=(X=(Min=-5.0000000,Max=-5.0000000),Y=(Min=-5.0000000,Max=-5.0000000),Z=(Min=-5.0000000,Max=-5.0000000))
	end object
	Emitters[4]=SpriteEmitter8
	// Reference: SpriteEmitter'BWBP_SKC_Pro.LAWRocketTrail.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=85,G=157,B=210,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=226,B=130,A=0))
		ColorScale[2]=(RelativeTime=0.3000000,Color=(R=225,G=135,B=0,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=8
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ParticlesPerSecond=120.0000000
		InitialParticlesPerSecond=120.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
	end object
	Emitters[5]=SpriteEmitter9
	Physics=10
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: TrailEmitter'BWBP_SKC_Pro.LAWRocketTrail.TrailEmitter0'
begin object name="TrailEmitter0" class=Engine.TrailEmitter
	TrailShadeType=3
	TrailLocation=1
	MaxPointsPerTrail=150
	DistanceThreshold=20.0000000
	UseCrossedSheets=true
	PointLifeTime=1.0000000
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.7000000,Max=0.9000000),Z=(Min=0.4000000,Max=0.7000000))
	MaxParticles=1
	InitialParticlesPerSecond=2000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=999999.0000000,Max=999999.0000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.LAWRocketTrail.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=64,A=0))
	ColorScale[1]=(RelativeTime=0.7500000,Color=(R=255,G=200,B=64,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.5900000
	CoordinateSystem=1
	MaxParticles=3
	StartLocationOffset=(X=-10.0000000,Y=0.0000000,Z=0.0000000)
	SpinCCWorCW=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.5000000)
	SizeScale[2]=(RelativeTime=0.1400000,RelativeSize=1.0000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=0.7500000)
	StartSizeRange=(X=(Min=5.0000000,Max=7.5000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	InitialDelayRange=(Min=0.0500000,Max=0.0500000)
end object
// Reference: MeshEmitter'BWBP_SKC_Pro.LAWRocketTrail.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M806.PistolMuzzleFlash'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	FadeOut=true
	SpinParticles=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutFactor=(W=1.0000000,X=0.5000000,Y=0.5000000,Z=0.5000000)
	FadeOutStartTime=0.1000000
	CoordinateSystem=1
	MaxParticles=1
	SpinCCWorCW=(X=0.5000000,Y=0.5000000,Z=1.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=3.0000000))
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=0.2000000,Max=0.3000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.7000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.LAWRocketTrail.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=192,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.1300000
	FadeOutStartTime=0.9900000
	FadeInEndTime=0.6600000
	MaxParticles=350
	DetailMode=2
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=0.7500000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=2.5000000,Max=25.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.5000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.LAWRocketTrail.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=160,G=160,B=160,A=255))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=120,G=120,B=120,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=0))
	Opacity=0.7400000
	MaxParticles=850
	StartLocationShape=1
	SphereRadiusRange=(Min=0.0000000,Max=8.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.5500000,Max=0.4500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.1400000,RelativeSize=2.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=25.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ParticlesPerSecond=150.0000000
	InitialParticlesPerSecond=150.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Fire.MuchSmoke1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=2.0000000,Max=2.5000000)
	StartVelocityRange=(X=(Min=-5.0000000,Max=-5.0000000),Y=(Min=-5.0000000,Max=-5.0000000),Z=(Min=-5.0000000,Max=-5.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.LAWRocketTrail.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=85,G=157,B=210,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=226,B=130,A=0))
	ColorScale[2]=(RelativeTime=0.3000000,Color=(R=225,G=135,B=0,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=8
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ParticlesPerSecond=120.0000000
	InitialParticlesPerSecond=120.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaFlare'
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
end object
