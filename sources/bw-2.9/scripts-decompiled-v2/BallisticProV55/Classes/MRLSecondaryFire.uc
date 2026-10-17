class MRLSecondaryFire extends BallisticProjectileFire;

var float WaitTime;
var bool bFireRockets;
var MRocketLauncher MRL;
var int ConsumedLoadTwo;
var int RocketMultiplier;

simulated event PostBeginPlay()
{
	super(WeaponFire).PostBeginPlay();
	MRL = MRocketLauncher(Weapon);
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x0B
	if(OldAllowFire())
	{
		return true;
	}
	bFireRockets = false;
	return false;
	//return;	
}

simulated function bool OldAllowFire()
{
	// End:0xA1
	if((int(MRL.LoadedFrontBarrels) < AmmoPerFire) && int(MRL.LoadedBackBarrels) < AmmoPerFire)
	{
		// End:0x9F
		if((MRL.MagAmmo + MRL.BigMagAmmo) < AmmoPerFire)
		{
			BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), 0.0000000);
			BW.EmptyFire(byte(ThisModeNum));
		}
		return false;
	}
	// End:0xAE
	if(!CheckReloading())
	{
		return false;
	}
	// End:0xBB
	if(!CheckWeaponMode())
	{
		return false;
	}
	// End:0x151
	if(!bUseWeaponMag || BW.bNoMag)
	{
		// End:0x14E
		if(!AllowFire())
		{
			// End:0x14C
			if(DryFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
			}
			return false;
		}		
	}
	else
	{
		// End:0x255
		if((MRL.MagAmmo + MRL.BigMagAmmo) < AmmoPerFire)
		{
			// End:0x1F5
			if(!bPlayedDryFire && DryFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
				bPlayedDryFire = true;
			}
			// End:0x20F
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
			// End:0x26C
			if(BW.bNeedReload)
			{
				return false;				
			}
			else
			{
				// End:0x280
				if(BW.bNeedCock)
				{
					return false;
				}
			}
		}
	}
	return true;
	//return;	
}

event ModeTick(float dt)
{
	local int RocketsToFire;

	super(BallisticFire).ModeTick(dt);
	// End:0x65
	if((IsFiring()) && bFireRockets)
	{
		WaitTime += dt;
		RocketsToFire = int(WaitTime * float(RocketMultiplier));
		// End:0x62
		if(RocketsToFire > 0)
		{
			WaitTime = 0.0000000;
			FireRockets(RocketsToFire);
		}		
	}
	else
	{
		bFireRockets = false;
		WaitTime = 0.0000000;
	}
	//return;	
}

function DoFireEffect()
{
	ConsumedLoad -= 1;
	bFireRockets = true;
	super(BallisticFire).DoFireEffect();
	//return;	
}

function FireRockets(int RocketsToFire)
{
	local Vector StartTrace, X, Y, Z, Start, End,
		HitLocation, HitNormal;

	local Rotator Aim, R;
	local Actor Other;
	local int i, l1, l2;

	Weapon.GetViewAxes(X, Y, Z);
	Start = Instigator.Location + Instigator.EyePosition();
	StartTrace = (Start + (X * SpawnOffset.X)) + (Z * SpawnOffset.Z);
	// End:0xB6
	if(!Weapon.WeaponCentered())
	{
		StartTrace = StartTrace + ((Weapon.hand * Y) * SpawnOffset.Y);
	}
	Aim = GetFireAim(StartTrace);
	End = Start + (Vector(Aim) * (MaxRange()));
	Other = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x123
	if(Other != none)
	{
		Aim = Rotator(HitLocation - StartTrace);
	}
	i = 0;
	J0x12A:

	// End:0x29B [Loop If]
	if(((i < RocketsToFire) && i < (int(MRL.LoadedFrontBarrels) + int(MRL.LoadedBackBarrels))) && i < (BW.MagAmmo + MRL.BigMagAmmo))
	{
		R = Rotator((GetFireSpread()) >> Aim);
		SpawnProjectile(StartTrace, R);
		// End:0x24D
		if(((int(MRL.LoadedBackBarrels) - l1) > 0) && (((int(MRL.LoadedFrontBarrels) - l2) < 1) || MRL.BigMagAmmo < 1) || (float(MRL.BarrelIndex) / 3.0000000) == float(MRL.BarrelIndex / 3))
		{
			ConsumedLoad += 1;
			l1++;			
		}
		else
		{
			ConsumedLoadTwo += 1;
			l2++;
		}
		MRL.BarrelIndex++;
		// End:0x291
		if(MRL.BarrelIndex >= 18)
		{
			MRL.BarrelIndex = 0;
		}
		i++;
		// [Loop Continue]
		goto J0x12A;
	}
	// End:0x333
	if((InStr(Level.Game.GameName, "Freon") != -1) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo) != none)
	{
		Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo).AddFireStat(RocketsToFire, 1);
	}
	MRL.LoadedBackBarrels = byte(Max(0, int(MRL.LoadedBackBarrels) - l1));
	MRL.LoadedFrontBarrels = byte(Max(0, int(MRL.LoadedFrontBarrels) - l2));
	MRL.UpdateNetBarrels();
	SetTimer(FireRate / float(2), false);
	SendFireEffect(none, vect(0.0000000, 0.0000000, 0.0000000), StartTrace, 0);
	//return;	
}

simulated event Timer()
{
	// End:0x3B
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		MRL.ConsumeMRLAmmo(ThisModeNum, float(ConsumedLoad), float(ConsumedLoadTwo));
	}
	ConsumedLoad = 0;
	ConsumedLoadTwo = 0;
	//return;	
}

function FlashMuzzleFlash()
{
	MRL.PrimaryFire.FlashMuzzleFlash();
	//return;	
}

defaultproperties
{
	RocketMultiplier=13
	SpawnOffset=(X=28.0000000,Y=8.0000000,Z=-6.0000000)
	FireChaos=0.0800000
	XInaccuracy=768.0000000
	YInaccuracy=768.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.MRL.MRL-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireRate=0.0700000
	AmmoClass=Class'BallisticProV55.Ammo_MRL'
	ShakeRotMag=(X=32.0000000,Y=8.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.5000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	ProjectileClass=Class'BallisticProV55.MRLRocket'
	WarnTargetPct=0.2000000
}
