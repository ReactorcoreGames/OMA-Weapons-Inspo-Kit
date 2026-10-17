class ONSVehicle extends SVehicle
	abstract
	native
	nativereplication
	config(User);

struct native export DriverWeaponStruct
{
	var() Class<ONSWeapon> WeaponClass;
	var() name WeaponBone;
};

struct native export PassengerWeaponStruct
{
	var() Class<ONSWeaponPawn> WeaponPawnClass;
	var() name WeaponBone;
};

struct native export ImpactInfoStruct
{
	var Actor Other;
	var Vector pos;
	var Vector impactVel;
	var Vector impactNorm;
	var Vector ImpactAccel;
};

var(SVehicle) array<DriverWeaponStruct> DriverWeapons;
var array<ONSWeapon> Weapons;
var(SVehicle) array<PassengerWeaponStruct> PassengerWeapons;
var array<ONSWeaponPawn> WeaponPawns;
var byte ActiveWeapon;
var Rotator CustomAim;
var bool bHasAltFire;
var() Material RedSkin;
var() Material BlueSkin;
var() Sound IdleSound;
var() Sound StartUpSound;
var() Sound ShutDownSound;
var() string StartUpForce;
var() string ShutDownForce;
var() float ViewShakeRadius;
var() Rotator ViewShakeRotMag;
var() float ViewShakeRotFreq;
var() Vector ViewShakeOffsetMag;
var() float ViewShakeOffsetFreq;
var float ViewShakeLastCheck;
var() StaticMesh DestroyedVehicleMesh;
var() Class<Emitter> DestructionEffectClass;
var() Class<Emitter> DisintegrationEffectClass;
var() float DisintegrationHealth;
var() Range DestructionLinearMomentum;
var() Range DestructionAngularMomentum;
var() float TimeBetweenImpactExplosions;
var() array<Sound> ExplosionSounds;
var() float ExplosionSoundVolume;
var() float ExplosionSoundRadius;
var byte ExplosionCount;
var byte OldExplosionCount;
var float LastVelocitySize;
var float LastImpactExplosionTime;
var float LastCheckUpsideDownTime;
var float UpsideDownDamage;
var float ExplosionDamage;
var float ExplosionRadius;
var float ExplosionMomentum;
var Class<DamageType> ExplosionDamageType;
var Class<DamageType> DestroyedRoadKillDamageType;
var() Class<ONSDamagedEffect> DamagedEffectClass;
var() float DamagedEffectScale;
var() Vector DamagedEffectOffset;
var() float DamagedEffectHealthSmokeFactor;
var() float DamagedEffectHealthFireFactor;
var() float DamagedEffectAccScale;
var() float DamagedEffectFireDamagePerSec;
var float DamagedEffectAccruedDamage;
var ONSDamagedEffect DamagedEffect;
var bool bDestroyAppearance;
var bool bDisintegrateVehicle;
var bool bHadFire;
var() bool bEnableProximityViewShake;
var() bool bOnlyViewShakeIfDriven;
var bool bSoundsPrecached;
var bool bNeverReset;
var bool bEjectPassengersWhenFlipped;
var bool bDriverCannotLeaveVehicle;
var bool bCannotBeBased;
var() Vector FireImpulse;
var() Vector AltFireImpulse;
var bool bHasFireImpulse;
var bool bHasAltFireImpulse;
var bool bCustomAiming;
var const bool bIsAwake;
var const bool bHasBeenAwake;
var bool bAltFocalPoint;
var Vector AltFocalPoint;
var() Vector ShakeRotMag;
var() Vector ShakeRotRate;
var() float ShakeRotTime;
var() Vector ShakeOffsetMag;
var() Vector ShakeOffsetRate;
var() float ShakeOffsetTime;
var ImpactInfoStruct ImpactInfo;
var int ImpactTicksLeft;
var() float ImpactDamageTicks;
var() float ImpactDamageThreshold;
var() float ImpactDamageMult;
var() array<Sound> ImpactDamageSounds;
var() Class<ONSImpactSparks> SparkEffectClass;
var() editinline ONSImpactSparks SparkEffect;
var() float SparkAdvanceFactor;
var array<ONSHeadlightCorona> HeadlightCorona;
var() array<Vector> HeadlightCoronaOffset;
var() Material HeadlightCoronaMaterial;
var() float HeadlightCoronaMaxSize;
var ONSHeadlightProjector HeadlightProjector;
var() Material HeadlightProjectorMaterial;
var() Vector HeadlightProjectorOffset;
var() Rotator HeadlightProjectorRotation;
var() float HeadlightProjectorScale;
var string DebugInfo;
var Sound LockedOnSound;
var float ResetTime;
var float LastRunOverWarningTime;
var float MinRunOverWarningAim;
var Bot Reservation;
var int OldYaw;
var config Color CrossHairColor;
var config float CrosshairX;
var config float CrosshairY;
var config Texture CrosshairTexture;

replication
{
	// Pos:0x000
	reliable if((bNetOwner && bNetDirty) && int(Role) == int(ROLE_Authority))
		ActiveWeapon;

	// Pos:0x023
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		ExplosionCount, bDestroyAppearance, 
		bDisintegrateVehicle;

	// Pos:0x03B
	reliable if(int(Role) == int(ROLE_Authority))
		ClientRegisterVehicleWeapon;

	// Pos:0x048
	reliable if(int(Role) < int(ROLE_Authority))
		ServerChangeDriverPosition, ServerVerifyVehicleWeapon;
}

event NotifyEnemyLockedOn()
{
	local int i;

	super(Vehicle).NotifyEnemyLockedOn();
	// End:0x19
	if(LockedOnSound != none)
	{
		PlaySound(LockedOnSound);
	}
	i = 0;
	J0x20:

	// End:0x4F [Loop If]
	if(i < WeaponPawns.Length)
	{
		WeaponPawns[i].NotifyEnemyLockedOn();
		i++;
		// [Loop Continue]
		goto J0x20;
	}
	//return;	
}

event NotifyEnemyLostLock()
{
	local int i;

	super(Vehicle).NotifyEnemyLostLock();
	i = 0;
	J0x0D:

	// End:0x3C [Loop If]
	if(i < WeaponPawns.Length)
	{
		WeaponPawns[i].NotifyEnemyLostLock();
		i++;
		// [Loop Continue]
		goto J0x0D;
	}
	//return;	
}

function bool HasWeapon()
{
	return (int(ActiveWeapon) < Weapons.Length) && Weapons[int(ActiveWeapon)] != none;
	//return;	
}

function bool CanAttack(Actor Other)
{
	// End:0x44
	if((int(ActiveWeapon) < Weapons.Length) && Weapons[int(ActiveWeapon)] != none)
	{
		return Weapons[int(ActiveWeapon)].CanAttack(Other);
	}
	return false;
	//return;	
}

function Deploy()
{
	//return;	
}

function MayUndeploy()
{
	//return;	
}

