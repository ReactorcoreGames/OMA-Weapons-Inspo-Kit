class TransbeaconTeleporter extends Keypoint;

var() name JumpSpotTag;
var JumpSpot myJumpSpot;

function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	// End:0x2F
	if(JumpSpotTag != 'None')
	{
		// End:0x2E
		foreach AllActors(Class'UnrealGame.JumpSpot', myJumpSpot, JumpSpotTag)
		{
			// End:0x2E
			break;			
		}		
	}
	//return;	
}

event Touch(Actor Other)
{
	// End:0x1F
	if((TransBeacon(Other) == none) || myJumpSpot == none)
	{
		return;
	}
	Other.SetLocation(myJumpSpot.Location);
	// End:0x71
	if(TransBeacon(Other).Trail != none)
	{
		TransBeacon(Other).Trail.mRegen = false;
	}
	//return;	
}

defaultproperties
{
	CollisionRadius=30.0000000
	CollisionHeight=30.0000000
	bCollideActors=true
}
