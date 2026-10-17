class HVPCMk5PlasmaCannon extends BallisticWeapon
	config(BallisticProV55);

var float HeatLevel;
var bool bMilSpec;
var bool bIsVenting;
var() Sound VentingSound;
var() Sound OverheatSound;
var bool bWaterBurn;
var bool bArcOOA;
var Actor CoolantSmoke;
var Actor Spiral;
var Actor ClawSpark1;
var Actor ClawSpark2;
var float ClawAlpha;
var float RotorSpin;
var Emitter FreeZap;
var bool bCanKillZap;
var float NextChangeMindTime;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientOverCharge, ClientSetHeat;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bMilSpec = false;
	// End:0x54
	if(InStr(WeaponParams.LayoutTags, "milspec") != -1)
	{
		bMilSpec = true;
		bNoMag = false;
		bShowChargingBar = false;
	}
	//return;	
}

simulated function ClientOverCharge()
{
	// End:0x1B
	if(FireMode[1].bIsFiring)
	{
		StopFire(1);
	}
	//return;	
}

simulated function float ChargeBar()
{
	return HeatLevel / float(10);
	//return;	
}

simulated event Tick(float dt)
{
	// End:0x59
	if(HeatLevel > float(0))
	{
		// End:0x39
		if(bIsVenting)
		{
			HeatLevel = FMax(HeatLevel - (2.5000000 * dt), 0.0000000);			
		}
		else
		{
			HeatLevel = FMax(HeatLevel - (0.2500000 * dt), 0.0000000);
		}
	}
	super.Tick(dt);
	//return;	
}

simulated function AddHeat(float Amount)
{
	// End:0x9A
	if((HeatLevel >= 9.5000000) && HeatLevel < float(15))
	{
		HeatLevel = 15.0000000;
		PlaySound(OverheatSound,, 0.7000000,, 32.0000000);
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 80.0000000, Instigator, Instigator.Location, (-Vector(Instigator.GetViewRotation()) * float(30000)) + vect(0.0000000, 0.0000000, 10000.0000000), Class'BWBP_SKC_Pro.DTPlasmaCannonOverHeat');
	}
	HeatLevel += Amount;
	//return;	
}

simulated function ClientSetHeat(float NewHeat)
{
	HeatLevel = NewHeat;
	//return;	
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	local int M;
	local Weapon W;
	local bool bPossiblySwitch, bJustSpawned;

	Instigator = Other;
	W = Weapon(Other.FindInventoryType(Class));
	// End:0x1F1
	if(W == none)
	{
		bJustSpawned = true;
		super(Inventory).GiveTo(Other);
		bPossiblySwitch = true;
		W = self;
		// End:0xEA
		if((Pickup != none) && BallisticWeaponPickup(Pickup) != none)
		{
			GenerateLayout(BallisticWeaponPickup(Pickup).LayoutIndex);
			GenerateCamo(BallisticWeaponPickup(Pickup).CamoIndex);
			// End:0xCE
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = BallisticWeaponPickup(Pickup).MagAmmo;			
		}
		else
		{
			GenerateLayout(byte(255));
			GenerateCamo(byte(255));
			// End:0x126
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = MagAmmo + ((int(!bNonCocking) * int(bMagPlusOne)) * int(!bNeedCock));
		}
		// End:0x1AF
		if(HVPCMk5Pickup(Pickup) != none)
		{
			HeatLevel = FMax(0.0000000, HVPCMk5Pickup(Pickup).HeatLevel - ((Level.TimeSeconds - HVPCMk5Pickup(Pickup).HeatTime) * 0.2500000));
		}
		// End:0x1EE
		if((int(Level.NetMode) == int(NM_ListenServer)) || int(Level.NetMode) == int(NM_DedicatedServer))
		{
			ClientSetHeat(HeatLevel);
		}		
	}
	else
	{
		// End:0x20D
		if(!W.HasAmmo())
		{
			bPossiblySwitch = true;
		}
	}
	// End:0x220
	if(Pickup == none)
	{
		bPossiblySwitch = true;
	}
	M = 0;
	J0x227:

	// End:0x283 [Loop If]
	if(M < 2)
	{
		// End:0x279
		if(FireMode[M] != none)
		{
			FireMode[M].Instigator = Instigator;
			GiveAmmo(M, WeaponPickup(Pickup), bJustSpawned);
		}
		M++;
		// [Loop Continue]
		goto J0x227;
	}
	// End:0x2BC
	if((Instigator.Weapon != none) && Instigator.Weapon.IsFiring())
	{
		bPossiblySwitch = false;
	}
	// End:0x2E9
	if(Instigator.Weapon != W)
	{
		W.ClientWeaponSet(bPossiblySwitch);
	}
	// End:0x321
	if(!bJustSpawned)
	{
		M = 0;
		J0x2FB:

		// End:0x31E [Loop If]
		if(M < 2)
		{
			Ammo[M] = none;
			M++;
			// [Loop Continue]
			goto J0x2FB;
		}
		Destroy();
	}
	//return;	
}

