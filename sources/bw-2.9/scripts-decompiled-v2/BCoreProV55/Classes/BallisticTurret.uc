class BallisticTurret extends Vehicle
	abstract
	config(BallisticProV55);

var() const int MinTurretEyeDepth;
var() int AmmoAmount[2];
var() int MagAmmoAmount;
var() byte WeaponMode;
var bool bWeaponDeployed;
var() string UndeployedWeaponName;
var() string WeaponClassName;
var() Range GunYawBounds;
var() Range GunPitchBounds;
var() Range CamYawBounds;
var() Range CamPitchBounds;
var Range GoalYawBounds;
var Range GoalPitchBounds;
var() float YawSpeed;
var() float PitchSpeed;
var() float GunYawSpeed;
var() float GunPitchSpeed;
var() float CamTrackYawSpeed;
var() float CamTrackPitchSpeed;
var() float CamYawSpeed;
var() float CamPitchSpeed;
var() int AbandonedPitch;
var() float TurretFOV;
var() Vector CameraOffset;
var() float CameraElevation;
var() name GunBone;
var() name PivotBone;
var Rotator WeaponPivot;
var Rotator GoalRotation;
var Rotator GunRotation;
var Rotator CameraRotation;
var Rotator CameraDirection;
var() Vector DriverOffset;
var() float DriverBackOff;
var() name RightHandleBone;
var() name LeftHandleBone;
var Rotator SentViewRotation;
var() bool bNoUndeploy;
var() bool bIgnoreTurretLimit;
var Triggers MyUseTrigger;
var Pawn OldDriver;
var bool bDriverOutOfRange;
var byte GunRotationYaw;
var byte GunRotationPitch;
var BCTurretList TurretList;
var float LastUsedTime;
var byte CamoIndex;
var byte LayoutIndex;
var float NextBotReaimTime;
var Rotator BotAimError;
var float BotsNextDesireTime;

replication
{
	// Pos:0x000
	reliable if(((int(Role) == int(ROLE_Authority)) && !bNetOwner) && bNetDirty)
		GunRotationPitch, GunRotationYaw;

	// Pos:0x025
	reliable if(int(Role) < int(ROLE_Authority))
		ServerTurretRotation;
}

simulated function FixPCRotation(PlayerController PC)
{
	//return;	
}

simulated function bool HasUDamage()
{
	return (Driver != none) && Driver.HasUDamage();
	//return;	
}

function AdjustDriverDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	Momentum = vect(0.0000000, 0.0000000, 0.0000000);
	// End:0x23
	if(InGodMode())
	{
		Damage = 0;
	}
	//return;	
}

simulated function SetViewRotation(Rotator NewRotation)
{
	SentViewRotation = NewRotation;
	//return;	
}

function CheckTurretLimit()
{
	// End:0x1A
	if(TurretList != none)
	{
		TurretList.CheckTurretLimit();
	}
	//return;	
}

function AddToList()
{
	// End:0x1B
	if(TurretList != none)
	{
		TurretList.AddTurret(self);
	}
	//return;	
}

function RemoveFromList()
{
	// End:0x1B
	if(TurretList != none)
	{
		TurretList.RemoveTurret(self);
	}
	//return;	
}

function Retire()
{
	// End:0x0D
	if(Controller != none)
	{
		return;
	}
	Destroy();
	//return;	
}

simulated event Destroyed()
{
	// End:0x16
	if(int(Role) == int(ROLE_Authority))
	{
		RemoveFromList();
	}
	super.Destroyed();
	//return;	
}

function bool DriverGetAmmo(Ammunition Ammo, int AmmoToAdd)
{
	// End:0x0D
	if(Weapon == none)
	{
		return true;
	}
	// End:0x4F
	if((Weapon.GetAmmoClass(0) == Ammo.Class) && Weapon.AddAmmo(AmmoToAdd, 0))
	{
		return false;		
	}
	else
	{
		// End:0x8E
		if((Weapon.GetAmmoClass(1) == Ammo.Class) && Weapon.AddAmmo(AmmoToAdd, 1))
		{
			return false;
		}
	}
	return true;
	//return;	
}

