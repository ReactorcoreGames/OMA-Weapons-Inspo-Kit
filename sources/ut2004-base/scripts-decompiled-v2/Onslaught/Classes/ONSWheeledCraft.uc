class ONSWheeledCraft extends ONSVehicle
	abstract
	native
	nativereplication
	config(User);

struct native SCarState
{
	var Vector ChassisPosition;
	var Quat ChassisQuaternion;
	var Vector ChassisLinVel;
	var Vector ChassisAngVel;
	var byte ServerHandbrake;
	var byte ServerBrake;
	var byte ServerGas;
	var byte ServerGear;
	var byte ServerSteering;
	var int ServerViewPitch;
	var int ServerViewYaw;
};

var() float WheelSoftness;
var() float WheelPenScale;
var() float WheelPenOffset;
var() float WheelRestitution;
var() float WheelAdhesion;
var() float WheelInertia;
var() InterpCurve WheelLongFrictionFunc;
var() float WheelLongSlip;
var() InterpCurve WheelLatSlipFunc;
var() float WheelLongFrictionScale;
var() float WheelLatFrictionScale;
var() float WheelHandbrakeSlip;
var() float WheelHandbrakeFriction;
var() float WheelSuspensionTravel;
var() float WheelSuspensionOffset;
var() float WheelSuspensionMaxRenderTravel;
var() float FTScale;
var() float ChassisTorqueScale;
var() float MinBrakeFriction;
var() InterpCurve MaxSteerAngleCurve;
var() InterpCurve TorqueCurve;
var() float GearRatios[5];
var() int NumForwardGears;
var() float TransRatio;
var() float ChangeUpPoint;
var() float ChangeDownPoint;
var() float LSDFactor;
var() float EngineBrakeFactor;
var() float EngineBrakeRPMScale;
var() float MaxBrakeTorque;
var() float SteerSpeed;
var() float TurnDamping;
var() float StopThreshold;
var() float HandbrakeThresh;
var() float EngineInertia;
var() float IdleRPM;
var() float EngineRPMSoundRange;
var() name SteerBoneName;
var() Object.EAxis SteerBoneAxis;
var() float SteerBoneMaxAngle;
var array<ONSDirtSlipEffect> Dust;
var() float DustSlipRate;
var() float DustSlipThresh;
var float OutputBrake;
var float OutputGas;
var bool OutputHandbrake;
var int Gear;
var float ForwardVel;
var bool bIsInverted;
var bool bIsDriving;
var float NumPoweredWheels;
var float TotalSpinVel;
var float EngineRPM;
var float CarMPH;
var float ActualSteering;
var Material RevMeterMaterial;
var() float RevMeterPosX;
var() float RevMeterPosY;
var() float RevMeterScale;
var() float RevMeterSizeY;
var() bool bMakeBrakeLights;
var() Vector BrakeLightOffset[2];
var ONSBrakelightCorona BrakeLight[2];
var() Material BrakeLightMaterial;
var Rotator OldRotation;
var Vector LastOnGroundLocation;
var float LastOnGroundTime;
var float InAirSpin;
var float InAirPitch;
var float InAirRoll;
var float InAirTime;
var float InAirDistance;
var int DaredevilPoints;
var() float DaredevilThreshInAirSpin;
var() float DaredevilThreshInAirPitch;
var() float DaredevilThreshInAirRoll;
var() float DaredevilThreshInAirTime;
var() float DaredevilThreshInAirDistance;
var() Class<LocalMessage> DaredevilMessageClass;
var SCarState CarState;
var SCarState OldCarState;
var KRigidBodyState ChassisState;
var bool bNewCarState;
var bool bOldVehicleOnGround;
var() bool bDoStuntInfo;
var() bool bAllowAirControl;
var() bool bAllowChargingJump;
var bool bAllowBigWheels;
var bool bPushDown;
var() float MaxJumpForce;
var float JumpForce;
var() float MaxJumpSpin;
var float JumpSpin;
var() float JumpChargeTime;
var float DesiredJumpForce;
var string JumpFeedbackForce;
var Sound JumpSound;
var() float JumpMeterOriginX;
var() float JumpMeterOriginY;
var() float JumpMeterWidth;
var() float JumpMeterHeight;
var() float JumpMeterSpacing;
var() Color JumpMeterColor;
var() Color SpinMeterColor;
var Texture JumpMeterTexture;
var float OutputPitch;
var() float AirTurnTorque;
var() float AirPitchTorque;
var() float AirPitchDamping;
var() float AirRollTorque;
var() float AirRollDamping;
var() float MinAirControlDamping;
var float FenderBenderSpeed;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		CarState;

	// Pos:0x00D
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		bAllowAirControl, bAllowChargingJump;

	// Pos:0x025
	reliable if((bNetInitial && bAllowChargingJump) && int(Role) == int(ROLE_Authority))
		JumpChargeTime, MaxJumpForce, 
		MaxJumpSpin;

	// Pos:0x048
	reliable if((bNetInitial && bDoStuntInfo) && int(Role) == int(ROLE_Authority))
		DaredevilThreshInAirDistance, DaredevilThreshInAirPitch, 
		DaredevilThreshInAirRoll, DaredevilThreshInAirSpin, 
		DaredevilThreshInAirTime;
}

