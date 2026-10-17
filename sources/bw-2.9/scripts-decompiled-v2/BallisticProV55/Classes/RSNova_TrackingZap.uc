class RSNova_TrackingZap extends BallisticEmitter;

var Actor Vic;
var RSNova_PlayerEffect Flash;
var bool bHealing;

simulated function SetTarget(Actor targ, bool bHeal)
{
	// End:0x3D
	if(targ == none)
	{
		// End:0x34
		if(Flash != none)
		{
			Flash.StopSound();
			Flash.Kill();
		}
		Vic = none;
		return;
	}
	// End:0x1AB
	if(bHealing != bHeal)
	{
		bHealing = bHeal;
		// End:0x169
		if(bHeal)
		{
			Emitters[0].ColorScale[1].Color.G = byte(255);
			Emitters[0].ColorScale[1].Color.B = 192;
			Emitters[0].ColorScale[2].Color.G = byte(255);
			Emitters[0].ColorScale[2].Color.B = 64;
			Emitters[1].ColorMultiplierRange.Y.Min = 1.0000000;
			Emitters[1].ColorMultiplierRange.Y.Max = 1.0000000;
			Emitters[1].ColorMultiplierRange.Z.Min = 0.6000000;
			Emitters[1].ColorMultiplierRange.Z.Max = 0.6000000;			
		}
		else
		{
			Emitters[0].ColorScale = default.Emitters[0].ColorScale;
			Emitters[1].ColorMultiplierRange = default.Emitters[1].ColorMultiplierRange;
		}
	}
	Vic = targ;
	// End:0x1D4
	if(Flash == none)
	{
		Flash = Spawn(Class'BallisticProV55.RSNova_PlayerEffect', targ);
	}
	//return;	
}

simulated function UpdateTargets()
{
	local Vector Dir;

	// End:0x0D
	if(Vic == none)
	{
		return;
	}
	Dir = Normal(Vic.Location - Location) * float(300);
	BeamEmitter(Emitters[0]).BeamEndPoints[0].offset = Class'BCoreProV55.BallisticEmitter'.static.VtoRV(Vic.Location, Vic.Location);
	BeamEmitter(Emitters[0]).BeamEndPoints[0].Weight = 1.0000000;
	// End:0xBB
	if(Flash == none)
	{
		Flash = Spawn(Class'BallisticProV55.RSNova_PlayerEffect', Vic);
	}
	Dir = Normal(Location - Vic.Location);
	Flash.SetLocation(Vic.Location + (Dir * Vic.CollisionRadius));
	Flash.SetRotation(Rotator(Dir));
	BeamEmitter(Emitters[1]).BeamEndPoints = BeamEmitter(Emitters[0]).BeamEndPoints;
	BeamEmitter(Emitters[2]).BeamEndPoints = BeamEmitter(Emitters[0]).BeamEndPoints;
	BeamEmitter(Emitters[3]).BeamEndPoints = BeamEmitter(Emitters[0]).BeamEndPoints;
	//return;	
}