function InitDeployedTurretFor(Weapon Weap)
{
	local int i;
	local WeaponCamo WC;
	local Material M;

	// End:0x1EE
	if(BallisticWeapon(Weap) != none)
	{
		MagAmmoAmount = BallisticWeapon(Weap).MagAmmo;
		WeaponMode = BallisticWeapon(Weap).CurrentWeaponMode;
		CamoIndex = BallisticWeapon(Weap).CamoIndex;
		LayoutIndex = BallisticWeapon(Weap).LayoutIndex;
		// End:0x1EE
		if((BallisticWeapon(Instigator.Weapon) != none) && BallisticWeapon(Instigator.Weapon).WeaponCamo != none)
		{
			WC = BallisticWeapon(Weap).WeaponCamo;
			i = 0;
			J0xD1:

			// End:0x1EE [Loop If]
			if(i < WC.WeaponMaterialSwaps.Length)
			{
				// End:0x1E4
				if(WC.WeaponMaterialSwaps[i].AIndex != -1)
				{
					// End:0x165
					if(WC.WeaponMaterialSwaps[i].Material != none)
					{
						Skins[WC.WeaponMaterialSwaps[i].AIndex] = WC.WeaponMaterialSwaps[i].Material;
					}
					// End:0x1E4
					if(WC.WeaponMaterialSwaps[i].MaterialName != "")
					{
						M = Material(DynamicLoadObject(WC.WeaponMaterialSwaps[i].MaterialName, Class'Engine.Material'));
						// End:0x1E4
						if(M != none)
						{
							Skins[WC.WeaponMaterialSwaps[i].AIndex] = M;
						}
					}
				}
				++i;
				// [Loop Continue]
				goto J0xD1;
			}
		}
	}
	AmmoAmount[0] = Weap.AmmoAmount(0);
	AmmoAmount[1] = Weap.AmmoAmount(1);
	//return;	
}

function InitTurretWeapon(Weapon Weap)
{
	// End:0x70
	if(BallisticWeapon(Weap) != none)
	{
		BallisticWeapon(Weap).MagAmmo = MagAmmoAmount;
		BallisticWeapon(Weap).CurrentWeaponMode = WeaponMode;
		BallisticWeapon(Weap).ServerSwitchWeaponMode(WeaponMode);
		BallisticWeapon(Weap).InitTurretWeapon(self);
	}
	//return;	
}

function InitUndeployedWeapon(Weapon Weap)
{
	// End:0xB8
	if(BallisticWeapon(Weap) != none)
	{
		BallisticWeapon(Weap).MagAmmo = MagAmmoAmount;
		// End:0xA3
		if((int(WeaponMode) < BallisticWeapon(Weap).WeaponModes.Length) && !BallisticWeapon(Weap).WeaponModes[int(WeaponMode)].bUnavailable)
		{
			BallisticWeapon(Weap).CurrentWeaponMode = WeaponMode;
			BallisticWeapon(Weap).ServerSwitchWeaponMode(WeaponMode);
		}
		BallisticWeapon(Weap).InitWeaponFromTurret(self);
	}
	//return;	
}

function SaveTurretWeaponInfo()
{
	// End:0x16
	if(Weapon != none)
	{
		InitDeployedTurretFor(Weapon);
	}
	//return;	
}

function UpdateWeaponRotation()
{
	local Rotator HeadRot, NeckRot;

	// End:0xC5
	if(Weapon != none)
	{
		NeckRot.Yaw = -GunRotation.Yaw;
		HeadRot.Pitch = -GunRotation.Pitch;
		NeckRot.Yaw -= WeaponPivot.Yaw;
		HeadRot.Pitch -= WeaponPivot.Pitch;
		// End:0x93
		if(Weapon.hand < float(0))
		{
			NeckRot.Yaw = 0 - NeckRot.Yaw;
		}
		Weapon.SetBoneRotation(PivotBone, NeckRot);
		Weapon.SetBoneRotation(GunBone, HeadRot);
	}
	//return;	
}

function PreBeginPlay()
{
	super(Pawn).PreBeginPlay();
	MyUseTrigger = Spawn(Class'BCoreProV55.BallisticTurretTrigger', self,, Location - (Vector(Rotation) * float(60)));
	LastUsedTime = Level.TimeSeconds;
	Class'BCoreProV55.BCTurretList'.static.AutoInitTurret(self);
	//return;	
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x33
	if(Weapon != none)
	{
		Weapon.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	}
	//return;	
}

function GiveWeapon(string aClassName)
{
	local Class<Weapon> WeaponClass;
	local Weapon newWeapon;

	WeaponClass = Class<Weapon>(DynamicLoadObject(aClassName, Class'Core.Class'));
	// End:0x2E
	if((FindInventoryType(WeaponClass)) != none)
	{
		return;
	}
	newWeapon = Spawn(WeaponClass,,, Location);
	// End:0xA0
	if(newWeapon != none)
	{
		// End:0x90
		if(BallisticWeapon(newWeapon) != none)
		{
			BallisticWeapon(newWeapon).GenerateLayout(LayoutIndex);
			BallisticWeapon(newWeapon).GenerateCamo(CamoIndex);
		}
		newWeapon.GiveTo(self);
	}
	InitTurretWeapon(newWeapon);
	//return;	
}

