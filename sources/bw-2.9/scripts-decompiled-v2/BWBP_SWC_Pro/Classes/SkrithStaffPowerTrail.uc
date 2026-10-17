class SkrithStaffPowerTrail extends BallisticEmitter;

defaultproperties
{
	Emitters[0]=none
	// Reference: SpriteEmitter'BWBP_SWC_Pro.SkrithStaffPowerTrail.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=0,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=64,A=0))
		ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=2.0000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.2000000))
		Opacity=0.7000000
		FadeOutStartTime=0.2000000
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=100.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=60.0000000,Max=80.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.A73RedLayout.A73BPower'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1500000,Max=0.2000000)
	end object
	Emitters[1]=SpriteEmitter1
	Emitters[2]=none
	Emitters[3]=SpriteEmitter'BallisticProV55.RSNovaSlowMuzzleFlash.SpriteEmitter5'
	// Reference: SpriteEmitter'BWBP_SWC_Pro.SkrithStaffPowerTrail.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=2.0000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.2000000))
		Opacity=0.9400000
		FadeOutStartTime=0.3900000
		FadeInEndTime=0.0800000
		CoordinateSystem=1
		MaxParticles=12
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=35.0000000,Max=50.0000000),Y=(Min=35.0000000,Max=50.0000000),Z=(Min=35.0000000,Max=50.0000000))
		Texture=Texture'BW_Core_WeaponTex.A73RedLayout.A73BPower'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[4]=SpriteEmitter6
	// Reference: SpriteEmitter'BWBP_SWC_Pro.SkrithStaffPowerTrail.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		Disabled=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=32,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=32,A=255))
		FadeOutStartTime=0.6700000
		FadeInEndTime=0.1300000
		MaxParticles=250
		StartLocationOffset=(X=-10.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-25.0000000,Max=0.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=0.0000000,Max=25.0000000))
	end object
	Emitters[5]=SpriteEmitter8
	// Reference: SpriteEmitter'BWBP_SWC_Pro.SkrithStaffPowerTrail.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=0,A=255))
		Opacity=0.3900000
		FadeOutStartTime=1.5250000
		FadeInEndTime=0.1250000
		MaxParticles=175
		StartLocationOffset=(X=-20.0000000,Y=0.0000000,Z=10.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.5000000,Max=2.5000000)
		StartVelocityRange=(X=(Min=-25.0000000,Max=0.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=15.0000000,Max=50.0000000))
		VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.5000000))
	end object
	Emitters[6]=SpriteEmitter9
	// Reference: TrailEmitter'BWBP_SWC_Pro.SkrithStaffPowerTrail.TrailEmitter1'
	begin object name="TrailEmitter1" class=Engine.TrailEmitter
		TrailShadeType=4
		TrailLocation=1
		MaxPointsPerTrail=50
		DistanceThreshold=500.0000000
		PointLifeTime=3.5000000
		FadeOut=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.6000000
		FadeOutStartTime=0.1000000
		MaxParticles=1
		DetailMode=2
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=4.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500000.0000000
		Texture=Texture'BW_Core_WeaponTex.A73RedLayout.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
	end object
	Emitters[7]=TrailEmitter1
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SWC_Pro.SkrithStaffPowerTrail.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=0,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=64,A=0))
	ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=2.0000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.2000000))
	Opacity=0.7000000
	FadeOutStartTime=0.2000000
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=100.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=60.0000000,Max=80.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.A73RedLayout.A73BPower'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1500000,Max=0.2000000)
end object
// Reference: SpriteEmitter'BWBP_SWC_Pro.SkrithStaffPowerTrail.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=2.0000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.2000000))
	Opacity=0.9400000
	FadeOutStartTime=0.3900000
	FadeInEndTime=0.0800000
	CoordinateSystem=1
	MaxParticles=12
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=35.0000000,Max=50.0000000),Y=(Min=35.0000000,Max=50.0000000),Z=(Min=35.0000000,Max=50.0000000))
	Texture=Texture'BW_Core_WeaponTex.A73RedLayout.A73BPower'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBP_SWC_Pro.SkrithStaffPowerTrail.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	Disabled=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=32,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=32,A=255))
	FadeOutStartTime=0.6700000
	FadeInEndTime=0.1300000
	MaxParticles=250
	StartLocationOffset=(X=-10.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-25.0000000,Max=0.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=0.0000000,Max=25.0000000))
end object
// Reference: SpriteEmitter'BWBP_SWC_Pro.SkrithStaffPowerTrail.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=0,A=255))
	Opacity=0.3900000
	FadeOutStartTime=1.5250000
	FadeInEndTime=0.1250000
	MaxParticles=175
	StartLocationOffset=(X=-20.0000000,Y=0.0000000,Z=10.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.5000000,Max=2.5000000)
	StartVelocityRange=(X=(Min=-25.0000000,Max=0.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=15.0000000,Max=50.0000000))
	VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.5000000))
end object
// Reference: TrailEmitter'BWBP_SWC_Pro.SkrithStaffPowerTrail.TrailEmitter1'
begin object name="TrailEmitter1" class=Engine.TrailEmitter
	TrailShadeType=4
	TrailLocation=1
	MaxPointsPerTrail=50
	DistanceThreshold=500.0000000
	PointLifeTime=3.5000000
	FadeOut=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.6000000
	FadeOutStartTime=0.1000000
	MaxParticles=1
	DetailMode=2
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=4.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500000.0000000
	Texture=Texture'BW_Core_WeaponTex.A73RedLayout.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
end object
