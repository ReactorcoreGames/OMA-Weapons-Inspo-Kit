class FP7FireControl extends Actor
	notplaceable;

const MAX_FIRE_SPOTS = 40;

struct HitPawnInfo
{
	var Pawn HitPawn;
	var float HitTime;
};

var int Ident;
var() float DamageRadius;
var bool bHeld;
var Vector GroundFireSpots[40];
var() Class<BCImpactManager> ImpactManager;
var array<HitPawnInfo> HitPawnData;
var float Damage;
var float BaseDamage;
var float RepulsionForceMag;
var array<FP7GroundFire> Fires;
var bool bClientFiresSpawned;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		GroundFireSpots;
}

function Reset()
{
	Destroy();
	//return;	
}

function TryDamage(Pawn Victim, float Interval, Class<DamageType> DamageType)
{
	local int Index;

	// End:0x0D
	if(Victim == none)
	{
		return;
	}
	Index = FindIndex(Victim);
	// End:0xCA
	if(((HitPawnData[Index].HitTime + Interval) < Level.TimeSeconds) || HitPawnData[Index].HitTime == float(0))
	{
		HitPawnData[Index].HitTime = Level.TimeSeconds;
		// End:0xCA
		if(Instigator != none)
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, Damage, Instigator, Victim.Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
		}
	}
	//return;	
}

function int FindIndex(Pawn Sought)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x3D [Loop If]
	if((i < HitPawnData.Length) && Sought != HitPawnData[i].HitPawn)
	{
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0x72
	if(i == HitPawnData.Length)
	{
		HitPawnData.Length = i + 1;
		HitPawnData[i].HitPawn = Sought;
	}
	return i;
	//return;	
}

