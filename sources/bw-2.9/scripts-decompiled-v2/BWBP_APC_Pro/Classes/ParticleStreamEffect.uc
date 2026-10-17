class ParticleStreamEffect extends BallisticEmitter;

var Actor Target;
var ParticleStreamer pPack;
var ParticleStreamAttachment ParticleAttachment;
var bool bAltColor;
var Vector StartPoint;
var Vector EndPoint;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		EndPoint, ParticleAttachment, 
		StartPoint, Target, 
		bAltColor;
}

simulated function SetAltColor(bool bColorAlt)
{
	bAltColor = bColorAlt;
	// End:0x2AC
	if(bAltColor)
	{
		BeamEmitter(Emitters[2]).ColorScale[0].Color.B = 0;
		BeamEmitter(Emitters[2]).ColorScale[0].Color.G = 50;
		BeamEmitter(Emitters[2]).ColorScale[0].Color.R = byte(255);
		BeamEmitter(Emitters[1]).ColorScale[0].Color.B = 0;
		BeamEmitter(Emitters[1]).ColorScale[0].Color.G = 50;
		BeamEmitter(Emitters[1]).ColorScale[0].Color.R = byte(255);
		BeamEmitter(Emitters[0]).ColorScale[0].Color.B = 251;
		BeamEmitter(Emitters[0]).ColorScale[0].Color.G = 124;
		BeamEmitter(Emitters[0]).ColorScale[0].Color.R = 87;
		BeamEmitter(Emitters[2]).ColorScale[1].Color.B = 0;
		BeamEmitter(Emitters[2]).ColorScale[1].Color.G = 50;
		BeamEmitter(Emitters[2]).ColorScale[1].Color.R = byte(255);
		BeamEmitter(Emitters[1]).ColorScale[1].Color.B = 0;
		BeamEmitter(Emitters[1]).ColorScale[1].Color.G = 128;
		BeamEmitter(Emitters[1]).ColorScale[1].Color.R = byte(255);
		BeamEmitter(Emitters[0]).ColorScale[1].Color.B = 251;
		BeamEmitter(Emitters[0]).ColorScale[1].Color.G = 124;
		BeamEmitter(Emitters[0]).ColorScale[1].Color.R = 87;
	}
	//return;	
}

simulated function UpdateEndpoint()
{
	local byte i;

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
	// End:0x10F
	if(Target != none)
	{
		i = 0;
		J0x98:

		// End:0x10C [Loop If]
		if(int(i) < 3)
		{
			BeamEmitter(Emitters[int(i)]).BeamEndPoints[0].offset = Class'BCoreProV55.BallisticEmitter'.static.VtoRV(Target.Location - Location, Target.Location - Location);
			i++;
			// [Loop Continue]
			goto J0x98;
		}		
	}
	else
	{
		// End:0x1FB
		if(!Instigator.IsLocallyControlled() || !Instigator.IsFirstPerson())
		{
			i = 0;
			J0x141:

			// End:0x1FB [Loop If]
			if(int(i) < 3)
			{
				// End:0x1B0
				if(ParticleAttachment != none)
				{
					BeamEmitter(Emitters[int(i)]).BeamEndPoints[0].offset = VtoRV(ParticleAttachment.mHitLocation - Location, ParticleAttachment.mHitLocation - Location);
					// [Explicit Continue]
					goto J0x1F1;
				}
				BeamEmitter(Emitters[int(i)]).BeamEndPoints[0].offset = VtoRV(EndPoint - Location, EndPoint - Location);
				J0x1F1:

				i++;
				// [Loop Continue]
				goto J0x141;
			}
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

simulated function Terminate()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x39 [Loop If]
	if(i < 3)
	{
		BeamEmitter(Emitters[i]).RespawnDeadParticles = false;
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

simulated function TornOff()
{
	Kill();
	//return;	
}

defaultproperties
{
	// Reference: BeamEmitter'BWBP_APC_Pro.ParticleStreamEffect.CoreBeam'
	begin object name="CoreBeam" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
		DetermineEndPointBy=2
		RotatingSheets=1
		LowFrequencyNoiseRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
		LowFrequencyPoints=10
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
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=50,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=50,B=0,A=255))
		FadeOutStartTime=0.2500000
		CoordinateSystem=1
		MaxParticles=1
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		Texture=Texture'BWBP_OP_Tex.ProtonPack.StreamCore'
		LifetimeRange=(Min=0.0500000,Max=0.0500000)
	end object
	Emitters[0]=CoreBeam
	// Reference: BeamEmitter'BWBP_APC_Pro.ParticleStreamEffect.Offshoot1'
	begin object name="Offshoot1" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
		DetermineEndPointBy=2
		RotatingSheets=2
		LowFrequencyNoiseRange=(X=(Min=-3.0000000,Max=3.0000000),Y=(Min=-3.0000000,Max=3.0000000),Z=(Min=-3.0000000,Max=3.0000000))
		LowFrequencyPoints=6
		HighFrequencyNoiseRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
		HighFrequencyPoints=3
		DynamicHFNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		DynamicHFNoisePointsRange=(Min=0.0000000,Max=2.0000000)
		DynamicTimeBetweenNoiseRange=(Min=0.0100000,Max=0.0300000)
		LinkupLifetime=true
		UseColorScale=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=87,G=124,B=251,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=87,G=124,B=251,A=255))
		FadeOutStartTime=0.2500000
		CoordinateSystem=1
		MaxParticles=2
		StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
		Texture=Texture'BWBP_OP_Tex.ProtonPack.StreamCore'
		LifetimeRange=(Min=0.0500000,Max=0.0500000)
	end object
	Emitters[1]=Offshoot1
	// Reference: BeamEmitter'BWBP_APC_Pro.ParticleStreamEffect.Offshoot2'
	begin object name="Offshoot2" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
		DetermineEndPointBy=2
		RotatingSheets=2
		LowFrequencyNoiseRange=(X=(Min=-3.0000000,Max=3.0000000),Y=(Min=-3.0000000,Max=3.0000000),Z=(Min=-3.0000000,Max=3.0000000))
		LowFrequencyPoints=6
		HighFrequencyNoiseRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
		HighFrequencyPoints=3
		DynamicHFNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		DynamicHFNoisePointsRange=(Min=0.0000000,Max=2.0000000)
		DynamicTimeBetweenNoiseRange=(Min=0.0100000,Max=0.0300000)
		LinkupLifetime=true
		UseColorScale=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=87,G=124,B=251,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=87,G=124,B=251,A=255))
		FadeOutStartTime=0.2500000
		CoordinateSystem=1
		MaxParticles=0
		StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
		Texture=Texture'BWBP_OP_Tex.ProtonPack.StreamCore'
		LifetimeRange=(Min=0.0500000,Max=0.0500000)
	end object
	Emitters[2]=Offshoot2
	// Reference: SpriteEmitter'BWBP_APC_Pro.ParticleStreamEffect.Sparks'
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
	Emitters[3]=Sparks
	AutoDestroy=true
	bAlwaysRelevant=true
	bReplicateInstigator=true
	RemoteRole=2
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BWBP_APC_Pro.ParticleStreamEffect.CoreBeam'
begin object name="CoreBeam" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
	DetermineEndPointBy=2
	RotatingSheets=1
	LowFrequencyNoiseRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
	LowFrequencyPoints=10
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
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=50,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=50,B=0,A=255))
	FadeOutStartTime=0.2500000
	CoordinateSystem=1
	MaxParticles=1
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	Texture=Texture'BWBP_OP_Tex.ProtonPack.StreamCore'
	LifetimeRange=(Min=0.0500000,Max=0.0500000)