simulated function PostBeginPlay()
{
	LastOnGroundTime = Level.TimeSeconds;
	LastOnGroundLocation = Location;
	super(Vehicle).PostBeginPlay();
	//return;	
}

simulated function PostNetBeginPlay()
{
	local int i;

	NumPoweredWheels = 0.0000000;
	i = 0;
	J0x12:

	// End:0x38 [Loop If]
	if(i < Wheels.Length)
	{
		NumPoweredWheels += 1.0000000;
		i++;
		// [Loop Continue]
		goto J0x12;
	}
	super.PostNetBeginPlay();
	//return;	
}

simulated function PrecacheAnnouncer(AnnouncerVoice V, bool bRewardSounds)
{
	// End:0x2A
	if(bRewardSounds && !bSoundsPrecached)
	{
		V.PrecacheSound('Fender_Bender');
	}
	super.PrecacheAnnouncer(V, bRewardSounds);
	//return;	
}

simulated function Destroyed()
{
	local int i;

	// End:0x8B
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		i = 0;
		J0x20:

		// End:0x4C [Loop If]
		if(i < Dust.Length)
		{
			Dust[i].Destroy();
			i++;
			// [Loop Continue]
			goto J0x20;
		}
		// End:0x8B
		if(bMakeBrakeLights)
		{
			// End:0x70
			if(BrakeLight[0] != none)
			{
				BrakeLight[0].Destroy();
			}
			// End:0x8B
			if(BrakeLight[1] != none)
			{
				BrakeLight[1].Destroy();
			}
		}
	}
	super.Destroyed();
	//return;	
}

simulated event bool KUpdateState(out KRigidBodyState NewState)
{
	// End:0x1F
	if((int(Role) == int(ROLE_Authority)) || !bNewCarState)
	{
		return false;
	}
	NewState = ChassisState;
	bNewCarState = false;
	return true;
	//return;	
}

