class CoachGunFireControl extends RX22AFireControl
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x1F
	if(int(Role) == int(ROLE_Authority))
	{
		SetTimer(0.4000000, true);
	}
	//return;	
}

function Timer()
{
	local int i, j, k;
	local array<Actor> Served;

	i = 0;
	J0x07:

	// End:0x14F [Loop If]
	if(i < GroundFires.Length)
	{
		j = 0;
		J0x1E:

		// End:0x145 [Loop If]
		if(j < GroundFires[i].Touching.Length)
		{
			// End:0x87
			if((GroundFires[i].Touching[j] == none) || Pawn(GroundFires[i].Touching[j]) == none)
			{
				// [Explicit Continue]
				goto J0x13B;
			}
			k = 0;
			J0x8E:

			// End:0xD5 [Loop If]
			if(k < Served.Length)
			{
				// End:0xCB
				if(Served[k] == GroundFires[i].Touching[j])
				{
					// [Explicit Break]
					goto J0xD5;
				}
				k++;
				// [Loop Continue]
				goto J0x8E;
			}
			J0xD5:

			// End:0x13B
			if(k >= Served.Length)
			{
				GroundFires[i].Toast(GroundFires[i].Touching[j]);
				Served[Served.Length] = GroundFires[i].Touching[j];
			}
			J0x13B:

			j++;
			// [Loop Continue]
			goto J0x1E;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

simulated function FireShotRotated(Vector Start, Vector End, float dist, bool bHit, Vector HitNorm, Pawn instigatedBy, Actor HitActor, Rotator Dir)
{
	local CoachGunFlameProjectile proj;
	local int i;

	proj = Spawn(Class'BWBP_SKC_Pro.CoachGunFlameProjectile', instigatedBy,, Start, Dir);
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

function FireSinge(Pawn P, Pawn instigatedBy)
{
	local BW_FuelPatch Patch;
	local int i;

	// End:0x2A
	if(HasBurner(P, Patch))
	{
		Patch.AddFuel(0.5000000);		
	}
	else
	{
		i = 0;
		J0x31:

		// End:0xC8 [Loop If]
		if(i < SingeVictims.Length)
		{
			// End:0xBE
			if(SingeVictims[i].Vic == P)
			{
				SingeVictims[i].NextReduceTime = Level.TimeSeconds + 2.0000000;
				SingeVictims[i].Burns++;
				// End:0xBC
				if(SingeVictims[i].Burns > 10)
				{
					MakeNewBurner(P, 5, instigatedBy);
				}
				return;
			}
			i++;
			// [Loop Continue]
			goto J0x31;
		}
		SingeVictims.Length = i + 1;
		SingeVictims[i].NextReduceTime = Level.TimeSeconds + 2.0000000;
		SingeVictims[i].Vic = P;
		SingeVictims[i].Burns = 1;
	}
	//return;	
}

simulated function DoFlameHit(FlameHit Hit)
{
	local int i;
	local BW_FuelPatch Other;

	BurnRadius(4.0000000, 256.0000000, Class'BWBP_SKC_Pro.DT_CoachBurned', 0.0000000, Hit.HitLoc, Hit.Instigator);
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

function PatchRemove(Emitter Other)
{
	local int i;

	i = GetNodeIndex(Other);
	// End:0x2C
	if(i > -1)
	{
		GasNodes.Remove(i, 1);
	}
	// End:0x90
	if(RX22ASurfaceFire(Other) != none)
	{
		i = 0;
		J0x43:

		// End:0x74 [Loop If]
		if((i < GroundFires.Length) && Other != GroundFires[i])
		{
			i++;
			// [Loop Continue]
			goto J0x43;
		}
		// End:0x90
		if(i < GroundFires.Length)
		{
			GroundFires.Remove(i, 1);
		}
	}
	//return;	
}

function PatchReplace(BW_FuelPatch OldPatch, BW_FuelPatch NewPatch)
{
	GasNodes[GetNodeIndex(OldPatch)] = NewPatch;
	// End:0x3E
	if(RX22ASurfaceFire(NewPatch) != none)
	{
		GroundFires[GroundFires.Length] = RX22ASurfaceFire(NewPatch);
	}
	//return;	
}

function bool HasSoak(Actor Other, out BW_FuelPatch Patch)
{
	local int i;

	i = 0;
	J0x07:

	// End:0xA2 [Loop If]
	if(i < GasNodes.Length)
	{
		// End:0x98
		if((GasNodes[i] != none) && (GasNodes[i].Base == Other) || (RX22AActorFire(GasNodes[i]) != none) && RX22AActorFire(GasNodes[i]).Victim == Other)
		{
			Patch = GasNodes[i];
			return true;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return false;
	//return;	
}

function bool HasBurner(Actor Other, out BW_FuelPatch Patch)
{
	local int i;

	i = 0;
	J0x07:

	// End:0xA2 [Loop If]
	if(i < GasNodes.Length)
	{
		// End:0x98
		if(((GasNodes[i] != none) && RX22AActorFire(GasNodes[i]) != none) && (RX22AActorFire(GasNodes[i]).Victim == Other) || GasNodes[i].Base == Other)
		{
			Patch = GasNodes[i];
			return true;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return false;
	//return;	
}

function MakeNewFire(Vector loc, Vector Norm, Pawn instigatedBy, Actor HitActor)
{
	GasNodes[GasNodes.Length] = Spawn(Class'BWBP_SKC_Pro.CoachGunSurfaceFire', instigatedBy,, loc, Rotator(Norm));
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

function MakeNewBurner(Actor Other, int Fuel, Pawn instigatedBy)
{
	local CoachGunActorFire PF;

	PF = Spawn(Class'BWBP_SKC_Pro.CoachGunActorFire', instigatedBy,, Other.Location, Other.Rotation);
	PF.SetFuel(float(Fuel));
	PF.Initialize(Other);
	GasNodes[GasNodes.Length] = PF;
	PF.GasControl = self;
	//return;	
}

