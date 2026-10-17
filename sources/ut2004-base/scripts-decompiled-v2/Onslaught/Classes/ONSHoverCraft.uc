class ONSHoverCraft extends ONSVehicle
	abstract
	native
	nativereplication
	config(User);

struct native HoverCraftState
{
	var Vector ChassisPosition;
	var Quat ChassisQuaternion;
	var Vector ChassisLinVel;
	var Vector ChassisAngVel;
	var byte ServerThrust;
	var byte ServerStrafe;
	var int ServerViewPitch;
	var int ServerViewYaw;
};

var() array<Vector> ThrusterOffsets;
var() float HoverSoftness;
var() float HoverPenScale;
var() float HoverCheckDist;
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
var float HoverMPH;
var float TargetHeading;
var float TargetPitch;
var bool bHeadingInitialized;
var float OutputThrust;
var float OutputStrafe;
var Pawn OldDriver;
var HoverCraftState HoverState;
var HoverCraftState OldHoverState;
var KRigidBodyState ChassisState;
var bool bNewHoverState;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		HoverState;
}

simulated event bool KUpdateState(out KRigidBodyState NewState)
{
	// End:0x1F
	if((int(Role) == int(ROLE_Authority)) || !bNewHoverState)
	{
		return false;
	}
	NewState = ChassisState;
	bNewHoverState = false;
	return true;
	//return;	
}

simulated function PostNetBeginPlay()
{
	local Vector RotX, RotY, RotZ;
	local KarmaParams KP;
	local KRepulsor rep;
	local int i;

	GetAxes(Rotation, RotX, RotY, RotZ);
	KP = KarmaParams(KParams);
	KP.Repulsors.Length = ThrusterOffsets.Length;
	i = 0;
	J0x43:

	// End:0x106 [Loop If]
	if(i < ThrusterOffsets.Length)
	{
		rep = Spawn(Class'Engine.KRepulsor', self,, ((Location + (ThrusterOffsets[i].X * RotX)) + (ThrusterOffsets[i].Y * RotY)) + (ThrusterOffsets[i].Z * RotZ));
		rep.SetBase(self);
		rep.bHidden = true;
		rep.bRepulseWater = true;
		KP.Repulsors[i] = rep;
		i++;
		// [Loop Continue]
		goto J0x43;
	}
	super.PostNetBeginPlay();
	//return;	
}

function Died(Controller Killer, Class<DamageType> DamageType, Vector HitLocation)
{
	local KarmaParams KP;
	local int i;

	KP = KarmaParams(KParams);
	i = 0;
	J0x17:

	// End:0x55 [Loop If]
	if(i < KP.Repulsors.Length)
	{
		KP.Repulsors[i].Destroy();
		i++;
		// [Loop Continue]
		goto J0x17;
	}
	KP.Repulsors.Length = 0;
	super.Died(Killer, DamageType, HitLocation);
	//return;	
}

simulated event SVehicleUpdateParams()
{
	local KarmaParams KP;
	local int i;

	super.SVehicleUpdateParams();
	KP = KarmaParams(KParams);
	i = 0;
	J0x1D:

	// End:0xA9 [Loop If]
	if(i < KP.Repulsors.Length)
	{
		KP.Repulsors[i].CheckDist = HoverCheckDist;
		KP.Repulsors[i].PenScale = HoverPenScale;
		KP.Repulsors[i].Softness = HoverSoftness;
		i++;
		// [Loop Continue]
		goto J0x1D;
	}
	KSetStayUprightParams(UprightStiffness, UprightDamping);
	//return;	
}

simulated function SpecialCalcFirstPersonView(PlayerController PC, out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
	ViewActor = self;
	CameraLocation = Location + (FPCamPos >> Rotation);
	//return;	
}

defaultproperties
{
	bFollowLookDir=true
	bCanHover=true
	bPCRelativeFPRotation=false
}
