class RailgunAttachment extends BallisticAttachment;

var Vector WallEntrys[4];
var Vector WallExits[4];

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		WallEntrys, WallExits;
}

simulated event ThirdPersonEffects()
{
	local int i;

	// End:0x9F
	if((int(Level.NetMode) == int(NM_Client)) && Instigator != none)
	{
		i = 0;
		J0x2D:

		// End:0x9F [Loop If]
		if(i < 4)
		{
			// End:0x67
			if(WallEntrys[i] != vect(0.0000000, 0.0000000, 0.0000000))
			{
				RailgunWallEnter(WallEntrys[i]);
			}
			// End:0x95
			if(WallExits[i] != vect(0.0000000, 0.0000000, 0.0000000))
			{
				RailgunWallExit(WallExits[i]);
			}
			i++;
			// [Loop Continue]
			goto J0x2D;
		}
	}
	super.ThirdPersonEffects();
	//return;	
}

function UpdateWallEntrys(array<Vector> EntryLocations)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x60 [Loop If]
	if(i < 4)
	{
		// End:0x3F
		if(i >= EntryLocations.Length)
		{
			WallEntrys[i] = vect(0.0000000, 0.0000000, 0.0000000);
			// [Explicit Continue]
			goto J0x56;
		}
		WallEntrys[i] = EntryLocations[i];
		J0x56:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

function UpdateWallExits(array<Vector> ExitLocations)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x60 [Loop If]
	if(i < 4)
	{
		// End:0x3F
		if(i >= ExitLocations.Length)
		{
			WallExits[i] = vect(0.0000000, 0.0000000, 0.0000000);
			// [Explicit Continue]
			goto J0x56;
		}
		WallExits[i] = ExitLocations[i];
		J0x56:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

simulated function RailgunWallEnter(Vector HitLocation, optional Vector HitNormal, optional int HitSurf, optional Vector X, optional Actor Other)
{
	local Vector Start;
	local Material HitMat;

	// End:0xD7
	if(int(Level.NetMode) == int(NM_Client))
	{
		Start = Instigator.Location + Instigator.EyePosition();
		X = Normal(HitLocation - Start);
		Other = Trace(HitLocation, HitNormal, HitLocation + (X * float(10)), HitLocation - (X * float(5)), false,, HitMat);
		// End:0x9D
		if(Other == none)
		{
			return;
		}
		// End:0xC1
		if(HitMat == none)
		{
			HitSurf = int(Other.SurfaceType);			
		}
		else
		{
			HitSurf = int(HitMat.SurfaceType);
		}
	}
	// End:0x105
	if(ImpactManager != none)
	{
		ImpactManager.static.StartSpawn(HitLocation, HitNormal, HitSurf, Instigator);
	}
	//return;	
}

simulated function RailgunWallExit(Vector HitLocation, optional Vector HitNormal, optional int HitSurf, optional Vector X, optional Actor Other)
{
	local Vector Start;
	local Material HitMat;

	// End:0xD7
	if(int(Level.NetMode) == int(NM_Client))
	{
		Start = Instigator.Location + Instigator.EyePosition();
		X = Normal(HitLocation - Start);
		Other = Trace(HitLocation, HitNormal, HitLocation - (X * float(10)), HitLocation + (X * float(5)), false,, HitMat);
		// End:0x9D
		if(Other == none)
		{
			return;
		}
		// End:0xC1
		if(HitMat == none)
		{
			HitSurf = int(Other.SurfaceType);			
		}
		else
		{
			HitSurf = int(HitMat.SurfaceType);
		}
	}
	// End:0x105
	if(ImpactManager != none)
	{
		ImpactManager.static.StartSpawn(HitLocation, HitNormal, HitSurf, Instigator);
	}
	//return;	
}

