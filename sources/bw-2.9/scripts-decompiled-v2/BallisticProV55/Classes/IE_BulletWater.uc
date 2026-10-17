class IE_BulletWater extends BallisticEmitter;

defaultproperties
{
	// Reference: MeshEmitter'BallisticProV55.IE_BulletWater.MeshEmitter18'
	begin object name="MeshEmitter18" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.VolumetricA4'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-150.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=200,G=225,B=255,A=128))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=200,G=225,B=255,A=128))
		Opacity=0.9600000
		FadeOutStartTime=0.0240000
		FadeInEndTime=0.0160000
		MaxParticles=1
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=2.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=0.7000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=0.7000000,Max=1.5000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=10.0000000,Max=10.0000000))
	end object
	Emitters[0]=MeshEmitter18
	// Reference: SpriteEmitter'BallisticProV55.IE_BulletWater.SpriteEmitter36'
	begin object name="SpriteEmitter36" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.2200000
		FadeInEndTime=0.0200000
		CoordinateSystem=1
		MaxParticles=50
		StartLocationRange=(X=(Min=-1000.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
		InitialParticlesPerSecond=9999999.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaBubble1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-100.0000000,Max=0.0000000),Y=(Min=-8.0000000,Max=8.0000000),Z=(Min=-8.0000000,Max=8.0000000))
	end object
	Emitters[1]=SpriteEmitter36
	// Reference: SpriteEmitter'BallisticProV55.IE_BulletWater.SpriteEmitter37'
	begin object name="SpriteEmitter37" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=40.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.9700000
		FadeOutStartTime=0.7300000
		FadeInEndTime=0.0600000
		MaxParticles=5
		StartLocationRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-4.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=5.0000000),Y=(Min=2.0000000,Max=5.0000000),Z=(Min=2.0000000,Max=5.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaBubble1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-40.0000000,Max=-10.0000000))
	end object
	Emitters[2]=SpriteEmitter37
	// Reference: SpriteEmitter'BallisticProV55.IE_BulletWater.SpriteEmitter39'
	begin object name="SpriteEmitter39" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.1000000
		FadeInEndTime=0.0360000
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=30.0000000),Y=(Min=20.0000000,Max=30.0000000),Z=(Min=20.0000000,Max=30.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		StartVelocityRange=(X=(Min=-80.0000000,Max=80.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=100.0000000,Max=200.0000000))
		VelocityLossRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=4.0000000,Max=4.0000000),Z=(Min=4.0000000,Max=4.0000000))
	end object
	Emitters[3]=SpriteEmitter39
	// Reference: SpriteEmitter'BallisticProV55.IE_BulletWater.SpriteEmitter40'
	begin object name="SpriteEmitter40" class=Engine.SpriteEmitter
		UseDirectionAs=4
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=5))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=5))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.2250000
		FadeInEndTime=0.0600000
		MaxParticles=5
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=5.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
		StartSizeRange=(X=(Min=3.0000000,Max=8.0000000),Y=(Min=2.0000000,Max=5.0000000),Z=(Min=2.0000000,Max=5.0000000))
		InitialParticlesPerSecond=8.0000000
		DrawStyle=2
		Texture=Texture'BW_Core_WeaponTex.Particles.RippleA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=1.2000000)
		StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[4]=SpriteEmitter40
	// Reference: SpriteEmitter'BallisticProV55.IE_BulletWater.SpriteEmitter41'
	begin object name="SpriteEmitter41" class=Engine.SpriteEmitter
		UseDirectionAs=1
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.9000000,Max=1.0000000))
		FadeOutStartTime=0.1800000
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=8.0000000,Max=12.0000000),Y=(Min=8.0000000,Max=12.0000000),Z=(Min=8.0000000,Max=12.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1Alpha'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=400.0000000))
	end object
	Emitters[5]=SpriteEmitter41
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.IE_BulletWater.MeshEmitter18'
begin object name="MeshEmitter18" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.VolumetricA4'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-150.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=200,G=225,B=255,A=128))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=200,G=225,B=255,A=128))
	Opacity=0.9600000
	FadeOutStartTime=0.0240000
	FadeInEndTime=0.0160000
	MaxParticles=1
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=2.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=0.7000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=0.7000000,Max=1.5000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=10.0000000,Max=10.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_BulletWater.SpriteEmitter36'
begin object name="SpriteEmitter36" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.2200000
	FadeInEndTime=0.0200000
	CoordinateSystem=1
	MaxParticles=50
	StartLocationRange=(X=(Min=-1000.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
	InitialParticlesPerSecond=9999999.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaBubble1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-100.0000000,Max=0.0000000),Y=(Min=-8.0000000,Max=8.0000000),Z=(Min=-8.0000000,Max=8.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_BulletWater.SpriteEmitter37'
begin object name="SpriteEmitter37" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=40.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.9700000
	FadeOutStartTime=0.7300000
	FadeInEndTime=0.0600000
	MaxParticles=5
	StartLocationRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-4.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=5.0000000),Y=(Min=2.0000000,Max=5.0000000),Z=(Min=2.0000000,Max=5.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaBubble1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-40.0000000,Max=-10.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_BulletWater.SpriteEmitter39'
begin object name="SpriteEmitter39" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.1000000
	FadeInEndTime=0.0360000
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=30.0000000),Y=(Min=20.0000000,Max=30.0000000),Z=(Min=20.0000000,Max=30.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	StartVelocityRange=(X=(Min=-80.0000000,Max=80.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=100.0000000,Max=200.0000000))
	VelocityLossRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=4.0000000,Max=4.0000000),Z=(Min=4.0000000,Max=4.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_BulletWater.SpriteEmitter40'
begin object name="SpriteEmitter40" class=Engine.SpriteEmitter
	UseDirectionAs=4
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=5))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=5))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.2250000
	FadeInEndTime=0.0600000
	MaxParticles=5
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=5.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
	StartSizeRange=(X=(Min=3.0000000,Max=8.0000000),Y=(Min=2.0000000,Max=5.0000000),Z=(Min=2.0000000,Max=5.0000000))
	InitialParticlesPerSecond=8.0000000
	DrawStyle=2
	Texture=Texture'BW_Core_WeaponTex.Particles.RippleA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=1.2000000)
	StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_BulletWater.SpriteEmitter41'
begin object name="SpriteEmitter41" class=Engine.SpriteEmitter
	UseDirectionAs=1
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.9000000,Max=1.0000000))
	FadeOutStartTime=0.1800000
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=8.0000000,Max=12.0000000),Y=(Min=8.0000000,Max=12.0000000),Z=(Min=8.0000000,Max=12.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1Alpha'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=400.0000000))
end object
