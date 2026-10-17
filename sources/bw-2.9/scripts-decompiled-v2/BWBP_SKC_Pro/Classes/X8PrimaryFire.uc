class X8PrimaryFire extends BallisticMeleeFire;

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
	SwipePoints[0]=(Weight=3,offset=(Pitch=2000,Yaw=4000,Roll=0))
	SwipePoints[1]=(Weight=5,offset=(Pitch=1000,Yaw=1280,Roll=0))
	SwipePoints[2]=(Weight=6,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[3]=(Weight=4,offset=(Pitch=1000,Yaw=-2000,Roll=0))
	SwipePoints[4]=(Weight=2,offset=(Pitch=2000,Yaw=-4000,Roll=0))
	SwipePoints[5]=(Weight=-1,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[6]=(Weight=-1,offset=(Pitch=0,Yaw=0,Roll=0))
	FatiguePerStrike=0.0350000
	bCanBackstab=false
	TraceRange=(Min=130.0000000,Max=130.0000000)
	DamageType=Class'BWBP_SKC_Pro.DTX8Knife'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTX8Knife'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTX8Knife'
	KickForce=100
	BallisticFireSound=(Sound=SoundGroup'BW_Core_WeaponSound.X4.X4_Melee',Volume=0.5000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	FireAnim="Slash1"
	FireRate=0.3000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_X8Knife'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=128.0000000,Z=0.0000000)
	ShakeRotRate=(X=2500.0000000,Y=2500.0000000,Z=2500.0000000)
	ShakeRotTime=2.5000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
}
