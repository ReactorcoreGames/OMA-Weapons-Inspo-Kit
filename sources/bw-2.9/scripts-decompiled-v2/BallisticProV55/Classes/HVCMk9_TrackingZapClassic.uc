class HVCMk9_TrackingZapClassic extends BallisticEmitter;

struct LightningTarget
{
	var Vector Lure;
	var Actor Vic;
	var HVCMk9_PlayerEffect Flash;
};

var array<LightningTarget> Targets;

simulated function SetTargets(array<Actor> Ts, array<Vector> VS)
{
	local int i;

	J0x00:
	// End:0x68 [Loop If]
	if(Targets.Length > (Ts.Length + VS.Length))
	{
		Targets[Targets.Length - 1].Flash.StopSound();
		Targets[Targets.Length - 1].Flash.Kill();
		Targets.Length = Targets.Length - 1;
		// [Loop Continue]
		goto J0x00;
	}
	Targets.Length = Ts.Length + VS.Length;
	BeamEmitter(Emitters[0]).BeamEndPoints.Length = Targets.Length;
	BeamEmitter(Emitters[1]).BeamEndPoints.Length = Targets.Length;
	i = 0;
	J0xBE:

	// End:0x19E [Loop If]
	if(i < Ts.Length)
	{
		// End:0x13E
		if(Ts[i] == none)
		{
			Targets[i].Vic = none;
			// End:0x13B
			if(Targets[i].Flash != none)
			{
				Targets[i].Flash.StopSound();
				Targets[i].Flash.Kill();
			}
			// [Explicit Continue]
			goto J0x194;
		}
		Targets[i].Vic = Ts[i];
		// End:0x194
		if(Targets[i].Flash == none)
		{
			Targets[i].Flash = Spawn(Class'BallisticProV55.HVCMk9_PlayerEffect', Ts[i]);
		}
		J0x194:

		i++;
		// [Loop Continue]
		goto J0xBE;
	}
	i = 0;
	J0x1A5:

	// End:0x2BE [Loop If]
	if(i < VS.Length)
	{
		Targets[i + Ts.Length].Vic = none;
		Targets[i + Ts.Length].Lure = VS[i];
		// End:0x275
		if(VS[i] == vect(0.0000000, 0.0000000, 0.0000000))
		{
			// End:0x272
			if(Targets[i + Ts.Length].Flash != none)
			{
				Targets[i + Ts.Length].Flash.StopSound();
				Targets[i + Ts.Length].Flash.Kill();
			}
			// [Explicit Continue]
			goto J0x2B4;
		}
		// End:0x2B4
		if(Targets[i + Ts.Length].Flash == none)
		{
			Targets[i + Ts.Length].Flash = Spawn(Class'BallisticProV55.HVCMk9_PlayerEffect');
		}
		J0x2B4:

		i++;
		// [Loop Continue]
		goto J0x1A5;
	}
	//return;	
}

