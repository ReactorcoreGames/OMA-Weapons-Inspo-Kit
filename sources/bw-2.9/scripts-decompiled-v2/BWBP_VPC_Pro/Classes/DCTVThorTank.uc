class DCTVThorTank extends ONSHoverTank
	config(User);

var() float TreadTurnScale;
var() Sound MovingIdleSound;
var float StartIdleTime;
var DCTVThorDust ThorDust[4];
var Vector ThorDustOffSets[4];
var() name WheelBones[12];
var() int WheelTurn[12];
var() float WheelCirc[12];
var() float WheelTurnCirc;
var() name BendBones[8];
var() Vector WheelOffsets[8];
var() Range WheelLimits[8];
var InterpCurvePoint WheelExtention[8];
var() float WheelTraceBuffer;
var float NextCrushTime;
var() config bool bThorTrackSuspension;
var() config bool bThorCrushing;

simulated function SetupTreads()
{
	local int i;
	local Rotator R;

	LeftTreadPanner = VariableTexPanner(Level.ObjectPool.AllocateObject(Class'Engine.VariableTexPanner'));
	// End:0x88
	if(LeftTreadPanner != none)
	{
		LeftTreadPanner.Material = Skins[2];
		LeftTreadPanner.PanDirection = rot(0, 0, 0);
		LeftTreadPanner.PanRate = 0.0000000;
		Skins[2] = LeftTreadPanner;
	}
	RightTreadPanner = VariableTexPanner(Level.ObjectPool.AllocateObject(Class'Engine.VariableTexPanner'));
	// End:0x10E
	if(RightTreadPanner != none)
	{
		RightTreadPanner.Material = Skins[1];
		RightTreadPanner.PanDirection = rot(0, 0, 0);
		RightTreadPanner.PanRate = 0.0000000;
		Skins[1] = RightTreadPanner;
	}
	i = 0;
	J0x115:

	// End:0x170 [Loop If]
	if(i < 12)
	{
		WheelTurn[i] = Rand(65536);
		R.Pitch = WheelTurn[i];
		SetBoneRotation(WheelBones[i], R, 0, 1.0000000);
		i++;
		// [Loop Continue]
		goto J0x115;
	}
	//return;	
}

event TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x27
	if(DamageType == Class'Onslaught.DamTypeONSVehicleExplosion')
	{
		Damage *= 0.4000000;
		Momentum *= 0.3000000;
	}
	super.TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