function bool TooCloseToAttack(Actor Other)
{
	local int NeededPitch, i;
	local bool bControlledWeaponPawn;

	// End:0x25
	if(VSize(Location - Other.Location) > float(2500))
	{
		return false;
	}
	// End:0xB1
	if(!HasWeapon())
	{
		// End:0x3E
		if(WeaponPawns.Length == 0)
		{
			return false;
		}
		i = 0;
		J0x45:

		// End:0xA2 [Loop If]
		if(i < WeaponPawns.Length)
		{
			// End:0x98
			if(WeaponPawns[i].Controller != none)
			{
				bControlledWeaponPawn = true;
				// End:0x98
				if(!WeaponPawns[i].TooCloseToAttack(Other))
				{
					return false;
				}
			}
			i++;
			// [Loop Continue]
			goto J0x45;
		}
		// End:0xAF
		if(!bControlledWeaponPawn)
		{
			return false;
		}
		return true;
	}
	Weapons[int(ActiveWeapon)].CalcWeaponFire();
	NeededPitch = Rotator(Other.Location - Weapons[int(ActiveWeapon)].WeaponFireLocation).Pitch;
	NeededPitch = NeededPitch & 65535;
	return (LimitPitch(NeededPitch)) != NeededPitch;
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
		// End:0x78
		if((int(ActiveWeapon) < Weapons.Length) && Weapons[int(ActiveWeapon)] != none)
		{
			// End:0x6D
			if(int(Weapons[int(ActiveWeapon)].BestMode()) == 0)
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
	// End:0x7A
	if((int(ActiveWeapon) < Weapons.Length) && Weapons[int(ActiveWeapon)] != none)
	{
		// End:0x5C
		if(bWeaponisAltFiring && bHasAltFire)
		{
			return Weapons[int(ActiveWeapon)].AIInfo[1].RefireRate;			
		}
		else
		{
			return Weapons[int(ActiveWeapon)].AIInfo[0].RefireRate;
		}
	}
	return 0.0000000;
	//return;	
}

function bool IsFiring()
{
	return ((int(ActiveWeapon) < Weapons.Length) && Weapons[int(ActiveWeapon)] != none) && bWeaponisFiring || bWeaponisAltFiring && bHasAltFire;
	//return;	
}

function bool NeedToTurn(Vector targ)
{
	return !((int(ActiveWeapon) < Weapons.Length) && Weapons[int(ActiveWeapon)] != none) && Weapons[int(ActiveWeapon)].bCorrectAim;
	//return;	
}

function bool FireOnRelease()
{
	// End:0x7C
	if((int(ActiveWeapon) < Weapons.Length) && Weapons[int(ActiveWeapon)] != none)
	{
		// End:0x5D
		if(bWeaponisAltFiring && bHasAltFire)
		{
			return Weapons[int(ActiveWeapon)].AIInfo[1].bFireOnRelease;			
		}
		else
		{
			return Weapons[int(ActiveWeapon)].AIInfo[0].bFireOnRelease;
		}
	}
	return false;
	//return;	
}

function float ModifyThreat(float Current, Pawn Threat)
{
	// End:0x6C
	if(((Threat.bCanFly && int(ActiveWeapon) < Weapons.Length) && Weapons[int(ActiveWeapon)] != none) && !Weapons[int(ActiveWeapon)].AIInfo[0].bInstantHit)
	{
		return Current - float(3);
	}
	return Current;
	//return;	
}

function bool ChangedReservation(Pawn P)
{
	// End:0xCC
	if((Level.Game.JustStarted(20.0000000) && Reservation != none) && Reservation != P.Controller)
	{
		// End:0xB1
		if(((Reservation.RouteGoal == self) && Reservation.Pawn != none) && VSize(Reservation.Pawn.Location - Location) <= VSize(P.Location - Location))
		{
			return true;
		}
		Reservation = Bot(P.Controller);
		return false;
	}
	return false;
	//return;	
}

function float ReservationCostMultiplier()
{
	// End:0x27
	if((Reservation == none) || Reservation.Pawn == none)
	{
		return 1.0000000;
	}
	// End:0x63
	if((Reservation.MoveTarget == self) && Reservation.InLatentExecution(Reservation.503))
	{
		return 0.0000000;
	}
	return 0.2500000;
	//return;	
}

function float NewReservationCostMultiplier(Pawn P)
{
	// End:0x1E
	if(Reservation == P.Controller)
	{
		return 1.0000000;
	}
	// End:0xA5
	if(((Level.Game.JustStarted(20.0000000) && Reservation != none) && Reservation.Pawn != none) && VSize(Reservation.Pawn.Location - Location) <= VSize(P.Location - Location))
	{
		return 0.0000000;
	}
	return ReservationCostMultiplier();
	//return;	
}

function bool SpokenFor(Controller C)
{
	local Bot B;

	// End:0x0D
	if(Reservation == none)
	{
		return false;
	}
	// End:0x45
	if((Reservation.Pawn == none) || Vehicle(Reservation.Pawn) != none)
	{
		Reservation = none;
		return false;
	}
	// End:0x9C
	if(((Reservation.RouteGoal != self) && Reservation.MoveTarget != self) || !Reservation.InLatentExecution(Reservation.503))
	{
		Reservation = none;
		return false;
	}
	// End:0xB7
	if(!Reservation.SameTeamAs(C))
	{
		return false;
	}
	B = Bot(C);
	// End:0xD4
	if(B == none)
	{
		return true;
	}
	// End:0xFF
	if(WeaponPawns.Length > 0)
	{
		return B.Squad != Reservation.Squad;
	}
	// End:0x166
	if(Level.Game.JustStarted(20.0000000))
	{
		// End:0x166
		if(VSize(Reservation.Pawn.Location - Location) > VSize(C.Pawn.Location - Location))
		{
			return false;
		}
	}
	return true;
	//return;	
}

function SetReservation(Controller C)
{
	// End:0x20
	if(!SpokenFor(C))
	{
		Reservation = Bot(C);
	}
	//return;	
}

function Vehicle OpenPositionFor(Pawn P)
{
	local int i;

	// End:0xF8
	if(Level.Game.JustStarted(20.0000000))
	{
		// End:0xF8
		if(((((Reservation != none) && Reservation != P.Controller) && Reservation.RouteGoal == self) && Reservation.Pawn != none) && VSize(Reservation.Pawn.Location - Location) <= VSize(P.Location - Location))
		{
			i = 0;
			J0xB6:

			// End:0xF6 [Loop If]
			if(i < WeaponPawns.Length)
			{
				// End:0xEC
				if(WeaponPawns[i].Controller == none)
				{
					return WeaponPawns[i];
				}
				i++;
				// [Loop Continue]
				goto J0xB6;
			}
			return none;
		}
	}
	// End:0x105
	if(Controller == none)
	{
		return self;
	}
	// End:0x129
	if(!Controller.SameTeamAs(P.Controller))
	{
		return none;
	}
	i = 0;
	J0x130:

	// End:0x170 [Loop If]
	if(i < WeaponPawns.Length)
	{
		// End:0x166
		if(WeaponPawns[i].Controller == none)
		{
			return WeaponPawns[i];
		}
		i++;
		// [Loop Continue]
		goto J0x130;
	}
	return none;
	//return;	
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	local int i;

	super(Vehicle).DisplayDebug(Canvas, YL, YPos);
	Canvas.SetDrawColor(byte(255), 0, 0);
	Canvas.DrawText(DebugInfo);
	YPos += YL;
	i = 0;
	J0x50:

	// End:0x127 [Loop If]
	if(i < Weapons.Length)
	{
		YPos += YL;
		Canvas.SetPos(0.0000000, YPos);
		Canvas.SetDrawColor(0, 0, byte(255));
		Canvas.DrawText((("-- Weapon: " $ string(i)) $ " - ") $ string(Weapons[i]));
		YPos += YL;
		Canvas.SetPos(4.0000000, YPos);
		Weapons[i].DisplayDebug(Canvas, YL, YPos);
		i++;
		// [Loop Continue]
		goto J0x50;
	}
	YPos += YL;
	DebugInfo = "";
	//return;	
}

simulated function PostNetBeginPlay()
{
	local int i;

	super.PostNetBeginPlay();
	// End:0x1E1
	if(int(Role) == int(ROLE_Authority))
	{
		i = 0;
		J0x1D:

		// End:0xC7 [Loop If]
		if(i < DriverWeapons.Length)
		{
			Weapons[i] = Spawn(DriverWeapons[i].WeaponClass, self,, Location, rot(0, 0, 0));
			AttachToBone(Weapons[i], DriverWeapons[i].WeaponBone);
			// End:0xBD
			if(!Weapons[i].bAimable)
			{
				Weapons[i].CurrentAim = rot(0, 32768, 0);
			}
			i++;
			// [Loop Continue]
			goto J0x1D;
		}
		// End:0x126
		if((int(ActiveWeapon) < Weapons.Length) && Weapons[int(ActiveWeapon)] != none)
		{
			PitchUpLimit = Weapons[int(ActiveWeapon)].PitchUpLimit;
			PitchDownLimit = Weapons[int(ActiveWeapon)].PitchDownLimit;
		}
		i = 0;
		J0x12D:

		// End:0x1E1 [Loop If]
		if(i < PassengerWeapons.Length)
		{
			WeaponPawns[i] = Spawn(PassengerWeapons[i].WeaponPawnClass, self,, Location);
			WeaponPawns[i].AttachToVehicle(self, PassengerWeapons[i].WeaponBone);
			// End:0x1BD
			if(!WeaponPawns[i].bHasOwnHealth)
			{
				WeaponPawns[i].HealthMax = HealthMax;
			}
			WeaponPawns[i].ObjectiveGetOutDist = ObjectiveGetOutDist;
			i++;
			// [Loop Continue]
			goto J0x12D;
		}
	}
	// End:0x237
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && int(Level.DetailMode) > int(0)) && SparkEffectClass != none)
	{
		SparkEffect = Spawn(SparkEffectClass, self,, Location);
	}
	// End:0x46D
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && Level.bUseHeadlights) && !Level.bDropDetail || int(Level.DetailMode) == int(0))
	{
		HeadlightCorona.Length = HeadlightCoronaOffset.Length;
		i = 0;
		J0x2A9:

		// End:0x388 [Loop If]
		if(i < HeadlightCoronaOffset.Length)
		{
			HeadlightCorona[i] = Spawn(Class'Onslaught.ONSHeadlightCorona', self,, Location + (HeadlightCoronaOffset[i] >> Rotation));
			HeadlightCorona[i].SetBase(self);
			HeadlightCorona[i].SetRelativeRotation(rot(0, 0, 0));
			HeadlightCorona[i].Skins[0] = HeadlightCoronaMaterial;
			HeadlightCorona[i].ChangeTeamTint(Team);
			HeadlightCorona[i].MaxCoronaSize = HeadlightCoronaMaxSize * Level.HeadlightScaling;
			i++;
			// [Loop Continue]
			goto J0x2A9;
		}
		// End:0x46D
		if((HeadlightProjectorMaterial != none) && int(Level.DetailMode) >= int(2))
		{
			HeadlightProjector = Spawn(Class'Onslaught.ONSHeadlightProjector', self,, Location + (HeadlightProjectorOffset >> Rotation));
			HeadlightProjector.SetBase(self);
			HeadlightProjector.SetRelativeRotation(HeadlightProjectorRotation);
			HeadlightProjector.ProjTexture = HeadlightProjectorMaterial;
			HeadlightProjector.SetDrawScale(HeadlightProjectorScale);
			// End:0x452
			if(int(Level.DetailMode) == int(3))
			{
				HeadlightProjector.CullDistance = ShadowCullDistance * 5.0000000;				
			}
			else
			{
				HeadlightProjector.CullDistance = ShadowCullDistance * 2.0000000;
			}
		}
	}
	SetTeamNum(Team);
	TeamChanged();
	//return;	
}

