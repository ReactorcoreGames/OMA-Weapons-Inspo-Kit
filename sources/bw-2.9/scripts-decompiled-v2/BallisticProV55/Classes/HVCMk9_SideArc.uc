class HVCMk9_SideArc extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x29
	if(WeaponAttachment(Owner) != none)
	{
		Emitters[0].ZTest = true;
	}
	//return;	
}

simulated function SetColorShift(float Alpha)
{
	Emitters[0].ColorMultiplierRange.X.Min = Lerp(Alpha, 0.5000000, 1.0000000);
	Emitters[0].ColorMultiplierRange.X.Max = Emitters[0].ColorMultiplierRange.X.Min;
	Emitters[0].ColorMultiplierRange.Y.Min = Lerp(Alpha, 0.5000000, 0.0000000);
	Emitters[0].ColorMultiplierRange.Y.Max = Emitters[0].ColorMultiplierRange.Y.Min;
	Emitters[0].ColorMultiplierRange.Z.Min = Lerp(Alpha, 0.5000000, 0.0000000);
	Emitters[0].ColorMultiplierRange.Z.Max = Emitters[0].ColorMultiplierRange.Z.Min;
	Emitters[2].ColorMultiplierRange.X.Min = Lerp(Alpha, 0.1000000, 1.0000000);
	Emitters[2].ColorMultiplierRange.X.Max = Emitters[2].ColorMultiplierRange.X.Min;
	Emitters[2].ColorMultiplierRange.Y.Min = Lerp(Alpha, 0.2000000, 0.1000000);
	Emitters[2].ColorMultiplierRange.Y.Max = Emitters[2].ColorMultiplierRange.Y.Min;
	Emitters[2].ColorMultiplierRange.Z.Min = Lerp(Alpha, 1.0000000, 0.1000000);
	Emitters[2].ColorMultiplierRange.Z.Max = Emitters[2].ColorMultiplierRange.Z.Min;
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.HVCMk9_SideArc.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		ZTest=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.0440000
		FadeInEndTime=0.0380000
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=2
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=8.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-4.0000000,Max=4.0000000))
		StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=40.0000000,Max=60.0000000),Z=(Min=40.0000000,Max=60.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.0800000,Max=0.2000000)
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: BeamEmitter'BallisticProV55.HVCMk9_SideArc.BeamEmitter2'
	begin object name="BeamEmitter2" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=17.0000000,Max=17.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=18.0000000,Max=18.0000000)),Weight=1.0000000)
		DetermineEndPointBy=2
		LowFrequencyNoiseRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=0.0000000,Max=0.0000000))
		HighFrequencyPoints=3
		FadeOut=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.0220000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=-1.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=20.0000000),Y=(Min=2.0000000,Max=20.0000000),Z=(Min=2.0000000,Max=20.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt01aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[1]=BeamEmitter2
	// Reference: SpriteEmitter'BallisticProV55.HVCMk9_SideArc.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=1.0000000,Max=1.0000000))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=9.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[2]=SpriteEmitter2
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.HVCMk9_SideArc.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	ZTest=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.0440000
	FadeInEndTime=0.0380000
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=2
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=8.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-4.0000000,Max=4.0000000))
	StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=40.0000000,Max=60.0000000),Z=(Min=40.0000000,Max=60.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.0800000,Max=0.2000000)
end object
// Reference: BeamEmitter'BallisticProV55.HVCMk9_SideArc.BeamEmitter2'
begin object name="BeamEmitter2" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=17.0000000,Max=17.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=18.0000000,Max=18.0000000)),Weight=1.0000000)
	DetermineEndPointBy=2
	LowFrequencyNoiseRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=0.0000000,Max=0.0000000))
	HighFrequencyPoints=3
	FadeOut=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.0220000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=-1.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=20.0000000),Y=(Min=2.0000000,Max=20.0000000),Z=(Min=2.0000000,Max=20.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt01aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: SpriteEmitter'BallisticProV55.HVCMk9_SideArc.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=1.0000000,Max=1.0000000))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=9.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
