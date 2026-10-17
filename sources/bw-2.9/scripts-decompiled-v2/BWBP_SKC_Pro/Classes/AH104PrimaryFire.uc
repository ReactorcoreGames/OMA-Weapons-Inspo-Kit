class AH104PrimaryFire extends BallisticInstantFire;

var() Sound FireSound1;
var() Sound FireSound2;
var() int SplashDamage;
var() int SplashDamageRadius;

simulated event ModeDoFire()
{
	// End:0x2A
	if(AH104Pistol(Weapon).bFiresound1)
	{
		BallisticFireSound.Sound = FireSound1;		
	}
	else
	{
		// End:0x51
		if(AH104Pistol(Weapon).bFiresound2)
		{
			BallisticFireSound.Sound = FireSound2;
		}
	}
	super(BallisticFire).ModeDoFire();
	//return;	
}

function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	super.ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x79
	if((Victim != none) && Victim.bProjTarget)
	{
		BW.TargetedHurtRadius(float(SplashDamage), float(SplashDamageRadius), Class'BWBP_SKC_Pro.DT_AH104Pistol', 200.0000000, HitLocation, Pawn(Victim));
	}
	//return;	
}

simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
{
	// End:0x4B
	if((Other == none) || Other.bWorldGeometry)
	{
		BW.TargetedHurtRadius(float(SplashDamage), float(SplashDamageRadius), DamageType, 0.0000000, HitLocation);
	}
	return super.ImpactEffect(HitLocation, HitNormal, HitMat, Other, WaterHitLoc);
	//return;	
}

defaultproperties
{
	FireSound1=Sound'BWBP_SKC_Sounds.AH104.AH104-Blast2'
	FireSound2=Sound'BWBP_SKC_Sounds.AH104.AH104-Blast'
	SplashDamage=10
	SplashDamageRadius=32
	TraceRange=(Min=6000.0000000,Max=6500.0000000)
	DamageType=Class'BWBP_SKC_Pro.DT_AH104Pistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AH104PistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AH104Pistol'
	KickForce=35000
	PenetrateForce=250
	bPenetrate=true
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8000000
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	BrassBone="tip"
	BrassOffset=(X=-30.0000000,Y=1.0000000,Z=0.0000000)
	bDryUncock=true
	DryFireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-DryFire',Volume=1.0000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
	FlashScaleFactor=1.1000000
	AimedFireAnim="SightFire"
	FireChaos=-10.0000000
	XInaccuracy=3.0000000
	YInaccuracy=3.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-Super',Volume=7.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_600HEAP'
	ShakeRotMag=(X=64.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=960.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-400.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
}