simulated function ClientRegisterVehicleWeapon(ONSWeapon W, int Index)
{
	// End:0x19
	if(W == none)
	{
		ServerVerifyVehicleWeapon(Index);		
	}
	else
	{
		Weapons[Index] = W;
	}
	//return;	
}

function ServerVerifyVehicleWeapon(int Index)
{
	// End:0x46
	if(((Index >= 0) && Index < Weapons.Length) && Weapons[Index] != none)
	{
		ClientRegisterVehicleWeapon(Weapons[Index], Index);
	}
	//return;	
}

function Vehicle FindEntryVehicle(Pawn P)
{
	local int X;
	local float Dist, ClosestDist;
	local ONSWeaponPawn ClosestWeaponPawn;
	local Bot B;
	local Vehicle VehicleGoal;

	B = Bot(P.Controller);
	// End:0xD1
	if(B != none)
	{
		VehicleGoal = Vehicle(B.RouteGoal);
		// End:0x4A
		if(VehicleGoal == none)
		{
			return none;
		}
		// End:0x64
		if(VehicleGoal == self)
		{
			// End:0x62
			if(Driver == none)
			{
				return self;
			}
			return none;
		}
		X = 0;
		J0x6B:

		// End:0xCF [Loop If]
		if(X < WeaponPawns.Length)
		{
			// End:0xC5
			if(VehicleGoal == WeaponPawns[X])
			{
				// End:0xB6
				if(WeaponPawns[X].Driver == none)
				{
					return WeaponPawns[X];
				}
				// End:0xC3
				if(Driver == none)
				{
					return self;
				}
				return none;
			}
			X++;
			// [Loop Continue]
			goto J0x6B;
		}
		return none;
	}
	// End:0x1B7
	if(Driver == none)
	{
		Dist = VSize(P.Location - (Location + (EntryPosition >> Rotation)));
		// End:0x119
		if(Dist < EntryRadius)
		{
			return self;
		}
		X = 0;
		J0x120:

		// End:0x1B5 [Loop If]
		if(X < WeaponPawns.Length)
		{
			// End:0x1AB
			if(WeaponPawns[X] != none)
			{
				Dist = VSize(P.Location - (WeaponPawns[X].Location + (WeaponPawns[X].EntryPosition >> Rotation)));
				// End:0x1AB
				if(Dist < WeaponPawns[X].EntryRadius)
				{
					return self;
				}
			}
			X++;
			// [Loop Continue]
			goto J0x120;
		}
		return none;
	}
	ClosestDist = 100000.0000000;
	X = 0;
	J0x1C9:

	// End:0x289 [Loop If]
	if(X < WeaponPawns.Length)
	{
		// End:0x27F
		if(WeaponPawns[X] != none)
		{
			Dist = VSize(P.Location - (WeaponPawns[X].Location + (WeaponPawns[X].EntryPosition >> Rotation)));
			// End:0x27F
			if((Dist < WeaponPawns[X].EntryRadius) && Dist < ClosestDist)
			{
				ClosestDist = Dist;
				ClosestWeaponPawn = WeaponPawns[X];
			}
		}
		X++;
		// [Loop Continue]
		goto J0x1C9;
	}
	// End:0x34A
	if((ClosestWeaponPawn != none) || VSize(P.Location - (Location + (EntryPosition >> Rotation))) < EntryRadius)
	{
		// End:0x2F0
		if((ClosestWeaponPawn != none) && ClosestWeaponPawn.Driver == none)
		{
			return ClosestWeaponPawn;			
		}
		else
		{
			X = 0;
			J0x2F7:

			// End:0x34A [Loop If]
			if(X < WeaponPawns.Length)
			{
				// End:0x340
				if((WeaponPawns[X] != none) && WeaponPawns[X].Driver == none)
				{
					return WeaponPawns[X];
				}
				X++;
				// [Loop Continue]
				goto J0x2F7;
			}
		}
	}
	return none;
	//return;	
}

function bool TryToDrive(Pawn P)
{
	local int X;

	// End:0x0F
	if(FlipTimeLeft > float(0))
	{
		return false;
	}
	// End:0x35
	if(NeedsFlip())
	{
		Flip(Vector(P.Rotation), 1.0000000);
		return false;
	}
	// End:0xB8
	if(!bTeamLocked && P.GetTeamNum() != int(Team))
	{
		X = 0;
		J0x64:

		// End:0xB8 [Loop If]
		if(X < WeaponPawns.Length)
		{
			// End:0xAE
			if((WeaponPawns[X] != none) && WeaponPawns[X].Driver != none)
			{
				VehicleLocked(P);
				return false;
			}
			X++;
			// [Loop Continue]
			goto J0x64;
		}
	}
	return super(Vehicle).TryToDrive(P);
	//return;	
}

function KDriverEnter(Pawn P)
{
	local int X;

	ResetTime = Level.TimeSeconds - float(1);
	Instigator = self;
	super(Vehicle).KDriverEnter(P);
	// End:0x50
	if(Weapons.Length > 0)
	{
		Weapons[int(ActiveWeapon)].bActive = true;
	}
	// End:0x66
	if(IdleSound != none)
	{
		AmbientSound = IdleSound;
	}
	// End:0x80
	if(StartUpSound != none)
	{
		PlaySound(StartUpSound, 0, 1.0000000);
	}
	// End:0x111
	if((xPawn(Driver) != none) && Driver.HasUDamage())
	{
		X = 0;
		J0xAB:

		// End:0x111 [Loop If]
		if(X < Weapons.Length)
		{
			Weapons[X].SetOverlayMaterial(xPawn(Driver).UDamageWeaponMaterial, xPawn(Driver).UDamageTime - Level.TimeSeconds, false);
			X++;
			// [Loop Continue]
			goto J0xAB;
		}
	}
	Driver.bSetPCRotOnPossess = false;
	X = 0;
	J0x129:

	// End:0x19A [Loop If]
	if(X < Weapons.Length)
	{
		// End:0x160
		if(Weapons[X] == none)
		{
			Weapons.Remove(X, 1);
			X--;
			// [Explicit Continue]
			goto J0x190;
		}
		Weapons[X].NetUpdateFrequency = 20.0000000;
		ClientRegisterVehicleWeapon(Weapons[X], X);
		J0x190:

		X++;
		// [Loop Continue]
		goto J0x129;
	}
	//return;	
}

