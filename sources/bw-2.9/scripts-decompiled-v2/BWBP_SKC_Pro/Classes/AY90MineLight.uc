class AY90MineLight extends BallisticEmitter;

simulated event BaseChange()
{
	// End:0x0E
	if(Base == none)
	{
		Destroy();
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.AY90MineLight.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.4000000
		FadeOutStartTime=1.3000000
		FadeInEndTime=1.3000000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=9.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		InitialParticlesPerSecond=100.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_SKC_Pro.AY90MineLight.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=255,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		FadeInEndTime=0.2500000
		CoordinateSystem=1
		MaxParticles=40
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=7.0000000,Max=7.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ParticlesPerSecond=4.0000000
		Texture=Texture'AW-2004Particles.Energy.AirBlast'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		InitialDelayRange=(Min=0.3000000,Max=0.3000000)
	end object
	Emitters[1]=SpriteEmitter2
	// Reference: SpriteEmitter'BWBP_SKC_Pro.AY90MineLight.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.7500000,Color=(R=0,G=0,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.2500000
		CoordinateSystem=1
		MaxParticles=40
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=17.0000000,Max=17.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ParticlesPerSecond=4.0000000
		Texture=Texture'AW-2004Particles.Energy.EclipseCircle'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		InitialDelayRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[2]=SpriteEmitter3
	// Reference: SpriteEmitter'BWBP_SKC_Pro.AY90MineLight.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		FadeOut=true
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-1500.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.9200000
		StartLocationShape=1
		SphereRadiusRange=(Min=0.0000000,Max=25.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
		Texture=Texture'BW_Core_WeaponTex.GunFire.A73MuzzleFlash'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SubdivisionStart=1
		SubdivisionEnd=1
		LifetimeRange=(Min=0.4010000,Max=0.4010000)
		StartVelocityRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=-150.0000000,Max=150.0000000))
	end object
	Emitters[3]=SpriteEmitter5
	// Reference: SpriteEmitter'BWBP_SKC_Pro.AY90MineLight.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=192,A=0))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=160,G=192,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=255,B=192,A=0))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
		Opacity=0.5500000
		FadeOutStartTime=0.3000000
		CoordinateSystem=1
		MaxParticles=1
		StartSizeRange=(X=(Min=40.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1500000,Max=0.3000000)
	end object
	Emitters[4]=SpriteEmitter4
	LightType=1
	LightEffect=21
	LightHue=192
	LightSaturation=200
	LightBrightness=200.0000000
	LightRadius=5.0000000
	CullDistance=3072.0000000
	bDynamicLight=true
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.AY90MineLight.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.4000000
	FadeOutStartTime=1.3000000
	FadeInEndTime=1.3000000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=9.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	InitialParticlesPerSecond=100.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.AY90MineLight.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=255,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	FadeInEndTime=0.2500000
	CoordinateSystem=1
	MaxParticles=40
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=7.0000000,Max=7.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ParticlesPerSecond=4.0000000
	Texture=Texture'AW-2004Particles.Energy.AirBlast'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	InitialDelayRange=(Min=0.3000000,Max=0.3000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.AY90MineLight.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.7500000,Color=(R=0,G=0,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.2500000
	CoordinateSystem=1
	MaxParticles=40
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=17.0000000,Max=17.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ParticlesPerSecond=4.0000000
	Texture=Texture'AW-2004Particles.Energy.EclipseCircle'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	InitialDelayRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.AY90MineLight.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	FadeOut=true
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-1500.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.9200000
	StartLocationShape=1
	SphereRadiusRange=(Min=0.0000000,Max=25.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
	Texture=Texture'BW_Core_WeaponTex.GunFire.A73MuzzleFlash'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SubdivisionStart=1
	SubdivisionEnd=1
	LifetimeRange=(Min=0.4010000,Max=0.4010000)
	StartVelocityRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=-150.0000000,Max=150.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.AY90MineLight.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=192,A=0))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=160,G=192,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=255,B=192,A=0))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
	Opacity=0.5500000
	FadeOutStartTime=0.3000000
	CoordinateSystem=1
	MaxParticles=1
	StartSizeRange=(X=(Min=40.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1500000,Max=0.3000000)
end object
