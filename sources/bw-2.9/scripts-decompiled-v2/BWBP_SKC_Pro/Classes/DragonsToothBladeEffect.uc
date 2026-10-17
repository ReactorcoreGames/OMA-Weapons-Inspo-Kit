class DragonsToothBladeEffect extends BallisticEmitter;

simulated function Destroyed()
{
	// End:0x11
	if(bDynamicLight)
	{
		bDynamicLight = false;
	}
	super(Actor).Destroyed();
	//return;	
}

defaultproperties
{
	// Reference: BeamEmitter'BWBP_SKC_Pro.DragonsToothBladeEffect.BeamEmitter3'
	begin object name="BeamEmitter3" class=Engine.BeamEmitter
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=160.0000000,Max=160.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=0.0000000)
		DetermineEndPointBy=2
		BeamTextureUScale=0.2000000
		LowFrequencyNoiseRange=(X=(Min=-65524.0000000,Max=-65509.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		HighFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=3525.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		HighFrequencyPoints=2
		FadeOut=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.7000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.3305620
		CoordinateSystem=1
		MaxParticles=5
		StartSizeRange=(X=(Min=0.0000000,Max=13.7990000),Y=(Min=0.0000000,Max=1.7990000),Z=(Min=0.0000000,Max=1.7990000))
		InitialParticlesPerSecond=50.0000000
		Texture=Texture'BWBP_SKC_Tex.DragonToothSword.DTS-Glow'
		TextureUSubdivisions=1
		TextureVSubdivisions=1
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[0]=BeamEmitter3
	AutoDestroy=true
	LightType=1
	LightEffect=21
	LightHue=160
	LightSaturation=64
	LightBrightness=224.0000000
	LightRadius=12.0000000
	bDynamicLight=true
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BWBP_SKC_Pro.DragonsToothBladeEffect.BeamEmitter3'
begin object name="BeamEmitter3" class=Engine.BeamEmitter
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=160.0000000,Max=160.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=0.0000000)
	DetermineEndPointBy=2
	BeamTextureUScale=0.2000000
	LowFrequencyNoiseRange=(X=(Min=-65524.0000000,Max=-65509.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	HighFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=3525.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	HighFrequencyPoints=2
	FadeOut=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.7000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.3305620
	CoordinateSystem=1
	MaxParticles=5
	StartSizeRange=(X=(Min=0.0000000,Max=13.7990000),Y=(Min=0.0000000,Max=1.7990000),Z=(Min=0.0000000,Max=1.7990000))
	InitialParticlesPerSecond=50.0000000
	Texture=Texture'BWBP_SKC_Tex.DragonToothSword.DTS-Glow'
	TextureUSubdivisions=1
	TextureVSubdivisions=1
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