function bool KDriverLeave(bool bForceLeave)
{
	local Controller C;
	local int X;

	// End:0x47
	if(bDriverCannotLeaveVehicle)
	{
		// End:0x18
		if(FlipTimeLeft > float(0))
		{
			return false;
		}
		// End:0x45
		if(NeedsFlip())
		{
			Flip(Vector(Rotation + rot(0, 16384, 0)), 1.0000000);
			return false;
		}
		return false;
	}
	C = Controller;
	// End:0x1C6
	if(super(Vehicle).KDriverLeave(bForceLeave) || bForceLeave)
	{
		// End:0x160
		if((C != none) && C.Pawn != none)
		{
			// End:0x11B
			if((xPawn(C.Pawn) != none) && C.Pawn.HasUDamage())
			{
				X = 0;
				J0xCA:

				// End:0x11B [Loop If]
				if(X < Weapons.Length)
				{
					Weapons[X].SetOverlayMaterial(xPawn(C.Pawn).UDamageWeaponMaterial, 0.0000000, false);
					X++;
					// [Loop Continue]
					goto J0xCA;
				}
			}
			C.Pawn.bSetPCRotOnPossess = C.Pawn.default.bSetPCRotOnPossess;
			Instigator = C.Pawn;
		}
		X = 0;
		J0x167:

		// End:0x1C1 [Loop If]
		if(X < Weapons.Length)
		{
			Weapons[X].FlashCount = 0;
			Weapons[X].NetUpdateFrequency = Weapons[X].default.NetUpdateFrequency;
			X++;
			// [Loop Continue]
			goto J0x167;
		}
		return true;		
	}
	else
	{
		return false;
	}
	//return;	
}

function DriverDied()
{
	local int X;

	// End:0x73
	if((xPawn(Driver) != none) && Driver.HasUDamage())
	{
		X = 0;
		J0x2B:

		// End:0x73 [Loop If]
		if(X < Weapons.Length)
		{
			Weapons[X].SetOverlayMaterial(xPawn(Driver).UDamageWeaponMaterial, 0.0000000, false);
			X++;
			// [Loop Continue]
			goto J0x2B;
		}
	}
	super(Vehicle).DriverDied();
	// End:0x8A
	if(Health > 0)
	{
		DriverLeft();
	}
	//return;	
}

function SetActiveWeapon(int i)
{
	Weapons[int(ActiveWeapon)].bActive = false;
	ActiveWeapon = byte(i);
	Weapons[int(ActiveWeapon)].bActive = true;
	PitchUpLimit = Weapons[int(ActiveWeapon)].PitchUpLimit;
	PitchDownLimit = Weapons[int(ActiveWeapon)].PitchDownLimit;
	//return;	
}

event VehicleLocked(Pawn P)
{
	P.ReceiveLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 4);
	//return;	
}

function DriverLeft()
{
	// End:0x58
	if((int(ActiveWeapon) < Weapons.Length) && Weapons[int(ActiveWeapon)] != none)
	{
		Weapons[int(ActiveWeapon)].bActive = false;
		Weapons[int(ActiveWeapon)].AmbientSound = none;
	}
	// End:0x6A
	if(AmbientSound != none)
	{
		AmbientSound = none;
	}
	// End:0x84
	if(ShutDownSound != none)
	{
		PlaySound(ShutDownSound, 0, 1.0000000);
	}
	// End:0x11C
	if((!bNeverReset && ParentFactory != none) && (VSize(Location - ParentFactory.Location) > 5000.0000000) || !FastTrace(ParentFactory.Location, Location))
	{
		// End:0x102
		if(bKeyVehicle)
		{
			ResetTime = Level.TimeSeconds + float(15);			
		}
		else
		{
			ResetTime = Level.TimeSeconds + float(30);
		}
	}
	super(Vehicle).DriverLeft();
	//return;	
}

event CheckReset()
{
	local Pawn P;

	// End:0x27
	if(bKeyVehicle && IsVehicleEmpty())
	{
		Died(none, Class'Engine.DamageType', Location);
		return;
	}
	// End:0x4E
	if(!IsVehicleEmpty())
	{
		ResetTime = Level.TimeSeconds + float(10);
		return;
	}
	// End:0x10E
	foreach CollidingActors(Class'Engine.Pawn', P, 2500.0000000)
	{
		// End:0x10D
		if((((P.Controller != none) && P != self) && P.GetTeamNum() == (GetTeamNum())) && FastTrace(P.Location + (P.CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000)), Location + (CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000))))
		{
			ResetTime = Level.TimeSeconds + float(10);			
			return;
		}		
	}	
	// End:0x140
	if(ParentFactory != none)
	{
		ParentFactory.VehicleDestroyed(self);
		ParentFactory.Timer();
		ParentFactory = none;
	}
	Destroy();
	//return;	
}

simulated function int NumPassengers()
{
	local int i, Num;

	// End:0x12
	if(Driver != none)
	{
		Num = 1;
	}
	i = 0;
	J0x19:

	// End:0x54 [Loop If]
	if(i < WeaponPawns.Length)
	{
		// End:0x4A
		if(WeaponPawns[i].Driver != none)
		{
			Num++;
		}
		i++;
		// [Loop Continue]
		goto J0x19;
	}
	return Num;
	//return;	
}

