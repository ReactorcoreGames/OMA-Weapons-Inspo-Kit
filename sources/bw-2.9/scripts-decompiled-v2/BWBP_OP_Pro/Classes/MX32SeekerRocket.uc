class MX32SeekerRocket extends MX32Rocket;

var Vector LastLoc;
var() float TurnRate;
var() bool bSeeking;
var bool bHasImpacted;
var() float LastSendTargetTime;
var() float MaxAccelSpeed;
var() MX32Weapon Weapon;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		LastLoc, SetTargetLocation, 
		bSeeking;
}

function HitWall(Vector HitNormal, Actor Wall)
{
	bHasImpacted = true;
	bSeeking = false;
	super(BallisticProjectile).HitWall(HitNormal, Wall);
	//return;	
}

function SetTargetLocation()
{
	// End:0x0B
	if(bHasImpacted)
	{
		return;
	}
	// End:0x51
	if(((Weapon != none) && Weapon.bLaserOn) && int(Role) == int(ROLE_Authority))
	{
		LastLoc = Weapon.GetRocketDir();
	}
	bSeeking = true;
	//return;	
}

simulated function Tick(float dt)
{
	local Vector V, X, Y, Z;
	local Rotator R, AxisDir;
	local float TurnNeeded;

	// End:0x4B
	if((int(Role) == int(ROLE_Authority)) && (Level.TimeSeconds - LastSendTargetTime) > 0.0400000)
	{
		LastSendTargetTime = Level.TimeSeconds;
		SetTargetLocation();
	}
	// End:0x57
	if(bExploded)
	{
		Destroy();
	}
	// End:0x9C
	if(bArmed && Speed < MaxSpeed)
	{
		FlightSpeed = FMin(MaxSpeed, FlightSpeed + (AccelSpeed * dt));
		Speed = FlightSpeed;
	}
	// End:0x20F
	if(bSeeking)
	{
		V = LastLoc - Location;
		X = Normal(Velocity);
		Y = Normal(V Cross Velocity);
		Z = Normal(X Cross Y);
		AxisDir = OrthoRotation(X, Y, Z);
		TurnNeeded = Acos(Normal(V) Dot Normal(Velocity)) * (float(32768) / 3.1415930);
		R.Pitch = int(FMin(TurnRate * dt, TurnNeeded));
		GetAxes(R, X, Y, Z);
		X = X >> AxisDir;
		Y = Y >> AxisDir;
		Z = Z >> AxisDir;
		R = OrthoRotation(X, Y, Z);
		Velocity = Normal(Vector(R)) * Speed;
		// End:0x20F
		if(((Normal(Velocity) Dot Normal(V)) > 0.6000000) && VSize(V) < (Speed * 0.1000000))
		{
			bSeeking = false;
		}
	}
	R = Rotation;
	R = Rotator(Velocity);
	R.Roll = Rotation.Roll;
	SetRotation(R);
	//return;	
}

defaultproperties
{
	TurnRate=49152.0000000
	FlightSpeed=10000.0000000
	ArmingDelay=0.5000000
	bNetTemporary=false
	bUpdateSimulatedPosition=true
	LifeSpan=10.0000000
}
