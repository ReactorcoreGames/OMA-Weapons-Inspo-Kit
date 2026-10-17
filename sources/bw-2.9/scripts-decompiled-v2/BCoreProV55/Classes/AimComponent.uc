class AimComponent extends Object;

var BallisticWeapon BW;
var LevelInfo Level;
var() editinline AimParams Params;
var IntRange AimSpread;
var float AimAdjustTime;
var float ChaosDeclineTime;
var int ChaosSpeedThreshold;
var int ChaosTurnThreshold;
var float CrouchMultiplier;
var float GunLength;
var Rotator LongGunPivot;
var Vector LongGunOffset;
var float DisplaceEndTime;
var float DisplaceDurationMult;
var private Rotator Aim;
var private Rotator NewAim;
var private Rotator OldAim;
var private float AimMultiplier;
var private float ReaimTime;
var private float ReaimPhase;
var private bool bReaiming;
var private float NextZeroAimTime;
var private float LastFireChaosTime;
var private Rotator AimOffset;
var private Rotator NewAimOffset;
var private Rotator OldAimOffset;
var private float AimOffsetTime;
var private Rotator LastViewPivot;
var private float ViewBindFactor;
var private bool bJumpLock;
var private bool bForceReaim;
var private float Chaos;
var private float NewChaos;
var private float OldChaos;
var private Rotator OldLookDir;
var private float FireChaos;
var private float LongGunFactor;
var private float NewLongGunFactor;
var private bool bSprintOffset;
var private float DisplaceFactor;

final simulated function bool IsDisplaced()
{
	return (DisplaceEndTime > Level.TimeSeconds) || DisplaceFactor > float(0);
	//return;	
}

final simulated function float GetChaos()
{
	return Chaos;
	//return;	
}

final simulated function float GetFireChaos()
{
	return FireChaos;
	//return;	
}

final simulated function bool PendingForcedReaim()
{
	return bForceReaim;
	//return;	
}

final function Rotator GetBaseAim()
{
	return Aim * AimMultiplier;
	//return;	
}

final simulated function Rotator GetAimPivot(optional bool bIgnoreViewAim)
{
	// End:0x82
	if(((bIgnoreViewAim || BW.InstigatorController == none) || PlayerController(BW.InstigatorController) == none) || PlayerController(BW.InstigatorController).bBehindView)
	{
		return (AimOffset + GetBaseAim()) + (LongGunPivot * FMax(LongGunFactor, DisplaceFactor));
	}
	return (AimOffset + (GetBaseAim() * (float(1) - ViewBindFactor))) + (LongGunPivot * FMax(LongGunFactor, DisplaceFactor));
	//return;	
}

final simulated function Rotator GetViewPivot()
{
	return GetBaseAim() * ViewBindFactor;
	//return;	
}

final simulated function float CalcConeInaccuracy()
{
	return (float(AimSpread.Max) * (float(1) - (float(360 / ChaosSpeedThreshold) * Chaos))) * FireChaos;
	//return;	
}

final simulated function Rotator CalcFutureAim(float ExtraTime, bool bIgnoreViewAim)
{
	// End:0x7F
	if(((bIgnoreViewAim || BW.InstigatorController == none) || PlayerController(BW.InstigatorController) == none) || PlayerController(BW.InstigatorController).bBehindView)
	{
		return (GetFutureAimOffset(ExtraTime) + GetFutureAim(ExtraTime)) + GetAimOffsets();
	}
	return (GetFutureAimOffset(ExtraTime) + (GetFutureAim(ExtraTime) * (float(1) - ViewBindFactor))) + GetAimOffsets();
	//return;	
}

private final simulated function Rotator GetAimOffsets()
{
	return AimOffset + (LongGunPivot * LongGunFactor);
	//return;	
}

private final simulated function Rotator GetFutureAim(float ExtraTime)
{
	return Class'BCoreProV55.BUtil'.static.RSmerp(FMin((ReaimPhase + ExtraTime) / ReaimTime, 1.0000000), OldAim, NewAim) * AimMultiplier;
	//return;	
}