function AIController GetBotPassenger()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x5A [Loop If]
	if(i < WeaponPawns.Length)
	{
		// End:0x50
		if(AIController(WeaponPawns[i].Controller) != none)
		{
			return AIController(WeaponPawns[i].Controller);
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return none;
	//return;	
}

function Pawn GetInstigator()
{
	local int i;

	// End:0x0D
	if(Controller != none)
	{
		return self;
	}
	i = 0;
	J0x14:

	// End:0x54 [Loop If]
	if(i < WeaponPawns.Length)
	{
		// End:0x4A
		if(WeaponPawns[i].Controller != none)
		{
			return WeaponPawns[i];
		}
		i++;
		// [Loop Continue]
		goto J0x14;
	}
	return self;
	//return;	
}

event bool IsVehicleEmpty()
{
	local int i;

	// End:0x0D
	if(Driver != none)
	{
		return false;
	}
	i = 0;
	J0x14:

	// End:0x5D [Loop If]
	if(i < WeaponPawns.Length)
	{
		// End:0x53
		if((WeaponPawns[i] != none) && WeaponPawns[i].Driver != none)
		{
			return false;
		}
		i++;
		// [Loop Continue]
		goto J0x14;
	}
	return true;
	//return;	
}

function bool HasOccupiedTurret()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x3D [Loop If]
	if(i < WeaponPawns.Length)
	{
		// End:0x33
		if(WeaponPawns[i].Driver != none)
		{
			return true;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return false;
	//return;	
}

simulated function ClientKDriverEnter(PlayerController PC)
{
	super(Vehicle).ClientKDriverEnter(PC);
	// End:0x31
	if(PC.bEnableGUIForceFeedback)
	{
		PC.ClientPlayForceFeedback(StartUpForce);
	}
	// End:0x4D
	if(!bDesiredBehindView)
	{
		PC.SetRotation(Rotation);
	}
	//return;	
}

simulated function ClientKDriverLeave(PlayerController PC)
{
	// End:0x73
	if((int(ActiveWeapon) < Weapons.Length) && Weapons[int(ActiveWeapon)] != none)
	{
		// End:0x4D
		if(bWeaponisFiring)
		{
			Weapons[int(ActiveWeapon)].ClientStopFire(PC, false);
		}
		// End:0x73
		if(bWeaponisAltFiring)
		{
			Weapons[int(ActiveWeapon)].ClientStopFire(PC, true);
		}
	}
	// End:0x99
	if(PC.bEnableGUIForceFeedback)
	{
		PC.StopForceFeedback(StartUpForce);
	}
	super(Vehicle).ClientKDriverLeave(PC);
	//return;	
}

function Died(Controller Killer, Class<DamageType> DamageType, Vector HitLocation)
{
	local int X;
	local PlayerController PC;
	local Controller C;

	// End:0x2A
	if((bDeleteMe || Level.bLevelChange) || bVehicleDestroyed)
	{
		return;
	}
	bVehicleDestroyed = true;
	// End:0x59
	if(int(Physics) != int(13))
	{
		super(Vehicle).Died(Killer, DamageType, HitLocation);
		return;
	}
	// End:0x94
	if(Level.Game.PreventDeath(self, Killer, DamageType, HitLocation))
	{
		Health = Max(Health, 1);
		return;
	}
	Health = Min(0, Health);
	// End:0x289
	if(Controller != none)
	{
		C = Controller;
		C.WasKilledBy(Killer);
		Level.Game.Killed(Killer, C, self, DamageType);
		// End:0x1BB
		if(C.bIsPlayer)
		{
			PC = PlayerController(C);
			// End:0x12F
			if(PC != none)
			{
				ClientKDriverLeave(PC);				
			}
			else
			{
				ClientClearController();
			}
			// End:0x1A8
			if(((bRemoteControlled || bEjectDriver) && Driver != none) && Driver.Health > 0)
			{
				C.UnPossess();
				C.Possess(Driver);
				// End:0x19E
				if(bEjectDriver)
				{
					EjectDriver();
				}
				Driver = none;				
			}
			else
			{
				C.PawnDied(self);
			}			
		}
		else
		{
			C.Destroy();
		}
		// End:0x27E
		if(Driver != none)
		{
			// End:0x265
			if(!bRemoteControlled && !bEjectDriver)
			{
				// End:0x220
				if(!bDrawDriverInTP && PlaceExitingDriver())
				{
					Driver.StopDriving(self);
					Driver.DrivenVehicle = self;
				}
				Driver.TearOffMomentum = Velocity * 0.2500000;
				Driver.Died(Controller, Class'Engine.DamRanOver', Driver.Location);				
			}
			else
			{
				// End:0x277
				if(bEjectDriver)
				{
					EjectDriver();					
				}
				else
				{
					KDriverLeave(false);
				}
			}
		}
		bDriving = false;		
	}
	else
	{
		Level.Game.Killed(Killer, Controller(Owner), self, DamageType);
	}
	// End:0x2F2
	if(Killer != none)
	{
		TriggerEvent(Event, self, Killer.Pawn);
		Instigator = Killer.Pawn;		
	}
	else
	{
		TriggerEvent(Event, self, none);
	}
	RanOverDamageType = DestroyedRoadKillDamageType;
	CrushedDamageType = DestroyedRoadKillDamageType;
	// End:0x332
	if(IsHumanControlled())
	{
		PlayerController(Controller).ForceDeathUpdate();
	}
	X = 0;
	J0x339:

	// End:0x3D3 [Loop If]
	if(X < WeaponPawns.Length)
	{
		// End:0x3C9
		if(WeaponPawns[X] != none)
		{
			// End:0x3A5
			if(bRemoteControlled || bEjectDriver)
			{
				// End:0x38F
				if(bEjectDriver)
				{
					WeaponPawns[X].EjectDriver();					
				}
				else
				{
					WeaponPawns[X].KDriverLeave(false);
				}
			}
			WeaponPawns[X].Died(Killer, DamageType, HitLocation);
		}
		X++;
		// [Loop Continue]
		goto J0x339;
	}
	WeaponPawns.Length = 0;
	// End:0x3FD
	if(ParentFactory != none)
	{
		ParentFactory.VehicleDestroyed(self);
		ParentFactory = none;
	}
	GotoState('VehicleDestroyed');
	//return;	
}

simulated function Destroyed()
{
	local int i;

	super.Destroyed();
	// End:0x9E
	if(int(Role) == int(ROLE_Authority))
	{
		i = 0;
		J0x1D:

		// End:0x5A [Loop If]
		if(i < Weapons.Length)
		{
			// End:0x50
			if(Weapons[i] != none)
			{
				Weapons[i].Destroy();
			}
			i++;
			// [Loop Continue]
			goto J0x1D;
		}
		i = 0;
		J0x61:

		// End:0x9E [Loop If]
		if(i < WeaponPawns.Length)
		{
			// End:0x94
			if(WeaponPawns[i] != none)
			{
				WeaponPawns[i].Destroy();
			}
			i++;
			// [Loop Continue]
			goto J0x61;
		}
	}
	Weapons.Length = 0;
	WeaponPawns.Length = 0;
	// End:0x14E
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		i = 0;
		J0xCE:

		// End:0xFA [Loop If]
		if(i < HeadlightCorona.Length)
		{
			HeadlightCorona[i].Destroy();
			i++;
			// [Loop Continue]
			goto J0xCE;
		}
		HeadlightCorona.Length = 0;
		// End:0x119
		if(HeadlightProjector != none)
		{
			HeadlightProjector.Destroy();
		}
		// End:0x137
		if(DamagedEffect != none)
		{
			DamagedEffect.Destroy();
			DamagedEffect = none;
		}
		// End:0x14E
		if(SparkEffect != none)
		{
			SparkEffect.Destroy();
		}
	}
	TriggerEvent(Event, self, none);
	//return;	
}

function VehicleCeaseFire(bool bWasAltFire)
{
	super(Vehicle).VehicleCeaseFire(bWasAltFire);
	// End:0x71
	if((int(ActiveWeapon) < Weapons.Length) && Weapons[int(ActiveWeapon)] != none)
	{
		Weapons[int(ActiveWeapon)].CeaseFire(Controller);
		Weapons[int(ActiveWeapon)].WeaponCeaseFire(Controller, bWasAltFire);
	}
	//return;	
}

simulated event TeamChanged()
{
	local int i;

	super(Vehicle).TeamChanged();
	// End:0x30
	if((int(Team) == 0) && RedSkin != none)
	{
		Skins[0] = RedSkin;		
	}
	else
	{
		// End:0x57
		if((int(Team) == 1) && BlueSkin != none)
		{
			Skins[0] = BlueSkin;
		}
	}
	// End:0xB7
	if((((int(Level.NetMode) != int(NM_DedicatedServer)) && int(Team) <= 2) && SpawnOverlay[0] != none) && SpawnOverlay[1] != none)
	{
		SetOverlayMaterial(SpawnOverlay[int(Team)], 1.5000000, true);
	}
	i = 0;
	J0xBE:

	// End:0xF2 [Loop If]
	if(i < Weapons.Length)
	{
		Weapons[i].SetTeam(Team);
		i++;
		// [Loop Continue]
		goto J0xBE;
	}
	// End:0x146
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		i = 0;
		J0x112:

		// End:0x146 [Loop If]
		if(i < HeadlightCorona.Length)
		{
			HeadlightCorona[i].ChangeTeamTint(Team);
			i++;
			// [Loop Continue]
			goto J0x112;
		}
	}
	//return;	
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x34
	if(((UpsideDownDamage == float(0)) && DamageType != Class'Onslaught.DamTypeONSVehicle') && NeedsFlip())
	{
		Damage = Health;
	}
	super(Vehicle).TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

function DriverRadiusDamage(float DamageAmount, float DamageRadius, Controller EventInstigator, Class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
	local int i;

	super(Vehicle).DriverRadiusDamage(DamageAmount, DamageRadius, EventInstigator, DamageType, Momentum, HitLocation);
	i = 0;
	J0x2B:

	// End:0xA5 [Loop If]
	if(i < WeaponPawns.Length)
	{
		// End:0x9B
		if((WeaponPawns[i] != none) && !WeaponPawns[i].bCollideActors)
		{
			WeaponPawns[i].DriverRadiusDamage(DamageAmount, DamageRadius, EventInstigator, DamageType, Momentum, HitLocation);
		}
		i++;
		// [Loop Continue]
		goto J0x2B;
	}
	//return;	
}

function Fire(optional float F)
{
	super(Vehicle).Fire(F);
	// End:0x4C
	if((int(ActiveWeapon) < Weapons.Length) && PlayerController(Controller) != none)
	{
		Weapons[int(ActiveWeapon)].ClientStartFire(Controller, false);
	}
	//return;	
}

function AltFire(optional float F)
{
	super(Vehicle).AltFire(F);
	// End:0x6E
	if(((!bWeaponisFiring && int(ActiveWeapon) < Weapons.Length) && Weapons[int(ActiveWeapon)] != none) && PlayerController(Controller) != none)
	{
		Weapons[int(ActiveWeapon)].ClientStartFire(Controller, true);
	}
	//return;	
}

function ClientVehicleCeaseFire(bool bWasAltFire)
{
	super(Vehicle).ClientVehicleCeaseFire(bWasAltFire);
	// End:0x88
	if((int(ActiveWeapon) < Weapons.Length) && Weapons[int(ActiveWeapon)] != none)
	{
		Weapons[int(ActiveWeapon)].ClientStopFire(Controller, bWasAltFire);
		// End:0x88
		if(!bWasAltFire && bWeaponisAltFiring)
		{
			Weapons[int(ActiveWeapon)].ClientStartFire(Controller, true);
		}
	}
	//return;	
}

event TakeImpactDamage(float AccelMag)
{
	local int Damage;

	Damage = int(AccelMag * (ImpactDamageModifier()));
	TakeDamage(Damage, self, ImpactInfo.pos, vect(0.0000000, 0.0000000, 0.0000000), Class'Onslaught.DamTypeONSVehicle');
	// End:0x6A
	if(ImpactDamageSounds.Length > 0)
	{
		PlaySound(ImpactDamageSounds[Rand(ImpactDamageSounds.Length - 1)],, TransientSoundVolume * 2.5000000);
	}
	// End:0xC1
	if((Health < 0) && (Level.TimeSeconds - LastImpactExplosionTime) > TimeBetweenImpactExplosions)
	{
		VehicleExplosion(Normal(ImpactInfo.impactNorm), 0.5000000);
		LastImpactExplosionTime = Level.TimeSeconds;
	}
	// End:0x11D
	if(((Controller != none) && KarmaBoostDest(Controller.MoveTarget) != none) && Controller.InLatentExecution(Controller.503))
	{
		Controller.MoveTimer = -1.0000000;
	}
	//return;	
}

function float ImpactDamageModifier()
{
	return ImpactDamageMult;
	//return;	
}

event KImpact(Actor Other, Vector pos, Vector impactVel, Vector impactNorm)
{
	// End:0x76
	if(int(Role) == int(ROLE_Authority))
	{
		ImpactInfo.Other = Other;
		ImpactInfo.pos = pos;
		ImpactInfo.impactVel = impactVel;
		ImpactInfo.impactNorm = impactNorm;
		ImpactInfo.ImpactAccel = KParams.KAcceleration;
		ImpactTicksLeft = int(ImpactDamageTicks);
	}
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x3F
	if((int(ActiveWeapon) < Weapons.Length) && Weapons[int(ActiveWeapon)] != none)
	{
		return Weapons[int(ActiveWeapon)].ChargeBar();
	}
	return 0.0000000;
	//return;	
}

function bool FastVehicle()
{
	return false;
	//return;	
}

function bool IsDeployed()
{
	return false;
	//return;	
}

function SetTeamNum(byte t)
{
	local byte Temp;
	local int X;

	Temp = Team;
	PrevTeam = t;
	Team = t;
	// End:0x3A
	if(int(Temp) != int(t))
	{
		TeamChanged();
	}
	X = 0;
	J0x41:

	// End:0x86 [Loop If]
	if(X < WeaponPawns.Length)
	{
		// End:0x7C
		if(WeaponPawns[X] != none)
		{
			WeaponPawns[X].SetTeamNum(t);
		}
		X++;
		// [Loop Continue]
		goto J0x41;
	}
	//return;	
}

simulated function SwitchWeapon(byte F)
{
	ServerChangeDriverPosition(F);
	//return;	
}

function ServerChangeDriverPosition(byte F)
{
	local Pawn OldDriver, Bot;

	// End:0x0D
	if(Driver == none)
	{
		return;
	}
	F -= byte(2);
	// End:0x168
	if(((int(F) < WeaponPawns.Length) && WeaponPawns[int(F)] != none) && (WeaponPawns[int(F)].Driver == none) || AIController(WeaponPawns[int(F)].Controller) != none)
	{
		OldDriver = Driver;
		// End:0xE0
		if(AIController(WeaponPawns[int(F)].Controller) != none)
		{
			Bot = WeaponPawns[int(F)].Driver;
			WeaponPawns[int(F)].KDriverLeave(true);
		}
		KDriverLeave(true);
		// End:0x152
		if((WeaponPawns[int(F)] != none) && !WeaponPawns[int(F)].TryToDrive(OldDriver))
		{
			KDriverEnter(OldDriver);
			// End:0x14F
			if(Bot != none)
			{
				WeaponPawns[int(F)].KDriverEnter(Bot);
			}			
		}
		else
		{
			// End:0x168
			if(Bot != none)
			{
				TryToDrive(Bot);
			}
		}
	}
	//return;	
}

function bool HasUDamage()
{
	return (Driver != none) && Driver.HasUDamage();
	//return;	
}

event ApplyFireImpulse(bool bAlt)
{
	// End:0x48
	if(!bAlt)
	{
		KAddImpulse(FireImpulse >> Weapons[int(ActiveWeapon)].WeaponFireRotation, Weapons[int(ActiveWeapon)].WeaponFireLocation);		
	}
	else
	{
		KAddImpulse(AltFireImpulse >> Weapons[int(ActiveWeapon)].WeaponFireRotation, Weapons[int(ActiveWeapon)].WeaponFireLocation);
	}
	//return;	
}

simulated event DestroyAppearance()
{
	local int i;
	local KarmaParams KP;

	bDestroyAppearance = true;
	Throttle = 0.0000000;
	Steering = 0.0000000;
	Rise = 0.0000000;
	// End:0xB0
	if(int(Role) == int(ROLE_Authority))
	{
		i = 0;
		J0x40:

		// End:0x7D [Loop If]
		if(i < Weapons.Length)
		{
			// End:0x73
			if(Weapons[i] != none)
			{
				Weapons[i].Destroy();
			}
			i++;
			// [Loop Continue]
			goto J0x40;
		}
		i = 0;
		J0x84:

		// End:0xB0 [Loop If]
		if(i < WeaponPawns.Length)
		{
			WeaponPawns[i].Destroy();
			i++;
			// [Loop Continue]
			goto J0x84;
		}
	}
	Weapons.Length = 0;
	WeaponPawns.Length = 0;
	// End:0x133
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		bNoTeamBeacon = true;
		i = 0;
		J0xE8:

		// End:0x114 [Loop If]
		if(i < HeadlightCorona.Length)
		{
			HeadlightCorona[i].Destroy();
			i++;
			// [Loop Continue]
			goto J0xE8;
		}
		HeadlightCorona.Length = 0;
		// End:0x133
		if(HeadlightProjector != none)
		{
			HeadlightProjector.Destroy();
		}
	}
	KP = KarmaParams(KParams);
	// End:0x162
	if(KP != none)
	{
		KP.KStartLinVel = Velocity;
	}
	SetPhysics(0);
	KSetBlockKarma(false);
	SetDrawType(8);
	SetStaticMesh(DestroyedVehicleMesh);
	KSetBlockKarma(true);
	SetPhysics(13);
	Skins.Length = 0;
	NetPriority = 2.0000000;
	//return;	
}