function AddDefaultInventory()
{
	// End:0x19
	if(Weapon == none)
	{
		GiveWeapon(WeaponClassName);		
	}
	else
	{
		Weapon.GiveAmmo(0, none, false);
		Weapon.GiveAmmo(1, none, false);
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	super(Pawn).PostNetBeginPlay();
	GoalYawBounds.Min = float(Min(int(GunYawBounds.Min), int(CamYawBounds.Min)));
	GoalYawBounds.Max = float(Max(int(GunYawBounds.Max), int(CamYawBounds.Max)));
	GoalPitchBounds.Min = float(Min(int(GunPitchBounds.Min), int(CamPitchBounds.Min)));
	GoalPitchBounds.Max = float(Max(int(GunPitchBounds.Max), int(CamPitchBounds.Max)));
	//return;	
}

function Rotator BotError()
{
	local float F;

	// End:0xE9
	if(Level.TimeSeconds >= NextBotReaimTime)
	{
		F = ((FRand() * 2.0000000) - 1.0000000) * (256.0000000 + (4096.0000000 * (1.0000000 - (AIController(Controller).Skill / 6.0000000))));
		BotAimError.Yaw = int(F);
		F = ((FRand() * 2.0000000) - 1.0000000) * (256.0000000 + (4096.0000000 * (1.0000000 - (AIController(Controller).Skill / 6.0000000))));
		BotAimError.Pitch = int(F);
		NextBotReaimTime = (Level.TimeSeconds + 0.5000000) + FRand();
	}
	return BotAimError;
	//return;	
}

function BotUpdateAcceleration(float dt)
{
	local Rotator R;

	// End:0xE0
	if(Controller.Target != none)
	{
		R = Normalize(Rotator(Controller.Target.Location - (Location + (EyePosition()))) - Rotation);
		// End:0xC9
		if((((float(R.Yaw) < GunYawBounds.Min) || float(R.Yaw) > GunYawBounds.Max) || float(R.Pitch) < GunPitchBounds.Min) || float(R.Pitch) > GunPitchBounds.Max)
		{
			KDriverLeave(false);
		}
		GoalRotation = R + (BotError());		
	}
	else
	{
		// End:0x13C
		if(Controller.Focus != none)
		{
			GoalRotation = Normalize(Rotator(Controller.Focus.Location - (Location + (EyePosition()))) - Rotation) + (BotError());			
		}
		else
		{
			GoalRotation = Normalize(Rotator(Controller.FocalPoint - (Location + (EyePosition()))) - Rotation) + (BotError());
		}
	}
	//return;	
}

function UpdateRocketAcceleration(float dt, float YawChange, float PitchChange)
{
	local Rotator TempRot;

	// End:0xB0
	if(AIController(Controller) == none)
	{
		GoalRotation.Yaw = Clamp(int(float(GoalRotation.Yaw) + ((dt * YawChange) * YawSpeed)), int(GoalYawBounds.Min), int(GoalYawBounds.Max));
		GoalRotation.Pitch = Clamp(int(float(GoalRotation.Pitch) + ((dt * PitchChange) * PitchSpeed)), int(GoalPitchBounds.Min), int(GoalPitchBounds.Max));
		GoalRotation += SentViewRotation;		
	}
	else
	{
		BotUpdateAcceleration(dt);
	}
	// End:0x24C
	if(!bDriverOutOfRange || (Normal(Driver.Location - Location) Dot Vector(Rotation + GoalRotation)) < (Normal(Driver.Location - Location) Dot Vector(Rotation + CameraDirection)))
	{
		GunRotation.Yaw += Clamp(GoalRotation.Yaw - GunRotation.Yaw, int(dt * -GunYawSpeed), int(dt * GunYawSpeed));
		GunRotation.Yaw = Clamp(GunRotation.Yaw, int(GunYawBounds.Min), int(GunYawBounds.Max));
		CameraRotation.Yaw += Clamp(GoalRotation.Yaw - CameraRotation.Yaw, int(dt * -CamYawSpeed), int(dt * CamYawSpeed));
		CameraRotation.Yaw = Clamp(CameraRotation.Yaw, int(CamYawBounds.Min), int(CamYawBounds.Max));
		TempRot.Yaw = CameraDirection.Yaw + Clamp(GunRotation.Yaw - CameraDirection.Yaw, int(dt * -CamTrackYawSpeed), int(dt * CamTrackYawSpeed));
	}
	GunRotation.Pitch += Clamp(GoalRotation.Pitch - GunRotation.Pitch, int(dt * -GunPitchSpeed), int(dt * GunPitchSpeed));
	GunRotation.Pitch = Clamp(GunRotation.Pitch, int(GunPitchBounds.Min), int(GunPitchBounds.Max));
	UpdateSimulatedGunRotation();
	UpdateWeaponRotation();
	CameraRotation.Pitch += Clamp(GoalRotation.Pitch - CameraRotation.Pitch, int(dt * -CamPitchSpeed), int(dt * CamPitchSpeed));
	CameraRotation.Pitch = Clamp(CameraRotation.Pitch, int(CamPitchBounds.Min), int(CamPitchBounds.Max));
	TempRot.Pitch = CameraDirection.Pitch + Clamp(GunRotation.Pitch - CameraDirection.Pitch, int(dt * -CamTrackPitchSpeed), int(dt * CamTrackPitchSpeed));
	// End:0x3F1
	if(FastTrace((Location + Class'BCoreProV55.BUtil'.static.AlignedOffset(Rotation + TempRot, CameraOffset)) + (CameraElevation * vect(0.0000000, 0.0000000, 1.0000000)), Location + (CameraElevation * vect(0.0000000, 0.0000000, 1.0000000))))
	{
		CameraDirection = TempRot;
	}
	// End:0x41A
	if(AIController(Controller) == none)
	{
		Controller.SetRotation(CameraRotation + Rotation);
	}
	// End:0x43C
	if(int(Level.NetMode) == int(NM_ListenServer))
	{
		SendGunRotationToClients();		
	}
	else
	{
		// End:0x471
		if((int(Role) < int(ROLE_Authority)) && IsLocallyControlled())
		{
			ServerTurretRotation(GunRotation.Pitch, GunRotation.Yaw);
		}
	}
	//return;	
}

function SendGunRotationToClients()
{
	local float F;

	F = ((float(GunRotation.Yaw) + 32768.0000000) / float(65536)) * 254.0000000;
	GunRotationYaw = byte(F);
	F = ((float(GunRotation.Pitch) + 32768.0000000) / float(65536)) * 254.0000000;
	GunRotationPitch = byte(F);
	//return;	
}

function ServerTurretRotation(int GunPitch, int GunYaw)
{
	GunRotation.Pitch = GunPitch;
	GunRotation.Yaw = GunYaw;
	SendGunRotationToClients();
	// End:0x50
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && bDriving)
	{
		UpdateSimulatedGunRotation();
	}
	//return;	
}

