class BallisticHandGrenade extends BallisticWeapon
	abstract
	config(BallisticProV55);

var() bool bCookable;
var float ClipReleaseTime;
var() name ClipReleaseAnim;
var() float FuseDelay;
var() int HeldDamage;
var() int HeldRadius;
var() int HeldMomentum;
var() Class<DamageType> HeldDamageType;
var() Class<Emitter> GrenadeSmokeClass;
var Emitter GrenadeSmoke;
var() FullSound ClipReleaseSound;
var() FullSound PinPullSound;
var float HandExplodeTime;
var() name GrenadeBone;
var() name PinBone;
var() name ClipBone;
var() name SmokeBone;
var() int DamageThisCook;
var() int DropThreshold;

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	SetBoneScale(0, 1.0000000, GrenadeBone);
	SetBoneScale(1, 1.0000000, PinBone);
	SetBoneScale(2, 1.0000000, ClipBone);
	//return;	
}

simulated function bool ReadyToFire(int Mode)
{
	local int alt;

	// End:0x15
	if(Mode == 0)
	{
		alt = 1;		
	}
	else
	{
		alt = 0;
	}
	// End:0x2F
	if(FireMode[Mode] == none)
	{
		return false;
	}
	// End:0x115
	if(((((FireMode[alt] != FireMode[Mode]) && FireMode[alt].bModeExclusive) && FireMode[alt].bIsFiring || FireMode[alt].bFireOnRelease && FireMode[alt].HoldTime > 0.0000000) || !FireMode[Mode].AllowFire()) || FireMode[Mode].NextFireTime > (Level.TimeSeconds + FireMode[Mode].PreFireTime))
	{
		return false;
	}
	return true;
	//return;	
}

simulated function bool PutDown()
{
	local BCGhostWeapon GW;

	// End:0x0F
	if(ClipReleaseTime > float(0))
	{
		return false;
	}
	// End:0xB7
	if(super.PutDown())
	{
		SetBoneScale(1, 1.0000000, PinBone);
		ClipReleaseTime = 0.0000000;
		// End:0xB5
		if(Ammo[0].AmmoAmount < 1)
		{
			GW = Spawn(Class'BCoreProV55.BCGhostWeapon',,, Instigator.Location);
			// End:0x9B
			if(GW != none)
			{
				GW.MyWeaponClass = Class;
				GW.GiveTo(Instigator);
			}
			Timer();
			PickupClass = none;
			DropFrom(Location);
			return true;
		}
		return true;
	}
	return false;
	//return;	
}

simulated function PlayIdle()
{
	super.PlayIdle();
	SetBoneScale(1, 0.0000000, PinBone);
	//return;	
}

