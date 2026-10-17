class BulldogPrimaryFire extends BallisticProInstantFire;

var() Class<Actor> AltBrassClass1;
var() Class<Actor> AltBrassClass2;
var bool bSmallRadiusDamage;
var bool bLargeRadiusDamage;

simulated function bool AllowFire()
{
	// End:0x0D
	if(!CheckReloading())
	{
		return false;
	}
	// End:0x1A
	if(!CheckWeaponMode())
	{
		return false;
	}
	// End:0x10E
	if(BW.MagAmmo < AmmoPerFire)
	{
		// End:0xAE
		if(!bPlayedDryFire && DryFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
			bPlayedDryFire = true;
		}
		// End:0xC8
		if(bDryUncock)
		{
			BW.bNeedCock = true;
		}
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), 0.0000000);
		BW.EmptyFire(byte(ThisModeNum));
		return false;		
	}
	else
	{
		// End:0x125
		if(BW.bNeedReload)
		{
			return false;			
		}
		else
		{
			// End:0x154
			if(BW.bNeedCock || !BulldogAssaultCannon(BW).bAltNeedCock)
			{
				return false;
			}
		}
	}
	return true;
	//return;	
}

function EjectFRAGBrass()
{
	local Vector Start, X, Y, Z;
	local Coords C;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x4C
	if(!Class'BCoreProV55.BallisticMod'.default.bEjectBrass || int(Level.DetailMode) < int(1))
	{
		return;
	}
	// End:0x59
	if(BrassClass == none)
	{
		return;
	}
	// End:0x97
	if(!Instigator.IsFirstPerson() || PlayerController(Instigator.Controller).ViewTarget != Instigator)
	{
		return;
	}
	// End:0xB2
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	C = Weapon.GetBoneCoords(BrassBone);
	Weapon.GetViewAxes(X, Y, Z);
	Start = ((C.Origin + (X * BrassOffset.X)) + (Y * BrassOffset.Y)) + (Z * BrassOffset.Z);
	Spawn(AltBrassClass2, Weapon,, Start, Rotator(C.XAxis));
	//return;	
}

function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	super(BallisticInstantFire).ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0xBE
	if((Victim != none) && Victim.bProjTarget)
	{
		// End:0x8A
		if(BallisticShield(Victim) != none)
		{
			BW.TargetedHurtRadius(float(Damage), 48.0000000, Class'BWBP_SKC_Pro.DTBulldog', 500.0000000, HitLocation, Pawn(Victim));			
		}
		else
		{
			BW.TargetedHurtRadius(float(Damage), 96.0000000, Class'BWBP_SKC_Pro.DTBulldog', 500.0000000, HitLocation, Pawn(Victim));
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
	if(bSmallRadiusDamage && (Other == none) || Other.bWorldGeometry)
	{
		BW.TargetedHurtRadius(30.0000000, 96.0000000, Class'BWBP_SKC_Pro.DTBulldog', 500.0000000, HitLocation);
	}
	// End:0x14E
	if(bLargeRadiusDamage && (Other == none) || Other.bWorldGeometry)
	{
		BW.TargetedHurtRadius(35.0000000, 160.0000000, Class'BWBP_SKC_Pro.DTBulldog', 500.0000000, HitLocation);
	}
	SendFireEffect(Other, HitLocation, HitNormal, Surf, WaterHitLoc);
	// End:0x189
	if(!bAISilent)
	{
		Instigator.MakeNoise(1.0000000);
	}
	return true;
	//return;	
}

defaultproperties
{
	AltBrassClass1=Class'BWBP_SKC_Pro.Brass_FRAGSpent'
	AltBrassClass2=Class'BWBP_SKC_Pro.Brass_FRAG'
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	DamageType=Class'BWBP_SKC_Pro.DTBulldog'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTBulldogHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTBulldog'
	KickForce=1000
	PenetrateForce=250
	bPenetrate=true
	BrassClass=Class'BWBP_SKC_Pro.Brass_BOLT'
	BrassOffset=(X=-30.0000000,Y=1.0000000,Z=0.0000000)
	bDryUncock=true
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
	FlashScaleFactor=1.1000000
	AimedFireAnim="SightFire"
	FireRecoil=1280.0000000
	FirePushbackForce=3000.0000000
	FireChaos=1.0000000
	BallisticFireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.Bulldog.Bulldog-Fire',Volume=7.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireAnimRate=2.0000000
	FireRate=0.8500000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_75BOLT'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-25.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-500.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
}
