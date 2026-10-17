class RSNovaStaff extends BallisticWeapon
	config(BallisticProV55);

var Emitter FreeZap;
var bool bCanKillZap;
var float BladeAlpha;
var Actor AmmoGlow;
var Actor CoverGlow;
var Actor Blade1Glow;
var Actor Blade2Glow;
var Actor Blade3glow;
var Actor ReloadSteam;
var Actor Arc1;
var Actor Arc2;
var Actor Arc3;
var float lastModeChangeTime;
var float NextRegenTime;
var float SoulPower;
var float MaxSouls;
var bool bOnRampage;
var RSNovaWings Wings;
var float WingPhase;
var bool bWingDown;
var() Sound WingSound;
var Emitter FreeChainZap;
var bool bCanKillChainZap;
var RSDarkNovaControl DNControl;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetOwner)
		SoulPower;
}

simulated function PostNetBeginPlay()
{
	local RSDarkNovaControl DNC;

	super.PostNetBeginPlay();
	// End:0x23
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
	{
		MaxSouls = 10.0000000;
	}
	// End:0x6F
	if((int(Role) == int(ROLE_Authority)) && DNControl == none)
	{
		// End:0x5F
		foreach DynamicActors(Class'BallisticProV55.RSDarkNovaControl', DNC)
		{
			DNControl = DNC;			
			return;			
		}		
		DNControl = Spawn(Class'BallisticProV55.RSDarkNovaControl', none);
	}
	//return;	
}

function AddSoul(float Amount)
{
	SoulPower = FClamp(SoulPower + Amount, 0.0000000, MaxSouls + 0.2000000);
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	// End:0x1D
	if(SoulPower >= MaxSouls)
	{
		StartRampage();
		ClientWeaponSpecial(1);
	}
	//return;	
}

simulated function ClientWeaponSpecial(optional byte i)
{
	// End:0x16
	if(int(i) > 0)
	{
		StartRampage();		
	}
	else
	{
		EndRampage();
	}
	//return;	
}

simulated function StartRampage()
{
	// End:0x0B
	if(bOnRampage)
	{
		return;
	}
	bOnRampage = true;
	RSNovaAttachment(ThirdPersonActor).bRampage = true;
	RSNovaPrimaryFire(bFireMode[0]).ModePowerDrain *= 0.4000000;
	// End:0x7F
	if((Instigator != none) && Instigator.Controller != none)
	{
		Instigator.Controller.GotoState('PlayerFlying');
	}
	Instigator.AirSpeed *= 1.2500000;
	WingPhase = 1.0000000;
	Wings = Spawn(Class'BallisticProV55.RSNovaWings', Instigator,, Instigator.Location, Instigator.Rotation);
	// End:0xEB
	if(Wings != none)
	{
		Wings.SetBase(Instigator);
	}
	//return;	
}