simulated event SVehicleUpdateParams()
{
	local int i;

	super.SVehicleUpdateParams();
	i = 0;
	J0x0D:

	// End:0x193 [Loop If]
	if(i < Wheels.Length)
	{
		Wheels[i].Softness = WheelSoftness;
		Wheels[i].PenScale = WheelPenScale;
		Wheels[i].PenOffset = WheelPenOffset;
		Wheels[i].LongSlip = WheelLongSlip;
		Wheels[i].LatSlipFunc = WheelLatSlipFunc;
		Wheels[i].Restitution = WheelRestitution;
		Wheels[i].Adhesion = WheelAdhesion;
		Wheels[i].WheelInertia = WheelInertia;
		Wheels[i].LongFrictionFunc = WheelLongFrictionFunc;
		Wheels[i].HandbrakeFrictionFactor = WheelHandbrakeFriction;
		Wheels[i].HandbrakeSlipFactor = WheelHandbrakeSlip;
		Wheels[i].SuspensionTravel = WheelSuspensionTravel;
		Wheels[i].SuspensionOffset = WheelSuspensionOffset;
		Wheels[i].SuspensionMaxRenderTravel = WheelSuspensionMaxRenderTravel;
		i++;
		// [Loop Continue]
		goto J0x0D;
	}
	// End:0x275
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && bMakeBrakeLights)
	{
		i = 0;
		J0x1BE:

		// End:0x275 [Loop If]
		if(i < 2)
		{
			// End:0x26B
			if(BrakeLight[i] != none)
			{
				BrakeLight[i].SetBase(none);
				BrakeLight[i].SetLocation(Location + (BrakeLightOffset[i] >> Rotation));
				BrakeLight[i].SetBase(self);
				BrakeLight[i].SetRelativeRotation(rot(0, 32768, 0));
				BrakeLight[i].Skins[0] = BrakeLightMaterial;
			}
			i++;
			// [Loop Continue]
			goto J0x1BE;
		}
	}
	//return;	
}

simulated event DrivingStatusChanged()
{
	local int i;
	local Coords WheelCoords;

	super(Vehicle).DrivingStatusChanged();
	// End:0x1D4
	if((bDriving && int(Level.NetMode) != int(NM_DedicatedServer)) && !bDropDetail)
	{
		Dust.Length = Wheels.Length;
		i = 0;
		J0x4B:

		// End:0x119 [Loop If]
		if(i < Wheels.Length)
		{
			// End:0x10F
			if(Dust[i] == none)
			{
				WheelCoords = GetBoneCoords(Wheels[i].BoneName);
				Dust[i] = Spawn(Class'Onslaught.ONSDirtSlipEffect', self,, WheelCoords.Origin + ((vect(0.0000000, 0.0000000, -1.0000000) * Wheels[i].WheelRadius) >> Rotation));
				Dust[i].SetBase(self);
				Dust[i].SetDirtColor(Level.DustColor);
			}
			i++;
			// [Loop Continue]
			goto J0x4B;
		}
		// End:0x1D1
		if(bMakeBrakeLights)
		{
			i = 0;
			J0x129:

			// End:0x1D1 [Loop If]
			if(i < 2)
			{
				// End:0x1C7
				if(BrakeLight[i] == none)
				{
					BrakeLight[i] = Spawn(Class'Onslaught.ONSBrakelightCorona', self,, Location + (BrakeLightOffset[i] >> Rotation));
					BrakeLight[i].SetBase(self);
					BrakeLight[i].SetRelativeRotation(rot(0, 32768, 0));
					BrakeLight[i].Skins[0] = BrakeLightMaterial;
				}
				i++;
				// [Loop Continue]
				goto J0x129;
			}
		}		
	}
	else
	{
		// End:0x271
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			i = 0;
			J0x1F4:

			// End:0x220 [Loop If]
			if(i < Dust.Length)
			{
				Dust[i].Destroy();
				i++;
				// [Loop Continue]
				goto J0x1F4;
			}
			Dust.Length = 0;
			// End:0x271
			if(bMakeBrakeLights)
			{
				i = 0;
				J0x238:

				// End:0x271 [Loop If]
				if(i < 2)
				{
					// End:0x267
					if(BrakeLight[i] != none)
					{
						BrakeLight[i].Destroy();
					}
					i++;
					// [Loop Continue]
					goto J0x238;
				}
			}
		}
		TurnDamping = 0.0000000;
	}
	//return;	
}