simulated function UpdateSimulatedGunRotation()
{
	local Rotator HeadRot, NeckRot;

	NeckRot.Yaw = -GunRotation.Yaw;
	HeadRot.Pitch = -GunRotation.Pitch;
	SetBoneRotation(PivotBone, NeckRot);
	SetBoneRotation(GunBone, HeadRot);
	//return;	
}

simulated event Tick(float dt)
{
	local float DriverXYDistance, DriverZDistance, F;
	local Vector DriverPos;
	local Rotator newRot;

	super(Actor).Tick(dt);
	// End:0x77
	if(AIController(Controller) != none)
	{
		// End:0x62
		if((Weapon != none) && !Weapon.HasAmmo())
		{
			BotsNextDesireTime = Level.TimeSeconds + float(60);
			KDriverLeave(false);
			return;			
		}
		else
		{
			UpdateRocketAcceleration(dt, 0.0000000, 0.0000000);
		}
	}
	// End:0x10A
	if((int(Role) < int(ROLE_Authority)) && !IsLocallyControlled())
	{
		F = ((float(GunRotationYaw) / 254.0000000) * float(65536)) - float(32768);
		GunRotation.Yaw = int(F);
		F = ((float(GunRotationPitch) / 254.0000000) * float(65536)) - float(32768);
		GunRotation.Pitch = int(F);
		UpdateSimulatedGunRotation();
	}
	// End:0x513
	if((Driver != none) && bDriving)
	{
		// End:0x232
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			newRot = Rotator((LeftHandlePosition()) - Driver.GetBoneCoords('lfarm').Origin);
			Driver.SetBoneDirection('lfarm', newRot,, 1.0000000, 1);
			newRot.Roll += 32768;
			Driver.SetBoneDirection(Driver.GetOffhandBoneFor(none), newRot,, 1.0000000, 1);
			newRot = Rotator((RightHandlePosition()) - Driver.GetBoneCoords('rfarm').Origin);
			Driver.SetBoneDirection('rfarm', newRot,, 1.0000000, 1);
			Driver.SetBoneDirection(Driver.GetWeaponBoneFor(none), newRot,, 1.0000000, 1);
		}
		DriverPos = DriverPosition();
		DriverXYDistance = VSize((Driver.Location - DriverPos) * vect(1.0000000, 1.0000000, 0.0000000));
		DriverZDistance = Driver.Location.Z - Location.Z;
		// End:0x2DC
		if((int(Role) == int(ROLE_Authority)) && ((DriverXYDistance > float(120)) || DriverZDistance > float(60)) || DriverZDistance < float(-60))
		{
			KDriverLeave(true);
			return;
		}
		// End:0x348
		if((IsLocallyControlled()) && DriverXYDistance > float(80))
		{
			bDriverOutOfRange = true;
			Driver.Acceleration = Normal(DriverPos - Driver.Location) * float(300);
			Driver.Acceleration.Z = 0.0000000;			
		}
		else
		{
			// End:0x3A9
			if(DriverXYDistance > float(24))
			{
				bDriverOutOfRange = false;
				Driver.Acceleration = Normal(DriverPos - Driver.Location) * float(300);
				Driver.Acceleration.Z = 0.0000000;				
			}
			else
			{
				bDriverOutOfRange = false;
				Driver.Acceleration.X = 0.0000000;
				Driver.Acceleration.Y = 0.0000000;
			}
		}
		// End:0x442
		if(Driver.bIsCrouched && (Driver.Location.Z + Driver.EyeHeight) < (Location.Z + float(16)))
		{
			Driver.ShouldCrouch(false);			
		}
		else
		{
			// End:0x4A0
			if(!Driver.bIsCrouched && (Driver.Location.Z + Driver.EyeHeight) > (Location.Z + float(16)))
			{
				Driver.ShouldCrouch(true);
			}
		}
		// End:0x4C5
		if(!Driver.bPhysicsAnimUpdate)
		{
			Driver.bPhysicsAnimUpdate = true;
		}
		// End:0x4F2
		if(IsLocallyControlled())
		{
			Driver.FaceRotation(Rotation + CameraRotation, dt);			
		}
		else
		{
			Driver.FaceRotation(Rotation + GunRotation, dt);
		}
	}
	//return;	
}

