class Spiral extends Emitter;

defaultproperties
{
	// Reference: SpriteEmitter'XEffects.Spiral.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UniformSize=true
		UseVelocityScale=true
		LowDetailFactor=1.0000000
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=170,B=0,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=217,B=0,A=0))
		FadeOutStartTime=1.3000000
		FadeInEndTime=0.2500000
		MaxParticles=15
		StartLocationShape=1
		SphereRadiusRange=(Min=16.0000000,Max=16.0000000)
		RevolutionsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.2000000,Max=0.5000000))
		RevolutionScale[0]=(RelativeTime=0.0000000,RelativeRevolution=(X=0.0000000,Y=0.0000000,Z=2.0000000))
		RevolutionScale[1]=(RelativeTime=0.6000000,RelativeRevolution=(X=0.0000000,Y=0.0000000,Z=0.0000000))
		RevolutionScale[2]=(RelativeTime=1.0000000,RelativeRevolution=(X=0.0000000,Y=0.0000000,Z=2.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=4.0000000,Max=4.0000000),Z=(Min=8.0000000,Max=8.0000000))
		Texture=Texture'EpicParticles.Flares.HotSpot'
		LifetimeRange=(Min=1.6000000,Max=1.6000000)
		StartVelocityRadialRange=(Min=-20.0000000,Max=-20.0000000)
		VelocityLossRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=1.0000000,Max=1.0000000))
		GetVelocityDirectionFrom=3
		VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=2.0000000,Y=2.0000000,Z=2.0000000))
		VelocityScale[1]=(RelativeTime=0.6000000,RelativeVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000))
		VelocityScale[2]=(RelativeTime=1.0000000,RelativeVelocity=(X=-10.0000000,Y=-10.0000000,Z=-10.0000000))
	end object
	Emitters[0]=SpriteEmitter2
	CullDistance=2000.0000000
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'XEffects.Spiral.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UniformSize=true
	UseVelocityScale=true
	LowDetailFactor=1.0000000
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=170,B=0,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=217,B=0,A=0))
	FadeOutStartTime=1.3000000
	FadeInEndTime=0.2500000
	MaxParticles=15
	StartLocationShape=1
	SphereRadiusRange=(Min=16.0000000,Max=16.0000000)
	RevolutionsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.2000000,Max=0.5000000))
	RevolutionScale[0]=(RelativeTime=0.0000000,RelativeRevolution=(X=0.0000000,Y=0.0000000,Z=2.0000000))
	RevolutionScale[1]=(RelativeTime=0.6000000,RelativeRevolution=(X=0.0000000,Y=0.0000000,Z=0.0000000))
	RevolutionScale[2]=(RelativeTime=1.0000000,RelativeRevolution=(X=0.0000000,Y=0.0000000,Z=2.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=4.0000000,Max=4.0000000),Z=(Min=8.0000000,Max=8.0000000))
	Texture=Texture'EpicParticles.Flares.HotSpot'
	LifetimeRange=(Min=1.6000000,Max=1.6000000)
	StartVelocityRadialRange=(Min=-20.0000000,Max=-20.0000000)
	VelocityLossRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=1.0000000,Max=1.0000000))
	GetVelocityDirectionFrom=3
	VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=2.0000000,Y=2.0000000,Z=2.0000000))
	VelocityScale[1]=(RelativeTime=0.6000000,RelativeVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000))
	VelocityScale[2]=(RelativeTime=1.0000000,RelativeVelocity=(X=-10.0000000,Y=-10.0000000,Z=-10.0000000))
end object
