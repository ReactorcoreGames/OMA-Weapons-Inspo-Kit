class GrenadeEffectParams extends ProjectileEffectParams
	editinlinenew;

enum EDetonateType
{
	DT_Timer,                       // 0
	DT_Impact,                      // 1
	DT_ImpactTimed,                 // 2
	DT_Still,                       // 3
	DT_Disarm,                      // 4
	DT_None                         // 5
};

enum EPlayerImpactType
{
	PIT_Bounce,                     // 0
	PIT_Detonate,                   // 1
	PIT_Stick                       // 2
};

var() float ImpactDamage;
var() bool bCombinedSplashImpact;
var() bool bOverrideArming;
var() float ArmingDelay;
var() float DetonateDelay;
var() GrenadeEffectParams.EDetonateType UnarmedDetonateOn;
var() GrenadeEffectParams.EDetonateType ArmedDetonateOn;
var() GrenadeEffectParams.EPlayerImpactType UnarmedPlayerImpactType;
var() GrenadeEffectParams.EPlayerImpactType ArmedPlayerImpactType;

defaultproperties
{
	ImpactDamage=1.0000000
}