simulated function UpdateTargets()
{
	local int i;
	local Vector Dir;

	// End:0x0E
	if(Targets.Length < 1)
	{
		return;
	}
	i = 0;
	J0x15:

	// End:0x48B [Loop If]
	if(i < Targets.Length)
	{
		// End:0x23D
		if(Targets[i].Vic == none)
		{
			// End:0x60
			if(Targets[i].Lure == vect(0.0000000, 0.0000000, 0.0000000))
			{
				// [Explicit Continue]
				goto J0x481;
			}
			Dir = Normal(Targets[i].Lure - Location) * float(300);
			BeamEmitter(Emitters[0]).BeamEndPoints[i].offset = Class'BCoreProV55.BallisticEmitter'.static.VtoRV(Targets[i].Lure, Targets[i].Lure);
			BeamEmitter(Emitters[0]).BeamEndPoints[i].Weight = 1.0000000;
			BeamEmitter(Emitters[1]).BeamEndPoints[i].offset = Class'BCoreProV55.BallisticEmitter'.static.VtoRV((Dir + Targets[i].Lure) - vect(200.0000000, 200.0000000, 100.0000000), (Dir + Targets[i].Lure) + vect(200.0000000, 200.0000000, 100.0000000));
			BeamEmitter(Emitters[1]).BeamEndPoints[i].Weight = 1.0000000;
			// End:0x1CF
			if(Targets[i].Flash == none)
			{
				Targets[i].Flash = Spawn(Class'BallisticProV55.HVCMk9_PlayerEffect');
			}
			Dir = Normal(Location - Targets[i].Lure);
			Targets[i].Flash.SetLocation(Targets[i].Lure + Dir);
			Targets[i].Flash.SetRotation(Rotator(Dir));
			// [Explicit Continue]
			goto J0x481;
		}
		Dir = Normal(Targets[i].Vic.Location - Location) * float(300);
		BeamEmitter(Emitters[0]).BeamEndPoints[i].offset = Class'BCoreProV55.BallisticEmitter'.static.VtoRV(Targets[i].Vic.Location, Targets[i].Vic.Location);
		BeamEmitter(Emitters[0]).BeamEndPoints[i].Weight = 1.0000000;
		BeamEmitter(Emitters[1]).BeamEndPoints[i].offset = Class'BCoreProV55.BallisticEmitter'.static.VtoRV((Dir + Targets[i].Vic.Location) - vect(200.0000000, 200.0000000, 100.0000000), (Dir + Targets[i].Vic.Location) + vect(200.0000000, 200.0000000, 100.0000000));
		BeamEmitter(Emitters[1]).BeamEndPoints[i].Weight = 1.0000000;
		// End:0x3E9
		if(Targets[i].Flash == none)
		{
			Targets[i].Flash = Spawn(Class'BallisticProV55.HVCMk9_PlayerEffect', Targets[i].Vic);
		}
		Dir = Normal(Location - Targets[i].Vic.Location);
		Targets[i].Flash.SetLocation(Targets[i].Vic.Location + (Dir * Targets[i].Vic.CollisionRadius));
		Targets[i].Flash.SetRotation(Rotator(Dir));
		J0x481:

		i++;
		// [Loop Continue]
		goto J0x15;
	}
	BeamEmitter(Emitters[2]).BeamEndPoints = BeamEmitter(Emitters[0]).BeamEndPoints;
	//return;	
}

