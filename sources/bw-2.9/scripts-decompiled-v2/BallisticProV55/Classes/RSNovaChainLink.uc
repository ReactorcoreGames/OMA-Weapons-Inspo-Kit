class RSNovaChainLink extends BallisticEmitter;

simulated function SetPoints(Vector Start, Vector End)
{
	Emitters[0].StartLocationOffset = Start;
	BeamEmitter(Emitters[0]).BeamEndPoints[0].offset = VtoRV(End, End);
	Emitters[1].StartLocationOffset = Start;
	Emitters[2].StartLocationOffset = End;
	//return;	
}

defaultproperties
{
	// Reference: BeamEmitter'BallisticProV55.RSNovaChainLink.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=400.0000000,Max=400.0000000),Y=(Min=400.0000000,Max=400.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=0.0000000)
		DetermineEndPointBy=5
		BeamTextureUScale=4.0000000
		RotatingSheets=2
		LowFrequencyNoiseRange=(X=(Min=-25.0000000,Max=25.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=-25.0000000,Max=25.0000000))
		HighFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.1714290,Color=(R=0,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.3178570,Color=(R=128,G=200,B=255,A=255))
		ColorScale[3]=(RelativeTime=0.4142860,Color=(R=0,G=0,B=0,A=255))
		ColorScale[4]=(RelativeTime=0.6000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.1600000
		FadeInEndTime=0.0450000
		CoordinateSystem=2
		MaxParticles=2
		StartLocationOffset=(X=512.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.7500000)
		StartSizeRange=(X=(Min=40.0000000,Max=80.0000000),Y=(Min=40.0000000,Max=80.0000000),Z=(Min=40.0000000,Max=80.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt01aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[0]=BeamEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RSNovaChainLink.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=192,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=192,A=255))
		ColorMultiplierRange=(X=(Min=0.7500000,Max=1.0000000),Y=(Min=0.8500000,Max=1.0000000),Z=(Min=0.9000000,Max=1.0000000))
		FadeOutStartTime=0.0380000
		FadeInEndTime=0.0100000
		CoordinateSystem=2
		MaxParticles=1
		StartLocationOffset=(X=-560.8300000,Y=245.7410000,Z=-324.3060000)
		StartSizeRange=(X=(Min=50.0000000,Max=75.0000000),Y=(Min=50.0000000,Max=75.0000000),Z=(Min=50.0000000,Max=75.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: SpriteEmitter'BallisticProV55.RSNovaChainLink.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=192,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=192,A=255))
		ColorMultiplierRange=(X=(Min=0.7500000,Max=1.0000000),Y=(Min=0.8500000,Max=1.0000000),Z=(Min=0.9000000,Max=1.0000000))
		FadeOutStartTime=0.0380000
		FadeInEndTime=0.0100000
		CoordinateSystem=2
		MaxParticles=1
		StartLocationOffset=(X=-50.0000000,Y=245.7410000,Z=-324.3060000)
		StartSizeRange=(X=(Min=65.0000000,Max=85.0000000),Y=(Min=65.0000000,Max=85.0000000),Z=(Min=65.0000000,Max=85.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
	end object
	Emitters[2]=SpriteEmitter2
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BallisticProV55.RSNovaChainLink.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=400.0000000,Max=400.0000000),Y=(Min=400.0000000,Max=400.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=0.0000000)
	DetermineEndPointBy=5
	BeamTextureUScale=4.0000000
	RotatingSheets=2
	LowFrequencyNoiseRange=(X=(Min=-25.0000000,Max=25.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=-25.0000000,Max=25.0000000))
	HighFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.1714290,Color=(R=0,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.3178570,Color=(R=128,G=200,B=255,A=255))
	ColorScale[3]=(RelativeTime=0.4142860,Color=(R=0,G=0,B=0,A=255))
	ColorScale[4]=(RelativeTime=0.6000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.1600000
	FadeInEndTime=0.0450000
	CoordinateSystem=2
	MaxParticles=2
	StartLocationOffset=(X=512.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.7500000)
	StartSizeRange=(X=(Min=40.0000000,Max=80.0000000),Y=(Min=40.0000000,Max=80.0000000),Z=(Min=40.0000000,Max=80.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt01aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaChainLink.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=192,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=192,A=255))
	ColorMultiplierRange=(X=(Min=0.7500000,Max=1.0000000),Y=(Min=0.8500000,Max=1.0000000),Z=(Min=0.9000000,Max=1.0000000))
	FadeOutStartTime=0.0380000
	FadeInEndTime=0.0100000
	CoordinateSystem=2
	MaxParticles=1
	StartLocationOffset=(X=-560.8300000,Y=245.7410000,Z=-324.3060000)
	StartSizeRange=(X=(Min=50.0000000,Max=75.0000000),Y=(Min=50.0000000,Max=75.0000000),Z=(Min=50.0000000,Max=75.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaChainLink.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=192,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=192,A=255))
	ColorMultiplierRange=(X=(Min=0.7500000,Max=1.0000000),Y=(Min=0.8500000,Max=1.0000000),Z=(Min=0.9000000,Max=1.0000000))
	FadeOutStartTime=0.0380000
	FadeInEndTime=0.0100000
	CoordinateSystem=2
	MaxParticles=1
	StartLocationOffset=(X=-50.0000000,Y=245.7410000,Z=-324.3060000)
	StartSizeRange=(X=(Min=65.0000000,Max=85.0000000),Y=(Min=65.0000000,Max=85.0000000),Z=(Min=65.0000000,Max=85.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
end object
