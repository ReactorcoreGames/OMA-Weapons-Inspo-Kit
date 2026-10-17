class HVPCMk66PlasmaCannon extends BallisticWeapon
	config(BallisticProV55);

var float HeatLevel;
var bool bIsVenting;
var bool bCriticalHeat;
var() Sound VentingSound;
var() Sound WarningSound;
var() Sound OverheatSound;
var() Sound PrimaryWarningSound;
var Actor GlowFX;
var bool bWaterBurn;
var bool bArcOOA;
var Actor Arc1;
var Actor Arc2;
var Actor Arc3;
var Actor Spiral;
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
	// End:0x58
	if(HeatLevel > float(0))
	{
		// End:0x38
		if(bIsVenting)
		{
			HeatLevel = FMax(HeatLevel - (float(4) * dt), 0.0000000);			
		}
		else
		{
			HeatLevel = FMax(HeatLevel - (0.4000000 * dt), 0.0000000);
		}
	}
	super.Tick(dt);
	//return;	
}

simulated function AddHeat(float Amount)
{
	HeatLevel += Amount;
	// End:0x3D
	if((HeatLevel > 10.0000000) && HeatLevel < 15.0000000)
	{
		HeatLevel = 15.0000000;
		GoBoom();
	}
	//return;	
}

function GoBoom()
{
	PlaySound(OverheatSound,, 12.7000000,, 2048.0000000);
	Class'BWBP_SKC_Pro.IM_HVPCMk66Explosion'.static.StartSpawn(Location, vect(0.0000000, 0.0000000, 1.0000000), 0, self);
	HurtRadius(1000.0000000, 1536.0000000, Class'BWBP_SKC_Pro.DT_BFGExplode', 8000.0000000, Location);
	Destroy();
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
		if(HVPCMk66Pickup(Pickup) != none)
		{
			HeatLevel = FMax(0.0000000, HVPCMk66Pickup(Pickup).HeatLevel - ((Level.TimeSeconds - HVPCMk66Pickup(Pickup).HeatTime) * 0.2500000));
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
	bAimDisabled = default.bAimDisabled || !Instigator.IsHumanControlled();
	// End:0x344
	if(!bJustSpawned)
	{
		M = 0;
		J0x31E:

		// End:0x341 [Loop If]
		if(M < 2)
		{
			Ammo[M] = none;
			M++;
			// [Loop Continue]
			goto J0x31E;
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
	// End:0x72
	if((!bWaterBurn || int(ClientState) == int(2)) || int(ClientState) == int(3))
	{
		// End:0x69
		if(int(ClientState) == int(3))
		{
			Class'BCoreProV55.BUtil'.static.KillEmitterEffect(GlowFX);
		}
		super.Timer();		
	}
	else
	{
		// End:0xDF
		if(((int(Role) == int(ROLE_Authority)) && Instigator != none) && (AmmoAmount(0)) > 0)
		{
			ConsumeAmmo(0, 10.0000000);
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 5.0000000, Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'BWBP_SKC_Pro.DT_BFGExplode');
		}
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x49
	if(bCriticalHeat && !bIsVenting)
	{
		Instigator.AmbientSound = WarningSound;
		Instigator.SoundVolume = 196;		
	}
	else
	{
		// End:0x85
		if(bCriticalHeat && bIsVenting)
		{
			Instigator.AmbientSound = VentingSound;
			Instigator.SoundVolume = 128;			
		}
		else
		{
			// End:0xC8
			if(!bCriticalHeat && !bIsVenting)
			{
				Instigator.AmbientSound = UsedAmbientSound;
				Instigator.SoundVolume = default.SoundVolume;				
			}
			else
			{
				// End:0x103
				if(!bCriticalHeat && bIsVenting)
				{
					Instigator.AmbientSound = VentingSound;
					Instigator.SoundVolume = 128;
				}
			}
		}
	}
	// End:0x156
	if((HeatLevel >= float(8)) && HeatLevel < float(10))
	{
		bCriticalHeat = true;
		// End:0x153
		if(Arc1 != none)
		{
			HVPCMk5_SideArc(Arc1).SetColorShift(HeatLevel / float(2));
		}		
	}
	else
	{
		// End:0x1B5
		if((HeatLevel < float(8)) && HeatLevel > float(0))
		{
			bCriticalHeat = false;
			// End:0x1B5
			if((HeatLevel >= float(5)) && Arc1 != none)
			{
				HVPCMk5_SideArc(Arc1).SetColorShift(HeatLevel / float(10));
			}
		}
	}
	// End:0x1E9
	if((HeatLevel > 5.0500000) && HeatLevel < 5.1000000)
	{
		PlaySound(PrimaryWarningSound,, 0.7000000,, 16.0000000);
	}
	// End:0x22B
	if((HeatLevel >= float(5)) && Spiral == none)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Spiral, Class'BWBP_SKC_Pro.HVPCMk66_GreenSpiral', DrawScale, self, 'drum');		
	}
	else
	{
		// End:0x27C
		if(HeatLevel < float(5))
		{
			// End:0x258
			if(Spiral != none)
			{
				Emitter(Spiral).Kill();
			}
			// End:0x27C
			if(Arc1 != none)
			{
				HVPCMk5_SideArc(Arc1).SetColorShift(0.0000000);
			}
		}
	}
	// End:0x308
	if(AIController(Instigator.Controller) != none)
	{
		// End:0x2F9
		if(HeatLevel > float(0))
		{
			// End:0x2F6
			if(((BotShouldReload()) && !Instigator.Controller.LineOfSightTo(AIController(Instigator.Controller).Enemy)) && !IsGoingToVent())
			{
				BotReload();
			}			
		}
		else
		{
			// End:0x308
			if(bIsVenting)
			{
				ReloadRelease();
			}
		}
	}
	// End:0x39B
	if(Instigator.PhysicsVolume.bWaterVolume)
	{
		// End:0x342
		if((AmmoAmount(0)) > 0)
		{
			AddHeat(dt * 1.5000000);
		}
		// End:0x398
		if((!bWaterBurn && int(Role) == int(ROLE_Authority)) && (int(ClientState) == int(4)) || !Instigator.IsLocallyControlled())
		{
			bWaterBurn = true;
			SetTimer(0.2000000, true);
		}		
	}
	else
	{
		// End:0x3C4
		if(bWaterBurn)
		{
			bWaterBurn = false;
			// End:0x3C4
			if(TimerRate == 0.2000000)
			{
				SetTimer(0.0000000, false);
			}
		}
	}
	// End:0x3DA
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	// End:0x513
	if(int(Level.DetailMode) > int(0))
	{
		// End:0x473
		if(((AmmoAmount(0)) < 1) && !FireMode[1].bIsFiring)
		{
			// End:0x470
			if(!bArcOOA)
			{
				bArcOOA = true;
				// End:0x442
				if(Arc1 != none)
				{
					Arc1.Destroy();
				}
				// End:0x459
				if(Arc2 != none)
				{
					Arc2.Destroy();
				}
				// End:0x470
				if(Arc3 != none)
				{
					Arc3.Destroy();
				}
			}			
		}
		else
		{
			// End:0x48D
			if(bArcOOA)
			{
				bArcOOA = false;
				InitArcs();				
			}
			else
			{
				// End:0x4BD
				if(FireMode[1].bIsFiring || FireMode[0].bIsFiring)
				{
					InitArcs();
				}
			}
		}
		// End:0x513
		if(!bArcOOA)
		{
			RotorSpin += (dt * (float(65536) + (float(65536) * ClawAlpha)));
			SetBoneRotation('Spinner', rot(0, 0, 1) * RotorSpin, 0, 1.0000000);
		}
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	bIsVenting = false;
	bCriticalHeat = false;
	super.BringUp(PrevWeapon);
	// End:0xA6
	if(((Instigator.IsLocallyControlled() && int(Level.DetailMode) == int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2) && (GlowFX == none) || GlowFX.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GlowFX, Class'BWBP_SKC_Pro.HVPCMk66GreenGlow', DrawScale, self, 'tip');
	}
	AmbientSound = none;
	Instigator.AmbientSound = UsedAmbientSound;
	Instigator.SoundVolume = default.SoundVolume;
	Instigator.SoundPitch = default.SoundPitch;
	Instigator.SoundRadius = default.SoundRadius;
	Instigator.bFullVolume = true;
	// End:0x13C
	if(((AmmoAmount(0)) > 0) && int(Level.DetailMode) > int(0))
	{
		InitArcs();
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x148
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
		// End:0x62
		if((HeatLevel >= float(8)) && HeatLevel < float(15))
		{
			HeatLevel = 6.0000000;
		}
		// End:0x73
		if(bCriticalHeat)
		{
			bCriticalHeat = false;
		}
		// End:0x8A
		if(Arc1 != none)
		{
			Arc1.Destroy();
		}
		// End:0xA1
		if(Arc2 != none)
		{
			Arc2.Destroy();
		}
		// End:0xB8
		if(Arc3 != none)
		{
			Arc3.Destroy();
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
	// End:0xC9
	if(int(Level.DetailMode) > int(0))
	{
		// End:0x38
		if(Spiral != none)
		{
			Emitter(Spiral).Kill();
		}
		Spiral = none;
		// End:0x57
		if((Arc1 == none) && bArcOOA)
		{
			return;
		}
		InitArcs();
		// End:0x81
		if(Arc1 != none)
		{
			HVPCMk5_SideArc(Arc1).SetColorShift(0.0000000);
		}
		// End:0xA5
		if(Arc2 != none)
		{
			HVPCMk66_TopArc(Arc2).SetColorShift(0.0000000);
		}
		// End:0xC9
		if(Arc3 != none)
		{
			HVPCMk66_TopArc(Arc3).SetColorShift(0.0000000);
		}
	}
	//return;	
}

simulated function InitArcs()
{
	// End:0x53
	if(Arc1 == none)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Arc1, Class'BWBP_SKC_Pro.HVPCMk5_SideArc', DrawScale, self, 'Arc3');
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Arc1, Class'BWBP_SKC_Pro.HVPCMk66GreenGlow', DrawScale, self, 'tip');
	}
	// End:0x82
	if(Arc2 == none)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Arc2, Class'BWBP_SKC_Pro.HVPCMk66_TopArc', DrawScale, self, 'Arc1');
	}
	// End:0xB1
	if(Arc3 == none)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Arc3, Class'BWBP_SKC_Pro.HVPCMk66_TopArc', DrawScale, self, 'Arc2');
	}
	//return;	
}

