class EKS43PrimaryFire extends BallisticMeleeFire;

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
	FatiguePerStrike=0.0600000
	bCanBackstab=false
	TraceRange=(Min=165.0000000,Max=165.0000000)
	DamageType=Class'BallisticProV55.DTEKS43Katana'
	DamageTypeHead=Class'BallisticProV55.DTEKS43KatanaHead'
	DamageTypeArm=Class'BallisticProV55.DTEKS43KatanaLimb'
	KickForce=100
	BallisticFireSound=(Sound=SoundGroup'BW_Core_WeaponSound.EKS43.EKS-Slash',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	FireAnim="Slash1"
	FireRate=0.7500000
	AmmoClass=Class'BallisticProV55.Ammo_Knife'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=512.0000000,Z=0.0000000)
	ShakeRotRate=(X=3000.0000000,Y=3000.0000000,Z=3000.0000000)
	ShakeRotTime=2.5000000
	BotRefireRate=0.9900000
	WarnTargetPct=0.3000000
}
