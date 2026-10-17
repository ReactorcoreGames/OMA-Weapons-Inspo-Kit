class PD97TazerEffect extends BallisticEmitter;

var Pawn Target;
var PD97PlayerEffect Flash;
var int MaxRange;
var float EffectInterval;

simulated function SetTarget(Pawn targ)
{
	// End:0x46
	if(targ == none)
	{
		// End:0x34
		if(Flash != none)
		{
			Flash.StopSound();
			Flash.Kill();
		}
		SetTimer(0.0000000, false);
		Target = none;
		return;
	}
	Target = targ;
	// End:0x98
	if(int(Instigator.Role) == int(ROLE_Authority))
	{
		SetTimer(EffectInterval, true);
		Class'BCoreProV55.BCSprintControl'.static.AddSlowTo(Target, 0.4000000, EffectInterval * 1.5000000);
	}
	// End:0xB6
	if(Flash == none)
	{
		Flash = Spawn(Class'BWBP_OP_Pro.PD97PlayerEffect', targ);
	}
	//return;	
}

function Timer()
{
	local Vector HitLocation, HitNormal;

	// End:0x11C
	if((((((((Target == none) || Target.Health < 1) || !Target.bProjTarget) || !FastTrace(Target.Location, Instigator.Location)) || BallisticShield(Trace(HitLocation, HitNormal, Target.Location, Instigator.Location, true)) != none) || VSize(Target.Location - Instigator.Location) > float(MaxRange)) || BallisticWeapon(Instigator.Weapon) == none) || BallisticWeapon(Instigator.Weapon).IsDisplaced())
	{
		SetTarget(none);
		PD97Attachment(Owner).TazeEnd();
		return;
	}
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Target, 10.0000000, Instigator, Target.Location + (Normal(Target.Location - Instigator.Location) * float(-24)), vect(0.0000000, 0.0000000, 0.0000000), Class'BWBP_OP_Pro.DTPD97Tazer');
	Class'BCoreProV55.BCSprintControl'.static.AddSlowTo(Target, 0.4000000, EffectInterval);
	//return;	
}

simulated function UpdateTargets()
{
	local Vector Dir;

	// End:0x0D
	if(Target == none)
	{
		return;
	}
	Dir = Normal(Target.Location - Location) * float(300);
	BeamEmitter(Emitters[0]).BeamEndPoints[0].offset = Class'BCoreProV55.BallisticEmitter'.static.VtoRV(Target.Location - Location, Target.Location - Location);
	SetRotation(rot(0, 0, 0));
	BeamEmitter(Emitters[0]).BeamEndPoints[0].Weight = 1.0000000;
	// End:0xD9
	if(Flash == none)
	{
		Flash = Spawn(Class'BWBP_OP_Pro.PD97PlayerEffect', Target);
	}
	Dir = Normal(Location - Target.Location);
	Flash.SetLocation(Target.Location + (Dir * Target.CollisionRadius));
	Flash.SetRotation(Rotator(Dir));
	//return;	
}

simulated function Tick(float dt)
{
	UpdateTargets();
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
	MaxRange=1024
	EffectInterval=0.4000000
	// Reference: BeamEmitter'BWBP_OP_Pro.PD97TazerEffect.BeamEmitter5'
	begin object name="BeamEmitter5" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=-1100.0000000,Max=-1100.0000000),Z=(Min=-25.0000000,Max=25.0000000)),Weight=1.0000000)
		DetermineEndPointBy=2
		BeamTextureUScale=6.0000000
		LowFrequencyNoiseRange=(X=(Min=-3.0000000,Max=3.0000000),Y=(Min=-3.0000000,Max=3.0000000),Z=(Min=-3.0000000,Max=3.0000000))
		LowFrequencyPoints=5
		HighFrequencyNoiseRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
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
		CoordinateSystem=1
		MaxParticles=4
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=6.0000000,Max=10.0000000),Y=(Min=6.0000000,Max=10.0000000),Z=(Min=6.0000000,Max=10.0000000))
		Texture=Texture'EpicParticles.Beams.HotBolt03aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1500000,Max=0.1500000)
	end object
	Emitters[0]=BeamEmitter5
	bNotOnDedServer=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BWBP_OP_Pro.PD97TazerEffect.BeamEmitter5'
begin object name="BeamEmitter5" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=500.0000000,Max=500.0000000)
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=-1100.0000000,Max=-1100.0000000),Z=(Min=-25.0000000,Max=25.0000000)),Weight=1.0000000)
	DetermineEndPointBy=2
	BeamTextureUScale=6.0000000
	LowFrequencyNoiseRange=(X=(Min=-3.0000000,Max=3.0000000),Y=(Min=-3.0000000,Max=3.0000000),Z=(Min=-3.0000000,Max=3.0000000))
	LowFrequencyPoints=5
	HighFrequencyNoiseRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
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
	CoordinateSystem=1
	MaxParticles=4
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=6.0000000,Max=10.0000000),Y=(Min=6.0000000,Max=10.0000000),Z=(Min=6.0000000,Max=10.0000000))
	Texture=Texture'EpicParticles.Beams.HotBolt03aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1500000,Max=0.1500000)
end object
