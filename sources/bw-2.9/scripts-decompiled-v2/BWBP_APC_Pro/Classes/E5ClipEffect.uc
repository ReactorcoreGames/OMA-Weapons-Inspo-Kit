class E5ClipEffect extends BallisticEmitter;

function InvertY()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x43 [Loop If]
	if(i < Emitters.Length)
	{
		Emitters[i].StartLocationOffset.Y *= float(-1);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_APC_Pro.E5ClipEffect.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseCollisionPlanes=true
		UseMaxCollisions=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseRandomSubdivision=true
		CollisionPlanes[0]=(W=0.0000000,X=0.0000000,Y=1.0000000,Z=0.0000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.9000000,Max=0.9000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.8000000
		FadeInEndTime=0.1100000
		CoordinateSystem=1
		StartLocationOffset=(X=0.0000000,Y=-22.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.5000000,Max=2.5000000))
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=5.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_APC_Pro.E5ClipEffect.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseDirectionAs=1
		SpinParticles=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		CoordinateSystem=1
		MaxParticles=1
		StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=25.0000000,Max=50.0000000))
		Texture=Texture'BW_Core_WeaponTex.Effects.ClampedFlare1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.1000000,Max=0.1000000))
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: BeamEmitter'BWBP_APC_Pro.E5ClipEffect.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=32.0000000,Max=48.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
		HighFrequencyPoints=8
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.3000000,Max=0.5000000))
		FadeOutStartTime=0.0760000
		FadeInEndTime=0.0200000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=0.0000000,Y=-25.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-2.0000000,Max=2.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.2500000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=0.2500000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=4.0000000),Z=(Min=2.0000000,Max=4.0000000))
		InitialParticlesPerSecond=5.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartVelocityRadialRange=(Min=-1.0000000,Max=-1.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[2]=BeamEmitter0
	bHidden=true
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_APC_Pro.E5ClipEffect.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseCollisionPlanes=true
	UseMaxCollisions=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseRandomSubdivision=true
	CollisionPlanes[0]=(W=0.0000000,X=0.0000000,Y=1.0000000,Z=0.0000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.9000000,Max=0.9000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.8000000
	FadeInEndTime=0.1100000
	CoordinateSystem=1
	StartLocationOffset=(X=0.0000000,Y=-22.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.5000000,Max=2.5000000))
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=5.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_APC_Pro.E5ClipEffect.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseDirectionAs=1
	SpinParticles=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	CoordinateSystem=1
	MaxParticles=1
	StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=25.0000000,Max=50.0000000))
	Texture=Texture'BW_Core_WeaponTex.Effects.ClampedFlare1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.1000000,Max=0.1000000))
end object
// Reference: BeamEmitter'BWBP_APC_Pro.E5ClipEffect.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=32.0000000,Max=48.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
	HighFrequencyPoints=8
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.3000000,Max=0.5000000))
	FadeOutStartTime=0.0760000
	FadeInEndTime=0.0200000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=0.0000000,Y=-25.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-2.0000000,Max=2.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.2500000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=0.2500000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=4.0000000),Z=(Min=2.0000000,Max=4.0000000))
	InitialParticlesPerSecond=5.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartVelocityRadialRange=(Min=-1.0000000,Max=-1.0000000)
	GetVelocityDirectionFrom=3
end object
