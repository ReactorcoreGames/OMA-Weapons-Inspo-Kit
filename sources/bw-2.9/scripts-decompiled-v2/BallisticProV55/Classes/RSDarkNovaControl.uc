class RSDarkNovaControl extends Info
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var array<RSBlackHole> BlackHoles;

function RSBlackHole GetNearestBlackHole(Vector V, optional out float BestDist)
{
	local int i;
	local float dist;
	local RSBlackHole Best;

	BestDist = 999999.0000000;
	i = 0;
	J0x12:

	// End:0xAF [Loop If]
	if(i < BlackHoles.Length)
	{
		// End:0x36
		if(BlackHoles[i] == none)
		{
			// [Explicit Continue]
			goto J0xA5;
		}
		dist = VSize(BlackHoles[i].Location - V);
		// End:0xA5
		if((dist < BestDist) && FastTrace(BlackHoles[i].Location, V))
		{
			Best = BlackHoles[i];
			BestDist = dist;
		}
		J0xA5:

		i++;
		// [Loop Continue]
		goto J0x12;
	}
	return Best;
	//return;	
}

function AddBlackHole(RSBlackHole bh)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x45 [Loop If]
	if(i < BlackHoles.Length)
	{
		// End:0x3B
		if(BlackHoles[i] == none)
		{
			BlackHoles[i] = bh;
			return;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	BlackHoles[BlackHoles.Length] = bh;
	//return;	
}

