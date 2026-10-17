class FireParams extends Object;

const DEFAULT_TIME_DILATION = 1.1f;

var() float FireInterval;
var() int AmmoPerFire;
var() float PreFireTime;
var() float MaxHoldTime;
var() name TargetState;
var() string ModeName;
var() int MaxFireCount;
var() float BurstFireRateFactor;
var() bool bCockAfterFire;
var() name PreFireAnim;
var() name FireAnim;
var() name FireLoopAnim;
var() name FireEndAnim;
var() float PreFireAnimRate;
var() float FireAnimRate;
var() float FireLoopAnimRate;
var() float FireEndAnimRate;
var() name AimedFireAnim;
var() editinline array<editinline FireEffectParams> FireEffectParams;

static final simulated function Initialize(BallisticWeapon BW, int ModeIndex, int AmmoIndex)
{
	//return;	
}

final function string BuildShortManualString()
{
	local FireModeStats FS;
	local string S;

	FS = FireEffectParams[0].GetStats();
	S = ((((("Damage: Body " $ string(FS.DamageInt)) $ ", Head ") $ string(int(float(FS.DamageInt) * FS.HeadMult))) $ ", Limb ") $ string(int(float(FS.DamageInt) * FS.LimbMult))) $ "|Fire Rate:  ";
	// End:0xDB
	if(FireInterval < 0.4000000)
	{
		S $= (string(int(((float(1) / FireInterval) * float(60)) * 1.1000000)) $ "RPM|");		
	}
	else
	{
		S $= ((string((float(1) / FireInterval) * 1.1000000) @ FS.ShotTypeString) $ "/second|");
	}
	S $= (("Recoil: " $ string(FS.RPShot)) $ "|");
	// End:0x16A
	if(Len(FS.RangeMax) != 0)
	{
		S $= (("Range: " $ FS.RangeMax) $ "|");
	}
	return S;
	//return;	
}

final function FireModeStats GetStats()
{
	local FireModeStats FS;

	FS = FireEffectParams[0].GetStats();
	FS.DPS = int(float(int(float(FS.DamageInt) / FireInterval)) * 1.1000000);
	// End:0x88
	if(FS.DamageInt > 0)
	{
		FS.TTK = (FireInterval * (Ceil(175.0000000 / float(FS.DamageInt)) - float(1))) / 1.1000000;		
	}
	else
	{
		FS.TTK = 0.0000000;
	}
	// End:0xD7
	if(FireInterval < 0.4000000)
	{
		FS.RPM = string(int(((float(1) / FireInterval) * float(60)) * 1.1000000)) $ "RPM";		
	}
	else
	{
		FS.RPM = (string((float(1) / FireInterval) * 1.1000000) @ FS.ShotTypeString) $ "/second";
	}
	FS.RPS = int(float(int(float(FS.RPShot) / FireInterval)) * 1.1000000);
	FS.FCPS = (FS.FCPShot / FireInterval) * 1.1000000;
	return FS;
	//return;	
}

defaultproperties
{
	FireInterval=0.5000000
	AmmoPerFire=1
	BurstFireRateFactor=0.6500000
	PreFireAnim="PreFire"
	FireAnim="Fire"
	FireLoopAnim="FireLoop"
	FireEndAnim="FireEnd"
	PreFireAnimRate=1.0000000
	FireAnimRate=1.0000000
	FireLoopAnimRate=1.0000000
	FireEndAnimRate=1.0000000
}
