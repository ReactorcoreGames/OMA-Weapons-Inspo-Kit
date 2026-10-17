class GASCPrimaryFire extends BallisticProInstantFire;

function PlayFiring()
{
	// End:0x5C
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		BW.IdleAnim = 'IdleOpen';
		BW.ReloadAnim = 'ReloadOpen';
		AimedFireAnim = 'SightFireOpen';
		FireAnim = 'FireOpen';		
	}
	else
	{
		BW.IdleAnim = 'Idle';
		BW.ReloadAnim = 'Reload';
		AimedFireAnim = 'SightFire';
		FireAnim = 'Fire';
	}
	super(BallisticFire).PlayFiring();
	//return;	
}

function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	super(BallisticInstantFire).ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0xC1
	if(Victim.bProjTarget && Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena())
	{
		// End:0x8F
		if(BallisticShield(Victim) != none)
		{
			BW.TargetedHurtRadius(2.0000000, 64.0000000, Class'BWBP_APC_Pro.DTGASCPistol', 50.0000000, HitLocation, Pawn(Victim));			
		}
		else
		{
			BW.TargetedHurtRadius(2.0000000, 64.0000000, Class'BWBP_APC_Pro.DTGASCPistol', 50.0000000, HitLocation, Pawn(Victim));
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
	// End:0xF1
	if((Other == none) || Other.bWorldGeometry)
	{
		BW.TargetedHurtRadius(2.0000000, 64.0000000, Class'BWBP_APC_Pro.DTGASCPistol', 50.0000000, HitLocation);
	}
	SendFireEffect(Other, HitLocation, HitNormal, Surf, WaterHitLoc);
	// End:0x12C
	if(!bAISilent)
	{
		Instigator.MakeNoise(1.0000000);
	}
	return true;
	//return;	
}

defaultproperties
{
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=512.0000000,Max=1536.0000000)
	WallPenetrationForce=8.0000000
	Damage=26.0000000
	RangeAtten=0.2000000
	WaterRangeAtten=0.5000000
	DamageType=Class'BWBP_APC_Pro.DTGASCPistol'
	DamageTypeHead=Class'BWBP_APC_Pro.DTGASCPistolHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTGASCPistol'
	PenetrateForce=150
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	BrassOffset=(X=-10.0000000,Y=0.0000000,Z=0.0000000)
	MuzzleFlashClass=Class'BWBP_APC_Pro.GASCFlashEmitter'
	FlashScaleFactor=0.1000000
	AimedFireAnim="SightFire"
	FireRecoil=64.0000000
	XInaccuracy=32.0000000
	YInaccuracy=32.0000000
	BallisticFireSound=(Sound=Sound'BWBP_APC_Sounds.GASC.GASC-Fire',Volume=0.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireAnimRate=1.4500000
	FireRate=0.0950000
	AmmoClass=Class'BWBP_APC_Pro.Ammo_GASCClip'
	ShakeRotMag=(X=64.0000000,Y=32.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.3000000
}
