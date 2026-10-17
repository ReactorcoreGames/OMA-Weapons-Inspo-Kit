class IE_BulletExpWood extends DGVEmitter;

simulated event PreBeginPlay()
{
	// End:0x2C
	if(int(Level.DetailMode) < int(1))
	{
		Emitters[1].Disabled = true;
	}
	// End:0xEC
	if(PhysicsVolume.bWaterVolume)
	{
		Emitters[0].Disabled = true;
		Emitters[1].Acceleration.Z = 50.0000000;
		Emitters[1].VelocityLossRange.X.Min = 1.0000000;
		Emitters[1].VelocityLossRange.X.Max = 1.0000000;
		Emitters[1].VelocityLossRange.Y.Min = 1.0000000;
		Emitters[1].VelocityLossRange.Y.Max = 1.0000000;
	}
	super(Actor).PreBeginPlay();
	//return;	
}

defaultproperties
{
	DisableDGV[0]=0
	DisableDGV[1]=0
	DisableDGV[2]=1
	DisableDGV[3]=1
	bModifyLossRange=false
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpWood.SpriteEmitter42'
	begin object name="SpriteEmitter42" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=32,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
		ColorMultiplierRange=(X=(Min=0.7000000,Max=0.7000000),Y=(Min=0.6500000,Max=0.6500000),Z=(Min=0.5000000,Max=0.5000000))
		Opacity=0.7600000
		FadeOutStartTime=0.3900000
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=25.0000000,Max=30.0000000),Y=(Min=25.0000000,Max=30.0000000),Z=(Min=25.0000000,Max=30.0000000))
		InitialParticlesPerSecond=10000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=30.0000000,Max=60.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
		VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
	end object
	Emitters[0]=SpriteEmitter42
	// Reference: MeshEmitter'BWBP_SKC_Pro.IE_BulletExpWood.MeshEmitter19'
	begin object name="MeshEmitter19" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.WoodChipA1'
		UseParticleColor=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.9000000,Max=0.9000000))
		FadeOutStartTime=0.4270000
		DetailMode=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=3.0000000),Z=(Min=0.0000000,Max=3.0000000))
		StartSizeRange=(X=(Min=0.0400000,Max=0.1000000),Y=(Min=0.7000000,Max=0.7000000),Z=(Min=0.7000000,Max=0.7000000))
		InitialParticlesPerSecond=10000.0000000
		DrawStyle=1
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7000000,Max=0.7000000)
		StartVelocityRange=(X=(Min=20.0000000,Max=200.0000000),Y=(Min=-60.0000000,Max=60.0000000),Z=(Min=-40.0000000,Max=120.0000000))
		VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	end object
	Emitters[1]=MeshEmitter19
	// Reference: MeshEmitter'BWBP_SKC_Pro.IE_BulletExpWood.MeshEmitter20'
	begin object name="MeshEmitter20" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.WoodImpactHoleA1'
		UseParticleColor=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=2.6800000
		FadeInEndTime=0.2400000
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=2
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-0.0800000,Max=0.0800000))
		StartSizeRange=(X=(Min=0.1000000,Max=0.1500000),Y=(Min=0.0800000,Max=0.1000000),Z=(Min=0.0800000,Max=0.1000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=4.0000000)
	end object
	Emitters[2]=MeshEmitter20
	// Reference: MeshEmitter'BWBP_SKC_Pro.IE_BulletExpWood.MeshEmitter21'
	begin object name="MeshEmitter21" class=Engine.MeshEmitter
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
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.7000000,Max=0.7000000))
		FadeOutStartTime=0.0750000
		CoordinateSystem=1
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.1800000,RelativeSize=0.7000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=0.5000000,Max=0.6000000),Y=(Min=0.9000000,Max=1.0000000),Z=(Min=0.9000000,Max=1.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[3]=MeshEmitter21
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpWood.SpriteEmitter12'
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
	Emitters[4]=SpriteEmitter12
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpWood.SpriteEmitter14'
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
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[5]=SpriteEmitter14
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpWood.SpriteEmitter42'
begin object name="SpriteEmitter42" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=128,B=32,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
	ColorMultiplierRange=(X=(Min=0.7000000,Max=0.7000000),Y=(Min=0.6500000,Max=0.6500000),Z=(Min=0.5000000,Max=0.5000000))
	Opacity=0.7600000
	FadeOutStartTime=0.3900000
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=25.0000000,Max=30.0000000),Y=(Min=25.0000000,Max=30.0000000),Z=(Min=25.0000000,Max=30.0000000))
	InitialParticlesPerSecond=10000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=30.0000000,Max=60.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
	VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
end object
// Reference: MeshEmitter'BWBP_SKC_Pro.IE_BulletExpWood.MeshEmitter19'
begin object name="MeshEmitter19" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.WoodChipA1'
	UseParticleColor=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.9000000,Max=0.9000000))
	FadeOutStartTime=0.4270000
	DetailMode=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=3.0000000),Z=(Min=0.0000000,Max=3.0000000))
	StartSizeRange=(X=(Min=0.0400000,Max=0.1000000),Y=(Min=0.7000000,Max=0.7000000),Z=(Min=0.7000000,Max=0.7000000))
	InitialParticlesPerSecond=10000.0000000
	DrawStyle=1
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7000000,Max=0.7000000)
	StartVelocityRange=(X=(Min=20.0000000,Max=200.0000000),Y=(Min=-60.0000000,Max=60.0000000),Z=(Min=-40.0000000,Max=120.0000000))
	VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
end object
// Reference: MeshEmitter'BWBP_SKC_Pro.IE_BulletExpWood.MeshEmitter20'
begin object name="MeshEmitter20" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.WoodImpactHoleA1'
	UseParticleColor=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=2.6800000
	FadeInEndTime=0.2400000
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=2
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-0.0800000,Max=0.0800000))
	StartSizeRange=(X=(Min=0.1000000,Max=0.1500000),Y=(Min=0.0800000,Max=0.1000000),Z=(Min=0.0800000,Max=0.1000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=4.0000000)
end object
// Reference: MeshEmitter'BWBP_SKC_Pro.IE_BulletExpWood.MeshEmitter21'
begin object name="MeshEmitter21" class=Engine.MeshEmitter
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
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.7000000,Max=0.7000000))
	FadeOutStartTime=0.0750000
	CoordinateSystem=1
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.1800000,RelativeSize=0.7000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=0.5000000,Max=0.6000000),Y=(Min=0.9000000,Max=1.0000000),Z=(Min=0.9000000,Max=1.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpWood.SpriteEmitter12'
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
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpWood.SpriteEmitter14'
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
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
