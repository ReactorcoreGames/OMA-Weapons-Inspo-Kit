class RX22AFireControl extends Info
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct SingeVictim
{
	var Pawn Vic;
	var int Burns;
	var float NextReduceTime;
};

struct FlameHit
{
	var Pawn Instigator;
	var Vector HitLoc;
	var Vector HitNorm;
	var float HitTime;
	var Actor HitActor;
};

struct SingeSpot
{
	var Vector loc;
	var int Hits;
	var RX22ASurfaceFire Fire;
};

var array<BW_FuelPatch> GasNodes;
var array<RX22ASurfaceFire> GroundFires;
var array<SingeVictim> SingeVictims;
var array<FlameHit> FlameHits;
var array<SingeSpot> SingeSpots;

simulated function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
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

	// End:0x176 [Loop If]
	if(i < GroundFires.Length)
	{
		j = 0;
		J0x1E:

		// End:0x16C [Loop If]
		if(j < GroundFires[i].Touching.Length)
		{
			// End:0xAE
			if((GroundFires[i].Touching[j] == none) || (Pawn(GroundFires[i].Touching[j]) == none) && BW_FuelPatch(GroundFires[i].Touching[j]) == none)
			{
				// [Explicit Continue]
				goto J0x162;
			}
			k = 0;
			J0xB5:

			// End:0xFC [Loop If]
			if(k < Served.Length)
			{
				// End:0xF2
				if(Served[k] == GroundFires[i].Touching[j])
				{
					// [Explicit Break]
					goto J0xFC;
				}
				k++;
				// [Loop Continue]
				goto J0xB5;
			}
			J0xFC:

			// End:0x162
			if(k >= Served.Length)
			{
				GroundFires[i].Toast(GroundFires[i].Touching[j]);
				Served[Served.Length] = GroundFires[i].Touching[j];
			}
			J0x162:

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

simulated function FireShot(Vector Start, Vector End, float dist, bool bHit, Vector HitNorm, Pawn instigatedBy, Actor HitActor)
{
	local RX22AProjectile proj;
	local int i;

	proj = Spawn(Class'BallisticProV55.RX22AProjectile', instigatedBy,, Start, Rotator(End - Start));
	// End:0x6A
	if(proj != none)
	{
		proj.Instigator = instigatedBy;
		proj.FireControl = self;
		proj.InitFlame(End);
	}
	// End:0x115
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

	BurnRadius(4.0000000, 256.0000000, Class'BallisticProV55.DTRX22ABurned', 0.0000000, Hit.HitLoc, Hit.Instigator);
	// End:0x5D
	if(NearFire(Hit.HitLoc, Other))
	{
		Other.AddFuel(0.5000000);		
	}
	else
	{
		// End:0x1AE
		if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
		{
			i = 0;
			J0x76:

			// End:0x131 [Loop If]
			if(i < SingeSpots.Length)
			{
				// End:0x127
				if(VSize(SingeSpots[i].loc - Hit.HitLoc) < float(128))
				{
					SingeSpots[i].Hits++;
					// End:0x124
					if(SingeSpots[i].Hits > 3)
					{
						MakeNewFire(Hit.HitLoc + (Hit.HitNorm * float(32)), Hit.HitNorm, Hit.Instigator, Hit.HitActor);
						SingeSpots.Remove(i, 1);
						return;
					}
					// [Explicit Break]
					goto J0x131;
				}
				i++;
				// [Loop Continue]
				goto J0x76;
			}
			J0x131:

			// End:0x1AE
			if(i >= SingeSpots.Length)
			{
				i = SingeSpots.Length;
				SingeSpots.Length = i + 1;
				SingeSpots[i].loc = Hit.HitLoc;
				SingeSpots[i].Hits = 1;
				Class'BallisticProV55.IM_RX22AScorch'.static.StartSpawn(Hit.HitLoc, Hit.HitNorm, 0, self);
			}
		}
	}
	//return;	
}

function SprayWall(Vector loc, Vector Norm, Pawn instigatedBy, Actor HitActor)
{
	local BW_FuelPatch Other;

	// End:0x2A
	if(NearPool(loc, Other))
	{
		Other.AddFuel(1.0000000);		
	}
	else
	{
		MakeNewPool(loc, Norm, instigatedBy, HitActor);
	}
	//return;	
}

function SprayAir(Vector loc, Pawn instigatedBy)
{
	local BW_FuelPatch Other;

	// End:0x2A
	if(NearCloud(loc, Other))
	{
		Other.AddFuel(1.5000000);		
	}
	else
	{
		MakeNewCloud(loc, instigatedBy);
	}
	//return;	
}

function SpraySoak(Actor Other, Pawn instigatedBy, optional float FuelAmount)
{
	local BW_FuelPatch Patch;
	local Vector Dummy;

	// End:0x18
	if(FuelAmount == float(0))
	{
		FuelAmount = 1.0000000;
	}
	// End:0x42
	if(HasSoak(Other, Patch))
	{
		Patch.AddFuel(FuelAmount);		
	}
	else
	{
		// End:0xAB
		if((xPawn(Other) != none) && Level.Game.ReduceDamage(10, xPawn(Other), instigatedBy, Other.Location, Dummy, Class'BallisticProV55.DTRX22ABurned') > 0)
		{
			MakeNewSoaker(Other, instigatedBy);
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

event Tick(float dt)
{
	local int i;

	super(Actor).Tick(dt);
	i = 0;
	J0x12:

	// End:0x73 [Loop If]
	if(i < FlameHits.Length)
	{
		// End:0x69
		if(Level.TimeSeconds >= FlameHits[i].HitTime)
		{
			DoFlameHit(FlameHits[i]);
			FlameHits.Remove(i, 1);
			i--;
		}
		i++;
		// [Loop Continue]
		goto J0x12;
	}
	i = 0;
	J0x7A:

	// End:0x11B [Loop If]
	if(i < SingeVictims.Length)
	{
		// End:0x111
		if(Level.TimeSeconds >= SingeVictims[i].NextReduceTime)
		{
			SingeVictims[i].Burns--;
			// End:0xEB
			if(SingeVictims[i].Burns < 1)
			{
				SingeVictims.Remove(i, 1);
				i--;
				// [Explicit Continue]
				goto J0x111;
			}
			SingeVictims[i].NextReduceTime = Level.TimeSeconds + 0.2500000;
		}
		J0x111:

		i++;
		// [Loop Continue]
		goto J0x7A;
	}
	//return;	
}

simulated function BurnRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, Pawn instigatedBy, optional Actor Victim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir, Dummy;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x201
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x200
		if((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim)
		{
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x14D
			if((xPawn(Victims) != none) && Level.Game.ReduceDamage(int(damageScale * DamageAmount), xPawn(Victims), instigatedBy, HitLocation, Dummy, DamageType) <= 0)
			{
				continue;				
			}
			// End:0x187
			if((Pawn(Victims) != none) && (FRand() - 0.4000000) < damageScale)
			{
				FireSinge(Pawn(Victims), instigatedBy);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, instigatedBy, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

function int GetNodeIndex(Emitter Other)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x63 [Loop If]
	if(i < GasNodes.Length)
	{
		// End:0x3E
		if(GasNodes[i] == none)
		{
			GasNodes.Remove(i, 1);
			i--;
			// [Explicit Continue]
			goto J0x59;
		}
		// End:0x59
		if(GasNodes[i] == Other)
		{
			return i;
		}
		J0x59:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return -1;
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
	GasNodes[GasNodes.Length] = Spawn(Class'BallisticProV55.RX22ASurfaceFire', instigatedBy,, loc, Rotator(Norm));
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
	GasNodes[GasNodes.Length] = Spawn(Class'BallisticProV55.RX22AGasPatch', instigatedBy,, loc, Rotator(Norm));
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
	GasNodes[GasNodes.Length] = Spawn(Class'BallisticProV55.RX22AGasCloud', instigatedBy,, loc);
	RX22AGasCloud(GasNodes[GasNodes.Length - 1]).GasControl = self;
	//return;	
}

function MakeNewSoaker(Actor Other, Pawn instigatedBy)
{
	GasNodes[GasNodes.Length] = Spawn(Class'BallisticProV55.RX22AGasSoak', instigatedBy,, Other.Location, Other.Rotation);
	RX22AGasSoak(GasNodes[GasNodes.Length - 1]).GasControl = self;
	RX22AGasSoak(GasNodes[GasNodes.Length - 1]).SetBase(Other);
	//return;	
}

function MakeNewBurner(Actor Other, int Fuel, Pawn instigatedBy)
{
	local RX22AActorFire PF;

	PF = Spawn(Class'BallisticProV55.RX22AActorFire', instigatedBy,, Other.Location, Other.Rotation);
	PF.SetFuel(float(Fuel));
	PF.Initialize(Other);
	GasNodes[GasNodes.Length] = PF;
	PF.GasControl = self;
	//return;	
}

function bool NearFire(Vector loc, out BW_FuelPatch Other)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x7F [Loop If]
	if(i < GasNodes.Length)
	{
		// End:0x75
		if((GasNodes[i] != none) && VSize(GasNodes[i].Location - loc) < float(GasNodes[i].Extent))
		{
			Other = GasNodes[i];
			return true;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return false;
	//return;	
}

function bool NearPool(Vector loc, out BW_FuelPatch Other)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x7F [Loop If]
	if(i < GasNodes.Length)
	{
		// End:0x75
		if((GasNodes[i] != none) && VSize(GasNodes[i].Location - loc) < float(GasNodes[i].Extent))
		{
			Other = GasNodes[i];
			return true;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return false;
	//return;	
}

function bool NearCloud(Vector loc, out BW_FuelPatch Other)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x7F [Loop If]
	if(i < GasNodes.Length)
	{
		// End:0x75
		if((GasNodes[i] != none) && VSize(GasNodes[i].Location - loc) < float(GasNodes[i].Extent))
		{
			Other = GasNodes[i];
			return true;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return false;
	//return;	
}

defaultproperties
{
	RemoteRole=2
	bNetNotify=true
}
