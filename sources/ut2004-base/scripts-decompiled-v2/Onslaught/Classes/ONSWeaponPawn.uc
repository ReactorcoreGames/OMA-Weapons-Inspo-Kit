class ONSWeaponPawn extends Vehicle
	native
	nativereplication
	config(User);

const FilterFrames = 5;

var() Vector GunnerPos;
var() Rotator GunnerRot;
var() Vector FireImpulse;
var() Vector AltFireImpulse;
var ONSWeapon Gun;
var Class<ONSWeapon> GunClass;
var ONSVehicle VehicleBase;
var() Class<Actor> DestroyEffectClass;
var Vector CameraHistory[5];
var int NextHistorySlot;
var bool bHistoryWarmup;
var bool bHasFireImpulse;
var bool bHasAltFireImpulse;
var bool bCustomAiming;
var Rotator CustomAim;
var float YawAccel;
var float PitchAccel;
var string DebugInfo;
var bool bHasOwnHealth;
var bool bHasAltFire;
var() name CameraBone;
var config Color CrossHairColor;
var config float CrosshairX;
var config float CrosshairY;
var config Texture CrosshairTexture;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		Gun, VehicleBase;

	// Pos:0x00D
	reliable if(int(Role) < int(ROLE_Authority))
		ServerChangeDriverPosition;
}

function AttachFlag(Actor FlagActor)
{
	// End:0x22
	if(VehicleBase != none)
	{
		VehicleBase.AttachFlag(FlagActor);		
	}
	else
	{
		super.AttachFlag(FlagActor);
	}
	//return;	
}

function Vehicle GetMoveTargetFor(Pawn P)
{
	// End:0x11
	if(VehicleBase != none)
	{
		return VehicleBase;
	}
	return self;
	//return;	
}

function bool HasWeapon()
{
	return Gun != none;
	//return;	
}

function Pawn GetAimTarget()
{
	// End:0x11
	if(VehicleBase != none)
	{
		return VehicleBase;
	}
	return self;
	//return;	
}

function bool CanAttack(Actor Other)
{
	// End:0x20
	if(Gun != none)
	{
		return Gun.CanAttack(Other);
	}
	return false;
	//return;	
}

function bool TooCloseToAttack(Actor Other)
{
	local int NeededPitch;

	// End:0x32
	if((Gun == none) || VSize(Location - Other.Location) > float(2500))
	{
		return false;
	}
	Gun.CalcWeaponFire();
	NeededPitch = Rotator(Other.Location - Gun.WeaponFireLocation).Pitch;
	NeededPitch = NeededPitch & 65535;
	return (LimitPitch(NeededPitch)) == NeededPitch;
	//return;	
}

function ChooseFireAt(Actor A)
{
	// End:0x19
	if(!bHasAltFire)
	{
		Fire(0.0000000);		
	}
	else
	{
		// End:0x54
		if(Gun != none)
		{
			// End:0x49
			if(int(Gun.BestMode()) == 0)
			{
				Fire(0.0000000);				
			}
			else
			{
				AltFire(0.0000000);
			}
		}
	}
	//return;	
}

function float RefireRate()
{
	// End:0x4E
	if(Gun != none)
	{
		// End:0x38
		if(bWeaponisAltFiring && bHasAltFire)
		{
			return Gun.AIInfo[1].RefireRate;			
		}
		else
		{
			return Gun.AIInfo[0].RefireRate;
		}
	}
	return 0.0000000;
	//return;	
}

function bool IsFiring()
{
	return (Gun != none) && bWeaponisFiring || bWeaponisAltFiring && bHasAltFire;
	//return;	
}

function bool NeedToTurn(Vector targ)
{
	return !(Gun != none) && Gun.bCorrectAim;
	//return;	
}

function bool FireOnRelease()
{
	// End:0x50
	if(Gun != none)
	{
		// End:0x39
		if(bWeaponisAltFiring && bHasAltFire)
		{
			return Gun.AIInfo[1].bFireOnRelease;			
		}
		else
		{
			return Gun.AIInfo[0].bFireOnRelease;
		}
	}
	return false;
	//return;	
}