simulated event Timer()
{
	// End:0x16
	if(Instigator.Weapon != self)
	{
		return;
	}
	// End:0x4E
	if((!bWaterBurn || int(ClientState) == int(2)) || int(ClientState) == int(3))
	{
		super.Timer();		
	}
	else
	{
		// End:0xBB
		if(((int(Role) == int(ROLE_Authority)) && Instigator != none) && (AmmoAmount(0)) > 0)
		{
			ConsumeAmmo(0, 2.0000000);
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 2.0000000, Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'BWBP_SKC_Pro.DTPlasmaCannonOverHeat');
		}
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	local Vector End;

	super.WeaponTick(dt);
	// End:0x4D
	if((HeatLevel >= float(7)) && Spiral == none)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Spiral, Class'BWBP_SKC_Pro.HVPCMk66_GreenSpiral', DrawScale, self, 'tip');		
	}
	else
	{
		// End:0x7A
		if(HeatLevel < float(7))
		{
			// End:0x7A
			if(Spiral != none)
			{
				Emitter(Spiral).Kill();
			}
		}
	}
	// End:0x106
	if(AIController(Instigator.Controller) != none)
	{
		// End:0xF7
		if(HeatLevel > float(0))
		{
			// End:0xF4
			if(((BotShouldReload()) && !Instigator.Controller.LineOfSightTo(AIController(Instigator.Controller).Enemy)) && !IsGoingToVent())
			{
				BotReload();
			}			
		}
		else
		{
			// End:0x106
			if(bIsVenting)
			{
				ReloadRelease();
			}
		}
	}
	// End:0x199
	if(Instigator.PhysicsVolume.bWaterVolume)
	{
		// End:0x140
		if((AmmoAmount(0)) > 0)
		{
			AddHeat(dt * 0.5000000);
		}
		// End:0x196
		if((!bWaterBurn && int(Role) == int(ROLE_Authority)) && (int(ClientState) == int(4)) || !Instigator.IsLocallyControlled())
		{
			bWaterBurn = true;
			SetTimer(0.4000000, true);
		}		
	}
	else
	{
		// End:0x1C2
		if(bWaterBurn)
		{
			bWaterBurn = false;
			// End:0x1C2
			if(TimerRate == 0.2000000)
			{
				SetTimer(0.0000000, false);
			}
		}
	}
	// End:0x1D8
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	// End:0x2CE
	if(FireMode[1].bIsFiring)
	{
		// End:0x2CB
		if(ClawAlpha < float(1))
		{
			ClawAlpha = FClamp(ClawAlpha + dt, 0.0000000, 1.0000000);
			SetBoneRotation('Claw1', rot(-8192, 0, 0), 0, ClawAlpha);
			SetBoneRotation('Claw2', rot(-8192, 0, 0), 0, ClawAlpha);
			SetBoneRotation('Claw3', rot(-8192, 0, 0), 0, ClawAlpha);
			SetBoneRotation('Claw1B', rot(-8192, 0, 0), 0, ClawAlpha);
			SetBoneRotation('Claw2B', rot(-8192, 0, 0), 0, ClawAlpha);
			SetBoneRotation('Claw3B', rot(-8192, 0, 0), 0, ClawAlpha);
		}		
	}
	else
	{
		// End:0x3B3
		if(ClawAlpha > float(0))
		{
			ClawAlpha = FClamp(ClawAlpha - (dt / float(3)), 0.0000000, 1.0000000);
			SetBoneRotation('Claw1', rot(-8192, 0, 0), 0, ClawAlpha);
			SetBoneRotation('Claw2', rot(-8192, 0, 0), 0, ClawAlpha);
			SetBoneRotation('Claw3', rot(-8192, 0, 0), 0, ClawAlpha);
			SetBoneRotation('Claw1B', rot(-8192, 0, 0), 0, ClawAlpha);
			SetBoneRotation('Claw2B', rot(-8192, 0, 0), 0, ClawAlpha);
			SetBoneRotation('Claw3B', rot(-8192, 0, 0), 0, ClawAlpha);
		}
	}
	// End:0x46E
	if(int(Level.DetailMode) > int(0))
	{
		// End:0x407
		if(((AmmoAmount(0)) < 1) && !FireMode[1].bIsFiring)
		{
			// End:0x404
			if(!bArcOOA)
			{
				bArcOOA = true;
			}			
		}
		else
		{
			// End:0x418
			if(bArcOOA)
			{
				bArcOOA = false;
			}
		}
		// End:0x46E
		if(!bArcOOA)
		{
			RotorSpin += (dt * (float(65536) + (float(65536) * ClawAlpha)));
			SetBoneRotation('Spinner', rot(0, 0, 1) * RotorSpin, 0, 1.0000000);
		}
	}
	// End:0x54C
	if(ClawSpark1 != none)
	{
		End = GetBoneCoords('tip').Origin + (Vector(Instigator.GetViewRotation()) * float(96));
		BeamEmitter(Emitter(ClawSpark1).Emitters[0]).BeamEndPoints[0].offset = Class'BCoreProV55.BallisticEmitter'.static.VtoRV(End, End);
		// End:0x54C
		if(ClawSpark2 != none)
		{
			BeamEmitter(Emitter(ClawSpark2).Emitters[0]).BeamEndPoints[0].offset = BeamEmitter(Emitter(ClawSpark1).Emitters[0]).BeamEndPoints[0].offset;
		}
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	bIsVenting = false;
	super.BringUp(PrevWeapon);
	AmbientSound = none;
	Instigator.AmbientSound = UsedAmbientSound;
	Instigator.SoundVolume = default.SoundVolume;
	Instigator.SoundPitch = default.SoundPitch;
	Instigator.SoundRadius = default.SoundRadius;
	Instigator.bFullVolume = true;
	//return;	
}