simulated function EndRampage()
{
	// End:0x0D
	if(!bOnRampage)
	{
		return;
	}
	bOnRampage = false;
	RSNovaAttachment(ThirdPersonActor).bRampage = false;
	// End:0x65
	if((Instigator != none) && int(Role) == int(ROLE_Authority))
	{
		PlayerController(Instigator.Controller).Restart();
	}
	Instigator.AirSpeed /= 1.2500000;
	// End:0x94
	if(Wings != none)
	{
		Wings.Kill();
	}
	SoulPower = 0.0000000;
	// End:0xCB
	if((int(Role) == int(ROLE_Authority)) && !Instigator.IsLocallyControlled())
	{
		ClientWeaponSpecial();
	}
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x28
	if(bOnRampage)
	{
		Damage *= 0.6000000;
		Momentum = vect(0.0000000, 0.0000000, 0.0000000);
	}
	// End:0x48
	if(FireMode[1].bIsFiring)
	{
		Momentum *= 0.6000000;
	}
	super.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

simulated function SetBladesOpen(float Alpha)
{
	BladeAlpha = FClamp(Alpha, 0.0000000, 1.0000000);
	AnimBlendParams(1, BladeAlpha, 0.0000000, 0.2000000, 'NovaUpper');
	LoopAnim('BladesWide',, 0.0000000, 1);
	//return;	
}

simulated function AddRecoil(float Amount, float FireChaos, optional byte Mode)
{
	super.AddRecoil(Amount, FireChaos, Mode);
	// End:0x63
	if(int(Mode) == 0)
	{
		// End:0x44
		if(int(CurrentWeaponMode) == 0)
		{
			SetBladesOpen(BladeAlpha + 0.2000000);			
		}
		else
		{
			// End:0x63
			if(int(CurrentWeaponMode) == 1)
			{
				SetBladesOpen(BladeAlpha + 0.1000000);
			}
		}
	}
	//return;	
}

simulated event Tick(float dt)
{
	super.Tick(dt);
	// End:0x30
	if(bOnRampage && Instigator.Weapon != self)
	{
		EndRampage();
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	local Vector End;

	super.WeaponTick(dt);
	// End:0x11C
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0xEE
		if((!Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena() && Instigator.Health > 0) && Level.TimeSeconds >= NextRegenTime)
		{
			// End:0x8C
			if(bOnRampage)
			{
				Instigator.GiveHealth(2, int(Instigator.SuperHealthMax));				
			}
			else
			{
				Instigator.GiveHealth(1, int(Instigator.HealthMax + ((Instigator.SuperHealthMax - Instigator.HealthMax) / 1.9600000)));
			}
			NextRegenTime = Level.TimeSeconds + 0.5000000;
		}
		// End:0x11C
		if(bOnRampage)
		{
			SoulPower -= (dt / float(5));
			// End:0x11C
			if(SoulPower <= float(0))
			{
				EndRampage();
			}
		}
	}
	// End:0x20F
	if(bOnRampage)
	{
		// End:0x198
		if(bWingDown)
		{
			Instigator.Velocity -= (vect(0.0000000, 0.0000000, 300.0000000) * dt);
			WingPhase += (dt * float(2));
			// End:0x195
			if(WingPhase >= 1.0000000)
			{
				WingPhase = 1.0000000;
				bWingDown = false;
				PlaySound(WingSound, 0, 1.0000000);
			}			
		}
		else
		{
			WingPhase -= (dt * float(4));
			Instigator.Velocity += (vect(0.0000000, 0.0000000, 600.0000000) * dt);
			// End:0x1F0
			if(WingPhase <= -1.0000000)
			{
				WingPhase = -1.0000000;
				bWingDown = true;
			}
		}
		// End:0x20F
		if(Wings != none)
		{
			Wings.UpdateWings(WingPhase);
		}
	}
	// End:0x245
	if(FireMode[0].IsFiring())
	{
		// End:0x242
		if(int(CurrentWeaponMode) > 1)
		{
			SetBladesOpen(BladeAlpha + dt);
		}		
	}
	else
	{
		// End:0x26E
		if(FireMode[1].IsFiring())
		{
			SetBladesOpen(BladeAlpha + dt);			
		}
		else
		{
			SetBladesOpen(BladeAlpha - (dt / 0.8000000));
		}
	}
	// End:0x321
	if(BladeAlpha > float(0))
	{
		// End:0x2C3
		if(Arc1 == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Arc1, Class'BallisticProV55.RSNovaArc', DrawScale, self, 'Arc1Src');
		}
		// End:0x2F2
		if(Arc2 == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Arc2, Class'BallisticProV55.RSNovaArc', DrawScale, self, 'Arc2Src');
		}
		// End:0x321
		if(Arc3 == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Arc3, Class'BallisticProV55.RSNovaArc', DrawScale, self, 'Arc3Src');
		}
	}
	// End:0x409
	if(Arc1 != none)
	{
		// End:0x34F
		if(BladeAlpha <= float(0))
		{
			Arc1.Destroy();
			Arc1 = none;			
		}
		else
		{
			Arc1.bHidden = false;
			End = GetBoneCoords('Arc3b').Origin;
			Arc1.SetRotation(Rotator(End - Arc1.Location));
			End = vect(1.0000000, 0.0000000, 0.0000000) * VSize(End - Arc1.Location);
			BeamEmitter(Emitter(Arc1).Emitters[0]).BeamEndPoints[0].offset = Class'BCoreProV55.BallisticEmitter'.static.VtoRV(End, End);
		}
	}
	// End:0x4F1
	if(Arc2 != none)
	{
		// End:0x437
		if(BladeAlpha <= float(0))
		{
			Arc2.Destroy();
			Arc2 = none;			
		}
		else
		{
			Arc2.bHidden = false;
			End = GetBoneCoords('Arc1b').Origin;
			Arc2.SetRotation(Rotator(End - Arc2.Location));
			End = vect(1.0000000, 0.0000000, 0.0000000) * VSize(End - Arc2.Location);
			BeamEmitter(Emitter(Arc2).Emitters[0]).BeamEndPoints[0].offset = Class'BCoreProV55.BallisticEmitter'.static.VtoRV(End, End);
		}
	}
	// End:0x5D9
	if(Arc3 != none)
	{
		// End:0x51F
		if(BladeAlpha <= float(0))
		{
			Arc3.Destroy();
			Arc3 = none;			
		}
		else
		{
			Arc3.bHidden = false;
			End = GetBoneCoords('Arc2b').Origin;
			Arc3.SetRotation(Rotator(End - Arc3.Location));
			End = vect(1.0000000, 0.0000000, 0.0000000) * VSize(End - Arc3.Location);
			BeamEmitter(Emitter(Arc3).Emitters[0]).BeamEndPoints[0].offset = Class'BCoreProV55.BallisticEmitter'.static.VtoRV(End, End);
		}
	}
	//return;	
}

