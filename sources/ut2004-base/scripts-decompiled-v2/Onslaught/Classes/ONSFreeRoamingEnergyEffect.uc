class ONSFreeRoamingEnergyEffect extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'Onslaught.ONSFreeRoamingEnergyEffect.SpriteEmitter66'
	begin object name="SpriteEmitter66" class=Engine.SpriteEmitter
		UseDirectionAs=4
		UseColorScale=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=128,G=128,B=0,A=0))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=128,G=128,B=0,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=4
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		Texture=Texture'AW-2004Particles.Fire.BlastMark'
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		WarmupTicksPerSecond=0.8000000
		RelativeWarmupTime=0.5000000
	end object
	Emitters[0]=SpriteEmitter66
	// Reference: SpriteEmitter'Onslaught.ONSFreeRoamingEnergyEffect.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		UseDirectionAs=2
		UseColorScale=true
		UseRevolution=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		DetermineVelocityByLocationDifference=true
		ScaleSizeXByVelocity=true
		UseVelocityScale=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=239,G=228,B=16,A=0))
		ColorScale[2]=(RelativeTime=0.4000000,Color=(R=128,G=128,B=0,A=0))
		ColorScale[3]=(RelativeTime=0.6000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[4]=(RelativeTime=0.8000000,Color=(R=230,G=173,B=4,A=0))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		CoordinateSystem=1
		MaxParticles=300
		StartLocationShape=2
		StartLocationPolarRange=(X=(Min=0.0000000,Max=65536.0000000),Y=(Min=16384.0000000,Max=16384.0000000),Z=(Min=64.0000000,Max=96.0000000))
		RevolutionsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-1.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=0.4000000,RelativeSize=0.8000000)
		SizeScale[3]=(RelativeTime=0.6000000,RelativeSize=1.0000000)
		SizeScale[4]=(RelativeTime=0.8000000,RelativeSize=3.0000000)
		SizeScale[5]=(RelativeTime=1.0000000,RelativeSize=0.8000000)
		StartSizeRange=(X=(Min=2.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ScaleSizeByVelocityMultiplier=(X=0.0100000,Y=1.0000000,Z=1.0000000)
		Texture=Texture'EpicParticles.Flares.FlashFlare1'
		LifetimeRange=(Min=1.8000000,Max=1.8000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=80.0000000,Max=250.0000000))
		StartVelocityRadialRange=(Min=5.0000000,Max=-5.0000000)
		GetVelocityDirectionFrom=3
		VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
		VelocityScale[1]=(RelativeTime=0.6000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
		VelocityScale[2]=(RelativeTime=1.0000000,RelativeVelocity=(X=-1.0000000,Y=-1.0000000,Z=-1.0000000))
	end object
	Emitters[1]=SpriteEmitter10
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSFreeRoamingEnergyEffect.SpriteEmitter66'
begin object name="SpriteEmitter66" class=Engine.SpriteEmitter
	UseDirectionAs=4
	UseColorScale=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=128,G=128,B=0,A=0))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=128,G=128,B=0,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=4
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	Texture=Texture'AW-2004Particles.Fire.BlastMark'
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	WarmupTicksPerSecond=0.8000000
	RelativeWarmupTime=0.5000000
end object
// Reference: SpriteEmitter'Onslaught.ONSFreeRoamingEnergyEffect.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	UseDirectionAs=2
	UseColorScale=true
	UseRevolution=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	DetermineVelocityByLocationDifference=true
	ScaleSizeXByVelocity=true
	UseVelocityScale=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=239,G=228,B=16,A=0))
	ColorScale[2]=(RelativeTime=0.4000000,Color=(R=128,G=128,B=0,A=0))
	ColorScale[3]=(RelativeTime=0.6000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[4]=(RelativeTime=0.8000000,Color=(R=230,G=173,B=4,A=0))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	CoordinateSystem=1
	MaxParticles=300
	StartLocationShape=2
	StartLocationPolarRange=(X=(Min=0.0000000,Max=65536.0000000),Y=(Min=16384.0000000,Max=16384.0000000),Z=(Min=64.0000000,Max=96.0000000))
	RevolutionsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-1.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.2000000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=0.4000000,RelativeSize=0.8000000)
	SizeScale[3]=(RelativeTime=0.6000000,RelativeSize=1.0000000)
	SizeScale[4]=(RelativeTime=0.8000000,RelativeSize=3.0000000)
	SizeScale[5]=(RelativeTime=1.0000000,RelativeSize=0.8000000)
	StartSizeRange=(X=(Min=2.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ScaleSizeByVelocityMultiplier=(X=0.0100000,Y=1.0000000,Z=1.0000000)
	Texture=Texture'EpicParticles.Flares.FlashFlare1'
	LifetimeRange=(Min=1.8000000,Max=1.8000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=80.0000000,Max=250.0000000))
	StartVelocityRadialRange=(Min=5.0000000,Max=-5.0000000)
	GetVelocityDirectionFrom=3
	VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
	VelocityScale[1]=(RelativeTime=0.6000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
	VelocityScale[2]=(RelativeTime=1.0000000,RelativeVelocity=(X=-1.0000000,Y=-1.0000000,Z=-1.0000000))
end object
