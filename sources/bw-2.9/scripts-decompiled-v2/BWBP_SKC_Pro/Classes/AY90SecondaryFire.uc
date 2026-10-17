class AY90SecondaryFire extends BallisticProjectileFire;

var() byte OverrideMode;
var() float ChargeTime;
var() Sound ChargeSound;
var() float AutoFireTime;
var bool b100Charge;
var bool b75Charge;
var bool b50Charge;
var bool b25Charge;
var() Sound ChargeFireSound;
var() Sound MaxChargeFireSound;
var byte ProjectileCount;

simulated function bool AllowFire()
{
	// End:0x2A
	if(super(BallisticFire).AllowFire() && AY90SkrithBoltcaster(BW).MagAmmo >= 10)
	{
		return true;		
	}
	else
	{
		return false;
	}
	//return;	
}

simulated function PlayPreFire()
{
	Weapon.AmbientSound = ChargeSound;
	BW.SafeLoopAnim('PreFire', 0.1500000, TweenTime,, "IDLE");
	//return;	
}

function ModeHoldFire()
{
	// End:0x30
	if(BW.HasMagAmmo(byte(ThisModeNum)))
	{
		super(WeaponFire).ModeHoldFire();
		BW.bPreventReload = true;
	}
	//return;	
}

simulated event ModeDoFire()
{
	// End:0xA0
	if((HoldTime >= ChargeTime) && AY90SkrithBoltcaster(BW).MagAmmo >= 40)
	{
		AY90SkrithBoltcaster(BW).ParamsClasses[int(AY90SkrithBoltcaster(BW).GameStyleIndex)].static.OverrideFireParams(AY90SkrithBoltcaster(BW), 2);
		OverrideMode = 2;
		ProjectileCount = 30;
		AmmoPerFire = 40;
		load = 40.0000000;
		BallisticFireSound.Sound = MaxChargeFireSound;		
	}
	else
	{
		// End:0x145
		if((HoldTime >= (ChargeTime / float(2))) && AY90SkrithBoltcaster(BW).MagAmmo >= 20)
		{
			AY90SkrithBoltcaster(BW).ParamsClasses[int(AY90SkrithBoltcaster(BW).GameStyleIndex)].static.OverrideFireParams(AY90SkrithBoltcaster(BW), 1);
			OverrideMode = 1;
			ProjectileCount = 20;
			AmmoPerFire = 20;
			load = 20.0000000;
			BallisticFireSound.Sound = ChargeFireSound;			
		}
		else
		{
			AY90SkrithBoltcaster(BW).ParamsClasses[int(AY90SkrithBoltcaster(BW).GameStyleIndex)].static.OverrideFireParams(AY90SkrithBoltcaster(BW), 0);
			OverrideMode = 0;
			ProjectileCount = 10;
			AmmoPerFire = 10;
			load = 10.0000000;
			BallisticFireSound.Sound = default.BallisticFireSound.Sound;
		}
	}
	b100Charge = false;
	b75Charge = false;
	b50Charge = false;
	b25Charge = false;
	// End:0x1E8
	if(!AllowFire())
	{
		return;
	}
	// End:0x2C7
	if(bIsJammed)
	{
		// End:0x29E
		if(BW.FireCount == 0)
		{
			bIsJammed = false;
			// End:0x245
			if(bJamWastesAmmo && int(Weapon.Role) == int(ROLE_Authority))
			{
				ConsumedLoad += int(load);
				Timer();
			}
			// End:0x28E
			if(int(UnjamMethod) == int(3))
			{
				NextFireTime += FireRate;
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
				BW.FireCount++;
				return;
			}
			// End:0x29B
			if(!AllowFire())
			{
				return;
			}			
		}
		else
		{
			NextFireTime += FireRate;
			NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
			return;
		}
	}
	// End:0x347
	if(BW != none)
	{
		BW.bPreventReload = true;
		BW.FireCount++;
		// End:0x347
		if(int(BW.ReloadState) != int(0))
		{
			// End:0x336
			if(int(Weapon.Role) == int(ROLE_Authority))
			{
				BW.bServerReloading = false;
			}
			BW.ReloadState = 0;
		}
	}
	// End:0x368
	if(MaxHoldTime > 0.0000000)
	{
		HoldTime = FMin(HoldTime, MaxHoldTime);
	}
	ConsumedLoad += int(load);
	SetTimer(FMin(0.1000000, FireRate / float(2)), false);
	// End:0x41C
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		DoFireEffect();
		// End:0x3D1
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x40D
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x47A
	if(Instigator.IsLocallyControlled())
	{
		ShakeView();
		PlayFiring();
		FlashMuzzleFlash();
		StartMuzzleSmoke();
		AY90SkrithBoltcaster(BW).UpdateScreen();		
	}
	else
	{
		ServerPlayFiring();
	}
	// End:0x4C6
	if(bFireOnRelease)
	{
		// End:0x4A8
		if(bIsFiring)
		{
			NextFireTime += (MaxHoldTime + FireRate);			
		}
		else
		{
			NextFireTime = Level.TimeSeconds + FireRate;
		}		
	}
	else
	{
		// End:0x563
		if(bBurstMode)
		{
			BurstCount++;
			// End:0x532
			if(BurstCount >= MaxBurst)
			{
				NextFireTime += (FireRate * (float(1) + (float(MaxBurst) * (1.0000000 - BurstFireRateFactor))));
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
				BurstCount = 0;				
			}
			else
			{
				NextFireTime += (FireRate * BurstFireRateFactor);
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
			}			
		}
		else
		{
			NextFireTime += FireRate;
			NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
		}
	}
	load = float(AmmoPerFire);
	HoldTime = 0.0000000;
	// End:0x5E7
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x672
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
		// End:0x661
		if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
		{
			BW.bNeedCock = true;
		}
		BW.bPreventReload = false;
	}
	Weapon.AmbientSound = Weapon.default.AmbientSound;
	AmmoPerFire = 10;
	load = 10.0000000;
	//return;	
}