simulated function Notify_GrenadeLeaveHand()
{
	SetBoneScale(0, 0.0000000, GrenadeBone);
	// End:0x29
	if(ClipReleaseTime > float(0))
	{
		ClipReleaseTime = -1.0000000;
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x39
	if(Anim == ClipReleaseAnim)
	{
		SetBoneScale(1, 0.0000000, PinBone);		
	}
	else
	{
		// End:0xAC
		if((Anim == FireMode[0].FireAnim) || Anim == FireMode[1].FireAnim)
		{
			SetBoneScale(2, 1.0000000, ClipBone);
			SetBoneScale(1, 1.0000000, PinBone);
			SetBoneScale(0, 1.0000000, GrenadeBone);
			CheckNoGrenades();			
		}
		else
		{
			// End:0xC4
			if(Anim == SelectAnim)
			{
				PlayIdle();				
			}
			else
			{
				super.AnimEnd(Channel);
			}
		}
	}
	//return;	
}

simulated function DoExplosionEffects()
{
	BallisticGrenadeAttachment(ThirdPersonActor).HandExplode();
	// End:0x33
	if(int(Level.NetMode) == int(NM_Client))
	{
		CheckNoGrenades();
	}
	//return;	
}

function DoExplosion()
{
	// End:0x3B
	if(int(Role) == int(ROLE_Authority))
	{
		SpecialHurtRadius(float(HeldDamage), float(HeldRadius), HeldDamageType, float(HeldMomentum), Location);
		CheckNoGrenades();
	}
	//return;	
}

simulated function SpecialHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;
	local bool bHitInstigator;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x1B3
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x1B2
		if(((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo'))
		{
			// End:0x93
			if((Victims == Instigator) && Instigator != none)
			{
				bHitInstigator = true;
				continue;				
			}
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x139
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
		}		
	}	
	// End:0x2C0
	if(bHitInstigator)
	{
		Victims = Instigator;
		Dir = Victims.Location - HitLocation;
		dist = FMax(1.0000000, VSize(Dir));
		Dir = Dir / dist;
		damageScale = 2.0000000;
		// End:0x249
		if((Instigator == none) || Instigator.Controller == none)
		{
			Victims.SetDelayedDamageInstigatorController(InstigatorController);
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (float(1) * Momentum) * Dir, DamageType);
	}
	bHurtEntry = false;
	//return;	
}

simulated function CheckNoGrenades()
{
	local Inventory Inv;
	local BCGhostWeapon GW;

	// End:0x1E3
	if((Ammo[0] != none) && (Ammo[0].AmmoAmount < 1) || (Ammo[0].AmmoAmount == 1) && (bFireMode[0].ConsumedLoad > 0) || bFireMode[1].ConsumedLoad > 0)
	{
		AIRating = -999.0000000;
		Priority = byte(-999);
		// End:0xE6
		if(int(Role) == int(ROLE_Authority))
		{
			GW = Spawn(Class'BCoreProV55.BCGhostWeapon',,, Instigator.Location);
			// End:0xE6
			if(GW != none)
			{
				GW.MyWeaponClass = Class;
				GW.GiveTo(Instigator);
			}
		}
		// End:0x1DD
		if(Instigator != none)
		{
			// End:0x125
			if(PlayerController(Instigator.Controller) != none)
			{
				Instigator.Controller.ClientSwitchToBestWeapon();				
			}
			else
			{
				// End:0x1DD
				if(AIController(Instigator.Controller) != none)
				{
					Inv = Instigator.Inventory;
					J0x152:

					// End:0x1DD [Loop If]
					if(Inv != none)
					{
						// End:0x1C6
						if((Weapon(Inv) != none) && Weapon(Inv) != self)
						{
							// End:0x19B
							if(!Weapon(Inv).HasAmmo())
							{								
							}
							else
							{
								Instigator.PendingWeapon = Weapon(Inv);
								Instigator.ChangedWeapon();
								// [Explicit Break]
								goto J0x1DD;
							}
						}
						Inv = Inv.Inventory;
						// [Loop Continue]
						goto J0x152;
					}
				}
			}
		}
		J0x1DD:

		Destroy();		
	}
	else
	{
		PlayAnim(SelectAnim, SelectAnimRate, 0.0000000);
	}
	//return;	
}

simulated function ExplodeInHand()
{
	ClipReleaseTime = 666.0000000;
	KillSmoke();
	SetBoneScale(2, 1.0000000, ClipBone);
	HandExplodeTime = Level.TimeSeconds + 1.0000000;
	// End:0x6D
	if(IsFiring())
	{
		FireMode[0].bIsFiring = false;
		FireMode[1].bIsFiring = false;
	}
	// End:0x97
	if(int(Role) == int(ROLE_Authority))
	{
		DoExplosionEffects();
		MakeNoise(1.0000000);
		ConsumeAmmo(0, 1.0000000);
	}
	SetTimer(0.1000000, false);
	//return;	
}

function HolderDied()
{
	local int M;

	// End:0x12
	if(AmbientSound != none)
	{
		AmbientSound = none;
	}
	// End:0xE8
	if(((((((Instigator != none) && Instigator.Weapon == self) && int(Role) == int(ROLE_Authority)) && BallisticHandGrenadeFire(FireMode[0]) != none) && !FireMode[0].IsFiring()) && !FireMode[1].IsFiring()) && FireMode[0].NextFireTime < Level.TimeSeconds)
	{
		CurrentWeaponMode = 0;
		FireMode[0].HoldTime = 0.0000000;
		FireMode[0].ModeDoFire();
		CurrentWeaponMode = 1;		
	}
	else
	{
		M = 0;
		J0xEF:

		// End:0x196 [Loop If]
		if(M < 2)
		{
			// End:0x10F
			if(FireMode[M] == none)
			{
				// [Explicit Continue]
				goto J0x18C;
			}
			// End:0x18C
			if(FireMode[M].bIsFiring)
			{
				StopFire(M);
				// End:0x18C
				if(FireMode[M].bFireOnRelease && (bFireMode[M] == none) || bFireMode[M].bReleaseFireOnDie)
				{
					FireMode[M].ModeDoFire();
				}
			}
			J0x18C:

			M++;
			// [Loop Continue]
			goto J0xEF;
		}
	}
	//return;	
}

simulated function Timer()
{
	// End:0x25
	if(ClipReleaseTime == float(666))
	{
		ClipReleaseTime = 0.0000000;
		DoExplosion();		
	}
	else
	{
		// End:0x47
		if(ClipReleaseTime < float(0))
		{
			ClipReleaseTime = 0.0000000;
			DamageThisCook = 0;			
		}
		else
		{
			// End:0x5D
			if(ClipReleaseTime > float(0))
			{
				ExplodeInHand();				
			}
			else
			{
				super.Timer();
			}
		}
	}
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x15
	if(bBerserk)
	{
		Damage *= 0.7500000;
	}
	// End:0x5C
	if(Level.TimeSeconds < (ClipReleaseTime + FuseDelay))
	{
		DamageThisCook += Damage;
		// End:0x5C
		if(Damage >= DropThreshold)
		{
			HolderDied();
			DamageThisCook = 0;
		}
	}
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	ClipReleaseTime = Level.TimeSeconds + 0.2000000;
	SetTimer(FuseDelay + 0.2000000, false);
	SpawnSmoke();
	bFireMode[0].EjectBrass();
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ClipReleaseSound);
	// End:0x74
	if(!IsFiring())
	{
		PlayAnim(ClipReleaseAnim, 1.0000000, 0.1000000);
	}
	SetBoneScale(2, 0.0010000, ClipBone);
	//return;	
}

function ServerStartReload(optional byte i)
{
	// End:0x0D
	if(!bCookable)
	{
		return;
	}
	// End:0x1E
	if(ClipReleaseTime > 0.0000000)
	{
		return;
	}
	// End:0x36
	if(Ammo[0].AmmoAmount < 1)
	{
		return;
	}
	// End:0x51
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x9B
	if((FireMode[0].NextFireTime > Level.TimeSeconds) || FireMode[1].NextFireTime > Level.TimeSeconds)
	{
		return;
	}
	ClipReleaseTime = Level.TimeSeconds + 0.2000000;
	SetTimer(3.2000000, false);
	ClientStartReload(i);
	BallisticGrenadeAttachment(ThirdPersonActor).HandSmoke();
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x2C
	if(!Instigator.bNoWeaponFiring && int(ClientState) == int(4))
	{
		ServerStartReload();
	}
	//return;	
}

simulated function SpawnSmoke()
{
	// End:0x92
	if((GrenadeSmokeClass != none) && (GrenadeSmoke == none) || GrenadeSmoke.bDeleteMe)
	{
		GrenadeSmoke = Spawn(GrenadeSmokeClass);
		// End:0x6E
		if(GrenadeSmoke != none)
		{
			AttachToBone(GrenadeSmoke, SmokeBone);
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(GrenadeSmoke, DrawScale);
		}
		// End:0x92
		if(DGVEmitter(GrenadeSmoke) != none)
		{
			DGVEmitter(GrenadeSmoke).InitDGV();
		}
	}
	//return;	
}

simulated function KillSmoke()
{
	// End:0x1A
	if(GrenadeSmoke != none)
	{
		GrenadeSmoke.Kill();
	}
	GrenadeSmoke = none;
	//return;	
}

simulated function Notify_GrenadePinPull()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, PinPullSound);
	//return;	
}

