class N3XPlazPrimaryFire extends BallisticMeleeFire;

var() float MinDamage;
var() float MaxDamage;
var() array<name> SliceAnims;
var int SliceAnim;

function ApplyDamage(Actor Target, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	Damage = int(FClamp(MinDamage, MinDamage + ((N3XPlaz(BW).HeatLevel * (MaxDamage - MinDamage)) / N3XPlaz(BW).MaxHeat), MaxDamage));
	super(BallisticInstantFire).ApplyDamage(Target, Damage, Instigator, HitLocation, MomentumDir, DamageType);
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
	MinDamage=40.0000000
	MaxDamage=100.0000000
	SliceAnims[0]="Swing1"
	SliceAnims[1]="Swing2"
	SliceAnims[2]="Swing4"
	SliceAnims[3]="Swing3"
	FatiguePerStrike=0.1500000
	DamageType=Class'BWBP_SKC_Pro.DTShockN3X'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTShockN3X'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTShockN3X'
	KickForce=20000
	bUseWeaponMag=false
	BallisticFireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.NEX.NEX-SlashAttack',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	FireAnim="Chop3"
	FireAnimRate=1.6500000
	FireRate=0.6000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_N3XCharge'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=384.0000000,Z=0.0000000)
	ShakeRotRate=(X=3500.0000000,Y=3500.0000000,Z=3500.0000000)
	ShakeRotTime=2.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
}
