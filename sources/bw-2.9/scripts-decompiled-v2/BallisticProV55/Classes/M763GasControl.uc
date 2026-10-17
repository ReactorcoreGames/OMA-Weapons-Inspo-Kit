class M763GasControl extends Actor
	notplaceable;

const MaxRange = 1280;
const Interval = 6;

var array<M763GasCollider> Clouds;
var() int Damage;
var() Class<DamageType> DamageType;
var Controller InstigatorController;

function PostBeginPlay()
{
	super.PostBeginPlay();
	SetTimer(0.1500000, true);
	//return;	
}

function SpawnColliders(Vector StartLocation, Vector HitLocation)
{
	local float MaxSpawnRange;
	local Vector SpawnLoc, Dir, AddPerCycle;

	Dir = Normal(HitLocation - StartLocation);
	MaxSpawnRange = VSize(HitLocation - StartLocation);
	AddPerCycle = (Dir * float(2)) * Class'BallisticProV55.M763GasCollider'.default.CollisionRadius;
	SpawnLoc = StartLocation + ((Dir * 1.2000000) * (Class'BallisticProV55.M763GasCollider'.default.CollisionRadius + Class'XGame.xPawn'.default.CollisionRadius));
	J0x82:

	// End:0xC5 [Loop If]
	if(VSize(SpawnLoc - StartLocation) < MaxSpawnRange)
	{
		Clouds[Clouds.Length] = Spawn(Class'BallisticProV55.M763GasCollider', self,, SpawnLoc);
		SpawnLoc += AddPerCycle;
		// [Loop Continue]
		goto J0x82;
	}
	//return;	
}

function LostChild(Actor A)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x38 [Loop If]
	if((i < Clouds.Length) && Clouds[i] != A)
	{
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0x54
	if(i < Clouds.Length)
	{
		Clouds.Remove(i, 1);
	}
	// End:0x70
	if((Clouds.Length == 0) && Owner == none)
	{
		Destroy();
	}
	//return;	
}

function ServeCustomers()
{
	local int i, j, k;
	local array<Actor> Served;

	i = 0;
	J0x07:

	// End:0x231 [Loop If]
	if(i < Clouds.Length)
	{
		j = 0;
		J0x1E:

		// End:0x227 [Loop If]
		if(j < Clouds[i].Touching.Length)
		{
			// End:0x87
			if((Clouds[i].Touching[j] == none) || Pawn(Clouds[i].Touching[j]) == none)
			{
				// [Explicit Continue]
				goto J0x21D;
			}
			k = 0;
			J0x8E:

			// End:0xD5 [Loop If]
			if(k < Served.Length)
			{
				// End:0xCB
				if(Served[k] == Clouds[i].Touching[j])
				{
					// [Explicit Break]
					goto J0xD5;
				}
				k++;
				// [Loop Continue]
				goto J0x8E;
			}
			J0xD5:

			// End:0x21D
			if(k >= Served.Length)
			{
				// End:0x12F
				if((Instigator == none) || Instigator.Controller == none)
				{
					Clouds[i].Touching[j].SetDelayedDamageInstigatorController(InstigatorController);
				}
				Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Clouds[i].Touching[j], float(Damage), Instigator, Clouds[i].Touching[j].Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
				// End:0x1F6
				if(Pawn(Clouds[i].Touching[j]) != none)
				{
					Class'BCoreProV55.BCSprintControl'.static.AddSlowTo(Pawn(Clouds[i].Touching[j]), 0.8000000, 0.2000000);
				}
				Served[Served.Length] = Clouds[i].Touching[j];
			}
			J0x21D:

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

function Timer()
{
	ServeCustomers();
	//return;	
}

simulated function Destroyed()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x44 [Loop If]
	if(i < Clouds.Length)
	{
		// End:0x3A
		if(Clouds[i] != none)
		{
			Clouds[i].Destroy();
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
	Damage=9
	DamageType=Class'BallisticProV55.DTM763Gas'
	bHidden=true
}
