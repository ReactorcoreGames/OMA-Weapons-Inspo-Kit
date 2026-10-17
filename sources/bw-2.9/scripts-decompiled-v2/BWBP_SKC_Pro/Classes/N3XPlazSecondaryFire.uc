class N3XPlazSecondaryFire extends BallisticMeleeFire;

var() float MinDamage;
var() float MaxDamage;

function ApplyDamage(Actor Target, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	Damage = int(FClamp(MinDamage, MinDamage + ((N3XPlaz(BW).HeatLevel * (MaxDamage - MinDamage)) / N3XPlaz(BW).MaxHeat), MaxDamage));
	super(BallisticInstantFire).ApplyDamage(Target, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	//return;	
}

defaultproperties
{
	MinDamage=70.0000000
	MaxDamage=150.0000000
	FatiguePerStrike=0.4000000
	bCanBackstab=false
	DamageType=Class'BWBP_SKC_Pro.DTShockN3XAlt'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTShockN3XAlt'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTShockN3XAlt'
	KickForce=500
	bUseWeaponMag=false
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=SoundGroup'BW_Core_WeaponSound.MRS38.RSS-ElectroSwing',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	bFireOnRelease=true
	PreFireAnim="PrepHack"
	FireAnim="Hack"
	FireAnimRate=1.5000000
	FireRate=1.2000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_N3XCharge'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=384.0000000,Z=0.0000000)
	ShakeRotRate=(X=3500.0000000,Y=3500.0000000,Z=3500.0000000)
	ShakeRotTime=2.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
}
