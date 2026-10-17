class IE_BulletHE extends DGVEmitterOversize;

simulated event PreBeginPlay()
{
	// End:0x55
	if(int(Level.DetailMode) < int(1))
	{
		Emitters[2].Disabled = true;
		Emitters[4].Disabled = true;
		Emitters[5].Disabled = true;
	}
	// End:0x8E
	if(PhysicsVolume.bWaterVolume)
	{
		Emitters[0].Disabled = true;
		Emitters[2].Disabled = true;
	}
	super(Actor).PreBeginPlay();
	//return;	
}

defaultproperties
{
	DisableDGV[0]=1
	DisableDGV[1]=1
	DisableDGV[2]=1
	// Reference: SpriteEmitter'BWBP_APC_Pro.IE_BulletHE.SpriteEmitter11'
	begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-20.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		Opacity=0.7000000
		FadeOutStartTime=0.6100000
		MaxParticles=3
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.3400000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=45.0000000),Y=(Min=20.0000000,Max=45.0000000),Z=(Min=20.0000000,Max=45.0000000))
		InitialParticlesPerSecond=10000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=60.0000000,Max=100.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-5.0000000,Max=20.0000000))
		VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
	end object
	Emitters[0]=SpriteEmitter11
	// Reference: SpriteEmitter'BWBP_APC_Pro.IE_BulletHE.SpriteEmitter12'
	begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
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
	Emitters[1]=SpriteEmitter12
	// Reference: SpriteEmitter'BWBP_APC_Pro.IE_BulletHE.SpriteEmitter13'
	begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=128,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=0,A=0))
		ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.7000000,Max=0.8000000),Z=(Min=0.4000000,Max=0.5000000))
		FadeOutStartTime=1.0000000
		FadeInEndTime=0.0750000
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=2.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=10000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
	end object
	Emitters[2]=SpriteEmitter13
	// Reference: SpriteEmitter'BWBP_APC_Pro.IE_BulletHE.SpriteEmitter14'
	begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.2142860,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.3464290,Color=(R=255,G=255,B=255,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=254,B=255,A=255))
		ColorMultiplierRange=(X=(Min=5.5000000,Max=0.6000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.4000000,Max=0.4000000))
		Opacity=0.7000000
		FadeOutStartTime=0.1500000
		MaxParticles=5
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.4500000,Max=0.5500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.2000000)
		StartSizeRange=(X=(Min=6.0000000,Max=6.0000000),Y=(Min=6.0000000,Max=6.0000000),Z=(Min=6.0000000,Max=6.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
	end object
	Emitters[3]=SpriteEmitter14
	// Reference: SpriteEmitter'BWBP_APC_Pro.IE_BulletHE.SpriteEmitter16'
	begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=55,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.7000000,Max=0.8000000))
		FadeOutStartTime=0.0630000
		MaxParticles=15
		DetailMode=1
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=16.0000000,Max=32.0000000),Y=(Min=16.0000000,Max=32.0000000),Z=(Min=16.0000000,Max=32.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1500000,Max=0.1500000)
		StartVelocityRange=(X=(Min=0.0000000,Max=900.0000000),Y=(Min=-750.0000000,Max=750.0000000),Z=(Min=-700.0000000,Max=700.0000000))
	end object
	Emitters[4]=SpriteEmitter16
	// Reference: SpriteEmitter'BWBP_APC_Pro.IE_BulletHE.SpriteEmitter17'
	begin object name="SpriteEmitter17" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.4000000,Max=0.4000000))
		Opacity=0.5800000
		FadeOutStartTime=0.1150000
		FadeInEndTime=0.0350000
		MaxParticles=3
		DetailMode=2
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=20.0000000,Max=80.0000000),Y=(Min=20.0000000,Max=80.0000000),Z=(Min=20.0000000,Max=80.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
		TextureUSubdivisions=1
		TextureVSubdivisions=1
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.5000000)
		StartVelocityRadialRange=(Min=-20.0000000,Max=1.0000000)
	end object
	Emitters[5]=SpriteEmitter17
	// Reference: SpriteEmitter'BWBP_APC_Pro.IE_BulletHE.SpriteEmitter18'
	begin object name="SpriteEmitter18" class=Engine.SpriteEmitter
		UseDirectionAs=3
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=55,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.7000000,Max=0.8000000))
		FadeOutStartTime=0.0630000
		MaxParticles=3
		DetailMode=1
		UseRotationFrom=2
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=4.0000000),Z=(Min=2.0000000,Max=4.0000000))
		InitialParticlesPerSecond=20.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		TextureUSubdivisions=1
		TextureVSubdivisions=1
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1500000,Max=0.1500000)
		StartVelocityRange=(X=(Min=700.0000000,Max=900.0000000),Y=(Min=-750.0000000,Max=750.0000000),Z=(Min=0.0000000,Max=700.0000000))
	end object
	Emitters[6]=SpriteEmitter18
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_APC_Pro.IE_BulletHE.SpriteEmitter11'
begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-20.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	Opacity=0.7000000
	FadeOutStartTime=0.6100000
	MaxParticles=3
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.3400000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=45.0000000),Y=(Min=20.0000000,Max=45.0000000),Z=(Min=20.0000000,Max=45.0000000))
	InitialParticlesPerSecond=10000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=60.0000000,Max=100.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-5.0000000,Max=20.0000000))
	VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
