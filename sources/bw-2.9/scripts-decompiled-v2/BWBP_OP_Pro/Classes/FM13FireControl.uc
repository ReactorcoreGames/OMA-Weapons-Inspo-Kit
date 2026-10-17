class FM13FireControl extends RX22AFireControl
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

simulated function FireShotRotated(Vector Start, Vector End, float dist, bool bHit, Vector HitNorm, Pawn instigatedBy, Actor HitActor, Rotator Dir)
{
	local FM13FlameProjectile proj;
	local int i;

	proj = Spawn(Class'BWBP_OP_Pro.FM13FlameProjectile', instigatedBy,, Start, Dir);
	// End:0x61
	if(proj != none)
	{
		proj.Instigator = instigatedBy;
		proj.FireControl = self;
		proj.InitFlame(End);
	}
	// End:0x10C
	if(bHit)
	{
		i = FlameHits.Length;
		FlameHits.Length = i + 1;
		FlameHits[i].Instigator = instigatedBy;
		FlameHits[i].HitLoc = End;
		FlameHits[i].HitNorm = HitNorm;
		FlameHits[i].HitTime = Level.TimeSeconds + (dist / float(3600));
		FlameHits[i].HitActor = HitActor;
	}
	//return;	
}

simulated function DoFlameHit(FlameHit Hit)
{
	local int i;
	local BW_FuelPatch Other;

	BurnRadius(4.0000000, 256.0000000, Class'BWBP_OP_Pro.DT_FM13Burned', 0.0000000, Hit.HitLoc, Hit.Instigator);
	// End:0x5D
	if(NearFire(Hit.HitLoc, Other))
	{
		Other.AddFuel(0.5000000);		
	}
	else
	{
		i = 0;
		J0x64:

		// End:0x11F [Loop If]
		if(i < SingeSpots.Length)
		{
			// End:0x115
			if(VSize(SingeSpots[i].loc - Hit.HitLoc) < float(128))
			{
				SingeSpots[i].Hits++;
				// End:0x112
				if(SingeSpots[i].Hits > 3)
				{
					MakeNewFire(Hit.HitLoc + (Hit.HitNorm * float(32)), Hit.HitNorm, Hit.Instigator, Hit.HitActor);
					SingeSpots.Remove(i, 1);
					return;
				}
				// [Explicit Break]
				goto J0x11F;
			}
			i++;
			// [Loop Continue]
			goto J0x64;
		}
		J0x11F:

		// End:0x19C
		if(i >= SingeSpots.Length)
		{
			i = SingeSpots.Length;
			SingeSpots.Length = i + 1;
			SingeSpots[i].loc = Hit.HitLoc;
			SingeSpots[i].Hits = 1;
			Class'BallisticProV55.IM_RX22AScorch'.static.StartSpawn(Hit.HitLoc, Hit.HitNorm, 0, self);
		}
	}
	//return;	
}

function MakeNewFire(Vector loc, Vector Norm, Pawn instigatedBy, Actor HitActor)
{
	GasNodes[GasNodes.Length] = Spawn(Class'BWBP_OP_Pro.FM13SurfaceFire', instigatedBy,, loc, Rotator(Norm));
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
	GasNodes[GasNodes.Length] = Spawn(Class'BWBP_OP_Pro.FM13GasPatch', instigatedBy,, loc, Rotator(Norm));
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
	GasNodes[GasNodes.Length] = Spawn(Class'BWBP_OP_Pro.FM13GasCloud', instigatedBy,, loc);
	RX22AGasCloud(GasNodes[GasNodes.Length - 1]).GasControl = self;
	//return;	
}

function MakeNewSoaker(Actor Other, Pawn instigatedBy)
{
	GasNodes[GasNodes.Length] = Spawn(Class'BWBP_OP_Pro.FM13GasSoak', instigatedBy,, Other.Location, Other.Rotation);
	RX22AGasSoak(GasNodes[GasNodes.Length - 1]).GasControl = self;
	RX22AGasSoak(GasNodes[GasNodes.Length - 1]).SetBase(Other);
	//return;	
}

function MakeNewBurner(Actor Other, int Fuel, Pawn instigatedBy)
{
	local RX22AActorFire PF;

	PF = Spawn(Class'BWBP_OP_Pro.FM13ActorFire', instigatedBy,, Other.Location, Other.Rotation);
	PF.SetFuel(float(Fuel));
	PF.Initialize(Other);
	GasNodes[GasNodes.Length] = PF;
	PF.GasControl = self;
	//return;	
}

