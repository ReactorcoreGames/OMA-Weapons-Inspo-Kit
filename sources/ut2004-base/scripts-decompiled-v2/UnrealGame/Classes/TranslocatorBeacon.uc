class TranslocatorBeacon extends Projectile;

var TranslocatorBeacon NextBeacon;

function PostBeginPlay()
{
	local UnrealMPGameInfo G;

	super.PostBeginPlay();
	// End:0x5B
	if(!bDeleteMe)
	{
		G = UnrealMPGameInfo(Level.Game);
		// End:0x37
		if(G == none)
		{
			return;
		}
		NextBeacon = G.BeaconList;
		G.BeaconList = self;
	}
	//return;	
}

function bool Disrupted()
{
	return false;
	//return;	
}

function Destroyed()
{
	local UnrealMPGameInfo G;
	local TranslocatorBeacon t;

	super(Actor).Destroyed();
	G = UnrealMPGameInfo(Level.Game);
	// End:0x2C
	if(G == none)
	{
		return;
	}
	// End:0x57
	if(G.BeaconList == self)
	{
		G.BeaconList = NextBeacon;		
	}
	else
	{
		t = G.BeaconList;
		J0x6B:

		// End:0xB7 [Loop If]
		if(t != none)
		{
			// End:0xA0
			if(t.NextBeacon == self)
			{
				t.NextBeacon = NextBeacon;
				return;
			}
			t = t.NextBeacon;
			// [Loop Continue]
			goto J0x6B;
		}
	}
	//return;	
}

defaultproperties
{
	LifeSpan=0.0000000
}
