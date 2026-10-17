class RecoilComponent extends Object;

enum ERecoilState
{
	Holding,                        // 0
	Climbing,                       // 1
	Declining                       // 2
};

struct StateData
{
	var int Recoil;
	var float XRand;
	var float YRand;
};

var BallisticWeapon BW;
var LevelInfo Level;
var() editinline RecoilParams Params;
var float PitchFactor;
var float YawFactor;
var float XRandFactor;
var float YRandFactor;
var float MinRandFactor;
var int MaxRecoil;
var float DeclineTime;
var float DeclineDelay;
var float HipMultiplier;
var float MaxMoveMultiplier;
var float CrouchMultiplier;
var bool bViewDecline;
var bool bUseAltSightCurve;
var private StateData Start;
var private StateData Current;
var private StateData Target;
var private Rotator StartPivot;
var private Rotator CurrentPivot;
var private Rotator LastPivot;
var private Rotator TargetPivot;
var private float AdjustmentPhase;
var private float AdjustmentTime;
var private float ViewBindFactor;
var private float LastRecoilTime;
var private RecoilComponent.ERecoilState MoveState;

final function bool CanDeclineRecoil()
{
	return (LastRecoilTime + DeclineDelay) < Level.TimeSeconds;
	//return;	
}

final function bool ShouldShift()
{
	return int(MoveState) != int(0);
	//return;	
}

final function bool ShouldUpdateView()
{
	return bViewDecline || int(MoveState) != int(2);
	//return;	
}

final function Cleanup()
{
	BW = none;
	Level = none;
	Params = none;
	Current.Recoil = 0;
	Current.XRand = 0.0000000;
	Current.YRand = 0.0000000;
	Start.Recoil = 0;
	Start.XRand = 0.0000000;
	Start.YRand = 0.0000000;
	Target.Recoil = 0;
	Target.XRand = 0.0000000;
	Target.YRand = 0.0000000;
	ViewBindFactor = 0.0000000;
	LastRecoilTime = 0.0000000;
	MoveState = 0;
	StartPivot = rot(0, 0, 0);
	CurrentPivot = rot(0, 0, 0);
	LastPivot = rot(0, 0, 0);
	TargetPivot = rot(0, 0, 0);
	AdjustmentPhase = 0.0000000;
	AdjustmentTime = 0.0000000;
	//return;	
}

final function Recalculate()
{
	assert(Params != none);
	PitchFactor = Params.PitchFactor;
	YawFactor = Params.YawFactor;
	XRandFactor = Params.XRandFactor;
	YRandFactor = Params.YRandFactor;
	MinRandFactor = Params.MinRandFactor;
	MaxRecoil = int(Params.MaxRecoil);
	DeclineTime = Params.DeclineTime;
	DeclineDelay = Params.DeclineDelay;
	HipMultiplier = Params.HipMultiplier;
	MaxMoveMultiplier = Params.MaxMoveMultiplier;
	CrouchMultiplier = Params.CrouchMultiplier;
	bViewDecline = Params.bViewDecline;
	bUseAltSightCurve = Params.bUseAltSightCurve;
	// End:0x14F
	if(Class'BCoreProV55.BallisticGameStyles'.static.WYSIWYG())
	{
		Params.ViewBindFactor = 1.0000000;
		Params.ADSViewBindFactor = 1.0000000;
	}
	// End:0x170
	if(ViewBindFactor == float(0))
	{
		ViewBindFactor = Params.ViewBindFactor;
	}
	BW.OnRecoilParamsChanged();
	//return;	
}

final function UpdateRecoil(float dt)
{
	LastPivot = CurrentPivot;
	// End:0x17F
	if(ShouldShift())
	{
		// End:0x2C
		if(AdjustmentTime == float(0))
		{
			AdjustmentPhase = 1.0000000;
		}
		AdjustmentPhase = FMin(1.0000000, AdjustmentPhase + (dt / AdjustmentTime));
		// End:0x145
		if(AdjustmentPhase < float(1))
		{
			// End:0xEA
			if(int(BW.Role) == int(ROLE_Authority))
			{
				Current.Recoil = int(Lerp(AdjustmentPhase, float(Start.Recoil), float(Target.Recoil)));
				Current.XRand = Lerp(AdjustmentPhase, Start.XRand, Target.XRand);
				Current.YRand = Lerp(AdjustmentPhase, Start.YRand, Target.YRand);
			}
			CurrentPivot.Pitch = int(Lerp(AdjustmentPhase, float(StartPivot.Pitch), float(TargetPivot.Pitch)));
			CurrentPivot.Yaw = int(Lerp(AdjustmentPhase, float(StartPivot.Yaw), float(TargetPivot.Yaw)));			
		}
		else
		{
			// End:0x169
			if(int(BW.Role) == int(ROLE_Authority))
			{
				Current = Target;
			}
			CurrentPivot = TargetPivot;
			MoveState = 0;
		}		
	}
	else
	{
		// End:0x1BB
		if(((int(BW.Role) == int(ROLE_Authority)) && Current.Recoil > 0) && CanDeclineRecoil())
		{
			StartRecoilDecline();
		}
	}
	//return;	
}

