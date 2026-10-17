class Supercharger_ChargeControl extends Info
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
	var int TriggerType;
};

struct SingeSpot
{
	var Vector loc;
	var int Hits;
	var RX22ASurfaceFire Fire;
};

var array<SingeVictim> SingeVictims;
var array<FlameHit> FlameHits;
var array<SingeSpot> SingeSpots;

simulated function FireShot(Vector Start, Vector End, float dist, bool bHit, Vector HitNorm, Pawn instigatedBy, Actor HitActor, int triggerWeaponType)
{
	local Supercharger_ZapProjectile Proj1;
	local AK91_ZapProjectile Proj2;
	local int i;

	// End:0x78
	if(triggerWeaponType == 1)
	{
		Proj1 = Spawn(Class'BWBP_SKC_Pro.Supercharger_ZapProjectile', instigatedBy,, Start, Rotator(End - Start));
		// End:0x75
		if(Proj1 != none)
		{
			Proj1.Instigator = instigatedBy;
			Proj1.ChargeControl = self;
			Proj1.InitFlame(End);
		}		
	}
	else
	{
		// End:0xEE
		if(triggerWeaponType == 2)
		{
			Proj2 = Spawn(Class'BWBP_SKC_Pro.AK91_ZapProjectile', instigatedBy,, Start, Rotator(End - Start));
			// End:0xEE
			if(Proj2 != none)
			{
				Proj2.Instigator = instigatedBy;
				Proj2.ChargeControl = self;
				Proj2.InitFlame(End);
			}
		}
	}
	// End:0x1AF
	if(bHit)
	{
		i = FlameHits.Length;
		FlameHits.Length = i + 1;
		FlameHits[i].Instigator = instigatedBy;
		FlameHits[i].HitLoc = End;
		FlameHits[i].HitNorm = HitNorm;
		FlameHits[i].HitTime = Level.TimeSeconds + (dist / float(3600));
		FlameHits[i].HitActor = HitActor;
		FlameHits[i].TriggerType = triggerWeaponType;
	}
	//return;	
}

