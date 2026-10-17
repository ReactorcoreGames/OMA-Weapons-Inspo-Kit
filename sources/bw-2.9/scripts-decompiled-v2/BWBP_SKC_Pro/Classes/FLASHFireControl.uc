class FLASHFireControl extends Actor
	notplaceable;

const BURNINTERVAL = 0.3f;

var() float DamageRadius;
var Vector GroundFireSpots[25];
var() Class<BCImpactManager> ImpactManager;
var array<FLASHGroundFire> Fires;
var() int Damage;
var() Class<DamageType> DamageType;
var() Controller InstigatorController;
var int UniqueID;

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

simulated function PostNetBeginPlay()
{
	// End:0x19
	if(int(Role) < int(ROLE_Authority))
	{
		Initialize();		
	}
	else
	{
		SetTimer(0.3000000, true);
	}
	//return;	
}

simulated function Initialize()
{
	local int i;
	local Vector Start, End, HitLoc, HitNorm, Dummy;

	local Actor t, A;
	local FLASHGroundFire GF;

	// End:0x1F
	if(Instigator != none)
	{
		InstigatorController = Instigator.Controller;
	}
	// End:0x151
	foreach VisibleCollidingActors(Class'Engine.Actor', A, DamageRadius + float(100), Location)
	{
		// End:0x96
		if((xPawn(A) != none) && Level.Game.ReduceDamage(Damage, xPawn(A), Instigator, Location, Dummy, Class'BWBP_SKC_Pro.DT_M202Immolation') <= 0)
		{
			continue;			
		}
		// End:0xB4
		if(xPawn(A) != none)
		{
			IgniteActor(A);
			// End:0x150
			continue;
		}
		// End:0x150
		if((int(Role) == int(ROLE_Authority)) && A.bCanBeDamaged)
		{
			Class'BCoreProV55.BallisticDamageType'.static.Hurt(A, (1.0000000 - (VSize(A.Location - Location) / DamageRadius)) * 20.0000000, Instigator, A.Location, Normal(A.Location - Location) * float(500), Class'BWBP_SKC_Pro.DT_M202Immolation');
		}		
	}	
	// End:0x16D
	if(int(Level.NetMode) == int(NM_Client))
	{
		return;
	}
	Start = Location + vect(0.0000000, 0.0000000, 8.0000000);
	i = 0;
	J0x18E:

	// End:0x2E1 [Loop If]
	if(i < 20)
	{
		End = Start + ((VRand() * DamageRadius) * 0.7000000);
		t = Trace(HitLoc, HitNorm, End, Start,, vect(6.0000000, 6.0000000, 6.0000000));
		// End:0x1F8
		if(t == none)
		{
			HitLoc = End;
		}
		GF = Spawn(Class'BWBP_SKC_Pro.FLASHGroundFire', self,, HitLoc, rot(0, 0, 0));
		// End:0x2D7
		if(GF != none)
		{
			GF.Velocity = HitLoc - Location;
			GF.Instigator = Instigator;
			// End:0x2A4
			if(((int(Role) == int(ROLE_Authority)) && Instigator != none) && Instigator.Controller != none)
			{
				GF.InstigatorController = Instigator.Controller;
			}
			GF.FireControl = self;
			Fires[Fires.Length] = GF;
			GroundFireSpots[i] = HitLoc;
		}
		i++;
		// [Loop Continue]
		goto J0x18E;
	}
	//return;	
}

simulated function PostNetReceive()
{
	local int i;
	local FLASHGroundFire F;

	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	i = 0;
	J0x22:

	// End:0xD4 [Loop If]
	if(i < 25)
	{
		// End:0xCA
		if(GroundFireSpots[i] != vect(0.0000000, 0.0000000, 0.0000000))
		{
			F = Spawn(Class'BWBP_SKC_Pro.FLASHGroundFire', self,, GroundFireSpots[i], rot(0, 0, 0));
			// End:0xCA
			if(F != none)
			{
				F.Velocity = GroundFireSpots[i] - Location;
				GroundFireSpots[i] = vect(0.0000000, 0.0000000, 0.0000000);
				Fires[Fires.Length] = F;
			}
		}
		i++;
		// [Loop Continue]
		goto J0x22;
	}
	//return;	
}

simulated function IgniteActor(Actor A)
{
	local FLASHActorBurner PF;

	PF = Spawn(Class'BWBP_SKC_Pro.FLASHActorBurner', self,, A.Location);
	PF.Instigator = Instigator;
	// End:0x82
	if(((int(Role) == int(ROLE_Authority)) && Instigator != none) && Instigator.Controller != none)
	{
		PF.InstigatorController = Instigator.Controller;
	}
	PF.Initialize(A);
	//return;	
}

function Timer()
{
	local int i, j, k, M;
	local array<Actor> Served;
	local Actor Vic;
	local bool bDamage;

	i = 0;
	J0x07:

	// End:0x2AB [Loop If]
	if(i < Fires.Length)
	{
		j = 0;
		J0x1E:

		// End:0x2A1 [Loop If]
		if(j < Fires[i].Touching.Length)
		{
			// End:0x87
			if((Fires[i].Touching[j] == none) || Pawn(Fires[i].Touching[j]) == none)
			{
				// [Explicit Continue]
				goto J0x297;
			}
			k = 0;
			J0x8E:

			// End:0xD5 [Loop If]
			if(k < Served.Length)
			{
				// End:0xCB
				if(Served[k] == Fires[i].Touching[j])
				{
					// [Explicit Break]
					goto J0xD5;
				}
				k++;
				// [Loop Continue]
				goto J0x8E;
			}
			J0xD5:

			// End:0x297
			if(k >= Served.Length)
			{
				bDamage = true;
				Vic = Fires[i].Touching[j];
				M = 0;
				J0x114:

				// End:0x1B3 [Loop If]
				if(M < Vic.Touching.Length)
				{
					// End:0x14F
					if(FLASHGroundFire(Vic.Touching[M]) == none)
					{
						// [Explicit Continue]
						goto J0x1A9;
					}
					// End:0x1A6
					if(FLASHGroundFire(Vic.Touching[M]).FireControl != self)
					{
						bDamage = false;
						Served[Served.Length] = Fires[i].Touching[j];
					}
					// [Explicit Break]
					goto J0x1B3;
					J0x1A9:

					M++;
					// [Loop Continue]
					goto J0x114;
				}
				J0x1B3:

				// End:0x297
				if(bDamage)
				{
					// End:0x206
					if((Instigator == none) || Instigator.Controller == none)
					{
						Fires[i].Touching[j].SetDelayedDamageInstigatorController(InstigatorController);
					}
					Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Fires[i].Touching[j], float(Damage), Instigator, Fires[i].Touching[j].Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
					Served[Served.Length] = Fires[i].Touching[j];
				}
			}
			J0x297:

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

simulated function Destroyed()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x47 [Loop If]
	if(i < Fires.Length)
	{
		// End:0x3D
		if(Fires[i] != none)
		{
			Fires[i].Kill();
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	super.Destroyed();
	//return;	
}

defaultproperties
{
	DamageRadius=256.0000000
	ImpactManager=Class'BWBP_SKC_Pro.IM_FlareExplode'
	Damage=25
	DamageType=Class'BWBP_SKC_Pro.DT_M202Burned'
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
	LifeSpan=10.0000000
	bFullVolume=true
	SoundVolume=255
	SoundRadius=192.0000000
	bNetNotify=true
}
