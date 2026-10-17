class ChaffCloudControl extends Actor
	notplaceable;

var array<ChaffCloud> Clouds;
var() int Damage;
var() Class<DamageType> DamageType;
var Vector CloudSpawnLoc;
var Vector OldCloudSpawnLoc;
var bool bNoMore;
var Controller InstigatorController;
var float ChaffRadius;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		CloudSpawnLoc;
}

function PostBeginPlay()
{
	super.PostBeginPlay();
	SetTimer(0.1500000, true);
	ServerSpawnCloud();
	//return;	
}

function ServeCustomers()
{
	local M46Mine ThingA;
	local M50Camera ThingB;
	local FP9Bomb ThingC;
	local G5Rocket ThingD;
	local G51Mine_Sensor ThingE;
	local LonghornGrenade ThingF;
	local MARSMine_Sensor ThingG;
	local MGLGrenadeRemote ThingH;
	local PumaProjectile ThingI;
	local PumaProjectileImpact ThingJ;

	// End:0x45
	foreach RadiusActors(Class'BallisticProV55.M46Mine', ThingA, ChaffRadius, Location)
	{
		ThingA.Explode(ThingA.Location, vect(0.0000000, 0.0000000, 0.0000000));		
	}	
	// End:0x91
	foreach RadiusActors(Class'BallisticProV55.M50Camera', ThingB, ChaffRadius, Location)
	{
		ThingB.TakeDamage(Damage, Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);		
	}	
	// End:0xD7
	foreach RadiusActors(Class'BallisticProV55.FP9Bomb', ThingC, ChaffRadius, Location)
	{
		ThingC.Explode(ThingC.Location, vect(0.0000000, 0.0000000, 0.0000000));		
	}	
	// End:0x11D
	foreach RadiusActors(Class'BallisticProV55.G5Rocket', ThingD, ChaffRadius, Location)
	{
		ThingD.Explode(ThingD.Location, vect(0.0000000, 0.0000000, 0.0000000));		
	}	
	// End:0x163
	foreach RadiusActors(Class'BWBP_SKC_Pro.G51Mine_Sensor', ThingE, ChaffRadius, Location)
	{
		ThingE.Explode(ThingE.Location, vect(0.0000000, 0.0000000, 0.0000000));		
	}	
	// End:0x1A9
	foreach RadiusActors(Class'BWBP_SKC_Pro.LonghornGrenade', ThingF, ChaffRadius, Location)
	{
		ThingF.Explode(ThingF.Location, vect(0.0000000, 0.0000000, 0.0000000));		
	}	
	// End:0x1EF
	foreach RadiusActors(Class'BWBP_SKC_Pro.MARSMine_Sensor', ThingG, ChaffRadius, Location)
	{
		ThingG.Explode(ThingG.Location, vect(0.0000000, 0.0000000, 0.0000000));		
	}	
	// End:0x235
	foreach RadiusActors(Class'BWBP_SKC_Pro.MGLGrenadeRemote', ThingH, ChaffRadius, Location)
	{
		ThingH.Explode(ThingH.Location, vect(0.0000000, 0.0000000, 0.0000000));		
	}	
	// End:0x27B
	foreach RadiusActors(Class'BWBP_SKC_Pro.PumaProjectile', ThingI, ChaffRadius, Location)
	{
		ThingI.Explode(ThingI.Location, vect(0.0000000, 0.0000000, 0.0000000));		
	}	
	// End:0x2C1
	foreach RadiusActors(Class'BWBP_SKC_Pro.PumaProjectileImpact', ThingJ, ChaffRadius, Location)
	{
		ThingJ.Explode(ThingJ.Location, vect(0.0000000, 0.0000000, 0.0000000));		
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

simulated function CloudDie(ChaffCloud C)
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
	local ChaffCloud C;
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
		C = Spawn(Class'BWBP_SKC_Pro.ChaffCloud', self,, V, Rotator(Owner.Velocity));		
	}
	else
	{
		// End:0xCE
		if((Clouds.Length > 0) && Clouds[Clouds.Length - 1] != none)
		{
			C = Spawn(Class'BWBP_SKC_Pro.ChaffCloud', self,, V, Rotator(V - Clouds[Clouds.Length - 1].Location));			
		}
		else
		{
			// End:0x108
			if(Instigator != none)
			{
				C = Spawn(Class'BWBP_SKC_Pro.ChaffCloud', self,, V, Rotator(V - Instigator.Location));				
			}
			else
			{
				C = Spawn(Class'BWBP_SKC_Pro.ChaffCloud', self,, V);
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
	Damage=25
	DamageType=Class'BWBP_SKC_Pro.DTChaffGrenadeRadius'
	ChaffRadius=500.0000000
	bHidden=true
	bAlwaysRelevant=true
	bReplicateInstigator=true
	RemoteRole=2
	LifeSpan=6.0000000
	bNetNotify=true
}
