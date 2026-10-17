class CYLOPrimaryFire extends BallisticProInstantFire;

var bool bVariableFirerate;
var bool bCanOverheat;
var bool bRadiusDamage;
var bool bPlayerRadiusDamage;

simulated function bool AllowFire()
{
	// End:0x36
	if((bCanOverheat && CYLOUAW(Weapon).HeatLevel >= float(12)) || !super(BallisticFire).AllowFire())
	{
		return false;
	}
	return true;
	//return;	
}

function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	// End:0x28
	if(bCanOverheat)
	{
		CYLOUAW(BW).AddHeat(HeatPerShot);
	}
	//return;	
}

function DoFireEffect()
{
	super(BallisticInstantFire).DoFireEffect();
	// End:0x43
	if((int(Level.NetMode) == int(NM_DedicatedServer)) && bCanOverheat)
	{
		CYLOUAW(BW).AddHeat(HeatPerShot);
	}
	//return;	
}

function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	super(BallisticInstantFire).ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0xC9
	if(((Victim != none) && Victim.bProjTarget) && bPlayerRadiusDamage)
	{
		// End:0x95
		if(BallisticShield(Victim) != none)
		{
			BW.TargetedHurtRadius(float(Damage), 210.0000000, Class'BWBP_SKC_Pro.DTCYLOFirestormExplosion', 200.0000000, HitLocation, Pawn(Victim));			
		}
		else
		{
			BW.TargetedHurtRadius(float(Damage), 420.0000000, Class'BWBP_SKC_Pro.DTCYLOFirestormExplosion', 200.0000000, HitLocation, Pawn(Victim));
		}
	}
	//return;	
}

simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
{
	local int Surf;

	// End:0x55
	if(((!Other.bWorldGeometry && Mover(Other) == none) && Pawn(Other) == none) || int(Level.NetMode) == int(NM_Client))
	{
		return false;
	}
	// End:0x70
	if(Vehicle(Other) != none)
	{
		Surf = 3;		
	}
	else
	{
		// End:0x94
		if(HitMat == none)
		{
			Surf = int(Other.SurfaceType);			
		}
		else
		{
			Surf = int(HitMat.SurfaceType);
		}
	}
	// End:0xFC
	if(bRadiusDamage && (Other == none) || Other.bWorldGeometry)
	{
		BW.TargetedHurtRadius(2.0000000, 64.0000000, Class'BWBP_SKC_Pro.DTCYLOFirestormRifle', 50.0000000, HitLocation);
	}
	SendFireEffect(Other, HitLocation, HitNormal, Surf, WaterHitLoc);
	// End:0x137
	if(!bAISilent)
	{
		Instigator.MakeNoise(1.0000000);
	}
	return true;
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x71
	if(bVariableFirerate)
	{
		// End:0x44
		if(int(Level.NetMode) == int(NM_Standalone))
		{
			FireRate = Params.FireInterval + (FRand() * 0.1500000);			
		}
		else
		{
			CYLOUAW(BW).SetFireRate(Params.FireInterval + (FRand() * 0.1500000));
		}
	}
	super.ModeDoFire();
	//return;	
}

defaultproperties
{
	TraceRange=(Min=8000.0000000,Max=12000.0000000)
	DamageType=Class'BWBP_SKC_Pro.DTCYLORifle'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTCYLORifleHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTCYLORifle'
	PenetrateForce=180
	bPenetrate=true
	RunningSpeedThresh=1000.0000000
	FlashBone="Muzzle"
	bCockAfterEmpty=true
	ClipFinishSound=(Sound=Sound'BW_Core_WeaponSound.Misc.ClipEnd-1',Volume=0.8000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.Misc.DryRifle',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.5000000
	FireRecoil=220.0000000
	FireChaos=0.0320000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.1600000,OutVal=1.0000000),(InVal=0.2500000,OutVal=1.5000000),(InVal=0.5000000,OutVal=2.2500000),(InVal=0.7500000,OutVal=3.5000000),(InVal=1.0000000,OutVal=5.0000000)))
	XInaccuracy=96.0000000
	YInaccuracy=96.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-Fire',Volume=1.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	HeatPerShot=0.9000000
	UnjamMethod=4
	JamSound=(Sound=Sound'BW_Core_WeaponSound.Misc.DryRifle',Volume=0.9000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bPawnRapidFireAnim=true
	PreFireAnim="None"
	FireEndAnim="None"
	FireRate=0.1050000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_CYLO'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-100.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	WarnTargetPct=0.2000000
	aimerror=900.0000000
}
