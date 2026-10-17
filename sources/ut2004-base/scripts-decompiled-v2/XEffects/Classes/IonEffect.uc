class IonEffect extends Actor
	notplaceable;

var Vector HitLocation;
var Vector HitNormal;
var IonShaft IonShaft;
var IonLightBeam IonLightBeam;
var IonCore IonCore;
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
	IonCore = Spawn(Class'XEffects.IonCore',,, Location, Rotation);
	IonShaft = Spawn(Class'XEffects.IonShaft',,, Location, Rotation);
	IonShaft.mSpawnVecA = Location;
	IonLightBeam = Spawn(Class'XEffects.IonLightBeam',,, Location, Rotation);
	IonLightBeam.mSpawnVecA = HitLocation;
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
		IonCore.SetLocation((Location * (1.0000000 - Delta)) + (HitLocation * Delta));
		IonShaft.SetLocation(IonCore.Location);
		//return;		
	}

	simulated function Timer()
	{
		local Rotator NormalRot;
		local Actor A;

		IonShaft.SetLocation(IonCore.Location);
		IonCore.Destroy();
		IonShaft.mAttenuate = true;
		IonLightBeam.mAttenuate = true;
		// End:0x75
		if(Abs(HitNormal.Z) < 0.8000000)
		{
			NormalRot = Rotator(HitLocation - Location);			
		}
		else
		{
			NormalRot = Rotator(HitNormal);
		}
		A = Spawn(Class'XEffects.NewIonEffect',,, HitLocation + vect(0.0000000, 0.0000000, 100.0000000), rot(0, 16384, 0));
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
