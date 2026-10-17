class XOXOStreamEffect extends BallisticEmitter;

var Actor Target;
var XOXOAttachment StaffAttachment;
var Vector StartPoint;
var Vector EndPoint;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		EndPoint, StartPoint, 
		Target;
}

simulated function PostNetBeginPlay()
{
	super(Actor).PostNetBeginPlay();
	// End:0x4F
	if(Instigator.IsLocallyControlled())
	{
		// End:0x4F
		if(XOXOStaff(Instigator.Weapon) != none)
		{
			XOXOStaff(Instigator.Weapon).StreamEffect = self;
		}
	}
	//return;	
}

simulated function PostNetReceive()
{
	UpdateEndpoint();
	//return;	
}

simulated function UpdateEndpoint()
{
	local byte i;
	local XOXOAttachment Attachment;
	local Vector OffsetVector;

	// End:0x62
	if(((Instigator != none) && Instigator.Weapon != none) && Instigator.Weapon.ThirdPersonActor != none)
	{
		Attachment = XOXOAttachment(Instigator.Weapon.ThirdPersonActor);
	}
	SetRotation(rot(0, 0, 0));
	// End:0xCD
	if((Instigator != none) && Instigator.IsLocallyControlled())
	{
		// End:0xCA
		if(!Instigator.IsFirstPerson())
		{
			bHidden = false;
			// End:0xCA
			if(Attachment != none)
			{
				SetLocation(Attachment.GetModeTipLocation());
			}
		}		
	}
	else
	{
		// End:0xF7
		if(Attachment != none)
		{
			SetLocation(Attachment.GetBoneCoords('tip').Origin);			
		}
		else
		{
			SetLocation(StartPoint);
		}
	}
	// End:0x128
	if(Target != none)
	{
		OffsetVector = Target.Location - Location;		
	}
	else
	{
		OffsetVector = EndPoint - Location;
	}
	i = 0;
	J0x142:

	// End:0x18D [Loop If]
	if(int(i) < 3)
	{
		BeamEmitter(Emitters[int(i)]).BeamEndPoints[0].offset = VtoRV(OffsetVector, OffsetVector);
		i++;
		// [Loop Continue]
		goto J0x142;
	}
	//return;	
}

simulated function Tick(float dt)
{
	// End:0x12
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x4E
	if(((Instigator == none) || Instigator.Controller == none) || Instigator.Weapon == none)
	{
		Destroy();
		return;
	}
	StartPoint = Instigator.Location + Instigator.EyePosition();
	// End:0x95
	if(Target != none)
	{
		EndPoint = Target.Location;		
	}
	else
	{
		EndPoint = xWeaponAttachment(Instigator.Weapon.ThirdPersonActor).mHitLocation;
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
	// Reference: BeamEmitter'BWBP_OP_Pro.XOXOStreamEffect.XOXOPinkBeamEmitter'
	begin object name="XOXOPinkBeamEmitter" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-20.0000000,Max=20.0000000)),Weight=1.0000000)
		DetermineEndPointBy=2
		BeamTextureUScale=6.0000000
		RotatingSheets=5
		LowFrequencyNoiseRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
		LowFrequencyPoints=12
		HighFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		BranchProbability=(Min=0.2000000,Max=0.2000000)
		BranchSpawnAmountRange=(Min=1.0000000,Max=1.0000000)
		LinkupLifetime=true
		UseColorScale=true
		FadeOut=true
		UseSizeScale=true
		UseRegularSizeScale=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=186,G=1,B=80,A=255))
		ColorScale[1]=(RelativeTime=0.4285710,Color=(R=255,G=147,B=252,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=210,G=0,B=5,A=255))
		Opacity=0.0500000
		FadeOutStartTime=0.0320000
		CoordinateSystem=1
		MaxParticles=4
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=100.0000000,Max=100.0000000),Y=(Min=12.0000000,Max=20.0000000),Z=(Min=12.0000000,Max=20.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt03aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[0]=XOXOPinkBeamEmitter
	// Reference: BeamEmitter'BWBP_OP_Pro.XOXOStreamEffect.XOXOWhiteBeamEmitter'
	begin object name="XOXOWhiteBeamEmitter" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
		DetermineEndPointBy=2
		LowFrequencyNoiseRange=(X=(Min=-60.0000000,Max=60.0000000),Y=(Min=-60.0000000,Max=60.0000000),Z=(Min=-60.0000000,Max=60.0000000))
		HighFrequencyNoiseRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-15.0000000,Max=15.0000000))
		BranchHFPointsRange=(Min=0.0000000,Max=0.0000000)
		FadeOut=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.2500000
		CoordinateSystem=1
		MaxParticles=3
		DetailMode=2
		StartSizeRange=(X=(Min=8.0000000,Max=14.0000000),Y=(Min=8.0000000,Max=14.0000000),Z=(Min=8.0000000,Max=14.0000000))
		DrawStyle=1
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
	end object
	Emitters[1]=XOXOWhiteBeamEmitter
	// Reference: BeamEmitter'BWBP_OP_Pro.XOXOStreamEffect.XOXORedCoreBeam'
	begin object name="XOXORedCoreBeam" class=Engine.BeamEmitter
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
		DetermineEndPointBy=2
		FadeOut=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.7500000,Max=0.0000000))
		Opacity=0.3500000
		FadeOutStartTime=0.0360000
		CoordinateSystem=1
		MaxParticles=3
		StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[2]=XOXORedCoreBeam
	AutoDestroy=true
	bAlwaysRelevant=true
	bReplicateInstigator=true
	RemoteRole=2
	bNetNotify=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BWBP_OP_Pro.XOXOStreamEffect.XOXOPinkBeamEmitter'