simulated function Vector EyePosition()
{
	// End:0x69
	if(IsLocallyControlled())
	{
		// End:0x2E
		if(AIController(Controller) != none)
		{
			return CameraElevation * vect(0.0000000, 0.0000000, 1.0000000);
		}
		return Class'BCoreProV55.BUtil'.static.AlignedOffset(Rotation + CameraDirection, CameraOffset) + (CameraElevation * vect(0.0000000, 0.0000000, 1.0000000));		
	}
	else
	{
		return Class'BCoreProV55.BUtil'.static.AlignedOffset(Rotation + GunRotation, CameraOffset) + (CameraElevation * vect(0.0000000, 0.0000000, 1.0000000));
	}
	//return;	
}

simulated function Vector RightHandlePosition()
{
	return GetBoneCoords(RightHandleBone).Origin;
	//return;	
}

simulated function Vector LeftHandlePosition()
{
	return GetBoneCoords(LeftHandleBone).Origin;
	//return;	
}

simulated function Vector DriverPosition()
{
	local Vector V;

	// End:0x6A
	if(IsLocallyControlled())
	{
		V = Vector(Rotation + CameraDirection) * -DriverBackOff;
		V.Z = 0.0000000;
		return (Location + V) + Class'BCoreProV55.BUtil'.static.AlignedOffset(Rotation + CameraDirection, DriverOffset);		
	}
	else
	{
		V = Vector(Rotation + GunRotation) * -DriverBackOff;
		V.Z = 0.0000000;
		return (Location + V) + Class'BCoreProV55.BUtil'.static.AlignedOffset(Rotation + GunRotation, DriverOffset);
	}
	//return;	
}

simulated function Rotator GetViewRotation()
{
	return Rotation + GunRotation;
	//return;	
}

simulated function Vector CalcDrawOffset(Inventory Inv)
{
	// End:0x4B
	if(Inv.DrawScale != DrawScale)
	{
		return vect(0.0000000, 0.0000000, 1.0000000) * ((CollisionHeight * (Inv.DrawScale / DrawScale)) - CollisionHeight);
	}
	return vect(0.0000000, 0.0000000, 0.0000000);
	//return;	
}

function bool NeedToTurn(Vector targ)
{
	return !(Normal(targ - (Location + (EyePosition()))) Dot Vector(Rotation + GunRotation)) > 0.9800000;
	//return;	
}

function UndeployTurret()
{
	local Weapon W;
	local Class<BallisticWeapon> WC;
	local BallisticTurretIntermediary BTI;

	// End:0x0B
	if(bNoUndeploy)
	{
		return;
	}
	OldDriver = Driver;
	// End:0x24
	if(!KDriverLeave(false))
	{
		return;
	}
	// End:0x228
	if(OldDriver != none)
	{
		WC = Class<BallisticWeapon>(DynamicLoadObject(UndeployedWeaponName, Class'Core.Class'));
		W = Weapon(OldDriver.FindInventoryType(WC));
		// End:0x8E
		if(W != none)
		{
			W.AddAmmo(MagAmmoAmount, 0);
			Destroy();
			return;
		}
		// End:0x13B
		if(int(Level.NetMode) == int(NM_Standalone))
		{
			W = Spawn(WC, OldDriver,,, rot(0, 0, 0));
			// End:0x138
			if(W != none)
			{
				// End:0x116
				if(BallisticWeapon(W) != none)
				{
					BallisticWeapon(W).GenerateLayout(LayoutIndex);
					BallisticWeapon(W).GenerateCamo(CamoIndex);
				}
				W.GiveTo(OldDriver);
				InitUndeployedWeapon(W);
				Destroy();
			}			
		}
		else
		{
			BTI = Spawn(Class'BCoreProV55.BallisticTurretIntermediary', OldDriver.Controller);
			BTI.myPawn = OldDriver;
			BTI.GunClass = WC;
			BTI.MagAmmo = MagAmmoAmount;
			BTI.LayoutIndex = LayoutIndex;
			BTI.CamoIndex = CamoIndex;
			BTI.TurretAmmoAmount = AmmoAmount[0];
			BTI.WeaponMode = int(WeaponMode);
			// End:0x225
			if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
			{
				GotoState('NetTrapped');				
			}
			else
			{
				Destroy();
			}
		}
	}
	//return;	
}

