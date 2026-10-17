class ShotgunEffectParams extends InstantEffectParams
	editinlinenew;

var() int TraceCount;
var() Class<Emitter> TracerClass;
var() Class<BCImpactManager> ImpactManager;
var() bool bDoWaterSplash;
var() int MaxHits;
var() float HipSpreadFactor;

function FireModeStats GetStats()
{
	local FireModeStats FS;

	FS = super.GetStats();
	FS.DamageInt = Damage * TraceCount;
	// End:0x68
	if(RangeAtten < float(1))
	{
		FS.Damage = (string(FS.DamageInt) @ "-") @ string(int(float(FS.DamageInt) * RangeAtten));		
	}
	else
	{
		FS.Damage = string(FS.DamageInt);
	}
	return FS;
	//return;	
}

defaultproperties
{
	HipSpreadFactor=2.0000000
}
