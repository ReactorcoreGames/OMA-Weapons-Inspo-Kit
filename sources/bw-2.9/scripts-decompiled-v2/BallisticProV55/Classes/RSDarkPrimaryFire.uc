class RSDarkPrimaryFire extends BallisticProProjectileFire;

struct ImmolateVic
{
	var Actor Vic;
	var float dist;
	var RSDarkImmolateBurner Fire;
};

var Actor MuzzleFlashFast;
var Actor MuzzleFlashSlow;
var Actor MuzzleFlame;
var() Sound FireSoundLoop;
var() Sound FireSound2;
var bool bIsZapping;
var() int Damage;
var float ModePowerDrain;
var bool bPendingOwnerZap;
var float PendingZapDamage;
var bool bIgnited;
var float ImmolatePower;
var() Sound ImmolateSoundLoop;

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x8D
	if(BW != none)
	{
		BW.bPreventReload = true;
		BW.FireCount++;
		// End:0x8D
		if(int(BW.ReloadState) != int(0))
		{
			// End:0x7C
			if(int(Weapon.Role) == int(ROLE_Authority))
			{
				BW.bServerReloading = false;
			}
			BW.ReloadState = 0;
		}
	}
	// End:0xAE
	if(MaxHoldTime > 0.0000000)
	{
		HoldTime = FMin(HoldTime, MaxHoldTime);
	}
	ConsumedLoad += int(load);
	SetTimer(FMin(0.1000000, FireRate / float(2)), false);
	// End:0x20B
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		DoFireEffect();
		// End:0x117
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x153
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
		// End:0x20B
		if((InStr(Level.Game.GameName, "Freon") != -1) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo) != none)
		{
			Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo).AddFireStat(int(load), int(BW.InventoryGroup));
		}
	}
	// End:0x233
	if(!BW.bScopeView)
	{
		BW.AddFireChaos(FireChaos);
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x27D
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
	// End:0x2C9
	if(bFireOnRelease)
	{
		// End:0x2AB
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
		// End:0x34A
		if(bBurstMode)
		{
			BurstCount++;
			// End:0x319
			if(BurstCount >= MaxBurst)
			{
				NextFireTime += 0.7000000;
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
				BurstCount = 0;				
			}
			else
			{
				NextFireTime += (FireRate * 0.7500000);
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
	// End:0x3CE
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x448
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
		// End:0x448
		if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
		{
			BW.bNeedCock = true;
		}
	}
	//return;	
}

simulated function Vector GetFireSpread()
{
	local float fX;
	local Rotator R;

	// End:0x35
	if(BW.bScopeView || int(BW.CurrentWeaponMode) != 4)
	{
		return super.GetFireSpread();		
	}
	else
	{
		fX = FRand();
		R.Yaw = int((float(1024) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
		R.Pitch = int((float(1024) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
		return Vector(R);
	}
	//return;	
}

function InitEffects()
{
	// End:0x1B
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x72
	if((MuzzleFlashFast == none) || MuzzleFlashFast.bDeleteMe)
	{
		Class'BallisticProV55.RSDarkStar'.static.InitMuzzleFlash(MuzzleFlashFast, Class'BallisticProV55.RSDarkFastMuzzleFlash', Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	}
	// End:0xC9
	if((MuzzleFlashSlow == none) || MuzzleFlashSlow.bDeleteMe)
	{
		Class'BallisticProV55.RSDarkStar'.static.InitMuzzleFlash(MuzzleFlashSlow, Class'BallisticProV55.RSDarkSlowMuzzleFlash', Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	}
	MuzzleFlash = MuzzleFlashSlow;
	//return;	
}

simulated function DestroyEffects()
{
	super(WeaponFire).DestroyEffects();
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashFast);
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashSlow);
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlame);
	//return;	
}

simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
{
	RSDarkAttachment(Weapon.ThirdPersonActor).DarkUpdateHit(BW.CurrentWeaponMode);
	//return;	
}

simulated function SwitchWeaponMode(byte newmode)
{
	super(BallisticProjectileFire).SwitchWeaponMode(newmode);
	switch(newmode)
	{
		// End:0x25
		case 0:
			ModePowerDrain = 0.0000000;
			// End:0x82
			break;
		// End:0x38
		case 1:
			ModePowerDrain = 0.0000000;
			// End:0x82
			break;
		// End:0x4B
		case 2:
			ModePowerDrain = 0.0000000;
			// End:0x82
			break;
		// End:0x5E
		case 3:
			ModePowerDrain = 0.1000000;
			// End:0x82
			break;
		// End:0x71
		case 4:
			ModePowerDrain = 0.5000000;
			// End:0x82
			break;
		// End:0xFFFF
		default:
			ModePowerDrain = 0.0000000;
			// End:0x82
			break;
			break;
	}
	// End:0xA5
	if(RSDarkStar(BW).bOnRampage)
	{
		ModePowerDrain *= 0.4000000;
	}
	//return;	
}

function DoFireEffect()
{
	super(BallisticProjectileFire).DoFireEffect();
	// End:0x1A
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
	{
		return;
	}
	// End:0x9E
	if(int(BW.CurrentWeaponMode) == 0)
	{
		Instigator.PlaySound(Sound'BW_Core_WeaponSound.DarkStar.Dark-ImmolateIgnite',, 3.7000000,, 32.0000000);
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, ProjectileClass.default.Damage * 0.1000000, Instigator, Instigator.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'BallisticProV55.DT_RSDarkBacklash');		
	}
	else
	{
		// End:0xF2
		if(int(BW.CurrentWeaponMode) == 1)
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 2.0000000, Instigator, Instigator.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'BallisticProV55.DT_RSDarkBacklash');
		}
	}
	//return;	
}

event Timer()
{
	super(BallisticFire).Timer();
	// End:0x60
	if(bIgnited && (!IsFiring() || Weapon.GetFireMode(1).IsFiring()) || !IsInState('DarkFlamer') && !IsInState('Immolate'))
	{
		StopFlaming();
	}
	//return;	
}

function StopFlaming()
{
	bIgnited = false;
	ImmolatePower = 0.0000000;
	// End:0x39
	if(MuzzleFlame != none)
	{
		Emitter(MuzzleFlame).Kill();
		MuzzleFlame = none;
	}
	Instigator.AmbientSound = BW.UsedAmbientSound;
	Instigator.SoundVolume = Weapon.default.SoundVolume;
	//return;	
}

state DarkFlamer
{
	function float MaxRange()
	{
		return 800.0000000;
		//return;		
	}

	function DoFireEffect()
	{
		local Vector Start, Dir, End, HitLocation, HitNormal;

		local Rotator Aim;
		local Actor Other;
		local float dist;
		local int i;

		Start = Instigator.Location + Instigator.EyePosition();
		Aim = GetFireAim(Start);
		Aim = Rotator((GetFireSpread()) >> Aim);
		Dir = Vector(Aim);
		End = Start + (Dir * (MaxRange()));
		Weapon.bTraceWater = true;
		i = 0;
		J0x8B:

		// End:0x168 [Loop If]
		if(i < 20)
		{
			Other = Trace(HitLocation, HitNormal, End, Start, true);
			// End:0x129
			if(((((Other == none) || Other.bWorldGeometry) || Mover(Other) != none) || FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
			{
				// [Explicit Break]
				goto J0x168;
			}
			Start = HitLocation + (Dir * FMax(32.0000000, (Other.CollisionRadius * float(2)) + float(4)));
			i++;
			// [Loop Continue]
			goto J0x8B;
		}
		J0x168:

		Weapon.bTraceWater = false;
		// End:0x18F
		if(Other == none)
		{
			HitLocation = End;
		}
		// End:0x1D1
		if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
		{
			Other = none;
		}
		dist = VSize(HitLocation - Start);
		SpawnProjectile(Start, Rotator(HitLocation - Start));
		// End:0x244
		if(RSDarkFlameProjectile(proj) != none)
		{
			RSDarkFlameProjectile(proj).InitFlame(HitLocation);
			RSDarkFlameProjectile(proj).bHitWall = Other != none;
		}
		RSDarkAttachment(Weapon.ThirdPersonActor).DarkUpdateFlameHit(Other, HitLocation, HitNormal);
		super(BallisticFire).DoFireEffect();
		// End:0x2B1
		if(RSDarkStar(Weapon).SoulPower >= ModePowerDrain)
		{
			RSDarkStar(Weapon).AddSoul(-ModePowerDrain);			
		}
		else
		{
			Instigator.PlaySound(Sound'BW_Core_WeaponSound.DarkStar.Dark-ImmolateIgnite',, 3.7000000,, 32.0000000);
			RSDarkStar(Weapon).AddSoul(-5.0000000);
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 100.0000000 * (ModePowerDrain - RSDarkStar(Weapon).SoulPower), Instigator, Instigator.Location, (-Vector(Instigator.GetViewRotation()) * float(3000)) + vect(0.0000000, 0.0000000, 1000.0000000), Class'BallisticProV55.DT_RSDarkBacklash');
		}
		//return;		
	}

	function PlayFiring()
	{
		ClientPlayForceFeedback(FireForce);
		FireCount++;
		Instigator.AmbientSound = FireSoundLoop;
		Instigator.SoundVolume = byte(255);
		// End:0xC8
		if(!bIgnited)
		{
			BW.SafeLoopAnim(FireLoopAnim, FireAnimRate, TweenTime,, "FIRE");
			bIgnited = true;
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		}
		// End:0x10B
		if(MuzzleFlame == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlame, Class'BallisticProV55.RSDarkMuzzleFlame', Weapon.DrawScale * FlashScaleFactor, Weapon, 'tip');
		}
		//return;		
	}

	function ServerPlayFiring()
	{
		// End:0x8F
		if(!bIgnited)
		{
			BW.SafeLoopAnim(FireLoopAnim, FireAnimRate, TweenTime,, "FIRE");
			bIgnited = true;
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		}
		//return;		
	}

	simulated function bool AllowFire()
	{
		// End:0x39
		if(!super(BallisticFire).AllowFire() || Instigator.HeadVolume.bWaterVolume)
		{
			// End:0x37
			if(bIgnited)
			{
				StopFiring();
			}
			return false;
		}
		return true;
		//return;		
	}

	function StopFiring()
	{
		bIgnited = false;
		Instigator.AmbientSound = BW.UsedAmbientSound;
		Instigator.SoundVolume = Weapon.default.SoundVolume;
		// End:0x68
		if(MuzzleFlame != none)
		{
			Emitter(MuzzleFlame).Kill();
			MuzzleFlame = none;
		}
		//return;		
	}
	stop;	
}

state Fireball
{
	function DoFireEffect()
	{
		super(BallisticProjectileFire).DoFireEffect();
		// End:0x41
		if(RSDarkStar(Weapon).SoulPower >= ModePowerDrain)
		{
			RSDarkStar(Weapon).AddSoul(-ModePowerDrain);			
		}
		else
		{
			Instigator.PlaySound(Sound'BW_Core_WeaponSound.DarkStar.Dark-ImmolateIgnite',, 3.7000000,, 32.0000000);
			RSDarkStar(Weapon).AddSoul(-5.0000000);
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 100.0000000 * (ModePowerDrain - RSDarkStar(Weapon).SoulPower), Instigator, Instigator.Location, (-Vector(Instigator.GetViewRotation()) * float(3000)) + vect(0.0000000, 0.0000000, 1000.0000000), Class'BallisticProV55.DT_RSDarkBacklash');
		}
		//return;		
	}
	stop;	
}

state Immolate
{
	function float MaxRange()
	{
		return 1400.0000000;
		//return;		
	}

	function DoFireEffect()
	{
		local Actor Victims;
		local array<ImmolateVic> Vics;
		local int i, j;
		local float dist;

		// End:0x1E0
		foreach Instigator.VisibleCollidingActors(Class'Engine.Actor', Victims, 1400.0000000, Instigator.Location)
		{
			// End:0x1DF
			if(((((Victims != none) && Victims != Instigator) && int(Victims.Role) == int(ROLE_Authority)) && Pawn(Victims) != none) && Pawn(Victims).Health > 0)
			{
				// End:0x1DF
				if((Normal(Victims.Location - Instigator.Location) Dot Vector(Instigator.GetViewRotation())) > 0.7500000)
				{
					dist = VSize(Victims.Location - Instigator.Location);
					i = 0;
					J0xFA:

					// End:0x131 [Loop If]
					if(i < Vics.Length)
					{
						// End:0x127
						if(Vics[i].dist > dist)
						{
							// [Explicit Break]
							goto J0x131;
						}
						i++;
						// [Loop Continue]
						goto J0xFA;
					}
					J0x131:

					Vics.Insert(i, 1);
					Vics[i].Vic = Victims;
					Vics[i].dist = dist;
					j = 0;
					J0x170:

					// End:0x1DF [Loop If]
					if(j < Victims.Attached.Length)
					{
						// End:0x1D5
						if(RSDarkImmolateBurner(Victims.Attached[j]) != none)
						{
							Vics[i].Fire = RSDarkImmolateBurner(Victims.Attached[j]);
							// End:0x1DF
							continue;
						}
						j++;
						// [Loop Continue]
						goto J0x170;
					}
				}
			}			
		}		
		// End:0x1F9
		if(Vics.Length > 0)
		{
			ImmolatePower += 0.5000000;
		}
		i = 0;
		J0x200:

		// End:0x256 [Loop If]
		if(i < Vics.Length)
		{
			// End:0x24C
			if(Vics[i].Fire != none)
			{
				Vics[i].Fire.AddPower(0.6000000);
				j++;
			}
			i++;
			// [Loop Continue]
			goto J0x200;
		}
		// End:0x35B
		if(ImmolatePower >= float(j + 1))
		{
			i = 0;
			J0x271:

			// End:0x35B [Loop If]
			if(i < Vics.Length)
			{
				// End:0x351
				if(Vics[i].Fire == none)
				{
					Vics[i].Fire = Spawn(Class'BallisticProV55.RSDarkImmolateBurner', Vics[i].Vic,, Vics[i].Vic.Location);
					Vics[i].Fire.Initialize(Vics[i].Vic);
					Vics[i].Fire.InstigatorController = Instigator.Controller;
					Vics[i].Fire.Instigator = Instigator;
					// [Explicit Break]
					goto J0x35B;
				}
				i++;
				// [Loop Continue]
				goto J0x271;
			}
		}
		J0x35B:

		// End:0x396
		if(RSDarkStar(Weapon).SoulPower >= ModePowerDrain)
		{
			RSDarkStar(Weapon).AddSoul(-ModePowerDrain);			
		}
		else
		{
			Instigator.PlaySound(Sound'BW_Core_WeaponSound.DarkStar.Dark-ImmolateIgnite',, 3.7000000,, 32.0000000);
			RSDarkStar(Weapon).AddSoul(-5.0000000);
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 100.0000000 * (ModePowerDrain - RSDarkStar(Weapon).SoulPower), Instigator, Instigator.Location, (-Vector(Instigator.GetViewRotation()) * float(3000)) + vect(0.0000000, 0.0000000, 1000.0000000), Class'BallisticProV55.DT_RSDarkBacklash');
		}
		//return;		
	}

	function PlayFiring()
	{
		ClientPlayForceFeedback(FireForce);
		FireCount++;
		// End:0x71
		if(!bIgnited)
		{
			Instigator.AmbientSound = ImmolateSoundLoop;
			Instigator.SoundVolume = byte(255);
			BW.SafeLoopAnim(FireLoopAnim, FireAnimRate, TweenTime,, "FIRE");
			bIgnited = true;
		}
		// End:0xB4
		if(MuzzleFlame == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlame, Class'BallisticProV55.RSDarkMuzzleFlame', Weapon.DrawScale * FlashScaleFactor, Weapon, 'tip');
		}
		//return;		
	}

	function ServerPlayFiring()
	{
		BW.SafeLoopAnim(FireLoopAnim, FireAnimRate, TweenTime,, "FIRE");
		// End:0x38
		if(!bIgnited)
		{
			bIgnited = true;
		}
		//return;		
	}

	simulated function bool AllowFire()
	{
		// End:0x39
		if(!super(BallisticFire).AllowFire() || Instigator.HeadVolume.bWaterVolume)
		{
			// End:0x37
			if(bIgnited)
			{
				StopFiring();
			}
			return false;
		}
		return true;
		//return;		
	}

	function StopFiring()
	{
		ImmolatePower = 0.0000000;
		bIgnited = false;
		Instigator.AmbientSound = BW.UsedAmbientSound;
		Instigator.SoundVolume = Weapon.default.SoundVolume;
		// End:0x73
		if(MuzzleFlame != none)
		{
			Emitter(MuzzleFlame).Kill();
			MuzzleFlame = none;
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	FireSoundLoop=Sound'BW_Core_WeaponSound.DarkStar.Dark-AltFireLoop'
	Damage=50
	ImmolateSoundLoop=Sound'BW_Core_WeaponSound.DarkStar.Dark-Immolation'
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	MuzzleFlashClass=Class'BallisticProV55.RSDarkSlowMuzzleFlash'
	FireRecoil=1024.0000000
	FireChaos=0.2500000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.1600000,OutVal=1.0000000),(InVal=0.2500000,OutVal=1.5000000),(InVal=0.5000000,OutVal=2.2500000),(InVal=0.7500000,OutVal=3.5000000),(InVal=1.0000000,OutVal=5.0000000)))
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireRate=1.3500000
	AmmoClass=Class'BallisticProV55.Ammo_DarkDiamond'
	AmmoPerFire=5
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-100.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BallisticProV55.RSDarkProjectile'
	WarnTargetPct=0.2000000
}