simulated function RSNova_TrackingZap GetTargetZap()
{
	// End:0x0D
	if(ThirdPersonActor == none)
	{
		return none;
	}
	return RSNovaAttachment(ThirdPersonActor).TargetZap;
	//return;	
}

simulated function SetTargetZap(Actor targ, bool bHealing)
{
	// End:0x2F
	if(int(Role) == int(ROLE_Authority))
	{
		RSNovaAttachment(ThirdPersonActor).SetTargetZap(targ, bHealing);
	}
	// End:0x45
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	KillFreeZap();
	//return;	
}

simulated function SetFreeZap()
{
	// End:0x24
	if(int(Role) == int(ROLE_Authority))
	{
		RSNovaAttachment(ThirdPersonActor).SetFreeZap();
	}
	// End:0x3A
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	// End:0x5F
	if(FreeZap != none)
	{
		// End:0x5D
		if(bCanKillZap)
		{
			FreeZap.Destroy();			
		}
		else
		{
			return;
		}
	}
	KillTargetZap();
	FreeZap = Spawn(Class'BallisticProV55.RSNova_FreeZap', self);
	FreeZap.bHidden = true;
	bCanKillZap = false;
	//return;	
}

simulated function KillZap()
{
	// End:0x24
	if(int(Role) == int(ROLE_Authority))
	{
		RSNovaAttachment(ThirdPersonActor).KillZap();
	}
	// End:0x42
	if(Instigator.IsLocallyControlled())
	{
		KillTargetZap();
		KillFreeZap();
	}
	//return;	
}

simulated function KillTargetZap()
{
	Instigator.SoundPitch = 64;
	//return;	
}

simulated function KillFreeZap()
{
	// End:0x22
	if(FreeZap != none)
	{
		FreeZap.Kill();
		bCanKillZap = true;
	}
	//return;	
}

simulated function SetChainZap()
{
	// End:0x30
	if(int(Role) == int(ROLE_Authority))
	{
		RSNovaAttachment(ThirdPersonActor).SetChainZap(RSNovaPrimaryFire(FireMode[0]));
	}
	// End:0x46
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	KillFreeChainZap();
	//return;	
}

simulated function SetFreeChainZap()
{
	// End:0x24
	if(int(Role) == int(ROLE_Authority))
	{
		RSNovaAttachment(ThirdPersonActor).SetFreeChainZap();
	}
	// End:0x3A
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	// End:0x5F
	if(FreeChainZap != none)
	{
		// End:0x5D
		if(bCanKillChainZap)
		{
			FreeChainZap.Destroy();			
		}
		else
		{
			return;
		}
	}
	KillChainZap();
	FreeChainZap = Spawn(Class'BallisticProV55.RSNova_FreeChainZap', self);
	FreeChainZap.bHidden = true;
	bCanKillChainZap = false;
	//return;	
}

