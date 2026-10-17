class HVPCMk5PrimaryFire extends BallisticProProjectileFire;

var float StopFireTime;
var byte ProjectileCount;
var float HipSpreadFactor;

simulated function float GetCrosshairInaccAngle()
{
	return (YInaccuracy * HipSpreadFactor) * 0.0000959;
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x45
	if(((HVPCMk5PlasmaCannon(BW).HeatLevel >= 11.5000000) || HVPCMk5PlasmaCannon(BW).bIsVenting) || !super(BallisticFire).AllowFire())
	{
		return false;
	}
	return true;
	//return;	
}

function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	// End:0x38
	if(!HVPCMk5PlasmaCannon(BW).bMilSpec)
	{
		HVPCMk5PlasmaCannon(BW).AddHeat(HeatPerShot);
	}
	//return;	
}

function StopFiring()
{
	bIsFiring = false;
	StopFireTime = Level.TimeSeconds;
	//return;	
}

static function FireModeStats GetStats()
{
	local FireModeStats FS;

	FS.DamageInt = int(default.ProjectileClass.default.Damage * float(default.ProjectileCount));
	FS.Damage = string(FS.DamageInt);
	FS.HeadMult = Class<BallisticProjectile>(default.ProjectileClass).default.HeadMult;
	FS.LimbMult = Class<BallisticProjectile>(default.ProjectileClass).default.LimbMult;
	FS.DPS = int((default.ProjectileClass.default.Damage * float(default.ProjectileCount)) / default.FireRate);
	FS.TTK = default.FireRate * (Ceil(175.0000000 / default.ProjectileClass.default.Damage) - float(1));
	FS.RPM = string(int((float(1) / default.FireRate) * float(60))) @ "shots/min";
	FS.RPShot = int(default.FireRecoil);
	FS.RPS = int(default.FireRecoil / default.FireRate);
	FS.FCPShot = default.FireChaos;
	FS.FCPS = default.FireChaos / default.FireRate;
	FS.RangeOpt = ("Max:" @ string(float(10000) / 52.5000000)) @ "metres";
	return FS;
	//return;	
}

simulated state SingleShot
{
	function DoFireEffect()
	{
		super(BallisticProjectileFire).DoFireEffect();
		// End:0x53
		if((int(Level.NetMode) == int(NM_DedicatedServer)) && !HVPCMk5PlasmaCannon(BW).bMilSpec)
		{
			HVPCMk5PlasmaCannon(BW).AddHeat(HeatPerShot);
		}
		//return;		
	}
	stop;	
}

simulated state SpreadShot
{
	function DoFireEffect()
	{
		local Vector StartTrace, X, Y, Z, Start, End,
			HitLocation, HitNormal;

		local Rotator Aim;
		local Actor Other;
		local int i;

		Weapon.GetViewAxes(X, Y, Z);
		Start = Instigator.Location + Instigator.EyePosition();
		StartTrace = (Start + (X * SpawnOffset.X)) + (Z * SpawnOffset.Z);
		// End:0xB6
		if(!Weapon.WeaponCentered())
		{
			StartTrace = StartTrace + ((Weapon.hand * Y) * SpawnOffset.Y);
		}
		i = 0;
		J0xBD:

		// End:0x16B [Loop If]
		if(i < int(ProjectileCount))
		{
			Aim = GetFireAim(StartTrace);
			Aim = Rotator((GetFireSpread()) >> Aim);
			End = Start + (Vector(Aim) * (MaxRange()));
			Other = Trace(HitLocation, HitNormal, End, Start, true);
			// End:0x151
			if(Other != none)
			{
				Aim = Rotator(HitLocation - StartTrace);
			}
			SpawnProjectile(StartTrace, Aim);
			i++;
			// [Loop Continue]
			goto J0xBD;
		}
		SendFireEffect(none, vect(0.0000000, 0.0000000, 0.0000000), StartTrace, 0);
		super(BallisticFire).DoFireEffect();
		// End:0x1D8
		if((int(Level.NetMode) == int(NM_DedicatedServer)) && !HVPCMk5PlasmaCannon(BW).bMilSpec)
		{
			HVPCMk5PlasmaCannon(BW).AddHeat(HeatPerShot);
		}
		//return;		
	}

	simulated function Vector GetFireSpread()
	{
		local float fX;
		local Rotator R;

		// End:0x30
		if(BW.bScopeView || BW.bAimDisabled)
		{
			return super(BallisticProProjectileFire).GetFireSpread();			
		}
		else
		{
			fX = FRand();
			R.Yaw = int(((XInaccuracy * HipSpreadFactor) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
			R.Pitch = int(((YInaccuracy * HipSpreadFactor) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
			return Vector(R);
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	ProjectileCount=3
	HipSpreadFactor=1.1000000
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	MuzzleFlashClass=Class'BallisticProV55.HVCMk9RedMuzzleFlash'
	FireRecoil=700.0000000
	FireChaos=0.4000000
	XInaccuracy=32.0000000
	YInaccuracy=32.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-Fire',Volume=2.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	HeatPerShot=1.5000000
	FireAnim="FireAlt"
	FireEndAnim="None"
	FireRate=0.7000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_HVPCCells'
	AmmoPerFire=5
	ShakeRotMag=(X=32.0000000,Y=8.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.5000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-300.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	ProjectileClass=Class'BWBP_SKC_Pro.HVPCMk5Projectile'
	WarnTargetPct=0.2000000
}