private final simulated function Rotator GetFutureAimOffset(float ExtraTime)
{
	return Class'BCoreProV55.BUtil'.static.RSmerp(FMax(0.0000000, (AimOffsetTime - (Level.TimeSeconds + ExtraTime)) / AimAdjustTime), NewAimOffset, OldAimOffset);
	//return;	
}

final simulated function Rotator CalcViewPivotDelta()
{
	local Rotator CurViewPivot, DeltaPivot;

	CurViewPivot = GetViewPivot();
	DeltaPivot = CurViewPivot - LastViewPivot;
	LastViewPivot = CurViewPivot;
	return DeltaPivot;
	//return;	
}

final simulated function ForceReaim()
{
	bForceReaim = true;
	//return;	
}

final simulated function SetLastLookDir(Rotator Rot)
{
	OldLookDir = Rot;
	//return;	
}

final simulated function SetNewAimOffset(Rotator NewOffset, float ShiftTime)
{
	OldAimOffset = AimOffset;
	NewAimOffset = NewOffset;
	AimOffsetTime = Level.TimeSeconds + ShiftTime;
	//return;	
}

final simulated function Cleanup()
{
	BW = none;
	Level = none;
	Params = none;
	ChaosDeclineTime = 0.0000000;
	AimAdjustTime = 0.0000000;
	CrouchMultiplier = 1.0000000;
	Aim = rot(0, 0, 0);
	NewAim = rot(0, 0, 0);
	OldAim = rot(0, 0, 0);
	AimMultiplier = 1.0000000;
	ReaimTime = 0.0000000;
	ReaimPhase = 0.0000000;
	bReaiming = false;
	NextZeroAimTime = 0.0000000;
	AimOffset = rot(0, 0, 0);
	NewAimOffset = rot(0, 0, 0);
	OldAimOffset = rot(0, 0, 0);
	AimOffsetTime = 0.0000000;
	LastViewPivot = rot(0, 0, 0);
	ViewBindFactor = 0.0000000;
	bJumpLock = false;
	bForceReaim = false;
	Chaos = 0.0000000;
	NewChaos = 0.0000000;
	OldChaos = 0.0000000;
	OldLookDir = rot(0, 0, 0);
	FireChaos = 0.0000000;
	LongGunFactor = 0.0000000;
	NewLongGunFactor = 0.0000000;
	DisplaceFactor = 0.0000000;
	DisplaceEndTime = 0.0000000;
	DisplaceDurationMult = 0.0000000;
	bSprintOffset = false;
	//return;	
}

final simulated function Recalculate()
{
	assert(Params != none);
	AimSpread = Params.AimSpread;
	AimAdjustTime = Params.AimAdjustTime;
	ChaosDeclineTime = Params.ChaosDeclineTime;
	ChaosSpeedThreshold = Params.ChaosSpeedThreshold;
	ChaosTurnThreshold = Params.ChaosTurnThreshold;
	CrouchMultiplier = Params.CrouchMultiplier;
	// End:0xD5
	if(Class'BCoreProV55.BallisticGameStyles'.static.WYSIWYG())
	{
		Params.ViewBindFactor = 1.0000000;
		Params.ADSViewBindFactor = 1.0000000;
		AimSpread.Min = 0;
		AimSpread.Max = 0;
	}
	// End:0xF6
	if(ViewBindFactor == float(0))
	{
		ViewBindFactor = Params.ViewBindFactor;
	}
	BW.OnAimParamsChanged();
	//return;	
}

final simulated function OnPreDrawFPWeapon()
{
	// End:0x49
	if(LongGunFactor != float(0))
	{
		BW.SetLocation(BW.Location + (Class'BCoreProV55.BUtil'.static.ViewAlignedOffset(BW, LongGunOffset) * LongGunFactor));
	}
	//return;	
}

