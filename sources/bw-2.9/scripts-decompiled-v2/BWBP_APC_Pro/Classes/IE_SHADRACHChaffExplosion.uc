class IE_SHADRACHChaffExplosion extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	bDynamicLight = true;
	SetTimer(0.2000000, false);
	//return;	
}

simulated event PreBeginPlay()
{
	// End:0x55
	if(int(Level.DetailMode) < int(2))
	{
		Emitters[3].Disabled = true;
		Emitters[5].Disabled = true;
		Emitters[7].Disabled = true;
	}
	// End:0x95
	if(int(Level.DetailMode) < int(1))
	{
		Emitters[1].Disabled = true;
		Emitters[2].Disabled = true;
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
	// Reference: SpriteEmitter'BWBP_APC_Pro.IE_SHADRACHChaffExplosion.SpriteEmitter56'
	begin object name="SpriteEmitter56" class=Engine.SpriteEmitter
		UseCollision=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=70.0000000)
		ExtentMultiplier=(X=0.4000000,Y=0.4000000,Z=0.4000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=225,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.0321430,Color=(R=255,G=192,B=128,A=255))
		ColorScale[2]=(RelativeTime=0.0964290,Color=(R=128,G=64,B=0,A=255))
		ColorScale[3]=(RelativeTime=0.1142860,Color=(R=128,G=75,B=0,A=255))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=200,G=200,B=0,A=255))
		Opacity=0.2000000
		FadeOutStartTime=2.1200000
		MaxParticles=15
		StartLocationShape=1
		SphereRadiusRange=(Min=10.0000000,Max=20.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		SizeScale[3]=(RelativeTime=0.3700000,RelativeSize=0.9000000)
		SizeScale[4]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=70.0000000,Max=84.0000000),Y=(Min=70.0000000,Max=84.0000000),Z=(Min=70.0000000,Max=84.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=6.0000000,Max=6.0000000)
		StartVelocityRadialRange=(Min=-500.0000000,Max=-300.0000000)
		VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=4.0000000,Max=4.0000000))
		GetVelocityDirectionFrom=3
	end object
	Emitters[0]=SpriteEmitter56
	// Reference: SpriteEmitter'BWBP_APC_Pro.IE_SHADRACHChaffExplosion.SpriteEmitter57'
	begin object name="SpriteEmitter57" class=Engine.SpriteEmitter
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
		ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
		FadeOutStartTime=0.2000000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=140.0000000,Max=140.0000000),Y=(Min=70.0000000,Max=70.0000000),Z=(Min=70.0000000,Max=70.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[1]=SpriteEmitter57
	// Reference: SpriteEmitter'BWBP_APC_Pro.IE_SHADRACHChaffExplosion.SpriteEmitter76'
	begin object name="SpriteEmitter76" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
		FadeOutStartTime=0.2000000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=140.0000000,Max=140.0000000),Y=(Min=70.0000000,Max=70.0000000),Z=(Min=70.0000000,Max=70.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[2]=SpriteEmitter76
	// Reference: SpriteEmitter'BWBP_APC_Pro.IE_SHADRACHChaffExplosion.SpriteEmitter77'
	begin object name="SpriteEmitter77" class=Engine.SpriteEmitter
		UseCollision=true
		UseMaxCollisions=true
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		ExtentMultiplier=(X=0.7000000,Y=0.7000000,Z=0.7000000)
		DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=0))
		FadeOutStartTime=1.1200000
		MaxParticles=50
		StartLocationShape=1
		SphereRadiusRange=(Min=10.0000000,Max=20.0000000)
		StartSizeRange=(X=(Min=2.5000000,Max=5.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=50.0000000,Max=150.0000000))
		StartVelocityRadialRange=(Min=-560.0000000,Max=-350.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[3]=SpriteEmitter77
	// Reference: SpriteEmitter'BWBP_APC_Pro.IE_SHADRACHChaffExplosion.SpriteEmitter79'
	begin object name="SpriteEmitter79" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.4000000
		FadeOutStartTime=0.1000000
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=70.0000000,Max=70.0000000),Z=(Min=70.0000000,Max=70.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'XEffects.WispSmoke_t'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[4]=SpriteEmitter79
	// Reference: SpriteEmitter'BWBP_APC_Pro.IE_SHADRACHChaffExplosion.SpriteEmitter80'
	begin object name="SpriteEmitter80" class=Engine.SpriteEmitter
		UseCollision=true
		UseMaxCollisions=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-0.5000000)
		ExtentMultiplier=(X=0.7000000,Y=0.7000000,Z=0.7000000)
		DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=1.1200000
		MaxParticles=50
		StartLocationShape=1
		SphereRadiusRange=(Min=100.0000000,Max=200.0000000)
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=2.5000000,Max=5.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		TextureUSubdivisions=1
		TextureVSubdivisions=1
		SubdivisionStart=1
		SubdivisionEnd=1
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=8.0000000,Max=8.0000000)
		StartVelocityRange=(X=(Min=-35.0000000,Max=35.0000000),Y=(Min=-35.0000000,Max=35.0000000),Z=(Min=-35.0000000,Max=35.0000000))
		StartVelocityRadialRange=(Min=-80.0000000,Max=-50.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[5]=SpriteEmitter80
	// Reference: SpriteEmitter'BWBP_APC_Pro.IE_SHADRACHChaffExplosion.SpriteEmitter82'
	begin object name="SpriteEmitter82" class=Engine.SpriteEmitter
		UseCollision=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=35.0000000)
		ExtentMultiplier=(X=0.4000000,Y=0.4000000,Z=0.4000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=225,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.0321430,Color=(R=200,G=142,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.0642860,Color=(R=128,G=100,B=0,A=255))
		ColorScale[3]=(RelativeTime=0.1142860,Color=(R=128,G=100,B=0,A=255))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=75,G=50,B=0,A=255))
		Opacity=0.2000000
		FadeOutStartTime=2.1200000
		MaxParticles=30
		StartLocationShape=1
		SphereRadiusRange=(Min=10.0000000,Max=20.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		SizeScale[3]=(RelativeTime=0.3700000,RelativeSize=0.9000000)
		SizeScale[4]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=70.0000000,Max=119.0000000),Y=(Min=70.0000000,Max=119.0000000),Z=(Min=70.0000000,Max=119.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=12.0000000,Max=12.0000000)
		StartVelocityRange=(X=(Min=-35.0000000,Max=35.0000000),Y=(Min=-35.0000000,Max=35.0000000),Z=(Min=-35.0000000,Max=35.0000000))
		StartVelocityRadialRange=(Min=-560.0000000,Max=-350.0000000)
		VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=4.0000000,Max=4.0000000))
		GetVelocityDirectionFrom=3
	end object
	Emitters[6]=SpriteEmitter82
	AutoDestroy=true
	LightType=7
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=32.0000000
	LightPeriod=3
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_APC_Pro.IE_SHADRACHChaffExplosion.SpriteEmitter56'
begin object name="SpriteEmitter56" class=Engine.SpriteEmitter
	UseCollision=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=70.0000000)
	ExtentMultiplier=(X=0.4000000,Y=0.4000000,Z=0.4000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=225,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.0321430,Color=(R=255,G=192,B=128,A=255))
	ColorScale[2]=(RelativeTime=0.0964290,Color=(R=128,G=64,B=0,A=255))
	ColorScale[3]=(RelativeTime=0.1142860,Color=(R=128,G=75,B=0,A=255))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=200,G=200,B=0,A=255))
	Opacity=0.2000000
	FadeOutStartTime=2.1200000
	MaxParticles=15
	StartLocationShape=1
	SphereRadiusRange=(Min=10.0000000,Max=20.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	SizeScale[3]=(RelativeTime=0.3700000,RelativeSize=0.9000000)
	SizeScale[4]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=70.0000000,Max=84.0000000),Y=(Min=70.0000000,Max=84.0000000),Z=(Min=70.0000000,Max=84.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=6.0000000,Max=6.0000000)
	StartVelocityRadialRange=(Min=-500.0000000,Max=-300.0000000)
	VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=4.0000000,Max=4.0000000))
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_APC_Pro.IE_SHADRACHChaffExplosion.SpriteEmitter57'
begin object name="SpriteEmitter57" class=Engine.SpriteEmitter
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
	ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
	FadeOutStartTime=0.2000000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=140.0000000,Max=140.0000000),Y=(Min=70.0000000,Max=70.0000000),Z=(Min=70.0000000,Max=70.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBP_APC_Pro.IE_SHADRACHChaffExplosion.SpriteEmitter76'
begin object name="SpriteEmitter76" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
	FadeOutStartTime=0.2000000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=140.0000000,Max=140.0000000),Y=(Min=70.0000000,Max=70.0000000),Z=(Min=70.0000000,Max=70.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBP_APC_Pro.IE_SHADRACHChaffExplosion.SpriteEmitter77'
begin object name="SpriteEmitter77" class=Engine.SpriteEmitter
	UseCollision=true
	UseMaxCollisions=true
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	ExtentMultiplier=(X=0.7000000,Y=0.7000000,Z=0.7000000)
	DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=0))
	FadeOutStartTime=1.1200000
	MaxParticles=50
	StartLocationShape=1
	SphereRadiusRange=(Min=10.0000000,Max=20.0000000)
	StartSizeRange=(X=(Min=2.5000000,Max=5.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=50.0000000,Max=150.0000000))
	StartVelocityRadialRange=(Min=-560.0000000,Max=-350.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_APC_Pro.IE_SHADRACHChaffExplosion.SpriteEmitter79'
begin object name="SpriteEmitter79" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.4000000
	FadeOutStartTime=0.1000000
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=70.0000000,Max=70.0000000),Z=(Min=70.0000000,Max=70.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'XEffects.WispSmoke_t'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBP_APC_Pro.IE_SHADRACHChaffExplosion.SpriteEmitter80'
begin object name="SpriteEmitter80" class=Engine.SpriteEmitter
	UseCollision=true
	UseMaxCollisions=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-0.5000000)
	ExtentMultiplier=(X=0.7000000,Y=0.7000000,Z=0.7000000)
	DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=1.1200000
	MaxParticles=50
	StartLocationShape=1
	SphereRadiusRange=(Min=100.0000000,Max=200.0000000)
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=2.5000000,Max=5.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	TextureUSubdivisions=1
	TextureVSubdivisions=1
	SubdivisionStart=1
	SubdivisionEnd=1
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=8.0000000,Max=8.0000000)
	StartVelocityRange=(X=(Min=-35.0000000,Max=35.0000000),Y=(Min=-35.0000000,Max=35.0000000),Z=(Min=-35.0000000,Max=35.0000000))
	StartVelocityRadialRange=(Min=-80.0000000,Max=-50.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_APC_Pro.IE_SHADRACHChaffExplosion.SpriteEmitter82'
begin object name="SpriteEmitter82" class=Engine.SpriteEmitter
	UseCollision=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=35.0000000)
	ExtentMultiplier=(X=0.4000000,Y=0.4000000,Z=0.4000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=225,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.0321430,Color=(R=200,G=142,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.0642860,Color=(R=128,G=100,B=0,A=255))
	ColorScale[3]=(RelativeTime=0.1142860,Color=(R=128,G=100,B=0,A=255))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=75,G=50,B=0,A=255))
	Opacity=0.2000000
	FadeOutStartTime=2.1200000
	MaxParticles=30
	StartLocationShape=1
	SphereRadiusRange=(Min=10.0000000,Max=20.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	SizeScale[3]=(RelativeTime=0.3700000,RelativeSize=0.9000000)
	SizeScale[4]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=70.0000000,Max=119.0000000),Y=(Min=70.0000000,Max=119.0000000),Z=(Min=70.0000000,Max=119.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=12.0000000,Max=12.0000000)
	StartVelocityRange=(X=(Min=-35.0000000,Max=35.0000000),Y=(Min=-35.0000000,Max=35.0000000),Z=(Min=-35.0000000,Max=35.0000000))
	StartVelocityRadialRange=(Min=-560.0000000,Max=-350.0000000)
	VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=4.0000000,Max=4.0000000))
	GetVelocityDirectionFrom=3
end object