simulated function bool IndependentVehicle()
{
	return false;
	//return;	
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	super.DisplayDebug(Canvas, YL, YPos);
	Canvas.SetDrawColor(byte(255), 0, 0);
	Canvas.DrawText(DebugInfo);
	YPos += YL;
	YPos += YL;
	Canvas.SetPos(0.0000000, YPos);
	Canvas.SetDrawColor(0, 0, byte(255));
	Canvas.DrawText("-- Gun: " $ string(Gun));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	Gun.DisplayDebug(Canvas, YL, YPos);
	Canvas.SetPos(4.0000000, YPos);
	DebugInfo = "";
	//return;	
}

function BeginPlay()
{
	super(Actor).BeginPlay();
	Gun = Spawn(GunClass, self,, Location);
	// End:0x4E
	if(Gun != none)
	{
		PitchUpLimit = Gun.PitchUpLimit;
		PitchDownLimit = Gun.PitchDownLimit;
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	local bool OldCollideActors, OldBlockActors;

	super(Pawn).PostNetBeginPlay();
	// End:0x48
	if(bCollideActors)
	{
		OldCollideActors = bCollideActors;
		OldBlockActors = bBlockActors;
		GetBoneCoords('None');
		SetCollision(false, false);
		SetCollision(OldCollideActors, OldBlockActors);
	}
	TeamChanged();
	//return;	
}

simulated function TeamChanged()
{
	super.TeamChanged();
	// End:0x25
	if(Gun != none)
	{
		Gun.SetTeam(Team);
	}
	//return;	
}

function Vehicle GetVehicleBase()
{
	return VehicleBase;
	//return;	
}

function AttachToVehicle(ONSVehicle VehiclePawn, name WeaponBone)
{
	// End:0x3D
	if(int(Level.NetMode) != int(NM_Client))
	{
		VehicleBase = VehiclePawn;
		VehicleBase.AttachToBone(Gun, WeaponBone);
	}
	//return;	
}

simulated function SpecialCalcFirstPersonView(PlayerController PC, out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
	local Vector X, Y, Z, VehicleZ, CamViewOffsetWorld;

	local float CamViewOffsetZAmount;
	local Coords CamBoneCoords;

	GetAxes(CameraRotation, X, Y, Z);
	ViewActor = self;
	CamViewOffsetWorld = FPCamViewOffset >> CameraRotation;
	// End:0xD8
	if((CameraBone != 'None') && Gun != none)
	{
		CamBoneCoords = Gun.GetBoneCoords(CameraBone);
		CameraLocation = (CamBoneCoords.Origin + (FPCamPos >> Rotation)) + CamViewOffsetWorld;
		// End:0xD5
		if(bFPNoZFromCameraPitch)
		{
			VehicleZ = vect(0.0000000, 0.0000000, 1.0000000) >> Rotation;
			CamViewOffsetZAmount = CamViewOffsetWorld Dot VehicleZ;
			CameraLocation -= (CamViewOffsetZAmount * VehicleZ);
		}		
	}
	else
	{
		CameraLocation = ((GetCameraLocationStart()) + (FPCamPos >> Rotation)) + CamViewOffsetWorld;
		// End:0x143
		if(bFPNoZFromCameraPitch)
		{
			VehicleZ = vect(0.0000000, 0.0000000, 1.0000000) >> Rotation;
			CamViewOffsetZAmount = CamViewOffsetWorld Dot VehicleZ;
			CameraLocation -= (CamViewOffsetZAmount * VehicleZ);
		}
	}
	CameraRotation = Normalize(CameraRotation + PC.ShakeRot);
	CameraLocation = ((CameraLocation + (PC.ShakeOffset.X * X)) + (PC.ShakeOffset.Y * Y)) + (PC.ShakeOffset.Z * Z);
	//return;	
}

simulated function Vector GetCameraLocationStart()
{
	// End:0x3E
	if((VehicleBase != none) && Gun != none)
	{
		return VehicleBase.GetBoneCoords(Gun.AttachmentBone).Origin;		
	}
	else
	{
		return super.GetCameraLocationStart();
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x32
	if((int(Level.NetMode) != int(NM_Client)) && Gun != none)
	{
		Gun.Destroy();
	}
	super.Destroyed();
	//return;	
}

event EncroachedBy(Actor Other)
{
	//return;	
}

singular event BaseChange()
{
	//return;	
}

function Fire(optional float F)
{
	super.Fire(F);
	// End:0x3D
	if((Gun != none) && PlayerController(Controller) != none)
	{
		Gun.ClientStartFire(Controller, false);
	}
	//return;	
}

function AltFire(optional float F)
{
	super.AltFire(F);
	// End:0x4A
	if((!bWeaponisFiring && Gun != none) && PlayerController(Controller) != none)
	{
		Gun.ClientStartFire(Controller, true);
	}
	//return;	
}

function ClientVehicleCeaseFire(bool bWasAltFire)
{
	super.ClientVehicleCeaseFire(bWasAltFire);
	// End:0x5C
	if(Gun != none)
	{
		Gun.ClientStopFire(Controller, bWasAltFire);
		// End:0x5C
		if(!bWasAltFire && bWeaponisAltFiring)
		{
			Gun.ClientStartFire(Controller, true);
		}
	}
	//return;	
}

function VehicleCeaseFire(bool bWasAltFire)
{
	super.VehicleCeaseFire(bWasAltFire);
	// End:0x2B
	if(Gun != none)
	{
		Gun.CeaseFire(Controller);
	}
	//return;	
}

function bool TryToDrive(Pawn P)
{
	// End:0x94
	if(VehicleBase != none)
	{
		// End:0x43
		if(VehicleBase.NeedsFlip())
		{
			VehicleBase.Flip(Vector(P.Rotation), 1.0000000);
			return false;
		}
		// End:0x94
		if(P.GetTeamNum() != int(Team))
		{
			// End:0x87
			if(VehicleBase.Driver == none)
			{
				return VehicleBase.TryToDrive(P);
			}
			VehicleLocked(P);
			return false;
		}
	}
	return super.TryToDrive(P);
	//return;	
}

function KDriverEnter(Pawn P)
{
	local Rotator NewRotation;

	super.KDriverEnter(P);
	// End:0x4F
	if(((VehicleBase != none) && VehicleBase.bTeamLocked) && VehicleBase.bEnterringUnlocks)
	{
		VehicleBase.bTeamLocked = false;
	}
	Gun.bActive = true;
	// End:0xA0
	if(!bHasOwnHealth && VehicleBase == none)
	{
		Health = Driver.Health;
		HealthMax = Driver.HealthMax;
	}
	// End:0x10A
	if((xPawn(Driver) != none) && Driver.HasUDamage())
	{
		Gun.SetOverlayMaterial(xPawn(Driver).UDamageWeaponMaterial, xPawn(Driver).UDamageTime - Level.TimeSeconds, false);
	}
	NewRotation = Controller.Rotation;
	NewRotation.Pitch = LimitPitch(NewRotation.Pitch);
	SetRotation(NewRotation);
	Driver.bSetPCRotOnPossess = false;
	// End:0x185
	if(Gun != none)
	{
		Gun.NetPriority = 2.0000000;
		Gun.NetUpdateFrequency = 10.0000000;
	}
	//return;	
}

function PossessedBy(Controller C)
{
	super.PossessedBy(C);
	NetPriority = 1.0000000;
	//return;	
}

function bool KDriverLeave(bool bForceLeave)
{
	local Controller C;

	C = Controller;
	// End:0x1B1
	if(super.KDriverLeave(bForceLeave) || bForceLeave)
	{
		bWeaponisFiring = false;
		// End:0x5D
		if(!bHasOwnHealth && VehicleBase == none)
		{
			HealthMax = default.HealthMax;
			Health = int(HealthMax);
		}
		// End:0x145
		if(C != none)
		{
			// End:0xDC
			if(((Gun != none) && xPawn(C.Pawn) != none) && C.Pawn.HasUDamage())
			{
				Gun.SetOverlayMaterial(xPawn(C.Pawn).UDamageWeaponMaterial, 0.0000000, false);
			}
			// End:0x121
			if(C.Pawn != none)
			{
				C.Pawn.bSetPCRotOnPossess = C.Pawn.default.bSetPCRotOnPossess;
			}
			// End:0x145
			if(Bot(C) != none)
			{
				Bot(C).ClearTemporaryOrders();
			}
		}
		// End:0x1AC
		if(Gun != none)
		{
			Gun.bActive = false;
			Gun.FlashCount = 0;
			Gun.NetUpdateFrequency = Gun.default.NetUpdateFrequency;
			Gun.NetPriority = Gun.default.NetPriority;
		}
		return true;		
	}
	else
	{
		// End:0x1EC
		if(((Bot(Controller) != none) && VehicleBase != none) && VehicleBase.Driver == none)
		{
			ServerChangeDriverPosition(1);
		}
		return false;
	}
	//return;	
}

function DriverDied()
{
	// End:0x59
	if(((Gun != none) && xPawn(Driver) != none) && Driver.HasUDamage())
	{
		Gun.SetOverlayMaterial(xPawn(Driver).UDamageWeaponMaterial, 0.0000000, false);
	}
	super.DriverDied();
	//return;	
}

simulated function ClientKDriverEnter(PlayerController PC)
{
	local Rotator NewRotation;

	super.ClientKDriverEnter(PC);
	NewRotation = PC.Rotation;
	NewRotation.Pitch = LimitPitch(NewRotation.Pitch);
	SetRotation(NewRotation);
	//return;	
}

simulated function ClientKDriverLeave(PlayerController PC)
{
	// End:0x47
	if(Gun != none)
	{
		// End:0x29
		if(bWeaponisFiring)
		{
			Gun.ClientStopFire(PC, false);
		}
		// End:0x47
		if(bWeaponisAltFiring)
		{
			Gun.ClientStopFire(PC, true);
		}
	}
	super.ClientKDriverLeave(PC);
	//return;	
}

function bool PlaceExitingDriver()
{
	local int i;
	local Vector tryPlace, Extent, HitLocation, HitNormal, ZOffset;

	// End:0x0D
	if(Driver == none)
	{
		return false;
	}
	Extent = Driver.default.CollisionRadius * vect(1.0000000, 1.0000000, 0.0000000);
	Extent.Z = Driver.default.CollisionHeight;
	ZOffset = Driver.default.CollisionHeight * vect(0.0000000, 0.0000000, 0.5000000);
	// End:0x1EC
	if((VehicleBase != none) && VSize(VehicleBase.Velocity) > float(100))
	{
		tryPlace = Normal(VehicleBase.Velocity Cross vect(0.0000000, 0.0000000, 1.0000000)) * (VehicleBase.CollisionRadius * 1.2500000);
		// End:0xE8
		if(FRand() < 0.5000000)
		{
			tryPlace *= float(-1);
		}
		// End:0x1EC
		if(((VehicleBase.Trace(HitLocation, HitNormal, (VehicleBase.Location + tryPlace) + ZOffset, VehicleBase.Location + ZOffset, false, Extent) == none) && Driver.SetLocation((VehicleBase.Location + tryPlace) + ZOffset)) || (VehicleBase.Trace(HitLocation, HitNormal, (VehicleBase.Location - tryPlace) + ZOffset, VehicleBase.Location + ZOffset, false, Extent) == none) && Driver.SetLocation((VehicleBase.Location - tryPlace) + ZOffset))
		{
			return true;
		}
	}
	i = 0;
	J0x1F3:

	// End:0x376 [Loop If]
	if(i < ExitPositions.Length)
	{
		// End:0x2BD
		if(bRelativeExitPos)
		{
			// End:0x253
			if(VehicleBase != none)
			{
				tryPlace = (VehicleBase.Location + (ExitPositions[i] >> VehicleBase.Rotation)) + ZOffset;				
			}
			else
			{
				// End:0x29A
				if(Gun != none)
				{
					tryPlace = (Gun.Location + (ExitPositions[i] >> Gun.Rotation)) + ZOffset;					
				}
				else
				{
					tryPlace = Location + (ExitPositions[i] >> Rotation);
				}
			}			
		}
		else
		{
			tryPlace = ExitPositions[i];
		}
		// End:0x351
		if(bRelativeExitPos)
		{
			// End:0x324
			if(VehicleBase != none)
			{
				// End:0x321
				if(VehicleBase.Trace(HitLocation, HitNormal, tryPlace, VehicleBase.Location + ZOffset, false, Extent) != none)
				{
					// [Explicit Continue]
					goto J0x36C;
				}				
			}
			else
			{
				// End:0x351
				if(Trace(HitLocation, HitNormal, tryPlace, Location + ZOffset, false, Extent) != none)
				{
					// [Explicit Continue]
					goto J0x36C;
				}
			}
		}
		// End:0x36A
		if(!Driver.SetLocation(tryPlace))
		{
			// [Explicit Continue]
			goto J0x36C;
		}
		return true;
		J0x36C:

		i++;
		// [Loop Continue]
		goto J0x1F3;
	}
	return false;
	//return;	
}

simulated function AttachDriver(Pawn P)
{
	local Coords GunnerAttachmentBoneCoords;

	// End:0x0D
	if(Gun == none)
	{
		return;
	}
	P.bHardAttach = true;
	GunnerAttachmentBoneCoords = Gun.GetBoneCoords(Gun.GunnerAttachmentBone);
	P.SetLocation(GunnerAttachmentBoneCoords.Origin);
	P.SetPhysics(0);
	Gun.AttachToBone(P, Gun.GunnerAttachmentBone);
	P.SetRelativeLocation(DrivePos);
	P.SetRelativeRotation(DriveRot);
	//return;	
}

simulated function DetachDriver(Pawn P)
{
	// End:0x39
	if((Gun != none) && P.AttachmentBone != 'None')
	{
		Gun.DetachFromBone(P);
	}
	//return;	
}

function UpdateRocketAcceleration(float DeltaTime, float YawChange, float PitchChange)
{
	local Rotator NewRotation;

	NewRotation = Rotation;
	NewRotation.Yaw += int((32.0000000 * DeltaTime) * YawChange);
	NewRotation.Pitch += int((32.0000000 * DeltaTime) * PitchChange);
	NewRotation.Pitch = LimitPitch(NewRotation.Pitch);
	SetRotation(NewRotation);
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x1B
	if(Gun != none)
	{
		return Gun.ChargeBar();
	}
	return 0.0000000;
	//return;	
}

function SetTeamNum(byte t)
{
	local byte Temp;

	Temp = Team;
	PrevTeam = t;
	Team = t;
	// End:0x3A
	if(int(Temp) != int(t))
	{
		TeamChanged();
	}
	//return;	
}

function Died(Controller Killer, Class<DamageType> DamageType, Vector HitLocation)
{
	local PlayerController PC;
	local Controller C;

	// End:0x1F
	if(bDeleteMe || Level.bLevelChange)
	{
		return;
	}
	// End:0x5A
	if(Level.Game.PreventDeath(self, Killer, DamageType, HitLocation))
	{
		Health = Max(Health, 1);
		return;
	}
	Health = Min(0, Health);
	// End:0x1D0
	if(Controller != none)
	{
		C = Controller;
		C.WasKilledBy(Killer);
		Level.Game.Killed(Killer, C, self, DamageType);
		// End:0x1C1
		if(C.bIsPlayer)
		{
			PC = PlayerController(C);
			// End:0xF5
			if(PC != none)
			{
				ClientKDriverLeave(PC);				
			}
			else
			{
				ClientClearController();
			}
			// End:0x16E
			if(((bRemoteControlled || bEjectDriver) && Driver != none) && Driver.Health > 0)
			{
				C.UnPossess();
				C.Possess(Driver);
				// End:0x164
				if(bEjectDriver)
				{
					EjectDriver();
				}
				Driver = none;				
			}
			else
			{
				// End:0x1AE
				if((PC != none) && VehicleBase != none)
				{
					PC.SetViewTarget(VehicleBase);
					PC.ClientSetViewTarget(VehicleBase);
				}
				C.PawnDied(self);
			}			
		}
		else
		{
			C.Destroy();
		}		
	}
	else
	{
		Level.Game.Killed(Killer, Controller(Owner), self, DamageType);
	}
	// End:0x225
	if(Killer != none)
	{
		TriggerEvent(Event, self, Killer.Pawn);		
	}
	else
	{
		TriggerEvent(Event, self, none);
	}
	// End:0x24F
	if(IsHumanControlled())
	{
		PlayerController(Controller).ForceDeathUpdate();
	}
	Destroy();
	//return;	
}

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x2B
	if(bHasOwnHealth)
	{
		super.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType);		
	}
	else
	{
		// End:0x7D
		if(Driver != none)
		{
			Driver.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType);
			// End:0x7D
			if(VehicleBase == none)
			{
				Health = Driver.Health;
			}
		}
	}
	//return;	
}

