class IE_IncBulletGrass extends DGVEmitter;

simulated event PostBeginPlay()
{
	// End:0x1CF
	if(PhysicsVolume.bWaterVolume)
	{
		Emitters[1].Acceleration.Z = 50.0000000;
		Emitters[1].VelocityLossRange.X.Min = 0.5000000;
		Emitters[1].VelocityLossRange.X.Max = 0.5000000;
		Emitters[1].VelocityLossRange.Y.Min = 0.5000000;
		Emitters[1].VelocityLossRange.Y.Max = 0.5000000;
		Emitters[1].VelocityLossRange.Z.Min = 0.5000000;
		Emitters[1].VelocityLossRange.Z.Max = 0.5000000;
		Emitters[2].Acceleration.Z = 50.0000000;
		Emitters[2].VelocityLossRange.X.Min = 1.0000000;
		Emitters[2].VelocityLossRange.X.Max = 1.0000000;
		Emitters[2].VelocityLossRange.Y.Min = 1.0000000;
		Emitters[2].VelocityLossRange.Y.Max = 1.0000000;
		Emitters[2].VelocityLossRange.Z.Min = 1.0000000;
		Emitters[2].VelocityLossRange.Z.Max = 1.0000000;
	}
	super.PostBeginPlay();
	//return;	
}

defaultproperties
{
	DisableDGV[0]=0
	DisableDGV[1]=1
	bModifyLossRange=false
	Emitters[0]=SpriteEmitter'BallisticProV55.IE_BulletGrass.SpriteEmitter30'
	Emitters[1]=MeshEmitter'BallisticProV55.IE_BulletGrass.MeshEmitter15'
	Emitters[2]=SpriteEmitter'BallisticProV55.IE_BulletGrass.SpriteEmitter31'
	// Reference: SpriteEmitter'BallisticProV55.IE_IncBulletGrass.SpriteEmitter12'
	begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-5.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.2200000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.3500000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=254,B=255,A=255))
		ColorMultiplierRange=(X=(Min=5.5000000,Max=0.6000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.4000000,Max=0.4000000))
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
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[3]=SpriteEmitter12
	// Reference: SpriteEmitter'BallisticProV55.IE_IncBulletGrass.SpriteEmitter14'
	begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.2000000,Max=0.2000000))
		FadeOutStartTime=0.1000000
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=6.5000000,Max=6.5000000),Y=(Min=6.5000000,Max=6.5000000),Z=(Min=6.5000000,Max=6.5000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[4]=SpriteEmitter14
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.IE_IncBulletGrass.SpriteEmitter12'
begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-5.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.2200000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.3500000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=254,B=255,A=255))
	ColorMultiplierRange=(X=(Min=5.5000000,Max=0.6000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.4000000,Max=0.4000000))
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
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.IE_IncBulletGrass.SpriteEmitter14'
begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.2000000,Max=0.2000000))
	FadeOutStartTime=0.1000000
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=6.5000000,Max=6.5000000),Y=(Min=6.5000000,Max=6.5000000),Z=(Min=6.5000000,Max=6.5000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