simulated function FireSinge(Pawn P, Pawn instigatedBy, int TriggerType, optional int numZaps)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x13E [Loop If]
	if(i < SingeVictims.Length)
	{
		// End:0x134
		if(SingeVictims[i].Vic == P)
		{
			SingeVictims[i].NextReduceTime = Level.TimeSeconds + 2.0000000;
			// End:0x77
			if(numZaps == 0)
			{
				SingeVictims[i].Burns++;				
			}
			else
			{
				SingeVictims[i].Burns += numZaps;
			}
			// End:0xE0
			if((SingeVictims[i].Burns == 15) || (numZaps > 1) && SingeVictims[i].Burns >= 15)
			{
				MakeNewExploder(P, instigatedBy, TriggerType);
			}
			// End:0x132
			if((SingeVictims[i].Burns == 10) || (numZaps > 1) && SingeVictims[i].Burns >= 10)
			{
				MakeNewBurner(P, instigatedBy, TriggerType);
			}
			return;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	SingeVictims.Length = i + 1;
	SingeVictims[i].NextReduceTime = Level.TimeSeconds + 2.0000000;
	SingeVictims[i].Vic = P;
	SingeVictims[i].Burns = 1;
	//return;	
}

simulated function DoFlameHit(FlameHit Hit)
{
	local int i, LocalTriggerType;

	LocalTriggerType = Hit.TriggerType;
	// End:0x51
	if(LocalTriggerType == 1)
	{
		BurnRadius(2.0000000, 128.0000000, Class'BWBP_SKC_Pro.DT_SuperchargeZapped', 0.0000000, Hit.HitLoc, Hit.Instigator, LocalTriggerType);		
	}
	else
	{
		// End:0x90
		if(LocalTriggerType == 2)
		{
			BurnRadius(2.0000000, 128.0000000, Class'BWBP_SKC_Pro.DT_AK91Zapped', 0.0000000, Hit.HitLoc, Hit.Instigator, LocalTriggerType);
		}
	}
	i = 0;
	J0x97:

	// End:0x1D0 [Loop If]
	if(i < SingeSpots.Length)
	{
		// End:0x1C6
		if(VSize(SingeSpots[i].loc - Hit.HitLoc) < float(128))
		{
			SingeSpots[i].Hits++;
			// End:0x1C3
			if(SingeSpots[i].Hits > 20)
			{
				Class'BWBP_SKC_Pro.IM_XMBurst'.static.StartSpawn(Hit.HitLoc + (Hit.HitNorm * float(32)), Hit.HitNorm, 0, self);
				// End:0x171
				if(Hit.TriggerType == 1)
				{
					BurnRadius(50.0000000, 300.0000000, Class'BWBP_SKC_Pro.DT_Supercharge', 500.0000000, Hit.HitLoc, Hit.Instigator, LocalTriggerType);
				}
				// End:0x1B5
				if(Hit.TriggerType == 2)
				{
					BurnRadius(50.0000000, 300.0000000, Class'BWBP_SKC_Pro.DT_AK91Supercharge', 500.0000000, Hit.HitLoc, Hit.Instigator, LocalTriggerType);
				}
				SingeSpots.Remove(i, 1);
				return;
			}
			// [Explicit Break]
			goto J0x1D0;
		}
		i++;
		// [Loop Continue]
		goto J0x97;
	}
	J0x1D0:

	// End:0x24D
	if(i >= SingeSpots.Length)
	{
		i = SingeSpots.Length;
		SingeSpots.Length = i + 1;
		SingeSpots[i].loc = Hit.HitLoc;
		SingeSpots[i].Hits = 1;
		Class'BWBP_SKC_Pro.IM_LS14Impacted'.static.StartSpawn(Hit.HitLoc, Hit.HitNorm, 0, self);
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

simulated function BurnRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, Pawn instigatedBy, int TriggerType, optional Actor Victim)
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
	// End:0x206
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x205
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
			// End:0x18C
			if((Pawn(Victims) != none) && (FRand() - 0.4000000) < damageScale)
			{
				FireSinge(Pawn(Victims), instigatedBy, TriggerType);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, instigatedBy, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

simulated function MakeNewBurner(Actor Other, Pawn instigatedBy, int TriggerType)
{
	local Supercharger_ActorFire PF1;
	local AK91_ActorFire PF2;

	// End:0x66
	if(TriggerType == 1)
	{
		PF1 = Spawn(Class'BWBP_SKC_Pro.Supercharger_ActorFire', instigatedBy,, Other.Location, Other.Rotation);
		PF1.SetFuel(5.0000000);
		PF1.Initialize(Other);		
	}
	else
	{
		// End:0xCA
		if(TriggerType == 2)
		{
			PF2 = Spawn(Class'BWBP_SKC_Pro.AK91_ActorFire', instigatedBy,, Other.Location, Other.Rotation);
			PF2.SetFuel(5.0000000);
			PF2.Initialize(Other);
		}
	}
	//return;	
}

simulated function MakeNewExploder(Actor Other, Pawn instigatedBy, int TriggerType)
{
	local Supercharger_Detonator Proj1;
	local AK91_Detonator Proj2;

	// End:0x5D
	if(TriggerType == 1)
	{
		Proj1 = Spawn(Class'BWBP_SKC_Pro.Supercharger_Detonator', instigatedBy,, Other.Location, Other.Rotation);
		// End:0x5A
		if(Proj1 != none)
		{
			Proj1.Instigator = instigatedBy;
		}		
	}
	else
	{
		// End:0xB8
		if(TriggerType == 2)
		{
			Proj2 = Spawn(Class'BWBP_SKC_Pro.AK91_Detonator', instigatedBy,, Other.Location, Other.Rotation);
			// End:0xB8
			if(Proj2 != none)
			{
				Proj2.Instigator = instigatedBy;
			}
		}
	}
	//return;	
}

defaultproperties
{
	RemoteRole=2
	bNetNotify=true
}
