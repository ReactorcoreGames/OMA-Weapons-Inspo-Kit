class HydraSwoopRocket extends HydraRocket;

var Vector LastLoc;
var Vector StartLoc;
var Vector EndLoc;
var float LaunchTime;
var() float TurnRate;
var() bool bSeeking;
var bool bHasImpacted;
var() float LastSendTargetTime;
var() HydraBazooka Weapon;

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
	super.HitWall(HitNormal, Wall);
	//return;	
}

function SetTargetLocation()
{
	// End:0x0B
	if(bHasImpacted)
	{
		return;
	}
	// End:0x4C
	if((int(Role) == int(ROLE_Authority)) && Weapon != none)
	{
		LastLoc = Weapon.GetSwoopRocketDir(StartLoc, EndLoc, LaunchTime);
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
	if((int(Role) == int(ROLE_Authority)) && (Level.TimeSeconds - LastSendTargetTime) > 0.0200000)
	{
		LastSendTargetTime = Level.TimeSeconds;
		SetTargetLocation();
	}
	// End:0x57
	if(bExploded)
	{
		Destroy();
	}
	// End:0x1CA
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
		// End:0x1CA
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
	TurnRate=24576.0000000
	MyDamageType=Class'BWBP_APC_Pro.DTHydraBazookaSwoop'
	LifeSpan=0.0000000
}