function VehicleExplosion(Vector MomentumNormal, float PercentMomentum)
{
	local Vector LinearImpulse, AngularImpulse;

	HurtRadius(ExplosionDamage, ExplosionRadius, ExplosionDamageType, ExplosionMomentum, Location);
	// End:0xE6
	if(!bDisintegrateVehicle)
	{
		ExplosionCount++;
		// End:0x51
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			ClientVehicleExplosion(false);
		}
		LinearImpulse = (PercentMomentum * RandRange(DestructionLinearMomentum.Min, DestructionLinearMomentum.Max)) * MomentumNormal;
		AngularImpulse = (PercentMomentum * RandRange(DestructionAngularMomentum.Min, DestructionAngularMomentum.Max)) * VRand();
		NetUpdateTime = Level.TimeSeconds - float(1);
		KAddImpulse(LinearImpulse, vect(0.0000000, 0.0000000, 0.0000000));
		KAddAngularImpulse(AngularImpulse);
	}
	//return;	
}

simulated event ClientVehicleExplosion(bool bFinal)
{
	local Actor DestructionEffect;
	local int SoundNum;
	local PlayerController PC;
	local float Dist, Scale;

	// End:0x103
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		PC = Level.GetLocalPlayerController();
		// End:0x103
		if((PC != none) && PC.ViewTarget != none)
		{
			Dist = VSize(Location - PC.ViewTarget.Location);
			// End:0x103
			if(Dist < (ExplosionRadius * 2.5000000))
			{
				// End:0xA8
				if(Dist < ExplosionRadius)
				{
					Scale = 1.0000000;					
				}
				else
				{
					Scale = ((ExplosionRadius * 2.5000000) - Dist) / ExplosionRadius;
				}
				PC.ShakeView(ShakeRotMag * Scale, ShakeRotRate, ShakeRotTime, ShakeOffsetMag * Scale, ShakeOffsetRate, ShakeOffsetTime);
			}
		}
	}
	// End:0x13F
	if(ExplosionSounds.Length > 0)
	{
		SoundNum = Rand(ExplosionSounds.Length);
		PlaySound(ExplosionSounds[SoundNum], 0, ExplosionSoundVolume * TransientSoundVolume,, ExplosionSoundRadius);
	}
	// End:0x18D
	if(bFinal)
	{
		// End:0x17B
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			DestructionEffect = Spawn(DisintegrationEffectClass,,, Location, Rotation);
		}
		bHidden = true;
		GotoState('VehicleDisintegrated');		
	}
	else
	{
		// End:0x1C2
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			DestructionEffect = Spawn(DestructionEffectClass, self);
			DestructionEffect.SetBase(self);
		}
	}
	//return;	
}

