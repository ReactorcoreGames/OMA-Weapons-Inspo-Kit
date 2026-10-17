class FireEffectParams extends Object;

enum FireSpreadMode
{
	FSM_Rectangle,                  // 0
	FSM_Scatter,                    // 1
	FSM_Circle                      // 2
};

struct FireModeStats
{
	var string EffectString;
	var string ShotTypeString;
	var string Damage;
	var int DamageInt;
	var float HeadMult;
	var float LimbMult;
	var int DPS;
	var float TTK;
	var string RPM;
	var int RPShot;
	var int RPS;
	var float FCPShot;
	var float FCPS;
	var string RangeOpt;
	var string RangeDecayed;
	var string RangeMax;
};

var() Class<Actor> MuzzleFlashClass;
var() float FlashScaleFactor;
var() name FlashBone;
var() FullSound FireSound;
var() float Recoil;
var() float PushbackForce;
var() float Chaos;
var() float Heat;
var() IntVector2 Inaccuracy;
var() FireEffectParams.FireSpreadMode SpreadMode;
var() bool SplashDamage;
var() bool RecommendSplashDamage;
var() float BotRefireRate;
var() float WarnTargetPct;
var() string ShotTypeString;
var() string EffectString;

static simulated function Initialize(BallisticWeapon BW)
{
	//return;	
}

function FireModeStats GetStats()
{
	local FireModeStats FS;

	FS.EffectString = EffectString;
	FS.ShotTypeString = ShotTypeString;
	FS.RPShot = int(Recoil);
	FS.FCPShot = Chaos;
	return FS;
	//return;	
}

defaultproperties
{
	FlashScaleFactor=1.0000000
	FlashBone="tip"
	FireSound=(Sound=none,Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.9500000
	ShotTypeString="times"
	EffectString="Unknown"
}
