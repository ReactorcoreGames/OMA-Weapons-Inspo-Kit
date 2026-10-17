class IE_A500EBlastImpact extends DGVEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	bDynamicLight = true;
	SetTimer(0.2000000, false);
	//return;	
}

simulated event Timer()
{
	super.Timer();
	bDynamicLight = false;
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.IE_A500EBlastImpact.SpriteEmitter44'
	begin object name="SpriteEmitter44" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=-25.0000000,Y=-50.0000000,Z=-50.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.2071430,Color=(R=255,G=96,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=96,B=0,A=255))
		FadeOutStartTime=0.4950000
		MaxParticles=4
		StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=3.2500000),Y=(Min=2.0000000,Max=3.2500000),Z=(Min=2.0000000,Max=3.2500000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaBubbleA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=50.0000000,Max=400.0000000),Y=(Min=-250.0000000,Max=250.0000000),Z=(Min=-250.0000000,Max=250.0000000))
		VelocityLossRange=(X=(Min=2.0000000,Max=3.0000000),Y=(Min=2.0000000,Max=3.0000000),Z=(Min=2.0000000,Max=3.0000000))
	end object
	Emitters[0]=SpriteEmitter44
	// Reference: SpriteEmitter'BallisticProV55.IE_A500EBlastImpact.SpriteEmitter45'
	begin object name="SpriteEmitter45" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.5214290,Color=(R=255,G=128,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=170,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.1375000
		FadeInEndTime=0.0750000
		MaxParticles=40
		AddLocationFromOtherEmitter=0
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=3.0000000,Max=6.0000000),Y=(Min=4.0000000,Max=15.0000000),Z=(Min=3.0000000,Max=6.0000000))
		InitialParticlesPerSecond=60.0000000
		Texture=Texture'BW_Core_WeaponTex.Reptile.AcidDrops01'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2500000,Max=0.2500000)
		VelocityLossRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
		AddVelocityFromOtherEmitter=0
		AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
	end object
	Emitters[1]=SpriteEmitter45
	// Reference: SpriteEmitter'BallisticProV55.IE_A500EBlastImpact.SpriteEmitter46'
	begin object name="SpriteEmitter46" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.2357140,Color=(R=255,G=128,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		FadeOutStartTime=0.1160000
		FadeInEndTime=0.0360000
		MaxParticles=2
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.2500000)
		StartSizeRange=(X=(Min=20.0000000,Max=35.0000000),Y=(Min=20.0000000,Max=35.0000000),Z=(Min=20.0000000,Max=35.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Reptile.AcidSplash01'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=20.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=-25.0000000,Max=25.0000000))
	end object
	Emitters[2]=SpriteEmitter46
	// Reference: SpriteEmitter'BallisticProV55.IE_A500EBlastImpact.SpriteEmitter18'
	begin object name="SpriteEmitter18" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.5214290,Color=(R=255,G=128,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=170,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.2160000
		FadeInEndTime=0.0180000
		MaxParticles=25
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=3.0000000,Max=4.0000000),Y=(Min=4.0000000,Max=10.0000000),Z=(Min=3.0000000,Max=4.0000000))
		InitialParticlesPerSecond=500000.0000000
		Texture=Texture'BW_Core_WeaponTex.Reptile.AcidDrops01'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=50.0000000,Max=200.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=-150.0000000,Max=150.0000000))
		VelocityLossRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
		AddVelocityFromOtherEmitter=0
		AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
	end object
	Emitters[3]=SpriteEmitter18
	AutoDestroy=true
	LightType=2
	LightEffect=13
	LightHue=54
	LightSaturation=100
	LightBrightness=150.0000000
	LightRadius=8.0000000
	LightPeriod=3
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.IE_A500EBlastImpact.SpriteEmitter44'
begin object name="SpriteEmitter44" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=-25.0000000,Y=-50.0000000,Z=-50.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.2071430,Color=(R=255,G=96,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=96,B=0,A=255))
	FadeOutStartTime=0.4950000
	MaxParticles=4
	StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=3.2500000),Y=(Min=2.0000000,Max=3.2500000),Z=(Min=2.0000000,Max=3.2500000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaBubbleA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=50.0000000,Max=400.0000000),Y=(Min=-250.0000000,Max=250.0000000),Z=(Min=-250.0000000,Max=250.0000000))
	VelocityLossRange=(X=(Min=2.0000000,Max=3.0000000),Y=(Min=2.0000000,Max=3.0000000),Z=(Min=2.0000000,Max=3.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_A500EBlastImpact.SpriteEmitter45'
begin object name="SpriteEmitter45" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.5214290,Color=(R=255,G=128,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=170,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.1375000
	FadeInEndTime=0.0750000
	MaxParticles=40
	AddLocationFromOtherEmitter=0
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=3.0000000,Max=6.0000000),Y=(Min=4.0000000,Max=15.0000000),Z=(Min=3.0000000,Max=6.0000000))
	InitialParticlesPerSecond=60.0000000
	Texture=Texture'BW_Core_WeaponTex.Reptile.AcidDrops01'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2500000,Max=0.2500000)
	VelocityLossRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
	AddVelocityFromOtherEmitter=0
	AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_A500EBlastImpact.SpriteEmitter46'
begin object name="SpriteEmitter46" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.2357140,Color=(R=255,G=128,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	FadeOutStartTime=0.1160000
	FadeInEndTime=0.0360000
	MaxParticles=2
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.2500000)
	StartSizeRange=(X=(Min=20.0000000,Max=35.0000000),Y=(Min=20.0000000,Max=35.0000000),Z=(Min=20.0000000,Max=35.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Reptile.AcidSplash01'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=20.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=-25.0000000,Max=25.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_A500EBlastImpact.SpriteEmitter18'
begin object name="SpriteEmitter18" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.5214290,Color=(R=255,G=128,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=170,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.2160000
	FadeInEndTime=0.0180000
	MaxParticles=25
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=3.0000000,Max=4.0000000),Y=(Min=4.0000000,Max=10.0000000),Z=(Min=3.0000000,Max=4.0000000))
	InitialParticlesPerSecond=500000.0000000
	Texture=Texture'BW_Core_WeaponTex.Reptile.AcidDrops01'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=50.0000000,Max=200.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=-150.0000000,Max=150.0000000))
	VelocityLossRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
	AddVelocityFromOtherEmitter=0
	AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
end object