simulated function Tick(float DeltaTime)
{
	local float EnginePitch, LinTurnSpeed, Spd, TrackSpeed;
	local KRigidBodyState BodyState;
	local KarmaParams KP;
	local bool bOnGround, bFwrd;
	local int i;
	local Rotator R;

	KGetRigidBodyState(BodyState);
	KP = KarmaParams(KParams);
	bOnGround = false;
	i = 0;
	J0x2A:

	// End:0x92 [Loop If]
	if(i < KP.Repulsors.Length)
	{
		// End:0x88
		if((KP.Repulsors[i] != none) && KP.Repulsors[i].bRepulsorInContact)
		{
			bOnGround = true;
		}
		i++;
		// [Loop Continue]
		goto J0x2A;
	}
	// End:0xB2
	if(bOnGround)
	{
		KP.KMaxSpeed = MaxGroundSpeed;		
	}
	else
	{
		KP.KMaxSpeed = MaxAirSpeed;
	}
	// End:0x4D0
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Spd = VSize(Velocity);
		LinTurnSpeed = BodyState.AngVel.Z / TreadTurnScale;
		EnginePitch = 32.0000000 + (((Spd + Abs(BodyState.AngVel.Z * WheelTurnCirc)) / MaxPitchSpeed) * 96.0000000);
		SoundPitch = byte(FClamp(EnginePitch, 32.0000000, 128.0000000));
		bFwrd = (Velocity Dot Vector(Rotation)) > float(0);
		// End:0x1D0
		if((AmbientSound != none) || (StartIdleTime != float(0)) && Level.TimeSeconds >= StartIdleTime)
		{
			// End:0x1C5
			if(EnginePitch > float(64))
			{
				AmbientSound = MovingIdleSound;				
			}
			else
			{
				AmbientSound = IdleSound;
			}
		}
		// End:0x238
		if(LeftTreadPanner != none)
		{
			LeftTreadPanner.PanRate = Spd / TreadVelocityScale;
			// End:0x223
			if(bFwrd)
			{
				LeftTreadPanner.PanRate = -1.0000000 * LeftTreadPanner.PanRate;
			}
			LeftTreadPanner.PanRate += LinTurnSpeed;
		}
		// End:0x2A0
		if(RightTreadPanner != none)
		{
			RightTreadPanner.PanRate = Spd / TreadVelocityScale;
			// End:0x28B
			if(bFwrd)
			{
				RightTreadPanner.PanRate = -1.0000000 * RightTreadPanner.PanRate;
			}
			RightTreadPanner.PanRate -= LinTurnSpeed;
		}
		// End:0x2EC
		if(int(Role) == int(ROLE_Authority))
		{
			UpdateWheelHeight(Spd, DeltaTime, (int(Level.DetailMode) < int(2)) || !bThorTrackSuspension, bThorCrushing);			
		}
		else
		{
			// End:0x322
			if((int(Level.DetailMode) == int(2)) && bThorTrackSuspension)
			{
				UpdateWheelHeight(Spd, DeltaTime, false, false);
			}
		}
		// End:0x33B
		if(!bFwrd)
		{
			Spd *= float(-1);
		}
		i = 0;
		J0x342:

		// End:0x410 [Loop If]
		if(i < 12)
		{
			// End:0x380
			if(i < 6)
			{
				TrackSpeed = Spd + (BodyState.AngVel.Z * WheelTurnCirc);				
			}
			else
			{
				TrackSpeed = Spd - (BodyState.AngVel.Z * WheelTurnCirc);
			}
			WheelTurn[i] += int((DeltaTime * float(65536)) * (TrackSpeed / WheelCirc[i]));
			R.Pitch = WheelTurn[i];
			SetBoneRotation(WheelBones[i], R, 0, 1.0000000);
			i++;
			// [Loop Continue]
			goto J0x342;
		}
		i = 0;
		J0x417:

		// End:0x4CD [Loop If]
		if(i < 4)
		{
			// End:0x4C3
			if(ThorDust[i] != none)
			{
				TrackSpeed = Spd - ((BodyState.AngVel.Z * ThorDustOffSets[i].Y) * 6.2831850);
				ThorDust[i].UpdateDust(Abs(TrackSpeed), bOnGround && (i < 2) ^^ (TrackSpeed < float(0)), 1.0000000 + Abs(BodyState.AngVel.Z * float(2)));
			}
			i++;
			// [Loop Continue]
			goto J0x417;
		}		
	}
	else
	{
		UpdateWheelHeight(Spd, DeltaTime, true, bThorCrushing);
	}
	super(SVehicle).Tick(DeltaTime);
	//return;	
}

