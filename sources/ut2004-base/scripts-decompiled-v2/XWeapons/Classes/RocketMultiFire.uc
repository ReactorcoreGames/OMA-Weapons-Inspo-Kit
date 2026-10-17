class RocketMultiFire extends ProjectileFire;

var() float TightSpread;
var() float LooseSpread;
var byte FlockIndex;
var int MaxLoad;

event ModeHoldFire()
{
	// End:0x1B
	if(Instigator.IsLocallyControlled())
	{
		PlayStartHold();		
	}
	else
	{
		ServerPlayLoading();
	}
	//return;	
}

simulated function ServerPlayLoading()
{
	RocketLauncher(Weapon).PlayOwnedSound(SoundGroup'WeaponSounds.RocketLauncher.RocketLauncherLoad', 0,,,,, false);
	//return;	
}

function PlayFireEnd()
{
	//return;	
}

function PlayStartHold()
{
	RocketLauncher(Weapon).PlayLoad(false);
	//return;	
}

function PlayFiring()
{
	// End:0x1D
	if(load > 1.0000000)
	{
		FireAnim = 'AltFire';		
	}
	else
	{
		FireAnim = 'Fire';
	}
	super(WeaponFire).PlayFiring();
	RocketLauncher(Weapon).PlayFiring(load == float(MaxLoad));
	Weapon.OutOfAmmo();
	//return;	
}

event ModeDoFire()
{
	// End:0x56
	if(RocketLauncher(Weapon).bTightSpread || (Bot(Instigator.Controller) != none) && FRand() < 0.6500000)
	{
		Spread = TightSpread;
		SpreadStyle = 3;		
	}
	else
	{
		SpreadStyle = 2;
		Spread = LooseSpread;
	}
	RocketLauncher(Weapon).bTightSpread = false;
	super(WeaponFire).ModeDoFire();
	NextFireTime = FMax(NextFireTime, Level.TimeSeconds + FireRate);
	//return;	
}

function DoFireEffect()
{
	local Vector StartProj, StartTrace, X, Y, Z;

	local Rotator Aim;
	local Vector HitLocation, HitNormal, FireLocation;
	local Actor Other;
	local int P, Q, SpawnCount, i;
	local RocketProj FiredRockets[4];
	local bool bCurl;

	// End:0x28
	if((int(SpreadStyle) == int(2)) || load < float(2))
	{
		super.DoFireEffect();
		return;
	}
	Instigator.MakeNoise(1.0000000);
	Weapon.GetViewAxes(X, Y, Z);
	StartTrace = Instigator.Location + Instigator.EyePosition();
	StartProj = (StartTrace + (X * ProjSpawnOffset.X)) + (Z * ProjSpawnOffset.Z);
	// End:0xEF
	if(!Weapon.WeaponCentered())
	{
		StartProj = StartProj + ((Weapon.hand * Y) * ProjSpawnOffset.Y);
	}
	Other = Weapon.Trace(HitLocation, HitNormal, StartProj, StartTrace, false);
	// End:0x12C
	if(Other != none)
	{
		StartProj = HitLocation;
	}
	Aim = AdjustAim(StartProj, aimerror);
	SpawnCount = Max(1, int(load));
	P = 0;
	J0x159:

	// End:0x219 [Loop If]
	if(P < SpawnCount)
	{
		FireLocation = (StartProj - (float(2) * ((((Sin((float(P * 2) * 3.1415930) / float(MaxLoad)) * float(8)) - float(7)) * Y) - (((Cos((float(P * 2) * 3.1415930) / float(MaxLoad)) * float(8)) - float(7)) * Z)))) - ((X * float(8)) * FRand());
		FiredRockets[P] = RocketProj(SpawnProjectile(FireLocation, Aim));
		P++;
		// [Loop Continue]
		goto J0x159;
	}
	// End:0x227
	if(SpawnCount < 2)
	{
		return;
	}
	FlockIndex++;
	// End:0x243
	if(int(FlockIndex) == 0)
	{
		FlockIndex = 1;
	}
	P = 0;
	J0x24A:

	// End:0x360 [Loop If]
	if(P < SpawnCount)
	{
		// End:0x356
		if(FiredRockets[P] != none)
		{
			FiredRockets[P].bCurl = bCurl;
			FiredRockets[P].FlockIndex = FlockIndex;
			i = 0;
			Q = 0;
			J0x2AE:

			// End:0x316 [Loop If]
			if(Q < SpawnCount)
			{
				// End:0x30C
				if((P != Q) && FiredRockets[Q] != none)
				{
					FiredRockets[P].Flock[i] = FiredRockets[Q];
					i++;
				}
				Q++;
				// [Loop Continue]
				goto J0x2AE;
			}
			bCurl = !bCurl;
			// End:0x356
			if(int(Level.NetMode) != int(NM_DedicatedServer))
			{
				FiredRockets[P].SetTimer(0.1000000, true);
			}
		}
		P++;
		// [Loop Continue]
		goto J0x24A;
	}
	//return;	
}

function ModeTick(float dt)
{
	// End:0x46
	if(((HoldTime > 0.0000000) && load >= float(Weapon.AmmoAmount(ThisModeNum))) && !bNowWaiting)
	{
		bIsFiring = false;
	}
	super(WeaponFire).ModeTick(dt);
	// End:0xB6
	if((load == 1.0000000) && HoldTime >= FireRate)
	{
		// End:0x9B
		if(Instigator.IsLocallyControlled())
		{
			RocketLauncher(Weapon).PlayLoad(false);			
		}
		else
		{
			ServerPlayLoading();
		}
		load = load + 1.0000000;		
	}
	else
	{
		// End:0xEF
		if((load == 2.0000000) && HoldTime >= (FireRate * 2.0000000))
		{
			load = load + 1.0000000;
		}
	}
	//return;	
}

function InitEffects()
{
	super(WeaponFire).InitEffects();
	// End:0x2A
	if(FlashEmitter != none)
	{
		Weapon.AttachToBone(FlashEmitter, 'tip');
	}
	//return;	
}

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
	local Projectile P;

	// End:0x0D
	if(Weapon == none)
	{
		return none;
	}
	P = RocketLauncher(Weapon).SpawnProjectile(Start, Dir);
	// End:0x51
	if(P != none)
	{
		P.Damage *= DamageAtten;
	}
	return P;
	//return;	
}

defaultproperties
{
	TightSpread=300.0000000
	LooseSpread=1000.0000000
	MaxLoad=3
	ProjSpawnOffset=(X=25.0000000,Y=6.0000000,Z=-6.0000000)
	bSplashDamage=true
	bSplashJump=true
	bRecommendSplashDamage=true
	bFireOnRelease=true
	MaxHoldTime=2.3000000
	FireAnim="AltFire"
	TweenTime=0.0000000
	FireSound=SoundGroup'WeaponSounds.RocketLauncher.RocketLauncherFire'
	FireForce="RocketLauncherFire"
	FireRate=0.9500000
	AmmoClass=Class'XWeapons.RocketAmmo'
	AmmoPerFire=1
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'XWeapons.RocketProj'
	BotRefireRate=0.6000000
	WarnTargetPct=0.9000000
	FlashEmitterClass=Class'XEffects.RocketMuzFlash1st'
	SpreadStyle=2
}