simulated function Tick(float dt)
{
	local int i;
	local bool lostTraction;

	super(SVehicle).Tick(dt);
	// End:0x11F
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && !bDropDetail)
	{
		lostTraction = true;
		i = 0;
		J0x40:

		// End:0x84 [Loop If]
		if(i < Dust.Length)
		{
			Dust[i].UpdateDust(Wheels[i], DustSlipRate, DustSlipThresh);
			i++;
			// [Loop Continue]
			goto J0x40;
		}
		// End:0x11F
		if(bMakeBrakeLights)
		{
			i = 0;
			J0x94:

			// End:0xD2 [Loop If]
			if(i < 2)
			{
				// End:0xC8
				if(BrakeLight[i] != none)
				{
					BrakeLight[i].bCorona = true;
				}
				i++;
				// [Loop Continue]
				goto J0x94;
			}
			i = 0;
			J0xD9:

			// End:0x11F [Loop If]
			if(i < 2)
			{
				// End:0x115
				if(BrakeLight[i] != none)
				{
					BrakeLight[i].UpdateBrakelightState(OutputBrake, Gear);
				}
				i++;
				// [Loop Continue]
				goto J0xD9;
			}
		}
	}
	TurnDamping = default.TurnDamping;
	//return;	
}

function float ImpactDamageModifier()
{
	local float Multiplier;
	local Vector X, Y, Z;

	GetAxes(Rotation, X, Y, Z);
	// End:0x50
	if((ImpactInfo.impactNorm Dot Z) > float(0))
	{
		Multiplier = 1.0000000 - (ImpactInfo.impactNorm Dot Z);		
	}
	else
	{
		Multiplier = 1.0000000;
	}
	return super.ImpactDamageModifier() * Multiplier;
	//return;	
}

simulated event KImpact(Actor Other, Vector pos, Vector impactVel, Vector impactNorm)
{
	super.KImpact(Other, pos, impactVel, impactNorm);
	// End:0xD0
	if((((((ONSWheeledCraft(Other) != none) && ONSWheeledCraft(Other).bDriving) && PlayerController(Controller) != none) && ONSWheeledCraft(Other).GetTeamNum() != Controller.GetTeamNum()) && VSize(impactVel) > FenderBenderSpeed) && (Vector(Rotation) Dot Vector(Other.Rotation)) < float(0))
	{
		PlayerController(Controller).ReceiveLocalizedMessage(Class'Onslaught.ONSVehicleKillMessage', 7);
	}
	//return;	
}

simulated function DrawHUD(Canvas C)
{
	local float JumpChargeAmount, SpinChargeAmount, BarHeight;
	local PlayerController PC;

	super.DrawHUD(C);
	PC = PlayerController(Controller);
	// End:0x75
	if((((!bAllowChargingJump || Health < 1) || PC == none) || PC.myHUD == none) || PC.myHUD.bShowScoreBoard)
	{
		return;
	}
	C.Style = 5;
	C.SetPos(JumpMeterOriginX * C.ClipX, JumpMeterOriginY * C.ClipY);
	C.DrawColor = C.MakeColor(0, 0, 0, 150);
	C.DrawTile(Texture'HudContent.Generic.HUD', JumpMeterWidth * C.ClipX, JumpMeterHeight * C.ClipY, 251.0000000, 211.0000000, 83.0000000, 44.0000000);
	C.Style = 1;
	BarHeight = 0.5000000 * (JumpMeterHeight - (float(3) * JumpMeterSpacing));
	JumpChargeAmount = FClamp(JumpForce / MaxJumpForce, 0.0000000, 1.0000000);
	C.DrawColor = JumpMeterColor;
	C.SetPos((JumpMeterOriginX + JumpMeterSpacing) * C.ClipX, (JumpMeterOriginY + JumpMeterSpacing) * C.ClipY);
	C.DrawTile(JumpMeterTexture, ((JumpMeterWidth - (float(2) * JumpMeterSpacing)) * C.ClipX) * JumpChargeAmount, BarHeight * C.ClipY, 0.0000000, 0.0000000, float(JumpMeterTexture.USize), float(JumpMeterTexture.VSize) * JumpChargeAmount);
	SpinChargeAmount = FClamp(Abs(JumpSpin) / MaxJumpSpin, 0.0000000, 1.0000000);
	C.DrawColor = SpinMeterColor;
	C.SetPos((JumpMeterOriginX + JumpMeterSpacing) * C.ClipX, ((JumpMeterOriginY + (float(2) * JumpMeterSpacing)) + BarHeight) * C.ClipY);
	C.DrawTile(JumpMeterTexture, ((JumpMeterWidth - (float(2) * JumpMeterSpacing)) * C.ClipX) * SpinChargeAmount, BarHeight * C.ClipY, 0.0000000, 0.0000000, float(JumpMeterTexture.USize), float(JumpMeterTexture.VSize) * SpinChargeAmount);
	//return;	
}