simulated function KillChainZaps()
{
	// End:0x24
	if(int(Role) == int(ROLE_Authority))
	{
		RSNovaAttachment(ThirdPersonActor).KillChainZaps();
	}
	// End:0x42
	if(Instigator.IsLocallyControlled())
	{
		KillChainZap();
		KillFreeChainZap();
	}
	//return;	
}

simulated function KillChainZap()
{
	Instigator.SoundPitch = 64;
	//return;	
}

simulated function KillFreeChainZap()
{
	// End:0x22
	if(FreeChainZap != none)
	{
		FreeChainZap.Kill();
		bCanKillChainZap = true;
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x22
	if(CoverGlow != none)
	{
		CoverGlow.Destroy();
	}
	// End:0x39
	if(Blade1Glow != none)
	{
		Blade1Glow.Destroy();
	}
	// End:0x50
	if(Blade2Glow != none)
	{
		Blade2Glow.Destroy();
	}
	// End:0x67
	if(Blade3glow != none)
	{
		Blade3glow.Destroy();
	}
	// End:0x159
	if((Instigator.IsLocallyControlled() && int(Level.DetailMode) >= int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2)
	{
		CoverGlow = none;
		Blade1Glow = none;
		Blade2Glow = none;
		Blade3glow = none;
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(CoverGlow, Class'BallisticProV55.RSNovaCoverGlow', DrawScale, self, 'gem');
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Blade1Glow, Class'BallisticProV55.RSNovaBladeGlow', DrawScale, self, 'blade1');
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Blade2Glow, Class'BallisticProV55.RSNovaBladeGlow', DrawScale, self, 'blade2');
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Blade3glow, Class'BallisticProV55.RSNovaBladeGlow', DrawScale, self, 'blade3');
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x1A
	if(super.PutDown())
	{
		// End:0x18
		if(bOnRampage)
		{
			EndRampage();
		}
		return true;
	}
	return false;
	//return;	
}

simulated exec function CockGun(optional byte Type)
{
	//return;	
}

function ServerCockGun(optional byte Type)
{
	//return;	
}

simulated function Notify_NovaOpenFX()
{
	// End:0x1E
	if(ReloadSteam != none)
	{
		ReloadSteam.Destroy();
		ReloadSteam = none;
	}
	Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(ReloadSteam, Class'BallisticProV55.RSNovaSteam', DrawScale, self, 'fX');
	ReloadSteam.SetRelativeRotation(rot(0, 32768, 0));
	//return;	
}

simulated function Notify_NovaOpenGlow()
{
	Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AmmoGlow, Class'BallisticProV55.RSNovaAmmoGlow', DrawScale, self, 'Ammo');
	//return;	
}

simulated function Notify_NovaCloseGlow()
{
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(AmmoGlow);
	//return;	
}

simulated function bool StartFire(int Mode)
{
	// End:0x17
	if(AmmoGlow != none)
	{
		AmmoGlow.Destroy();
	}
	return super.StartFire(Mode);
	//return;	
}

simulated event Timer()
{
	// End:0x60
	if(int(ClientState) == int(3))
	{
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(CoverGlow);
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(Blade1Glow);
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(Blade2Glow);
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(Blade3glow);
	}
	super.Timer();
	//return;	
}

