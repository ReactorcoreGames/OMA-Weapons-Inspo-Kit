class HVCMk9_DirectStream extends BallisticEmitter;

var Actor Target;
var HVCMk9Attachment GunAttachment;
var Vector StartPoint;
var Vector EndPoint;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		EndPoint, GunAttachment, 
		StartPoint, Target;
}

simulated function PostNetBeginPlay()
{
	super(Actor).PostNetBeginPlay();
	// End:0x93
	if(Instigator.IsLocallyControlled())
	{
		// End:0x4F
		if(HVCMk9LightningGun(Instigator.Weapon) != none)
		{
			HVCMk9LightningGun(Instigator.Weapon).StreamEffect = self;
		}
		// End:0x93
		if(HVCMk9Attachment(Instigator.Weapon.ThirdPersonActor) != none)
		{
			GunAttachment = HVCMk9Attachment(Instigator.Weapon.ThirdPersonActor);
		}
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
			SetLocation(GunAttachment.GetModeTipLocation());
		}		
	}
	else
	{
		// End:0x7D
		if(GunAttachment != none)
		{
			SetLocation(GunAttachment.GetBoneCoords('tip').Origin);			
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
		i = 0;
		J0x117:

		// End:0x1D1 [Loop If]
		if(int(i) < 3)
		{
			// End:0x186
			if(GunAttachment != none)
			{
				BeamEmitter(Emitters[int(i)]).BeamEndPoints[0].offset = VtoRV(GunAttachment.mHitLocation - Location, GunAttachment.mHitLocation - Location);
				// [Explicit Continue]
				goto J0x1C7;
			}
			BeamEmitter(Emitters[int(i)]).BeamEndPoints[0].offset = VtoRV(EndPoint - Location, EndPoint - Location);
			J0x1C7:

			i++;
			// [Loop Continue]
			goto J0x117;
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
			EndPoint = GunAttachment.mHitLocation;
		}
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
	// Reference: BeamEmitter'BallisticProV55.HVCMk9_DirectStream.BeamEmitter1'
	begin object name="BeamEmitter1" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-20.0000000,Max=20.0000000)),Weight=1.0000000)
		DetermineEndPointBy=2
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
		CoordinateSystem=1
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
	// Reference: BeamEmitter'BallisticProV55.HVCMk9_DirectStream.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=1000.0000000,Max=1000.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-50.0000000,Max=50.0000000)),Weight=1.0000000)
		DetermineEndPointBy=2
		LowFrequencyNoiseRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=-150.0000000,Max=150.0000000))
		HighFrequencyNoiseRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
		NoiseDeterminesEndPoint=true
		FadeOut=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=1.0000000,Max=1.0000000))
		CoordinateSystem=1
		MaxParticles=8
		DetailMode=2
		StartSizeRange=(X=(Min=8.0000000,Max=14.0000000),Y=(Min=8.0000000,Max=14.0000000),Z=(Min=8.0000000,Max=14.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[1]=BeamEmitter0
	// Reference: BeamEmitter'BallisticProV55.HVCMk9_DirectStream.BeamEmitter2'
	begin object name="BeamEmitter2" class=Engine.BeamEmitter
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
		DetermineEndPointBy=2
		FadeOut=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.7500000,Max=0.7500000))
		FadeOutStartTime=0.0360000
		CoordinateSystem=1
		MaxParticles=3
		StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[2]=BeamEmitter2
	AutoDestroy=true
	bAlwaysRelevant=true
	bReplicateInstigator=true
	RemoteRole=2
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BallisticProV55.HVCMk9_DirectStream.BeamEmitter1'
begin object name="BeamEmitter1" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-20.0000000,Max=20.0000000)),Weight=1.0000000)
	DetermineEndPointBy=2
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
	CoordinateSystem=1
	MaxParticles=8
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=12.0000000,Max=20.0000000),Y=(Min=12.0000000,Max=20.0000000),Z=(Min=12.0000000,Max=20.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt03aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: BeamEmitter'BallisticProV55.HVCMk9_DirectStream.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=1000.0000000,Max=1000.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-50.0000000,Max=50.0000000)),Weight=1.0000000)
	DetermineEndPointBy=2
	LowFrequencyNoiseRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=-150.0000000,Max=150.0000000))
	HighFrequencyNoiseRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
	NoiseDeterminesEndPoint=true
	FadeOut=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=1.0000000,Max=1.0000000))
	CoordinateSystem=1
	MaxParticles=8
	DetailMode=2
	StartSizeRange=(X=(Min=8.0000000,Max=14.0000000),Y=(Min=8.0000000,Max=14.0000000),Z=(Min=8.0000000,Max=14.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: BeamEmitter'BallisticProV55.HVCMk9_DirectStream.BeamEmitter2'
begin object name="BeamEmitter2" class=Engine.BeamEmitter
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
	DetermineEndPointBy=2
	FadeOut=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.7500000,Max=0.7500000))
	FadeOutStartTime=0.0360000
	CoordinateSystem=1
	MaxParticles=3
	StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
