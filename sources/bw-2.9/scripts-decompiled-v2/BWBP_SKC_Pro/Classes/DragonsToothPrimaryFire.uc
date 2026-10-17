class DragonsToothPrimaryFire extends BallisticMeleeFire;

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
	SliceAnims[0]="Swing1"
	SliceAnims[1]="Swing2"
	SliceAnims[2]="Swing3"
	SwipePoints[0]=(Weight=3,offset=(Pitch=0,Yaw=1280,Roll=0))
	SwipePoints[1]=(Weight=5,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[2]=(Weight=6,offset=(Pitch=0,Yaw=-1280,Roll=0))
	SwipePoints[3]=(Weight=4,offset=(Pitch=0,Yaw=-1280,Roll=0))
	SwipePoints[4]=(Weight=2,offset=(Pitch=0,Yaw=-2560,Roll=0))
	WallHitPoint=1
	NumSwipePoints=3
	FatiguePerStrike=0.1000000
	TraceRange=(Min=175.0000000,Max=175.0000000)
	DamageType=Class'BWBP_SKC_Pro.DT_DTSStabChest'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_DTSStabHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_DTSStabChest'
	KickForce=100
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.DTS.DragonsTooth-Swipe',Volume=4.1000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	FireAnim="Stab"
	AmmoClass=Class'BallisticProV55.Ammo_Knife'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=256.0000000,Z=0.0000000)
	ShakeRotRate=(X=3000.0000000,Y=3000.0000000,Z=3000.0000000)
	ShakeRotTime=2.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.8000000
}