simulated event RenderOverlays(Canvas C)
{
	local Vector End, X, Y, Z;

	super.RenderOverlays(C);
	// End:0xC8
	if(FreeChainZap != none)
	{
		GetViewAxes(X, Y, Z);
		FreeChainZap.SetLocation(ConvertFOVs(GetBoneCoords('tip').Origin, DisplayFOV, Instigator.Controller.FovAngle, 96.0000000));
		FreeChainZap.SetRotation(Rotator(Vector(GetAimPivot() * 0.5000000) >> Instigator.GetViewRotation()));
		C.DrawActor(FreeChainZap, false, false, Instigator.Controller.FovAngle);
	}
	// End:0x3C0
	if(FreeZap != none)
	{
		GetViewAxes(X, Y, Z);
		FreeZap.SetLocation(ConvertFOVs(GetBoneCoords('tip').Origin, DisplayFOV, Instigator.Controller.FovAngle, 96.0000000));
		FreeZap.SetRotation(Rotator(Vector(GetAimPivot() * 0.5000000) >> Instigator.GetViewRotation()));
		End = X * float(1000);
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset = Class'BCoreProV55.BallisticEmitter'.static.VtoRV(End, End);
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset.X.Min -= (float(200) * Abs(X.Z));
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset.X.Max += (float(200) * Abs(X.Z));
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset.Y.Min -= (float(200) * Abs(X.X));
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset.Y.Max += (float(200) * Abs(X.X));
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset.Z.Min -= (float(200) * (float(1) - Abs(X.Z)));
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset.Z.Max += (float(200) * (float(1) - Abs(X.Z)));
		BeamEmitter(FreeZap.Emitters[2]).BeamEndPoints[0].offset = BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset;
		C.DrawActor(FreeZap, false, false, Instigator.Controller.FovAngle);
	}
	// End:0x45D
	if((GetTargetZap()) != none)
	{
		GetTargetZap().bHidden = true;
		GetTargetZap().SetLocation(ConvertFOVs(GetBoneCoords('tip').Origin, DisplayFOV, Instigator.Controller.FovAngle, 96.0000000));
		GetTargetZap().UpdateTargets();
		C.DrawActor(GetTargetZap(), false, false, Instigator.Controller.FovAngle);
	}
	//return;	
}