simulated function SwitchWeapon(byte F)
{
	// End:0x16
	if(VehicleBase != none)
	{
		ServerChangeDriverPosition(F);
	}
	//return;	
}

function ServerChangeDriverPosition(byte F)
{
	local Pawn OldDriver, Bot;

	// End:0x1A
	if((Driver == none) || VehicleBase == none)
	{
		return;
	}
	// End:0x105
	if((int(F) == 1) && (VehicleBase.Driver == none) || AIController(VehicleBase.Controller) != none)
	{
		OldDriver = Driver;
		// End:0xA0
		if(AIController(VehicleBase.Controller) != none)
		{
			Bot = VehicleBase.Driver;
			VehicleBase.KDriverLeave(true);
		}
		KDriverLeave(true);
		// End:0xED
		if(!VehicleBase.TryToDrive(OldDriver))
		{
			KDriverEnter(OldDriver);
			// End:0xEA
			if(Bot != none)
			{
				VehicleBase.KDriverEnter(Bot);
			}			
		}
		else
		{
			// End:0x103
			if(Bot != none)
			{
				TryToDrive(Bot);
			}
		}
		return;
	}
	F -= byte(2);
	// End:0x27B
	if((int(F) < VehicleBase.WeaponPawns.Length) && (VehicleBase.WeaponPawns[int(F)].Driver == none) || AIController(VehicleBase.WeaponPawns[int(F)].Controller) != none)
	{
		OldDriver = Driver;
		// End:0x1F9
		if(AIController(VehicleBase.WeaponPawns[int(F)].Controller) != none)
		{
			Bot = VehicleBase.WeaponPawns[int(F)].Driver;
			VehicleBase.WeaponPawns[int(F)].KDriverLeave(true);
		}
		KDriverLeave(true);
		// End:0x265
		if(!VehicleBase.WeaponPawns[int(F)].TryToDrive(OldDriver))
		{
			KDriverEnter(OldDriver);
			// End:0x265
			if(Bot != none)
			{
				VehicleBase.WeaponPawns[int(F)].KDriverEnter(Bot);
			}
		}
		// End:0x27B
		if(Bot != none)
		{
			TryToDrive(Bot);
		}
	}
	//return;	
}

