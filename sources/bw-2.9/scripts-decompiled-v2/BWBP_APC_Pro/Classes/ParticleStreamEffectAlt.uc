class ParticleStreamEffectAlt extends ParticleStreamEffect;

simulated function SetAltColor(bool bColorAlt)
{
	bAltColor = bColorAlt;
	// End:0x1CE
	if(bAltColor)
	{
		BeamEmitter(Emitters[1]).ColorScale[0].Color.B = byte(255);
		BeamEmitter(Emitters[1]).ColorScale[0].Color.G = 64;
		BeamEmitter(Emitters[1]).ColorScale[0].Color.R = 0;
		BeamEmitter(Emitters[0]).ColorScale[0].Color.B = byte(255);
		BeamEmitter(Emitters[0]).ColorScale[0].Color.G = 64;
		BeamEmitter(Emitters[0]).ColorScale[0].Color.R = 0;
		BeamEmitter(Emitters[1]).ColorScale[1].Color.B = byte(255);
		BeamEmitter(Emitters[1]).ColorScale[1].Color.G = 64;
		BeamEmitter(Emitters[1]).ColorScale[1].Color.R = 0;
		BeamEmitter(Emitters[0]).ColorScale[1].Color.B = byte(255);
		BeamEmitter(Emitters[0]).ColorScale[1].Color.G = 64;
		BeamEmitter(Emitters[0]).ColorScale[1].Color.R = 0;
	}
	//return;	
}

simulated function UpdateEndpoint()
{
	SetRotation(rot(0, 0, 0));
	// End:0x53
	if(Instigator.IsLocallyControlled())
	{
		// End:0x50
		if(!Instigator.IsFirstPerson())
		{
			bHidden = false;
			SetLocation(ParticleAttachment.GetTipLocation());
		}		
	}
	else
	{
		// End:0x7D
		if(ParticleAttachment != none)
		{
			SetLocation(ParticleAttachment.GetBoneCoords('tip').Origin);			
		}
		else
		{
			SetLocation(StartPoint);
		}
	}
	// End:0xE9
	if(Target != none)
	{
		BeamEmitter(Emitters[0]).BeamEndPoints[0].offset = Class'BCoreProV55.BallisticEmitter'.static.VtoRV(Target.Location - Location, Target.Location - Location);		
	}
	else
	{
		// End:0x144
		if(ParticleAttachment != none)
		{
			BeamEmitter(Emitters[0]).BeamEndPoints[0].offset = VtoRV(ParticleAttachment.mHitLocation - Location, ParticleAttachment.mHitLocation - Location);			
		}
		else
		{
			BeamEmitter(Emitters[0]).BeamEndPoints[0].offset = VtoRV(EndPoint - Location, EndPoint - Location);
		}
	}
	//return;	
}

simulated function Tick(float dt)
{
	// End:0x91
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x36
		if((Instigator == none) || Instigator.Controller == none)
		{
			Destroy();
			return;
		}
		StartPoint = Instigator.Location + Instigator.EyePosition();
		// End:0x7D
		if(Target != none)
		{
			EndPoint = Target.Location;			
		}
		else
		{
			EndPoint = ParticleAttachment.mHitLocation;
		}
	}
	// End:0xB9
	if(Instigator.IsLocallyControlled() && Instigator.IsFirstPerson())
	{
		return;
	}
	UpdateEndpoint();
	//return;	
}

defaultproperties
{
	// Reference: BeamEmitter'BWBP_APC_Pro.ParticleStreamEffectAlt.CoreBeam'
	begin object name="CoreBeam" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
		DetermineEndPointBy=2
		RotatingSheets=3
		LowFrequencyNoiseRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
		HighFrequencyNoiseRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
		HighFrequencyPoints=3
		DynamicHFNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		DynamicHFNoisePointsRange=(Min=0.0000000,Max=2.0000000)
		DynamicTimeBetweenNoiseRange=(Min=0.0100000,Max=0.0300000)
		LinkupLifetime=true
		UseColorScale=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=128,B=64,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=64,A=255))
		FadeOutStartTime=0.2000000
		CoordinateSystem=1
		MaxParticles=1
		UseRotationFrom=3
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		Texture=Texture'BWBP_OP_Tex.ProtonPack.StreamCoreAlt'
		LifetimeRange=(Min=0.0500000,Max=0.0500000)
	end object
	Emitters[0]=CoreBeam
	// Reference: SpriteEmitter'BWBP_APC_Pro.ParticleStreamEffectAlt.Sparks'
	begin object name="Sparks" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=64,A=255))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=255,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=128,A=255))
		FadeOutStartTime=1.0000000
		FadeInEndTime=1.0000000
		CoordinateSystem=1
		MaxParticles=25
		StartLocationRange=(X=(Min=0.0000000,Max=500.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		Texture=Texture'EpicParticles.Flares.FlickerFlare'
		LifetimeRange=(Min=2.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	end object
	Emitters[1]=Sparks
	Emitters[2]=none
	Emitters[3]=none
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BWBP_APC_Pro.ParticleStreamEffectAlt.CoreBeam'
begin object name="CoreBeam" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
	DetermineEndPointBy=2
	RotatingSheets=3
	LowFrequencyNoiseRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
	HighFrequencyNoiseRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
	HighFrequencyPoints=3
	DynamicHFNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	DynamicHFNoisePointsRange=(Min=0.0000000,Max=2.0000000)
	DynamicTimeBetweenNoiseRange=(Min=0.0100000,Max=0.0300000)
	LinkupLifetime=true
	UseColorScale=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=128,B=64,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=64,A=255))
	FadeOutStartTime=0.2000000
	CoordinateSystem=1
	MaxParticles=1
	UseRotationFrom=3
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	Texture=Texture'BWBP_OP_Tex.ProtonPack.StreamCoreAlt'
	LifetimeRange=(Min=0.0500000,Max=0.0500000)
end object
// Reference: SpriteEmitter'BWBP_APC_Pro.ParticleStreamEffectAlt.Sparks'
begin object name="Sparks" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=64,A=255))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=255,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=128,A=255))
	FadeOutStartTime=1.0000000
	FadeInEndTime=1.0000000
	CoordinateSystem=1
	MaxParticles=25
	StartLocationRange=(X=(Min=0.0000000,Max=500.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	Texture=Texture'EpicParticles.Flares.FlickerFlare'
	LifetimeRange=(Min=2.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
end object
