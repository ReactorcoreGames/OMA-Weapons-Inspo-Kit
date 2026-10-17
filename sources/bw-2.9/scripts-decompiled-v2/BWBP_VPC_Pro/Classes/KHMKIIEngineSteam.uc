class KHMKIIEngineSteam extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_VPC_Pro.KHMKIIEngineSteam.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=96.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.0750000
		FadeOutStartTime=1.5000000
		FadeInEndTime=1.0000000
		MaxParticles=5
		SpinsPerSecondRange=(X=(Min=0.2500000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.7000000,RelativeSize=5.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		InitialParticlesPerSecond=1.0000000
		Texture=Texture'EmitterTextures.MultiFrame.smoke_a'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-8.0000000,Max=8.0000000))
	end object
	Emitters[0]=SpriteEmitter0
	AutoDestroy=true
	bNoDelete=false
	Physics=10
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_VPC_Pro.KHMKIIEngineSteam.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=96.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.0750000
	FadeOutStartTime=1.5000000
	FadeInEndTime=1.0000000
	MaxParticles=5
	SpinsPerSecondRange=(X=(Min=0.2500000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.7000000,RelativeSize=5.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	InitialParticlesPerSecond=1.0000000
	Texture=Texture'EmitterTextures.MultiFrame.smoke_a'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-8.0000000,Max=8.0000000))
end object
