class BallisticEmitter extends Emitter;

enum EZTestMode
{
	ZM_None,                        // 0
	ZM_OnWhenVisible,               // 1
	ZM_OffWhenVisible               // 2
};

var() array<BallisticEmitter.EZTestMode> EmitterZTestSwitches;

simulated event PostBeginPlay()
{
	local int i;
	local bool bLOS;

	super(Actor).PostBeginPlay();
	// End:0x80
	if(int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) < 2)
	{
		i = 0;
		J0x24:

		// End:0x80 [Loop If]
		if(i < Emitters.Length)
		{
			// End:0x76
			if(int(Emitters[i].DetailMode) > int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode))
			{
				Emitters[i].Disabled = true;
			}
			i++;
			// [Loop Continue]
			goto J0x24;
		}
	}
	// End:0x14A
	if(EmitterZTestSwitches.Length > 0)
	{
		bLOS = Level.GetLocalPlayerController().LineOfSightTo(self);
		i = 0;
		J0xB1:

		// End:0x14A [Loop If]
		if(i < Min(EmitterZTestSwitches.Length, Emitters.Length))
		{
			// End:0xE2
			if(int(EmitterZTestSwitches[i]) == int(0))
			{
				// [Explicit Continue]
				goto J0x140;
			}
			// End:0x117
			if(bLOS)
			{
				Emitters[i].ZTest = int(EmitterZTestSwitches[i]) == int(1);
				// [Explicit Continue]
				goto J0x140;
			}
			Emitters[i].ZTest = int(EmitterZTestSwitches[i]) == int(2);
			J0x140:

			i++;
			// [Loop Continue]
			goto J0xB1;
		}
	}
	//return;	
}

simulated function InvertY()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x43 [Loop If]
	if(i < Emitters.Length)
	{
		Emitters[i].StartLocationOffset.Y *= float(-1);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

static function RangeVector VtoRV(Vector Max, Vector Min)
{
	local RangeVector RV;

	RV.X.Max = Max.X;
	RV.X.Min = Min.X;
	RV.Y.Max = Max.Y;
	RV.Y.Min = Min.Y;
	RV.Z.Max = Max.Z;
	RV.Z.Min = Min.Z;
	return RV;
	//return;	
}

static function ScaleRV(out RangeVector RV, float Scale)
{
	RV.X.Max *= Scale;
	RV.Y.Max *= Scale;
	RV.Z.Max *= Scale;
	RV.X.Min *= Scale;
	RV.Y.Min *= Scale;
	RV.Z.Min *= Scale;
	//return;	
}

static function ScaleEmitter(Emitter TheOne, float Scale)
{
	local int i, j;

	i = 0;
	J0x07:

	// End:0x3A2 [Loop If]
	if(i < TheOne.Emitters.Length)
	{
		ScaleRV(TheOne.Emitters[i].StartVelocityRange, Scale);
		TheOne.Emitters[i].SphereRadiusRange.Min *= Scale;
		TheOne.Emitters[i].SphereRadiusRange.Max *= Scale;
		TheOne.Emitters[i].StartVelocityRadialRange.Min *= Scale;
		TheOne.Emitters[i].StartVelocityRadialRange.Max *= Scale;
		TheOne.Emitters[i].MaxAbsVelocity *= Scale;
		ScaleRV(TheOne.Emitters[i].StartSizeRange, Scale);
		TheOne.Emitters[i].Acceleration *= Scale;
		ScaleRV(TheOne.Emitters[i].StartLocationRange, Scale);
		TheOne.Emitters[i].StartLocationOffset *= Scale;
		ScaleRV(TheOne.Emitters[i].MeshScaleRange, Scale);
		ScaleRV(TheOne.Emitters[i].VelocityScaleRange, Scale);
		ScaleRV(TheOne.Emitters[i].VelocityLossRange, Scale);
		// End:0x398
		if(BeamEmitter(TheOne.Emitters[i]) != none)
		{
			j = 0;
			J0x246:

			// End:0x2B5 [Loop If]
			if(j < BeamEmitter(TheOne.Emitters[i]).BeamEndPoints.Length)
			{
				ScaleRV(BeamEmitter(TheOne.Emitters[i]).BeamEndPoints[j].offset, Scale);
				j++;
				// [Loop Continue]
				goto J0x246;
			}
			ScaleRV(BeamEmitter(TheOne.Emitters[i]).LowFrequencyNoiseRange, Scale);
			ScaleRV(BeamEmitter(TheOne.Emitters[i]).HighFrequencyNoiseRange, Scale);
			ScaleRV(BeamEmitter(TheOne.Emitters[i]).DynamicHFNoiseRange, Scale);
			BeamEmitter(TheOne.Emitters[i]).BeamDistanceRange.Max *= Scale;
			BeamEmitter(TheOne.Emitters[i]).BeamDistanceRange.Min *= Scale;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

static function KillEmitter(Emitter TheOne)
{
	local int i;

	TheOne.AutoDestroy = true;
	i = 0;
	J0x18:

	// End:0x101 [Loop If]
	if(i < TheOne.Emitters.Length)
	{
		TheOne.Emitters[i].AutoDestroy = true;
		TheOne.Emitters[i].AutomaticInitialSpawning = false;
		TheOne.Emitters[i].RespawnDeadParticles = false;
		TheOne.Emitters[i].InitialParticlesPerSecond = 0.0000000;
		TheOne.Emitters[i].ParticlesPerSecond = 0.0000000;
		TheOne.Emitters[i].TriggerDisabled = true;
		i++;
		// [Loop Continue]
		goto J0x18;
	}
	//return;	
}

static function StopParticles(Emitter TheOne)
{
	local int i;

	TheOne.AutoDestroy = false;
	i = 0;
	J0x18:

	// End:0x101 [Loop If]
	if(i < TheOne.Emitters.Length)
	{
		TheOne.Emitters[i].AutoDestroy = false;
		TheOne.Emitters[i].AutomaticInitialSpawning = false;
		TheOne.Emitters[i].RespawnDeadParticles = false;
		TheOne.Emitters[i].InitialParticlesPerSecond = 0.0000000;
		TheOne.Emitters[i].ParticlesPerSecond = 0.0000000;
		TheOne.Emitters[i].TriggerDisabled = true;
		i++;
		// [Loop Continue]
		goto J0x18;
	}
	//return;	
}

static function ResumeParticles(Emitter TheOne)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x157 [Loop If]
	if(i < TheOne.Emitters.Length)
	{
		TheOne.Emitters[i].AutomaticInitialSpawning = TheOne.Emitters[i].default.AutomaticInitialSpawning;
		TheOne.Emitters[i].RespawnDeadParticles = TheOne.Emitters[i].default.RespawnDeadParticles;
		TheOne.Emitters[i].InitialParticlesPerSecond = TheOne.Emitters[i].default.InitialParticlesPerSecond;
		TheOne.Emitters[i].ParticlesPerSecond = TheOne.Emitters[i].default.ParticlesPerSecond;
		TheOne.Emitters[i].TriggerDisabled = TheOne.Emitters[i].default.TriggerDisabled;
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

defaultproperties
{
	bNoDelete=false
	bGameRelevant=true
}
