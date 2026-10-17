class IE_SlugHE extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	bDynamicLight = true;
	SetTimer(0.2000000, false);
	//return;	
}

simulated event PreBeginPlay()
{
	// End:0x2D
	if(int(Level.DetailMode) < int(2))
	{
		Emitters[3].Disabled = true;
	}
	// End:0x6E
	if(int(Level.DetailMode) < int(1))
	{
		Emitters[6].Disabled = true;
		Emitters[7].Disabled = true;
	}
	super(Actor).PreBeginPlay();
	//return;	
}

simulated event Timer()
{
	super(Actor).Timer();
	bDynamicLight = false;
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SlugHE.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=128,A=0))
		ColorScale[1]=(RelativeTime=0.1142860,Color=(R=255,G=255,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.3142860,Color=(R=0,G=0,B=255,A=255))
		ColorScale[3]=(RelativeTime=0.5714290,Color=(R=255,G=255,B=255,A=255))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=0,A=0))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.4600000
		FadeOutStartTime=0.2970000
		FadeInEndTime=0.0660000
		CoordinateSystem=1
		MaxParticles=2
		DetailMode=1
		StartLocationOffset=(X=2.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=64.0000000,Max=64.0000000),Y=(Min=64.0000000,Max=64.0000000),Z=(Min=64.0000000,Max=64.0000000))
		InitialParticlesPerSecond=10000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5010000,Max=0.5010000)
	end object
	Emitters[0]=SpriteEmitter6
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SlugHE.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.3000000,Max=0.5000000))
		Opacity=0.5800000
		FadeOutStartTime=0.1150000
		FadeInEndTime=0.0350000
		CoordinateSystem=1
		MaxParticles=3
		DetailMode=2
		StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=0.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=150.0000000),Y=(Min=10.0000000,Max=150.0000000),Z=(Min=10.0000000,Max=150.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.4000000)
	end object
	Emitters[1]=SpriteEmitter7
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SlugHE.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=100,G=100,B=100,A=255))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=100,G=100,B=100,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=255))
		Opacity=0.3600000
		FadeOutStartTime=0.5700000
		FadeInEndTime=0.1400000
		MaxParticles=5
		StartLocationShape=1
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	end object
	Emitters[2]=SpriteEmitter8
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SlugHE.SpriteEmitter34'
	begin object name="SpriteEmitter34" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2607140,Color=(R=255,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.5428570,Color=(R=255,G=255,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
		FadeOutStartTime=0.2000000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[3]=SpriteEmitter34
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SlugHE.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7000000,Max=0.7000000),Z=(Min=0.4000000,Max=0.4000000))
		Opacity=0.6000000
		FadeOutStartTime=0.1000000
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'XEffects.Skins.MuzFlashA_t'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[4]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SlugHE.SpriteEmitter19'
	begin object name="SpriteEmitter19" class=Engine.SpriteEmitter
		UseCollision=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ExtentMultiplier=(X=0.3000000,Y=0.3000000,Z=0.3000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.7000000,Max=0.7000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.7000000,Max=0.8000000),Z=(Min=0.1000000,Max=0.2000000))
		Opacity=0.6300000
		FadeOutStartTime=0.0500000
		MaxParticles=9
		AddLocationFromOtherEmitter=5
		AlphaRef=128
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=20.0000000,Max=30.0000000),Y=(Min=20.0000000,Max=30.0000000),Z=(Min=20.0000000,Max=30.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.0500000,Max=0.0500000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-100.0000000,Max=0.0000000))
		VelocityLossRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.4000000))
		AddVelocityFromOtherEmitter=5
	end object
	Emitters[5]=SpriteEmitter19
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SlugHE.SpriteEmitter20'
	begin object name="SpriteEmitter20" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.2071430,Color=(R=255,G=128,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.3607140,Color=(R=0,G=0,B=0,A=255))
		ColorScale[3]=(RelativeTime=0.8892860,Color=(R=0,G=0,B=0,A=255))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.6500000
		FadeOutStartTime=0.1320000
		CoordinateSystem=1
		MaxParticles=4
		DetailMode=2
		StartLocationOffset=(X=2.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-18.0000000,Max=18.0000000),Z=(Min=-13.0000000,Max=13.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=8.0000000,Max=25.0000000),Y=(Min=8.0000000,Max=25.0000000),Z=(Min=8.0000000,Max=25.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.1000000,Max=0.9000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=60.0000000))
	end object
	Emitters[6]=SpriteEmitter20
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SlugHE.SpriteEmitter21'
	begin object name="SpriteEmitter21" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.2071430,Color=(R=255,G=128,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.3571430,Color=(R=255,G=255,B=0,A=255))
		ColorScale[3]=(RelativeTime=0.8892860,Color=(R=255,G=0,B=0,A=255))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.9000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.3000000))
		FadeOutStartTime=0.1320000
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=2
		StartLocationOffset=(X=2.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
		SpinCCWorCW=(X=0.0000000,Y=0.5000000,Z=0.5000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2900000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=25.0000000,Max=45.0000000),Y=(Min=25.0000000,Max=45.0000000),Z=(Min=25.0000000,Max=45.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		TextureUSubdivisions=1
		TextureVSubdivisions=1
		LifetimeRange=(Min=0.1000000,Max=0.8000000)
	end object
	Emitters[7]=SpriteEmitter21
	AutoDestroy=true
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=16.0000000
	LightPeriod=3
	bUnlit=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SlugHE.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=128,A=0))
	ColorScale[1]=(RelativeTime=0.1142860,Color=(R=255,G=255,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.3142860,Color=(R=0,G=0,B=255,A=255))
	ColorScale[3]=(RelativeTime=0.5714290,Color=(R=255,G=255,B=255,A=255))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=0,A=0))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.4600000
	FadeOutStartTime=0.2970000
	FadeInEndTime=0.0660000
	CoordinateSystem=1
	MaxParticles=2
	DetailMode=1
	StartLocationOffset=(X=2.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=64.0000000,Max=64.0000000),Y=(Min=64.0000000,Max=64.0000000),Z=(Min=64.0000000,Max=64.0000000))
	InitialParticlesPerSecond=10000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5010000,Max=0.5010000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SlugHE.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.3000000,Max=0.5000000))
	Opacity=0.5800000
	FadeOutStartTime=0.1150000
	FadeInEndTime=0.0350000
	CoordinateSystem=1
	MaxParticles=3
	DetailMode=2
	StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=0.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=150.0000000),Y=(Min=10.0000000,Max=150.0000000),Z=(Min=10.0000000,Max=150.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.4000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SlugHE.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=100,G=100,B=100,A=255))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=100,G=100,B=100,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=255))
	Opacity=0.3600000
	FadeOutStartTime=0.5700000
	FadeInEndTime=0.1400000
	MaxParticles=5
	StartLocationShape=1
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SlugHE.SpriteEmitter34'
begin object name="SpriteEmitter34" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2607140,Color=(R=255,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.5428570,Color=(R=255,G=255,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
	FadeOutStartTime=0.2000000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SlugHE.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7000000,Max=0.7000000),Z=(Min=0.4000000,Max=0.4000000))
	Opacity=0.6000000
	FadeOutStartTime=0.1000000
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'XEffects.Skins.MuzFlashA_t'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SlugHE.SpriteEmitter19'
begin object name="SpriteEmitter19" class=Engine.SpriteEmitter
	UseCollision=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ExtentMultiplier=(X=0.3000000,Y=0.3000000,Z=0.3000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.7000000,Max=0.7000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.7000000,Max=0.8000000),Z=(Min=0.1000000,Max=0.2000000))
	Opacity=0.6300000
	FadeOutStartTime=0.0500000
	MaxParticles=9
	AddLocationFromOtherEmitter=5
	AlphaRef=128
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=20.0000000,Max=30.0000000),Y=(Min=20.0000000,Max=30.0000000),Z=(Min=20.0000000,Max=30.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.0500000,Max=0.0500000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-100.0000000,Max=0.0000000))
	VelocityLossRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.4000000))
	AddVelocityFromOtherEmitter=5
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SlugHE.SpriteEmitter20'
begin object name="SpriteEmitter20" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.2071430,Color=(R=255,G=128,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.3607140,Color=(R=0,G=0,B=0,A=255))
	ColorScale[3]=(RelativeTime=0.8892860,Color=(R=0,G=0,B=0,A=255))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.6500000
	FadeOutStartTime=0.1320000
	CoordinateSystem=1
	MaxParticles=4
	DetailMode=2
	StartLocationOffset=(X=2.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-18.0000000,Max=18.0000000),Z=(Min=-13.0000000,Max=13.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=8.0000000,Max=25.0000000),Y=(Min=8.0000000,Max=25.0000000),Z=(Min=8.0000000,Max=25.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.1000000,Max=0.9000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=60.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SlugHE.SpriteEmitter21'
begin object name="SpriteEmitter21" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.2071430,Color=(R=255,G=128,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.3571430,Color=(R=255,G=255,B=0,A=255))
	ColorScale[3]=(RelativeTime=0.8892860,Color=(R=255,G=0,B=0,A=255))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.9000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.3000000))
	FadeOutStartTime=0.1320000
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=2
	StartLocationOffset=(X=2.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
	SpinCCWorCW=(X=0.0000000,Y=0.5000000,Z=0.5000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2900000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=25.0000000,Max=45.0000000),Y=(Min=25.0000000,Max=45.0000000),Z=(Min=25.0000000,Max=45.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	TextureUSubdivisions=1
	TextureVSubdivisions=1
	LifetimeRange=(Min=0.1000000,Max=0.8000000)
end object
