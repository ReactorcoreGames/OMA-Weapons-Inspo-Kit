class IE_BulletConcrete extends DGVEmitter;

simulated event PostBeginPlay()
{
	// End:0xD8
	if(PhysicsVolume.bWaterVolume)
	{
		Emitters[0].Disabled = true;
		Emitters[1].Disabled = true;
		Emitters[2].Acceleration.Z = 50.0000000;
		Emitters[2].VelocityLossRange.X.Min = 1.0000000;
		Emitters[2].VelocityLossRange.X.Max = 1.0000000;
		Emitters[2].VelocityLossRange.Y.Min = 1.0000000;
		Emitters[2].VelocityLossRange.Y.Max = 1.0000000;
	}
	// End:0x115
	if(Vector(Rotation).Z > 0.5000000)
	{
		Emitters[1].Disabled = true;
		Emitters[3].Disabled = true;
	}
	super.PostBeginPlay();
	//return;	
}

defaultproperties
{
	DisableDGV[0]=0
	DisableDGV[1]=0
	DisableDGV[2]=0
	DisableDGV[3]=0
	DisableDGV[4]=1
	bModifyLossRange=false
	// Reference: SpriteEmitter'BallisticProV55.IE_BulletConcrete.SpriteEmitter27'
	begin object name="SpriteEmitter27" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-20.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=64,B=64,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=64,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.8000000,Max=0.8000000))
		Opacity=0.7600000
		FadeOutStartTime=0.4600000
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.3400000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=40.0000000),Y=(Min=20.0000000,Max=40.0000000),Z=(Min=20.0000000,Max=40.0000000))
		InitialParticlesPerSecond=10000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=60.0000000,Max=100.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-5.0000000,Max=20.0000000))
		VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
	end object
	Emitters[0]=SpriteEmitter27
	// Reference: SpriteEmitter'BallisticProV55.IE_BulletConcrete.SpriteEmitter28'
	begin object name="SpriteEmitter28" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=64,B=64,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=64,A=0))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.8000000,Max=0.8000000))
		Opacity=0.5400000
		FadeOutStartTime=0.5200000
		MaxParticles=25
		DetailMode=2
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=7.0000000,Max=8.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=30.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.2000000)
		StartVelocityRange=(X=(Min=2.0000000,Max=5.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=SpriteEmitter28
	// Reference: MeshEmitter'BallisticProV55.IE_BulletConcrete.MeshEmitter12'
	begin object name="MeshEmitter12" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip2'
		UseMeshBlendMode=false
		UseParticleColor=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=192,G=192,B=255,A=255))
		FadeOutStartTime=0.3120000
		MaxParticles=4
		SpinsPerSecondRange=(X=(Min=0.5000000,Max=3.0000000),Y=(Min=0.5000000,Max=3.0000000),Z=(Min=0.5000000,Max=3.0000000))
		StartSizeRange=(X=(Min=0.1000000,Max=0.2000000),Y=(Min=0.1000000,Max=0.2000000),Z=(Min=0.1000000,Max=0.2000000))
		InitialParticlesPerSecond=10000.0000000
		DrawStyle=1
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=50.0000000,Max=250.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-70.0000000,Max=150.0000000))
	end object
	Emitters[2]=MeshEmitter12
	// Reference: MeshEmitter'BallisticProV55.IE_BulletConcrete.MeshEmitter13'
	begin object name="MeshEmitter13" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip3'
		UseMeshBlendMode=false
		UseParticleColor=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=192,G=192,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.7000000,Max=0.7000000),Y=(Min=0.7000000,Max=0.7000000),Z=(Min=0.7000000,Max=0.7000000))
		FadeOutStartTime=0.7100000
		FadeInEndTime=0.1800000
		MaxParticles=3
		DetailMode=2
		StartLocationOffset=(X=-1.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-6.0000000,Max=6.0000000),Z=(Min=-6.0000000,Max=6.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.5000000))
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.4000000,Max=0.8000000),Z=(Min=0.4000000,Max=0.8000000))
		InitialParticlesPerSecond=10000.0000000
		DrawStyle=1
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=2.0000000,Max=20.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=0.0000000,Max=50.0000000))
	end object
	Emitters[3]=MeshEmitter13
	// Reference: MeshEmitter'BallisticProV55.IE_BulletConcrete.MeshEmitter14'
	begin object name="MeshEmitter14" class=Engine.MeshEmitter
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
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.0850000
		CoordinateSystem=1
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=0.6000000,Max=0.8000000),Y=(Min=1.5000000,Max=1.5000000),Z=(Min=1.5000000,Max=1.5000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
	end object
	Emitters[4]=MeshEmitter14
	// Reference: SpriteEmitter'BallisticProV55.IE_BulletConcrete.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3142860,Color=(R=255,G=224,B=64,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=16,A=255))
		FadeOutStartTime=0.0600000
		MaxParticles=3
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=5.0000000,Max=12.0000000),Y=(Min=5.0000000,Max=12.0000000),Z=(Min=5.0000000,Max=12.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=50.0000000,Max=300.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
	end object
	Emitters[5]=SpriteEmitter3
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.IE_BulletConcrete.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3142860,Color=(R=255,G=224,B=64,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=16,A=255))
	FadeOutStartTime=0.0600000
	MaxParticles=3
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=5.0000000,Max=12.0000000),Y=(Min=5.0000000,Max=12.0000000),Z=(Min=5.0000000,Max=12.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=50.0000000,Max=300.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
end object
// Reference: MeshEmitter'BallisticProV55.IE_BulletConcrete.MeshEmitter14'
begin object name="MeshEmitter14" class=Engine.MeshEmitter
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
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.0850000
	CoordinateSystem=1
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=0.6000000,Max=0.8000000),Y=(Min=1.5000000,Max=1.5000000),Z=(Min=1.5000000,Max=1.5000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
end object
// Reference: SpriteEmitter'BallisticProV55.IE_BulletConcrete.SpriteEmitter27'
begin object name="SpriteEmitter27" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-20.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=64,B=64,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=64,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.8000000,Max=0.8000000))
	Opacity=0.7600000
	FadeOutStartTime=0.4600000
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.3400000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=40.0000000),Y=(Min=20.0000000,Max=40.0000000),Z=(Min=20.0000000,Max=40.0000000))
	InitialParticlesPerSecond=10000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=60.0000000,Max=100.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-5.0000000,Max=20.0000000))
	VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_BulletConcrete.SpriteEmitter28'
