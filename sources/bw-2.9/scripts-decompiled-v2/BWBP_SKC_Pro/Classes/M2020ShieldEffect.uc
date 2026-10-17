class M2020ShieldEffect extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.M2020ShieldEffect.SpriteEmitter15'
	begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.2000000
		CoordinateSystem=1
		MaxParticles=4
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
		Texture=Texture'AW-2004Particles.Energy.AirBlast'
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
	end object
	Emitters[0]=SpriteEmitter15
	// Reference: SpriteEmitter'BWBP_SKC_Pro.M2020ShieldEffect.SpriteEmitter16'
	begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
		UseRevolution=true
		UniformSize=true
		Acceleration=(X=1.0000000,Y=50.0000000,Z=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.2000000),Z=(Min=0.0000000,Max=0.2000000))
		Opacity=0.7300000
		CoordinateSystem=1
		MaxParticles=40
		StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SphereRadiusRange=(Min=50.0000000,Max=50.0000000)
		StartLocationPolarRange=(X=(Min=0.0000000,Max=65536.0000000),Y=(Min=16384.0000000,Max=16384.0000000),Z=(Min=100.0000000,Max=100.0000000))
		RevolutionsPerSecondRange=(X=(Min=-0.2000000,Max=0.2000000),Y=(Min=-0.2000000,Max=0.2000000),Z=(Min=-0.2000000,Max=0.2000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=21.0000000,Max=21.0000000))
		Texture=Texture'EpicParticles.Flares.SoftFlare'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=0.0000000))
	end object
	Emitters[1]=SpriteEmitter16
	// Reference: SpriteEmitter'BWBP_SKC_Pro.M2020ShieldEffect.SpriteEmitter17'
	begin object name="SpriteEmitter17" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.2080000),Z=(Min=0.0000000,Max=1.0000000))
		Opacity=0.5000000
		MaxParticles=6
		AutoResetTimeRange=(Min=0.5000000,Max=0.5000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=3.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=30.0000000),Y=(Min=75.0000000,Max=75.0000000),Z=(Min=75.0000000,Max=75.0000000))
		Texture=Texture'AW-2004Particles.Energy.ElecPanels'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
	end object
	Emitters[2]=SpriteEmitter17
	// Reference: SpriteEmitter'BWBP_SKC_Pro.M2020ShieldEffect.SpriteEmitter18'
	begin object name="SpriteEmitter18" class=Engine.SpriteEmitter
		SpinParticles=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.2000000,Max=0.2000000))
		Opacity=0.3600000
		CoordinateSystem=1
		MaxParticles=2
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		Texture=Texture'EpicParticles.Flares.FlickerFlare'
		LifetimeRange=(Min=0.0100000,Max=0.0100000)
	end object
	Emitters[3]=SpriteEmitter18
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.M2020ShieldEffect.SpriteEmitter15'
begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.2000000
	CoordinateSystem=1
	MaxParticles=4
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
	Texture=Texture'AW-2004Particles.Energy.AirBlast'
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.M2020ShieldEffect.SpriteEmitter16'
begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
	UseRevolution=true
	UniformSize=true
	Acceleration=(X=1.0000000,Y=50.0000000,Z=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.2000000),Z=(Min=0.0000000,Max=0.2000000))
	Opacity=0.7300000
	CoordinateSystem=1
	MaxParticles=40
	StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SphereRadiusRange=(Min=50.0000000,Max=50.0000000)
	StartLocationPolarRange=(X=(Min=0.0000000,Max=65536.0000000),Y=(Min=16384.0000000,Max=16384.0000000),Z=(Min=100.0000000,Max=100.0000000))
	RevolutionsPerSecondRange=(X=(Min=-0.2000000,Max=0.2000000),Y=(Min=-0.2000000,Max=0.2000000),Z=(Min=-0.2000000,Max=0.2000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=21.0000000,Max=21.0000000))
	Texture=Texture'EpicParticles.Flares.SoftFlare'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.M2020ShieldEffect.SpriteEmitter17'
begin object name="SpriteEmitter17" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.2080000),Z=(Min=0.0000000,Max=1.0000000))
	Opacity=0.5000000
	MaxParticles=6
	AutoResetTimeRange=(Min=0.5000000,Max=0.5000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=3.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=30.0000000),Y=(Min=75.0000000,Max=75.0000000),Z=(Min=75.0000000,Max=75.0000000))
	Texture=Texture'AW-2004Particles.Energy.ElecPanels'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.M2020ShieldEffect.SpriteEmitter18'
begin object name="SpriteEmitter18" class=Engine.SpriteEmitter
	SpinParticles=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.2000000,Max=0.2000000))
	Opacity=0.3600000
	CoordinateSystem=1
	MaxParticles=2
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	Texture=Texture'EpicParticles.Flares.FlickerFlare'
	LifetimeRange=(Min=0.0100000,Max=0.0100000)
end object
