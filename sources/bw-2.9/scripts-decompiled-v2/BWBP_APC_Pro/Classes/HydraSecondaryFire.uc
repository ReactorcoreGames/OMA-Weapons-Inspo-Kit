class HydraSecondaryFire extends BallisticProProjectileFire;

var() name ChargeAnim;
var float ChargeGainPerSecond;
var float ChargeDecayPerSecond;
var float ChargeOvertime;
var float MaxChargeOvertime;
var int SpawnCount;
var bool AmmoHasBeenCalculated;
var() Sound RocketCountSound;
var float NextBeepTime;
var int BeepCount;

simulated event ModeDoFire()
{
	load = float(CalculateAmmoUse());
	SpawnCount = int(load);
	AmmoHasBeenCalculated = true;
	super.ModeDoFire();
	//return;	
}

simulated function PlayStartHold()
{
	BW.bPreventReload = true;
	BW.SafeLoopAnim(ChargeAnim, 1.0000000, TweenTime,, "IDLE");
	//return;	
}

simulated function int CalculateAmmoUse()
{
	// End:0x37
	if(HydraBazooka(BW).MultiRockets >= float(BW.MagAmmo))
	{
		return BW.MagAmmo;
	}
	return Max(1, int(HydraBazooka(BW).MultiRockets));
	//return;	
}

simulated function ModeTick(float DeltaTime)
{
	// End:0x155
	if(bIsFiring)
	{
		// End:0x9C
		if((Level.TimeSeconds >= NextBeepTime) && BeepCount <= Min(BW.MagAmmo, int(Class'BWBP_APC_Pro.HydraBazooka'.default.MaxMultiRockets)))
		{
			// End:0x75
			if(BeepCount > 0)
			{
				Weapon.PlaySound(RocketCountSound,, 0.7000000,, 32.0000000);
			}
			NextBeepTime = Level.TimeSeconds + (float(1) / ChargeGainPerSecond);
			BeepCount++;
		}
		HydraBazooka(BW).MultiRockets = FMin(float(Min(BW.MagAmmo, int(Class'BWBP_APC_Pro.HydraBazooka'.default.MaxMultiRockets))), HydraBazooka(BW).MultiRockets + (ChargeGainPerSecond * DeltaTime));
		// End:0x13B
		if(HydraBazooka(BW).MultiRockets >= float(Min(BW.MagAmmo, int(Class'BWBP_APC_Pro.HydraBazooka'.default.MaxMultiRockets))))
		{
			ChargeOvertime += DeltaTime;
		}
		// End:0x152
		if(ChargeOvertime >= MaxChargeOvertime)
		{
			bIsFiring = false;
		}		
	}
	else
	{
		// End:0x1EC
		if((HydraBazooka(BW).MultiRockets > float(0)) && AmmoHasBeenCalculated)
		{
			HydraBazooka(BW).MultiRockets = FMax(0.0000000, HydraBazooka(BW).MultiRockets - (ChargeDecayPerSecond * DeltaTime));
			ChargeOvertime = 0.0000000;
			BeepCount = 0;
			// End:0x1EC
			if(HydraBazooka(BW).MultiRockets == float(0))
			{
				AmmoHasBeenCalculated = false;
			}
		}
	}
	super(BallisticFire).ModeTick(DeltaTime);
	//return;	
}

function DoFireEffect()
{
	local Vector Start, X, Y, Z, End, HitLocation,
		HitNormal, StartTrace;

	local Rotator Aim, FireDirection;
	local Actor Other;
	local int i;

	// End:0x14
	if(SpawnCount < 2)
	{
		super(BallisticProjectileFire).DoFireEffect();
		return;
	}
	Weapon.GetViewAxes(X, Y, Z);
	Start = Instigator.Location + Instigator.EyePosition();
	StartTrace = (Start + (X * SpawnOffset.X)) + (Z * SpawnOffset.Z);
	// End:0xCA
	if(!Weapon.WeaponCentered())
	{
		StartTrace = StartTrace + ((Weapon.hand * Y) * SpawnOffset.Y);
	}
	Aim = GetFireAim(StartTrace);
	Aim = Rotator((GetFireSpread()) >> Aim);
	End = Start + (Vector(Aim) * SpawnOffset.X);
	Other = Weapon.Trace(HitLocation, HitNormal, End, Start, false);
	// End:0x14E
	if(Other != none)
	{
		StartTrace = HitLocation;
	}
	End = Start + (Vector(Aim) * (MaxRange()));
	Other = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x1AA
	if(Other != none)
	{
		Aim = Rotator(HitLocation - StartTrace);
	}
	i = 1;
	J0x1B1:

	// End:0x24D [Loop If]
	if(i <= SpawnCount)
	{
		FireDirection = Aim;
		FireDirection.Pitch += int(float(3584) * Sin((float(i * 2) * 3.1415930) / float(SpawnCount)));
		FireDirection.Yaw += int(float(3584) * Cos((float(i * 2) * 3.1415930) / float(SpawnCount)));
		SpawnProjectile(StartTrace, FireDirection);
		i++;
		// [Loop Continue]
		goto J0x1B1;
	}
	SendFireEffect(none, vect(0.0000000, 0.0000000, 0.0000000), StartTrace, 0);
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	super(BallisticProjectileFire).SpawnProjectile(Start, Dir);
	// End:0xED
	if(HydraSwoopRocket(proj) != none)
	{
		HydraSwoopRocket(proj).LaunchTime = Level.TimeSeconds;
		HydraSwoopRocket(proj).Weapon = HydraBazooka(BW);
		HydraSwoopRocket(proj).StartLoc = Start;
		HydraSwoopRocket(proj).EndLoc = HydraBazooka(BW).GetRocketDir();
		HydraSwoopRocket(proj).LastLoc = HydraSwoopRocket(proj).EndLoc;
		HydraSwoopRocket(proj).LaunchTime = Level.TimeSeconds;		
	}
	else
	{
		// End:0x143
		if(HydraSeekerRocket(proj) != none)
		{
			HydraSeekerRocket(proj).Weapon = HydraBazooka(BW);
			HydraSeekerRocket(proj).LastLoc = HydraBazooka(BW).GetRocketDir();
		}
	}
	//return;	
}

defaultproperties
{
	ChargeAnim="ChargeUp"
	ChargeGainPerSecond=3.6000000
	ChargeDecayPerSecond=18.0000000
	MaxChargeOvertime=3.0000000
	RocketCountSound=Sound'BWBP_APC_Sounds.Launcher.Launcher-Beep'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	MuzzleFlashClass=Class'BWBP_APC_Pro.HydraFlashEmitter'
	FireRecoil=64.0000000
	FireChaos=0.5000000
	XInaccuracy=4.0000000
	YInaccuracy=4.0000000
	bSplashDamage=true
	bRecommendSplashDamage=true
	bFireOnRelease=true
	FireEndAnim="None"
	FireRate=1.2000000
	AmmoClass=Class'BWBP_APC_Pro.Ammo_HRPG'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=16.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.5000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.5000000
	ProjectileClass=Class'BWBP_APC_Pro.HydraSwoopRocket'
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
}
