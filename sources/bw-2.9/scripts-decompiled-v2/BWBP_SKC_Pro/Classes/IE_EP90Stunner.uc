class IE_EP90Stunner extends BallisticEmitter;

simulated event PreBeginPlay()
{
	// End:0x50
	if(!FastTrace(Location + (Vector(Rotation) * float(8)), Level.GetLocalPlayerController().ViewTarget.Location))
	{
		Emitters[1].ZTest = true;
	}
	super(Actor).PreBeginPlay();
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_EP90Stunner.SpriteEmitter16'
	begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
		UseCollision=true
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		ExtentMultiplier=(X=0.4000000,Y=0.4000000,Z=0.4000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=225,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1142860,Color=(R=128,G=128,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=190,G=222,B=255,A=255))
		Opacity=0.1400000
		FadeOutStartTime=2.0800000
		FadeInEndTime=1.1200000
		MaxParticles=20
		StartLocationShape=1
		SphereRadiusRange=(Min=10.0000000,Max=20.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		SizeScale[3]=(RelativeTime=0.3700000,RelativeSize=0.9000000)
		SizeScale[4]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=100.0000000,Max=120.0000000),Y=(Min=100.0000000,Max=120.0000000),Z=(Min=100.0000000,Max=120.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1g'
		SecondsBeforeInactive=0.0000000
		StartVelocityRadialRange=(Min=-500.0000000,Max=-300.0000000)
		VelocityLossRange=(X=(Min=1.8000000,Max=1.8000000),Y=(Min=1.8000000,Max=1.8000000),Z=(Min=4.0000000,Max=4.0000000))
		GetVelocityDirectionFrom=3
	end object
	Emitters[0]=SpriteEmitter16
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_EP90Stunner.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.4000000),Z=(Min=0.2000000,Max=0.8000000))
		Opacity=0.4800000
		FadeOutStartTime=0.2760000
		MaxParticles=5
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=25.0000000)
		StartLocationRange=(X=(Min=-75.0000000,Max=75.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.2500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		InitialParticlesPerSecond=100.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[1]=SpriteEmitter5
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_EP90Stunner.SpriteEmitter23'
	begin object name="SpriteEmitter23" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		ScaleSizeYByVelocity=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.1178570,Color=(R=128,G=128,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
		Opacity=0.6800000
		FadeOutStartTime=0.2000000
		MaxParticles=120
		StartLocationRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
		AddLocationFromOtherEmitter=1
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=40.0000000,Max=50.0000000),Y=(Min=40.0000000,Max=50.0000000),Z=(Min=40.0000000,Max=50.0000000))
		ScaleSizeByVelocityMultiplier=(X=1.0000000,Y=0.0015000,Z=1.0000000)
		InitialParticlesPerSecond=120.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
		AddVelocityFromOtherEmitter=1
		AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1500000),Y=(Min=0.1000000,Max=0.1500000),Z=(Min=0.1000000,Max=0.1500000))
	end object
	Emitters[2]=SpriteEmitter23
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_EP90Stunner.SpriteEmitter17'
	begin object name="SpriteEmitter17" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.1100000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[3]=SpriteEmitter17
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_EP90Stunner.SpriteEmitter20'
	begin object name="SpriteEmitter20" class=Engine.SpriteEmitter
		UseDirectionAs=4
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.2000000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[4]=SpriteEmitter20
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_EP90Stunner.SpriteEmitter21'
	begin object name="SpriteEmitter21" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6700000,Max=0.6700000),Y=(Min=0.5700000,Max=0.5700000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.0525000
		MaxParticles=5
		StartLocationRange=(X=(Min=-80.0000000,Max=80.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=-80.0000000,Max=80.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.5600000,RelativeSize=4.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		InitialParticlesPerSecond=8.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2500000,Max=0.2500000)
	end object
	Emitters[5]=SpriteEmitter21
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_EP90Stunner.SpriteEmitter19'
	begin object name="SpriteEmitter19" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=122,G=122,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.1000000
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.5600000,RelativeSize=4.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[6]=SpriteEmitter19
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_EP90Stunner.SpriteEmitter16'
begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
	UseCollision=true
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	ExtentMultiplier=(X=0.4000000,Y=0.4000000,Z=0.4000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=225,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1142860,Color=(R=128,G=128,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=190,G=222,B=255,A=255))
	Opacity=0.1400000
	FadeOutStartTime=2.0800000
	FadeInEndTime=1.1200000
	MaxParticles=20
	StartLocationShape=1
	SphereRadiusRange=(Min=10.0000000,Max=20.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	SizeScale[3]=(RelativeTime=0.3700000,RelativeSize=0.9000000)
	SizeScale[4]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=100.0000000,Max=120.0000000),Y=(Min=100.0000000,Max=120.0000000),Z=(Min=100.0000000,Max=120.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1g'
	SecondsBeforeInactive=0.0000000
	StartVelocityRadialRange=(Min=-500.0000000,Max=-300.0000000)
	VelocityLossRange=(X=(Min=1.8000000,Max=1.8000000),Y=(Min=1.8000000,Max=1.8000000),Z=(Min=4.0000000,Max=4.0000000))
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_EP90Stunner.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.4000000),Z=(Min=0.2000000,Max=0.8000000))
	Opacity=0.4800000
	FadeOutStartTime=0.2760000
	MaxParticles=5
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=25.0000000)
	StartLocationRange=(X=(Min=-75.0000000,Max=75.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.2500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	InitialParticlesPerSecond=100.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_EP90Stunner.SpriteEmitter23'
begin object name="SpriteEmitter23" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	ScaleSizeYByVelocity=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.1178570,Color=(R=128,G=128,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
	Opacity=0.6800000
	FadeOutStartTime=0.2000000
	MaxParticles=120
	StartLocationRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
	AddLocationFromOtherEmitter=1
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=40.0000000,Max=50.0000000),Y=(Min=40.0000000,Max=50.0000000),Z=(Min=40.0000000,Max=50.0000000))
	ScaleSizeByVelocityMultiplier=(X=1.0000000,Y=0.0015000,Z=1.0000000)
	InitialParticlesPerSecond=120.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
	AddVelocityFromOtherEmitter=1
	AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1500000),Y=(Min=0.1000000,Max=0.1500000),Z=(Min=0.1000000,Max=0.1500000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_EP90Stunner.SpriteEmitter17'
begin object name="SpriteEmitter17" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.1100000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_EP90Stunner.SpriteEmitter20'
begin object name="SpriteEmitter20" class=Engine.SpriteEmitter
	UseDirectionAs=4
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.2000000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_EP90Stunner.SpriteEmitter21'
begin object name="SpriteEmitter21" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6700000,Max=0.6700000),Y=(Min=0.5700000,Max=0.5700000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.0525000
	MaxParticles=5
	StartLocationRange=(X=(Min=-80.0000000,Max=80.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=-80.0000000,Max=80.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.5600000,RelativeSize=4.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	InitialParticlesPerSecond=8.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2500000,Max=0.2500000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_EP90Stunner.SpriteEmitter19'
begin object name="SpriteEmitter19" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=122,G=122,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.1000000
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.5600000,RelativeSize=4.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
