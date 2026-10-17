class HVCMk9SecondaryFire extends BallisticInstantFire;

var() bool bDoOverCharge;
var bool bPendingOwnerZap;
var float PendingZapFactor;
var() Sound ChargeSound;
var float ChargePower;

simulated function PlayPreFire()
{
	// End:0x58
	if(HVCMk9LightningGun(Weapon).Spiral == none)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(HVCMk9LightningGun(Weapon).Spiral, Class'BallisticProV55.HVCMk9_RedSpiral', Weapon.DrawScale, Weapon, 'drum');
	}
	BW.SafeLoopAnim('Idle', 2.0000000, TweenTime,, "IDLE");
	//return;	
}

function float ResolveDamageFactors(Actor Other, Vector TraceStart, Vector HitLocation, int PenetrateCount, int WallCount, int WallPenForce, Vector WaterHitLocation)
{
	KickForce = int(ChargePower * float(default.KickForce));
	return super.ResolveDamageFactors(Other, TraceStart, HitLocation, PenetrateCount, WallCount, WallPenForce, WaterHitLocation) * ChargePower;
	//return;	
}

function PlayFiring()
{
	HVCMk9LightningGun(Weapon).ResetArcs();
	BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0xB2
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	//return;	
}

simulated event ModeDoFire()
{
	local float F;

	F = ChargePower;
	FirePushbackForce = default.FirePushbackForce * F;
	HVCMk9LightningGun(Weapon).AddHeat(1.2000000);
	// End:0x43
	if(Instigator == none)
	{
		return;
	}
	Instigator.SoundVolume = Weapon.default.SoundVolume;
	Instigator.SoundPitch = Weapon.default.SoundPitch;
	Instigator.AmbientSound = BW.UsedAmbientSound;
	GotoState('None');
	super(BallisticFire).ModeDoFire();
	ChargePower = 0.0000000;
	// End:0xCF
	if(bDoOverCharge)
	{
		NextFireTime += 2.0000000;
		bDoOverCharge = false;
	}
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x0F
	if(ChargePower > float(0))
	{
		return true;
	}
	// End:0x62
	if((((HoldTime <= float(0)) && HVCMk9LightningGun(Weapon).HeatLevel >= float(10)) || HVCMk9LightningGun(Weapon).bIsVenting) || !super(BallisticFire).AllowFire())
	{
		return false;
	}
	return true;
	//return;	
}

simulated event ModeTick(float dt)
{
	super(BallisticFire).ModeTick(dt);
	// End:0x18
	if(!bIsFiring)
	{
		return;
	}
	// End:0x55
	if(Instigator.PhysicsVolume.bWaterVolume)
	{
		HVCMk9LightningGun(Weapon).AddHeat(dt * float(3));		
	}
	else
	{
		HVCMk9LightningGun(Weapon).AddHeat(dt * 0.7500000);
	}
	Instigator.SoundPitch = byte(float(56) + (ChargePower * float(32)));
	// End:0x10D
	if(((int(Weapon.Role) == int(ROLE_Authority)) && !bDoOverCharge) && HVCMk9LightningGun(Weapon).HeatLevel > float(10))
	{
		bDoOverCharge = true;
		HVCMk9LightningGun(Weapon).ClientOverCharge();
		Weapon.ServerStopFire(byte(ThisModeNum));
	}
	//return;	
}

simulated function ModeHoldFire()
{
	Instigator.AmbientSound = ChargeSound;
	Instigator.SoundVolume = byte(255);
	Instigator.SoundPitch = 56;
	GotoState('Charging');
	super(WeaponFire).ModeHoldFire();
	//return;	
}

event Timer()
{
	// End:0x8C
	if(bPendingOwnerZap)
	{
		bPendingOwnerZap = false;
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, PendingZapFactor * float(180), Instigator, Instigator.Location + (Vector(Instigator.GetViewRotation()) * Instigator.CollisionRadius), (float(KickForce) * PendingZapFactor) * Vector(Instigator.GetViewRotation()), Class'BallisticProV55.DT_HVCOverheat');
	}
	//return;	
}

function DoTrace(Vector Start, Rotator Dir)
{
	local Actor Victims;
	local Vector X;
	local float F;

	// End:0x1D
	if(!bDoOverCharge)
	{
		OldDoTrace(Start, Dir);
		return;
	}
	X = Vector(Dir);
	SendFireEffect(Level, Start + (X * float(64)), -X, 0);
	F = ChargePower;
	// End:0x15F
	foreach Instigator.VisibleCollidingActors(Class'Engine.Actor', Victims, 192.0000000, Start + (X * float(64)))
	{
		// End:0x15E
		if((!Victims.IsA('FluidSurfaceInfo') && !Victims.bWorldGeometry) && Victims.bCanBeDamaged)
		{
			// End:0xFB
			if(Victims == Instigator)
			{
				PendingZapFactor = F;
				bPendingOwnerZap = true;
				SetTimer(0.1500000, false);
				// End:0x15E
				continue;
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, F * float(180), Instigator, Victims.Location - (X * Victims.CollisionRadius), (F * float(KickForce)) * X, Class'BallisticProV55.DT_HVCOverheat');
		}		
	}	
	//return;	
}

