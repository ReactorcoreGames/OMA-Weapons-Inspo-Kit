class AK91SecondaryFire extends BallisticShotgunFire;

simulated function bool AllowFire()
{
	// End:0x2C
	if((AK91ChargeRifle(BW).HeatLevel <= 5.0000000) || !super(BallisticFire).AllowFire())
	{
		return false;
	}
	return true;
	//return;	
}

function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	AK91ChargeRifle(BW).AddHeat(-10.0000000);
	//return;	
}

function DoFireEffect()
{
	local Vector Start;
	local Rotator Aim;

	Start = Instigator.Location + Instigator.EyePosition();
	Aim = GetFireAim(Start);
	Aim = Rotator((GetFireSpread()) >> Aim);
	AK91ChargeRifle(BW).ConicalBlast(Damage * float(2), 512.0000000, Vector(Aim));
	AK91ChargeRifle(BW).AddHeat(-100.0000000);
	super.DoFireEffect();
	//return;	
}

defaultproperties
{
	TraceCount=1
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Supercharge'
	TracerChance=1.0000000
	ImpactManager=Class'BWBP_SKC_Pro.IM_GRSXXLaser'
	TraceRange=(Min=600.0000000,Max=600.0000000)
	Damage=5.0000000
	RangeAtten=0.2000000
	DamageType=Class'BWBP_SKC_Pro.DTA49Shockwave'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTA49Shockwave'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTA49Shockwave'
	KickForce=12000
	PenetrateForce=100
	bPenetrate=true
	FlashBone="LAM"
	BrassOffset=(X=15.0000000,Y=-13.0000000,Z=7.0000000)
	bUseWeaponMag=false
	MuzzleFlashClass=Class'BWBP_SKC_Pro.A49FlashEmitter'
	FlashScaleFactor=1.2000000
	FireChaos=0.5000000
	XInaccuracy=2000.0000000
	YInaccuracy=2000.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.LightningGun.LG-SecFire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireAnim="AltFire"
	FireRate=1.7000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_AK762mm'
	AmmoPerFire=0
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-12.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
}