final simulated function OnWeaponSelected()
{
	OldLookDir = BW.GetPlayerAim();
	bSprintOffset = ((BW.SprintControl != none) && BW.SprintControl.bSprintActive) && Class'BCoreProV55.BallisticReplicationInfo'.default.bWeaponJumpOffsetting;
	AimOffset = CalcNewAimOffset();
	NewAimOffset = AimOffset;
	OldAimOffset = AimOffset;
	//return;	
}

final simulated function UpdateADSTransition(float Delta)
{
	ViewBindFactor = Smerp(Delta, Params.ViewBindFactor, Params.ADSViewBindFactor);
	AimMultiplier = Lerp(Delta, 1.0000000, Params.ADSMultiplier);
	//return;	
}

final simulated function bool AllowADS()
{
	return (NewLongGunFactor == float(0)) && !IsDisplaced();
	//return;	
}

final simulated function ApplyADSModifiers()
{
	AimSpread.Min = 0;
	//return;	
}

final simulated function OnADSViewStart()
{
	ViewBindFactor = Params.ADSViewBindFactor;
	AimMultiplier = Params.ADSMultiplier;
	//return;	
}

final simulated function OnADSViewEnd()
{
	ViewBindFactor = Params.ViewBindFactor;
	AimMultiplier = 1.0000000;
	//return;	
}

final simulated function OnADSEnd()
{
	Recalculate();
	// End:0x24
	if(!bJumpLock)
	{
		Reaim(0.1000000);
		bForceReaim = true;
	}
	//return;	
}

final simulated function OnPlayerJumped()
{
	Reaim(0.0500000, AimAdjustTime, Params.JumpChaos, float(Params.JumpOffset.Yaw), float(Params.JumpOffset.Pitch));
	bJumpLock = true;
	FireChaos += Params.JumpChaos;
	bForceReaim = true;
	//return;	
}

final simulated function OnPlayerSprint(bool bSprint)
{
	bSprintOffset = bSprint;
	SetNewAimOffset(CalcNewAimOffset(), Params.OffsetAdjustTime);
	Reaim(0.0500000, AimAdjustTime, Params.SprintChaos);
	//return;	
}

final simulated function RecoilReaim(float Chaos)
{
	// End:0x38
	if(!bReaiming)
	{
		Reaim(Level.TimeSeconds - BW.LastRenderTime,,,,, Chaos);
	}
	//return;	
}

final simulated function AddFireChaos(float Chaos)
{
	FireChaos = FClamp(FireChaos + Chaos, 0.0000000, 1.0000000);
	LastFireChaosTime = Level.TimeSeconds;
	//return;	
}

final simulated function UpdateAim(float dt)
{
	local float AdjustAlpha, VelMag;

	// End:0x27
	if(BW.bAimDisabled)
	{
		Aim = rot(0, 0, 0);
		return;
	}
	UpdateReaim(dt);
	// End:0x8C
	if(AimOffset != NewAimOffset)
	{
		AimOffset = Class'BCoreProV55.BUtil'.static.RSmerp(FMax(0.0000000, (AimOffsetTime - Level.TimeSeconds) / Params.OffsetAdjustTime), NewAimOffset, OldAimOffset);
	}
	// End:0xF2
	if(Chaos > float(0))
	{
		// End:0xD8
		if(BW.Instigator.bIsCrouched)
		{
			Chaos -= FMin(Chaos, dt / (ChaosDeclineTime * CrouchMultiplier));			
		}
		else
		{
			Chaos -= FMin(Chaos, dt / ChaosDeclineTime);
		}
	}
	// End:0x182
	if((FireChaos > float(0)) && (LastFireChaosTime + Params.ChaosDeclineDelay) < Level.TimeSeconds)
	{
		// End:0x168
		if(BW.Instigator.bIsCrouched)
		{
			FireChaos -= FMin(FireChaos, dt / (ChaosDeclineTime / CrouchMultiplier));			
		}
		else
		{
			FireChaos -= FMin(FireChaos, dt / ChaosDeclineTime);
		}
	}
	// End:0x1E3
	if(BW.Instigator.Base != none)
	{
		VelMag = VSize(BW.Instigator.Velocity - BW.Instigator.Base.Velocity);		
	}
	else
	{
		VelMag = VSize(BW.Instigator.Velocity);
	}
	AdjustAlpha = FMin(1.0000000, VelMag / Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerGroundSpeed);
	AimAdjustTime = (Params.AimAdjustTime * float(2)) * Lerp(AdjustAlpha, 1.0000000, Params.VelocityAimAdjustMult);
	//return;	
}

