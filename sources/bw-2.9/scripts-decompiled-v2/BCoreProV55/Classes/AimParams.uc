class AimParams extends Object
	editinlinenew;

var() IntRange AimSpread;
var() float AimAdjustTime;
var() float OffsetAdjustTime;
var() float VelocityAimAdjustMult;
var() float CrouchMultiplier;
var() float ADSMultiplier;
var() Rotator SprintOffset;
var() Rotator JumpOffset;
var() float ViewBindFactor;
var() float ADSViewBindFactor;
var() float JumpChaos;
var() float FallingChaos;
var() float SprintChaos;
var() int AimDamageThreshold;
var() float ChaosDeclineTime;
var() float ChaosDeclineDelay;
var() int ChaosSpeedThreshold;
var() int ChaosTurnThreshold;

defaultproperties
{
	AimSpread=(Min=16,Max=128)
	AimAdjustTime=0.5000000
	OffsetAdjustTime=0.3000000
	VelocityAimAdjustMult=0.6700000
	CrouchMultiplier=0.8000000
	ADSMultiplier=1.0000000
	ADSViewBindFactor=1.0000000
	SprintChaos=0.1000000
	AimDamageThreshold=100
	ChaosDeclineTime=0.6400000
	ChaosSpeedThreshold=500
	ChaosTurnThreshold=131072
}
