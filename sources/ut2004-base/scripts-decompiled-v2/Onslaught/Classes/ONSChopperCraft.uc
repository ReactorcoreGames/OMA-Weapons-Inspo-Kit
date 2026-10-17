class ONSChopperCraft extends ONSVehicle
	abstract
	native
	nativereplication
	config(User);

struct native CopterState
{
	var Vector ChassisPosition;
	var Quat ChassisQuaternion;
	var Vector ChassisLinVel;
	var Vector ChassisAngVel;
	var byte ServerThrust;
	var byte ServerStrafe;
	var byte ServerRise;
	var int ServerViewPitch;
	var int ServerViewYaw;
};

var() float UprightStiffness;
var() float UprightDamping;
var() float MaxThrustForce;
var() float LongDamping;
var() float MaxStrafeForce;
var() float LatDamping;
var() float MaxRiseForce;
var() float UpDamping;
var() float TurnTorqueFactor;
var() float TurnTorqueMax;
var() float TurnDamping;
var() float MaxYawRate;
var() float PitchTorqueFactor;
var() float PitchTorqueMax;
var() float PitchDamping;
var() float RollTorqueTurnFactor;
var() float RollTorqueStrafeFactor;
var() float RollTorqueMax;
var() float RollDamping;
var() float StopThreshold;
var() float MaxRandForce;
var() float RandForceInterval;
var float CopterMPH;
var float TargetHeading;
var float TargetPitch;
var bool bHeadingInitialized;
var float OutputThrust;
var float OutputStrafe;
var float OutputRise;
var Vector RandForce;
var Vector RandTorque;
var float AccumulatedTime;
var CopterState CopState;
var CopterState OldCopState;
var KRigidBodyState ChassisState;
var bool bNewCopterState;
var float PushForce;
var float LastJumpOutCheck;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		CopState;
}

simulated event bool KUpdateState(out KRigidBodyState NewState)
{
	// End:0x1F
	if((int(Role) == int(ROLE_Authority)) || !bNewCopterState)
	{
		return false;
	}
	NewState = ChassisState;
	bNewCopterState = false;
	return true;
	//return;	
}

simulated event SVehicleUpdateParams()
{
	super.SVehicleUpdateParams();
	KSetStayUprightParams(UprightStiffness, UprightDamping);
	//return;	
}

simulated function SpecialCalcFirstPersonView(PlayerController PC, out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
	ViewActor = self;
	CameraLocation = Location + (FPCamPos >> Rotation);
	//return;	
}

event JumpOutCheck()
{
	local Bot B;

	B = Bot(Controller);
	// End:0x10C
	if((((B != none) && ONSPowerCore(B.MoveTarget) != none) && int(ONSPowerCore(B.MoveTarget).CoreStage) == 4) && (B.Enemy == none) || !B.EnemyVisible())
	{
		KDriverLeave(false);
		// End:0x10C
		if(Controller == none)
		{
			KAddImpulse(PushForce * Vector(Rotation), Location);
			// End:0x10C
			if((int(B.Pawn.Physics) == int(2)) && B.DoWaitForLanding())
			{
				B.Pawn.Velocity.Z = 0.0000000;
			}
		}
	}
	//return;	
}

defaultproperties
{
	PushForce=100000.0000000
	bFollowLookDir=true
	bPCRelativeFPRotation=false
	bCanFly=true
	bCanStrafe=true
	bCanBeBaseForPawns=false
	GroundSpeed=1200.0000000
}
