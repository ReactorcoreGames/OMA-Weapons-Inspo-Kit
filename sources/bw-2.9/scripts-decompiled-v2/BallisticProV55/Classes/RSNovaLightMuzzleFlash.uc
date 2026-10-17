class RSNovaLightMuzzleFlash extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x2A
	if(WeaponAttachment(Owner) != none)
	{
		Emitters[4].Disabled = true;
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.RSNovaLightMuzzleFlash.SpriteEmitter13'
	begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.7000000,Max=1.0000000))
		Opacity=0.7300000
		FadeOutStartTime=0.0625000
		FadeInEndTime=0.0300000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=30.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=140.0000000,Max=180.0000000),Y=(Min=140.0000000,Max=180.0000000),Z=(Min=140.0000000,Max=180.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.0800000,Max=0.2500000)
	end object
	Emitters[0]=SpriteEmitter13
	// Reference: BeamEmitter'BallisticProV55.RSNovaLightMuzzleFlash.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=100.0000000,Max=300.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-40.0000000,Max=40.0000000))
		HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		HighFrequencyPoints=8
		NoiseDeterminesEndPoint=true
		UseBranching=true
		BranchProbability=(Min=0.3000000,Max=0.5000000)
		BranchEmitter=2
		BranchSpawnAmountRange=(Min=1.0000000,Max=1.0000000)
		LinkupLifetime=true
		UseColorScale=true
		FadeOut=true
		UseSizeScale=true
		UseRegularSizeScale=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.4250000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
		FadeOutStartTime=0.0400000
		CoordinateSystem=1
		MaxParticles=4
		StartLocationOffset=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=10.0000000,Max=15.0000000),Z=(Min=10.0000000,Max=15.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		StartVelocityRange=(X=(Min=1.5000000,Max=2.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
	end object
	Emitters[1]=BeamEmitter0
	// Reference: BeamEmitter'BallisticProV55.RSNovaLightMuzzleFlash.BeamEmitter1'
	begin object name="BeamEmitter1" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=50.0000000,Max=100.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=-25.0000000,Max=25.0000000))
		HighFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		HighFrequencyPoints=7
		NoiseDeterminesEndPoint=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3178570,Color=(R=255,G=255,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
		FadeOutStartTime=0.0180000
		CoordinateSystem=1
		MaxParticles=8
		DetailMode=2
		StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=5.0000000,Max=8.0000000),Y=(Min=5.0000000,Max=8.0000000),Z=(Min=5.0000000,Max=8.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		StartVelocityRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
	end object
	Emitters[2]=BeamEmitter1
	// Reference: SpriteEmitter'BallisticProV55.RSNovaLightMuzzleFlash.SpriteEmitter14'
	begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=200,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=192,G=192,B=128,A=255))
		Opacity=0.9500000
		FadeOutStartTime=0.1500000
		FadeInEndTime=0.0600000
		CoordinateSystem=1
		MaxParticles=14
		StartLocationOffset=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[3]=SpriteEmitter14
	// Reference: SpriteEmitter'BallisticProV55.RSNovaLightMuzzleFlash.SpriteEmitter16'
	begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
		UseDirectionAs=3
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.5000000,Max=1.0000000))
		FadeOutStartTime=0.0500000
		FadeInEndTime=0.0500000
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=2
		SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
		StartSpinRange=(X=(Min=0.4750000,Max=0.4750000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=50.0000000,Max=80.0000000),Y=(Min=50.0000000,Max=80.0000000),Z=(Min=50.0000000,Max=80.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareC1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[4]=SpriteEmitter16
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.RSNovaLightMuzzleFlash.SpriteEmitter13'
begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.7000000,Max=1.0000000))
	Opacity=0.7300000
	FadeOutStartTime=0.0625000
	FadeInEndTime=0.0300000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=30.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=140.0000000,Max=180.0000000),Y=(Min=140.0000000,Max=180.0000000),Z=(Min=140.0000000,Max=180.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.0800000,Max=0.2500000)
end object
// Reference: BeamEmitter'BallisticProV55.RSNovaLightMuzzleFlash.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=100.0000000,Max=300.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-40.0000000,Max=40.0000000))
	HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	HighFrequencyPoints=8
	NoiseDeterminesEndPoint=true
	UseBranching=true
	BranchProbability=(Min=0.3000000,Max=0.5000000)
	BranchEmitter=2
	BranchSpawnAmountRange=(Min=1.0000000,Max=1.0000000)
	LinkupLifetime=true
	UseColorScale=true
	FadeOut=true
	UseSizeScale=true
	UseRegularSizeScale=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.4250000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
	FadeOutStartTime=0.0400000
	CoordinateSystem=1
	MaxParticles=4
	StartLocationOffset=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=10.0000000,Max=15.0000000),Z=(Min=10.0000000,Max=15.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	StartVelocityRange=(X=(Min=1.5000000,Max=2.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
end object
// Reference: BeamEmitter'BallisticProV55.RSNovaLightMuzzleFlash.BeamEmitter1'
begin object name="BeamEmitter1" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=50.0000000,Max=100.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=-25.0000000,Max=25.0000000))
	HighFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	HighFrequencyPoints=7
	NoiseDeterminesEndPoint=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3178570,Color=(R=255,G=255,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
	FadeOutStartTime=0.0180000
	CoordinateSystem=1
	MaxParticles=8
	DetailMode=2
	StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=5.0000000,Max=8.0000000),Y=(Min=5.0000000,Max=8.0000000),Z=(Min=5.0000000,Max=8.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	StartVelocityRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaLightMuzzleFlash.SpriteEmitter14'
begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=200,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=192,G=192,B=128,A=255))
	Opacity=0.9500000
	FadeOutStartTime=0.1500000
	FadeInEndTime=0.0600000
	CoordinateSystem=1
	MaxParticles=14
	StartLocationOffset=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaLightMuzzleFlash.SpriteEmitter16'
begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
	UseDirectionAs=3
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.5000000,Max=1.0000000))
	FadeOutStartTime=0.0500000
	FadeInEndTime=0.0500000
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=2
	SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
	StartSpinRange=(X=(Min=0.4750000,Max=0.4750000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=50.0000000,Max=80.0000000),Y=(Min=50.0000000,Max=80.0000000),Z=(Min=50.0000000,Max=80.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareC1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