end object
// Reference: SpriteEmitter'BWBP_APC_Pro.IE_BulletHE.SpriteEmitter12'
begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
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
// Reference: SpriteEmitter'BWBP_APC_Pro.IE_BulletHE.SpriteEmitter13'
begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=128,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=0,A=0))
	ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.7000000,Max=0.8000000),Z=(Min=0.4000000,Max=0.5000000))
	FadeOutStartTime=1.0000000
	FadeInEndTime=0.0750000
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=2.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=10000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
end object
// Reference: SpriteEmitter'BWBP_APC_Pro.IE_BulletHE.SpriteEmitter14'
begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.2142860,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.3464290,Color=(R=255,G=255,B=255,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=254,B=255,A=255))
	ColorMultiplierRange=(X=(Min=5.5000000,Max=0.6000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.4000000,Max=0.4000000))
	Opacity=0.7000000
	FadeOutStartTime=0.1500000
	MaxParticles=5
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.4500000,Max=0.5500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.2000000)
	StartSizeRange=(X=(Min=6.0000000,Max=6.0000000),Y=(Min=6.0000000,Max=6.0000000),Z=(Min=6.0000000,Max=6.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
end object
// Reference: SpriteEmitter'BWBP_APC_Pro.IE_BulletHE.SpriteEmitter16'
begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=55,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.7000000,Max=0.8000000))
	FadeOutStartTime=0.0630000
	MaxParticles=15
	DetailMode=1
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=16.0000000,Max=32.0000000),Y=(Min=16.0000000,Max=32.0000000),Z=(Min=16.0000000,Max=32.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1500000,Max=0.1500000)
	StartVelocityRange=(X=(Min=0.0000000,Max=900.0000000),Y=(Min=-750.0000000,Max=750.0000000),Z=(Min=-700.0000000,Max=700.0000000))
end object
// Reference: SpriteEmitter'BWBP_APC_Pro.IE_BulletHE.SpriteEmitter17'
begin object name="SpriteEmitter17" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.4000000,Max=0.4000000))
	Opacity=0.5800000
	FadeOutStartTime=0.1150000
	FadeInEndTime=0.0350000
	MaxParticles=3
	DetailMode=2
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=20.0000000,Max=80.0000000),Y=(Min=20.0000000,Max=80.0000000),Z=(Min=20.0000000,Max=80.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
	TextureUSubdivisions=1
	TextureVSubdivisions=1
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.5000000)
	StartVelocityRadialRange=(Min=-20.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BWBP_APC_Pro.IE_BulletHE.SpriteEmitter18'
begin object name="SpriteEmitter18" class=Engine.SpriteEmitter
	UseDirectionAs=3
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=55,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.7000000,Max=0.8000000))
	FadeOutStartTime=0.0630000
	MaxParticles=3
	DetailMode=1
	UseRotationFrom=2
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=4.0000000),Z=(Min=2.0000000,Max=4.0000000))
	InitialParticlesPerSecond=20.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	TextureUSubdivisions=1
	TextureVSubdivisions=1
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1500000,Max=0.1500000)
	StartVelocityRange=(X=(Min=700.0000000,Max=900.0000000),Y=(Min=-750.0000000,Max=750.0000000),Z=(Min=0.0000000,Max=700.0000000))
end object