simulated function bool PutDown()
{
	// End:0xE0
	if(super.PutDown())
	{
		// End:0x39
		if(bIsVenting)
		{
			// End:0x33
			if(int(Level.NetMode) == int(NM_Client))
			{
				bIsVenting = false;
			}
			ServerReloadRelease();
		}
		// End:0x50
		if(CoolantSmoke != none)
		{
			CoolantSmoke.Destroy();
		}
		bWaterBurn = false;
		Instigator.AmbientSound = none;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
		Instigator.SoundPitch = Instigator.default.SoundPitch;
		Instigator.SoundRadius = Instigator.default.SoundRadius;
		Instigator.bFullVolume = Instigator.default.bFullVolume;
		return true;
	}
	return false;
	//return;	
}

simulated function ResetArcs()
{
	// End:0x34
	if(int(Level.DetailMode) > int(0))
	{
		Emitter(Spiral).Kill();
		Spiral = none;
	}
	//return;	
}

simulated function InitGas()
{
	// End:0x2F
	if(CoolantSmoke == none)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(CoolantSmoke, Class'BWBP_SKC_Pro.PumaGlowFXDamaged', DrawScale, self, 'tip');
	}
	//return;	
}

simulated function bool IsGoingToVent()
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x27
	if(Anim == 'ReloadStart')
	{
		return true;
	}
	return false;
	//return;	
}

simulated exec function Reload(optional byte i)
{
	// End:0x16
	if(bMilSpec)
	{
		super.Reload(i);
		return;
	}
	// End:0x36
	if(!IsFiring())
	{
		SafePlayAnim('ReloadStart', 1.0000000, 0.1000000);
	}
	//return;	
}