begin object name="SpriteEmitter28" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=64,B=64,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=64,A=0))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.8000000,Max=0.8000000))
	Opacity=0.5400000
	FadeOutStartTime=0.5200000
	MaxParticles=25
	DetailMode=2
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=7.0000000,Max=8.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=30.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.2000000)
	StartVelocityRange=(X=(Min=2.0000000,Max=5.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: MeshEmitter'BallisticProV55.IE_BulletConcrete.MeshEmitter12'
begin object name="MeshEmitter12" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip2'
	UseMeshBlendMode=false
	UseParticleColor=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=192,G=192,B=255,A=255))
	FadeOutStartTime=0.3120000
	MaxParticles=4
	SpinsPerSecondRange=(X=(Min=0.5000000,Max=3.0000000),Y=(Min=0.5000000,Max=3.0000000),Z=(Min=0.5000000,Max=3.0000000))
	StartSizeRange=(X=(Min=0.1000000,Max=0.2000000),Y=(Min=0.1000000,Max=0.2000000),Z=(Min=0.1000000,Max=0.2000000))
	InitialParticlesPerSecond=10000.0000000
	DrawStyle=1
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=50.0000000,Max=250.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-70.0000000,Max=150.0000000))
end object
// Reference: MeshEmitter'BallisticProV55.IE_BulletConcrete.MeshEmitter13'
begin object name="MeshEmitter13" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip3'
	UseMeshBlendMode=false
	UseParticleColor=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=192,G=192,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.7000000,Max=0.7000000),Y=(Min=0.7000000,Max=0.7000000),Z=(Min=0.7000000,Max=0.7000000))
	FadeOutStartTime=0.7100000
	FadeInEndTime=0.1800000
	MaxParticles=3
	DetailMode=2
	StartLocationOffset=(X=-1.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-6.0000000,Max=6.0000000),Z=(Min=-6.0000000,Max=6.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.3000000),Z=(Min=0.0000000,Max=0.5000000))
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.4000000,Max=0.8000000),Z=(Min=0.4000000,Max=0.8000000))
	InitialParticlesPerSecond=10000.0000000
	DrawStyle=1
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=2.0000000,Max=20.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=0.0000000,Max=50.0000000))
end object
