class InstantEffectParams extends FireEffectParams
	editinlinenew;

var() Range TraceRange;
var() float WaterTraceRange;
var() Range DecayRange;
var() float RangeAtten;
var() int Damage;
var() float HeadMult;
var() float LimbMult;
var() Class<DamageType> DamageType;
var() Class<DamageType> DamageTypeHead;
var() Class<DamageType> DamageTypeArm;
var() int DamageSpecial;
var() bool UseRunningDamage;
var() float RunningSpeedThreshold;
var() float PenetrationEnergy;
var() int PenetrateForce;
var() bool bPenetrate;
var() float PDamageFactor;
var() float WallPDamageFactor;
var() int MomentumTransfer;
var() float HookStopFactor;
var() float HookPullForce;

static simulated function Initialize(BallisticWeapon BW)
{
	//return;	
}

function FireModeStats GetStats()
{
	local FireModeStats FS;
	local int opt_range, decayed_range, max_range;

	FS = super.GetStats();
	FS.DamageInt = Damage;
	// End:0x5C
	if(RangeAtten < float(1))
	{
		FS.Damage = (string(FS.DamageInt) @ "-") @ string(int(float(Damage) * RangeAtten));		
	}
	else
	{
		FS.Damage = string(FS.DamageInt);
	}
	FS.HeadMult = HeadMult;
	FS.LimbMult = LimbMult;
	FS.RangeOpt = ("Max range:" @ string(int(TraceRange.Max / 52.5000000))) @ "m";
	opt_range = int(DecayRange.Min / 52.5000000);
	decayed_range = int(DecayRange.Max / 52.5000000);
	max_range = int(TraceRange.Max / 52.5000000);
	FS.RangeOpt = ("Optimal:" @ string(opt_range)) $ "m";
	FS.RangeDecayed = ("Decayed:" @ string(decayed_range)) $ "m";
	FS.RangeMax = ("Maximum:" @ string(max_range)) $ "m";
	return FS;
	//return;	
}

defaultproperties
{
	TraceRange=(Min=5000.0000000,Max=5000.0000000)
	WaterTraceRange=128.0000000
	RangeAtten=1.0000000
	Damage=1
	HeadMult=2.0000000
	LimbMult=0.7500000
	RunningSpeedThreshold=300.0000000
	PDamageFactor=0.7500000
	WallPDamageFactor=0.9500000
	ShotTypeString="shots"
}