simulated function Notify_LGArcOff()
{
	Instigator.AmbientSound = VentingSound;
	Instigator.SoundVolume = 128;
	// End:0x44
	if(int(Level.DetailMode) > int(0))
	{
		InitGas();
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x4C
	if(Anim == 'ReloadStart')
	{
		// End:0x46
		if(int(Level.NetMode) == int(NM_Client))
		{
			bIsVenting = true;
		}
		ServerStartReload();
	}
	super.AnimEnd(Channel);
	//return;	
}

function ServerStartReload(optional byte i)
{
	// End:0x16
	if(bMilSpec)
	{
		super.ServerStartReload(i);
		return;
	}
	// End:0x4F
	if(!Instigator.IsLocallyControlled())
	{
		Instigator.AmbientSound = VentingSound;
		Instigator.SoundVolume = 128;
	}
	bIsVenting = true;
	//return;	
}

simulated function PlayIdle()
{
	// End:0x28
	if(bIsVenting)
	{
		SafeLoopAnim('ReloadLoop', 0.5000000, IdleTweenTime,, "IDLE");		
	}
	else
	{
		super.PlayIdle();
	}
	//return;	
}

simulated exec function ReloadRelease(optional byte i)
{
	local name Anim;
	local float frame, Rate;

	// End:0x0B
	if(bMilSpec)
	{
		return;
	}
	Instigator.AmbientSound = UsedAmbientSound;
	Instigator.SoundVolume = default.SoundVolume;
	// End:0x9E
	if(!bIsVenting)
	{
		GetAnimParams(0, Anim, frame, Rate);
		// End:0x65
		if(Anim != 'ReloadStart')
		{
			return;
		}
		SafePlayAnim('ReloadEnd', 1.0000000, 0.2000000);
		// End:0x9B
		if(frame < 0.5000000)
		{
			SetAnimFrame(1.0000000 - frame);
		}		
	}
	else
	{
		SafePlayAnim('ReloadEnd', 1.0000000, 0.2000000);
	}
	// End:0xD4
	if(int(Level.NetMode) == int(NM_Client))
	{
		bIsVenting = false;
	}
	ServerReloadRelease();
	//return;	
}

simulated function Notify_LGArcOn()
{
	// End:0x17
	if(CoolantSmoke != none)
	{
		CoolantSmoke.Destroy();
	}
	//return;	
}

function ServerReloadRelease(optional byte i)
{
	// End:0x3C
	if(!Instigator.IsLocallyControlled())
	{
		Instigator.AmbientSound = UsedAmbientSound;
		Instigator.SoundVolume = default.SoundVolume;
	}
	bIsVenting = false;
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
	// End:0x2E
	if(CoolantSmoke != none)
	{
		CoolantSmoke.Destroy();
	}
	// End:0x45
	if(ClawSpark1 != none)
	{
		ClawSpark1.Destroy();
	}
	// End:0x5C
	if(ClawSpark2 != none)
	{
		ClawSpark2.Destroy();
	}
	// End:0x73
	if(Spiral != none)
	{
		Spiral.Destroy();
	}
	// End:0x12B
	if((Instigator.AmbientSound == UsedAmbientSound) || Instigator.AmbientSound == VentingSound)
	{
		Instigator.AmbientSound = none;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
		Instigator.SoundPitch = Instigator.default.SoundPitch;
		Instigator.SoundRadius = Instigator.default.SoundRadius;
		Instigator.bFullVolume = Instigator.default.bFullVolume;
	}
	super.Destroyed();
	//return;	
}

function bool BotShouldReload()
{
	// End:0x7F
	if(((!bIsVenting && HeatLevel > float(2)) && (Level.TimeSeconds - AIController(Instigator.Controller).LastSeenTime) > AIReloadTime) && (Level.TimeSeconds - Instigator.LastPainTime) > AIReloadTime)
	{
		return true;
	}
	return false;
	//return;	
}

function bool BotReload(optional bool bForced)
{
	// End:0x3A
	if(bForced || AIController(Instigator.Controller).Skill >= float(Rand(4)))
	{
		Reload();
		return true;
	}
	return false;
	//return;	
}

function bool CanAttack(Actor Other)
{
	local float dist;
	local Vector HitLocation, HitNormal, projStart;
	local Actor HitActor;
	local int EC;
	local AIController B;
	local Actor Victims;

	// End:0x23
	if((Instigator == none) || Instigator.Controller == none)
	{
		return false;
	}
	dist = VSize(Instigator.Location - Other.Location);
	// End:0x6C
	if(dist > FireMode[1].MaxRange())
	{
		BotReload();
		return false;
	}
	// End:0xAB
	if(((BotShouldReload()) && !Instigator.Controller.LineOfSightTo(Other)) && !IsGoingToVent())
	{
		BotReload();
		return false;
	}
	// End:0xCE
	if((HeatLevel >= float(10)) && !IsGoingToVent())
	{
		BotReload();
		return false;
	}
	// End:0x273
	if(Instigator.PhysicsVolume.bWaterVolume)
	{
		B = AIController(Instigator.Controller);
		// End:0x273
		if((B != none) && B.Skill >= float(Rand(4)))
		{
			// End:0x261
			foreach Instigator.PhysicsVolume.TouchingActors(Class'Engine.Actor', Victims)
			{
				// End:0x260
				if(Pawn(Victims) != none)
				{
					dist = VSize(Victims.Location - Instigator.Location);
					// End:0x195
					if(dist > float(1900))
					{
						continue;						
					}
					// End:0x242
					if(Level.Game.bTeamGame && Instigator.Controller.SameTeamAs(Pawn(HitActor).Controller))
					{
						// End:0x23F
						if(((B.Skill >= float(Rand(4))) && TeamGame(Level.Game) != none) && TeamGame(Level.Game).FriendlyFireScale > 0.1000000)
						{							
							return false;
						}
						// End:0x260
						continue;
					}
					EC += Min(1500, int(float(2000) - dist));
				}				
			}			
			// End:0x273
			if(EC < 1990)
			{
				return false;
			}
		}
	}
	// End:0x2E5
	if(((bIsVenting && HeatLevel < float(10)) && AIController(Instigator.Controller).Skill >= float(Rand(5))) && (Level.TimeSeconds - Instigator.LastPainTime) < 0.5000000)
	{
		ReloadRelease();
	}
	// End:0x324
	if(bIsVenting && (AIController(Instigator.Controller).Skill + float(Rand(2))) >= HeatLevel)
	{
		ReloadRelease();
	}
	// End:0x429
	if(Level.Game.bTeamGame)
	{
		projStart = Instigator.Location + Instigator.EyePosition();
		HitActor = Trace(HitLocation, HitNormal, Other.Location + (Other.CollisionHeight * vect(0.0000000, 0.0000000, 0.8000000)), projStart, true);
		// End:0x427
		if(((((HitActor == none) || HitActor == Other) || Pawn(HitActor) == none) || Pawn(HitActor).Controller == none) || !Instigator.Controller.SameTeamAs(Pawn(HitActor).Controller))
		{
			return true;
		}
		return false;
	}
	return true;
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float Result, dist;
	local Controller C;

	B = Bot(Instigator.Controller);
	// End:0x41
	if((B == none) || B.Enemy == none)
	{
		return byte(Rand(2));
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0x175
	if(Level.Game.bTeamGame && float(Rand(7)) < B.Skill)
	{
		C = Level.ControllerList;
		J0xBA:

		// End:0x175 [Loop If]
		if(C != none)
		{
			// End:0x15E
			if((Instigator.Controller.SameTeamAs(C) && C.Pawn != none) && (Normal(C.Pawn.Location - Instigator.Location) Dot Normal(B.Enemy.Location - Instigator.Location)) > 0.7500000)
			{
				return 1;
			}
			C = C.nextController;
			// [Loop Continue]
			goto J0xBA;
		}
	}
	Result = FRand() - 0.1000000;
	// End:0x217
	if(Instigator.PhysicsVolume.bWaterVolume)
	{
		// End:0x1E8
		if((B.Enemy.PhysicsVolume == Instigator.PhysicsVolume) && dist > float(200))
		{
			Result -= 0.5000000;			
		}
		else
		{
			// End:0x202
			if(dist < float(200))
			{
				Result += 0.4000000;
			}
		}
		// End:0x214
		if(Result > 0.5000000)
		{
			return 1;
		}
		return 0;
	}
	// End:0x232
	if(NextChangeMindTime > Level.TimeSeconds)
	{
		return 0;
	}
	// End:0x26F
	if(HeatLevel > float(5))
	{
		Result -= ((0.1000000 * B.Skill) * ((HeatLevel - float(5)) / float(5)));
	}
	// End:0x29F
	if(dist > float(1150))
	{
		Result += (0.0800000 * B.Skill);		
	}
	else
	{
		// End:0x2CC
		if(dist < float(500))
		{
			Result -= (0.0500000 * B.Skill);
		}
	}
	// End:0x2FA
	if(VSize(B.Enemy.Velocity) < float(100))
	{
		Result += 0.3000000;
	}
	Result += (0.4000000 * ((FMax(0.0000000, Normal(B.Enemy.Velocity) Dot Vector(Instigator.GetViewRotation())) * float(2)) - float(1)));
	// End:0x358
	if(Result > 0.5000000)
	{
		return 1;
	}
	NextChangeMindTime = Level.TimeSeconds + float(4);
	return 0;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float Result, dist;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x41
	if((B == none) || B.Enemy == none)
	{
		return super.GetAIRating();
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Result = super.GetAIRating();
	// End:0xBE
	if(Instigator.PhysicsVolume.bWaterVolume)
	{
		Result -= (0.1500000 * B.Skill);
	}
	// End:0x14F
	if(dist > float(1600))
	{
		Result -= ((dist - float(1360)) / float(1500));
		// End:0x14C
		if((B.Enemy.Weapon != none) && B.Enemy.Weapon.bSniping)
		{
			Result -= (0.0800000 * B.Skill);
		}		
	}
	else
	{
		// End:0x16C
		if(dist > float(1200))
		{
			Result -= 0.1500000;
		}
	}
	// End:0x1CB
	if((B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon)
	{
		Result += (0.0700000 * B.Skill);
	}
	return Result;
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.5000000;
	//return;	
}

defaultproperties
{
	VentingSound=Sound'BW_Core_WeaponSound.LightningGun.LG-Coolant'
	OverheatSound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-Overload'
	SpecialInfo[0]=(Id="EvoDefs",Info="360.0;50.0;1.0;90.0;0.0;0.5;1.0")
	AIReloadTime=0.2000000
	SightAnimScale=0.5000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.HVPCMk5WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.HVPC.BigIcon_HVPC'
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-Select',Volume=1.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.LightningGun.LG-Putaway',Volume=1.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=4.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	bNoCrosshairInScope=true
	SightBobScale=0.3500000
	bNoMag=true
	bNonCocking=true
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.HVPC.HVPC-ReloadStart',Volume=1.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.HVPC.HVPC-ReloadEnd',Volume=1.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M50Out',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc4',USize1=128,VSize1=128,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=255),Color2=(R=170,G=168,B=153,A=83),StartSize1=96,StartSize2=84)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=3.0000000,CurrentScale=0.0000000)
	NDCrosshairChaosFactor=0.7000000
	bWT_Hazardous=true
	bWT_Energy=true
	bWT_Super=true
	PlayerSpeedFactor=0.8000000
	PlayerJumpFactor=0.7000000
	UsedAmbientSound=Sound'BW_Core_WeaponSound.LightningGun.LG-Ambient'
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	SightOffset=(X=-0.3750000,Y=0.0000000,Z=7.7500000)
	FireModeClass[0]=Class'BWBP_SKC_Pro.HVPCMk5PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.HVPCMk5SecondaryFire'
	PutDownTime=0.5000000
	BringUpTime=0.5000000
	AIRating=0.7500000
	CurrentRating=0.6000000
	bShowChargingBar=true
	Description="H-V Magnetic Plasma Cannon Mk5||Manufacturer: Nexron Defence|Primary: Contained Plasma Charge|Secondary: Directed Plasma Pulse||[Document Begins] The High Voltage Magnetic Plasma Cannon [Mark 5] - Codename 'Shock & Awe' - is a potent energy delivery system. State of the art magnetically charged sustaining coils powered by a portable back-mounted power generator can now, due to a recent breakthrough in plasma technology, successfully govern an operational array of plasma injectors. The Mk-5 uses these injectors to artificially condense and contain small 1 eV plasma 'charges' that can be propelled at high velocities towards hostile forces. Testing is currently underway. [Document Ends]"
	Priority=73
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=5
	GroupOffset=10
	PickupClass=Class'BWBP_SKC_Pro.HVPCMk5Pickup'
	PlayerViewOffset=(X=6.0000000,Y=5.0000000,Z=-9.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.HVPCMk5Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.HVPC.SmallIcon_HVPC'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="H-V Plasma Cannon Mk5"
	LightType=2
	LightEffect=13
	LightHue=180
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.HVPC_FPm'
	DrawScale=0.3000000
	bFullVolume=true
	SoundVolume=64
	SoundRadius=128.0000000
}