simulated event Jumping()
{
	ClientPlayForceFeedback(JumpFeedbackForce);
	// End:0x2B
	if(JumpSound != none)
	{
		PlaySound(JumpSound,, 2.5000000 * TransientSoundVolume);
	}
	//return;	
}

simulated event SetWheelsScale(float NewScale)
{
	local int i;

	super(Vehicle).SetWheelsScale(NewScale);
	// End:0x18
	if(!bAllowBigWheels)
	{
		return;
	}
	i = 0;
	J0x1F:

	// End:0x5D [Loop If]
	if(i < Wheels.Length)
	{
		SetBoneScale(i, NewScale, Wheels[i].BoneName);
		i++;
		// [Loop Continue]
		goto J0x1F;
	}
	//return;	
}

simulated event OnDaredevil()
{
	local PlayerController PC;
	local TeamPlayerReplicationInfo PRI;

	PC = PlayerController(Controller);
	// End:0xAD
	if(PC != none)
	{
		// End:0x64
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			PC.ReceiveLocalizedMessage(DaredevilMessageClass, 0, none, none, self);
			PC.ReceiveLocalizedMessage(DaredevilMessageClass, 1, none, none, self);
		}
		// End:0xAD
		if(int(Role) == int(ROLE_Authority))
		{
			PRI = TeamPlayerReplicationInfo(PC.PlayerReplicationInfo);
			// End:0xAD
			if(PRI != none)
			{
				PRI.DaredevilPoints += DaredevilPoints;
			}
		}
	}
	//return;	
}

simulated function int LimitPitch(int Pitch)
{
	// End:0x1C
	if(bAllowAirControl && !bVehicleOnGround)
	{
		return Pitch;
	}
	return super.LimitPitch(Pitch);
	//return;	
}

defaultproperties
{
	NumForwardGears=4
	DustSlipRate=2.8000000
	DustSlipThresh=50.0000000
	DaredevilThreshInAirSpin=100.0000000
	DaredevilThreshInAirPitch=300.0000000
	DaredevilThreshInAirRoll=300.0000000
	DaredevilThreshInAirTime=1.5000000
	DaredevilThreshInAirDistance=17.0000000
	DaredevilMessageClass=Class'Onslaught.ONSDaredevilMessage'
	bOldVehicleOnGround=true
	MaxJumpForce=200000.0000000
	MaxJumpSpin=30000.0000000
	JumpChargeTime=1.0000000
	JumpFeedbackForce="HoverBikeJump"
	JumpSound=Sound'ONSVehicleSounds-S.Hydraulics.Hydraulic10'
	JumpMeterOriginX=0.2750000
	JumpMeterOriginY=0.9430000
	JumpMeterWidth=0.1360000
	JumpMeterHeight=0.0570000
	JumpMeterSpacing=0.0100000
	JumpMeterColor=(R=215,G=0,B=0,A=255)
	SpinMeterColor=(R=0,G=100,B=215,A=255)
	JumpMeterTexture=Texture'Engine.WhiteTexture'
	MinAirControlDamping=0.1000000
	FenderBenderSpeed=750.0000000
	bCanFlip=true
	CenterSpringRangePitch=5000
	CenterSpringRangeRoll=5000
	StolenAnnouncement="Car_jacked"
}