function bool HasUDamage()
{
	return (Driver != none) && Driver.HasUDamage();
	//return;	
}

simulated function int LimitPitch(int Pitch)
{
	// End:0x24
	if((VehicleBase == none) || Gun == none)
	{
		return super(Pawn).LimitPitch(Pitch);
	}
	return Gun.LimitPitch(Pitch, VehicleBase.Rotation);
	//return;	
}

function bool TeamLink(int TeamNum)
{
	// End:0x2D
	if((VehicleBase != none) && !bHasOwnHealth)
	{
		return VehicleBase.TeamLink(TeamNum);
	}
	return super.TeamLink(TeamNum);
	//return;	
}

simulated function DrawHUD(Canvas Canvas)
{
	local PlayerController PC;
	local Vector CameraLocation;
	local Rotator CameraRotation;
	local Actor ViewActor;

	// End:0x10F
	if(((IsLocallyControlled()) && Gun != none) && Gun.bCorrectAim)
	{
		Canvas.DrawColor = CrossHairColor;
		Canvas.DrawColor.A = byte(255);
		Canvas.Style = 5;
		Canvas.SetPos((float(Canvas.SizeX) * 0.5000000) - CrosshairX, (float(Canvas.SizeY) * 0.5000000) - CrosshairY);
		Canvas.DrawTile(CrosshairTexture, (CrosshairX * 2.0000000) + float(1), (CrosshairY * 2.0000000) + float(1), 0.0000000, 0.0000000, float(CrosshairTexture.USize), float(CrosshairTexture.VSize));
	}
	PC = PlayerController(Controller);
	// End:0x207
	if(((PC != none) && !PC.bBehindView) && HudOverlay != none)
	{
		// End:0x204
		if(!Level.IsSoftwareRendering())
		{
			CameraRotation = PC.Rotation;
			SpecialCalcFirstPersonView(PC, ViewActor, CameraLocation, CameraRotation);
			HudOverlay.SetLocation(CameraLocation + (HUDOverlayOffset >> CameraRotation));
			HudOverlay.SetRotation(CameraRotation);
			Canvas.DrawActor(HudOverlay, false, false, FClamp(HUDOverlayFOV * (PC.DesiredFOV / PC.DefaultFOV), 1.0000000, 170.0000000));
		}		
	}
	else
	{
		ActivateOverlay(false);
	}
	//return;	
}

