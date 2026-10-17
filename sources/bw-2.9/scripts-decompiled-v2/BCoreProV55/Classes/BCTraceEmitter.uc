class BCTraceEmitter extends BallisticEmitter;

var() float StopShortDist;

simulated function Initialize(float Distance, optional float Power)
{
	// End:0x97
	if(Emitters[0] != none)
	{
		Emitters[0].LifetimeRange.Min = FMax(0.0000000, Distance - StopShortDist) / Emitters[0].StartVelocityRange.X.Max;
		Emitters[0].LifetimeRange.Max = FMax(0.0000000, Distance - StopShortDist) / Emitters[0].StartVelocityRange.X.Min;
	}
	//return;	
}

defaultproperties
{
	StopShortDist=128.0000000
	AutoDestroy=true
}