final function AddRecoil(float Amount, optional byte Mode)
{
	local StateData NewTarget;
	local Rotator NewTargetDeltaPivot;

	// End:0x3E
	if((BW.bAimDisabled || Amount == float(0)) || int(BW.Role) < int(ROLE_Authority))
	{
		return;
	}
	Amount = ScaleRecoilAmount(Amount);
	Start = Current;
	StartPivot = CurrentPivot;
	// End:0x8B
	if(int(MoveState) == int(2))
	{
		Target = Current;
		TargetPivot = CurrentPivot;
	}
	NewTarget.Recoil = int(FMin(float(MaxRecoil), float(Target.Recoil) + Amount));
	NewTarget.XRand = FRand();
	NewTarget.YRand = FRand();
	// End:0x168
	if(NewTarget.Recoil == MaxRecoil)
	{
		// End:0x148
		if(Amount < float(260))
		{
			NewTarget.XRand *= ((float(5) * (float(400) - Amount)) / float(400));
			NewTarget.YRand *= ((float(5) * (float(400) - Amount)) / float(400));			
		}
		else
		{
			NewTarget.XRand *= float(3);
			NewTarget.YRand *= float(3);
		}
	}
	NewTargetDeltaPivot = CalculateRecoil(NewTarget) - CalculateRecoil(Target);
	Target = NewTarget;
	TargetPivot += NewTargetDeltaPivot;
	AdjustmentPhase = 0.0000000;
	AdjustmentTime = Params.ClimbTime;
	MoveState = 1;
	LastRecoilTime = BW.Level.TimeSeconds;
	// End:0x22D
	if(int(BW.Role) == int(ROLE_Authority))
	{
		BW.SendNetRecoil(TargetPivot.Pitch, TargetPivot.Yaw, Params.ClimbTime);
	}
	//return;	
}

final function StartRecoilDecline()
{
	MoveState = 2;
	Start = Current;
	StartPivot = CurrentPivot;
	Target.Recoil = 0;
	Target.XRand = 0.0000000;
	Target.YRand = 0.0000000;
	TargetPivot = rot(0, 0, 0);
	AdjustmentPhase = 0.0000000;
	AdjustmentTime = DeclineTime * (float(Current.Recoil) / float(MaxRecoil));
	BW.SendNetRecoil(0, 0, AdjustmentTime);
	//return;	
}

final function float ScaleRecoilAmount(float Amount)
{
	// End:0x95
	if(VSize(BW.Instigator.Velocity) >= float(30))
	{
		// End:0x92
		if(MaxMoveMultiplier > 1.0000000)
		{
			Amount *= (float(1) + ((MaxMoveMultiplier - float(1)) * FMin(1.0000000, VSize(BW.Instigator.Velocity) / (Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerGroundSpeed * BW.Instigator.WalkingPct))));
		}		
	}
	else
	{
		// End:0xBC
		if(BW.Instigator.bIsCrouched)
		{
			Amount *= CrouchMultiplier;
		}
	}
	// End:0xDC
	if(!BW.bScopeView)
	{
		Amount *= HipMultiplier;
	}
	Amount *= Class'BCoreProV55.BallisticReplicationInfo'.default.RecoilShotScale;
	return Amount;
	//return;	
}

final function UpdateADSTransition(float Delta)
{
	ViewBindFactor = Smerp(Delta, Params.ViewBindFactor, Params.ADSViewBindFactor);
	//return;	
}

final function OnADSViewStart()
{
	ViewBindFactor = Params.ADSViewBindFactor;
	//return;	
}

final function OnADSViewEnd()
{
	// End:0x2D
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		ViewBindFactor = Params.ViewBindFactor;
	}
	//return;	
}

final function Rotator CalcViewPivotDelta()
{
	return (CurrentPivot - LastPivot) * ViewBindFactor;
	//return;	
}

final function Rotator GetViewPivot()
{
	// End:0x72
	if(((BW.Instigator.Controller == none) || PlayerController(BW.Instigator.Controller) == none) || PlayerController(BW.Instigator.Controller).bBehindView)
	{
		return CurrentPivot;
	}
	return CurrentPivot * ViewBindFactor;
	//return;	
}

final function Rotator GetEscapePivot()
{
	// End:0x1B
	if(ViewBindFactor == float(1))
	{
		return rot(0, 0, 0);
	}
	return CurrentPivot * (float(1) - ViewBindFactor);
	//return;	
}

final function Rotator GetViewEscapePivot()
{
	return GetEscapePivot() * (float(1) / Params.EscapeMultiplier);
	//return;	
}