begin object name="XOXOPinkBeamEmitter" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-20.0000000,Max=20.0000000)),Weight=1.0000000)
	DetermineEndPointBy=2
	BeamTextureUScale=6.0000000
	RotatingSheets=5
	LowFrequencyNoiseRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
	LowFrequencyPoints=12
	HighFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	BranchProbability=(Min=0.2000000,Max=0.2000000)
	BranchSpawnAmountRange=(Min=1.0000000,Max=1.0000000)
	LinkupLifetime=true
	UseColorScale=true
	FadeOut=true
	UseSizeScale=true
	UseRegularSizeScale=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=186,G=1,B=80,A=255))
	ColorScale[1]=(RelativeTime=0.4285710,Color=(R=255,G=147,B=252,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=210,G=0,B=5,A=255))
	Opacity=0.0500000
	FadeOutStartTime=0.0320000
	CoordinateSystem=1
	MaxParticles=4
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=100.0000000,Max=100.0000000),Y=(Min=12.0000000,Max=20.0000000),Z=(Min=12.0000000,Max=20.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt03aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: BeamEmitter'BWBP_OP_Pro.XOXOStreamEffect.XOXOWhiteBeamEmitter'
begin object name="XOXOWhiteBeamEmitter" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
	DetermineEndPointBy=2
	LowFrequencyNoiseRange=(X=(Min=-60.0000000,Max=60.0000000),Y=(Min=-60.0000000,Max=60.0000000),Z=(Min=-60.0000000,Max=60.0000000))
	HighFrequencyNoiseRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-15.0000000,Max=15.0000000))
	BranchHFPointsRange=(Min=0.0000000,Max=0.0000000)
	FadeOut=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.2500000
	CoordinateSystem=1
	MaxParticles=3
	DetailMode=2
	StartSizeRange=(X=(Min=8.0000000,Max=14.0000000),Y=(Min=8.0000000,Max=14.0000000),Z=(Min=8.0000000,Max=14.0000000))
	DrawStyle=1
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
end object
// Reference: BeamEmitter'BWBP_OP_Pro.XOXOStreamEffect.XOXORedCoreBeam'
begin object name="XOXORedCoreBeam" class=Engine.BeamEmitter
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=1.0000000)
	DetermineEndPointBy=2
	FadeOut=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.7500000,Max=0.0000000))
	Opacity=0.3500000
	FadeOutStartTime=0.0360000
	CoordinateSystem=1
	MaxParticles=3
	StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
