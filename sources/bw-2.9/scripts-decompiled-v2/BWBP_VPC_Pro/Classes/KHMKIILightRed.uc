class KHMKIILightRed extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_VPC_Pro.KHMKIILightRed.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
		CoordinateSystem=1
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.0500000,RelativeSize=1.5000000)
		SizeScale[2]=(RelativeTime=0.1000000,RelativeSize=1.0000000)
		SizeScale[3]=(RelativeTime=0.4500000,RelativeSize=2.0000000)
		SizeScale[4]=(RelativeTime=0.5000000,RelativeSize=1.5000000)
		SizeScale[5]=(RelativeTime=0.5500000,RelativeSize=2.0000000)
		SizeScale[6]=(RelativeTime=0.9000000,RelativeSize=1.0000000)
		SizeScale[7]=(RelativeTime=0.9500000,RelativeSize=1.5000000)
		SizeScale[8]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
		InitialParticlesPerSecond=1.0000000
		Texture=Texture'EpicParticles.Flares.FlickerFlare'
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
	end object
	Emitters[0]=SpriteEmitter0
	AutoDestroy=true
	bNoDelete=false
	Physics=10
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_VPC_Pro.KHMKIILightRed.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
	CoordinateSystem=1
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.0500000,RelativeSize=1.5000000)
	SizeScale[2]=(RelativeTime=0.1000000,RelativeSize=1.0000000)
	SizeScale[3]=(RelativeTime=0.4500000,RelativeSize=2.0000000)
	SizeScale[4]=(RelativeTime=0.5000000,RelativeSize=1.5000000)
	SizeScale[5]=(RelativeTime=0.5500000,RelativeSize=2.0000000)
	SizeScale[6]=(RelativeTime=0.9000000,RelativeSize=1.0000000)
	SizeScale[7]=(RelativeTime=0.9500000,RelativeSize=1.5000000)
	SizeScale[8]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
	InitialParticlesPerSecond=1.0000000
	Texture=Texture'EpicParticles.Flares.FlickerFlare'
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
end object