private final function Rotator CalculateRecoil(StateData State)
{
	local Rotator R;
	local float AdjustedRecoil;

	// End:0x110
	if(Params.MinRandFactor > float(0))
	{
		AdjustedRecoil = (Params.MaxRecoil * Params.MinRandFactor) + (float(State.Recoil) * (float(1) - Params.MinRandFactor));
		R.Yaw = int(float(int((-AdjustedRecoil * Params.XRandFactor) + (((AdjustedRecoil * Params.XRandFactor) * float(2)) * State.XRand))) * 0.3000000);
		R.Pitch = int(float(int((-AdjustedRecoil * Params.YRandFactor) + (((AdjustedRecoil * Params.YRandFactor) * float(2)) * State.YRand))) * 0.3000000);		
	}
	else
	{
		R.Yaw = int(float(int((float(-State.Recoil) * Params.XRandFactor) + (((float(State.Recoil) * Params.XRandFactor) * float(2)) * State.XRand))) * 0.3000000);
		R.Pitch = int(float(int((float(-State.Recoil) * Params.YRandFactor) + (((float(State.Recoil) * Params.YRandFactor) * float(2)) * State.YRand))) * 0.3000000);
	}
	// End:0x24E
	if(BW.bScopeView && bUseAltSightCurve)
	{
		R.Yaw += int(Params.EvaluateXRecoilAlt(float(State.Recoil)));
		R.Pitch += int(Params.EvaluateYRecoilAlt(float(State.Recoil)));		
	}
	else
	{
		R.Yaw += int(Params.EvaluateXRecoil(float(State.Recoil)));
		R.Pitch += int(Params.EvaluateYRecoil(float(State.Recoil)));
	}
	// End:0x2CC
	if(BW.Handedness() < 0)
	{
		R.Yaw = -R.Yaw;
	}
	R *= Class'BCoreProV55.BallisticReplicationInfo'.default.RecoilScale;
	return R;
	//return;	
}

final function bool BotShouldFire(float dist)
{
	// End:0x78
	if(((float(Current.Recoil) * Params.YawFactor) > (float(100) * (float(1) + (float(4000) / dist)))) || (float(Current.Recoil) * Params.PitchFactor) > (float(100) * (float(1) + (float(4000) / dist))))
	{
		return false;
	}
	return true;
	//return;	
}

final function ReceiveNetRecoil(int Pitch, int Yaw, float shift_time)
{
	StartPivot = CurrentPivot;
	TargetPivot.Pitch = Pitch;
	TargetPivot.Yaw = Yaw;
	AdjustmentPhase = 0.0000000;
	AdjustmentTime = shift_time;
	// End:0x63
	if(TargetPivot != rot(0, 0, 0))
	{
		MoveState = 1;		
	}
	else
	{
		MoveState = 2;
	}
	//return;	
}

final function int DrawDebug(Canvas Canvas, int YPos, int YL)
{
	Canvas.DrawText(((((((((((((((((((((((("Recoil: " $ string(Current.Recoil)) $ "/") $ string(MaxRecoil)) $ ", XRand ") $ string(Current.XRand)) $ ", YRand ") $ string(Current.YRand)) $ " (Lerp ") $ string(Start.Recoil)) $ "-") $ string(Target.Recoil)) $ ", XRand ") $ string(Start.XRand)) $ "-") $ string(Target.XRand)) $ ", YRand ") $ string(Start.YRand)) $ "-") $ string(Target.YRand)) $ ", Time ") $ string(AdjustmentTime)) $ ", Phase ") $ string(AdjustmentPhase)) $ ")");
	YPos += YL;
	Canvas.SetPos(4.0000000, float(YPos));
	Canvas.DrawText(((((((((((((((("Pivot: (" $ string(CurrentPivot.Pitch)) $ ", ") $ string(CurrentPivot.Yaw)) $ "), Start: (") $ string(StartPivot.Pitch)) $ ", ") $ string(StartPivot.Yaw)) $ "), Target: (") $ string(TargetPivot.Pitch)) $ ", ") $ string(TargetPivot.Yaw)) $ "), Last: (") $ string(LastPivot.Pitch)) $ ", ") $ string(LastPivot.Yaw)) $ ")");
	YPos += YL;
	Canvas.SetPos(4.0000000, float(YPos));
	Canvas.DrawText((((((((("State: " $ string(GetEnum(Enum'BCoreProV55.RecoilComponent.ERecoilState', int(MoveState)))) $ ", Should Shift: ") $ string(ShouldShift())) $ ", ViewBindFactor: Cur ") $ string(ViewBindFactor)) $ ", Hip ") $ string(Params.ViewBindFactor)) $ ", ADS ") $ string(Params.ADSViewBindFactor));
	return YPos;
	//return;	
}