simulated function KillFlashes()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x7D [Loop If]
	if(i < Targets.Length)
	{
		// End:0x73
		if(Targets[i].Flash != none)
		{
			Targets[i].Flash.StopSound();
			Targets[i].Flash.Kill();
			Targets[i].Flash = none;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

simulated function Destroyed()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x4E [Loop If]
	if(i < Targets.Length)
	{
		// End:0x44
		if(Targets[i].Flash != none)
		{
			Targets[i].Flash.Destroy();
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	super(Actor).Destroyed();
	//return;	
}

defaultproperties
{
	// Reference: BeamEmitter'BallisticProV55.HVCMk9_TrackingZapClassic.BeamEmitter1'
	begin object name="BeamEmitter1" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-20.0000000,Max=20.0000000)),Weight=1.0000000)
		BeamEndPoints[1]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-1000.0000000,Max=-1000.0000000),Z=(Min=-20.0000000,Max=20.0000000)),Weight=1.0000000)
		DetermineEndPointBy=5
		BeamTextureUScale=6.0000000
		LowFrequencyNoiseRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
		LowFrequencyPoints=5
		HighFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		UseBranching=true
		BranchProbability=(Min=0.2000000,Max=0.2000000)
		BranchEmitter=1
		BranchSpawnAmountRange=(Min=1.0000000,Max=1.0000000)
		LinkupLifetime=true
		UseColorScale=true
		FadeOut=true
		UseSizeScale=true
		UseRegularSizeScale=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=224,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.4285710,Color=(R=128,G=192,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=255,A=255))
		FadeOutStartTime=0.0320000
		MaxParticles=8
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=12.0000000,Max=20.0000000),Y=(Min=12.0000000,Max=20.0000000),Z=(Min=12.0000000,Max=20.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt03aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[0]=BeamEmitter1
	// Reference: BeamEmitter'BallisticProV55.HVCMk9_TrackingZapClassic.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=400.0000000,Max=1000.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=400.0000000),Y=(Min=0.0000000,Max=400.0000000),Z=(Min=-200.0000000,Max=200.0000000)),Weight=1.0000000)
		BeamEndPoints[1]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=400.0000000),Y=(Min=-1200.0000000,Max=-800.0000000),Z=(Min=-200.0000000,Max=200.0000000)),Weight=1.0000000)
		DetermineEndPointBy=5
		LowFrequencyNoiseRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=-150.0000000,Max=150.0000000))
		HighFrequencyNoiseRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
		NoiseDeterminesEndPoint=true
		FadeOut=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.7000000),Y=(Min=0.7000000,Max=0.9000000),Z=(Min=1.0000000,Max=1.0000000))
		MaxParticles=8
		DetailMode=2
		StartSizeRange=(X=(Min=8.0000000,Max=14.0000000),Y=(Min=8.0000000,Max=14.0000000),Z=(Min=8.0000000,Max=14.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[1]=BeamEmitter0
	// Reference: BeamEmitter'BallisticProV55.HVCMk9_TrackingZapClassic.BeamEmitter2'
	begin object name="BeamEmitter2" class=Engine.BeamEmitter
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-1000.0000000,Max=-1000.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
		BeamEndPoints[1]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
		DetermineEndPointBy=5
		FadeOut=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.7500000,Max=0.7500000))
		FadeOutStartTime=0.0360000
		MaxParticles=3
		DetailMode=1
		StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[2]=BeamEmitter2
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BallisticProV55.HVCMk9_TrackingZapClassic.BeamEmitter1'
begin object name="BeamEmitter1" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-20.0000000,Max=20.0000000)),Weight=1.0000000)
	BeamEndPoints[1]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-1000.0000000,Max=-1000.0000000),Z=(Min=-20.0000000,Max=20.0000000)),Weight=1.0000000)
	DetermineEndPointBy=5
	BeamTextureUScale=6.0000000
	LowFrequencyNoiseRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
	LowFrequencyPoints=5
	HighFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	UseBranching=true
	BranchProbability=(Min=0.2000000,Max=0.2000000)
	BranchEmitter=1
	BranchSpawnAmountRange=(Min=1.0000000,Max=1.0000000)
	LinkupLifetime=true
	UseColorScale=true
	FadeOut=true
	UseSizeScale=true
	UseRegularSizeScale=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=224,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.4285710,Color=(R=128,G=192,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=255,A=255))
	FadeOutStartTime=0.0320000
	MaxParticles=8
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=12.0000000,Max=20.0000000),Y=(Min=12.0000000,Max=20.0000000),Z=(Min=12.0000000,Max=20.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt03aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: BeamEmitter'BallisticProV55.HVCMk9_TrackingZapClassic.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=400.0000000,Max=1000.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=400.0000000),Y=(Min=0.0000000,Max=400.0000000),Z=(Min=-200.0000000,Max=200.0000000)),Weight=1.0000000)
	BeamEndPoints[1]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=400.0000000),Y=(Min=-1200.0000000,Max=-800.0000000),Z=(Min=-200.0000000,Max=200.0000000)),Weight=1.0000000)
	DetermineEndPointBy=5
	LowFrequencyNoiseRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=-150.0000000,Max=150.0000000))
	HighFrequencyNoiseRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
	NoiseDeterminesEndPoint=true
	FadeOut=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.7000000),Y=(Min=0.7000000,Max=0.9000000),Z=(Min=1.0000000,Max=1.0000000))
	MaxParticles=8
	DetailMode=2
	StartSizeRange=(X=(Min=8.0000000,Max=14.0000000),Y=(Min=8.0000000,Max=14.0000000),Z=(Min=8.0000000,Max=14.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: BeamEmitter'BallisticProV55.HVCMk9_TrackingZapClassic.BeamEmitter2'
begin object name="BeamEmitter2" class=Engine.BeamEmitter
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-1000.0000000,Max=-1000.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
	BeamEndPoints[1]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
	DetermineEndPointBy=5
	FadeOut=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.7500000,Max=0.7500000))
	FadeOutStartTime=0.0360000
	MaxParticles=3
	DetailMode=1
	StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
