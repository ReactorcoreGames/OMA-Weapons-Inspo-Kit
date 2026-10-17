class BlackOpsWristBladePrimaryFire extends BallisticMeleeFire;

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
	SliceAnims[0]="Slash1"
	SliceAnims[1]="Slash2"
	SliceAnims[2]="Slash3"
	SliceAnims[3]="Slash4"
	TraceRange=(Min=100.0000000,Max=100.0000000)
	Damage=60.0000000
	DamageType=Class'BWBP_SKC_Pro.DTBOBTorso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTBOBHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTBOBLimb'
	KickForce=100
	BallisticFireSound=(Sound=SoundGroup'BW_Core_WeaponSound.UZI.Melee',Volume=2.1000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	FireAnim="Slash1"
	FireAnimRate=0.9000000
	FireRate=0.7000000
	AmmoClass=Class'BallisticProV55.Ammo_Knife'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=256.0000000,Z=0.0000000)
	ShakeRotRate=(X=3000.0000000,Y=3000.0000000,Z=3000.0000000)
	ShakeRotTime=2.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
}
