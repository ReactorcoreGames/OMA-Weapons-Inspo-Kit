class IE_A73GeneralBal extends DGVEmitter;

simulated event PreBeginPlay()
{
	// End:0x2D
	if(int(Level.DetailMode) < int(2))
	{
		Emitters[2].Disabled = true;
	}
	// End:0x59
	if(int(Level.DetailMode) < int(1))
	{
		Emitters[0].Disabled = true;
	}
	// End:0xC0
	if(!FastTrace(Location + (Vector(Rotation) * float(8)), Level.GetLocalPlayerController().ViewTarget.Location))
	{
		SetLocation(Location + (Vector(Rotation) * float(8)));
		Emitters[1].ZTest = true;
	}
	super(Actor).PreBeginPlay();
	//return;	
}

defaultproperties
{
	DisableDGV[0]=0
	DisableDGV[1]=1
	// Reference: SpriteEmitter'BallisticProV55.IE_A73GeneralBal.SpriteEmitter12'
	begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
		UseCollision=true
		UseMaxCollisions=true
		UseColorScale=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=200,G=32,B=200,A=0))
		MaxParticles=12
		StartSizeRange=(X=(Min=2.0000000,Max=3.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=100.0000000
		Texture=Texture'BW_Core_WeaponTex.A73PurpleLayout.A73MuzzleFlash'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SubdivisionStart=1
		SubdivisionEnd=1
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=200.0000000),Y=(Min=-70.0000000,Max=70.0000000),Z=(Min=-100.0000000,Max=300.0000000))
	end object
	Emitters[0]=SpriteEmitter12
	// Reference: SpriteEmitter'BallisticProV55.IE_A73GeneralBal.SpriteEmitter13'
	begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		ZTest=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.3428570,Color=(R=255,G=192,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=128,A=0))
		FadeOutStartTime=0.0900000
		FadeInEndTime=0.0900000
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.2000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=0.7000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.4000000)
		StartSizeRange=(X=(Min=20.0000000,Max=30.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=100000.0000000
		Texture=Texture'BW_Core_WeaponTex.A73PurpleLayout.A73MuzzleFlash'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SubdivisionStart=1
		SubdivisionEnd=1
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
	end object
	Emitters[1]=SpriteEmitter13
	// Reference: SpriteEmitter'BallisticProV55.IE_A73GeneralBal.SpriteEmitter14'
	begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=255,B=255,A=192))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=64))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.2000000,Max=0.3000000))
		FadeOutStartTime=1.0000000
		FadeInEndTime=0.1500000
		MaxParticles=45
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.6100000,RelativeSize=0.3000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=5.0000000,Max=20.0000000),Y=(Min=5.0000000,Max=20.0000000),Z=(Min=5.0000000,Max=20.0000000))
		InitialParticlesPerSecond=20.0000000
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.7500000,Max=2.2500000)
		StartVelocityRange=(X=(Min=10.0000000,Max=50.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		VelocityLossRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	end object
	Emitters[2]=SpriteEmitter14
	// Reference: SpriteEmitter'BallisticProV55.IE_A73GeneralBal.SpriteEmitter15'
	begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
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
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-150.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.4678570,Color=(R=255,G=64,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		FadeOutStartTime=0.0280000
		MaxParticles=8
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3500000,Max=0.3500000)
		StartVelocityRange=(X=(Min=50.0000000,Max=250.0000000),Y=(Min=-250.0000000,Max=250.0000000),Z=(Min=-50.0000000,Max=350.0000000))
	end object
	Emitters[3]=SpriteEmitter15
	// Reference: BeamEmitter'BallisticProV55.IE_A73GeneralBal.BeamEmitter4'
	begin object name="BeamEmitter4" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=5.0000000,Max=8.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
		HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3285710,Color=(R=255,G=96,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=0,A=255))
		FadeOutStartTime=0.0600000
		MaxParticles=8
		DetailMode=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3500000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=0.7500000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=6.0000000,Max=10.0000000),Y=(Min=6.0000000,Max=10.0000000),Z=(Min=6.0000000,Max=10.0000000))
		InitialParticlesPerSecond=30.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.3500000)
		StartVelocityRange=(X=(Min=4.0000000,Max=20.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
	end object
	Emitters[4]=BeamEmitter4
	// Reference: SpriteEmitter'BallisticProV55.IE_A73GeneralBal.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseCollision=true
		UseMaxCollisions=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=128,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.3857140,Color=(R=255,G=64,B=255,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=96,B=0,A=255))
		FadeOutStartTime=0.5000000
		MaxParticles=8
		DetailMode=1
		StartLocationRange=(X=(Min=-35.0000000,Max=35.0000000),Y=(Min=-35.0000000,Max=35.0000000),Z=(Min=2.0000000,Max=3.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=8.0000000,Max=12.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=600.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=150.0000000),Y=(Min=-175.0000000,Max=175.0000000),Z=(Min=-175.0000000,Max=175.0000000))
	end object
	Emitters[5]=SpriteEmitter3
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.IE_A73GeneralBal.SpriteEmitter12'
begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
	UseCollision=true
	UseMaxCollisions=true
	UseColorScale=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=200,G=32,B=200,A=0))
	MaxParticles=12
	StartSizeRange=(X=(Min=2.0000000,Max=3.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=100.0000000
	Texture=Texture'BW_Core_WeaponTex.A73PurpleLayout.A73MuzzleFlash'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SubdivisionStart=1
	SubdivisionEnd=1
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=200.0000000),Y=(Min=-70.0000000,Max=70.0000000),Z=(Min=-100.0000000,Max=300.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_A73GeneralBal.SpriteEmitter13'
begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	ZTest=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.3428570,Color=(R=255,G=192,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=128,A=0))
	FadeOutStartTime=0.0900000
	FadeInEndTime=0.0900000
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.2000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=0.7000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.4000000)
	StartSizeRange=(X=(Min=20.0000000,Max=30.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=100000.0000000
	Texture=Texture'BW_Core_WeaponTex.A73PurpleLayout.A73MuzzleFlash'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SubdivisionStart=1
	SubdivisionEnd=1
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.IE_A73GeneralBal.SpriteEmitter14'
begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=255,B=255,A=192))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=64))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.2000000,Max=0.3000000))
	FadeOutStartTime=1.0000000
	FadeInEndTime=0.1500000
	MaxParticles=45
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.6100000,RelativeSize=0.3000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=5.0000000,Max=20.0000000),Y=(Min=5.0000000,Max=20.0000000),Z=(Min=5.0000000,Max=20.0000000))
	InitialParticlesPerSecond=20.0000000
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.7500000,Max=2.2500000)
	StartVelocityRange=(X=(Min=10.0000000,Max=50.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	VelocityLossRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_A73GeneralBal.SpriteEmitter15'
begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
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
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-150.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.4678570,Color=(R=255,G=64,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	FadeOutStartTime=0.0280000
	MaxParticles=8
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3500000,Max=0.3500000)
	StartVelocityRange=(X=(Min=50.0000000,Max=250.0000000),Y=(Min=-250.0000000,Max=250.0000000),Z=(Min=-50.0000000,Max=350.0000000))
end object
// Reference: BeamEmitter'BallisticProV55.IE_A73GeneralBal.BeamEmitter4'
begin object name="BeamEmitter4" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=5.0000000,Max=8.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3285710,Color=(R=255,G=96,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=0,A=255))
	FadeOutStartTime=0.0600000
	MaxParticles=8
	DetailMode=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3500000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=0.7500000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=6.0000000,Max=10.0000000),Y=(Min=6.0000000,Max=10.0000000),Z=(Min=6.0000000,Max=10.0000000))
	InitialParticlesPerSecond=30.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.3500000)
	StartVelocityRange=(X=(Min=4.0000000,Max=20.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_A73GeneralBal.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseCollision=true
	UseMaxCollisions=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=128,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.3857140,Color=(R=255,G=64,B=255,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=96,B=0,A=255))
	FadeOutStartTime=0.5000000
	MaxParticles=8
	DetailMode=1
	StartLocationRange=(X=(Min=-35.0000000,Max=35.0000000),Y=(Min=-35.0000000,Max=35.0000000),Z=(Min=2.0000000,Max=3.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=8.0000000,Max=12.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=600.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=150.0000000),Y=(Min=-175.0000000,Max=175.0000000),Z=(Min=-175.0000000,Max=175.0000000))
end object