simulated function UpdateWheelHeight(float Speed, float dt, bool bFast, bool bDamage)
{
	local Actor t;
	local Vector HitLoc, HitNorm, Start, End, X, Y,
		Z, V;

	local float WheelInterpLimit, dist;
	local int i;

	// End:0x36
	if(bDamage && Level.TimeSeconds < NextCrushTime)
	{
		// End:0x2E
		if(bFast)
		{
			return;
		}
		bDamage = false;
	}
	WheelInterpLimit = (FMax(Speed, 1.0000000) * dt) * 0.4000000;
	GetAxes(Rotation, X, Y, Z);
	i = 0;
	J0x73:

	// End:0x3C0 [Loop If]
	if(i < 8)
	{
		Start = Location + (WheelOffsets[i] >> Rotation);
		End = Start - (Z * (WheelLimits[i].Max - WheelLimits[i].Min));
		Start += (Z * WheelTraceBuffer);
		t = Trace(HitLoc, HitNorm, End, Start, true, vect(8.0000000, 8.0000000, 8.0000000));
		// End:0x2C9
		if(t != none)
		{
			// End:0x183
			if(bDamage && t.bCanBeDamaged)
			{
				t.TakeDamage(30, Instigator, HitLoc, vect(0.0000000, 0.0000000, -1.0000000), CrushedDamageType);
				NextCrushTime = Level.TimeSeconds + 0.2000000;
			}
			// End:0x18F
			if(bFast)
			{
				// [Explicit Continue]
				goto J0x3B6;
			}
			dist = VSize(HitLoc - Start);
			// End:0x1D6
			if(dist < WheelTraceBuffer)
			{
				WheelExtention[i].InVal = WheelLimits[i].Max;				
			}
			else
			{
				WheelExtention[i].InVal = WheelLimits[i].Max - (dist - WheelTraceBuffer);
			}
			WheelExtention[i].OutVal += FClamp(WheelExtention[i].InVal - WheelExtention[i].OutVal, -WheelInterpLimit, WheelInterpLimit);
			V.Z = WheelExtention[i].OutVal;
			SetBoneLocation(BendBones[i], V, 1.0000000);
			// End:0x2A7
			if(i < 4)
			{
				SetBoneLocation(WheelBones[i], V, 1.0000000);				
			}
			else
			{
				SetBoneLocation(WheelBones[i + 2], V, 1.0000000);
			}
			// [Explicit Continue]
			goto J0x3B6;
		}
		// End:0x3B6
		if(!bFast)
		{
			WheelExtention[i].InVal = WheelLimits[i].Min;
			WheelExtention[i].OutVal += FClamp(WheelExtention[i].InVal - WheelExtention[i].OutVal, -WheelInterpLimit, WheelInterpLimit);
			V.Z = WheelExtention[i].OutVal;
			SetBoneLocation(BendBones[i], V, 1.0000000);
			// End:0x397
			if(i < 4)
			{
				SetBoneLocation(WheelBones[i], V, 1.0000000);
				// [Explicit Continue]
				goto J0x3B6;
			}
			SetBoneLocation(WheelBones[i + 2], V, 1.0000000);
		}
		J0x3B6:

		i++;
		// [Loop Continue]
		goto J0x73;
	}
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
	StartIdleTime = Level.TimeSeconds + 1.0000000;
	// End:0x85
	if(StartUpSound != none)
	{
		PlaySound(StartUpSound, 0, 1.5000000);
	}
	// End:0x116
	if((xPawn(Driver) != none) && Driver.HasUDamage())
	{
		X = 0;
		J0xB0:

		// End:0x116 [Loop If]
		if(X < Weapons.Length)
		{
			Weapons[X].SetOverlayMaterial(xPawn(Driver).UDamageWeaponMaterial, xPawn(Driver).UDamageTime - Level.TimeSeconds, false);
			X++;
			// [Loop Continue]
			goto J0xB0;
		}
	}
	Driver.bSetPCRotOnPossess = false;
	X = 0;
	J0x12E:

	// End:0x19F [Loop If]
	if(X < Weapons.Length)
	{
		// End:0x165
		if(Weapons[X] == none)
		{
			Weapons.Remove(X, 1);
			X--;
			// [Explicit Continue]
			goto J0x195;
		}
		Weapons[X].NetUpdateFrequency = 20.0000000;
		ClientRegisterVehicleWeapon(Weapons[X], X);
		J0x195:

		X++;
		// [Loop Continue]
		goto J0x12E;
	}
	SVehicleUpdateParams();
	//return;	
}

function DriverLeft()
{
	StartIdleTime = 0.0000000;
	super.DriverLeft();
	//return;	
}

simulated event SVehicleUpdateParams()
{
	local KarmaParams KP;

	super(ONSTreadCraft).SVehicleUpdateParams();
	KP = KarmaParams(KParams);
	KP.Repulsors[0].CheckDist = HoverCheckDist + float(22);
	KP.Repulsors[1].CheckDist = HoverCheckDist + float(22);
	//return;	
}

simulated event DestroyAppearance()
{
	super(ONSVehicle).DestroyAppearance();
	AmbientSound = none;
	//return;	
}

simulated event DrivingStatusChanged()
{
	local int i;

	super.DrivingStatusChanged();
	// End:0x112
	if((bDriving && int(Level.NetMode) != int(NM_DedicatedServer)) && !bDropDetail)
	{
		i = 0;
		J0x3E:

		// End:0x10F [Loop If]
		if(i < 4)
		{
			// End:0x105
			if(ThorDust[i] == none)
			{
				ThorDust[i] = Spawn(Class'BWBP_VPC_Pro.DCTVThorDust', self,, Location + (ThorDustOffSets[i] >> Rotation), Rotation);
				ThorDust[i].SetDustColor(Level.DustColor);
				ThorDust[i].OrientateDust(ThorDustOffSets[i].X > float(0), ThorDustOffSets[i].Y > float(0));
				ThorDust[i].SetBase(self);
			}
			i++;
			// [Loop Continue]
			goto J0x3E;
		}		
	}
	else
	{
		i = 0;
		J0x119:

		// End:0x162 [Loop If]
		if(i < 4)
		{
			// End:0x158
			if(ThorDust[i] != none)
			{
				ThorDust[i].Kill();
				ThorDust[i] = none;
			}
			i++;
			// [Loop Continue]
			goto J0x119;
		}
	}
	//return;	
}

