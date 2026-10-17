class MRDRSecondaryFire extends BallisticMeleeFire;

var() array<name> SliceAnims;
var int SliceAnim;

function ServerPlayFiring()
{
	BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
	//return;	
}

function PlayFiring()
{
	// End:0x29
	if(int(ScopeDownOn) == int(1))
	{
		BW.TemporaryScopeDown(0.5000000, 0.9000000);
	}
	BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	//return;	
}

function NotifiedDoFireEffect()
{
	DoFireEffect();
	//return;	
}

function DoFireEffect()
{
	//return;	
}

simulated event ModeDoFire()
{
	FireAnim = SliceAnims[SliceAnim];
	SliceAnim++;
	// End:0x2F
	if(SliceAnim >= SliceAnims.Length)
	{
		SliceAnim = 0;
	}
	super.ModeDoFire();
	//return;	
}

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

defaultproperties
{
	SliceAnims[0]="Melee1"
	SliceAnims[1]="Melee2"
	FatiguePerStrike=0.0800000
	TraceRange=(Min=130.0000000,Max=130.0000000)
	DamageType=Class'BWBP_SKC_Pro.DT_MRDR88Spike'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MRDR88SpikeHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MRDR88Spike'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	bIgnoreReload=true
	bUseWeaponMag=false
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Swing',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	FireAnim="Melee1"
	FireRate=0.5000000
	AmmoClass=Class'BallisticProV55.Ammo_9mm'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=128.0000000,Z=0.0000000)
	ShakeRotRate=(X=2500.0000000,Y=2500.0000000,Z=2500.0000000)
	ShakeRotTime=2.5000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
}