simulated function Notify_GrenadeClipOff()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ClipReleaseSound);
	bFireMode[0].EjectBrass();
	SpawnSmoke();
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x2B
	if(FireMode[1].bIsFiring)
	{
		return BallisticHandGrenadeFire(FireMode[1]).CalculateThrowPower();
	}
	return BallisticHandGrenadeFire(FireMode[0]).CalculateThrowPower();
	//return;	
}

function DropFrom(Vector StartLocation)
{
	// End:0x0D
	if(!bCanThrow)
	{
		return;
	}
	// End:0x1F
	if(!HasAmmo())
	{
		PickupClass = none;
	}
	super.DropFrom(StartLocation);
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float dist, Height, Result;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	Dir = Instigator.Location - B.Enemy.Location;
	dist = VSize(Dir);
	Height = B.Enemy.Location.Z - Instigator.Location.Z;
	Result = 0.5000000;
	// End:0xD9
	if(dist > float(500))
	{
		Result -= 0.4000000;		
	}
	else
	{
		Result += 0.4000000;
	}
	// End:0x108
	if(Abs(Height) > float(32))
	{
		Result -= (Height / dist);
	}
	// End:0x11A
	if(Result > 0.5000000)
	{
		return 1;
	}
	return 0;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float dist, HeightFactor, rating;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	rating = super.GetAIRating();
	// End:0x50
	if(B.Enemy == none)
	{
		return rating;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	HeightFactor = 1.0000000 + (0.3000000 * FClamp((B.Enemy.Location.Z - Instigator.Location.Z) / float(-500), -2.0000000, 1.0000000));
	// End:0xF7
	if(dist < float(512))
	{
		return 0.5000000 * HeightFactor;
	}
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3500000, dist, 1536.0000000, 2048.0000000) * HeightFactor;
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.2000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.5000000;
	//return;	
}

defaultproperties
{
	bCookable=true
	ClipReleaseAnim="ClipOut"
	FuseDelay=3.0000000
	GrenadeBone="Grenade"
	PinBone="Pin"
	ClipBone="tip"
	SmokeBone="tip"
	DropThreshold=75
	WeaponModes[0]=(ModeName="Charged Throw",bUnavailable=false,ModeID="WM_None",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Long Throw",bUnavailable=false,ModeID="WM_None",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Short Throw",bUnavailable=false,ModeID="WM_None",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bUseSights=false
	bNoMag=true
	SightingTime=0.0000000
	MagAmmo=1
	bAimDisabled=true
	GunLength=0.0000000
	SelectAnimRate=1.8000000
	PutDownAnimRate=1.5000000
	PutDownTime=1.0000000
	BringUpTime=1.0000000
	bShowChargingBar=true
	Priority=1
	ItemName="Hand Grenade"
}
