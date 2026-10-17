class BCFlyByActor extends Actor
	notplaceable;

var() FullSound FlyBySound;

static simulated function SoundOff(Actor A, FullSound TheSound, optional Vector SoundLocation, optional float Delay)
{
	local BCFlyByActor FlyBy;

	FlyBy = A.Spawn(default.Class, A,, SoundLocation);
	FlyBy.InitFlyBy(TheSound, Delay);
	//return;	
}

simulated function InitFlyBy(FullSound TheSound, optional float Delay)
{
	FlyBySound = TheSound;
	// End:0x21
	if(Delay <= float(0))
	{
		Timer();		
	}
	else
	{
		SetTimer(Delay, false);
	}
	//return;	
}

event Timer()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, FlyBySound);
	Destroy();
	//return;	
}

defaultproperties
{
	bHidden=true
	RemoteRole=0
}
