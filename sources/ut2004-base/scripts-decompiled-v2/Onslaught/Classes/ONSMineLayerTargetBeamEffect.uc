class ONSMineLayerTargetBeamEffect extends Emitter;

var bool bCancel;
var Vector EffectOffset;
var Vector EndEffect;

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		EndEffect, bCancel;
}

function SetInitialState()
{
	super(Actor).SetInitialState();
	// End:0x26
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Disable('Tick');
	}
	//return;	
}

simulated function Cancel()
{
	bCancel = true;
	bTearOff = true;
	BeamEmitter(Emitters[0]).FadeOut = true;
	BeamEmitter(Emitters[0]).LifetimeRange.Min = 1.2500000;
	BeamEmitter(Emitters[0]).LifetimeRange.Max = 1.2500000;
	SetTimer(0.5000000, false);
	//return;	
}

simulated function Timer()
{
	// End:0x34
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		BeamEmitter(Emitters[0]).RespawnDeadParticles = false;		
	}
	else
	{
		Destroy();
	}
	//return;	
}

simulated function Tick(float DeltaTime)
{
	local Vector StartTrace, X, Y, Z;
	local float Dist;

	// End:0x18
	if(bCancel)
	{
		Cancel();
		Disable('Tick');
		return;
	}
	// End:0x25
	if(Instigator == none)
	{
		return;
	}
	// End:0x118
	if(Instigator.IsFirstPerson())
	{
		Instigator.Weapon.GetViewAxes(X, Y, Z);
		// End:0x90
		if(Instigator.Weapon.WeaponCentered())
		{
			StartTrace = Instigator.Location;			
		}
		else
		{
			StartTrace = (((Instigator.Location + Instigator.CalcDrawOffset(Instigator.Weapon)) + (EffectOffset.X * X)) + ((Instigator.Weapon.hand * EffectOffset.Y) * Y)) + (EffectOffset.Z * Z);
		}		
	}
	else
	{
		// End:0x169
		if((xPawn(Instigator) != none) && xPawn(Instigator).WeaponAttachment != none)
		{
			StartTrace = xPawn(Instigator).WeaponAttachment.GetTipLocation();			
		}
		else
		{
			StartTrace = (Instigator.Location + (Instigator.EyeHeight * vect(0.0000000, 0.0000000, 1.0000000))) + (Normal(Vector(Rotation)) * 25.0000000);
		}
	}
	SetLocation(StartTrace);
	SetRotation(Rotator(EndEffect - StartTrace));
	Dist = VSize(EndEffect - StartTrace);
	BeamEmitter(Emitters[0]).BeamDistanceRange.Min = Dist;
	BeamEmitter(Emitters[0]).BeamDistanceRange.Max = Dist;
	//return;	
}

defaultproperties
{
	EffectOffset=(X=-5.0000000,Y=15.0000000,Z=20.0000000)
	// Reference: BeamEmitter'Onslaught.ONSMineLayerTargetBeamEffect.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=10000.0000000,Max=10000.0000000)
		DetermineEndPointBy=1
		BeamTextureUScale=16.0000000
		RotatingSheets=3
		LowFrequencyPoints=2
		HighFrequencyPoints=2
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=64,B=64,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=192,G=0,B=0,A=0))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		MaxParticles=1
		UseRotationFrom=1
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Weapons.BeamFragment'
		LifetimeRange=(Min=0.0200000,Max=0.0200000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=BeamEmitter0
	AutoDestroy=true
	bNoDelete=false
	bReplicateInstigator=true
	bUpdateSimulatedPosition=true
	bNetInitialRotation=true
	RemoteRole=2
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'Onslaught.ONSMineLayerTargetBeamEffect.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=10000.0000000,Max=10000.0000000)
	DetermineEndPointBy=1
	BeamTextureUScale=16.0000000
	RotatingSheets=3
	LowFrequencyPoints=2
	HighFrequencyPoints=2
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=64,B=64,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=192,G=0,B=0,A=0))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	MaxParticles=1
	UseRotationFrom=1
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Weapons.BeamFragment'
	LifetimeRange=(Min=0.0200000,Max=0.0200000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
