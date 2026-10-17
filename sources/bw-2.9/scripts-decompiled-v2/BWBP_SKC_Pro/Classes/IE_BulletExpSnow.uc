class IE_BulletExpSnow extends DGVEmitter;

defaultproperties
{
	// Reference: MeshEmitter'BWBP_SKC_Pro.IE_BulletExpSnow.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.VolumetricA2'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=96,B=64,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=96,B=64,A=255))
		FadeOutStartTime=0.4320000
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.1400000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=0.3700000,RelativeSize=1.8000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
		StartSizeRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.6000000,Max=0.6000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.2000000,Max=1.2000000)
	end object
	Emitters[0]=MeshEmitter0
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpSnow.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseCollisionPlanes=true
		UseMaxCollisions=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-150.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=96,B=64,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=111,B=64,A=255))
		Opacity=0.6500000
		FadeOutStartTime=0.7200000
		FadeInEndTime=0.1200000
		MaxParticles=35
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=5.0000000),Y=(Min=2.0000000,Max=5.0000000),Z=(Min=2.0000000,Max=5.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
		TextureUSubdivisions=5
		TextureVSubdivisions=5
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
		StartVelocityRange=(X=(Min=50.0000000,Max=180.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
	end object
	Emitters[1]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpSnow.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=96,B=64,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=96,B=64,A=255))
		Opacity=0.3100000
		FadeOutFactor=(W=1.0000000,X=1.1000000,Y=1.1000000,Z=1.0000000)
		FadeOutStartTime=1.0800000
		FadeInEndTime=0.0600000
		MaxParticles=3
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=10.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=5.0000000,Max=10.0000000),Z=(Min=5.0000000,Max=10.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=10.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	end object
	Emitters[2]=SpriteEmitter1
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpSnow.SpriteEmitter12'
	begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.2000000
		FadeOutStartTime=0.1610000
		FadeInEndTime=0.0315000
		MaxParticles=1
		DetailMode=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=35.0000000,Max=35.0000000),Z=(Min=35.0000000,Max=35.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3500000,Max=0.3500000)
	end object
	Emitters[3]=SpriteEmitter12
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpSnow.SpriteEmitter14'
	begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.8000000,Max=0.8000000))
		FadeOutStartTime=0.1000000
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[4]=SpriteEmitter14
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BWBP_SKC_Pro.IE_BulletExpSnow.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.VolumetricA2'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=96,B=64,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=96,B=64,A=255))
	FadeOutStartTime=0.4320000
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.1400000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=0.3700000,RelativeSize=1.8000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
	StartSizeRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.6000000,Max=0.6000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.2000000,Max=1.2000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpSnow.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseCollisionPlanes=true
	UseMaxCollisions=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-150.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=96,B=64,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=111,B=64,A=255))
	Opacity=0.6500000
	FadeOutStartTime=0.7200000
	FadeInEndTime=0.1200000
	MaxParticles=35
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=5.0000000),Y=(Min=2.0000000,Max=5.0000000),Z=(Min=2.0000000,Max=5.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
	TextureUSubdivisions=5
	TextureVSubdivisions=5
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
	StartVelocityRange=(X=(Min=50.0000000,Max=180.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpSnow.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=96,B=64,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=96,B=64,A=255))
	Opacity=0.3100000
	FadeOutFactor=(W=1.0000000,X=1.1000000,Y=1.1000000,Z=1.0000000)
	FadeOutStartTime=1.0800000
	FadeInEndTime=0.0600000
	MaxParticles=3
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=5.0000000,Max=10.0000000),Z=(Min=5.0000000,Max=10.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=10.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpSnow.SpriteEmitter12'
begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.2000000
	FadeOutStartTime=0.1610000
	FadeInEndTime=0.0315000
	MaxParticles=1
	DetailMode=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=35.0000000,Max=35.0000000),Z=(Min=35.0000000,Max=35.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3500000,Max=0.3500000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpSnow.SpriteEmitter14'
begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.8000000,Max=0.8000000))
	FadeOutStartTime=0.1000000
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
