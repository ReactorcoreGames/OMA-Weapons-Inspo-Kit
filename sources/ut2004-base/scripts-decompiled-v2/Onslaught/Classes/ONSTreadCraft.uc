class ONSTreadCraft extends ONSVehicle
	abstract
	native
	nativereplication
	config(User);

struct native TreadCraftState
{
	var Vector ChassisPosition;
	var Quat ChassisQuaternion;
	var Vector ChassisLinVel;
	var Vector ChassisAngVel;
	var byte ServerThrust;
	var byte ServerTurn;
	var int ServerViewPitch;
	var int ServerViewYaw;
};

var array<Vector> ThrusterOffsets;
var() float HoverSoftness;
var() float HoverPenScale;
var() float HoverCheckDist;
var() float UprightStiffness;
var() float UprightDamping;
var() float MaxThrust;
var() float MaxSteerTorque;
var() float ForwardDampFactor;
var() float TurnDampFactor;
var() float LateralDampFactor;
var() float ParkingDampFactor;
var() float SteerDampFactor;
var() float PitchTorqueFactor;
var() float PitchDampFactor;
var() float BankTorqueFactor;
var() float BankDampFactor;
var() float InvertSteeringThrottleThreshold;
var Material MPHMeterMaterial;
var() float MPHMeterPosX;
var() float MPHMeterPosY;
var() float MPHMeterScale;
var() float MPHMeterSizeY;
var float BikeMPH;
var float OutputThrust;
var float OutputTurn;
var TreadCraftState TreadState;
var TreadCraftState OldTreadState;
var KRigidBodyState ChassisState;
var bool bNewTreadState;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		TreadState;
}

simulated event bool KUpdateState(out KRigidBodyState NewState)
{
	// End:0x1F
	if((int(Role) == int(ROLE_Authority)) || !bNewTreadState)
	{
		return false;
	}
	NewState = ChassisState;
	bNewTreadState = false;
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

	// End:0xF5 [Loop If]
	if(i < ThrusterOffsets.Length)
	{
		rep = Spawn(Class'Engine.KRepulsor', self,, ((Location + (ThrusterOffsets[i].X * RotX)) + (ThrusterOffsets[i].Y * RotY)) + (ThrusterOffsets[i].Z * RotZ));
		rep.SetBase(self);
		rep.bHidden = true;
		KP.Repulsors[i] = rep;
		i++;
		// [Loop Continue]
		goto J0x43;
	}
	super.PostNetBeginPlay();
	//return;	
}

simulated event Destroyed()
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
	super.Destroyed();
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
		KP.Repulsors[i].Softness = HoverSoftness;
		KP.Repulsors[i].PenScale = HoverPenScale;
		KP.Repulsors[i].CheckDist = HoverCheckDist;
		i++;
		// [Loop Continue]
		goto J0x1D;
	}
	KSetStayUprightParams(UprightStiffness, UprightDamping);
	//return;	
}

defaultproperties
{
	MPHMeterMaterial=Texture'InterfaceContent.Menu.BorderBoxD'
	MPHMeterPosX=0.0100000
	MPHMeterPosY=0.9000000
	MPHMeterScale=70.0000000
	MPHMeterSizeY=0.0500000
}