simulated event SVehicleUpdateParams()
{
	local int i;

	super.SVehicleUpdateParams();
	// End:0x1B2
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		i = 0;
		J0x26:

		// End:0xD8 [Loop If]
		if(i < HeadlightCorona.Length)
		{
			HeadlightCorona[i].SetBase(none);
			HeadlightCorona[i].SetLocation(Location + (HeadlightCoronaOffset[i] >> Rotation));
			HeadlightCorona[i].SetBase(self);
			HeadlightCorona[i].Skins[0] = HeadlightCoronaMaterial;
			HeadlightCorona[i].MaxCoronaSize = HeadlightCoronaMaxSize * Level.HeadlightScaling;
			i++;
			// [Loop Continue]
			goto J0x26;
		}
		// End:0x159
		if(HeadlightProjector != none)
		{
			HeadlightProjector.SetBase(none);
			HeadlightProjector.SetLocation(Location + (HeadlightProjectorOffset >> Rotation));
			HeadlightProjector.SetBase(self);
			HeadlightProjector.SetRelativeRotation(HeadlightProjectorRotation);
			HeadlightProjector.ProjTexture = HeadlightProjectorMaterial;
			HeadlightProjector.SetDrawScale(HeadlightProjectorScale);
		}
		// End:0x1B2
		if(DamagedEffect != none)
		{
			DamagedEffect.SetBase(none);
			DamagedEffect.SetLocation(Location + (DamagedEffectOffset >> Rotation));
			DamagedEffect.SetBase(self);
			DamagedEffect.SetEffectScale(DamagedEffectScale);
		}
	}
	//return;	
}

simulated function int LimitPitch(int Pitch)
{
	// End:0x33
	if((int(ActiveWeapon) >= Weapons.Length) || Weapons[int(ActiveWeapon)] == none)
	{
		return super(Pawn).LimitPitch(Pitch);
	}
	return Weapons[int(ActiveWeapon)].LimitPitch(Pitch, Rotation);
	//return;	
}

function ServerPlayHorn(int HornIndex)
{
	local int i, NumPositions;
	local Pawn P;

	super(Vehicle).ServerPlayHorn(HornIndex);
	// End:0x2A
	if((HornIndex > 0) || PlayerController(Controller) == none)
	{
		return;
	}
	i = 0;
	J0x31:

	// End:0x6F [Loop If]
	if(i < WeaponPawns.Length)
	{
		// End:0x65
		if(WeaponPawns[i].Driver == none)
		{
			NumPositions++;
			// [Explicit Break]
			goto J0x6F;
		}
		i++;
		// [Loop Continue]
		goto J0x31;
	}
	J0x6F:

	// End:0xF8
	if(NumPositions > 0)
	{
		// End:0xF7
		foreach VisibleCollidingActors(Class'Engine.Pawn', P, TransientSoundRadius)
		{
			// End:0xF6
			if((Bot(P.Controller) != none) && Vehicle(P) == none)
			{
				Bot(P.Controller).SetTemporaryOrders('Follow', Controller);
				NumPositions--;
				// End:0xF6
				if(NumPositions == 0)
				{
					// End:0xF7
					break;
				}
			}			
		}		
	}
	//return;	
}

