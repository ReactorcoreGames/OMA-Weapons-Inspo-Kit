class RSDarkStar extends BallisticWeapon
	config(BallisticProV55);

var int MaxSoulPower;
var float BladeAlpha;
var float DesiredBladeAlpha;
var float BladeShiftSpeed;
var Actor DiamondGlow;
var Actor Arc1;
var float lastModeChangeTime;
var RSDarkChainsawPanner ChainsawPanner;
var float ChainSpeed;
var RSDarkFlameSpray Flame;
var bool bLatchedOn;
var float SoulPower;
var float MaxSouls;
var bool bOnRampage;
var RSDarkHorns Horns;
var Actor RampageGlow;
var RSDarkNovaControl DNControl;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetOwner)
		SoulPower;

	// Pos:0x018
	reliable if(int(Role) == int(ROLE_Authority))
		bLatchedOn;
}

simulated function PostNetBeginPlay()
{
	local RSDarkNovaControl DNC;

	super.PostNetBeginPlay();
	// End:0x20
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
	{
		MaxSoulPower = 10;
	}
	// End:0x6C
	if((int(Role) == int(ROLE_Authority)) && DNControl == none)
	{
		// End:0x5C
		foreach DynamicActors(Class'BallisticProV55.RSDarkNovaControl', DNC)
		{
			DNControl = DNC;			
			return;			
		}		
		DNControl = Spawn(Class'BallisticProV55.RSDarkNovaControl', none);
	}
	//return;	
}