function PossessedBy(Controller C)
{
	super.PossessedBy(C);
	LastUsedTime = Level.TimeSeconds;
	CheckTurretLimit();
	NetUpdateTime = Level.TimeSeconds - float(1);
	bStasis = false;
	C.Pawn = self;
	AddDefaultInventory();
	// End:0xBA
	if(Weapon != none)
	{
		Weapon.NetUpdateTime = Level.TimeSeconds - float(1);
		Weapon.Instigator = self;
		PendingWeapon = none;
		InitTurretWeapon(Weapon);
		Weapon.BringUp();
	}
	//return;	
}

function UnPossessed()
{
	// End:0x4B
	if(Weapon != none)
	{
		Weapon.PawnUnpossessed();
		Weapon.ImmediateStopFire();
		Weapon.ServerStopFire(0);
		Weapon.ServerStopFire(1);
	}
	SaveTurretWeaponInfo();
	Level.Game.DiscardInventory(self);
	LastUsedTime = Level.TimeSeconds;
	NetUpdateTime = Level.TimeSeconds - float(1);
	super.UnPossessed();
	//return;	
}

function Actor GetBestEntry(Pawn P)
{
	// End:0x11
	if(MyUseTrigger != none)
	{
		return MyUseTrigger;
	}
	return self;
	//return;	
}

simulated event DrivingStatusChanged()
{
	super.DrivingStatusChanged();
	// End:0xC1
	if(bDriving)
	{
		OldDriver = Driver;
		// End:0x80
		if(IsLocallyControlled())
		{
			// End:0x5F
			if(Driver != none)
			{
				Driver.Controller = Controller;
				Driver.PlayerReplicationInfo = Controller.PlayerReplicationInfo;
			}
			// End:0x80
			if(Weapon != none)
			{
				PendingWeapon = none;
				Weapon.BringUp();
			}
		}
		// End:0xBE
		if(Driver != none)
		{
			Driver.bNoWeaponFiring = true;
			Driver.bPhysicsAnimUpdate = true;
			Driver.bIgnoreForces = false;
		}		
	}
	else
	{
		SetAbandoned();
		// End:0x179
		if(OldDriver != none)
		{
			OldDriver.bNoWeaponFiring = false;
			OldDriver.SetBoneDirection('lfarm', Rotation,, 0.0000000, 0);
			OldDriver.SetBoneDirection(OldDriver.GetOffhandBoneFor(none), Rotation,, 0.0000000, 0);
			OldDriver.SetBoneDirection('rfarm', Rotation,, 0.0000000, 0);
			OldDriver.SetBoneDirection(OldDriver.GetWeaponBoneFor(none), Rotation,, 0.0000000, 0);
		}
	}
	//return;	
}

simulated function ClientKDriverEnter(PlayerController PC)
{
	PC.bFreeCamera = true;
	// End:0x4D
	if(Driver != none)
	{
		Driver.Controller = PC;
		Driver.PlayerReplicationInfo = PC.PlayerReplicationInfo;
	}
	super.ClientKDriverEnter(PC);
	PC.Pawn = self;
	Controller = PC;
	SetOwner(PC);
	// End:0xA7
	if(PC != none)
	{
		// End:0xA7
		if(TurretFOV > float(0))
		{
			PC.DesiredFOV = TurretFOV;
		}
	}
	//return;	
}

simulated function ClientKDriverLeave(PlayerController PC)
{
	PC.bFreeCamera = false;
	// End:0x2D
	if(Driver != none)
	{
		Driver.bNoWeaponFiring = false;
	}
	// End:0x62
	if(PC != none)
	{
		// End:0x62
		if(TurretFOV > float(0))
		{
			PC.DesiredFOV = PC.DefaultFOV;
		}
	}
	// End:0x98
	if(BallisticWeapon(Weapon) != none)
	{
		// End:0x98
		if(BallisticWeapon(Weapon).bScopeView)
		{
			PC.EndZoom();
		}
	}
	super.ClientKDriverLeave(PC);
	//return;	
}

function KDriverEnter(Pawn P)
{
	local Controller C;

	bDriving = true;
	StuckCount = 0;
	// End:0x54
	if(!bRelativeExitPos)
	{
		PlayerEnterredRotation = P.Rotation;
		ExitPositions[0] = P.Location + vect(0.0000000, 0.0000000, 16.0000000);
	}
	C = P.Controller;
	// End:0xA1
	if(!bCanCarryFlag && C.PlayerReplicationInfo.HasFlag != none)
	{
		P.DropFlag();
	}
	Driver = P;
	Driver.StartDriving(self);
	Driver.ShouldCrouch(true);
	C.bVehicleTransition = true;
	C.UnPossess();
	Driver.SetOwner(self);
	C.Possess(self);
	C.bVehicleTransition = false;
	SetPhysics(default.Physics);
	DrivingStatusChanged();
	// End:0x169
	if(PlayerController(C) != none)
	{
		// End:0x15E
		if(TurretFOV > float(0))
		{
			PlayerController(C).DesiredFOV = TurretFOV;
		}
		VehicleLostTime = 0.0000000;
	}
	Driver.Controller = C;
	Driver.PlayerReplicationInfo = C.PlayerReplicationInfo;
	Driver.bNoWeaponFiring = true;
	Level.Game.DriverEnteredVehicle(self, P);
	//return;	
}

