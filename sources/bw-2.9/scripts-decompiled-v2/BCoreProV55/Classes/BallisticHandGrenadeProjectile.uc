class BallisticHandGrenadeProjectile extends BallisticGrenade
	abstract;

var() int FireModeNum;
var float ClientSpeed;
var float ClientDetonateDelay;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetInitial)
		ClientDetonateDelay, ClientSpeed;
}

simulated function ApplyParams(ProjectileEffectParams Params)
{
	super.ApplyParams(Params);
	// End:0x31
	if(int(Role) < int(ROLE_Authority))
	{
		Speed = ClientSpeed;
		DetonateDelay = ClientDetonateDelay;
	}
	//return;	
}

simulated function SetInitialSpeed(optional bool force_speed)
{
	local Rotator R;

	SetPhysics(default.Physics);
	Velocity = Vector(Rotation) * Speed;
	R = Rotation;
	R.Roll = -8192;
	SetRotation(R);
	StartRotation = Rotation;
	//return;	
}

function SetSpeedAndDelay(float NewSpeed, float NewDelay)
{
	Speed = NewSpeed;
	ClientSpeed = NewSpeed;
	NewDelay = FMax(NewDelay, 0.1000000);
	// End:0x56
	if(NewDelay < StartDelay)
	{
		DetonateDelay = NewDelay;
		StartDelay = DetonateDelay / float(2);		
	}
	else
	{
		DetonateDelay = NewDelay;
	}
	ClientDetonateDelay = DetonateDelay - StartDelay;
	SetInitialSpeed();
	// End:0x92
	if(int(DetonateOn) == int(0))
	{
		SetTimer(DetonateDelay, false);
	}
	//return;	
}

simulated function Timer()
{
	// End:0x15
	if(StartDelay > float(0))
	{
		ShowAfterStartDelay();
		return;
	}
	HitActor = none;
	Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	// End:0x18
	if(ShakeRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	BlowUp(HitLocation);
	// End:0x84
	if(ImpactManager != none)
	{
		// End:0x65
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Instigator);
		}
	}
	// End:0xEE
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		Velocity = vect(0.0000000, 0.0000000, 0.0000000);
		SetCollision(false, false, false);
		TearOffHitNormal = HitNormal;
		bTearOff = true;
		GotoState('NetTrapped');		
	}
	else
	{
		Destroy();
	}
	//return;	
}

simulated function bool CanTouch(Actor Other)
{
	// End:0x12
	if(!super.CanTouch(Other))
	{
		return false;
	}
	return !bHasImpacted || Pawn(Other) == none;
	//return;	
}

defaultproperties
{
	bNoInitialSpin=true
	bRandomStartRotation=false
	NetTrappedDelay=1.0000000
	LifeSpan=6.0000000
	DrawScale=0.2000000
	CollisionRadius=1.0000000
	CollisionHeight=1.0000000
	bUseCylinderCollision=false
	RotationRate=(Pitch=0,Yaw=0,Roll=0)
}
