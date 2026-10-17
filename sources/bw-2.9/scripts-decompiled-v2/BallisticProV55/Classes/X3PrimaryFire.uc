class X3PrimaryFire extends BallisticMeleeFire;

var() array<name> SliceAnims;
var int SliceAnim;

simulated function bool AllowFire()
{
	// End:0x2D
	if(Level.TimeSeconds > X3Knife(Weapon).NextThrowTime)
	{
		return super.AllowFire();
	}
	return false;
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
	SliceAnims[0]="Slice1"
	SliceAnims[1]="Slice2"
	SliceAnims[2]="Slice3"
	SliceAnims[3]="Slice4"
	FatiguePerStrike=0.0350000
	bCanBackstab=false
	TraceRange=(Min=130.0000000,Max=130.0000000)
	DamageType=Class'BallisticProV55.DTX3Knife'
	DamageTypeHead=Class'BallisticProV55.DTX3KnifeHead'
	DamageTypeArm=Class'BallisticProV55.DTX3KnifeLimb'
	KickForce=100
	BallisticFireSound=(Sound=SoundGroup'BW_Core_WeaponSound.Knife.KnifeSlash',Volume=1.0000000,Radius=378.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	FireAnim="Slice1"
	FireAnimRate=1.8000000
	FireRate=0.2500000
	AmmoClass=Class'BallisticProV55.Ammo_X3Knife'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=128.0000000,Z=0.0000000)
	ShakeRotRate=(X=2500.0000000,Y=2500.0000000,Z=2500.0000000)
	ShakeRotTime=2.5000000
	BotRefireRate=0.9900000
	WarnTargetPct=0.3000000
}
