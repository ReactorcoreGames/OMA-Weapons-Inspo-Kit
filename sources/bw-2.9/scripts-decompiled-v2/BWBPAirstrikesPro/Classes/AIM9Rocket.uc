class AIM9Rocket extends AIM9RocketBase;

var(Lock) float TurnStrength;
var(Lock) float LeadStrength;
var(Lock) float CircleThreshold;
var(Lock) float CircleDistance;

simulated function home(Actor Target, float DeltaTime)
{
	local Vector HomingLocation, HomingDirection;
	local float Distance, Aim;

	HomingLocation = GetHomingLocation(Target);
	HomingDirection = Normal(HomingLocation - Location);
	Aim = HomingDirection Dot Normal(Velocity);
	// End:0xAF
	if(Aim < CircleThreshold)
	{
		Distance = VSize(HomingLocation - Location);
		// End:0x9C
		if(Distance < CircleDistance)
		{
			// End:0x99
			if(HomingLocation.Z > Location.Z)
			{
				PullUp(HomingLocation.Z, DeltaTime);
			}			
		}
		else
		{
			MoveIn(HomingDirection, DeltaTime);
		}		
	}
	else
	{
		MoveIn(HomingDirection, DeltaTime);
	}
	//return;	
}

function Vector GetHomingLocation(Actor Target)
{
	local Vector HomingLocation;

	HomingLocation = GetTargetLocation(Target);
	// End:0x30
	if(LeadStrength != float(0))
	{
		HomingLocation += (GetLeadForce(Target));
	}
	return HomingLocation;
	//return;	
}

function Vector GetLeadForce(Actor Target)
{
	local Vector LeadForce;

	LeadForce = Target.Velocity * LeadStrength;
	return LeadForce;
	//return;	
}

function MoveIn(Vector HomingDirection, float DeltaTime)
{
	local Vector HomingForce, NewDirection;

	HomingForce = ((HomingDirection * TurnStrength) * VSize(Velocity)) * DeltaTime;
	NewDirection = Normal(Velocity + HomingForce);
	Velocity = NewDirection * VSize(Velocity);
	//return;	
}

function PullUp(float DesiredAltitude, float DeltaTime)
{
	local Vector PullUpLocation, PullUpDirection;

	PullUpLocation = Velocity;
	PullUpLocation.Z = DesiredAltitude;
	PullUpDirection = Normal(PullUpLocation - Location);
	MoveIn(PullUpDirection, DeltaTime);
	//return;	
}

defaultproperties
{
	TurnStrength=3.0000000
	LeadStrength=0.1000000
	CircleThreshold=0.1000000
	CircleDistance=1000.0000000
}
