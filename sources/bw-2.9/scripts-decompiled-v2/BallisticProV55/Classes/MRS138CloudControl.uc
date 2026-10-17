class MRS138CloudControl extends Actor
	notplaceable;

var array<MRS138Cloud> Clouds;
var() int Damage;
var() Class<DamageType> DamageType;
var Vector CloudSpawnLoc;
var Vector OldCloudSpawnLoc;
var bool bNoMore;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		CloudSpawnLoc;
}

function PostBeginPlay()
{
	super.PostBeginPlay();
	SetTimer(0.3500000, true);
	ServerSpawnCloud();
	//return;	
}

function ServeCustomers()
{
	local int i, j, k;
	local array<Actor> Served;

	i = 0;
	J0x07:

	// End:0x1A0 [Loop If]
	if(i < Clouds.Length)
	{
		j = 0;
		J0x1E:

		// End:0x196 [Loop If]
		if(j < Clouds[i].Touching.Length)
		{
			// End:0x87
			if((Clouds[i].Touching[j] == none) || Pawn(Clouds[i].Touching[j]) == none)
			{
				// [Explicit Continue]
				goto J0x18C;
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

			// End:0x18C
			if(k >= Served.Length)
			{
				Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Clouds[i].Touching[j], Clouds[i].Density * float(Damage), Instigator, Clouds[i].Touching[j].Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
				Served[Served.Length] = Clouds[i].Touching[j];
			}
			J0x18C:

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

simulated function Tick(float dt)
{
	local int i;

	// End:0xC9
	if(((Clouds.Length > 0) && Clouds[Clouds.Length - 1] != none) && Clouds[Clouds.Length - 1].Density < 4.0000000)
	{
		Clouds[Clouds.Length - 1].Density = FMin(1.5000000, Clouds[Clouds.Length - 1].Density + dt);
		Clouds[Clouds.Length - 1].Emitters[0].InitialParticlesPerSecond = Clouds[Clouds.Length - 1].Density * 0.7000000;
	}
	// End:0x133
	if((LifeSpan < float(3)) && !bNoMore)
	{
		bNoMore = true;
		i = 0;
		J0xF3:

		// End:0x133 [Loop If]
		if(i < Clouds.Length)
		{
			// End:0x129
			if(Clouds[i] != none)
			{
				Clouds[i].Kill();
			}
			i++;
			// [Loop Continue]
			goto J0xF3;
		}
	}
	//return;	
}

function Timer()
{
	CloudTravel();
	ServeCustomers();
	//return;	
}

function CloudTravel()
{
	// End:0xB7
	if((Owner != none) && ((Clouds.Length < 1) || Clouds[Clouds.Length - 1] == none) || VSize(Clouds[Clouds.Length - 1].Location - Owner.Location) > float(192))
	{
		// End:0xA6
		if((Clouds.Length > 0) && Clouds[Clouds.Length - 1] != none)
		{
			Clouds[Clouds.Length - 1].Terminate(3.0000000);
		}
		// End:0xB7
		if(!bNoMore)
		{
			ServerSpawnCloud();
		}
	}
	//return;	
}

simulated function CloudDie(MRS138Cloud C)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x45 [Loop If]
	if(i < Clouds.Length)
	{
		// End:0x3B
		if(Clouds[i] == C)
		{
			Clouds.Remove(i, 1);
			// [Explicit Break]
			goto J0x45;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	J0x45:

	//return;	
}

simulated function SpawnCloud(Vector V)
{
	local MRS138Cloud C;
	local Actor Underneath;
	local Vector Dump, trash;

	Underneath = Trace(Dump, trash, V - vect(0.0000000, 0.0000000, 1536.0000000), V, false);
	// End:0x3F
	if(Mover(Underneath) != none)
	{
		return;
	}
	// End:0x72
	if(Owner != none)
	{
		C = Spawn(Class'BallisticProV55.MRS138Cloud', self,, V, Rotator(Owner.Velocity));		
	}
	else
	{
		// End:0xCE
		if((Clouds.Length > 0) && Clouds[Clouds.Length - 1] != none)
		{
			C = Spawn(Class'BallisticProV55.MRS138Cloud', self,, V, Rotator(V - Clouds[Clouds.Length - 1].Location));			
		}
		else
		{
			// End:0x108
			if(Instigator != none)
			{
				C = Spawn(Class'BallisticProV55.MRS138Cloud', self,, V, Rotator(V - Instigator.Location));				
			}
			else
			{
				C = Spawn(Class'BallisticProV55.MRS138Cloud', self,, V);
			}
		}
	}
	// End:0x14E
	if(C != none)
	{
		Clouds[Clouds.Length] = C;
		C.Instigator = Instigator;
	}
	//return;	
}

function ServerSpawnCloud()
{
	local Vector HitLoc, HitNorm;
	local Actor t;

	t = Trace(HitLoc, HitNorm, Owner.Location + vect(0.0000000, 0.0000000, 32.0000000), Owner.Location, false);
	// End:0x6D
	if(t == none)
	{
		HitLoc = Owner.Location + vect(0.0000000, 0.0000000, 32.0000000);
	}
	CloudSpawnLoc = HitLoc;
	SpawnCloud(HitLoc);
	//return;	
}

simulated function Destroyed()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x47 [Loop If]
	if(i < Clouds.Length)
	{
		// End:0x3D
		if(Clouds[i] != none)
		{
			Clouds[i].Kill();
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	super.Destroyed();
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x25
	if(CloudSpawnLoc != OldCloudSpawnLoc)
	{
		OldCloudSpawnLoc = CloudSpawnLoc;
		SpawnCloud(CloudSpawnLoc);
	}
	//return;	
}

defaultproperties
{
	Damage=4
	DamageType=Class'BallisticProV55.DTMRS138Gas'
	bHidden=true
	bAlwaysRelevant=true
	bReplicateInstigator=true
	RemoteRole=2
	LifeSpan=5.0000000
	bNetNotify=true
}
