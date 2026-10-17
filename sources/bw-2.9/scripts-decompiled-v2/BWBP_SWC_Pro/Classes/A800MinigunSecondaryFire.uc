class A800MinigunSecondaryFire extends BallisticProjectileFire;

var Rotator OldLookDir;
var Rotator TurnVelocity;
var float LastFireTime;
var float MuzzleBTime;
var float MuzzleCTime;
var float OldFireRate;
var A800SkrithMinigun Minigun;
var float LagTime;
var int ProjectileCount;
var bool bStarted;
var bool b100Charge;
var bool b75Charge;
var bool b50Charge;
var bool b25Charge;
var float NextTVUpdateTime;
var() float ChargeTime;
var() Sound ChargeSound;
var() float AutoFireTime;
var() int BurstSize;
var() Sound ChargeFireSound;
var() Sound MaxChargeFireSound;

simulated function bool AllowFire()
{
	// End:0x25
	if(super(BallisticFire).AllowFire() && BW.MagAmmo >= 10)
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
	// End:0x105
	if(BurstSize == 0)
	{
		// End:0x3C
		if((HoldTime >= ChargeTime) && BW.MagAmmo >= 40)
		{
			BurstSize = 4;			
		}
		else
		{
			// End:0x74
			if((HoldTime >= (ChargeTime * 0.7500000)) && BW.MagAmmo >= 30)
			{
				BurstSize = 3;				
			}
			else
			{
				// End:0xAB
				if((HoldTime >= (ChargeTime / float(2))) && BW.MagAmmo >= 20)
				{
					BurstSize = 2;					
				}
				else
				{
					// End:0xE1
					if((HoldTime >= (ChargeTime / float(4))) && BW.MagAmmo >= 10)
					{
						BurstSize = 1;						
					}
					else
					{
						BurstSize = 0;
					}
				}
			}
		}
		Weapon.AmbientSound = Weapon.default.AmbientSound;
	}
	// End:0x599
	if(BurstSize > 0)
	{
		BurstSize = BurstSize - 1;
		// End:0x13F
		if(BurstSize > 0)
		{
			SetTimer(FireRate / 4.0000000, true);			
		}
		else
		{
			SetTimer(FireRate, false);
		}
		b100Charge = false;
		b75Charge = false;
		b50Charge = false;
		b25Charge = false;
		// End:0x178
		if(!AllowFire())
		{
			return;
		}
		// End:0x1F8
		if(BW != none)
		{
			BW.bPreventReload = true;
			BW.FireCount++;
			// End:0x1F8
			if(int(BW.ReloadState) != int(0))
			{
				// End:0x1E7
				if(int(Weapon.Role) == int(ROLE_Authority))
				{
					BW.bServerReloading = false;
				}
				BW.ReloadState = 0;
			}
		}
		// End:0x219
		if(MaxHoldTime > 0.0000000)
		{
			HoldTime = FMin(HoldTime, MaxHoldTime);
		}
		ConsumedLoad += int(load);
		// End:0x293
		if(int(Weapon.Role) == int(ROLE_Authority))
		{
			// End:0x269
			if(BW != none)
			{
				BW.ConsumeMagAmmo(ThisModeNum, float(ConsumedLoad));				
			}
			else
			{
				Weapon.ConsumeAmmo(ThisModeNum, float(ConsumedLoad));
			}
			// End:0x293
			if(bPendingTryJam)
			{
				TryJam();
			}
		}
		ConsumedLoad = 0;
		// End:0x327
		if(int(Weapon.Role) == int(ROLE_Authority))
		{
			DoFireEffect();
			// End:0x2DC
			if((Instigator == none) || Instigator.Controller == none)
			{
				return;
			}
			// End:0x318
			if(AIController(Instigator.Controller) != none)
			{
				AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
			}
			Instigator.DeactivateSpawnProtection();
		}
		BW.LastFireTime = Level.TimeSeconds;
		// End:0x371
		if(Instigator.IsLocallyControlled())
		{
			ShakeView();
			PlayFiring();
			FlashMuzzleFlash();
			StartMuzzleSmoke();			
		}
		else
		{
			ServerPlayFiring();
		}
		// End:0x3ED
		if(bFireOnRelease)
		{
			// End:0x39F
			if(bIsFiring)
			{
				NextFireTime += (MaxHoldTime + FireRate);				
			}
			else
			{
				// End:0x3CF
				if(BurstSize > 0)
				{
					NextFireTime = Level.TimeSeconds + (FireRate / 4.0000000);					
				}
				else
				{
					NextFireTime = Level.TimeSeconds + FireRate;
				}
			}			
		}
		else
		{
			// End:0x48A
			if(bBurstMode)
			{
				BurstCount++;
				// End:0x459
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
		// End:0x50E
		if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
		{
			bIsFiring = false;
			Weapon.PutDown();
		}
		// End:0x599
		if(BW != none)
		{
			BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
			// End:0x588
			if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
			{
				BW.bNeedCock = true;
			}
			BW.bPreventReload = false;
		}
	}
	//return;	
}

simulated event Timer()
{
	// End:0x11
	if(BurstSize > 0)
	{
		ModeDoFire();
	}
	//return;	
}

simulated function ModeTick(float dt)
{
	super(BallisticFire).ModeTick(dt);
	// End:0x286
	if(bIsFiring)
	{
		// End:0x47
		if(HoldTime >= AutoFireTime)
		{
			Weapon.StopFire(ThisModeNum);
			Weapon.AmbientSound = none;
		}
		// End:0xD3
		if(((HoldTime >= ChargeTime) && BW.MagAmmo >= 40) && !b100Charge)
		{
			b100Charge = true;
			BW.PlaySound(Minigun.ChargeLoadSound, 0, 1.3000000,, 32.0000000, 1.0000000, true);
			A800SkrithMinigun(BW).SetGlowSize(1.0000000);
			BurstSize = 4;			
		}
		else
		{
			// End:0x166
			if(((HoldTime >= (ChargeTime * 0.7500000)) && BW.MagAmmo >= 30) && !b75Charge)
			{
				b75Charge = true;
				BW.PlaySound(Minigun.ChargeLoadSound, 0, 1.3000000,, 32.0000000, 1.0000000, true);
				A800SkrithMinigun(BW).SetGlowSize(0.7500000);
				BurstSize = 3;				
			}
			else
			{
				// End:0x1F8
				if(((HoldTime >= (ChargeTime / float(2))) && BW.MagAmmo >= 20) && !b50Charge)
				{
					b50Charge = true;
					BW.PlaySound(Minigun.ChargeLoadSound, 0, 1.3000000,, 32.0000000, 1.0000000, true);
					A800SkrithMinigun(BW).SetGlowSize(0.5000000);
					BurstSize = 2;					
				}
				else
				{
					// End:0x286
					if(((HoldTime >= (ChargeTime / float(4))) && BW.MagAmmo >= 10) && !b25Charge)
					{
						b25Charge = true;
						BW.PlaySound(Minigun.ChargeLoadSound, 0, 1.3000000,, 32.0000000, 1.0000000, true);
						A800SkrithMinigun(BW).SetGlowSize(0.2500000);
						BurstSize = 1;
					}
				}
			}
		}
	}
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	proj = Spawn(ProjectileClass,,, Start, Dir);
	// End:0xAC
	if(proj != none)
	{
		proj.Instigator = Instigator;
		A800StickyBombProjectile(proj).Master = A800SkrithMinigun(BW);
		// End:0xAC
		if((A800SkrithMinigun(BW) != none) && A800SkrithMinigun(BW).Target != none)
		{
			A800StickyBombProjectile(proj).SetProjTarget(A800SkrithMinigun(BW).Target);
		}
	}
	//return;	
}

function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	// End:0x6B
	if(!bStarted)
	{
		bStarted = true;
		BW.SafeLoopAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");
		BW.PlaySound(Minigun.BarrelStartSound, 0, 0.5000000,, 32.0000000, 1.0000000, true);
	}
	//return;	
}

function ServerPlayFiring()
{
	super(BallisticFire).ServerPlayFiring();
	// End:0x6E
	if(!bStarted)
	{
		bStarted = true;
		BW.SafeLoopAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");
		BW.PlayOwnedSound(Minigun.BarrelStartSound, 0, 0.5000000,, 32.0000000, 1.0000000, true);
	}
	//return;	
}

function StopFiring()
{
	super(BallisticFire).StopFiring();
	bStarted = false;
	//return;	
}

simulated event PostBeginPlay()
{
	OldLookDir = BW.GetPlayerAim();
	super(WeaponFire).PostBeginPlay();
	//return;	
}

defaultproperties
{
	ChargeTime=4.0000000
	ChargeSound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-BoltCharge'
	AutoFireTime=5.0000000
	ChargeFireSound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-BoltBlast'
	MaxChargeFireSound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-BoltBlastMax'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.A73BFlashEmitter'
	BallisticFireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.SkrithBow.SkrithBow-BoltShot',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bFireOnRelease=true
	FireEndAnim="None"
	FireRate=1.0000000
	AmmoClass=Class'BallisticProV55.Ammo_Cells'
	AmmoPerFire=10
	ShakeRotMag=(X=32.0000000,Y=10.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.7500000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.7500000
	ProjectileClass=Class'BWBP_SKC_Pro.AY90BoltProjectile'
	WarnTargetPct=0.2000000
}