final simulated function UpdateReaim(float dt)
{
	// End:0x5B
	if(bReaiming)
	{
		ReaimPhase += dt;
		// End:0x2D
		if(ReaimPhase >= ReaimTime)
		{
			StopAim();			
		}
		else
		{
			Aim = Class'BCoreProV55.BUtil'.static.RSmerp(ReaimPhase / ReaimTime, OldAim, NewAim);
		}		
	}
	else
	{
		// End:0x9A
		if(int(BW.Instigator.Physics) == int(2))
		{
			Reaim(dt,, Params.FallingChaos);			
		}
		else
		{
			Reaim(dt);
		}
	}
	//return;	
}

final simulated function Rotator CalcNewAimOffset()
{
	local Rotator R;

	R = rot(0, 0, 0);
	// End:0x2B
	if(BW.IsHoldingMelee())
	{
		return R;
	}
	// End:0xBC
	if(bSprintOffset)
	{
		R.Pitch += Params.SprintOffset.Pitch;
		// End:0x9D
		if(BW.Instigator.Controller.Handedness < float(0))
		{
			R.Yaw -= Params.SprintOffset.Yaw;			
		}
		else
		{
			R.Yaw += Params.SprintOffset.Yaw;
		}
	}
	return R;
	//return;	
}

final simulated function Reaim(float dt, optional float TimeMod, optional float ExtraChaos, optional float xMod, optional float YMod, optional float BaseChaos)
{
	local int RDist;
	local float VResult, X, Y, t, CAF, XValue,
		YValue;

	local Rotator ViewOff, R;
	local Vector V;

	// End:0x14
	if(BW.bAimDisabled)
	{
		return;
	}
	// End:0x25
	if(bJumpLock)
	{
		bJumpLock = false;
	}
	// End:0x40
	if(int(BW.Role) < int(ROLE_Authority))
	{
		return;
	}
	bForceReaim = false;
	// End:0xE1
	if(int(BW.Instigator.Physics) != int(0))
	{
		V = BW.Instigator.Velocity;
		// End:0xCB
		if(BW.Instigator.Base != none)
		{
			V -= BW.Instigator.Base.Velocity;
		}
		VResult = VSize(V) / float(ChaosSpeedThreshold);
	}
	OldChaos = NewChaos;
	// End:0x133
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsArenaOrTactical())
	{
		Chaos = FClamp(VResult, 0.0000000, 1.0000000);
		NewChaos = Chaos;
		XValue = FRand();
		YValue = FRand();		
	}
	else
	{
		ViewOff = BW.GetPlayerAim() - OldLookDir;
		R.Yaw = int(Abs(float(ViewOff.Yaw)));
		R.Pitch = int(Abs(float(ViewOff.Pitch)));
		RDist = int(Sqrt(float(R.Yaw * R.Yaw) + float(R.Pitch * R.Pitch)));
		// End:0x1EB
		if(BW.Instigator.bIsCrouched)
		{
			CAF = CrouchMultiplier;			
		}
		else
		{
			CAF = 1.0000000;
		}
		Chaos = FClamp((FMax(BaseChaos + VResult, Chaos) + ExtraChaos) + (CAF * ((float(RDist) / dt) / float(ChaosTurnThreshold))), 0.0000000, 1.0000000);
		NewChaos = Chaos;
		// End:0x311
		if((PlayerController(BW.Instigator.Controller) != none) && RDist > 0)
		{
			XValue = 0.5000000 + ((FRand() * 0.5000000) * ((float((ViewOff.Yaw / R.Yaw) * 2) + ((FRand() * float(2)) - float(1))) / float(3)));
			YValue = 0.5000000 + ((FRand() * 0.5000000) * ((float((ViewOff.Pitch / R.Pitch) * 2) + ((FRand() * float(2)) - float(1))) / float(3)));			
		}
		else
		{
			XValue = FRand();
			YValue = FRand();
		}
	}
	X = xMod + Lerp(XValue, Lerp(Chaos, float(-AimSpread.Min), float(-AimSpread.Max)), Lerp(Chaos, float(AimSpread.Min), float(AimSpread.Max)));
	Y = YMod + Lerp(YValue, Lerp(Chaos, float(-AimSpread.Min), float(-AimSpread.Max)), Lerp(Chaos, float(AimSpread.Min), float(AimSpread.Max)));
	// End:0x400
	if(BW.Instigator.bIsCrouched)
	{
		X *= CrouchMultiplier;
		Y *= CrouchMultiplier;
	}
	// End:0x41B
	if(TimeMod != float(0))
	{
		t = TimeMod;		
	}
	else
	{
		t = AimAdjustTime;
	}
	StartAim(t, X, Y);
	SendNewAim();
	//return;	
}

