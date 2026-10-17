class MeleeEffectParams extends InstantEffectParams
	editinlinenew;

var() float ChargeDamageBonusFactor;
var() float FlankDamageMult;
var() float BackDamageMult;
var() float Fatigue;

function FireModeStats GetStats()
{
	local FireModeStats FS;

	FS = super(FireEffectParams).GetStats();
	FS.DamageInt = default.Damage;
	// End:0x61
	if(ChargeDamageBonusFactor > float(1))
	{
		FS.Damage = (string(FS.DamageInt) @ "-") @ string(int(float(FS.DamageInt) * ChargeDamageBonusFactor));		
	}
	else
	{
		FS.Damage = string(FS.DamageInt);
	}
	FS.RangeOpt = ("Max range: " @ string(default.TraceRange.Max / 52.5000000)) @ "metres";
	return FS;
	//return;	
}

defaultproperties
{
	ChargeDamageBonusFactor=1.0000000
	FlankDamageMult=1.1500000
	BackDamageMult=1.3000000
	TraceRange=(Min=145.0000000,Max=145.0000000)
	Damage=50
	HeadMult=1.0000000
	LimbMult=1.0000000
	RunningSpeedThreshold=1000.0000000
	PDamageFactor=0.5000000
	ShotTypeString="attacks"
}