function bool PlaceExitingDriver()
{
	// End:0x0D
	if(Driver == none)
	{
		return false;
	}
	return true;
	//return;	
}

event bool KDriverLeave(bool bForceLeave)
{
	local Controller C;
	local PlayerController PC;
	local bool havePlaced;

	// End:0x32
	if(!bForceLeave && !Level.Game.CanLeaveVehicle(self, Driver))
	{
		return false;
	}
	// End:0x70
	if((PlayerReplicationInfo != none) && PlayerReplicationInfo.HasFlag != none)
	{
		Driver.HoldFlag(PlayerReplicationInfo.HasFlag);
	}
	// End:0x7D
	if(Controller == none)
	{
		return false;
	}
	MyUseTrigger.SetLocation(Location - ((Vector(Rotation + GunRotation) * vect(1.0000000, 1.0000000, 0.0000000)) * float(60)));
	// End:0x15F
	if((Driver != none) && !bRemoteControlled || bHideRemoteDriver)
	{
		Driver.bHardAttach = false;
		Driver.bCollideWorld = true;
		Driver.SetCollision(true, true);
		havePlaced = PlaceExitingDriver();
		// End:0x15F
		if(!havePlaced && !bForceLeave)
		{
			Driver.bHardAttach = true;
			Driver.bCollideWorld = false;
			Driver.SetCollision(false, false);
			return false;
		}
	}
	bDriving = false;
	C = Controller;
	// End:0x196
	if(C.RouteGoal == self)
	{
		C.RouteGoal = none;
	}
	// End:0x1BA
	if(C.MoveTarget == self)
	{
		C.MoveTarget = none;
	}
	C.bVehicleTransition = true;
	Controller.UnPossess();
	// End:0x25F
	if((Driver != none) && Driver.Health > 0)
	{
		Driver.SetOwner(C);
		C.Possess(Driver);
		PC = PlayerController(C);
		// End:0x24F
		if(PC != none)
		{
			PC.ClientSetViewTarget(Driver);
		}
		Driver.StopDriving(self);
	}
	C.bVehicleTransition = false;
	// End:0x286
	if(C == Controller)
	{
		Controller = none;
	}
	// End:0x2CA
	if(PlayerController(C) != none)
	{
		// End:0x2CA
		if(TurretFOV > float(0))
		{
			PlayerController(C).DesiredFOV = PlayerController(C).DefaultFOV;
		}
	}
	Driver.bNoWeaponFiring = false;
	// End:0x311
	if(BallisticWeapon(Weapon) != none)
	{
		// End:0x311
		if(BallisticWeapon(Weapon).bScopeView)
		{
			PC.EndZoom();
		}
	}
	Level.Game.DriverLeftVehicle(self, Driver);
	Driver = none;
	DriverLeft();
	Throttle = 0.0000000;
	Steering = 0.0000000;
	Rise = 0.0000000;
	AmbientSound = none;
	// End:0x37F
	if(Weapon != none)
	{
		Weapon.AmbientSound = none;
	}
	return true;
	//return;	
}

simulated function SetAbandoned()
{
	GunRotation.Pitch = AbandonedPitch;
	UpdateSimulatedGunRotation();
	//return;	
}

function bool TryToDrive(Pawn P)
{
	// End:0x8B
	if((((((bNonHumanControl || PlayerController(P.Controller) == none) || Driver != none) || P.DrivenVehicle != none) || !P.Controller.bIsPlayer) || P.IsA('Vehicle')) || Health <= 0)
	{
		return false;
	}
	// End:0xA6
	if(int(P.Physics) != int(1))
	{
		return false;
	}
	// End:0xF9
	if((MyUseTrigger.Location.Z - CollisionHeight) > ((P.Location.Z + P.EyePosition().Z) - float(MinTurretEyeDepth)))
	{
		return false;
	}
	// End:0x136
	if(MyUseTrigger.Location.Z < (P.Location.Z - P.CollisionHeight))
	{
		return false;
	}
	// End:0x1D6
	if(VSize((P.Location - MyUseTrigger.Location) * vect(1.0000000, 1.0000000, 0.0000000)) > float(40))
	{
		// End:0x1AA
		if(VSize((P.Location - MyUseTrigger.Location) * vect(1.0000000, 1.0000000, 0.0000000)) > float(120))
		{
			return false;
		}
		// End:0x1D6
		if((Vector(Rotation) Dot Normal(Location - P.Location)) < 0.2000000)
		{
			return false;
		}
	}
	// End:0x20C
	if((Vector(P.GetViewRotation()) Dot Normal(Location - P.Location)) < 0.5000000)
	{
		return false;
	}
	// End:0x231
	if(!Level.Game.CanEnterVehicle(self, P))
	{
		return false;
	}
	// End:0x2DD
	if(!bTeamLocked || P.GetTeamNum() == int(Team))
	{
		// End:0x275
		if(bEnterringUnlocks && bTeamLocked)
		{
			bTeamLocked = false;
		}
		PlayerController(P.Controller).DesiredFOV = PlayerController(P.Controller).DefaultFOV;
		PlayerController(P.Controller).bZooming = false;
		KDriverEnter(P);
		return true;		
	}
	else
	{
		VehicleLocked(P);
		return false;
	}
	//return;	
}