private final simulated function StartAim(float Time, float Yaw, float Pitch)
{
	bReaiming = true;
	OldAim = Aim;
	ReaimTime = Time;
	ReaimPhase = 0.0000000;
	NewAim.Yaw = int(Yaw);
	NewAim.Pitch = int(Pitch);
	//return;	
}

private final simulated function StopAim()
{
	bReaiming = false;
	Aim = NewAim;
	ReaimPhase = 0.0000000;
	//return;	
}

final simulated function ZeroAim(float TimeMod)
{
	// End:0x25
	if((Level.TimeSeconds < NextZeroAimTime) || bJumpLock)
	{
		return;
	}
	StartAim(TimeMod, 0.0000000, 0.0000000);
	SendNewAim();
	//return;	
}

final simulated function UpdateDisplacements(float Delta)
{
	// End:0x2C
	if(Class'BCoreProV55.BallisticReplicationInfo'.default.bLongWeaponOffsetting && GunLength > float(0))
	{
		TickLongGun(Delta);
	}
	// End:0x40
	if(IsDisplaced())
	{
		TickDisplacement(Delta);
	}
	//return;	
}

private final simulated function TickLongGun(float dt)
{
	local Actor t;
	local Vector HitLoc, HitNorm, Start;
	local float dist;

	LongGunFactor += FClamp(NewLongGunFactor - LongGunFactor, -dt / Params.OffsetAdjustTime, dt / Params.OffsetAdjustTime);
	Start = BW.Instigator.Location + BW.Instigator.EyePosition();
	t = BW.Trace(HitLoc, HitNorm, Start + (Vector(BW.Instigator.GetViewRotation()) * (GunLength + BW.Instigator.CollisionRadius)), Start, true);
	// End:0x176
	if((((t == none) || t.Base == BW.Instigator) || (Pawn(t) == none) && t.Owner == BW.Instigator) || int(BW.MeleeState) != int(0))
	{
		BW.OnDisplaceEnd();
		NewLongGunFactor = 0.0000000;		
	}
	else
	{
		dist = FMax(0.0000000, VSize(HitLoc - Start) - BW.Instigator.CollisionRadius);
		// End:0x1E7
		if(dist < GunLength)
		{
			BW.OnDisplaceStart();
			NewLongGunFactor = Acos(dist / GunLength) / 1.5707960;
		}
	}
	//return;	
}

final simulated function DisplaceAim(float Duration)
{
	Duration = FMin(2.0000000, Duration * DisplaceDurationMult);
	// End:0x3A
	if((Level.TimeSeconds + Duration) <= DisplaceEndTime)
	{
		return;
	}
	DisplaceEndTime = Level.TimeSeconds + Duration;
	BW.OnWeaponDisplaced();
	// End:0x91
	if(int(BW.Role) == int(ROLE_Authority))
	{
		BW.ClientDisplaceAim(Duration);
	}
	//return;	
}