simulated function DrawHUD(Canvas Canvas)
{
	local PlayerController PC;
	local Vector CameraLocation;
	local Rotator CameraRotation;
	local Actor ViewActor;

	// End:0x14F
	if(((((IsLocallyControlled()) && int(ActiveWeapon) < Weapons.Length) && Weapons[int(ActiveWeapon)] != none) && Weapons[int(ActiveWeapon)].bShowAimCrosshair) && Weapons[int(ActiveWeapon)].bCorrectAim)
	{
		Canvas.DrawColor = CrossHairColor;
		Canvas.DrawColor.A = byte(255);
		Canvas.Style = 5;
		Canvas.SetPos((float(Canvas.SizeX) * 0.5000000) - CrosshairX, (float(Canvas.SizeY) * 0.5000000) - CrosshairY);
		Canvas.DrawTile(CrosshairTexture, (CrosshairX * 2.0000000) + float(1), (CrosshairY * 2.0000000) + float(1), 0.0000000, 0.0000000, float(CrosshairTexture.USize), float(CrosshairTexture.VSize));
	}
	PC = PlayerController(Controller);
	// End:0x247
	if(((PC != none) && !PC.bBehindView) && HudOverlay != none)
	{
		// End:0x244
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

function PlayHit(float Damage, Pawn instigatedBy, Vector HitLocation, Class<DamageType> DamageType, Vector Momentum)
{
	local int i;

	super(Pawn).PlayHit(Damage, instigatedBy, HitLocation, DamageType, Momentum);
	i = 0;
	J0x26:

	// End:0xC2 [Loop If]
	if(i < WeaponPawns.Length)
	{
		// End:0xB8
		if(((WeaponPawns[i] != none) && !WeaponPawns[i].bHasOwnHealth) && WeaponPawns[i].Controller != none)
		{
			WeaponPawns[i].Controller.NotifyTakeHit(instigatedBy, HitLocation, int(Damage), DamageType, Momentum);
		}
		i++;
		// [Loop Continue]
		goto J0x26;
	}
	//return;	
}

function array<Vehicle> GetTurrets()
{
	return WeaponPawns;
	//return;	
}

simulated function PrecacheAnnouncer(AnnouncerVoice V, bool bRewardSounds)
{
	// End:0xE6
	if(bRewardSounds && !bSoundsPrecached)
	{
		V.PrecacheSound('Pancake');
		V.PrecacheSound('Road_Kill');
		V.PrecacheSound('Vehicular_manslaughter');
		V.PrecacheSound('Hit_and_run');
		V.PrecacheSound('Car_jacked');
		V.PrecacheSound('Hijacked');
		V.PrecacheSound('RoadRampage');
		V.PrecacheSound('EagleEye');
		V.PrecacheSound('Top_Gun');
		V.PrecacheSound('DareDevil');
		bSoundsPrecached = true;
	}
	//return;	
}

static function StaticPrecache(LevelInfo L)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x40 [Loop If]
	if(i < default.DriverWeapons.Length)
	{
		default.DriverWeapons[i].WeaponClass.static.StaticPrecache(L);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0x47:

	// End:0x80 [Loop If]
	if(i < default.PassengerWeapons.Length)
	{
		default.PassengerWeapons[i].WeaponPawnClass.static.StaticPrecache(L);
		i++;
		// [Loop Continue]
		goto J0x47;
	}
	// End:0x9F
	if(default.DestroyedVehicleMesh != none)
	{
		L.AddPrecacheStaticMesh(default.DestroyedVehicleMesh);
	}
	// End:0xBE
	if(default.HeadlightCoronaMaterial != none)
	{
		L.AddPrecacheMaterial(default.HeadlightCoronaMaterial);
	}
	// End:0xDD
	if(default.HeadlightProjectorMaterial != none)
	{
		L.AddPrecacheMaterial(default.HeadlightProjectorMaterial);
	}
	L.AddPrecacheMaterial(default.VehicleIcon.Material);
	L.AddPrecacheMaterial(Texture'EmitterTextures.MultiFrame.LargeFlames');
	L.AddPrecacheMaterial(Texture'EmitterTextures.MultiFrame.fire3');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.DustSmoke');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	super(Actor).UpdatePrecacheStaticMeshes();
	// End:0x25
	if(DestroyedVehicleMesh != none)
	{
		Level.AddPrecacheStaticMesh(DestroyedVehicleMesh);
	}
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	// End:0x1F
	if(HeadlightCoronaMaterial != none)
	{
		Level.AddPrecacheMaterial(HeadlightCoronaMaterial);
	}
	// End:0x3E
	if(HeadlightProjectorMaterial != none)
	{
		Level.AddPrecacheMaterial(HeadlightProjectorMaterial);
	}
	Level.AddPrecacheMaterial(Texture'EmitterTextures.MultiFrame.LargeFlames');
	Level.AddPrecacheMaterial(Texture'EmitterTextures.MultiFrame.fire3');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.DustSmoke');
	Level.AddPrecacheMaterial(VehicleIcon.Material);
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

function bool HealDamage(int Amount, Controller Healer, Class<DamageType> DamageType)
{
	// End:0x3A
	if((ResetTime - Level.TimeSeconds) < 10.0000000)
	{
		ResetTime = Level.TimeSeconds + 10.0000000;
	}
	return super(Vehicle).HealDamage(Amount, Healer, DamageType);
	//return;	
}

state VehicleDestroyed
{
	function CallDestroy()
	{
		Destroy();
		//return;		
	}

	function Died(Controller Killer, Class<DamageType> DamageType, Vector HitLocation)
	{
		//return;		
	}
Begin:

	DestroyAppearance();
	VehicleExplosion(vect(0.0000000, 0.0000000, 1.0000000), 1.0000000);
	Sleep(9.0000000);
	CallDestroy();
	stop;				
}

state VehicleDisintegrated
{
	function CallDestroy()
	{
		Destroy();
		//return;		
	}

	function Died(Controller Killer, Class<DamageType> DamageType, Vector HitLocation)
	{
		//return;		
	}
Begin:

	Sleep(0.2500000);
	CallDestroy();
	stop;		
}

defaultproperties
{
	bHasAltFire=true
	ViewShakeRadius=100.0000000
	DisintegrationHealth=-50.0000000
	DestructionAngularMomentum=(Min=50.0000000,Max=50.0000000)
	TimeBetweenImpactExplosions=0.1000000
	ExplosionSounds[0]=Sound'ONSVehicleSounds-S.Explosions.VehicleExplosion01'
	ExplosionSounds[1]=Sound'ONSVehicleSounds-S.Explosions.VehicleExplosion02'
	ExplosionSounds[2]=Sound'ONSVehicleSounds-S.Explosions.VehicleExplosion03'
	ExplosionSounds[3]=Sound'ONSVehicleSounds-S.Explosions.VehicleExplosion04'
	ExplosionSounds[4]=Sound'ONSVehicleSounds-S.Explosions.VehicleExplosion05'
	ExplosionSoundVolume=5.0000000
	ExplosionSoundRadius=200.0000000
	ExplosionDamage=100.0000000
	ExplosionRadius=300.0000000
	ExplosionMomentum=60000.0000000
	ExplosionDamageType=Class'Onslaught.DamTypeONSVehicleExplosion'
	DestroyedRoadKillDamageType=Class'Onslaught.DamTypeDestroyedVehicleRoadKill'
	DamagedEffectClass=Class'Onslaught.ONSDamagedEffect'
	DamagedEffectScale=1.0000000
	DamagedEffectHealthSmokeFactor=0.5000000
	DamagedEffectHealthFireFactor=0.2500000
	DamagedEffectAccScale=0.2500000
	DamagedEffectFireDamagePerSec=0.7500000
	bOnlyViewShakeIfDriven=true
	bEjectPassengersWhenFlipped=true
	ShakeRotMag=(X=0.0000000,Y=0.0000000,Z=250.0000000)
	ShakeRotRate=(X=0.0000000,Y=0.0000000,Z=2500.0000000)
	ShakeRotTime=6.0000000
	ShakeOffsetMag=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	ShakeOffsetRate=(X=0.0000000,Y=0.0000000,Z=200.0000000)
	ShakeOffsetTime=10.0000000
	ImpactDamageTicks=10.0000000
	ImpactDamageThreshold=5000.0000000
	ImpactDamageMult=0.0003000
	ImpactDamageSounds[0]=Sound'ONSVehicleSounds-S.CollisionSounds.VehicleCollision01'
	ImpactDamageSounds[1]=Sound'ONSVehicleSounds-S.CollisionSounds.VehicleCollision02'
	ImpactDamageSounds[2]=Sound'ONSVehicleSounds-S.CollisionSounds.VehicleCollision03'
	ImpactDamageSounds[3]=Sound'ONSVehicleSounds-S.CollisionSounds.VehicleCollision04'
	ImpactDamageSounds[4]=Sound'ONSVehicleSounds-S.CollisionSounds.VehicleCollision05'
	ImpactDamageSounds[5]=Sound'ONSVehicleSounds-S.CollisionSounds.VehicleCollision06'
	ImpactDamageSounds[6]=Sound'ONSVehicleSounds-S.CollisionSounds.VehicleCollision07'
	SparkEffectClass=Class'Onslaught.ONSImpactSparks'
	SparkAdvanceFactor=1.5000000
	LockedOnSound=Sound'WeaponSounds.BaseGunTech.BSeekLost1'
	MinRunOverWarningAim=0.8800000
	CrossHairColor=(R=0,G=255,B=0,A=255)
	CrosshairX=32.0000000
	CrosshairY=32.0000000
	CrosshairTexture=Texture'ONSInterface-TX.tankBarrelAligned'
	bZeroPCRotOnEntry=false
	bTeamLocked=true
	bEnterringUnlocks=true
	Team=0
	TeamBeaconTexture=Texture'ONSInterface-TX.HealthBar'
	NoEntryTexture=Texture'HudContent.Generic.NoEntry'
	TeamBeaconBorderMaterial=Texture'InterfaceContent.Menu.BorderBoxD'
	RanOverDamageType=Class'Onslaught.DamTypeRoadkill'
	CrushedDamageType=Class'Onslaught.DamTypePancake'
	RanOverSound=Sound'ONSVehicleSounds-S.CollisionSounds.BodyHitbyVeh01'
	StolenAnnouncement="Hijacked"
	StolenSound=Sound'ONSVehicleSounds-S.CarAlarm.CarAlarm01'
	BulletSounds[0]=Sound'WeaponSounds.BaseShieldReflections.BBulletReflect1'
	BulletSounds[1]=Sound'WeaponSounds.BaseShieldReflections.BBulletReflect2'
	BulletSounds[2]=Sound'WeaponSounds.BaseShieldReflections.BBulletReflect3'
	BulletSounds[3]=Sound'WeaponSounds.BaseShieldReflections.BBulletReflect4'
	BulletSounds[4]=Sound'WeaponSounds.BaseImpactAndExplosions.BBulletImpact1'
	BulletSounds[5]=Sound'WeaponSounds.BaseImpactAndExplosions.BBulletImpact2'
	BulletSounds[6]=Sound'WeaponSounds.BaseImpactAndExplosions.BBulletImpact3'
	BulletSounds[7]=Sound'WeaponSounds.BaseImpactAndExplosions.BBulletImpact4'
	BulletSounds[8]=Sound'WeaponSounds.BaseImpactAndExplosions.BBulletImpact5'
	BulletSounds[9]=Sound'WeaponSounds.BaseImpactAndExplosions.BBulletImpact6'
	BulletSounds[10]=Sound'WeaponSounds.BaseImpactAndExplosions.BBulletImpact7'
	BulletSounds[11]=Sound'WeaponSounds.BaseImpactAndExplosions.BBulletImpact8'
	BulletSounds[12]=Sound'WeaponSounds.BaseImpactAndExplosions.BBulletImpact9'
	BulletSounds[13]=Sound'WeaponSounds.BaseImpactAndExplosions.BBulletImpact11'
	BulletSounds[14]=Sound'WeaponSounds.BaseImpactAndExplosions.BBulletImpact12'
	BulletSounds[15]=Sound'WeaponSounds.BaseImpactAndExplosions.BBulletImpact13'
	BulletSounds[16]=Sound'WeaponSounds.BaseImpactAndExplosions.BBulletImpact14'
	WaterDamage=150.0000000
	VehicleDrowningDamType=Class'GamePlay.Drowned'
	SpawnOverlay[0]=Shader'XGameShaders.PlayerShaders.VehicleSpawnShaderRed'
	SpawnOverlay[1]=Shader'XGameShaders.PlayerShaders.VehicleSpawnShaderBlue'
	VehicleIcon=(Material=Texture'AS_FX_TX.HUD.TrackedVehicleIcon',X=0.0000000,Y=0.0000000,SizeX=64.0000000,SizeY=64.0000000,bIsGreyScale=false)
	bSpecialHUD=true
	bSetPCRotOnPossess=false
	bCanTeleport=false
	SoundRadius=200.0000000
	TransientSoundRadius=600.0000000
}