function OldDoTrace(Vector InitialStart, Rotator Dir)
{
	local int PenCount, WallCount;
	local Vector End, X, HitLocation, HitNormal, Start, WaterHitLoc,
		LastHitLoc;

	local Material HitMaterial;
	local float dist;
	local Actor Other, LastOther;
	local bool bHitWall;

	dist = TraceRange.Min + (FRand() * (TraceRange.Max - TraceRange.Min));
	Start = InitialStart;
	X = Normal(Vector(Dir));
	End = Start + (X * dist);
	LastHitLoc = End;
	Weapon.bTraceWater = true;
	J0x7B:

	// End:0x2ED [Loop If]
	if(dist > float(0))
	{
		Other = Trace(HitLocation, HitNormal, End, Start, true,, HitMaterial);
		Weapon.bTraceWater = false;
		dist -= VSize(HitLocation - Start);
		// End:0x120
		if((int(Level.NetMode) == int(NM_Client)) && (int(Other.Role) != int(ROLE_Authority)) || Other.bWorldGeometry)
		{
			// [Explicit Break]
			goto J0x2ED;
		}
		// End:0x2DC
		if(Other != none)
		{
			// End:0x18B
			if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
			{
				SendFireEffect(Other, HitLocation, HitNormal, 9);
				bHitWall = true;
				// [Explicit Break]
				goto J0x2ED;				
			}
			else
			{
				LastHitLoc = HitLocation;
			}
			// End:0x20D
			if(!Other.bWorldGeometry && Other != LastOther)
			{
				OnTraceHit(Other, HitLocation, InitialStart, X, PenCount, WallCount, 0);
				LastOther = Other;
				SendFireEffect(Other, HitLocation, HitNormal, 9);
				bHitWall = true;
				// [Explicit Break]
				goto J0x2ED;
			}
			// End:0x25A
			if(Other.bWorldGeometry || Mover(Other) != none)
			{
				bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);
				// [Explicit Break]
				goto J0x2ED;
			}
			// End:0x2D6
			if((Other == Instigator) || Other == LastOther)
			{
				Start = HitLocation + (X * FMax(32.0000000, Other.CollisionRadius * float(2)));
				End = Start + (X * dist);
				Weapon.bTraceWater = true;
				// [Explicit Continue]
				goto J0x2EA;
			}
			// [Explicit Break]
			goto J0x2ED;			
		}
		else
		{
			LastHitLoc = End;
			// [Explicit Break]
			goto J0x2ED;
		}
		J0x2EA:

		// [Loop Continue]
		goto J0x7B;
	}
	J0x2ED:

	// End:0x315
	if(!bHitWall)
	{
		NoHitEffect(X, InitialStart, LastHitLoc, WaterHitLoc);		
	}
	else
	{
		TargetedHurtRadius(100.0000000 * ChargePower, 192.0000000, Class'BallisticProV55.DT_HVCRedLightning', 2000.0000000, HitLocation, Other);
	}
	//return;	
}

function NoHitEffect(Vector Dir, optional Vector Start, optional Vector HitLocation, optional Vector WaterHitLoc)
{
	// End:0x45
	if((Weapon != none) && int(Level.NetMode) != int(NM_Client))
	{
		SendFireEffect(none, Dir, vect(0.0000000, 0.0000000, 0.0000000), 0, WaterHitLoc);
	}
	//return;	
}

simulated function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;

	// End:0x150
	foreach Instigator.VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x14F
		if(((int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim)
		{
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
		}		
	}	
	//return;	
}

simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
{
	HVCMk9Attachment(Weapon.ThirdPersonActor).ChargePower = byte(float(255) * ChargePower);
	super(BallisticFire).SendFireEffect(Other, HitLocation, HitNormal, Surf, WaterHitLoc);
	//return;	
}

state Charging
{
	function BeginState()
	{
		SetTimer(0.2000000, true);
		Timer();
		//return;		
	}

	event Timer()
	{
		// End:0x6C
		if((Weapon.AmmoAmount(0) > 0) && ChargePower < float(1))
		{
			// End:0x53
			if(int(Weapon.Role) == int(ROLE_Authority))
			{
				Weapon.ConsumeAmmo(0, 1.0000000);
			}
			ChargePower = FMin(1.0000000, ChargePower + 0.0500000);
		}
		//return;		
	}

	function EndState()
	{
		SetTimer(0.0000000, false);
		//return;		
	}
	stop;	
}

defaultproperties
{
	ChargeSound=Sound'BW_Core_WeaponSound.LightningGun.LG-Charge'
	DamageType=Class'BallisticProV55.DT_HVCRedLightning'
	DamageTypeHead=Class'BallisticProV55.DT_HVCRedLightning'
	DamageTypeArm=Class'BallisticProV55.DT_HVCRedLightning'
	KickForce=80000
	bNoPositionalDamage=true
	MuzzleFlashClass=Class'BallisticProV55.HVCMk9RedMuzzleFlash'
	FireRecoil=96.0000000
	FirePushbackForce=1600.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.LightningGun.LG-SecFire',Volume=0.9000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bFireOnRelease=true
	FireAnim="Fire2"
	FireEndAnim="None"
	FireRate=0.7000000
	AmmoClass=Class'BallisticProV55.Ammo_HVCCells'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-300.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.4000000
	WarnTargetPct=0.8000000
}
