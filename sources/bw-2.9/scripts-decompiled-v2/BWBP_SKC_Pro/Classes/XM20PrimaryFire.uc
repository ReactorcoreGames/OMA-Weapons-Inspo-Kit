class XM20PrimaryFire extends BallisticProInstantFire;

simulated function bool AllowFire()
{
	// End:0x19
	if(XM20Carbine(BW).bShieldUp)
	{
		return false;
	}
	// End:0x40
	if(super(BallisticFire).AllowFire())
	{
		// End:0x3E
		if(XM20Carbine(BW).bIsCharging)
		{
			return false;			
		}
		else
		{
			return true;
		}
	}
	return super(BallisticFire).AllowFire();
	//return;	
}

function ApplyDamage(Actor Target, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	// End:0x55
	if((Pawn(Target) != none) && Pawn(Target).bProjTarget)
	{
		Damage += XM20Carbine(BW).ManageHeatInteraction(Pawn(Target), int(HeatPerShot));
	}
	// End:0x74
	if(Monster(Target) != none)
	{
		Damage = Min(Damage, 35);
	}
	super(BallisticInstantFire).ApplyDamage(Target, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	//return;	
}

defaultproperties
{
	TraceRange=(Min=5000.0000000,Max=7500.0000000)
	MaxWaterTraceRange=5000.0000000
	DamageType=Class'BWBP_SKC_Pro.DT_XM20_Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_XM20_Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_XM20_Body'
	PenetrateForce=600
	MuzzleFlashClass=Class'BWBP_SKC_Pro.XM20FlashEmitter'
	FlashScaleFactor=0.3000000
	AimedFireAnim="SightFire"
	FireRecoil=96.0000000
	YInaccuracy=16.0000000
	BallisticFireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.XM20.XM20-PulseFire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	HeatPerShot=8.0000000
	FireEndAnim="None"
	FireRate=0.1500000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_Laser'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-70.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
	aimerror=800.0000000
}
