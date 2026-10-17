class ProjectileEffectParams extends FireEffectParams
	editinlinenew;

enum ERadiusFallOffType
{
	RFO_Linear,                     // 0
	RFO_Quadratic,                  // 1
	RFO_None                        // 2
};

var() Class<BallisticProjectile> ProjectileClass;
var() Vector SpawnOffset;
var() float Speed;
var() float MaxSpeed;
var() float AccelSpeed;
var() float Damage;
var() float DamageRadius;
var() float DamageSpecial;
var() float MomentumTransfer;
var() bool bLimitMomentumZ;
var() float HeadMult;
var() float LimbMult;
var() float MaxDamageGainFactor;
var() float DamageGainStartTime;
var() float DamageGainEndTime;
var() ProjectileEffectParams.ERadiusFallOffType RadiusFallOffType;

static simulated function Initialize(BallisticWeapon BW)
{
	//return;	
}

function FireModeStats GetStats()
{
	local FireModeStats FS;

	FS = super.GetStats();
	FS.DamageInt = int(Damage);
	FS.Damage = string(FS.DamageInt);
	// End:0x71
	if(DamageGainEndTime > float(0))
	{
		FS.Damage @= ("-" @ string(int(float(FS.DamageInt) * (float(1) + MaxDamageGainFactor))));
	}
	FS.HeadMult = HeadMult;
	FS.LimbMult = LimbMult;
	// End:0xCF
	if(DamageGainEndTime > float(0))
	{
		FS.RangeOpt = ("Ramp: " @ string(DamageGainEndTime + DamageGainStartTime)) @ "seconds";		
	}
	else
	{
		FS.RangeOpt = ("Maximum:" @ string(int(float(10000) / 52.5000000))) @ "m";
	}
	return FS;
	//return;	
}

defaultproperties
{
	HeadMult=2.0000000
	LimbMult=0.7500000
	RadiusFallOffType=1
	ShotTypeString="shots"
}
