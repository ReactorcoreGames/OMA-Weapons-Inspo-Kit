class IE_BulletSand extends DGVEmitter;

simulated event PostBeginPlay()
{
	// End:0x101
	if(PhysicsVolume.bWaterVolume)
	{
		Emitters[2].Disabled = true;
		Emitters[1].Acceleration.Z = 20.0000000;
		Emitters[1].VelocityLossRange.X.Min = 2.0000000;
		Emitters[1].VelocityLossRange.X.Max = 2.0000000;
		Emitters[1].VelocityLossRange.Y.Min = 2.0000000;
		Emitters[1].VelocityLossRange.Y.Max = 2.0000000;
		Emitters[1].VelocityLossRange.Z.Min = 2.0000000;
		Emitters[1].VelocityLossRange.Z.Max = 2.0000000;
	}
	super.PostBeginPlay();
	//return;	
}

defaultproperties
{
	DisableDGV[0]=1
	// Reference: MeshEmitter'BallisticProV55.IE_BulletSand.MeshEmitter6'
	begin object name="MeshEmitter6" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.VolumetricA3'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=96,B=64,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=96,B=64,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutFactor=(W=1.0000000,X=1.5000000,Y=1.2000000,Z=1.0000000)
		FadeOutStartTime=0.4320000
		CoordinateSystem=1
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.1400000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=0.3700000,RelativeSize=1.8000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
		StartSizeRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.5000000,Max=0.5000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.2000000,Max=1.2000000)
	end object
	Emitters[0]=MeshEmitter6
	// Reference: SpriteEmitter'BallisticProV55.IE_BulletSand.SpriteEmitter30'
	begin object name="SpriteEmitter30" class=Engine.SpriteEmitter
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
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=96,B=64,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=111,B=64,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.4000000,Max=0.4000000))
		FadeOutStartTime=0.7350000
		FadeInEndTime=0.1350000
		MaxParticles=30
		DetailMode=2
		AlphaRef=64
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=5.0000000,Max=8.0000000),Y=(Min=5.0000000,Max=8.0000000),Z=(Min=5.0000000,Max=8.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.FlamePartsAlpha'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
		StartVelocityRange=(X=(Min=50.0000000,Max=180.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
	end object
	Emitters[1]=SpriteEmitter30
	// Reference: SpriteEmitter'BallisticProV55.IE_BulletSand.SpriteEmitter31'
	begin object name="SpriteEmitter31" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-5.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=140,B=96,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=192,G=140,B=96,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
		Opacity=0.7600000
		FadeOutFactor=(W=1.0000000,X=1.5000000,Y=1.2000000,Z=1.0000000)
		FadeOutStartTime=1.0800000
		FadeInEndTime=0.6000000
		MaxParticles=8
		StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=20.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	end object
	Emitters[2]=SpriteEmitter31
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.IE_BulletSand.MeshEmitter6'
begin object name="MeshEmitter6" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.VolumetricA3'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=96,B=64,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=96,B=64,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutFactor=(W=1.0000000,X=1.5000000,Y=1.2000000,Z=1.0000000)
	FadeOutStartTime=0.4320000
	CoordinateSystem=1
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.1400000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=0.3700000,RelativeSize=1.8000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
	StartSizeRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.5000000,Max=0.5000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.2000000,Max=1.2000000)
end object
// Reference: SpriteEmitter'BallisticProV55.IE_BulletSand.SpriteEmitter30'
begin object name="SpriteEmitter30" class=Engine.SpriteEmitter
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
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=96,B=64,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=111,B=64,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.4000000,Max=0.4000000))
	FadeOutStartTime=0.7350000
	FadeInEndTime=0.1350000
	MaxParticles=30
	DetailMode=2
	AlphaRef=64
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=5.0000000,Max=8.0000000),Y=(Min=5.0000000,Max=8.0000000),Z=(Min=5.0000000,Max=8.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.FlamePartsAlpha'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
	StartVelocityRange=(X=(Min=50.0000000,Max=180.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_BulletSand.SpriteEmitter31'
begin object name="SpriteEmitter31" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-5.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=140,B=96,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=192,G=140,B=96,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
	Opacity=0.7600000
	FadeOutFactor=(W=1.0000000,X=1.5000000,Y=1.2000000,Z=1.0000000)
	FadeOutStartTime=1.0800000
	FadeInEndTime=0.6000000
	MaxParticles=8
	StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=20.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
end object