function NotifyPutOut(Vector DouseLoc, float DouseRad)
{
	local int i;

	i = 0;
	J0x07:

	// End:0xB8 [Loop If]
	if(i < Fires.Length)
	{
		// End:0x2B
		if(Fires[i] == none)
		{
			// [Explicit Continue]
			goto J0xAE;
		}
		// End:0xAE
		if(VSize(Fires[i].Location - DouseLoc) <= DouseRad)
		{
			// End:0x80
			if(int(Level.NetMode) == int(NM_DedicatedServer))
			{
				Fires[i].Destroy();				
			}
			else
			{
				Fires[i].Kill();
			}
			GroundFireSpots[i] = vect(0.0000000, 0.0000000, 0.0000000);
		}
		J0xAE:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	// End:0x16
	if(int(Role) < int(ROLE_Authority))
	{
		Initialize();
	}
	//return;	
}

simulated function Initialize()
{
	local int i;
	local Vector Start, End, HitLoc, HitNorm, Dummy;

	local Actor t, A;
	local FP7GroundFire GF;

	// End:0x71
	if(ImpactManager != none)
	{
		// End:0x4A
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(Location, vect(0.0000000, 0.0000000, 1.0000000), 0, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(Location, vect(0.0000000, 0.0000000, 1.0000000), 0, Instigator);
		}
	}
	// End:0x178
	foreach VisibleCollidingActors(Class'Engine.Actor', A, DamageRadius, Location)
	{
		// End:0xE4
		if((xPawn(A) != none) && Level.Game.ReduceDamage(int(Damage), xPawn(A), Instigator, Location, Dummy, Class'BallisticProV55.DTFP7Immolation') <= 0)
		{
			continue;			
		}
		// End:0xFF
		if(xPawn(A) != none)
		{
			IgniteActor(A);
		}
		Class'BCoreProV55.BallisticDamageType'.static.Hurt(A, (1.0000000 - (VSize(A.Location - Location) / DamageRadius)) * BaseDamage, Instigator, A.Location, Normal(A.Location - Location) * float(500), Class'BallisticProV55.DTFP7Immolation');		
	}	
	// End:0x194
	if(int(Level.NetMode) == int(NM_Client))
	{
		return;
	}
	Start = Location + vect(0.0000000, 0.0000000, 8.0000000);
	i = 0;
	J0x1B5:

	// End:0x335 [Loop If]
	if(i < 40)
	{
		End = VRand();
		End.Z = Abs(End.Z);
		End = Start + ((End * DamageRadius) * 0.7000000);
		t = Trace(HitLoc, HitNorm, End, Start,, vect(6.0000000, 6.0000000, 6.0000000));
		// End:0x241
		if(t == none)
		{
			HitLoc = End;
		}
		GF = Spawn(Class'BallisticProV55.FP7GroundFire', self,, HitLoc, rot(0, 0, 0));
		// End:0x32B
		if(GF != none)
		{
			GF.Velocity = HitLoc - Location;
			GF.Instigator = Instigator;
			// End:0x2ED
			if(((int(Role) == int(ROLE_Authority)) && Instigator != none) && Instigator.Controller != none)
			{
				GF.InstigatorController = Instigator.Controller;
			}
			GF.FireControl = self;
			GroundFireSpots[i] = HitLoc;
			// End:0x32B
			if(bHeld)
			{
				GF.DamageType = Class'BallisticProV55.DTFP7Held';
			}
		}
		i++;
		// [Loop Continue]
		goto J0x1B5;
	}
	//return;	
}

simulated function PostNetReceive()
{
	local int i;
	local FP7GroundFire F;

	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	// End:0xBF
	if(!bClientFiresSpawned)
	{
		i = 0;
		J0x2D:

		// End:0xB4 [Loop If]
		if(i < 40)
		{
			// End:0xAA
			if(GroundFireSpots[i] != vect(0.0000000, 0.0000000, 0.0000000))
			{
				F = Spawn(Class'BallisticProV55.FP7GroundFire', self,, GroundFireSpots[i], rot(0, 0, 0));
				// End:0xAA
				if(F != none)
				{
					F.Velocity = GroundFireSpots[i] - Location;
				}
			}
			i++;
			// [Loop Continue]
			goto J0x2D;
		}
		bClientFiresSpawned = true;		
	}
	else
	{
		i = 0;
		J0xC6:

		// End:0x125 [Loop If]
		if(i < Fires.Length)
		{
			// End:0x11B
			if((Fires[i] != none) && GroundFireSpots[i] == vect(0.0000000, 0.0000000, 0.0000000))
			{
				Fires[i].Kill();
			}
			i++;
			// [Loop Continue]
			goto J0xC6;
		}
	}
	//return;	
}

simulated function GainedChild(Actor A)
{
	// End:0x12
	if(FP7GroundFire(A) == none)
	{
		return;
	}
	Fires[Fires.Length] = FP7GroundFire(A);
	//return;	
}

simulated function LostChild(Actor A)
{
	local int i;

	// End:0x12
	if(FP7GroundFire(A) == none)
	{
		return;
	}
	i = 0;
	J0x19:

	// End:0x4A [Loop If]
	if((i < Fires.Length) && Fires[i] != A)
	{
		i++;
		// [Loop Continue]
		goto J0x19;
	}
	// End:0x66
	if(i < Fires.Length)
	{
		Fires.Remove(i, 1);
	}
	//return;	
}

simulated function IgniteActor(Actor A)
{
	local FP7ActorBurner PF;

	PF = Spawn(Class'BallisticProV55.FP7ActorBurner', self,, A.Location);
	PF.Instigator = Instigator;
	// End:0x82
	if(((int(Role) == int(ROLE_Authority)) && Instigator != none) && Instigator.Controller != none)
	{
		PF.InstigatorController = Instigator.Controller;
	}
	// End:0x9F
	if(bHeld)
	{
		PF.DamageType = Class'BallisticProV55.DTFP7Held';
	}
	PF.Initialize(A);
	//return;	
}

defaultproperties
{
	DamageRadius=256.0000000
	ImpactManager=Class'BallisticProV55.IM_FireExplode'
	Damage=30.0000000
	BaseDamage=40.0000000
	RepulsionForceMag=250.0000000
	LightType=4
	LightEffect=21
	LightHue=25
	LightSaturation=100
	LightBrightness=200.0000000
	LightRadius=15.0000000
	bHidden=true
	bDynamicLight=true
	bAlwaysRelevant=true
	RemoteRole=2
	AmbientSound=Sound'BW_Core_WeaponSound.FP7.FP7FireLoop'
	LifeSpan=12.0000000
	bFullVolume=true
	SoundVolume=255
	SoundRadius=256.0000000
	bNetNotify=true
}
