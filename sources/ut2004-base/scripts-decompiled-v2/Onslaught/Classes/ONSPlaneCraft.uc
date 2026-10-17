class ONSPlaneCraft extends ONSVehicle
	abstract
	native
	nativereplication
	config(User);

struct native PlaneStateStruct
{
	var KRBVec ChassisPosition;
	var Quat ChassisQuaternion;
	var KRBVec ChassisLinVel;
	var KRBVec ChassisAngVel;
	var float ServerThrust;
	var float ServerStrafe;
	var float ServerRise;
	var int ServerViewPitch;
	var int ServerViewYaw;
};

var() InterpCurve LiftCoefficientCurve;
var() InterpCurve DragCoefficientCurve;
var() float AirFactor;
var() float MaxThrust;
var() float ThrustAcceleration;
var() bool bHoverOnGround;
var() float COMHeight;
var() InterpCurve HoverForceCurve;
var() float CameraSwingRatio;
var() float CameraDistance;
var array<Vector> ThrusterOffsets;
var() float HoverSoftness;
var() float HoverPenScale;
var() float HoverCheckDist;
var float OutputThrust;
var float OutputStrafe;
var float OutputRise;
var float CurrentThrust;
var float AccumulatedTime;
var float LastCamTime;
var Rotator LastCamRot;
var() float PitchTorque;
var() float BankTorque;
var PlaneStateStruct PlaneState;
var PlaneStateStruct OldPlaneState;
var KRigidBodyState ChassisState;
var bool bNewPlaneState;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		PlaneState;
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

simulated event bool KUpdateState(out KRigidBodyState NewState)
{
	// End:0x1F
	if((int(Role) == int(ROLE_Authority)) || !bNewPlaneState)
	{
		return false;
	}
	NewState = ChassisState;
	bNewPlaneState = false;
	return true;
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
	//return;	
}

function int GetRotDiff(int A, int B)
{
	local int Comp;

	Comp = (A - B) & 65535;
	// End:0x34
	if(Comp > 32768)
	{
		Comp -= 65536;
	}
	return Comp;
	//return;	
}

simulated function SpecialCalcBehindView(PlayerController PC, out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
	local Vector CamLookAt, HitLocation, HitNormal;
	local float LerpAmount, CurTime;

	ViewActor = self;
	CurTime = Level.TimeSeconds;
	LerpAmount = 1.0000000 - (CameraSwingRatio ** (CurTime - LastCamTime));
	LastCamTime = CurTime;
	CamLookAt = Location;
	CameraRotation.Roll = 0;
	CameraRotation.Yaw = int(float(LastCamRot.Yaw) + (float(GetRotDiff(Rotation.Yaw, LastCamRot.Yaw)) * LerpAmount));
	CameraRotation.Pitch = -4000;
	CameraLocation = CamLookAt + ((CameraDistance * vect(-1.0000000, 0.0000000, 0.0000000)) >> CameraRotation);
	// End:0x10A
	if(Trace(HitLocation, HitNormal, CameraLocation, CamLookAt, false, vect(10.0000000, 10.0000000, 10.0000000)) != none)
	{
		CameraLocation = HitLocation;
	}
	LastCamRot = CameraRotation;
	//return;	
}

simulated function SpecialCalcFirstPersonView(PlayerController PC, out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
	local Vector CamLookAt, HitLocation, HitNormal;
	local float LerpAmount, CurTime;

	ViewActor = self;
	CurTime = Level.TimeSeconds;
	LerpAmount = 1.0000000 - (CameraSwingRatio ** (CurTime - LastCamTime));
	LastCamTime = CurTime;
	CamLookAt = Location;
	CameraRotation.Roll = 0;
	CameraRotation.Yaw = int(float(16384 + LastCamRot.Yaw) + (float(GetRotDiff(Rotation.Yaw, LastCamRot.Yaw)) * LerpAmount));
	CameraRotation.Pitch = -4000;
	CameraLocation = CamLookAt + ((CameraDistance * vect(0.0000000, 1.0000000, 0.0000000)) >> CameraRotation);
	// End:0x111
	if(Trace(HitLocation, HitNormal, CameraLocation, CamLookAt, false, vect(10.0000000, 10.0000000, 10.0000000)) != none)
	{
		CameraLocation = HitLocation;
	}
	LastCamRot = CameraRotation;
	//return;	
}

defaultproperties
{
	CameraSwingRatio=0.0200000
	CameraDistance=900.0000000
}