simulated function ModeTick(float dt)
{
	super(BallisticFire).ModeTick(dt);
	// End:0x69
	if(bIsFiring && BW.MagAmmo >= 10)
	{
		AY90SkrithBoltcaster(BW).UpdateScreen();
		AY90SkrithBoltcaster(BW).SetGlowSize(0.1000000, 0.1000000, HoldTime / ChargeTime);
	}
	// End:0xA7
	if(bIsFiring && HoldTime >= AutoFireTime)
	{
		Weapon.StopFire(ThisModeNum);
		Weapon.AmbientSound = none;
	}
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	proj = Spawn(ProjectileClass,,, Start, Dir);
	BallisticProjectile(proj).override(OverrideMode);
	// End:0x55
	if(proj != none)
	{
		proj.Instigator = Instigator;
	}
	//return;	
}

function DoFireEffect()
{
	local Vector StartTrace, X, Y, Z, Start, End,
		HitLocation, HitNormal, V;

	local Rotator Aim;
	local Actor Other;
	local int i, ProjSpread;
	local float ProjAngle;

	ProjSpread = int(XInaccuracy);
	Weapon.GetViewAxes(X, Y, Z);
	Start = Instigator.Location + Instigator.EyePosition();
	StartTrace = (Start + (X * SpawnOffset.X)) + (Z * SpawnOffset.Z);
	// End:0xC3
	if(!Weapon.WeaponCentered())
	{
		StartTrace = StartTrace + ((Weapon.hand * Y) * SpawnOffset.Y);
	}
	i = 0;
	J0xCA:

	// End:0x1E6 [Loop If]
	if(i < int(ProjectileCount))
	{
		Aim = GetFireAim(StartTrace);
		ProjAngle = ((float(ProjSpread) * 3.1415930) / float(32768)) * (float(i) - (0.5000000 * float(int(ProjectileCount) - 1)));
		V.X = Cos(ProjAngle);
		V.Y = Sin(ProjAngle);
		V.Z = 0.0000000;
		Aim = Rotator(V >> Aim);
		End = Start + (Vector(Aim) * (MaxRange()));
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x1CC
		if(Other != none)
		{
			Aim = Rotator(HitLocation - StartTrace);
		}
		SpawnProjectile(StartTrace, Aim);
		i++;
		// [Loop Continue]
		goto J0xCA;
	}
	SendFireEffect(none, vect(0.0000000, 0.0000000, 0.0000000), StartTrace, 0);
	//return;	
}

defaultproperties
{
	ChargeTime=4.0000000
	ChargeSound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-WaveCharge'
	AutoFireTime=5.0000000
	ChargeFireSound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-WaveBlast'
	MaxChargeFireSound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-WaveBlastMax'
	ProjectileCount=5
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-WaveFire',Volume=1.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bFireOnRelease=true
	AmmoPerFire=10
	ProjectileClass=Class'BWBP_SKC_Pro.AY90WaveProjectile'
}