simulated function Destroyed()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x40 [Loop If]
	if(i < 4)
	{
		// End:0x36
		if(ThorDust[i] != none)
		{
			ThorDust[i].Destroy();
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	super.Destroyed();
	//return;	
}

function bool RecommendLongRangedAttack()
{
	return false;
	//return;	
}

defaultproperties
{
	TreadTurnScale=8.0000000
	MovingIdleSound=Sound'BWBP_Vehicles_Sound.ThorTank.ThorTankMove'
	ThorDustOffSets[0]=(X=-130.0000000,Y=-130.0000000,Z=-22.0000000)
	ThorDustOffSets[1]=(X=-130.0000000,Y=130.0000000,Z=-22.0000000)
	ThorDustOffSets[2]=(X=92.0000000,Y=130.0000000,Z=-22.0000000)
	ThorDustOffSets[3]=(X=92.0000000,Y=-130.0000000,Z=-22.0000000)
	WheelBones[0]="WheelL1"
	WheelBones[1]="WheelL2"
	WheelBones[2]="WheelL3"
	WheelBones[3]="WheelL4"
	WheelBones[4]="WheelL5"
	WheelBones[5]="WheelL6"
	WheelBones[6]="WheelR1"
	WheelBones[7]="WheelR2"
	WheelBones[8]="WheelR3"
	WheelBones[9]="WheelR4"
	WheelBones[10]="WheelR5"
	WheelBones[11]="WheelR6"
	WheelCirc[0]=339.3000000
	WheelCirc[1]=320.4000000
	WheelCirc[2]=320.4000000
	WheelCirc[3]=320.4000000
	WheelCirc[4]=251.3000000
	WheelCirc[5]=150.8000000
	WheelCirc[6]=339.3000000
	WheelCirc[7]=320.4000000
	WheelCirc[8]=320.4000000
	WheelCirc[9]=320.4000000
	WheelCirc[10]=251.3000000
	WheelCirc[11]=150.8000000
	WheelTurnCirc=230.0000000
	BendBones[0]="TrackBendL1"
	BendBones[1]="TrackBendL2"
	BendBones[2]="TrackBendL3"
	BendBones[3]="TrackBendL4"
	BendBones[4]="TrackBendR1"
	BendBones[5]="TrackBendR2"
	BendBones[6]="TrackBendR3"
	BendBones[7]="TrackBendR4"
	WheelOffsets[0]=(X=-170.0000000,Y=-96.0000000,Z=-28.0000000)
	WheelOffsets[1]=(X=-76.0000000,Y=-96.0000000,Z=-20.0000000)
	WheelOffsets[2]=(X=13.0000000,Y=-96.0000000,Z=-20.0000000)
	WheelOffsets[3]=(X=103.0000000,Y=-96.0000000,Z=-20.0000000)
	WheelOffsets[4]=(X=-170.0000000,Y=96.0000000,Z=-28.0000000)
	WheelOffsets[5]=(X=-76.0000000,Y=96.0000000,Z=-20.0000000)
	WheelOffsets[6]=(X=13.0000000,Y=96.0000000,Z=-20.0000000)
	WheelOffsets[7]=(X=103.0000000,Y=96.0000000,Z=-20.0000000)
	WheelLimits[0]=(Min=-24.0000000,Max=16.0000000)
	WheelLimits[1]=(Min=-24.0000000,Max=24.0000000)
	WheelLimits[2]=(Min=-24.0000000,Max=24.0000000)
	WheelLimits[3]=(Min=-24.0000000,Max=24.0000000)
	WheelLimits[4]=(Min=-24.0000000,Max=24.0000000)
	WheelLimits[5]=(Min=-24.0000000,Max=24.0000000)
	WheelLimits[6]=(Min=-24.0000000,Max=24.0000000)
	WheelLimits[7]=(Min=-24.0000000,Max=24.0000000)
	WheelTraceBuffer=24.0000000
	bThorTrackSuspension=true
	bThorCrushing=true
	MaxPitchSpeed=1100.0000000
	TreadVelocityScale=1050.0000000
	MaxGroundSpeed=1200.0000000
	ThrusterOffsets=/* ERROR: System.ArgumentOutOfRangeException */
	HoverPenScale=3.0000000
	HoverCheckDist=70.0000000
	MaxThrust=120.0000000
	LateralDampFactor=0.9000000
	DriverWeapons[0]=(WeaponClass=Class'BWBP_VPC_Pro.DCTVThorTankCannon',WeaponBone="TurretWeapon")
	PassengerWeapons[0]=(WeaponPawnClass=Class'BWBP_VPC_Pro.DCTVThorTankMGPawn',WeaponBone="TankMGWeapon")
	RedSkin=Texture'BWBP_Vehicles_Tex.ThorTank.Tank'
	BlueSkin=Texture'BWBP_Vehicles_Tex.ThorTank.TankBlue'
	IdleSound=Sound'BWBP_Vehicles_Sound.ThorTank.ThorTankRun'
	StartUpSound=Sound'BWBP_Vehicles_Sound.ThorTank.ThorTankStart'
	ShutDownSound=Sound'BWBP_Vehicles_Sound.ThorTank.ThorTankStop'
	DestroyedVehicleMesh=StaticMesh'BWBP_Vehicles_Static.ThorTank.ThorBustedTank'
	DisintegrationEffectClass=Class'BWBP_VPC_Pro.DCTVThorDisintegration'
	DisintegrationHealth=-300.0000000
	FireImpulse=(X=-150000.0000000,Y=0.0000000,Z=0.0000000)
	bHasFireImpulse=true
	VehicleMass=16.0000000
	ExitPositions[0]=()
	ExitPositions[1]=()
	FPCamPos=(X=-70.0000000,Y=0.0000000,Z=200.0000000)
	TPCamWorldOffset=(X=0.0000000,Y=0.0000000,Z=300.0000000)
	VehiclePositionString="in a Thor Tank"
	VehicleNameString="XC943B-22 Thor Tank"
	RanOverDamageType=Class'BWBP_VPC_Pro.DT_ThorRoadKill'
	CrushedDamageType=Class'BWBP_VPC_Pro.DT_ThorPanCake'
	MaxDesireability=0.9000000
	FlagBone="FlagBone"
	WaterDamage=0.0000000
	HealthMax=1200.0000000
	Health=1200
	Mesh=SkeletalMesh'BWBP_Vehicles_Anim.ThorTank'
	Skins[0]=none
	Skins[1]=TexScaler'BWBP_Vehicles_Tex.ThorTank.TrackScaler'
	Skins[2]=TexScaler'BWBP_Vehicles_Tex.ThorTank.TrackScaler'
	bFullVolume=true
	SoundVolume=255
	// Reference: KarmaParamsRBFull'BWBP_VPC_Pro.DCTVThorTank.KParams1'
	begin object name="KParams1" class=Engine.KarmaParamsRBFull
		KInertiaTensor[0]=7.2841620
		KInertiaTensor[2]=-0.1857950
		KInertiaTensor[3]=7.0361220
		KInertiaTensor[5]=13.4052900
		KCOMOffset=(X=-0.2688000,Y=-0.0000030,Z=1.0712000)
		KLinearDamping=0.0000000
		KAngularDamping=0.0000000
		KStartEnabled=true
		KMaxSpeed=1200.0000000
		bHighDetailOnly=false
		bClientOnly=false
		bKDoubleTickRate=true
		bKStayUpright=true
		bKAllowRotate=true
		bDestroyOnWorldPenetrate=true
		bDoSafetime=true
		KFriction=0.5000000
	end object
	KParams=KParams1
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: KarmaParamsRBFull'BWBP_VPC_Pro.DCTVThorTank.KParams1'
begin object name="KParams1" class=Engine.KarmaParamsRBFull
	KInertiaTensor[0]=7.2841620
	KInertiaTensor[2]=-0.1857950
	KInertiaTensor[3]=7.0361220
	KInertiaTensor[5]=13.4052900
	KCOMOffset=(X=-0.2688000,Y=-0.0000030,Z=1.0712000)
	KLinearDamping=0.0000000
	KAngularDamping=0.0000000
	KStartEnabled=true
	KMaxSpeed=1200.0000000
	bHighDetailOnly=false
	bClientOnly=false
	bKDoubleTickRate=true
	bKStayUpright=true
	bKAllowRotate=true
	bDestroyOnWorldPenetrate=true
	bDoSafetime=true
	KFriction=0.5000000
end object