simulated function AnimEnded(int Channel, name Anim, float frame, float Rate)
{
	// End:0x22
	if(Anim == ZoomInAnim)
	{
		SightingState = 3;
		ScopeUpAnimEnd();
		return;		
	}
	else
	{
		// End:0x41
		if(Anim == ZoomOutAnim)
		{
			SightingState = 0;
			ScopeDownAnimEnd();
			return;
		}
	}
	// End:0x20E
	if(((int(ClientState) == int(4)) || (int(ClientState) == int(0)) && Instigator.Weapon == self) && int(ReloadState) == int(0))
	{
		// End:0xEB
		if((Anim == FireMode[0].FireAnim) && HasAnim(FireMode[0].FireEndAnim))
		{
			SafePlayAnim(FireMode[0].FireEndAnim, FireMode[0].FireEndAnimRate, 0.0000000);			
		}
		else
		{
			// End:0x15A
			if(((FireMode[1] != none) && Anim == FireMode[1].FireAnim) && HasAnim(FireMode[1].FireEndAnim))
			{
				SafePlayAnim(FireMode[1].FireEndAnim, FireMode[1].FireEndAnimRate, 0.0000000);				
			}
			else
			{
				// End:0x192
				if(int(MeleeState) < int(2))
				{
					// End:0x192
					if((Anim != 'SawAttack') && Anim != 'SawIdle')
					{
						bPreventReload = false;
					}
				}
			}
		}
		// End:0x20E
		if(((Channel == 0) && bNeedReload || ((FireMode[0] == none) || !FireMode[0].bIsFiring) && (FireMode[1] == none) || !FireMode[1].bIsFiring) && int(MeleeState) < int(2))
		{
			PlayIdle();
		}
	}
	// End:0x22E
	if(int(ReloadState) == int(4))
	{
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x285
	if(int(ReloadState) == int(6))
	{
		// End:0x275
		if((MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
		{
			PlayShovelEnd();
			ReloadState = 7;
			return;
		}
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x2F8
	if((int(ReloadState) == int(3)) || int(ReloadState) == int(7))
	{
		// End:0x2C6
		if(bNeedCock && MagAmmo > 0)
		{
			CommonCockGun();			
		}
		else
		{
			bNeedCock = false;
			ReloadState = 0;
			ReloadFinished();
			PlayIdle();
			AimComponent.Reaim(0.0500000);
		}
		return;
	}
	// End:0x338
	if(int(ReloadState) == int(8))
	{
		bNeedCock = false;
		ReloadState = 0;
		ReloadFinished();
		PlayIdle();
		AimComponent.Reaim(0.0500000);
	}
	// End:0x36E
	if(int(ReloadState) == int(9))
	{
		// End:0x360
		if(int(Role) == int(ROLE_Authority))
		{
			bServerReloading = false;
		}
		ReloadState = 0;
		PlayIdle();
	}
	//return;	
}

simulated function bool CanUseSights()
{
	// End:0x16
	if(FireMode[1].IsFiring())
	{
		return false;
	}
	return super.CanUseSights();
	//return;	
}

function AddSoul(float Amount)
{
	SoulPower = FClamp(SoulPower + Amount, 0.0000000, float(MaxSoulPower) + 0.2000000);
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	// End:0x1F
	if(SoulPower >= float(MaxSoulPower))
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

simulated function bool CheckWeaponMode(int Mode)
{
	// End:0x0D
	if(Mode == 1)
	{
		return true;
	}
	return super.CheckWeaponMode(Mode);
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
	RSDarkAttachment(ThirdPersonActor).bRampage = true;
	RSDarkPrimaryFire(bFireMode[0]).ModePowerDrain *= 0.4000000;
	// End:0x75
	if(int(Role) == int(ROLE_Authority))
	{
		Instigator.GroundSpeed *= 1.2500000;
		PlayerSpeedFactor = 1.2500000;
	}
	// End:0x14D
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Horns = Spawn(Class'BallisticProV55.RSDarkHorns', Instigator);
		// End:0xC5
		if(Horns != none)
		{
			Instigator.AttachToBone(Horns, 'head');
		}
		// End:0xDC
		if(RampageGlow != none)
		{
			RampageGlow.Destroy();
		}
		// End:0x14D
		if((Instigator.IsLocallyControlled() && int(Level.DetailMode) >= int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2)
		{
			RampageGlow = none;
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(RampageGlow, Class'BallisticProV55.RSDarkRampageGlow', DrawScale, self, 'tip');
		}
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
	RSDarkAttachment(ThirdPersonActor).bRampage = false;
	// End:0x5B
	if(int(Role) == int(ROLE_Authority))
	{
		Instigator.GroundSpeed /= 1.2500000;
		PlayerSpeedFactor = 1.0000000;
	}
	Instigator.AmbientSound = none;
	// End:0x82
	if(Horns != none)
	{
		Horns.Destroy();
	}
	// End:0x99
	if(RampageGlow != none)
	{
		RampageGlow.Destroy();
	}
	SoulPower = 0.0000000;
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

simulated function float GetModifiedJumpZ(Pawn P)
{
	// End:0x1C
	if(bOnRampage)
	{
		return super.GetModifiedJumpZ(P) * 2.0000000;
	}
	return super.GetModifiedJumpZ(P);
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x20
	if(FireMode[1].IsFiring())
	{
		Momentum *= 0.5000000;
	}
	// End:0x41
	if(bOnRampage)
	{
		Damage *= 0.4000000;
		Momentum *= 0.5000000;
	}
	super.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

simulated function SetBladesOpen(float Alpha)
{
	BladeAlpha = FClamp(Alpha, 0.0000000, 1.0000000);
	AnimBlendParams(1, BladeAlpha, 0.0000000, 0.2000000, 'Holder');
	LoopAnim('BladesOpen',, 0.0000000, 1);
	//return;	
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	super.DisplayDebug(Canvas, YL, YPos);
	Canvas.SetDrawColor(128, 0, byte(255));
	Canvas.DrawText((("DarkStar: ChainSpeed: " $ string(ChainSpeed)) $ ", BladeAlpha: ") $ string(BladeAlpha));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	//return;	
}

simulated event WeaponTick(float dt)
{
	local float AccelLimit;

	super.WeaponTick(dt);
	// End:0x39
	if(bOnRampage)
	{
		SoulPower -= (dt / float(8));
		// End:0x39
		if(SoulPower <= float(0))
		{
			EndRampage();
		}
	}
	// End:0x7D
	if(BladeAlpha != DesiredBladeAlpha)
	{
		SetBladesOpen(BladeAlpha + FClamp(DesiredBladeAlpha - BladeAlpha, -BladeShiftSpeed * dt, BladeShiftSpeed * dt));
	}
	// End:0x9F
	if(FireMode[0].IsFiring())
	{
		ChainSpeed = 0.0000000;		
	}
	else
	{
		// End:0x192
		if(FireMode[1].IsFiring())
		{
			DesiredBladeAlpha = 0.0000000;
			BladeShiftSpeed = 4.0000000;
			// End:0x18F
			if(BladeAlpha <= float(0))
			{
				// End:0x13A
				if(bLatchedOn && ChainSpeed != 1.5000000)
				{
					AccelLimit = (0.5000000 + (4.0000000 * (ChainSpeed / float(2)))) * dt;
					ChainSpeed += FClamp(1.5000000 - ChainSpeed, -AccelLimit, AccelLimit);					
				}
				else
				{
					// End:0x18F
					if(!bLatchedOn && ChainSpeed != float(2))
					{
						AccelLimit = (0.5000000 + ChainSpeed) * dt;
						ChainSpeed += FClamp(2.0000000 - ChainSpeed, -AccelLimit, AccelLimit);
					}
				}
			}			
		}
		else
		{
			// End:0x234
			if((int(ClientState) == int(4)) && FireMode[1].NextFireTime < (Level.TimeSeconds - float(1)))
			{
				// End:0x21E
				if(ChainSpeed != float(0))
				{
					AccelLimit = (0.5000000 + (1.5000000 * (ChainSpeed / float(2)))) * dt;
					ChainSpeed += FClamp(-ChainSpeed, -AccelLimit, AccelLimit);					
				}
				else
				{
					DesiredBladeAlpha = 1.0000000;
					BladeShiftSpeed = 3.0000000;
				}
			}
		}
	}
	// End:0x25D
	if(DesiredBladeAlpha == float(0))
	{
		SoundPitch = byte(float(32) + (float(32) * ChainSpeed));		
	}
	else
	{
		SoundPitch = default.SoundPitch;
	}
	// End:0x289
	if(ChainsawPanner != none)
	{
		ChainsawPanner.PanRate = -ChainSpeed;
	}
	// End:0x2C5
	if(BladeAlpha > float(0))
	{
		// End:0x2C5
		if(Arc1 == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Arc1, Class'BallisticProV55.RSDarkArcs', DrawScale, self, 'tip');
		}
	}
	// End:0x30C
	if(Arc1 != none)
	{
		// End:0x2F3
		if(BladeAlpha <= float(0))
		{
			Arc1.Destroy();
			Arc1 = none;			
		}
		else
		{
			RSDarkArcs(Arc1).SetGap(BladeAlpha);
		}
	}
	// End:0x390
	if(((ThirdPersonActor != none) && !Instigator.IsFirstPerson()) && AIController(Instigator.Controller) == none)
	{
		// End:0x390
		if(Flame != none)
		{
			Flame.SetLocation(RSDarkAttachment(ThirdPersonActor).GetModeTipLocation());
			Flame.SetRotation(Rotator(GetFireDir() >> (GetPlayerAim())));
		}
	}
	//return;	
}

simulated event RenderOverlays(Canvas C)
{
	super.RenderOverlays(C);
	// End:0x76
	if(Flame != none)
	{
		Flame.SetLocation(ConvertFOVs(GetBoneCoords('tip').Origin, DisplayFOV, Instigator.Controller.FovAngle, 32.0000000));
		Flame.SetRotation(Rotator(GetFireDir() >> (GetPlayerAim())));
	}
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	// End:0x25
	if((int(CurrentWeaponMode) > 0) && FireMode[0].IsFiring())
	{
		return;
	}
	super.ServerSwitchWeaponMode(newmode);
	//return;	
}

static function ScaleRV(out RangeVector RV, float Scale)
{
	RV.X.Max *= Scale;
	RV.Y.Max *= Scale;
	RV.Z.Max *= Scale;
	RV.X.Min *= Scale;
	RV.Y.Min *= Scale;
	RV.Z.Min *= Scale;
	//return;	
}

static function ScaleEmitter(Emitter TheOne, float Scale)
{
	local int i, j;

	i = 0;
	J0x07:

	// End:0x3A2 [Loop If]
	if(i < TheOne.Emitters.Length)
	{
		ScaleRV(TheOne.Emitters[i].StartVelocityRange, Scale);
		TheOne.Emitters[i].SphereRadiusRange.Min *= Scale;
		TheOne.Emitters[i].SphereRadiusRange.Max *= Scale;
		TheOne.Emitters[i].StartVelocityRadialRange.Min *= Scale;
		TheOne.Emitters[i].StartVelocityRadialRange.Max *= Scale;
		TheOne.Emitters[i].MaxAbsVelocity *= Scale;
		ScaleRV(TheOne.Emitters[i].StartSizeRange, Scale);
		TheOne.Emitters[i].Acceleration *= Scale;
		ScaleRV(TheOne.Emitters[i].StartLocationRange, Scale);
		TheOne.Emitters[i].StartLocationOffset *= Scale;
		ScaleRV(TheOne.Emitters[i].MeshScaleRange, Scale);
		ScaleRV(TheOne.Emitters[i].VelocityScaleRange, Scale);
		ScaleRV(TheOne.Emitters[i].VelocityLossRange, Scale);
		// End:0x398
		if(BeamEmitter(TheOne.Emitters[i]) != none)
		{
			j = 0;
			J0x246:

			// End:0x2B5 [Loop If]
			if(j < BeamEmitter(TheOne.Emitters[i]).BeamEndPoints.Length)
			{
				ScaleRV(BeamEmitter(TheOne.Emitters[i]).BeamEndPoints[j].offset, Scale);
				j++;
				// [Loop Continue]
				goto J0x246;
			}
			ScaleRV(BeamEmitter(TheOne.Emitters[i]).LowFrequencyNoiseRange, Scale);
			ScaleRV(BeamEmitter(TheOne.Emitters[i]).HighFrequencyNoiseRange, Scale);
			ScaleRV(BeamEmitter(TheOne.Emitters[i]).DynamicHFNoiseRange, Scale);
			BeamEmitter(TheOne.Emitters[i]).BeamDistanceRange.Max *= Scale;
			BeamEmitter(TheOne.Emitters[i]).BeamDistanceRange.Min *= Scale;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

static function InitEmitterFlash(Emitter F, float FlashScale)
{
	// End:0x0D
	if(F == none)
	{
		return;
	}
	Class'BallisticProV55.RSDarkStar'.static.ScaleEmitter(F, FlashScale);
	// End:0x4A
	if(DGVEmitter(F) != none)
	{
		DGVEmitter(F).InitDGV();
	}
	return;
	//return;	
}

static function InitMuzzleFlash(out Actor Flash, Class<Actor> FlashClass, float FlashScale, Actor OwnedBy, name AttachBone)
{
	// End:0x27
	if(((Flash != none) || OwnedBy == none) || FlashClass == none)
	{
		return;
	}
	Flash = OwnedBy.Spawn(FlashClass, OwnedBy);
	// End:0x71
	if(Emitter(Flash) != none)
	{
		Class'BallisticProV55.RSDarkStar'.static.InitEmitterFlash(Emitter(Flash), FlashScale);
	}
	Flash.SetDrawScale(FlashScale);
	OwnedBy.AttachToBone(Flash, AttachBone);
	//return;	
}

exec function SetSpawnOffset(Vector V)
{
	// End:0x52
	if(V == vect(0.0000000, 0.0000000, 0.0000000))
	{
		Instigator.ClientMessage("SpawnOffset = " $ string(RSDarkPrimaryFire(FireMode[0]).SpawnOffset));		
	}
	else
	{
		RSDarkPrimaryFire(FireMode[0]).SpawnOffset = V;
	}
	//return;	
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	ChainsawPanner = RSDarkChainsawPanner(Level.ObjectPool.AllocateObject(Class'BallisticProV55.RSDarkChainsawPanner'));
	// End:0x47
	if(ChainsawPanner != none)
	{
		Skins[3] = ChainsawPanner;
	}
	//return;	
}

simulated function PlayIdle()
{
	super.PlayIdle();
	// End:0x29
	if(ChainSpeed <= float(0))
	{
		DesiredBladeAlpha = 1.0000000;
		BladeShiftSpeed = 3.0000000;
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	ChainSpeed = 0.0000000;
	DesiredBladeAlpha = 0.0000000;
	SetBladesOpen(0.0000000);
	// End:0x43
	if(DiamondGlow != none)
	{
		DiamondGlow.Destroy();
	}
	// End:0xB4
	if((Instigator.IsLocallyControlled() && int(Level.DetailMode) >= int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2)
	{
		DiamondGlow = none;
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(DiamondGlow, Class'BallisticProV55.RSDarkCoverGlow', DrawScale, self, 'crystal');
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x30
	if(super.PutDown())
	{
		// End:0x18
		if(bOnRampage)
		{
			EndRampage();
		}
		DesiredBladeAlpha = 0.0000000;
		BladeShiftSpeed = 3.0000000;
		return true;
	}
	return false;
	//return;	
}

simulated event Timer()
{
	// End:0x24
	if(int(ClientState) == int(3))
	{
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(DiamondGlow);
	}
	super.Timer();
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
	// End:0x1C
	if(Flame != none)
	{
		Flame.bHidden = false;
	}
	// End:0x44
	if(ChainsawPanner != none)
	{
		Level.ObjectPool.FreeObject(ChainsawPanner);
	}
	// End:0x10C
	if((Instigator.AmbientSound == UsedAmbientSound) || Instigator.AmbientSound == RSDarkPrimaryFire(FireMode[0]).FireSoundLoop)
	{
		Instigator.AmbientSound = none;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
		Instigator.SoundPitch = Instigator.default.SoundPitch;
		Instigator.SoundRadius = Instigator.default.SoundRadius;
		Instigator.bFullVolume = Instigator.default.bFullVolume;
	}
	// End:0x11B
	if(bOnRampage)
	{
		EndRampage();
	}
	// End:0x132
	if(DiamondGlow != none)
	{
		DiamondGlow.Destroy();
	}
	// End:0x149
	if(Arc1 != none)
	{
		Arc1.Destroy();
	}
	// End:0x160
	if(RampageGlow != none)
	{
		RampageGlow.Destroy();
	}
	// End:0x177
	if(Horns != none)
	{
		Horns.Destroy();
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
	return SoulPower / float(MaxSoulPower);
	//return;	
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	super.GiveTo(Other, Pickup);
	// End:0x39
	if(RSDarkPickup(Pickup) != none)
	{
		AddSoul(RSDarkPickup(Pickup).SoulPower);
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
		if(RSDarkPickup(Pickup) != none)
		{
			RSDarkPickup(Pickup).SoulPower = SoulPower;
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
			RSDarkPrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
		}		
	}
	else
	{
		// End:0x18C
		if(int(CurrentWeaponMode) != 1)
		{
			lastModeChangeTime = Level.TimeSeconds;
			CurrentWeaponMode = 1;
			RSDarkPrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
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

simulated exec function Reload(optional byte i)
{
	// End:0x2D
	if((int(ClientState) == int(4)) && int(ReloadState) == int(0))
	{
		ServerStartReload(i);
	}
	//return;	
}

simulated function AddBonusAmmo()
{
	Ammo[0].AddAmmo(1);
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
	MaxSoulPower=3
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;40.0;1.0;80.0;0.0;1.0;1.0")
	SightAnimScale=0.5000000
	ParamsClasses[0]=Class'BallisticProV55.RSDarkWeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.RSDarkWeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.RSDarkWeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.RSDarkWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.DarkStar.BigIcon_DarkStar'
	BigIconCoords=(X1=0,Y1=28,X2=511,Y2=225)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-Pullout',Volume=0.2100000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-Putaway',Volume=0.2070000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Bolt",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Flame",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Cone Immolation",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="Fire Bomb",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightZoomFactor=1.2000000
	SightBobScale=0.7500000
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-GemHit',Volume=0.7000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-GemOut',Volume=0.7000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-GemIn',Volume=0.7000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.7000000
	NDCrosshairCfg=(Pic1=TexRotator'BW_Core_WeaponTex.DarkStar.DarkOutA-Rot',Pic2=TexRotator'BW_Core_WeaponTex.DarkStar.DarkInA-Rot',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=209),Color2=(R=255,G=181,B=0,A=255),StartSize1=106,StartSize2=50)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.2500000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=3.0000000,CurrentScale=0.0000000)
	NDCrosshairChaosFactor=0.5000000
	ManualLines[0]="Slow Bolts deal moderate damage, gain damage over range, set the enemy alight, blocking healing, and steal 20% of damage dealt as HP, but cost HP equal to 20% of their base damage to use.|Rapid Fire bolts have high damage, gain damage over range and steal 20% of damage dealt as HP, but cost HP equal to 10% of their base damage to use.|The Flamer mode deals low damage to all enemies within the projected flames, costing low soul power, and prevents them from healing.|Fire Bombs deal severe damage in a wide radius, costing high soul power."
	ManualLines[1]="Engages the chainsaw. This weapon deals high sustained damage, displaces the enemy's aim, leeches damage dealt as HP for the user and reduces damage taken from frontal melee attacks by 75%."
	ManualLines[2]="All of this weapon's modes have the potential to inflict damage to the wielder. Enemies killed by this weapon leave souls behind. These can be collected to power the Flamer, Immolation and Fire Bomb modes. Use of those modes without external soul power will consume the user's soul, dealing significant backlash damage.||With full soul power, the weapon can enter rampage mode, reducing all damage taken and increasing both speed and jump height. In this mode, soul power will drain over time.||Very effective at close and medium range."
	SightOffset=(X=0.0000000,Y=0.0000000,Z=4.5000000)
	GunLength=128.0000000
	FireModeClass[0]=Class'BallisticProV55.RSDarkPrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.RSDarkMeleeFire'
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7000000
	CurrentRating=0.7000000
	bShowChargingBar=true
	Description="Towards the end of the first war, the UTC launched a fierce assault on the substantial Skrith facility set up just outside the rim of the large crater in secter-547b on a distant outworld planet. The skrith facility appeared to be a kind of temple combined with a mine where extensive excavations had been taking place. Deep below the temple, the UTC discovered ruins of an ancient alien city. In the deepest recesses of the Skrith excavation, they found a very strange artifact in the middle of being extracted from solid, fused stone. The artifact was then fully extracted and analysed by UTC scientists. Is was made of an incredibly strong material and, judging by its design, it seemed to be an ancient alien weapon. Despite countless tests, they failed to access the device's internal mechanisms or gain any further useful information."
	Priority=38
	HudColor=(R=200,G=25,B=25,A=255)
	InventoryGroup=5
	GroupOffset=2
	PickupClass=Class'BallisticProV55.RSDarkPickup'
	PlayerViewOffset=(X=0.0000000,Y=4.0000000,Z=-3.0000000)
	AttachmentClass=Class'BallisticProV55.RSDarkAttachment'
	IconMaterial=Texture'BW_Core_WeaponTex.DarkStar.SmallIcon_DarkStar'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="Dark Star"
	LightType=2
	LightEffect=13
	LightSaturation=64
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.DarkStar_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BW_Core_WeaponTex.DarkStar.DarkStar-Shiny'
	Skins[2]=Shader'BW_Core_WeaponTex.DarkStar.DarkStarDiamond_SD'
	Skins[3]=Texture'BW_Core_WeaponTex.DarkStar.DarkStarChain'
	bFullVolume=true
	SoundRadius=32.0000000
}
