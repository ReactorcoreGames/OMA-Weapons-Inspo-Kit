class SandbagMeleeFire extends BallisticMeleeFire;

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
	bCanBackstab=false
	TraceRange=(Min=130.0000000,Max=130.0000000)
	Damage=140.0000000
	DamageType=Class'BallisticProV55.DTX4Knife'
	DamageTypeHead=Class'BallisticProV55.DTX4KnifeHead'
	DamageTypeArm=Class'BallisticProV55.DTX4KnifeLimb'
	KickForce=100
	BallisticFireSound=(Sound=SoundGroup'BW_Core_WeaponSound.X4.X4_Melee',Volume=1.0000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	FireAnim="Slash1"
	FireAnimRate=1.5000000
	FireRate=0.4000000
	AmmoClass=Class'BallisticProV55.Ammo_X4Knife'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=128.0000000,Z=0.0000000)
	ShakeRotRate=(X=2500.0000000,Y=2500.0000000,Z=2500.0000000)
	ShakeRotTime=2.5000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
}