end object
// Reference: BeamEmitter'BWBP_APC_Pro.ParticleStreamEffect.Offshoot1'
begin object name="Offshoot1" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
	DetermineEndPointBy=2
	RotatingSheets=2
	LowFrequencyNoiseRange=(X=(Min=-3.0000000,Max=3.0000000),Y=(Min=-3.0000000,Max=3.0000000),Z=(Min=-3.0000000,Max=3.0000000))
	LowFrequencyPoints=6
	HighFrequencyNoiseRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
	HighFrequencyPoints=3
	DynamicHFNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	DynamicHFNoisePointsRange=(Min=0.0000000,Max=2.0000000)
	DynamicTimeBetweenNoiseRange=(Min=0.0100000,Max=0.0300000)
	LinkupLifetime=true
	UseColorScale=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=87,G=124,B=251,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=87,G=124,B=251,A=255))
	FadeOutStartTime=0.2500000
	CoordinateSystem=1
	MaxParticles=2
	StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
	Texture=Texture'BWBP_OP_Tex.ProtonPack.StreamCore'
	LifetimeRange=(Min=0.0500000,Max=0.0500000)
end object
// Reference: BeamEmitter'BWBP_APC_Pro.ParticleStreamEffect.Offshoot2'
begin object name="Offshoot2" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
	DetermineEndPointBy=2
	RotatingSheets=2
	LowFrequencyNoiseRange=(X=(Min=-3.0000000,Max=3.0000000),Y=(Min=-3.0000000,Max=3.0000000),Z=(Min=-3.0000000,Max=3.0000000))
	LowFrequencyPoints=6
	HighFrequencyNoiseRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
	HighFrequencyPoints=3
	DynamicHFNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	DynamicHFNoisePointsRange=(Min=0.0000000,Max=2.0000000)
	DynamicTimeBetweenNoiseRange=(Min=0.0100000,Max=0.0300000)
	LinkupLifetime=true
	UseColorScale=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=87,G=124,B=251,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=87,G=124,B=251,A=255))
	FadeOutStartTime=0.2500000
	CoordinateSystem=1
	MaxParticles=0
	StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
	Texture=Texture'BWBP_OP_Tex.ProtonPack.StreamCore'
	LifetimeRange=(Min=0.0500000,Max=0.0500000)
end object
// Reference: SpriteEmitter'BWBP_APC_Pro.ParticleStreamEffect.Sparks'
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