simulated function PostNetReceive()
{
	local int i;

	// End:0x79
	if(VehicleBase != none)
	{
		bNetNotify = false;
		i = 0;
		J0x1A:

		// End:0x59 [Loop If]
		if(i < VehicleBase.WeaponPawns.Length)
		{
			// End:0x4F
			if(VehicleBase.WeaponPawns[i] == self)
			{
				return;
			}
			i++;
			// [Loop Continue]
			goto J0x1A;
		}
		VehicleBase.WeaponPawns[VehicleBase.WeaponPawns.Length] = self;
	}
	//return;	
}

event ApplyFireImpulse(bool bAlt)
{
	// End:0x41
	if(!bAlt)
	{
		VehicleBase.KAddImpulse(FireImpulse >> Gun.WeaponFireRotation, Gun.WeaponFireLocation);		
	}
	else
	{
		VehicleBase.KAddImpulse(AltFireImpulse >> Gun.WeaponFireRotation, Gun.WeaponFireLocation);
	}
	//return;	
}

static function StaticPrecache(LevelInfo L)
{
	default.GunClass.static.StaticPrecache(L);
	//return;	
}

simulated function ProjectilePostRender2D(Projectile P, Canvas C, float ScreenLocX, float ScreenLocY)
{
	//return;	
}

defaultproperties
{
	bHistoryWarmup=true
	bHasAltFire=true
	CrossHairColor=(R=0,G=255,B=0,A=255)
	CrosshairX=32.0000000
	CrosshairY=32.0000000
	CrosshairTexture=Texture'ONSInterface-TX.tankBarrelAligned'
	bDrawVehicleShadow=false
	bDrawDriverInTP=true
	bTurnInPlace=true
	bFollowLookDir=true
	bDrawMeshInFP=true
	bZeroPCRotOnEntry=false
	bPCRelativeFPRotation=false
	EntryRadius=50.0000000
	bCrawler=true
	bIgnoreForces=true
	bStationary=true
	bSpecialHUD=true
	bSpecialCalcView=true
	bSetPCRotOnPossess=false
	LandMovementState="PlayerTurreting"
	DrawType=0
	bAcceptsProjectors=false
	bIgnoreEncroachers=true
	bNetInitialRotation=true
	NetPriority=0.5000000
	bCollideActors=false
	bCollideWorld=false
	bBlockActors=false
	bProjTarget=false
	bBlockZeroExtentTraces=false
	bBlockNonZeroExtentTraces=false
	bNetNotify=true
}
