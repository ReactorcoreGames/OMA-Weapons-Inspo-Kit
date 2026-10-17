class X93IonEffect extends Actor
	notplaceable;

var Vector HitLocation;
var Vector HitNormal;
var X93IonShaft X93IonShaft;
var X93IonCore X93IonCore;
var float StartTime;
var() float DropTime;

replication
{
	// Pos:0x000
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		HitLocation, HitNormal;
}

function AimAt(Vector hl, Vector hn)
{
	HitLocation = hl;
	HitNormal = hn;
	// End:0x35
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		SpawnEffects();
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	// End:0x16
	if(int(Role) < int(ROLE_Authority))
	{
		SpawnEffects();
	}
	//return;	
}

simulated function SpawnEffects()
{
	X93IonCore = Spawn(Class'BWBPAirstrikesPro.X93IonCore',,, Location, Rotation);
	X93IonShaft = Spawn(Class'BWBPAirstrikesPro.X93IonShaft',,, Location, Rotation);
	X93IonShaft.mSpawnVecA = Location;
	GotoState('Drop');
	//return;	
}

state Drop
{
	simulated function BeginState()
	{
		StartTime = Level.TimeSeconds;
		SetTimer(DropTime, false);
		//return;		
	}

	simulated function Tick(float dt)
	{
		local float Delta;

		Delta = FMin((Level.TimeSeconds - StartTime) / DropTime, 1.0000000);
		X93IonCore.SetLocation((Location * (1.0000000 - Delta)) + (HitLocation * Delta));
		X93IonShaft.SetLocation(X93IonCore.Location);
		//return;		
	}

	simulated function Timer()
	{
		local Rotator NormalRot;
		local Actor A;

		X93IonShaft.SetLocation(X93IonCore.Location);
		X93IonCore.Destroy();
		X93IonShaft.mAttenuate = true;
		// End:0x64
		if(Abs(HitNormal.Z) < 0.8000000)
		{
			NormalRot = Rotator(HitLocation - Location);			
		}
		else
		{
			NormalRot = Rotator(HitNormal);
		}
		A = Spawn(Class'BWBPAirstrikesPro.X93Explosion',,, HitLocation + vect(0.0000000, 0.0000000, 100.0000000), rot(0, 16384, 0));
		A.RemoteRole = ROLE_None;
		GotoState('None');
		//return;		
	}
	stop;	
}

defaultproperties
{
	DropTime=0.5000000
	LightType=1
	LightEffect=21
	LightHue=160
	LightSaturation=140
	LightBrightness=255.0000000
	LightRadius=12.0000000
	DrawType=0
	bDynamicLight=true
	bNetTemporary=true
	bAlwaysRelevant=true
	bReplicateMovement=false
	bSkipActorPropertyReplication=true
	RemoteRole=2
	LifeSpan=2.0000000
	TransientSoundVolume=1.0000000
	TransientSoundRadius=5000.0000000
}
