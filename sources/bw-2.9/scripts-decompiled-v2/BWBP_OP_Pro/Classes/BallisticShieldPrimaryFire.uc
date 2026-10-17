class BallisticShieldPrimaryFire extends BallisticMeleeFire;

var() array<name> SliceAnims;
var int SliceAnim;

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
	SliceAnims[0]="Smash2"
	SliceAnims[1]="Smash1"
	SliceAnims[2]="Bash1"
	SliceAnims[3]="Smash3"
	FatiguePerStrike=0.1500000
	TraceRange=(Min=140.0000000,Max=140.0000000)
	DamageType=Class'BWBP_OP_Pro.DTBallisticShield'
	DamageTypeHead=Class'BWBP_OP_Pro.DTBallisticShield'
	DamageTypeArm=Class'BWBP_OP_Pro.DTBallisticShield'
	KickForce=13000
	HookStopFactor=1.7000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Swing',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	FireAnim="Bash1"
	FireRate=0.7500000
	AmmoClass=Class'BallisticProV55.Ammo_Knife'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=512.0000000,Z=0.0000000)
	ShakeRotRate=(X=3000.0000000,Y=3000.0000000,Z=3000.0000000)
	ShakeRotTime=2.5000000
	BotRefireRate=0.9900000
	WarnTargetPct=0.3000000
}
