class Z250FireControl extends RX22AFireControl
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function MakeNewFire(Vector loc, Vector Norm, Pawn instigatedBy, Actor HitActor)
{
	GasNodes[GasNodes.Length] = Spawn(Class'BWBP_OP_Pro.Z250SurfaceFire', instigatedBy,, loc, Rotator(Norm));
	GroundFires[GroundFires.Length] = RX22ASurfaceFire(GasNodes[GasNodes.Length - 1]);
	// End:0xAC
	if(RX22ASurfaceFire(GasNodes[GasNodes.Length - 1]) != none)
	{
		RX22ASurfaceFire(GasNodes[GasNodes.Length - 1]).GasControl = self;
		// End:0xAC
		if(HitActor != none)
		{
			RX22ASurfaceFire(GasNodes[GasNodes.Length - 1]).SetBase(HitActor);
		}
	}
	//return;	
}

function MakeNewPool(Vector loc, Vector Norm, Pawn instigatedBy, Actor HitActor)
{
	GasNodes[GasNodes.Length] = Spawn(Class'BWBP_OP_Pro.Z250GasPatch', instigatedBy,, loc, Rotator(Norm));
	// End:0xA2
	if((GasNodes[GasNodes.Length - 1] != none) && RX22AGasPatch(GasNodes[GasNodes.Length - 1]) != none)
	{
		RX22AGasPatch(GasNodes[GasNodes.Length - 1]).GasControl = self;
		// End:0xA2
		if(HitActor != none)
		{
			RX22AGasPatch(GasNodes[GasNodes.Length - 1]).SetBase(HitActor);
		}
	}
	//return;	
}

function MakeNewCloud(Vector loc, Pawn instigatedBy)
{
	GasNodes[GasNodes.Length] = Spawn(Class'BWBP_OP_Pro.Z250GasCloud', instigatedBy,, loc);
	RX22AGasCloud(GasNodes[GasNodes.Length - 1]).GasControl = self;
	//return;	
}

function MakeNewSoaker(Actor Other, Pawn instigatedBy)
{
	GasNodes[GasNodes.Length] = Spawn(Class'BWBP_OP_Pro.Z250GasSoak', instigatedBy,, Other.Location, Other.Rotation);
	RX22AGasSoak(GasNodes[GasNodes.Length - 1]).GasControl = self;
	RX22AGasSoak(GasNodes[GasNodes.Length - 1]).SetBase(Other);
	//return;	
}

function MakeNewBurner(Actor Other, int Fuel, Pawn instigatedBy)
{
	local RX22AActorFire PF;

	PF = Spawn(Class'BWBP_OP_Pro.Z250ActorFire', instigatedBy,, Other.Location, Other.Rotation);
	PF.SetFuel(float(Fuel));
	PF.Initialize(Other);
	GasNodes[GasNodes.Length] = PF;
	PF.GasControl = self;
	//return;	
}

