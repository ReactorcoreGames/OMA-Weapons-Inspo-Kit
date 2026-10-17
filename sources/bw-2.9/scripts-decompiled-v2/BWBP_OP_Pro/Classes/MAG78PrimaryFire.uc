class MAG78PrimaryFire extends BallisticMeleeFire;

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
	FatiguePerStrike=0.0640000
	bCanBackstab=false
	KickForce=100
	bAISilent=true
	AmmoClass=Class'BWBP_OP_Pro.Ammo_MAGSAWCharge'
	ShakeRotMag=(X=64.0000000,Y=512.0000000,Z=0.0000000)
	ShakeRotRate=(X=3000.0000000,Y=3000.0000000,Z=3000.0000000)
	ShakeRotTime=2.5000000
}