simulated function KillFlashes()
{
	// End:0x30
	if(Flash != none)
	{
		Flash.StopSound();
		Flash.Kill();
		Flash = none;
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(Flash != none)
	{
		Flash.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

defaultproperties
{
	// Reference: BeamEmitter'BallisticProV55.RSNova_TrackingZap.BeamEmitter5'
	begin object name="BeamEmitter5" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=-1100.0000000,Max=-1100.0000000),Z=(Min=-25.0000000,Max=25.0000000)),Weight=1.0000000)
		DetermineEndPointBy=5
		BeamTextureUScale=6.0000000
		LowFrequencyNoiseRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
		LowFrequencyPoints=5
		HighFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		BranchProbability=(Min=0.2000000,Max=0.2000000)
		BranchEmitter=1
		BranchSpawnAmountRange=(Min=1.0000000,Max=1.0000000)
		LinkupLifetime=true
		UseColorScale=true
		FadeOut=true
		UseSizeScale=true
		UseRegularSizeScale=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2142860,Color=(R=64,G=192,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=64,B=255,A=255))
		FadeOutStartTime=0.0320000
		MaxParticles=3
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=12.0000000,Max=20.0000000),Y=(Min=12.0000000,Max=20.0000000),Z=(Min=12.0000000,Max=20.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt03aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[0]=BeamEmitter5
	// Reference: BeamEmitter'BallisticProV55.RSNova_TrackingZap.BeamEmitter7'
	begin object name="BeamEmitter7" class=Engine.BeamEmitter
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=-1100.0000000,Max=-1100.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
		DetermineEndPointBy=5
		FadeOut=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.6300000
		FadeOutStartTime=0.0360000
		MaxParticles=2
		StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[1]=BeamEmitter7
	// Reference: BeamEmitter'BallisticProV55.RSNova_TrackingZap.BeamEmitter8'
	begin object name="BeamEmitter8" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=-1100.0000000,Max=-1100.0000000),Z=(Min=-25.0000000,Max=25.0000000)),Weight=1.0000000)
		DetermineEndPointBy=5
		BeamTextureUScale=6.0000000
		LowFrequencyNoiseRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
		LowFrequencyPoints=5
		HighFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		BranchProbability=(Min=0.2000000,Max=0.2000000)
		BranchEmitter=1
		BranchSpawnAmountRange=(Min=1.0000000,Max=1.0000000)
		LinkupLifetime=true
		UseColorScale=true
		FadeOut=true
		UseSizeScale=true
		UseRegularSizeScale=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2142860,Color=(R=255,G=255,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=0,A=255))
		FadeOutStartTime=0.0300000
		MaxParticles=3
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=12.0000000,Max=20.0000000),Y=(Min=12.0000000,Max=20.0000000),Z=(Min=12.0000000,Max=20.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt03aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[2]=BeamEmitter8
	// Reference: BeamEmitter'BallisticProV55.RSNova_TrackingZap.BeamEmitter9'
	begin object name="BeamEmitter9" class=Engine.BeamEmitter
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=-1100.0000000,Max=-1100.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
		DetermineEndPointBy=5
		BeamTextureUScale=2.0000000
		FadeOut=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.3000000
		FadeOutStartTime=0.0360000
		MaxParticles=2
		StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[3]=BeamEmitter9
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BallisticProV55.RSNova_TrackingZap.BeamEmitter5'
begin object name="BeamEmitter5" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=-1100.0000000,Max=-1100.0000000),Z=(Min=-25.0000000,Max=25.0000000)),Weight=1.0000000)
	DetermineEndPointBy=5
	BeamTextureUScale=6.0000000
	LowFrequencyNoiseRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
	LowFrequencyPoints=5
	HighFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	BranchProbability=(Min=0.2000000,Max=0.2000000)
	BranchEmitter=1
	BranchSpawnAmountRange=(Min=1.0000000,Max=1.0000000)
	LinkupLifetime=true
	UseColorScale=true
	FadeOut=true
	UseSizeScale=true
	UseRegularSizeScale=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2142860,Color=(R=64,G=192,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=64,B=255,A=255))
	FadeOutStartTime=0.0320000
	MaxParticles=3
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=12.0000000,Max=20.0000000),Y=(Min=12.0000000,Max=20.0000000),Z=(Min=12.0000000,Max=20.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt03aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: BeamEmitter'BallisticProV55.RSNova_TrackingZap.BeamEmitter7'
begin object name="BeamEmitter7" class=Engine.BeamEmitter
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=-1100.0000000,Max=-1100.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
	DetermineEndPointBy=5
	FadeOut=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.6300000
	FadeOutStartTime=0.0360000
	MaxParticles=2
	StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: BeamEmitter'BallisticProV55.RSNova_TrackingZap.BeamEmitter8'
begin object name="BeamEmitter8" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=-1100.0000000,Max=-1100.0000000),Z=(Min=-25.0000000,Max=25.0000000)),Weight=1.0000000)
	DetermineEndPointBy=5
	BeamTextureUScale=6.0000000
	LowFrequencyNoiseRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
	LowFrequencyPoints=5
	HighFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	BranchProbability=(Min=0.2000000,Max=0.2000000)
	BranchEmitter=1
	BranchSpawnAmountRange=(Min=1.0000000,Max=1.0000000)
	LinkupLifetime=true
	UseColorScale=true
	FadeOut=true
	UseSizeScale=true
	UseRegularSizeScale=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2142860,Color=(R=255,G=255,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=0,A=255))
	FadeOutStartTime=0.0300000
	MaxParticles=3
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=12.0000000,Max=20.0000000),Y=(Min=12.0000000,Max=20.0000000),Z=(Min=12.0000000,Max=20.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt03aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: BeamEmitter'BallisticProV55.RSNova_TrackingZap.BeamEmitter9'
begin object name="BeamEmitter9" class=Engine.BeamEmitter
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=-1100.0000000,Max=-1100.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
	DetermineEndPointBy=5
	BeamTextureUScale=2.0000000
	FadeOut=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.3000000
	FadeOutStartTime=0.0360000
	MaxParticles=2
	StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
