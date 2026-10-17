class DeResPart extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'XEffects.DeResPart.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=6,G=255,B=6,A=0))
		ColorScale[1]=(RelativeTime=0.7000000,Color=(R=0,G=190,B=190,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=190,B=190,A=0))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.7000000
		MaxParticles=200
		StartLocationRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.7000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=3.0000000),Y=(Min=2.0000000,Max=3.0000000),Z=(Min=100.0000000,Max=100.0000000))
		UseSkeletalLocationAs=1
		SkeletalScale=(X=0.3800000,Y=0.3800000,Z=0.3800000)
		Texture=Texture'EpicParticles.Flares.BurnFlare1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.9000000,Max=0.9000000)
	end object
	Emitters[0]=SpriteEmitter0
	AutoDestroy=true
	bNoDelete=false
	bHighDetail=true
	bNetTemporary=true
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'XEffects.DeResPart.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=6,G=255,B=6,A=0))
	ColorScale[1]=(RelativeTime=0.7000000,Color=(R=0,G=190,B=190,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=190,B=190,A=0))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.7000000
	MaxParticles=200
	StartLocationRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.7000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=3.0000000),Y=(Min=2.0000000,Max=3.0000000),Z=(Min=100.0000000,Max=100.0000000))
	UseSkeletalLocationAs=1
	SkeletalScale=(X=0.3800000,Y=0.3800000,Z=0.3800000)
	Texture=Texture'EpicParticles.Flares.BurnFlare1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.9000000,Max=0.9000000)
end object