function DriverDied()
{
	SaveTurretWeaponInfo();
	super.DriverDied();
	//return;	
}

simulated function bool StopWeaponFiring()
{
	// End:0x0D
	if(Weapon == none)
	{
		return false;
	}
	// End:0xBA
	if(Weapon.IsFiring())
	{
		// End:0x96
		if(Controller != none)
		{
			// End:0x62
			if(!Controller.IsA('PlayerController'))
			{
				Weapon.ServerStopFire(byte(Weapon.BotMode));				
			}
			else
			{
				Controller.StopFiring();
				Weapon.ServerStopFire(0);
				Weapon.ServerStopFire(1);
			}			
		}
		else
		{
			Weapon.ServerStopFire(0);
			Weapon.ServerStopFire(1);
		}
		return true;
	}
	return false;
	//return;	
}

function float BotDesireability(Actor S, int TeamIndex, Actor Objective)
{
	// End:0x1C
	if((Health <= 0) || Occupied())
	{
		return 0.0000000;
	}
	// End:0x43
	if((Weapon != none) && !Weapon.HasAmmo())
	{
		return 0.0000000;
	}
	// End:0x72
	if(((MagAmmoAmount < 1) && AmmoAmount[0] < 1) && AmmoAmount[1] < 1)
	{
		return 0.0000000;
	}
	// End:0x81
	if(bKeyVehicle)
	{
		return 100.0000000;
	}
	return (MaxDesireability * 0.5000000) + ((MaxDesireability * 0.5000000) * (float(Health) / HealthMax));
	//return;	
}

simulated function bool PointOfView()
{
	// End:0x0D
	if(!bAllowViewChange)
	{
		return false;
	}
	// End:0x32
	if(PlayerController(Controller) != none)
	{
		return PlayerController(Controller).bBehindView;
	}
	return default.bDesiredBehindView;
	//return;	
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	Canvas.SetDrawColor(byte(255), 128, 0);
	Canvas.DrawText("GunRotation " $ string(GunRotation));
	Canvas.SetPos(4.0000000, YPos);
	super.DisplayDebug(Canvas, YL, YPos);
	//return;	
}

state NetTrapped
{
	function BeginState()
	{
		bAlwaysRelevant = true;
		bHidden = true;
		SetTimer(0.1500000, false);
		//return;		
	}

	event Timer()
	{
		Destroy();
		//return;		
	}
	stop;	
}

defaultproperties
{
	MinTurretEyeDepth=10
	GunYawBounds=(Min=-16384.0000000,Max=16384.0000000)
	GunPitchBounds=(Min=-8192.0000000,Max=11000.0000000)
	CamYawBounds=(Min=-20000.0000000,Max=20000.0000000)
	CamPitchBounds=(Min=-10000.0000000,Max=14000.0000000)
	YawSpeed=40.0000000
	PitchSpeed=40.0000000
	GunYawSpeed=12000.0000000
	GunPitchSpeed=8192.0000000
	CamTrackYawSpeed=10000.0000000
	CamTrackPitchSpeed=10000.0000000
	CamYawSpeed=32768.0000000
	CamPitchSpeed=32768.0000000
	AbandonedPitch=-5000
	TurretFOV=80.0000000
	CameraOffset=(X=-30.0000000,Y=0.0000000,Z=15.0000000)
	CameraElevation=15.0000000
	GunBone="Gun"
	PivotBone="Pivot"
	DriverOffset=(X=-40.0000000,Y=0.0000000,Z=0.0000000)
	DriverBackOff=20.0000000
	RightHandleBone="RightHandle"
	LeftHandleBone="LeftHandle"
	bRelativeExitPos=false
	bDefensive=true
	bRemoteControlled=true
	bDesiredBehindView=false
	DriveAnim="Idle_Rest"
	VehicleNameString="Ballistic Turret"
	MaxDesireability=2.0000000
	bIgnoreForces=true
	bServerMoveSetPawnRot=false
	bStationary=true
	bNoTeamBeacon=true
	BaseEyeHeight=10.0000000
	EyeHeight=10.0000000
	LandMovementState="PlayerTurreting"
	WaterMovementState="PlayerTurreting"
	bStasis=false
	bIgnoreEncroachers=true
	bReplicateInstigator=true
	bNetInitialRotation=true
	NetPriority=3.0000000
	bGameRelevant=true
	SoundRadius=100.0000000
	TransientSoundVolume=1.0000000
	TransientSoundRadius=5000.0000000
	CollisionRadius=24.0000000
	CollisionHeight=22.0000000
	bCollideWorld=false
	bBlockActors=false
	bBlockZeroExtentTraces=false
	bBlockNonZeroExtentTraces=false
	bRotateToDesired=false
}
