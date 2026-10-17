class MutWheeledVehicleStunts extends Mutator
	config
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var config float MaxForce;
var config float MaxSpin;
var config float JumpChargeTime;

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	local ONSWheeledCraft V;

	V = ONSWheeledCraft(Other);
	// End:0xDA
	if(V != none)
	{
		V.bAllowAirControl = true;
		V.bAllowChargingJump = true;
		V.bSpecialHUD = true;
		V.MaxJumpForce = MaxForce;
		V.MaxJumpSpin = MaxSpin;
		V.JumpChargeTime = JumpChargeTime;
		V.bHasHandbrake = false;
		V.DaredevilThreshInAirDistance *= 1.5000000;
		V.DaredevilThreshInAirTime *= 1.5000000;
		V.DaredevilThreshInAirSpin *= 2.0000000;
	}
	return true;
	//return;	
}

defaultproperties
{
	MaxForce=200000.0000000
	MaxSpin=80.0000000
	JumpChargeTime=1.0000000
	GroupName="VehicleStunts"
	FriendlyName="Stunt Vehicles"
	Description="Players can make the wheeled vehicles jump. Hold down the crouch key to charge up and then release to jump. They can also control wheeled vehicles in mid-air."
}