simulated function Vector ConvertFOVs(Vector InVec, float InFOV, float OutFOV, float Distance)
{
	local Vector ViewLoc, Outvec, Dir, X, Y, Z;

	local Rotator ViewRot;

	ViewLoc = Instigator.Location + Instigator.EyePosition();
	ViewRot = Instigator.GetViewRotation();
	Dir = InVec - ViewLoc;
	GetAxes(ViewRot, X, Y, Z);
	Outvec.X = Distance / Tan((OutFOV * 3.1415930) / float(360));
	Outvec.Y = ((Dir Dot Y) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec.Z = ((Dir Dot Z) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec = Outvec >> ViewRot;
	return Outvec + ViewLoc;
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(FreeZap != none)
	{
		FreeZap.Destroy();
	}
	// End:0xDF
	if((Instigator.AmbientSound == UsedAmbientSound) || Instigator.AmbientSound == RSNovaPrimaryFire(FireMode[0]).FireSoundLoop)
	{
		Instigator.AmbientSound = none;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
		Instigator.SoundPitch = Instigator.default.SoundPitch;
		Instigator.SoundRadius = Instigator.default.SoundRadius;
		Instigator.bFullVolume = Instigator.default.bFullVolume;
	}
	// End:0xEE
	if(bOnRampage)
	{
		EndRampage();
	}
	// End:0x105
	if(ReloadSteam != none)
	{
		ReloadSteam.Destroy();
	}
	// End:0x11C
	if(AmmoGlow != none)
	{
		AmmoGlow.Destroy();
	}
	// End:0x133
	if(CoverGlow != none)
	{
		CoverGlow.Destroy();
	}
	// End:0x14A
	if(Blade1Glow != none)
	{
		Blade1Glow.Destroy();
	}
	// End:0x161
	if(Blade2Glow != none)
	{
		Blade2Glow.Destroy();
	}
	// End:0x178
	if(Blade3glow != none)
	{
		Blade3glow.Destroy();
	}
	// End:0x18F
	if(Arc1 != none)
	{
		Arc1.Destroy();
	}
	// End:0x1A6
	if(Arc2 != none)
	{
		Arc2.Destroy();
	}
	// End:0x1BD
	if(Arc3 != none)
	{
		Arc3.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function FirePressed(float F)
{
	// End:0x1E
	if(bNeedReload && MagAmmo > 0)
	{
		bNeedReload = false;
	}
	super.FirePressed(F);
	//return;	
}

simulated function float RateSelf()
{
	// End:0x54
	if(((PlayerController(Instigator.Controller) != none) && Ammo[0].AmmoAmount < 1) && MagAmmo < 1)
	{
		CurrentRating = super.RateSelf() * 0.2000000;		
	}
	else
	{
		return super.RateSelf();
	}
	return CurrentRating;
	//return;	
}

simulated function float ChargeBar()
{
	return SoulPower / MaxSouls;
	//return;	
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	super.GiveTo(Other, Pickup);
	// End:0x39
	if(RSNovaPickup(Pickup) != none)
	{
		AddSoul(RSNovaPickup(Pickup).SoulPower);
	}
	//return;	
}

function DropFrom(Vector StartLocation)
{
	local int M;
	local Pickup Pickup;

	// End:0x0D
	if(!bCanThrow)
	{
		return;
	}
	// End:0x1F
	if(AmbientSound != none)
	{
		AmbientSound = none;
	}
	ClientWeaponThrown();
	M = 0;
	J0x2C:

	// End:0x78 [Loop If]
	if(M < 2)
	{
		// End:0x6E
		if((FireMode[M] != none) && FireMode[M].bIsFiring)
		{
			StopFire(M);
		}
		M++;
		// [Loop Continue]
		goto J0x2C;
	}
	// End:0x8E
	if(Instigator != none)
	{
		DetachFromPawn(Instigator);
	}
	Pickup = Spawn(PickupClass, self,, StartLocation);
	// End:0x125
	if(Pickup != none)
	{
		// End:0xD8
		if(Instigator.Health > 0)
		{
			WeaponPickup(Pickup).bThrown = true;
		}
		Pickup.InitDroppedPickupFor(self);
		Pickup.Velocity = Velocity;
		// End:0x125
		if(RSNovaPickup(Pickup) != none)
		{
			RSNovaPickup(Pickup).SoulPower = SoulPower;
		}
	}
	Destroy();
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float dist;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	dist = VSize(Instigator.Location - B.Enemy.Location);
	// End:0xA9
	if(((MagAmmo < 1) || int(ReloadState) != int(0)) || dist < FireMode[1].MaxRange())
	{
		return 1;
	}
	// End:0xE2
	if((Level.TimeSeconds - lastModeChangeTime) < (1.4000000 - (B.Skill * 0.1500000)))
	{
		return 0;
	}
	// End:0x148
	if((dist > float(2048)) && MagAmmo > 4)
	{
		// End:0x145
		if(int(CurrentWeaponMode) != 0)
		{
			lastModeChangeTime = Level.TimeSeconds;
			CurrentWeaponMode = 0;
			RSNovaPrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
		}		
	}
	else
	{
		// End:0x18C
		if(int(CurrentWeaponMode) != 1)
		{
			lastModeChangeTime = Level.TimeSeconds;
			CurrentWeaponMode = 1;
			RSNovaPrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
		}
	}
	return 0;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float dist;

	// End:0x28
	if((Instigator != none) && Instigator.Health < 50)
	{
		return 0.3000000;
	}
	B = Bot(Instigator.Controller);
	// End:0x52
	if(B == none)
	{
		return AIRating;
	}
	// End:0x89
	if((HasMagAmmo(0)) || Ammo[0].AmmoAmount > 0)
	{
		// End:0x89
		if(RecommendHeal(B))
		{
			return 1.2000000;
		}
	}
	// End:0xA4
	if(B.Enemy == none)
	{
		return super.GetAIRating();
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(super.GetAIRating(), 0.5000000, dist, 3072.0000000, 3072.0000000);
	//return;	
}

function bool CanHeal(Actor Other)
{
	// End:0x2F
	if((DestroyableObjective(Other) != none) && DestroyableObjective(Other).LinkHealMult > float(0))
	{
		return true;
	}
	// End:0x5E
	if((Vehicle(Other) != none) && Vehicle(Other).LinkHealMult > float(0))
	{
		return true;
	}
	return false;
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.2000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.2000000;
	//return;	
}

defaultproperties
{
	MaxSouls=5.0000000
	WingSound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Flying'
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;40.0;1.0;80.0;1.0;0.0;1.0")
	ParamsClasses[0]=Class'BallisticProV55.RSNovaWeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.RSNovaWeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.RSNovaWeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.RSNovaWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.NovaStaff.BigIcon_NovaStaff'
	BigIconCoords=(X1=0,Y1=32,X2=511,Y2=230)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Pullout',Volume=0.2080000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Putaway',Volume=0.2080000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Slow Bolt",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Lightning",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Thunder Strike",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="Chain Lightning",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightZoomFactor=1.2000000
	SightBobScale=0.7000000
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-CrystalOut',Volume=0.7000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-CrystalIn',Volume=0.7000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.7000000
	NDCrosshairCfg=(Pic1=TexRotator'BW_Core_WeaponTex.NovaStaff.NovaOutA-Rot',Pic2=TexRotator'BW_Core_WeaponTex.NovaStaff.NovaInA-Rot',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=221,B=0,A=130),Color2=(R=185,G=187,B=184,A=229),StartSize1=106,StartSize2=50)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.2500000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=3.0000000,CurrentScale=0.0000000)
	NDCrosshairChaosFactor=0.5000000
	bWT_Heal=true
	ManualLines[0]="Slow Bolts deal high damage, gain damage over range and leech enemy HP for the user. This mode damages the user if used from the hip.|Rapid Fire bolts have moderate damage and gain damage over range.|The Lightning mode locks onto an enemy, deals damage and inflicts blind. Alternatively, it can be used to rapidly heal allies. It costs low soul power.|Thunder Strike mode generates a thunder bolt with medium range and excellent damage output. It inflicts severe damage at high soul cost.|Chain Lightning attacks multiple enemies on screen in the same fashion as Lightning, but drains soul power at an alarming rate."
	ManualLines[1]="Melee attack. Damage increases the longer Altfire is held, up to 1.5 seconds for maximum bonus. Deals more damage from behind. Leeches half of the damage dealt as health for the wielder."
	ManualLines[2]="Enemies killed by this weapon leave souls behind. These can be collected to power the Lightning, Thunder Strike and Chain Lightning modes. Use of those modes without external soul power will cause the user's soul to be used instead, dealing significant backlash damage.||With full soulpower, the weapon can enter rampage mode, reducing all damage taken and granting the ability to fly. In this mode, soulpower will drain over time.||Effective at close and medium range."
	SightOffset=(X=-10.0000000,Y=0.0000000,Z=5.5000000)
	GunLength=128.0000000
	FireModeClass[0]=Class'BallisticProV55.RSNovaPrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.RSNovaMeleeFire'
	PutDownAnimRate=1.4000000
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7000000
	CurrentRating=0.7000000
	bShowChargingBar=true
	Description="During a mining excavation of the large crater in sector-547b on one of the distant Outword planets, a strage, magnificent artifact was discovered. Generating great interest in the isolated facility, superstitious miners beleived it to be a magical device capable of everything from allowing god to read their minds to teleportation and the summoning of demons. The artifact was subjected to all manner of tests, but proved to be a confounding subject and revealed very little. It was made of an unimaginably strong material and appeared apparently undamaged despite it's intricate construction. For all they could say, it may have been nothing more than a candlestick.|Finally, mine coordinator R Peters, who had had a greedy eye fixed on the artifact since day one, ordered the tests cancelled and retired the artifact to his office."
	Priority=9
	HudColor=(R=100,G=175,B=255,A=255)
	InventoryGroup=5
	GroupOffset=3
	PickupClass=Class'BallisticProV55.RSNovaPickup'
	PlayerViewOffset=(X=10.0000000,Y=5.0000000,Z=-4.5000000)
	AttachmentClass=Class'BallisticProV55.RSNovaAttachment'
	IconMaterial=Texture'BW_Core_WeaponTex.NovaStaff.SmallIcon_NovaStaff'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="Nova Staff"
	LightType=2
	LightEffect=13
	LightHue=180
	LightSaturation=96
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.NovaStaff_FPm'
	DrawScale=0.3000000
	bFullVolume=true
	SoundRadius=32.0000000
}
