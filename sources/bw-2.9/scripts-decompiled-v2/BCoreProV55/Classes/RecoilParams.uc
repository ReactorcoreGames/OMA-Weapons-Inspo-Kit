class RecoilParams extends Object
	editinlinenew;

var() InterpCurve XCurve;
var() InterpCurve YCurve;
var() InterpCurve XCurveAlt;
var() InterpCurve YCurveAlt;
var() float PitchFactor;
var() float YawFactor;
var() float XRandFactor;
var() float YRandFactor;
var() float MinRandFactor;
var() float MaxRecoil;
var() float ClimbTime;
var() float DeclineTime;
var() float DeclineDelay;
var() float EscapeMultiplier;
var() float ViewBindFactor;
var() float ADSViewBindFactor;
var() float HipMultiplier;
var() float MaxMoveMultiplier;
var() float CrouchMultiplier;
var() bool bViewDecline;
var() bool bUseAltSightCurve;

final function float EvaluateXRecoil(float Recoil)
{
	return (MaxRecoil * InterpCurveEval(XCurve, Recoil / MaxRecoil)) * YawFactor;
	//return;	
}

final function float EvaluateYRecoil(float Recoil)
{
	return (MaxRecoil * InterpCurveEval(YCurve, Recoil / MaxRecoil)) * PitchFactor;
	//return;	
}

final function float EvaluateXRecoilAlt(float Recoil)
{
	return (MaxRecoil * InterpCurveEval(XCurveAlt, Recoil / MaxRecoil)) * YawFactor;
	//return;	
}

final function float EvaluateYRecoilAlt(float Recoil)
{
	return (MaxRecoil * InterpCurveEval(YCurveAlt, Recoil / MaxRecoil)) * PitchFactor;
	//return;	
}

defaultproperties
{
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	XCurveAlt=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurveAlt=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=1.0000000
	YawFactor=1.0000000
	MaxRecoil=4096.0000000
	DeclineTime=2.0000000
	DeclineDelay=0.3000000
	EscapeMultiplier=1.0000000
	ViewBindFactor=1.0000000
	ADSViewBindFactor=1.0000000
	HipMultiplier=1.0000000
	MaxMoveMultiplier=1.0000000
	CrouchMultiplier=1.0000000
}
