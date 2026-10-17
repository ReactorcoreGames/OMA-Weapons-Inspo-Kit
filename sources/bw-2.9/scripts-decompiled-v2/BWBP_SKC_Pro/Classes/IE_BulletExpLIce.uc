class IE_BulletExpLIce extends DGVEmitter;

defaultproperties
{
	// Reference: MeshEmitter'BWBP_SKC_Pro.IE_BulletExpLIce.MeshEmitter3'
	begin object name="MeshEmitter3" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.Ice1'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=2.7500000
		MaxParticles=25
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=2.0000000))
		StartSizeRange=(X=(Min=0.1000000,Max=0.4000000),Y=(Min=0.1000000,Max=0.4000000),Z=(Min=0.1000000,Max=0.4000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=0
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=150.0000000,Max=250.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
	end object
	Emitters[0]=MeshEmitter3
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpLIce.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.1600000
		FadeOutStartTime=2.1000000
		FadeInEndTime=0.1200000
		StartSizeRange=(X=(Min=8.0000000,Max=15.0000000),Y=(Min=8.0000000,Max=15.0000000),Z=(Min=8.0000000,Max=15.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=8.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	end object
	Emitters[1]=SpriteEmitter5
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpLIce.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.7600000
		FadeOutStartTime=1.3420000
		FadeInEndTime=0.1100000
		MaxParticles=20
		AlphaRef=128
		SpinsPerSecondRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=8.0000000,Max=16.0000000),Y=(Min=8.0000000,Max=16.0000000),Z=(Min=8.0000000,Max=16.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.FlamePartsAlpha'
		TextureUSubdivisions=5
		TextureVSubdivisions=5
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.2000000,Max=2.2000000)
		StartVelocityRange=(X=(Min=150.0000000,Max=300.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
	end object
	Emitters[2]=SpriteEmitter6
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpLIce.SpriteEmitter12'
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
		StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3500000,Max=0.3500000)
	end object
	Emitters[3]=SpriteEmitter12
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpLIce.SpriteEmitter14'
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
	Emitters[4]=SpriteEmitter14
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpLIce.SpriteEmitter15'
	begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
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
		StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1001000,Max=0.1001000)
	end object
	Emitters[5]=SpriteEmitter15
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpLIce.SpriteEmitter16'
	begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=225,G=176,B=30,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.0630000
		MaxParticles=50
		DetailMode=1
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=1.0000000,Max=5.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.BFG.BFGTrail'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3500000,Max=0.3500000)
		StartVelocityRange=(X=(Min=0.0000000,Max=900.0000000),Y=(Min=-750.0000000,Max=750.0000000),Z=(Min=-700.0000000,Max=700.0000000))
	end object
	Emitters[6]=SpriteEmitter16
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BWBP_SKC_Pro.IE_BulletExpLIce.MeshEmitter3'
begin object name="MeshEmitter3" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.Ice1'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=2.7500000
	MaxParticles=25
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=2.0000000))
	StartSizeRange=(X=(Min=0.1000000,Max=0.4000000),Y=(Min=0.1000000,Max=0.4000000),Z=(Min=0.1000000,Max=0.4000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=0
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=150.0000000,Max=250.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpLIce.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.1600000
	FadeOutStartTime=2.1000000
	FadeInEndTime=0.1200000
	StartSizeRange=(X=(Min=8.0000000,Max=15.0000000),Y=(Min=8.0000000,Max=15.0000000),Z=(Min=8.0000000,Max=15.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=8.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpLIce.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.7600000
	FadeOutStartTime=1.3420000
	FadeInEndTime=0.1100000
	MaxParticles=20
	AlphaRef=128
	SpinsPerSecondRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=8.0000000,Max=16.0000000),Y=(Min=8.0000000,Max=16.0000000),Z=(Min=8.0000000,Max=16.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.FlamePartsAlpha'
	TextureUSubdivisions=5
	TextureVSubdivisions=5
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.2000000,Max=2.2000000)
	StartVelocityRange=(X=(Min=150.0000000,Max=300.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpLIce.SpriteEmitter12'
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
	StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3500000,Max=0.3500000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpLIce.SpriteEmitter14'
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
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpLIce.SpriteEmitter15'
begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
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
	StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1001000,Max=0.1001000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_BulletExpLIce.SpriteEmitter16'
begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=225,G=176,B=30,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.0630000
	MaxParticles=50
	DetailMode=1
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=1.0000000,Max=5.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.BFG.BFGTrail'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3500000,Max=0.3500000)
	StartVelocityRange=(X=(Min=0.0000000,Max=900.0000000),Y=(Min=-750.0000000,Max=750.0000000),Z=(Min=-700.0000000,Max=700.0000000))
end object