simulated event RenderOverlays(Canvas C)
{
	// End:0x2F
	if(Spiral != none)
	{
		Spiral.SetRelativeRotation(rot(0, 0, 1) * RotorSpin);
	}
	super.RenderOverlays(C);
	//return;	
}

simulated function bool IsGoingToVent()
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x27
	if(Anim == 'StartReload')
	{
		return true;
	}
	return false;
	//return;	
}

simulated exec function Reload(optional byte i)
{
	// End:0x20
	if(!IsFiring())
	{
		SafePlayAnim('StartReload', 1.0000000, 0.1000000);
	}
	//return;	
}

simulated function Notify_LGArcOff()
{
	Instigator.AmbientSound = VentingSound;
	Instigator.SoundVolume = 128;
	// End:0x4B
	if(Arc1 != none)
	{
		Emitter(Arc1).Kill();
		Arc1 = none;
	}
	// End:0x71
	if(Arc2 != none)
	{
		Emitter(Arc2).Kill();
		Arc2 = none;
	}
	// End:0x97
	if(Arc3 != none)
	{
		Emitter(Arc3).Kill();
		Arc3 = none;
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x4C
	if(Anim == 'StartReload')
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
	// End:0x39
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

	// End:0x33
	if(!bCriticalHeat)
	{
		Instigator.AmbientSound = UsedAmbientSound;
		Instigator.SoundVolume = default.SoundVolume;
	}
	// End:0x9E
	if(!bIsVenting)
	{
		GetAnimParams(0, Anim, frame, Rate);
		// End:0x65
		if(Anim != 'StartReload')
		{
			return;
		}
		SafePlayAnim('EndReload', 1.0000000, 0.2000000);
		// End:0x9B
		if(frame < 0.5000000)
		{
			SetAnimFrame(1.0000000 - frame);
		}		
	}
	else
	{
		SafePlayAnim('EndReload', 1.0000000, 0.2000000);
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
	// End:0x2E
	if(((AmmoAmount(0)) > 0) && int(Level.DetailMode) > int(0))
	{
		InitArcs();
	}
	//return;	
}

function ServerReloadRelease(optional byte i)
{
	// End:0x47
	if(!Instigator.IsLocallyControlled())
	{
		// End:0x47
		if(!bCriticalHeat)
		{
			Instigator.AmbientSound = UsedAmbientSound;
			Instigator.SoundVolume = default.SoundVolume;
		}
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
	if(Arc1 != none)
	{
		Arc1.Destroy();
	}
	// End:0x2E
	if(Arc2 != none)
	{
		Arc2.Destroy();
	}
	// End:0x45
	if(Arc3 != none)
	{
		Arc3.Destroy();
	}
	// End:0x5C
	if(GlowFX != none)
	{
		GlowFX.Destroy();
	}
	// End:0x73
	if(Spiral != none)
	{
		Spiral.Destroy();
	}
	// End:0x145
	if(((Instigator.AmbientSound == UsedAmbientSound) || Instigator.AmbientSound == VentingSound) || Instigator.AmbientSound == WarningSound)
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
	// End:0xCF
	if((HeatLevel >= 9.5000000) && !IsGoingToVent())
	{
		BotReload();
		return false;
	}
	// End:0x274
	if(Instigator.PhysicsVolume.bWaterVolume)
	{
		B = AIController(Instigator.Controller);
		// End:0x274
		if((B != none) && B.Skill >= float(Rand(4)))
		{
			// End:0x262
			foreach Instigator.PhysicsVolume.TouchingActors(Class'Engine.Actor', Victims)
			{
				// End:0x261
				if(Pawn(Victims) != none)
				{
					dist = VSize(Victims.Location - Instigator.Location);
					// End:0x196
					if(dist > float(1900))
					{
						continue;						
					}
					// End:0x243
					if(Level.Game.bTeamGame && Instigator.Controller.SameTeamAs(Pawn(HitActor).Controller))
					{
						// End:0x240
						if(((B.Skill >= float(Rand(4))) && TeamGame(Level.Game) != none) && TeamGame(Level.Game).FriendlyFireScale > 0.1000000)
						{							
							return false;
						}
						// End:0x261
						continue;
					}
					EC += Min(1500, int(float(2000) - dist));
				}				
			}			
			// End:0x274
			if(EC < 1990)
			{
				return false;
			}
		}
	}
	// End:0x2E6
	if(((bIsVenting && HeatLevel < float(10)) && AIController(Instigator.Controller).Skill >= float(Rand(5))) && (Level.TimeSeconds - Instigator.LastPainTime) < 0.5000000)
	{
		ReloadRelease();
	}
	// End:0x325
	if(bIsVenting && (AIController(Instigator.Controller).Skill + float(Rand(2))) >= HeatLevel)
	{
		ReloadRelease();
	}
	// End:0x42A
	if(Level.Game.bTeamGame)
	{
		projStart = Instigator.Location + Instigator.EyePosition();
		HitActor = Trace(HitLocation, HitNormal, Other.Location + (Other.CollisionHeight * vect(0.0000000, 0.0000000, 0.8000000)), projStart, true);
		// End:0x428
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
	WarningSound=Sound'BWBP_SKC_Sounds.BFG.BFG-Critical'
	OverheatSound=Sound'BW_Core_WeaponSound.Misc.BH-Explode'
	PrimaryWarningSound=Sound'BW_Core_WeaponSound.LightningGun.LG-OverHeat'
	SpecialInfo[0]=(Id="EvoDefs",Info="600.0;80.0;1.0;100.0;0.5;0.8;5.0")
	AIReloadTime=0.2000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.HVPCMk66WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.HVPCMk66WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.HVPCMk66WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.HVPCMk66WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.BFG.BigIcon_BFG'
	BigIconCoords=(X1=0,Y1=30,X2=511,Y2=235)
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-Select',Volume=0.2250000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.LightningGun.LG-Putaway',Volume=0.2170000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=4.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	bNoCrosshairInScope=true
	bNoMag=true
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M50Out',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc4',USize1=128,VSize1=128,USize2=256,VSize2=256,Color1=(R=0,G=248,B=0,A=255),Color2=(R=170,G=168,B=153,A=173),StartSize1=96,StartSize2=82)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=3.0000000,CurrentScale=0.0000000)
	NDCrosshairChaosFactor=0.7000000
	bWT_Hazardous=true
	bWT_Energy=true
	bWT_Super=true
	UsedAmbientSound=Sound'BW_Core_WeaponSound.LightningGun.LG-Ambient'
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	SightOffset=(X=-12.0000000,Y=0.0000000,Z=15.5300000)
	FireModeClass[0]=Class'BWBP_SKC_Pro.HVPCMk66PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.HVPCMk66SecondaryFire'
	IdleAnimRate=1.2000000
	PutDownTime=0.5000000
	BringUpTime=0.5000000
	AIRating=0.7500000
	CurrentRating=0.6000000
	bShowChargingBar=true
	Description="E-V Hyper Plasma Cannon 9000||Manufacturer: Nexron Defence|Primary: Super Plasma Charge|Secondary: Directed Plasma Pulse||[Document Begins - Details Classified] --- (--- ----- ------ ------) -- - ----- ---- ------- -- ---- --- ------ -- --- ---. ---- -- ------ -- --------- -- --------. ------ ---- ------ ------ --- --- -- - ------ -------- ------ -------------- --- - ---. ------- ----. ------- ----- -- - ----- --- --- ------- -- -------- ------ --- ----------. ---- ------- -- --- ---- ---------- --. ----- ---- -----. ---- - -- --------- ----- - ---------- --- -- -----. *[Info Removed]* Troops have been noted calling the (--- ----- ----- ------) a Big F-cking Gun."
	Priority=196
	HudColor=(R=50,G=150,B=25,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=5
	PickupClass=Class'BWBP_SKC_Pro.HVPCMk66Pickup'
	PlayerViewOffset=(X=-2.0000000,Y=6.3300000,Z=-6.3300000)
	AttachmentClass=Class'BWBP_SKC_Pro.HVPCMk66Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.BFG.SmallIcon_BFG'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="E-V Plasma Cannon 9000"
	LightType=2
	LightEffect=13
	LightHue=180
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.HVC_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Texture'BWBP_SKC_Tex.BFG.BFG-Skin'
	bFullVolume=true
	SoundVolume=64
	SoundRadius=128.0000000
}