private final simulated function TickDisplacement(float dt)
{
	// End:0x60
	if(DisplaceEndTime > Level.TimeSeconds)
	{
		DisplaceFactor = FMin(DisplaceFactor + (dt / 0.2000000), 0.7500000);
		// End:0x5D
		if(!BW.bServerReloading)
		{
			BW.bServerReloading = true;
		}		
	}
	else
	{
		DisplaceFactor = FMax(DisplaceFactor - (dt / 0.3500000), 0.0000000);
		// End:0xA3
		if(BW.bServerReloading)
		{
			BW.bServerReloading = false;
		}
	}
	//return;	
}

private final function SendNewAim()
{
	local float Yaw, Pitch, Time;

	Yaw = float(NewAim.Yaw);
	Pitch = float(NewAim.Pitch);
	Time = ReaimTime;
	BW.ReceiveNetAim(Yaw, Pitch, Time, OldChaos, NewChaos);
	//return;	
}

final simulated function ReceiveNetAim(float Yaw, float Pitch, float Time, float oChaos, float nChaos)
{
	// End:0x1B
	if(int(BW.Role) == int(ROLE_Authority))
	{
		return;
	}
	bReaiming = true;
	OldAim = Aim;
	OldChaos = oChaos;
	NewChaos = nChaos;
	ReaimPhase = 0.0000000;
	ReaimTime = Time;
	NewAim.Yaw = int(Yaw);
	NewAim.Pitch = int(Pitch);
	//return;	
}

final simulated function ApplyDamageFactor(int Damage)
{
	local float DF;

	DF = FMin(1.0000000, (float(Damage) / float(Params.AimDamageThreshold)) * BW.AimKnockScale);
	Reaim(0.1000000, 0.3000000 * AimAdjustTime, DF * float(2), (DF * float(2)) * (float(-3500) + (float(7000) * FRand())), (DF * float(2)) * (float(-3000) + (float(6000) * FRand())));
	bForceReaim = true;
	// End:0xCF
	if(int(BW.Role) == int(ROLE_Authority))
	{
		BW.ClientPlayerDamaged(Damage);
	}
	//return;	
}

final simulated function float CalcCrosshairOffset(Canvas C)
{
	local float OffsetAdjustment;

	// End:0x17
	if(AimSpread.Max <= 32)
	{
		return 0.0000000;
	}
	OffsetAdjustment = C.ClipX / float(2);
	// End:0xED
	if(bReaiming)
	{
		OffsetAdjustment *= (Tan((float(AimSpread.Min) + (float(AimSpread.Max - AimSpread.Min) * FClamp(Lerp(ReaimPhase / ReaimTime, OldChaos, NewChaos) + ((float(1) - (float(360 / Params.ChaosSpeedThreshold) * NewChaos)) * FireChaos), 0.0000000, 1.0000000))) * 0.0000959) / Tan((BW.InstigatorController.FovAngle / float(2)) * 0.0174533));		
	}
	else
	{
		OffsetAdjustment *= (Tan((float(AimSpread.Min) + (float(AimSpread.Max - AimSpread.Min) * FClamp(NewChaos + ((float(1) - (float(360 / Params.ChaosSpeedThreshold) * NewChaos)) * FireChaos), 0.0000000, 1.0000000))) * 0.0000959) / Tan((BW.InstigatorController.FovAngle / float(2)) * 0.0174533));
	}
	return OffsetAdjustment;
	//return;	
}

final simulated function DrawDebug(Canvas Canvas)
{
	Canvas.DrawText((((((((("AimComponent: Chaos: " $ string(Chaos)) $ ", ReaimPhase: ") $ string(ReaimPhase)) $ ", Aim: ") $ string(Aim.Yaw)) $ ",") $ string(Aim.Pitch)) $ " Aim Adjust Time: ") $ string(AimAdjustTime));
	//return;	
}

defaultproperties
{
	AimMultiplier=1.0000000
}
