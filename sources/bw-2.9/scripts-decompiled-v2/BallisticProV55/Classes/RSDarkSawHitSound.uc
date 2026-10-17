class RSDarkSawHitSound extends Actor
	notplaceable;

function SetNoise(Sound NewSound)
{
	AmbientSound = NewSound;
	SetTimer(0.1500000, false);
	//return;	
}

event Timer()
{
	AmbientSound = none;
	//return;	
}

defaultproperties
{
	bHidden=true
	RemoteRole=0
	bFullVolume=true
	SoundVolume=255
	SoundRadius=32.0000000
}
