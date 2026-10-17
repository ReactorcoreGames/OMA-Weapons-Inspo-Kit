class BallisticPawn extends xPawn
	config(User);

struct ByteVector
{
	var() byte X;
	var() byte Y;
	var() byte Z;
};

struct NetHitInfo
{
	var() byte BoneNum;
	var() Class<DamageType> DamageType;
	var() byte Damage;
	var() ByteVector hitRay;
	var() ByteVector HitLoc;
};

struct HitInfo
{
	var() name Bone;
	var() Class<DamageType> DamageType;
	var() int Damage;
	var() Vector hitRay;
	var() Vector HitLoc;
};

var bool bResetAnimationAction;
var globalconfig bool bLocalDisableAnimation;
var bool bDisablePawnAnimation;
var globalconfig array<string> ModelWhitelist;
var Actor OldBase;
var float LastMoverLeaveTime;
var float MoverLeaveGrace;
var RewindCollisionManager RwColMgr;
var NetHitInfo ClientHits[8];
var byte Latest;
var byte HitCounter;
var byte OldHitCounter;
var int LastIndex;
var array<HitInfo> LocalHits;
var array<Actor> Stumps;
var array<Actor> GoreFX;
var array<name> SeveredBones;
var Class<BallisticBloodSet> BloodSet;
var Vector LastDragLocation;
var() float MinDragDistance;
var() float MaxPoolVelocity;
var float CorpseRestTime;
var bool bBleedingCorpse;
var bool bBloodPoolSpawned;
var BallisticDecal BloodPool;
var Emitter WaterBlood;
var() float HighImpactVelocity;
var() float LowImpactVelocity;
var float LastImpactTime;
var() float TimeBetweenImpacts;
var Vector LastImpactNormal;
var Vector LastImpactLocation;
var BCSprintControl Sprinter;
var float LastDodgeTime;
var float DodgeInterval;
var Vector BloodFlashV;
var Vector ShieldFlashV;
var Projector NewDeResDecal;
var Sound NewDeResSound;
var array<Shader> NewDeResShaders;
var array<FinalBlend> NewDeResFinalBlends;
var BallisticPlayerReplicationInfo BPRI;
var BallisticReplicationInfo BRI;
var bool pawnNetInit;
var name ReloadAnim;
var name CockingAnim;
var name MeleeAnim;
var name MeleeOffhandAnim;
var name MeleeAltAnim;
var name MeleeBlockAnim;
var name MeleeWindupAnim;
var name WeaponSpecialAnim;
var name StaggerAnim;
var float ReloadAnimRate;
var float CockAnimRate;
var float MeleeAnimRate;
var float WeaponSpecialRate;
var float StaggerRate;
var bool bOffhandStrike;
var() float GruntRadius;
var() float FootstepRadius;
var array<Actor> CoverAnchors;
var int CrouchEyeHeight;
var bool bPendingNegation;
var array<Material> OriginalSkins;
var array<Material> Fades;
var byte CurFade;
var byte Penalty;
var bool bTransparencyInitialized;
var bool bTransparencyOn;
var bool bOldTransparency;
var bool bActiveKillstreak;
var float NextHealMessageTime;
var bool bPreventHealing;
var Pawn HealPreventer;
var int PreventHealCount;
var Class<LocalMessage> HealBlockMessage;
var float LastDamagedTime;
var Class<DamageType> LastDamagedType;
var float StrafeScale;
var float BackpedalScale;
var float MyFriction;
var float OldMovementSpeed;
var bool bCanDodge;
var() bool bAllowCrouchSliding;
var() float SlideFriction;
var() float SlideCooldownTime;
var() float SlidePower;
var bool bIsSliding;
var float LastSlideEndTime;
var float LastLandTime;
var Vector SlideVelocity;
var float SlideStartSpeed;
var float SlideStopSpeed;
var float MaxSlideSpeed;
var float SlopeAngleRad;
var float SlopeAngleDeg;
var Vector DownSlopeVect;
var Vector LastFallingVelocity;
var float GravityAlongSlope;
var bool bSlideWaitingStart;
var name SlideAnims[4];
var name SlideStartAnims[4];
var name SlideEndAnims[4];
var float CrouchEndTime;
var() float JumpCrouchPenalty;
var() float JumpCrouchTime;
var() float BackSlidePowerScale;
var() float BackMaxSlideSpeedScale;
var() float BackSlideDotThreshold;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientHits, ClientSetCrouchAbility, 
		HitCounter, SlideVelocity, 
		Sprinter, bIsSliding;
}

simulated event PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x2A
	if(!Class'BCoreProV55.BallisticReplicationInfo'.default.bBrightPlayers)
	{
		bDramaticLighting = false;
		AmbientGlow = 0;
	}
	ApplyMovementOverrides();
	ApplySizeOverrides();
	// End:0x88
	if(Class'BCoreProV55.BallisticGameStyles'.static.GetReplicatedStyle().default.bRunInADS)
	{
		WalkAnims[0] = 'RunF';
		WalkAnims[1] = 'RunB';
		WalkAnims[2] = 'RunL';
		WalkAnims[3] = 'RunR';
	}
	// End:0xC9
	if(!pawnNetInit)
	{
		pawnNetInit = true;
		// End:0xC9
		if(Controller != none)
		{
			BPRI = Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Controller.PlayerReplicationInfo);
		}
	}
	//return;	
}

simulated function Vector CalcDrawOffset(Inventory Inv)
{
	local Vector DrawOffset;

	// End:0x38
	if(Controller == none)
	{
		return (Inv.PlayerViewOffset >> Rotation) + (BaseEyeHeight * vect(0.0000000, 0.0000000, 1.0000000));
	}
	DrawOffset = (((0.9000000 / float(60)) * float(100)) * (ModifiedPlayerViewOffset(Inv))) >> (GetViewRotation());
	// End:0x84
	if(!IsLocallyControlled())
	{
		DrawOffset.Z += BaseEyeHeight;		
	}
	else
	{
		DrawOffset.Z += EyeHeight;
		DrawOffset += (WeaponBob(Inv.BobDamping));
		DrawOffset += (CameraShake());
	}
	return DrawOffset;
	//return;	
}

final simulated function BindDefaultMovement()
{
	default.WalkingPct = WalkingPct;
	default.CrouchedPct = CrouchedPct;
	default.StrafeScale = StrafeScale;
	default.BackpedalScale = BackpedalScale;
	default.GroundSpeed = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerAnimationGroundSpeed;
	default.AirSpeed = AirSpeed;
	default.LadderSpeed = LadderSpeed;
	default.AccelRate = AccelRate;
	default.JumpZ = JumpZ;
	default.DodgeSpeedFactor = DodgeSpeedFactor;
	default.DodgeSpeedZ = DodgeSpeedZ;
	default.WalkAnims[0] = WalkAnims[0];
	default.WalkAnims[1] = WalkAnims[1];
	default.WalkAnims[2] = WalkAnims[2];
	default.WalkAnims[3] = WalkAnims[3];
	//return;	
}

simulated function ApplyMovementOverrides()
{
	// End:0x24
	if(!Class'BCoreProV55.BallisticReplicationInfo'.default.bAllowDodging)
	{
		bCanWallDodge = false;
		bCanDodge = false;
	}
	// End:0x40
	if(!Class'BCoreProV55.BallisticReplicationInfo'.default.bAllowDoubleJump)
	{
		bCanDoubleJump = false;
	}
	bAllowCrouchSliding = Class'BCoreProV55.BallisticReplicationInfo'.default.bAllowCrouchSliding;
	WalkingPct = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerWalkSpeedFactor;
	CrouchedPct = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerCrouchSpeedFactor;
	StrafeScale = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerStrafeScale;
	BackpedalScale = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerBackpedalScale;
	// End:0xCA
	if(int(Role) == int(ROLE_Authority))
	{
		GroundSpeed = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerGroundSpeed;
	}
	AirSpeed = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerAirSpeed;
	LadderSpeed = GroundSpeed * 0.6500000;
	AccelRate = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerAccelRate;
	JumpZ = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerJumpZ;
	DodgeSpeedFactor = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerDodgeSpeedFactor;
	DodgeSpeedZ = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerDodgeZ;
	// End:0x165
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsTactical())
	{
		DodgeInterval = 1.2500000;
		bCanWallDodge = false;
	}
	BindDefaultMovement();
	//return;	
}

simulated function ApplySizeOverrides()
{
	// End:0x3C
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena() || Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassic())
	{
		default.BaseEyeHeight = 38.0000000;
		default.CrouchHeight = 29.0000000;
	}
	//return;	
}

simulated function CreateColorStyle()
{
	local int i;
	local string texDetailString;

	i = 0;
	J0x07:

	// End:0x51 [Loop If]
	if(i < Skins.Length)
	{
		OriginalSkins[i] = Skins[i];
		Skins[i] = Fades[int(CurFade)];
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	texDetailString = Level.GetLocalPlayerController().ConsoleCommand("get ini:Engine.Engine.ViewportManager TextureDetailWorld");
	switch(texDetailString)
	{
		// End:0xC9
		case "UltraLow":
			Penalty = 5;
			// End:0x156
			break;
		// End:0xE0
		case "VeryLow":
			Penalty = 5;
			// End:0x156
			break;
		// End:0xF3
		case "Low":
			Penalty = 5;
			// End:0x156
			break;
		// End:0x108
		case "Lower":
			Penalty = 4;
			// End:0x156
			break;
		// End:0x11E
		case "Normal":
			Penalty = 3;
			// End:0x156
			break;
		// End:0x132
		case "High":
			Penalty = 2;
			// End:0x156
			break;
		// End:0x148
		case "Higher":
			Penalty = 1;
			// End:0x156
			break;
		// End:0xFFFF
		default:
			Penalty = 0;
			// End:0x156
			break;
			break;
	}
	// End:0x1B4
	if(!bool(Level.GetLocalPlayerController().ConsoleCommand("get ini:Engine.Engine.RenderDevice DetailTextures")))
	{
		Penalty += byte(2);
	}
	bTransparencyInitialized = true;
	//return;	
}

simulated exec function AdjustAlphaFade(byte Amount)
{
	local int i, lastFade;

	// End:0xEA
	if(!bTransparencyInitialized)
	{
		// End:0x1B
		if(int(Amount) == 255)
		{
			return;
		}
		CreateColorStyle();
		bTransparencyOn = true;
		AmbientGlow = 0;
		Visibility = 1;
		CurFade = byte(Min(int(Amount) >> 3, 14));
		bDramaticLighting = int(CurFade) > 5;
		// End:0x99
		if(int(Penalty) > 0)
		{
			// End:0x91
			if(int(CurFade) >= int(Penalty))
			{
				CurFade -= Penalty;				
			}
			else
			{
				CurFade = 0;
			}
		}
		i = 0;
		J0xA0:

		// End:0xE7 [Loop If]
		if(i < Skins.Length)
		{
			// End:0xC4
			if(Skins[i] == none)
			{
				// [Explicit Continue]
				goto J0xDD;
			}
			Skins[i] = Fades[int(CurFade)];
			J0xDD:

			++i;
			// [Loop Continue]
			goto J0xA0;
		}		
	}
	else
	{
		// End:0x226
		if(bTransparencyOn)
		{
			// End:0x157
			if(int(Amount) == 255)
			{
				Visibility = default.Visibility;
				i = 0;
				J0x113:

				// End:0x144 [Loop If]
				if(i < Skins.Length)
				{
					Skins[i] = OriginalSkins[i];
					++i;
					// [Loop Continue]
					goto J0x113;
				}
				bTransparencyOn = false;
				bDramaticLighting = true;				
			}
			else
			{
				lastFade = int(CurFade);
				CurFade = byte(Min(int(Amount) >> 3, 15));
				bDramaticLighting = int(CurFade) > 5;
				// End:0x1C4
				if(int(Penalty) > 0)
				{
					// End:0x1BC
					if(int(CurFade) >= int(Penalty))
					{
						CurFade -= Penalty;						
					}
					else
					{
						CurFade = 0;
					}
				}
				// End:0x223
				if(lastFade != int(CurFade))
				{
					i = 0;
					J0x1DC:

					// End:0x223 [Loop If]
					if(i < Skins.Length)
					{
						// End:0x200
						if(Skins[i] == none)
						{
							// [Explicit Continue]
							goto J0x219;
						}
						Skins[i] = Fades[int(CurFade)];
						J0x219:

						++i;
						// [Loop Continue]
						goto J0x1DC;
					}
				}
			}			
		}
		else
		{
			// End:0x2FA
			if(int(Amount) < 255)
			{
				bTransparencyOn = true;
				AmbientGlow = 0;
				Visibility = 1;
				CurFade = byte(Min(int(Amount) >> 3, 15));
				bDramaticLighting = int(CurFade) > 5;
				// End:0x2AC
				if(int(Penalty) > 0)
				{
					// End:0x2A4
					if(int(CurFade) >= int(Penalty))
					{
						CurFade -= Penalty;						
					}
					else
					{
						CurFade = 0;
					}
				}
				i = 0;
				J0x2B3:

				// End:0x2FA [Loop If]
				if(i < Skins.Length)
				{
					// End:0x2D7
					if(Skins[i] == none)
					{
						// [Explicit Continue]
						goto J0x2F0;
					}
					Skins[i] = Fades[int(CurFade)];
					J0x2F0:

					++i;
					// [Loop Continue]
					goto J0x2B3;
				}
			}
		}
	}
	//return;	
}

simulated function CancelTransparency()
{
	local int i;

	// End:0x0D
	if(!bTransparencyInitialized)
	{
		return;
	}
	i = 0;
	J0x14:

	// End:0x45 [Loop If]
	if(i < Skins.Length)
	{
		Skins[i] = OriginalSkins[i];
		++i;
		// [Loop Continue]
		goto J0x14;
	}
	bTransparencyInitialized = false;
	bTransparencyOn = false;
	//return;	
}

simulated function SetOverlayMaterial(Material mat, float Time, bool bOverride)
{
	// End:0x21
	if(!bTransparencyOn)
	{
		super.SetOverlayMaterial(mat, Time, bOverride);
	}
	//return;	
}

simulated function TickFX(float DeltaTime)
{
	// End:0x15
	if(SimHitFxTicker != HitFxTicker)
	{
		ProcessHitFX();
	}
	// End:0x7D
	if((bInvis && !bOldInvis) || bTransparencyOn && !bOldTransparency)
	{
		Projectors.Remove(0, Projectors.Length);
		bAcceptsProjectors = false;
		// End:0x74
		if(PlayerShadow != none)
		{
			PlayerShadow.bShadowActive = false;
		}
		RemoveFlamingEffects();		
	}
	else
	{
		// End:0xD4
		if((!bInvis && bOldInvis) || !bTransparencyOn && bOldTransparency)
		{
			bAcceptsProjectors = default.bAcceptsProjectors;
			// End:0xD4
			if(PlayerShadow != none)
			{
				PlayerShadow.bShadowActive = true;
			}
		}
	}
	bOldTransparency = bTransparencyOn;
	bDrawCorona = ((((((!bNoCoronas && !bInvis) && !bTransparencyOn) && int(Level.NetMode) != int(NM_DedicatedServer)) && !bPlayedDeath) && Level.GRI != none) && Level.GRI.bAllowPlayerLights) && PlayerReplicationInfo != none;
	// End:0x1C7
	if(bDrawCorona && PlayerReplicationInfo.Team != none)
	{
		// End:0x1BC
		if(PlayerReplicationInfo.Team.TeamIndex == 0)
		{
			Texture = Texture'XEffects.RedMarker_t';			
		}
		else
		{
			Texture = Texture'XEffects.BlueMarker_t';
		}
	}
	//return;	
}

function bool AddInventory(Inventory NewItem)
{
	local bool ret;

	ret = super(Pawn).AddInventory(NewItem);
	// End:0x3F
	if((NewItem != none) && BCSprintControl(NewItem) != none)
	{
		Sprinter = BCSprintControl(NewItem);
	}
	return ret;
	//return;	
}

event HitWall(Vector HitNormal, Actor Wall)
{
	// End:0x24
	if(Controller != none)
	{
		Controller.NotifyHitWall(HitNormal, Wall);
	}
	// End:0x3F
	if(VSize(Velocity) > float(900))
	{
		bPendingNegation = true;
	}
	//return;	
}

event Landed(Vector HitNormal)
{
	// End:0x11
	if(bDirectHitWall)
	{
		bDirectHitWall = false;
	}
	super(Pawn).Landed(HitNormal);
	MultiJumpRemaining = MaxMultiJump;
	LastLandTime = Level.TimeSeconds;
	// End:0x8F
	if(((Health > 0) && !bHidden) && (Level.TimeSeconds - SplashTime) > 0.2500000)
	{
		PlayOwnedSound(GetSound(0), 3, 0.5000000, true, 30.0000000);
	}
	//return;	
}

function PawnCheckBob(float DeltaTime, Vector Y)
{
	local float Speed2D;

	// End:0x34
	if(bJustLanded || bIsSliding)
	{
		bobtime = 0.0000000;
		WalkBob = vect(0.0000000, 0.0000000, 0.0000000);
		return;
	}
	Bob = FClamp(Bob, -0.0100000, 0.0100000);
	// End:0x15D
	if(int(Physics) == int(1))
	{
		Speed2D = VSize(Velocity);
		// End:0x8C
		if(Speed2D < float(10))
		{
			bobtime += (0.2000000 * DeltaTime);			
		}
		else
		{
			bobtime += (DeltaTime * (0.3000000 + ((0.7000000 * Speed2D) / GroundSpeed)));
		}
		WalkBob = ((Y * Bob) * Speed2D) * Sin(8.0000000 * bobtime);
		AppliedBob = AppliedBob * (float(1) - FMin(1.0000000, 16.0000000 * DeltaTime));
		WalkBob.Z = AppliedBob;
		// End:0x15A
		if(Speed2D > float(10))
		{
			WalkBob.Z = WalkBob.Z + (((0.7500000 * Bob) * Speed2D) * Sin(16.0000000 * bobtime));
		}		
	}
	else
	{
		// End:0x210
		if(int(Physics) == int(3))
		{
			bobtime += DeltaTime;
			Speed2D = Sqrt((Velocity.X * Velocity.X) + (Velocity.Y * Velocity.Y));
			WalkBob = (((Y * Bob) * 0.5000000) * Speed2D) * Sin(4.0000000 * bobtime);
			WalkBob.Z = ((Bob * 1.5000000) * Speed2D) * Sin(8.0000000 * bobtime);			
		}
		else
		{
			bobtime = 0.0000000;
			WalkBob = WalkBob * (float(1) - FMin(1.0000000, 8.0000000 * DeltaTime));
		}
	}
	//return;	
}

function CheckBob(float DeltaTime, Vector Y)
{
	local float OldBobTime;
	local int M, N;

	DeltaTime *= (GroundSpeed / (Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerGroundSpeed * 1.5000000));
	OldBobTime = bobtime;
	PawnCheckBob(DeltaTime, Y);
	// End:0x98
	if((((int(Physics) != int(1)) || bIsCrouched) || VSize(Velocity) < float(10)) || (PlayerController(Controller) != none) && PlayerController(Controller).bBehindView)
	{
		return;
	}
	M = int((0.5000000 * 3.1415930) + ((9.0000000 * OldBobTime) / 3.1415930));
	N = int((0.5000000 * 3.1415930) + ((9.0000000 * bobtime) / 3.1415930));
	// End:0x100
	if(M != N)
	{
		FootStepping(0);
	}
	//return;	
}

final simulated function float FootstepSurfaceScale(int Surf)
{
	switch(Surf)
	{
		// End:0x11
		case 0:
			return 1.0000000;
		// End:0x1B
		case 1:
			return 1.0000000;
		// End:0x26
		case 2:
			return 1.0000000;
		// End:0x31
		case 3:
			return 2.0000000;
		// End:0x3C
		case 4:
			return 1.5000000;
		// End:0x47
		case 5:
			return 0.7500000;
		// End:0x52
		case 6:
			return 2.0000000;
		// End:0x5D
		case 7:
			return 1.0000000;
		// End:0x68
		case 8:
			return 1.5000000;
		// End:0x73
		case 9:
			return 2.0000000;
		// End:0x7E
		case 10:
			return 1.0000000;
		// End:0xFFFF
		default:
			return 1.0000000;
			break;
	}
	//return;	
}

simulated function ClientPlayLinearSound(Sound Sound, Actor.ESoundSlot Slot, float Volume, float Radius)
{
	local float dist;

	// End:0x18
	if(IsLocallyControlled())
	{
		Volume *= 0.6500000;		
	}
	else
	{
		// End:0x5E
		if(!FastTrace(Location, Level.GetLocalPlayerController().ViewTarget.Location))
		{
			Volume *= 0.8000000;
			Radius *= 0.7500000;
		}
	}
	dist = FMax(64.0000000, VSize(Location - Level.GetLocalPlayerController().ViewTarget.Location));
	// End:0xA6
	if(dist > Radius)
	{
		return;
	}
	Volume *= (float(1) - (dist / Radius));
	PlaySound(Sound, Slot, Volume,, dist);
	//return;	
}

simulated function FootStepping(int Side)
{
	local int SurfaceNum, i;
	local Actor A;
	local Material FloorMat;
	local Vector hl, hn, Start, End, HitLocation, HitNormal;

	local float SoundVolumeScale, SoundRadiusScale;

	// End:0x0B
	if(bIsCrouched)
	{
		return;
	}
	// End:0x2D
	if(bIsWalking)
	{
		SoundVolumeScale = 0.6500000;
		SoundRadiusScale = 0.6500000;		
	}
	else
	{
		// End:0x5E
		if(GroundSpeed > Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerGroundSpeed)
		{
			SoundVolumeScale = 1.2000000;
			SoundRadiusScale = 1.4000000;			
		}
		else
		{
			SoundVolumeScale = 1.0000000;
			SoundRadiusScale = 1.0000000;
		}
	}
	i = 0;
	J0x7B:

	// End:0x201 [Loop If]
	if(i < Touching.Length)
	{
		// End:0x1F7
		if(((PhysicsVolume(Touching[i]) != none) && PhysicsVolume(Touching[i]).bWaterVolume) || FluidSurfaceInfo(Touching[i]) != none)
		{
			SoundVolumeScale *= 1.5000000;
			SoundRadiusScale *= 1.5000000;
			// End:0x124
			if(FRand() < 0.5000000)
			{
				ClientPlayLinearSound(Sound'PlayerSounds.BFootsteps.FootstepWater2', 3, FootstepVolume * SoundVolumeScale, FootstepRadius * SoundRadiusScale);				
			}
			else
			{
				ClientPlayLinearSound(Sound'PlayerSounds.BFootsteps.FootstepWater1', 3, FootstepVolume * SoundVolumeScale, FootstepRadius * SoundRadiusScale);
			}
			// End:0x1F5
			if(((!Level.bDropDetail && int(Level.DetailMode) != int(0)) && int(Level.NetMode) != int(NM_DedicatedServer)) && !Touching[i].TraceThisActor(HitLocation, HitNormal, Location - (CollisionHeight * vect(0.0000000, 0.0000000, 1.1000000)), Location))
			{
				Spawn(Class'XGame.WaterRing',,, HitLocation, rot(16384, 0, 0));
			}
			return;
		}
		i++;
		// [Loop Continue]
		goto J0x7B;
	}
	SurfaceNum = 0;
	// End:0x25C
	if(((Base != none) && !Base.IsA('LevelInfo')) && int(Base.SurfaceType) != 0)
	{
		SurfaceNum = int(Base.SurfaceType);		
	}
	else
	{
		Start = Location - (vect(0.0000000, 0.0000000, 1.0000000) * CollisionHeight);
		End = Start - vect(0.0000000, 0.0000000, 16.0000000);
		A = Trace(hl, hn, End, Start, false,, FloorMat);
		// End:0x2DC
		if(FloorMat != none)
		{
			SurfaceNum = int(FloorMat.SurfaceType);
		}
	}
	SoundRadiusScale *= FootstepSurfaceScale(SurfaceNum);
	ClientPlayLinearSound(SoundFootsteps[SurfaceNum], 3, FootstepVolume * SoundVolumeScale, FootstepRadius * SoundRadiusScale);
	//return;	
}

simulated function AssignInitialPose()
{
	local PlayerRecord recx;
	local bool bContinue;
	local int i;

	super.AssignInitialPose();
	// End:0x19D
	if(PlayerReplicationInfo != none)
	{
		recx = Class'XGame.xUtil'.static.FindPlayerRecord(PlayerReplicationInfo.CharacterName);
		// End:0x62
		if((int(Level.NetMode) != int(NM_DedicatedServer)) && bLocalDisableAnimation)
		{
			bDisablePawnAnimation = true;
			return;
		}
		// End:0xF3
		if((Locs(Left(string(recx.Species), 5)) != "xgame") || recx.Skeleton != "")
		{
			i = 0;
			J0x9A:

			// End:0xDE [Loop If]
			if(i < ModelWhitelist.Length)
			{
				// End:0xD4
				if(Locs(PlayerReplicationInfo.CharacterName) == Locs(ModelWhitelist[i]))
				{
					bContinue = true;
				}
				i++;
				// [Loop Continue]
				goto J0x9A;
			}
			// End:0xF3
			if(!bContinue)
			{
				bDisablePawnAnimation = true;
				return;
			}
		}
		// End:0x120
		if(recx.Species.default.SpeciesName == "Alien")
		{
			LinkSkelAnim(MeshAnimation'BallisticThird.Ballistic3rdAlien');			
		}
		else
		{
			// End:0x152
			if(recx.Species.default.SpeciesName == "Juggernaut")
			{
				LinkSkelAnim(MeshAnimation'BallisticThird.Ballistic3rd');				
			}
			else
			{
				// End:0x192
				if((recx.Sex ~= "Female") && PlayerReplicationInfo.CharacterName != "July")
				{
					LinkSkelAnim(MeshAnimation'BallisticThird.Ballistic3rdFemale');					
				}
				else
				{
					LinkSkelAnim(MeshAnimation'BallisticThird.Ballistic3rd');
				}
			}
		}
	}
	//return;	
}

simulated function SetWeaponAttachment(xWeaponAttachment NewAtt)
{
	local BallisticAttachment BAtt;

	WeaponAttachment = NewAtt;
	BAtt = BallisticAttachment(NewAtt);
	// End:0x22D
	if(BAtt != none)
	{
		ReloadAnim = BAtt.ReloadAnim;
		ReloadAnimRate = BAtt.ReloadAnimRate;
		CockingAnim = BAtt.CockingAnim;
		CockAnimRate = BAtt.CockAnimRate;
		// End:0xA1
		if(HasAnim(BAtt.IdleHeavyAnim))
		{
			IdleHeavyAnim = BAtt.IdleHeavyAnim;			
		}
		else
		{
			IdleHeavyAnim = 'Idle_Biggun';
		}
		// End:0xD7
		if(HasAnim(BAtt.IdleRifleAnim))
		{
			IdleRifleAnim = BAtt.IdleRifleAnim;			
		}
		else
		{
			IdleHeavyAnim = 'Idle_Rifle';
		}
		FireHeavyBurstAnim = BAtt.SingleFireAnim;
		FireHeavyRapidAnim = BAtt.RapidFireAnim;
		FireRifleBurstAnim = BAtt.SingleAimedFireAnim;
		FireRifleRapidAnim = BAtt.RapidAimedFireAnim;
		MeleeBlockAnim = BAtt.MeleeBlockAnim;
		MeleeWindupAnim = BAtt.MeleeWindupAnim;
		WeaponSpecialAnim = BAtt.WeaponSpecialAnim;
		WeaponSpecialRate = BAtt.WeaponSpecialRate;
		StaggerAnim = BAtt.StaggerAnim;
		StaggerRate = BAtt.StaggerRate;
		MeleeAnim = BAtt.MeleeStrikeAnim;
		IdleRestAnim = BAtt.IdleHeavyAnim;
		// End:0x222
		if(BallisticMeleeAttachment(NewAtt) != none)
		{
			MeleeAltAnim = BallisticMeleeAttachment(NewAtt).MeleeAltStrikeAnim;
			IdleWeaponAnim = IdleHeavyAnim;
			IdleRifleAnim = BallisticMeleeAttachment(NewAtt).MeleeBlockAnim;			
		}
		else
		{
			IdleWeaponAnim = IdleHeavyAnim;
		}
	}
	//return;	
}

simulated event SetAnimAction(name NewAction)
{
	local int i;

	// End:0x696
	if(!bWaitForAnim)
	{
		AnimAction = NewAction;
		// End:0x51
		if(AnimAction == 'Weapon_Switch')
		{
			AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
			PlayAnim(NewAction,, 0.0000000, 1);
			return;
		}
		// End:0xCA
		if(AnimAction == 'ReloadGun')
		{
			// End:0xBD
			if((ReloadAnim != 'None') && HasAnim(ReloadAnim))
			{
				AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
				PlayAnim(ReloadAnim, ReloadAnimRate, 0.2500000, 1);
				FireState = 1;
				bResetAnimationAction = true;				
			}
			else
			{
				AnimAction = 'None';
			}
			return;
		}
		// End:0x126
		if((AnimAction == 'MeleeStrike') && HasAnim(MeleeAnim))
		{
			AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
			PlayAnim(MeleeAnim, 1.0000000, 0.0500000, 1);
			FireState = 1;
			bResetAnimationAction = true;
			return;
		}
		// End:0x185
		if((AnimAction == 'Shovel') && HasAnim('Reload_ShovelBottom'))
		{
			AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
			PlayAnim('Reload_ShovelBottom', 1.0000000, 0.2500000, 1);
			FireState = 1;
			AnimAction = 'None';
			return;
		}
		// End:0x1FE
		if((AnimAction == 'CockGun') && HasAnim(CockingAnim))
		{
			// End:0x1F1
			if(CockingAnim != 'None')
			{
				AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
				PlayAnim(CockingAnim, CockAnimRate, 0.2500000, 1);
				FireState = 1;
				bResetAnimationAction = true;				
			}
			else
			{
				AnimAction = 'None';
			}
			return;
		}
		// End:0x277
		if((AnimAction == 'WeaponSpecial') && HasAnim(WeaponSpecialAnim))
		{
			// End:0x26A
			if(ReloadAnim != 'None')
			{
				AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
				PlayAnim(WeaponSpecialAnim, WeaponSpecialRate, 0.2500000, 1);
				FireState = 1;
				bResetAnimationAction = true;				
			}
			else
			{
				AnimAction = 'None';
			}
			return;
		}
		// End:0x2F0
		if((AnimAction == 'Stagger') && HasAnim(StaggerAnim))
		{
			// End:0x2E3
			if(ReloadAnim != 'None')
			{
				AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
				PlayAnim(StaggerAnim, StaggerRate, 0.2500000, 1);
				FireState = 1;
				bResetAnimationAction = true;				
			}
			else
			{
				AnimAction = 'None';
			}
			return;
		}
		// End:0x370
		if((AnimAction == 'Raise') && HasAnim(IdleRifleAnim))
		{
			AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
			// End:0x358
			if((int(FireState) == int(0)) || int(FireState) == int(3))
			{
				PlayAnim(IdleRifleAnim,, 0.2000000, 1);
			}
			IdleWeaponAnim = IdleRifleAnim;
			FireState = 0;
			return;			
		}
		else
		{
			// End:0x3ED
			if((AnimAction == 'Lower') && HasAnim(IdleHeavyAnim))
			{
				AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
				// End:0x3D8
				if((int(FireState) == int(0)) || int(FireState) == int(3))
				{
					PlayAnim(IdleHeavyAnim,, 0.2000000, 1);
				}
				IdleWeaponAnim = IdleHeavyAnim;
				FireState = 3;
				return;
			}
		}
		// End:0x461
		if(((int(Physics) == int(0)) || (Level.Game != none) && Level.Game.IsInState('MatchOver')) && DrivenVehicle == none)
		{
			PlayAnim(AnimAction,, 0.1000000);
			AnimBlendToAlpha(1, 0.0000000, 0.0500000);			
		}
		else
		{
			// End:0x53D
			if(((DrivenVehicle != none) || int(Physics) == int(2)) || (int(Physics) == int(1)) && Velocity.Z != float(0))
			{
				// End:0x509
				if(FindValidTaunt(AnimAction))
				{
					// End:0x506
					if((int(FireState) == int(0)) || int(FireState) == int(3))
					{
						AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
						PlayAnim(NewAction,, 0.1000000, 1);
						FireState = 3;
					}					
				}
				else
				{
					// End:0x52F
					if(PlayAnim(AnimAction))
					{
						// End:0x52C
						if(int(Physics) != int(0))
						{
							bWaitForAnim = true;
						}						
					}
					else
					{
						AnimAction = 'None';
					}
				}				
			}
			else
			{
				// End:0x587
				if((bIsIdle && !bIsCrouched) && Bot(Controller) == none)
				{
					PlayAnim(AnimAction,, 0.1000000);
					AnimBlendToAlpha(1, 0.0000000, 0.0500000);					
				}
				else
				{
					// End:0x5DB
					if((int(FireState) == int(0)) || int(FireState) == int(3))
					{
						AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
						PlayAnim(NewAction,, 0.1000000, 1);
						FireState = 3;
					}
				}
			}
		}
		i = 0;
		J0x5E2:

		// End:0x696 [Loop If]
		if(i < 4)
		{
			// End:0x628
			if(AnimAction == SlideStartAnims[i])
			{
				// End:0x61E
				if(PlayAnim(AnimAction, 2.0000000))
				{
					bSlideWaitingStart = true;					
				}
				else
				{
					bSlideWaitingStart = false;
				}
				return;
			}
			// End:0x655
			if(AnimAction == SlideAnims[i])
			{
				bSlideWaitingStart = false;
				LoopAnim(AnimAction,, 0.2000000);
				return;
			}
			// End:0x68C
			if(AnimAction == SlideEndAnims[i])
			{
				bSlideWaitingStart = false;
				// End:0x68A
				if(PlayAnim(AnimAction, 2.0000000))
				{
					bWaitForAnim = true;
				}
				return;
			}
			++i;
			// [Loop Continue]
			goto J0x5E2;
		}
	}
	//return;	
}

simulated function StartFiring(bool bHeavy, bool bRapid)
{
	local name FireAnim;

	// End:0x5A
	if((HasUDamage()) && (Level.TimeSeconds - LastUDamageSoundTime) > 0.2500000)
	{
		LastUDamageSoundTime = Level.TimeSeconds;
		PlaySound(UDamageSound, 0, 1.5000000 * TransientSoundVolume,, 700.0000000);
	}
	// End:0x6C
	if(int(Physics) == int(3))
	{
		return;
	}
	// End:0x1AB
	if(BallisticMeleeAttachment(WeaponAttachment) == none)
	{
		// End:0xDC
		if(bHeavy)
		{
			// End:0xB5
			if(bRapid)
			{
				// End:0xA7
				if(HasAnim(FireHeavyRapidAnim))
				{
					FireAnim = FireHeavyRapidAnim;					
				}
				else
				{
					FireAnim = 'Biggun_Burst';
				}				
			}
			else
			{
				// End:0xCE
				if(HasAnim(FireHeavyBurstAnim))
				{
					FireAnim = FireHeavyBurstAnim;					
				}
				else
				{
					FireAnim = 'Biggun_Aimed';
				}
			}			
		}
		else
		{
			// End:0x10C
			if(bRapid)
			{
				// End:0xFE
				if(HasAnim(FireRifleRapidAnim))
				{
					FireAnim = FireRifleRapidAnim;					
				}
				else
				{
					FireAnim = 'Rifle_Burst';
				}				
			}
			else
			{
				// End:0x125
				if(HasAnim(FireRifleBurstAnim))
				{
					FireAnim = FireRifleBurstAnim;					
				}
				else
				{
					FireAnim = 'Rifle_Aimed';
				}
			}
		}
		AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
		// End:0x17E
		if(bRapid)
		{
			// End:0x17B
			if(int(FireState) != int(2))
			{
				LoopAnim(FireAnim,, 0.0000000, 1);
				FireState = 2;
			}			
		}
		else
		{
			PlayAnim(FireAnim,, 0.0000000, 1);
			FireState = 1;
		}
		IdleTime = Level.TimeSeconds;
		return;
	}
	// End:0x209
	if(!bHeavy)
	{
		// End:0x1FB
		if(MeleeOffhandAnim != 'None')
		{
			// End:0x1DE
			if(!bOffhandStrike)
			{
				FireAnim = MeleeAnim;				
			}
			else
			{
				FireAnim = MeleeOffhandAnim;
			}
			bOffhandStrike = !bOffhandStrike;			
		}
		else
		{
			FireAnim = MeleeAnim;
		}		
	}
	else
	{
		FireAnim = MeleeAltAnim;
	}
	AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
	PlayAnim(FireAnim,, 0.0000000, 1);
	FireState = 1;
	IdleTime = Level.TimeSeconds;
	//return;	
}

simulated function AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	// End:0x11C
	if(Channel == 1)
	{
		GetAnimParams(1, Anim, frame, Rate);
		// End:0x5C
		if((IdleWeaponAnim == IdleRifleAnim) && int(FireState) != int(2))
		{
			LoopAnim(IdleWeaponAnim,, 0.2000000, 1);
			FireState = 0;			
		}
		else
		{
			// End:0x88
			if(int(FireState) == int(3))
			{
				AnimBlendToAlpha(1, 0.0000000, 0.1200000);
				FireState = 0;				
			}
			else
			{
				// End:0xC6
				if(int(FireState) == int(1))
				{
					PlayAnim(IdleWeaponAnim,, 0.2000000, 1);
					FireState = 3;
					IdleTime = Level.TimeSeconds;					
				}
				else
				{
					// End:0xE7
					if(int(FireState) != int(2))
					{
						AnimBlendToAlpha(1, 0.0000000, 0.1200000);
					}
				}
			}
		}
		GetAnimParams(1, Anim, frame, Rate);
		// End:0x119
		if(bResetAnimationAction)
		{
			bResetAnimationAction = false;
			AnimAction = 'None';
		}		
	}
	else
	{
		// End:0x156
		if(Channel == 0)
		{
			// End:0x147
			if(bSlideWaitingStart)
			{
				bSlideWaitingStart = false;
				// End:0x147
				if(bIsSliding)
				{
					LoopSlideAnim();
				}
			}
			// End:0x156
			if(bKeepTaunting)
			{
				PlayVictoryAnimation();
			}
		}
	}
	//return;	
}

function HealBlock(Pawn Instigator, Class<LocalMessage> BlockMessageClass)
{
	PreventHealCount++;
	bPreventHealing = true;
	HealPreventer = Instigator;
	HealBlockMessage = BlockMessageClass;
	//return;	
}

function ReleaseHealBlock()
{
	PreventHealCount--;
	// End:0x1A
	if(PreventHealCount == 0)
	{
		bPreventHealing = false;
	}
	//return;	
}

function bool GiveAttributedHealth(int HealAmount, int HealMax, Pawn Healer, optional bool bOverheal)
{
	local int OldHealth;

	// End:0x21
	if(bPreventHealing && bProjTarget)
	{
		MessageAttributedHealBlock(Healer);
		return false;
	}
	OldHealth = Health;
	// End:0x54
	if(Health < HealMax)
	{
		Health = Min(HealMax, Health + HealAmount);
	}
	HealAmount -= (Health - OldHealth);
	// End:0xC1
	if(((HealAmount > 0) && bOverheal) && float(Health) >= SuperHealthMax)
	{
		AddShieldStrength(HealAmount);
		// End:0xBF
		if((Healer != none) && Healer != self)
		{
			MessageHeal(Healer, 1);
		}
		return true;
	}
	// End:0xD2
	if(OldHealth == Health)
	{
		return false;
	}
	// End:0xF6
	if((Healer != none) && Healer != self)
	{
		MessageHeal(Healer, 0);
	}
	return true;
	//return;	
}

function bool GiveAttributedShield(int HealAmount, Pawn Healer)
{
	local int OldShield;

	// End:0x21
	if(bPreventHealing && bProjTarget)
	{
		MessageAttributedHealBlock(Healer);
		return false;
	}
	AddShieldStrength(HealAmount);
	// End:0x3F
	if(float(OldShield) == ShieldStrength)
	{
		return false;
	}
	// End:0x63
	if((Healer != none) && Healer != self)
	{
		MessageHeal(Healer, 1);
	}
	return true;
	//return;	
}

function bool GiveHealth(int HealAmount, int HealMax)
{
	// End:0x1C
	if(bPreventHealing && bProjTarget)
	{
		MessageHealBlock();
		return false;
	}
	return super(Pawn).GiveHealth(HealAmount, HealMax);
	//return;	
}

function MessageHeal(Pawn Healer, int Index)
{
	// End:0x6F
	if((PlayerController(Controller) != none) && NextHealMessageTime < Level.TimeSeconds)
	{
		NextHealMessageTime = Level.TimeSeconds + float(1);
		PlayerController(Controller).ReceiveLocalizedMessage(Class'BallisticProV55.BallisticHealMessage', Index, Healer.PlayerReplicationInfo);
	}
	//return;	
}

function MessageHealBlock()
{
	// End:0x76
	if((PlayerController(Controller) != none) && NextHealMessageTime < Level.TimeSeconds)
	{
		NextHealMessageTime = Level.TimeSeconds + float(1);
		// End:0x76
		if(HealPreventer != none)
		{
			PlayerController(Controller).ReceiveLocalizedMessage(HealBlockMessage, 0, HealPreventer.PlayerReplicationInfo);
		}
	}
	//return;	
}

function MessageAttributedHealBlock(Pawn Healer)
{
	// End:0xC9
	if((PlayerController(Controller) != none) && NextHealMessageTime < Level.TimeSeconds)
	{
		NextHealMessageTime = Level.TimeSeconds + float(1);
		PlayerController(Controller).ReceiveLocalizedMessage(HealBlockMessage, 1, HealPreventer.PlayerReplicationInfo, Healer.PlayerReplicationInfo);
		// End:0xC9
		if(PlayerController(Healer.Controller) != none)
		{
			PlayerController(Healer.Controller).ReceiveLocalizedMessage(HealBlockMessage, 2, HealPreventer.PlayerReplicationInfo, PlayerReplicationInfo);
		}
	}
	//return;	
}

simulated event PhysicsVolumeChange(PhysicsVolume NewVolume)
{
	super.PhysicsVolumeChange(NewVolume);
	// End:0xA3
	if(NewVolume.bWaterVolume)
	{
		// End:0x3E
		if(BloodPool != none)
		{
			BloodPool.StopExpanding();
			BloodPool = none;
		}
		bBloodPoolSpawned = false;
		// End:0xA0
		if((Class'BallisticProV55.BWBloodControl'.default.bUseBloodPools && bBleedingCorpse) && WaterBlood == none)
		{
			WaterBlood = Spawn(BloodSet.default.WaterBloodClass, self,, Location, Rotation);
			WaterBlood.SetBase(self);
		}		
	}
	else
	{
		// End:0xC4
		if(WaterBlood != none)
		{
			WaterBlood.Kill();
			WaterBlood = none;
		}
	}
	//return;	
}

simulated event KImpact(Actor Other, Vector pos, Vector impactVel, Vector impactNorm)
{
	local float Speed, ImpDir, ImpScale;
	local BallisticDecal D;

	super.KImpact(Other, pos, impactVel, impactNorm);
	// End:0x40B
	if(Class'BallisticProV55.BWBloodControl'.default.bUseBloodImpacts && !Class'Engine.GameInfo'.static.UseLowGore())
	{
		// End:0x96
		if(!(((Level.TimeSeconds - LastImpactTime) > TimeBetweenImpacts) || (impactNorm Dot LastImpactNormal) < 0.7000000) || VSize(pos - LastImpactLocation) > float(100))
		{
			return;
		}
		Speed = VSize(impactVel);
		// End:0xB4
		if(Speed < LowImpactVelocity)
		{
			return;
		}
		LastImpactTime = Level.TimeSeconds;
		LastImpactNormal = impactNorm;
		LastImpactLocation = pos;
		// End:0x278
		if(Speed >= HighImpactVelocity)
		{
			// End:0x131
			if((Normal(Velocity) Dot impactNorm) > -0.5000000)
			{
				ImpScale = 0.1000000 + FMin((Speed - HighImpactVelocity) / float(800), 0.9000000);				
			}
			else
			{
				ImpDir = Normal(Velocity) Dot Normal(pos - Location);
				// End:0x179
				if(ImpDir > 0.5000000)
				{
					ImpScale = 0.6000000 + (ImpDir * 0.4000000);					
				}
				else
				{
					ImpScale = 0.4000000 + (ImpDir * 0.4000000);
				}
				ImpScale *= (0.5000000 + FMin((Speed - HighImpactVelocity) / float(600), 1.0000000));
			}
			// End:0x1CD
			if(ImpScale < 0.1000000)
			{
				return;
			}
			Class<BallisticDecal>(BloodSet.default.HighImpactDecal).default.bWaitForInit = true;
			D = BallisticDecal(Spawn(BloodSet.default.HighImpactDecal, self,, pos, Rotator(-impactNorm)));
			// End:0x256
			if(D != none)
			{
				D.SetDrawScale(D.DrawScale * ImpScale);
				D.InitDecal();
			}
			Class<BallisticDecal>(BloodSet.default.HighImpactDecal).default.bWaitForInit = false;			
		}
		else
		{
			// End:0x2BC
			if((Normal(Velocity) Dot impactNorm) > -0.5000000)
			{
				ImpScale = 0.1000000 + FMin((Speed - HighImpactVelocity) / float(800), 0.9000000);				
			}
			else
			{
				ImpDir = Normal(Velocity) Dot Normal(pos - Location);
				// End:0x304
				if(ImpDir > 0.5000000)
				{
					ImpScale = 0.6000000 + (ImpDir * 0.4000000);					
				}
				else
				{
					ImpScale = 0.4000000 + (ImpDir * 0.4000000);
				}
				ImpScale *= (0.5000000 + FMin((Speed - LowImpactVelocity) / float(500), 0.5000000));
			}
			// End:0x358
			if(ImpScale < 0.1000000)
			{
				return;
			}
			Class<BallisticDecal>(BloodSet.default.LowImpactDecal).default.bWaitForInit = true;
			D = BallisticDecal(Spawn(BloodSet.default.LowImpactDecal, self,, pos, Rotator(-impactNorm)));
			// End:0x3E1
			if(D != none)
			{
				D.SetDrawScale(D.DrawScale * ImpScale);
				D.InitDecal();
			}
			Class<BallisticDecal>(BloodSet.default.LowImpactDecal).default.bWaitForInit = false;
		}
		LastDragLocation = Location;
	}
	//return;	
}

simulated function TickGore(float dt)
{
	local Rotator R;
	local int i;

	// End:0x2F
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || Class'Engine.GameInfo'.static.NoBlood())
	{
		return;
	}
	i = 0;
	J0x36:

	// End:0xA6 [Loop If]
	if(i < LocalHits.Length)
	{
		DoHit(LocalHits[i].Bone, LocalHits[i].DamageType, LocalHits[i].hitRay, LocalHits[i].HitLoc, LocalHits[i].Damage);
		i++;
		// [Loop Continue]
		goto J0x36;
	}
	LocalHits.Length = 0;
	// End:0x1F5
	if(VSize(Location - LastDragLocation) > MinDragDistance)
	{
		// End:0xE7
		if(BloodPool != none)
		{
			BloodPool.StopExpanding();
			BloodPool = none;
		}
		bBloodPoolSpawned = false;
		// End:0x114
		if(LastDragLocation == vect(0.0000000, 0.0000000, 0.0000000))
		{
			LastDragLocation = Location;			
		}
		else
		{
			// End:0x1DC
			if(((((Class'BallisticProV55.BWBloodControl'.default.bUseBloodDrags && !Class'Engine.GameInfo'.static.UseLowGore()) && bBleedingCorpse) && !FastTrace(Location - vect(0.0000000, 0.0000000, 30.0000000), Location)) && int(Level.DetailMode) > int(0)) && BloodSet.default.DragDecal != none)
			{
				R = Rotator(Location - LastDragLocation);
				R.Pitch = -16384;
				Spawn(BloodSet.default.DragDecal, self,, Location, R);
			}
		}
		LastDragLocation = Location;
		CorpseRestTime = 0.0000000;		
	}
	else
	{
		// End:0x2AE
		if((((Class'BallisticProV55.BWBloodControl'.default.bUseBloodPools && bBleedingCorpse) && BloodSet.default.BloodPool != none) && !PhysicsVolume.bWaterVolume) && VSize(Velocity) < MaxPoolVelocity)
		{
			// End:0x2A2
			if(!bBloodPoolSpawned && CorpseRestTime > 0.5000000)
			{
				BloodPool = Spawn(BloodSet.default.BloodPool,,, Location, Rotator(vect(0.0000000, 0.0000000, -1.0000000)));
				bBloodPoolSpawned = true;
			}
			CorpseRestTime += dt;
		}
	}
	//return;	
}

simulated function byte GetHitBoneIndex(name BoneName)
{
	switch(BoneName)
	{
		// End:0x12
		case 'head':
			return 1;
		// End:0x1D
		case 'spine':
			return 2;
		// End:0x28
		case 'rshoulder':
			return 3;
		// End:0x33
		case 'lshoulder':
			return 4;
		// End:0x3E
		case 'righthand':
			return 5;
		// End:0x49
		case 'rhand':
			return 6;
		// End:0x54
		case 'rfarm':
			return 7;
		// End:0x5F
		case 'lhand':
			return 8;
		// End:0x6A
		case 'lfarm':
			return 9;
		// End:0x75
		case 'rfoot':
			return 10;
		// End:0x80
		case 'rthigh':
			return 11;
		// End:0x8B
		case 'lfoot':
			return 12;
		// End:0x96
		case 'lthigh':
			return 13;
		// End:0xFFFF
		default:
			return 0;
			break;
	}
	//return;	
}

simulated function name GetHitBoneName(byte BoneIndex)
{
	switch(BoneIndex)
	{
		// End:0x12
		case 1:
			return 'head';
		// End:0x1D
		case 2:
			return 'spine';
		// End:0x28
		case 3:
			return 'rshoulder';
		// End:0x33
		case 4:
			return 'lshoulder';
		// End:0x3E
		case 5:
			return 'righthand';
		// End:0x49
		case 6:
			return 'rhand';
		// End:0x54
		case 7:
			return 'rfarm';
		// End:0x5F
		case 8:
			return 'lhand';
		// End:0x6A
		case 9:
			return 'lfarm';
		// End:0x75
		case 10:
			return 'rfoot';
		// End:0x80
		case 11:
			return 'rthigh';
		// End:0x8B
		case 12:
			return 'lfoot';
		// End:0x96
		case 13:
			return 'lthigh';
		// End:0xFFFF
		default:
			return 'None';
			break;
	}
	//return;	
}

function CalcHitLoc(Vector HitLoc, Vector hitRay, out name BoneName, out float dist)
{
	BoneName = GetClosestBone(HitLoc, hitRay, dist);
	// End:0x6E
	if((BoneName == 'spine') && GetBoneCoords(BoneName).Origin.Z > (HitLoc.Z + (hitRay.Z * dist)))
	{
		BoneName = 'pelvis';
	}
	//return;	
}

function PlayHit(float Damage, Pawn instigatedBy, Vector HitLocation, Class<DamageType> DamageType, Vector Momentum)
{
	local Vector hitRay;
	local name HitBone;
	local float HitBoneDist;
	local HitInfo H;
	local int i;

	super(Pawn).PlayHit(Damage, instigatedBy, HitLocation, DamageType, Momentum);
	// End:0x2E
	if(Damage <= float(0))
	{
		return;
	}
	// End:0xDE
	if(DamageType.default.bExtraMomentumZ && HitLocation != Location)
	{
		// End:0x90
		if((instigatedBy != none) && DamageType.default.bInstantHit)
		{
			hitRay = Normal(HitLocation - instigatedBy.Location);			
		}
		else
		{
			hitRay = Normal(Momentum);
			// End:0xDB
			if(hitRay.Z < (0.6000000 * VSize(hitRay * vect(1.0000000, 1.0000000, 0.0000000))))
			{
				hitRay.Z *= 0.5000000;
			}
		}		
	}
	else
	{
		hitRay = Normal(Momentum);
	}
	// End:0x11F
	if(DamageType.default.bAlwaysSevers && DamageType.default.bSpecial)
	{
		HitBone = 'head';		
	}
	else
	{
		// End:0x14E
		if(DamageType.default.bLocationalHit)
		{
			CalcHitLoc(HitLocation, hitRay, HitBone, HitBoneDist);			
		}
		else
		{
			HitBone = 'None';
		}
	}
	// End:0x197
	if(Class<BallisticDamageType>(DamageType) != none)
	{
		Class<BallisticDamageType>(DamageType).static.ModifyHit(self, Damage, Momentum, HitLocation, hitRay, HitBone);
	}
	// End:0x1B1
	if(HitBone == 'righthand')
	{
		HitBone = 'rfarm';
	}
	// End:0x2DC
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x23C
		if(Health > 0)
		{
			H.Bone = HitBone;
			H.DamageType = DamageType;
			H.hitRay = hitRay;
			H.HitLoc = HitLocation;
			H.Damage = int(Damage);
			LocalHits[LocalHits.Length] = H;			
		}
		else
		{
			i = 0;
			J0x243:

			// End:0x2B3 [Loop If]
			if(i < LocalHits.Length)
			{
				DoHit(LocalHits[i].Bone, LocalHits[i].DamageType, LocalHits[i].hitRay, LocalHits[i].HitLoc, LocalHits[i].Damage);
				i++;
				// [Loop Continue]
				goto J0x243;
			}
			LocalHits.Length = 0;
			DoHit(HitBone, DamageType, hitRay, HitLocation, int(Damage));
		}
	}
	// End:0x331
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		SendHitInfo(HitBone, DamageType, HitLocation, hitRay, int(Damage));
	}
	// End:0x377
	if((DamageType.default.DamageOverlayMaterial != none) && Damage > float(0))
	{
		SetOverlayMaterial(DamageType.default.DamageOverlayMaterial, DamageType.default.DamageOverlayTime, false);
	}
	//return;	
}

function SendHitInfo(name BoneName, Class<DamageType> DamageType, Vector HitLoc, Vector hitRay, int Damage)
{
	local NetHitInfo PHI;

	Latest = byte(Class'BCoreProV55.BUtil'.static.Loop(int(Latest), 1, 7, 0));
	PHI.DamageType = DamageType;
	PHI.BoneNum = GetHitBoneIndex(BoneName);
	PHI.hitRay.X = byte(float(128) * (hitRay.X + float(1)));
	PHI.hitRay.Y = byte(float(128) * (hitRay.Y + float(1)));
	PHI.hitRay.Z = byte(float(128) * (hitRay.Z + float(1)));
	HitLoc -= Location;
	PHI.HitLoc.X = byte(int(128) + Clamp(int(HitLoc.X / float(2)), -128, 127));
	PHI.HitLoc.Y = byte(int(128) + Clamp(int(HitLoc.Y / float(2)), -128, 127));
	PHI.HitLoc.Z = byte(int(128) + Clamp(int(HitLoc.Z / float(2)), -128, 127));
	// End:0x17D
	if(Damage < 1)
	{
		PHI.Damage = 0;		
	}
	else
	{
		PHI.Damage = byte(Clamp(Damage / 2, 1, 255));
	}
	ClientHits[int(Latest)] = PHI;
	HitCounter++;
	//return;	
}

simulated function ReceiveHitInfo(NetHitInfo PHI)
{
	local Vector hitRay, HitLoc;

	hitRay.X = float(int(PHI.hitRay.X) / 128) - float(1);
	hitRay.Y = float(int(PHI.hitRay.Y) / 128) - float(1);
	hitRay.Z = float(int(PHI.hitRay.Z) / 128) - float(1);
	HitLoc.X = float(int(PHI.HitLoc.X) - 128) * float(2);
	HitLoc.Y = float(int(PHI.HitLoc.Y) - 128) * float(2);
	HitLoc.Z = float(int(PHI.HitLoc.Z) - 128) * float(2);
	HitLoc += Location;
	DoHit(GetHitBoneName(PHI.BoneNum), PHI.DamageType, hitRay, HitLoc, int(PHI.Damage) * 2);
	//return;	
}

simulated event Tick(float dt)
{
	local int Index, i, diff;

	super.Tick(dt);
	// End:0x48
	if(bPendingNegation)
	{
		// End:0x40
		if(int(Physics) == int(2))
		{
			Velocity.Z = FMin(Velocity.Z, 900.0000000);
		}
		bPendingNegation = false;
	}
	// End:0x13E
	if((int(Level.NetMode) == int(NM_Client)) && int(HitCounter) != int(OldHitCounter))
	{
		// End:0xA9
		if(int(HitCounter) < int(OldHitCounter))
		{
			diff = (int(HitCounter) + 256) - int(OldHitCounter);			
		}
		else
		{
			diff = int(HitCounter) - int(OldHitCounter);
		}
		diff = Min(8, diff);
		Index = LastIndex;
		i = 0;
		J0xE0:

		// End:0x128 [Loop If]
		if(i < diff)
		{
			Index = Class'BCoreProV55.BUtil'.static.Loop(Index, 1, 7, 0);
			ReceiveHitInfo(ClientHits[Index]);
			i++;
			// [Loop Continue]
			goto J0xE0;
		}
		LastIndex = Index;
		OldHitCounter = HitCounter;
	}
	TickGore(dt);
	// End:0x1C6
	if(bDeRes)
	{
		Index = Clamp(int(float(255) - (255.0000000 * (LifeSpan / DeResTime))), 0, 255);
		i = 0;
		J0x17F:

		// End:0x1C6 [Loop If]
		if(i < NewDeResFinalBlends.Length)
		{
			// End:0x1BC
			if(NewDeResFinalBlends[i] != none)
			{
				NewDeResFinalBlends[i].AlphaRef = byte(Index);
			}
			i++;
			// [Loop Continue]
			goto J0x17F;
		}
	}
	//return;	
}

simulated function bool BoneDismembered(name Bone)
{
	local int i;

	// End:0x0E
	if(SeveredBones.Length == 0)
	{
		return false;
	}
	// End:0x2A
	if(Bone == 'None')
	{
		return SeveredBones.Length > 0;		
	}
	else
	{
		i = 0;
		J0x31:

		// End:0x62 [Loop If]
		if(i < SeveredBones.Length)
		{
			// End:0x58
			if(SeveredBones[i] == Bone)
			{
				return true;
			}
			i++;
			// [Loop Continue]
			goto J0x31;
		}
	}
	return false;
	//return;	
}

simulated function Class<BallisticDamageType> UpgradeDamagetypeForGore(Class<DamageType> dt)
{
	// End:0x1B
	if(ClassIsChildOf(dt, Class'BCoreProV55.BallisticDamageType'))
	{
		return Class<BallisticDamageType>(dt);
	}
	return none;
	//return;	
}

simulated function Class<BloodManager> GetBloodManagerForGore(Class<DamageType> dt)
{
	// End:0x11
	if(dt == none)
	{
		return Class'BallisticProV55.BloodMan_General';
	}
	// End:0x52
	if(Class<BallisticDamageType>(dt) != none)
	{
		// End:0x4F
		if(Class<BallisticDamageType>(dt).static.GetBloodManager() != none)
		{
			return Class<BallisticDamageType>(dt).default.BloodManager;
		}		
	}
	else
	{
		// End:0x68
		if(ClassIsChildOf(dt, Class'XWeapons.DamTypeSuperShockBeam'))
		{
			return Class'BallisticProV55.BloodMan_FireExploded';
		}
		// End:0x158
		if((((((((((((dt.default.bAlwaysGibs || ClassIsChildOf(dt, Class'Engine.Gibbed')) || ClassIsChildOf(dt, Class'XWeapons.DamTypeRocket')) || ClassIsChildOf(dt, Class'XWeapons.DamTypeFlakShell')) || ClassIsChildOf(dt, Class'XWeapons.DamTypeRedeemer')) || ClassIsChildOf(dt, Class'Onslaught.DamTypeTankShell')) || ClassIsChildOf(dt, Class'Onslaught.DamTypeAttackCraftMissle')) || ClassIsChildOf(dt, Class'XWeapons.DamTypeShockCombo')) || ClassIsChildOf(dt, Class'OnslaughtFull.DamTypeMASCannon')) || ClassIsChildOf(dt, Class'XWeapons.DamTypeTeleFrag')) || ClassIsChildOf(dt, Class'XWeapons.DamTypeIonBlast')) || ClassIsChildOf(dt, Class'Engine.DamTypeTelefragged')) || ClassIsChildOf(dt, Class'UT2k4AssaultFull.DamTypeIonCannonBlast'))
		{
			return Class'BallisticProV55.BloodMan_Exploded';
		}
	}
	// End:0x170
	if(dt.default.bBulletHit)
	{
		return Class'BallisticProV55.BloodMan_Bullet';
	}
	// End:0x1A3
	if(dt.default.bThrowRagdoll)
	{
		// End:0x19D
		if(dt.default.bFlaming)
		{
			return Class'BallisticProV55.BloodMan_FireExploded';			
		}
		else
		{
			return Class'BallisticProV55.BloodMan_Exploded';
		}
	}
	// End:0x1BB
	if(dt.default.bFlaming)
	{
		return Class'BallisticProV55.BloodMan_Fire';
	}
	return Class'BallisticProV55.BloodMan_General';
	//return;	
}

simulated function AttachEffect(Class<xEmitter> EmitterClass, name BoneName, Vector Location, Rotator Rotation)
{
	local Actor A;
	local int i;
	local bool bRot;

	// End:0x1C
	if(bSkeletized || BoneName == 'None')
	{
		return;
	}
	// End:0x3E
	if(BoneName == 'pelvis')
	{
		BoneName = 'spine';
		bRot = true;
	}
	i = 0;
	J0x45:

	// End:0xB5 [Loop If]
	if(i < Attached.Length)
	{
		// End:0x69
		if(Attached[i] == none)
		{
			// [Explicit Continue]
			goto J0xAB;
		}
		// End:0x8A
		if(Attached[i].AttachmentBone != BoneName)
		{
			// [Explicit Continue]
			goto J0xAB;
		}
		// End:0xAB
		if(ClassIsChildOf(EmitterClass, Attached[i].Class))
		{
			return;
		}
		J0xAB:

		i++;
		// [Loop Continue]
		goto J0x45;
	}
	A = Spawn(EmitterClass,,, Location, Rotation);
	// End:0xF4
	if(bRot)
	{
		A.SetRelativeRotation(rot(32768, 0, 0));
	}
	// End:0x14A
	if(!AttachToBone(A, BoneName))
	{
		Log((("Couldn't attach " $ string(EmitterClass)) $ " to ") $ string(BoneName), 'Error');
		A.Destroy();
		return;
	}
	i = 0;
	J0x151:

	// End:0x183 [Loop If]
	if(i < Attached.Length)
	{
		// End:0x179
		if(Attached[i] == A)
		{
			// [Explicit Break]
			goto J0x183;
		}
		i++;
		// [Loop Continue]
		goto J0x151;
	}
	J0x183:

	A.SetRelativeRotation(Rotation);
	//return;	
}

simulated function DoHit(name Bone, Class<DamageType> DamageType, Vector hitRay, Vector HitLocation, int Damage)
{
	local bool bCanDoPelvis, bCanDoSpine, bHitBoneSevered, bSpineGone, bPelvisGone;

	local Class<BallisticDamageType> BDT;
	local int i;

	// End:0x0D
	if(DamageType == none)
	{
		return;
	}
	BDT = Class<BallisticDamageType>(DamageType);
	// End:0x39
	if(BDT == none)
	{
		BDT = UpgradeDamagetypeForGore(DamageType);
	}
	// End:0x68
	if(BDT != none)
	{
		BDT.static.LocalHitEffects(self, Bone, HitLocation, hitRay, Damage);
	}
	// End:0x53A
	if(Health <= 0)
	{
		// End:0x53A
		if(!DamageType.default.bNeverSevers && !Class'Engine.GameInfo'.static.UseLowGore())
		{
			bFlaming = DamageType.default.bFlaming;
			// End:0x4E6
			if((Bone == 'None') || (BDT != none) && BDT.default.bMultiSever)
			{
				// End:0x133
				if(!BoneDismembered('pelvis'))
				{
					bCanDoPelvis = CanDismemberBone('pelvis', DamageType, Damage, HitLocation, hitRay, false);
					// End:0x130
					if(BoneDismembered('spine'))
					{
						bSpineGone = true;
					}					
				}
				else
				{
					bPelvisGone = true;
				}
				// End:0x166
				if(bCanDoPelvis)
				{
					DoDismember('pelvis', DamageType, hitRay, HitLocation, Damage);					
				}
				else
				{
					// End:0x1BD
					if(!bSpineGone && CanDismemberBone('spine', DamageType, Damage, HitLocation, hitRay, false))
					{
						bCanDoSpine = true;
						DoDismember('spine', DamageType, hitRay, HitLocation, Damage);
					}
				}
				// End:0x379
				if(!bCanDoSpine && !bSpineGone)
				{
					// End:0x229
					if(!BoneDismembered('head') && CanDismemberBone('head', DamageType, Damage, HitLocation, hitRay, false))
					{
						DoDismember('head', DamageType, hitRay, HitLocation, Damage);
					}
					// End:0x2D2
					if(!BoneDismembered('lshoulder'))
					{
						// End:0x27E
						if(CanDismemberBone('lshoulder', DamageType, Damage, HitLocation, hitRay, false))
						{
							DoDismember('lshoulder', DamageType, hitRay, HitLocation, Damage);							
						}
						else
						{
							// End:0x2D2
							if(!BoneDismembered('lrarm') && CanDismemberBone('lrarm', DamageType, Damage, HitLocation, hitRay, false))
							{
								DoDismember('lrarm', DamageType, hitRay, HitLocation, Damage);
							}
						}
					}
					// End:0x379
					if(!BoneDismembered('rshoulder'))
					{
						// End:0x327
						if(CanDismemberBone('rshoulder', DamageType, Damage, HitLocation, hitRay, false))
						{
							DoDismember('rshoulder', DamageType, hitRay, HitLocation, Damage);							
						}
						else
						{
							// End:0x379
							if(!BoneDismembered('rfarm'))
							{
								// End:0x379
								if(CanDismemberBone('rfarm', DamageType, Damage, HitLocation, hitRay, false))
								{
									DoDismember('rfarm', DamageType, hitRay, HitLocation, Damage);
								}
							}
						}
					}
				}
				// End:0x4E3
				if(!bCanDoPelvis && !bPelvisGone)
				{
					// End:0x43A
					if(!BoneDismembered('lthigh'))
					{
						// End:0x3E6
						if(CanDismemberBone('lthigh', DamageType, Damage, HitLocation, hitRay, false))
						{
							DoDismember('lthigh', DamageType, hitRay, HitLocation, Damage);							
						}
						else
						{
							// End:0x43A
							if(!BoneDismembered('lfoot') && CanDismemberBone('lfoot', DamageType, Damage, HitLocation, hitRay, false))
							{
								DoDismember('lfoot', DamageType, hitRay, HitLocation, Damage);
							}
						}
					}
					// End:0x4E3
					if(!BoneDismembered('rthigh'))
					{
						// End:0x48F
						if(CanDismemberBone('rthigh', DamageType, Damage, HitLocation, hitRay, false))
						{
							DoDismember('rthigh', DamageType, hitRay, HitLocation, Damage);							
						}
						else
						{
							// End:0x4E3
							if(!BoneDismembered('rfoot') && CanDismemberBone('rfoot', DamageType, Damage, HitLocation, hitRay, false))
							{
								DoDismember('rfoot', DamageType, hitRay, HitLocation, Damage);
							}
						}
					}
				}				
			}
			else
			{
				// End:0x53A
				if(!BoneDismembered(Bone) && CanDismemberBone(Bone, DamageType, Damage, HitLocation, hitRay, true))
				{
					DoDismember(Bone, DamageType, hitRay, HitLocation, Damage);
				}
			}
		}
	}
	// End:0x6E3
	if(DamageType.default.bCausesBlood)
	{
		// End:0x56E
		if(Bone == 'None')
		{
			bHitBoneSevered = SeveredBones.Length > 0;			
		}
		else
		{
			i = 0;
			J0x575:

			// End:0x5AF [Loop If]
			if(i < SeveredBones.Length)
			{
				// End:0x5A5
				if(SeveredBones[i] == Bone)
				{
					bHitBoneSevered = true;
					// [Explicit Break]
					goto J0x5AF;
				}
				i++;
				// [Loop Continue]
				goto J0x575;
			}
		}
		J0x5AF:

		// End:0x657
		if((!bHitBoneSevered || BDT == none) || !BDT.default.bSeverPreventsBlood)
		{
			HitLocation += ((hitRay * CollisionRadius) * 0.5000000);
			// End:0x657
			if((BDT == none) || !BDT.static.DoBloodHit(self, Bone, HitLocation, hitRay, Damage))
			{
				static.GetBloodManagerForGore(DamageType).DoBloodHit(self, Bone, HitLocation, hitRay, Damage);
			}
		}
		// End:0x6E3
		if((Health <= 0) && !Class'Engine.GameInfo'.static.NoBlood())
		{
			bBleedingCorpse = true;
			// End:0x6E3
			if((PhysicsVolume.bWaterVolume && WaterBlood == none) && Class'BallisticProV55.BWBloodControl'.default.bUseBloodPools)
			{
				WaterBlood = Spawn(BloodSet.default.WaterBloodClass, self,, Location, Rotation);
				WaterBlood.SetBase(self);
			}
		}
	}
	//return;	
}

simulated function bool CanDismemberBone(name Bone, Class<DamageType> DamageType, int Damage, Vector HitLoc, Vector hitRay, bool bDirectHit)
{
	local byte DTCanSever;

	// End:0x43
	if((Level.Game != none) && Level.Game.PreventSever(self, Bone, Damage, DamageType))
	{
		return false;
	}
	// End:0x97
	if((Class<BallisticDamageType>(DamageType) != none) && Class<BallisticDamageType>(DamageType).static.OverrideCanSever(self, Bone, Damage, HitLoc, hitRay, bDirectHit, DTCanSever))
	{
		return int(DTCanSever) != 0;
	}
	// End:0x2EA
	if(bDirectHit)
	{
		// End:0x131
		if((Bone == 'pelvis') || Bone == 'spine')
		{
			return ((Class<BallisticDamageType>(DamageType) == none) || !Class<BallisticDamageType>(DamageType).default.bOnlySeverLimbs) && DamageType.default.bAlwaysSevers || ((float(Damage) * DamageType.default.GibModifier) + float(Health)) > float(40 + Rand(40));			
		}
		else
		{
			// End:0x145
			if(DamageType.default.bAlwaysSevers)
			{
				return true;
			}
		}
		switch(Bone)
		{
			// End:0x188
			case 'head':
				return ((float(Damage) * DamageType.default.GibModifier) + (float(Health) * 0.5000000)) > float(10 + Rand(20));
			// End:0x190
			case 'lshoulder':
			// End:0x1CC
			case 'rshoulder':
				return ((float(Damage) * DamageType.default.GibModifier) - (float(Health) * 0.5000000)) > float(30 + Rand(30));
			// End:0x1D4
			case 'lfarm':
			// End:0x210
			case 'rfarm':
				return ((float(Damage) * DamageType.default.GibModifier) - (float(Health) * 0.5000000)) > float(15 + Rand(20));
			// End:0x218
			case 'righthand':
			// End:0x220
			case 'lhand':
			// End:0x25C
			case 'rhand':
				return ((float(Damage) * DamageType.default.GibModifier) - (float(Health) * 0.5000000)) > float(10 + Rand(10));
			// End:0x264
			case 'lthigh':
			// End:0x2A0
			case 'rthigh':
				return ((float(Damage) * DamageType.default.GibModifier) - (float(Health) * 0.5000000)) > float(20 + Rand(20));
			// End:0x2A8
			case 'lfoot':
			// End:0x2E4
			case 'rfoot':
				return ((float(Damage) * DamageType.default.GibModifier) - (float(Health) * 0.5000000)) > float(10 + Rand(15));
			// End:0xFFFF
			default:
				// End:0x845
				break;
				break;
		}
	}
	switch(Bone)
	{
		// End:0x362
		case 'pelvis':
			return ((Class<BallisticDamageType>(DamageType) == none) || !Class<BallisticDamageType>(DamageType).default.bOnlySeverLimbs) && float(200 + Rand(150)) < ((float(Damage) * DamageType.default.GibModifier) * ((hitRay.Z * float(2)) + float(2)));
		// End:0x3CE
		case 'spine':
			return ((Class<BallisticDamageType>(DamageType) == none) || !Class<BallisticDamageType>(DamageType).default.bOnlySeverLimbs) && float(200 + Rand(150)) < ((float(Damage) * DamageType.default.GibModifier) * (-hitRay.Z + float(1)));
		// End:0x40D
		case 'head':
			return float(50 + Rand(50)) < ((float(Damage) * DamageType.default.GibModifier) * (-hitRay.Z + float(1)));
		// End:0x46C
		case 'lshoulder':
			return float(60 + Rand(60)) < (((float(Damage) * DamageType.default.GibModifier) * (hitRay << Rotation.Y + float(1))) * ((-hitRay.Z * 0.5000000) + float(1)));
		// End:0x4CD
		case 'rshoulder':
			return float(60 + Rand(60)) < (((float(Damage) * DamageType.default.GibModifier) * (-hitRay << Rotation.Y + float(1))) * ((-hitRay.Z * 0.5000000) + float(1)));
		// End:0x52C
		case 'lfarm':
			return float(30 + Rand(30)) < (((float(Damage) * DamageType.default.GibModifier) * (hitRay << Rotation.Y + float(1))) * ((-hitRay.Z * 0.5000000) + float(1)));
		// End:0x58D
		case 'rfarm':
			return float(30 + Rand(30)) < (((float(Damage) * DamageType.default.GibModifier) * (-hitRay << Rotation.Y + float(1))) * ((-hitRay.Z * 0.5000000) + float(1)));
		// End:0x5EC
		case 'lhand':
			return float(20 + Rand(20)) < (((float(Damage) * DamageType.default.GibModifier) * (hitRay << Rotation.Y + float(1))) * ((-hitRay.Z * 0.3500000) + float(1)));
		// End:0x64D
		case 'righthand':
			return float(20 + Rand(20)) < (((float(Damage) * DamageType.default.GibModifier) * (-hitRay << Rotation.Y + float(1))) * ((-hitRay.Z * 0.3500000) + float(1)));
		// End:0x6AE
		case 'rhand':
			return float(20 + Rand(20)) < (((float(Damage) * DamageType.default.GibModifier) * (-hitRay << Rotation.Y + float(1))) * ((-hitRay.Z * 0.3500000) + float(1)));
		// End:0x712
		case 'lthigh':
			return float(60 + Rand(60)) < (((float(Damage) * DamageType.default.GibModifier) * ((hitRay << Rotation.Y * 0.5000000) + float(1))) * ((hitRay.Z * 0.7500000) + float(1)));
		// End:0x778
		case 'rthigh':
			return float(60 + Rand(60)) < (((float(Damage) * DamageType.default.GibModifier) * ((-hitRay << Rotation.Y * 0.5000000) + float(1))) * ((hitRay.Z * 0.7500000) + float(1)));
		// End:0x7DC
		case 'lfoot':
			return float(20 + Rand(20)) < (((float(Damage) * DamageType.default.GibModifier) * ((hitRay << Rotation.Y * 0.5000000) + float(1))) * ((hitRay.Z * 0.7500000) + float(1)));
		// End:0x842
		case 'rfoot':
			return float(20 + Rand(20)) < (((float(Damage) * DamageType.default.GibModifier) * ((-hitRay << Rotation.Y * 0.5000000) + float(1))) * ((hitRay.Z * 0.7500000) + float(1)));
		// End:0xFFFF
		default:
			return false;
			break;
	}
	//return;	
}

simulated function DoDismember(name Bone, Class<DamageType> DamageType, Vector hitRay, Vector HitLocation, int Damage)
{
	switch(Bone)
	{
		// End:0x77
		case 'None':
			DismemberSub('lthigh', hitRay, DamageType, Damage);
			DismemberSub('rthigh', hitRay, DamageType, Damage);
			DismemberSub('lfoot', hitRay, DamageType, Damage);
			DismemberSub('rfoot', hitRay, DamageType, Damage);
		// End:0x11B
		case 'spine':
			DismemberSub('spine', hitRay, DamageType, Damage);
			DismemberSub('lshoulder', hitRay, DamageType, Damage);
			DismemberSub('rshoulder', hitRay, DamageType, Damage);
			DismemberSub('lfarm', hitRay, DamageType, Damage);
			DismemberSub('rfarm', hitRay, DamageType, Damage);
			DismemberSub('righthand', hitRay, DamageType, Damage);
		// End:0x140
		case 'head':
			DismemberSub('head', hitRay, DamageType, Damage);
			// End:0x30E
			break;
		// End:0x162
		case 'lshoulder':
			DismemberSub('lshoulder', hitRay, DamageType, Damage);
		// End:0x187
		case 'lfarm':
			DismemberSub('lfarm', hitRay, DamageType, Damage);
			// End:0x30E
			break;
		// End:0x1A9
		case 'rshoulder':
			DismemberSub('rshoulder', hitRay, DamageType, Damage);
		// End:0x1CB
		case 'rfarm':
			DismemberSub('rfarm', hitRay, DamageType, Damage);
		// End:0x1F0
		case 'righthand':
			DismemberSub('righthand', hitRay, DamageType, Damage);
			// End:0x30E
			break;
		// End:0x212
		case 'lthigh':
			DismemberSub('lthigh', hitRay, DamageType, Damage);
		// End:0x237
		case 'lfoot':
			DismemberSub('lfoot', hitRay, DamageType, Damage);
			// End:0x30E
			break;
		// End:0x259
		case 'rthigh':
			DismemberSub('rthigh', hitRay, DamageType, Damage);
		// End:0x27E
		case 'rfoot':
			DismemberSub('rfoot', hitRay, DamageType, Damage);
			// End:0x30E
			break;
		// End:0x30B
		case 'pelvis':
			DismemberSub('pelvis', hitRay, DamageType, Damage);
			DismemberSub('lthigh', hitRay, DamageType, Damage);
			DismemberSub('rthigh', hitRay, DamageType, Damage);
			DismemberSub('lfoot', hitRay, DamageType, Damage);
			DismemberSub('rfoot', hitRay, DamageType, Damage);
			// End:0x30E
			break;
		// End:0xFFFF
		default:
			break;
	}
	DismemberRoot(Bone, hitRay, DamageType, Damage);
	//return;	
}

simulated function DismemberSub(name Bone, Vector hitRay, Class<DamageType> DamageType, int Damage)
{
	// End:0x10
	if(BoneDismembered(Bone))
	{
		return;
	}
	SeveredBones[SeveredBones.Length] = Bone;
	// End:0x5D
	if((Class<BallisticDamageType>(DamageType) != none) && Class<BallisticDamageType>(DamageType).static.DoSeverEffect(self, Bone, hitRay, Damage))
	{
		return;
	}
	static.GetBloodManagerForGore(DamageType).DoSeverEffects(self, Bone, hitRay, float(Damage), DamageType.default.GibPerterbation);
	//return;	
}

simulated function DismemberRoot(name Bone, Vector hitRay, Class<DamageType> DamageType, int Damage)
{
	FreeSubs(Bone);
	// End:0x46
	if((Class<BallisticDamageType>(DamageType) != none) && Class<BallisticDamageType>(DamageType).static.DoSeverStump(self, Bone, hitRay, Damage))
	{
		return;
	}
	static.GetBloodManagerForGore(DamageType).DoSeverStump(self, Bone, hitRay, float(Damage));
	//return;	
}

simulated function bool BoneIsSubOf(name SubBone, name RootBone)
{
	// End:0x55
	if(((((RootBone == 'head') || RootBone == 'lfoot') || RootBone == 'rfoot') || RootBone == 'lfarm') || RootBone == 'rfarm')
	{
		return false;
	}
	// End:0x77
	if((SubBone == 'spine') || SubBone == 'pelvis')
	{
		return false;
	}
	switch(RootBone)
	{
		// End:0xDE
		case 'spine':
			// End:0xDB
			if(((((SubBone == 'lshoulder') || SubBone == 'rshoulder') || SubBone == 'lfarm') || SubBone == 'rfarm') || SubBone == 'head')
			{
				return true;
			}
			// End:0x1BC
			break;
		// End:0xFA
		case 'lshoulder':
			// End:0xF7
			if(SubBone == 'lfarm')
			{
				return true;
			}
			// End:0x1BC
			break;
		// End:0x116
		case 'rshoulder':
			// End:0x113
			if(SubBone == 'rfarm')
			{
				return true;
			}
			// End:0x1BC
			break;
		// End:0x132
		case 'rshoulder':
			// End:0x12F
			if(SubBone == 'rfarm')
			{
				return true;
			}
			// End:0x1BC
			break;
		// End:0x181
		case 'pelvis':
			// End:0x17E
			if((((SubBone == 'lthigh') || SubBone == 'rthigh') || SubBone == 'lfoot') || SubBone == 'rfoot')
			{
				return true;
			}
			// End:0x1BC
			break;
		// End:0x19D
		case 'lthigh':
			// End:0x19A
			if(SubBone == 'lfoot')
			{
				return true;
			}
			// End:0x1BC
			break;
		// End:0x1B9
		case 'rthigh':
			// End:0x1B6
			if(SubBone == 'rfoot')
			{
				return true;
			}
			// End:0x1BC
			break;
		// End:0xFFFF
		default:
			break;
	}
	return false;
	//return;	
}

simulated function FreeSubs(name RootBone)
{
	local int i;

	// End:0x0E
	if(SeveredBones.Length == 0)
	{
		return;
	}
	i = 0;
	J0x15:

	// End:0xC0 [Loop If]
	if(i < Attached.Length)
	{
		// End:0xB6
		if(BoneIsSubOf(Attached[i].AttachmentBone, RootBone))
		{
			// End:0x7A
			if(Emitter(Attached[i]) != none)
			{
				Emitter(Attached[i]).Kill();
				// [Explicit Continue]
				goto J0xB6;
			}
			// End:0xA5
			if(BallisticStump(Attached[i]) != none)
			{
				Attached[i].Destroy();
				// [Explicit Continue]
				goto J0xB6;
			}
			DetachFromBone(Attached[i]);
		}
		J0xB6:

		i++;
		// [Loop Continue]
		goto J0x15;
	}
	//return;	
}

simulated function SpawnGibs(Rotator HitRotation, float ChunkPerterbation)
{
	local Vector hitRay;

	bGibbed = true;
	PlayDyingSound();
	hitRay = Vector(HitRotation);
	static.GetBloodManagerForGore(none).DoSeverEffects(self, 'lthigh', hitRay, ChunkPerterbation, 100.0000000);
	static.GetBloodManagerForGore(none).DoSeverEffects(self, 'rthigh', hitRay, ChunkPerterbation, 100.0000000);
	static.GetBloodManagerForGore(none).DoSeverEffects(self, 'lfoot', hitRay, ChunkPerterbation, 100.0000000);
	static.GetBloodManagerForGore(none).DoSeverEffects(self, 'rfoot', hitRay, ChunkPerterbation, 100.0000000);
	static.GetBloodManagerForGore(none).DoSeverEffects(self, 'spine', hitRay, ChunkPerterbation, 100.0000000);
	static.GetBloodManagerForGore(none).DoSeverEffects(self, 'pelvis', hitRay, ChunkPerterbation, 100.0000000);
	static.GetBloodManagerForGore(none).DoSeverEffects(self, 'lshoulder', hitRay, ChunkPerterbation, 100.0000000);
	static.GetBloodManagerForGore(none).DoSeverEffects(self, 'rshoulder', hitRay, ChunkPerterbation, 100.0000000);
	static.GetBloodManagerForGore(none).DoSeverEffects(self, 'lfarm', hitRay, ChunkPerterbation, 100.0000000);
	static.GetBloodManagerForGore(none).DoSeverEffects(self, 'rfarm', hitRay, ChunkPerterbation, 100.0000000);
	static.GetBloodManagerForGore(none).DoSeverEffects(self, 'righthand', hitRay, ChunkPerterbation, 100.0000000);
	static.GetBloodManagerForGore(none).DoSeverEffects(self, 'head', hitRay, ChunkPerterbation, 100.0000000);
	//return;	
}

function PlayDyingSound()
{
	// End:0x0B
	if(bSkeletized)
	{
		return;
	}
	// End:0x3C
	if(bGibbed)
	{
		PlaySound(GibGroupClass.static.GibSound(), 2, 3.5000000 * TransientSoundVolume, true, 500.0000000);
		return;
	}
	// End:0x6F
	if(HeadVolume.bWaterVolume)
	{
		PlaySound(GetSound(6), 2, 2.5000000 * TransientSoundVolume, true, 500.0000000);
		return;
	}
	// End:0x9A
	if((Class<BallisticDamageType>(HitDamageType) != none) && Class<BallisticDamageType>(HitDamageType).default.bHeaddie)
	{
		return;
	}
	PlaySound(SoundGroupClass.static.GetDeathSound(), 2, 2.5000000 * TransientSoundVolume, true, 500.0000000);
	//return;	
}

simulated function Setup(PlayerRecord Rec, optional bool bLoadNow)
{
	// End:0x1D
	if(Rec.DefaultName == "July")
	{
		AmbientGlow = 64;
	}
	Species = Rec.Species;
	RagdollOverride = Rec.Ragdoll;
	// End:0x8E
	if(!Species.static.Setup(self, Rec))
	{
		Rec = Class'XGame.xUtil'.static.FindPlayerRecord(GetDefaultCharacter());
		// End:0x8E
		if(!Species.static.Setup(self, Rec))
		{
			return;
		}
	}
	ResetPhysicsBasedAnim();
	BloodSet = Class'BallisticProV55.BWBloodSetHunter'.static.GetBloodSetFor(self);
	//return;	
}

function PlayTeleportEffect(bool bOut, bool bSound)
{
	// End:0x5D
	if(!bSpawnIn && (Level.TimeSeconds - SpawnTime) < DeathMatch(Level.Game).SpawnProtectionTime)
	{
		bSpawnIn = true;
		Spawn(Class'BallisticProV55.BWPlayerSpawnFX',,, Location);		
	}
	else
	{
		// End:0x74
		if(bOut)
		{
			DoTranslocateOut(Location);			
		}
		else
		{
			// End:0xDE
			if(((PlayerReplicationInfo == none) || PlayerReplicationInfo.Team == none) || PlayerReplicationInfo.Team.TeamIndex == 0)
			{
				Spawn(TransEffects[0], self,, Location + (CollisionHeight * vect(0.0000000, 0.0000000, 0.7500000)));				
			}
			else
			{
				Spawn(TransEffects[1], self,, Location + (CollisionHeight * vect(0.0000000, 0.0000000, 0.7500000)));
			}
		}
	}
	super(Actor).PlayTeleportEffect(bOut, bSound);
	//return;	
}

simulated function StartDeRes()
{
	local KarmaParamsSkel skelParams;
	local int i, j, k;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x35
	if(BloodPool != none)
	{
		BloodPool.StopExpanding();
	}
	i = Stumps.Length - 1;
	J0x44:

	// End:0x7C [Loop If]
	if(i >= 0)
	{
		// End:0x72
		if(Stumps[i] != none)
		{
			Stumps[i].Destroy();
		}
		i--;
		// [Loop Continue]
		goto J0x44;
	}
	Spawn(Class'BallisticProV55.BWDeresFX', self,, Location);
	NewDeResDecal = Spawn(Class'BallisticProV55.BWDeResDecal', self,, Location, rot(-16384, 0, 0));
	PlaySound(NewDeResSound, 3, 0.8000000,, 40.0000000);
	i = 0;
	J0xC9:

	// End:0x393 [Loop If]
	if(i < Skins.Length)
	{
		// End:0xED
		if(Skins[i] == none)
		{
			// [Explicit Continue]
			goto J0x389;
		}
		// End:0x12A
		if(bTransparencyInitialized && Skins[i] != OriginalSkins[i])
		{
			Skins[i] = OriginalSkins[i];
		}
		j = NewDeResShaders.Length;
		k = NewDeResFinalBlends.Length;
		NewDeResShaders[j] = Shader(Level.ObjectPool.AllocateObject(Class'BallisticProV55.BWDeResShader'));
		// End:0x389
		if(NewDeResShaders[j] != none)
		{
			// End:0x1E9
			if((FinalBlend(Skins[i]) != none) && FinalBlend(Skins[i]).Material != none)
			{
				NewDeResShaders[j].Diffuse = FinalBlend(Skins[i]).Material;				
			}
			else
			{
				NewDeResShaders[j].Diffuse = Skins[i];
			}
			// End:0x289
			if((Shader(NewDeResShaders[j].Diffuse) != none) && Shader(NewDeResShaders[j].Diffuse).Diffuse != none)
			{
				NewDeResShaders[j].Diffuse = Shader(NewDeResShaders[j].Diffuse).Diffuse;
			}
			NewDeResFinalBlends[k] = FinalBlend(Level.ObjectPool.AllocateObject(Class'Engine.FinalBlend'));
			// End:0x389
			if(NewDeResFinalBlends[k] != none)
			{
				NewDeResFinalBlends[k].Material = NewDeResShaders[j];
				NewDeResFinalBlends[k].FrameBufferBlending = 0;
				NewDeResFinalBlends[k].TwoSided = false;
				NewDeResFinalBlends[k].ZWrite = true;
				NewDeResFinalBlends[k].ZTest = true;
				NewDeResFinalBlends[k].AlphaTest = true;
				NewDeResFinalBlends[k].AlphaRef = 0;
				Skins[i] = NewDeResFinalBlends[k];
			}
		}
		J0x389:

		i++;
		// [Loop Continue]
		goto J0xC9;
	}
	// End:0x3D6
	if(int(Physics) == int(14))
	{
		KSetActorGravScale(DeResGravScale);
		KSetBlockKarma(false);
		skelParams = KarmaParamsSkel(KParams);
		skelParams.bKDoConvulsions = false;
	}
	SoundRadius = 40.0000000;
	SetCollision(false, false, false);
	Projectors.Remove(0, Projectors.Length);
	bAcceptsProjectors = false;
	// End:0x418
	if(PlayerShadow != none)
	{
		PlayerShadow.bShadowActive = false;
	}
	RemoveFlamingEffects();
	SetOverlayMaterial(none, 0.0000000, true);
	bDeRes = true;
	//return;	
}

simulated function ListGoreEffect(Actor NewEffect)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x48 [Loop If]
	if(i < GoreFX.Length)
	{
		// End:0x3E
		if(GoreFX[i] == none)
		{
			GoreFX.Remove(i, 1);
			i--;
			// [Explicit Continue]
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	GoreFX[GoreFX.Length] = NewEffect;
	//return;	
}

simulated event Destroyed()
{
	local int i;

	// End:0x41
	if(bTransparencyInitialized)
	{
		i = 0;
		J0x10:

		// End:0x41 [Loop If]
		if(i < Skins.Length)
		{
			Skins[i] = OriginalSkins[i];
			++i;
			// [Loop Continue]
			goto J0x10;
		}
	}
	i = 0;
	J0x48:

	// End:0xA3 [Loop If]
	if(i < NewDeResFinalBlends.Length)
	{
		// End:0x99
		if(NewDeResFinalBlends[i] != none)
		{
			Level.ObjectPool.FreeObject(NewDeResFinalBlends[i]);
			NewDeResFinalBlends[i] = none;
		}
		i++;
		// [Loop Continue]
		goto J0x48;
	}
	NewDeResFinalBlends.Length = 0;
	i = 0;
	J0xB2:

	// End:0x10D [Loop If]
	if(i < NewDeResShaders.Length)
	{
		// End:0x103
		if(NewDeResShaders[i] != none)
		{
			Level.ObjectPool.FreeObject(NewDeResShaders[i]);
			NewDeResShaders[i] = none;
		}
		i++;
		// [Loop Continue]
		goto J0xB2;
	}
	NewDeResShaders.Length = 0;
	// End:0x12F
	if(WaterBlood != none)
	{
		WaterBlood.Kill();
	}
	// End:0x149
	if(BloodPool != none)
	{
		BloodPool.StopExpanding();
	}
	i = Stumps.Length - 1;
	J0x158:

	// End:0x19C [Loop If]
	if(i >= 0)
	{
		// End:0x186
		if(Stumps[i] != none)
		{
			Stumps[i].Destroy();
		}
		Stumps.Length = i;
		i--;
		// [Loop Continue]
		goto J0x158;
	}
	i = 0;
	J0x1A3:

	// End:0x216 [Loop If]
	if(i < GoreFX.Length)
	{
		// End:0x1C7
		if(GoreFX[i] == none)
		{
			// [Explicit Continue]
			goto J0x20C;
		}
		// End:0x1FA
		if(Emitter(GoreFX[i]) != none)
		{
			Emitter(GoreFX[i]).Kill();
			// [Explicit Continue]
			goto J0x20C;
		}
		GoreFX[i].Destroy();
		J0x20C:

		i++;
		// [Loop Continue]
		goto J0x1A3;
	}
	// End:0x238
	if(RwColMgr != none)
	{
		RwColMgr.UnregisterPawn(self);
		RwColMgr = none;
	}
	super.Destroyed();
	//return;	
}

simulated function HideBone(name BoneName)
{
	local int BoneScaleSlot;

	// End:0x19
	if(BoneName == 'lthigh')
	{
		BoneScaleSlot = 0;		
	}
	else
	{
		// End:0x32
		if(BoneName == 'rthigh')
		{
			BoneScaleSlot = 1;			
		}
		else
		{
			// End:0x4C
			if(BoneName == 'rfarm')
			{
				BoneScaleSlot = 2;				
			}
			else
			{
				// End:0x66
				if(BoneName == 'lfarm')
				{
					BoneScaleSlot = 3;					
				}
				else
				{
					// End:0x80
					if(BoneName == 'head')
					{
						BoneScaleSlot = 4;						
					}
					else
					{
						// End:0x9A
						if(BoneName == 'spine')
						{
							BoneScaleSlot = 5;							
						}
						else
						{
							// End:0xB4
							if(BoneName == 'righthand')
							{
								BoneScaleSlot = 6;								
							}
							else
							{
								// End:0xC8
								if(BoneName == 'rhand')
								{
									return;									
								}
								else
								{
									// End:0xDC
									if(BoneName == 'lhand')
									{
										return;										
									}
									else
									{
										// End:0xF6
										if(BoneName == 'rfoot')
										{
											BoneScaleSlot = 8;											
										}
										else
										{
											// End:0x110
											if(BoneName == 'lfoot')
											{
												BoneScaleSlot = 9;												
											}
											else
											{
												// End:0x12A
												if(BoneName == 'rshoulder')
												{
													BoneScaleSlot = 10;													
												}
												else
												{
													// End:0x144
													if(BoneName == 'lshoulder')
													{
														BoneScaleSlot = 11;														
													}
													else
													{
														// End:0x179
														if(BoneName == 'pelvis')
														{
															SetBoneScale(12, 0.0100000, 'Bip01');
															SetBoneScale(5, 100.0000000, 'spine');
															return;
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	SetBoneScale(BoneScaleSlot, 0.0100000, BoneName);
	//return;	
}

simulated function SetBaseEyeheight()
{
	// End:0x19
	if(!bIsCrouched)
	{
		BaseEyeHeight = default.BaseEyeHeight;		
	}
	else
	{
		BaseEyeHeight = float(CrouchEyeHeight);
	}
	EyeHeight = BaseEyeHeight;
	//return;	
}

event StartCrouch(float HeightAdjust)
{
	EyeHeight += HeightAdjust;
	OldZ -= HeightAdjust;
	BaseEyeHeight = float(CrouchEyeHeight);
	StartSlide();
	//return;	
}

event EndCrouch(float HeightAdjust)
{
	EyeHeight -= HeightAdjust;
	OldZ += HeightAdjust;
	BaseEyeHeight = default.BaseEyeHeight;
	CrouchEndTime = Level.TimeSeconds;
	//return;	
}

simulated function Vector EyePosition()
{
	// End:0x84
	if((((((int(Role) == int(ROLE_Authority)) && bIsCrouched) && !IsLocallyControlled()) && PlayerController(Controller) != none) && !PlayerController(Controller).bBehindView) && BaseEyeHeight == default.BaseEyeHeight)
	{
		return (float(CrouchEyeHeight) * vect(0.0000000, 0.0000000, 1.0000000)) + WalkBob;
	}
	return super(Pawn).EyePosition();
	//return;	
}

function DoDoubleJump(bool bUpdating)
{
	PlayDoubleJump();
	// End:0x87
	if(!bIsCrouched && !bWantsToCrouch)
	{
		// End:0x43
		if(!IsLocallyControlled() || AIController(Controller) != none)
		{
			MultiJumpRemaining -= 1;
		}
		Velocity.Z = JumpZ + float(MultiJumpBoost);
		SetPhysics(2);
		// End:0x87
		if(!bUpdating)
		{
			PlayOwnedSound(GetSound(9), 2, GruntVolume,, GruntRadius);
		}
	}
	// End:0xAB
	if(int(Role) == int(ROLE_Authority))
	{
		Inventory.OwnerEvent('Jumped');
	}
	//return;	
}

singular event BaseChange()
{
	local float decorMass;

	// End:0x0B
	if(bInterpolating)
	{
		return;
	}
	// End:0x3F
	if((Mover(OldBase) != none) && Base == none)
	{
		LastMoverLeaveTime = Level.TimeSeconds;		
	}
	else
	{
		LastMoverLeaveTime = 0.0000000;
	}
	// End:0x6F
	if((Base == none) && int(Physics) == int(0))
	{
		SetPhysics(2);		
	}
	else
	{
		// End:0x10A
		if((Pawn(Base) != none) && Base != DrivenVehicle)
		{
			// End:0x107
			if(!Pawn(Base).bCanBeBaseForPawns)
			{
				Base.TakeDamage(int((float(int(float(1) - (Velocity.Z / float(100)))) * Mass) / Base.Mass), self, Location, 0.5000000 * Velocity, Class'Engine.Crushed');
				JumpOffPawn();
			}			
		}
		else
		{
			// End:0x123
			if(Sandbag(Base) != none)
			{
				JumpOffPawn();				
			}
			else
			{
				// End:0x1BD
				if((Decoration(Base) != none) && Velocity.Z < float(-400))
				{
					decorMass = FMax(Decoration(Base).Mass, 1.0000000);
					Base.TakeDamage(int((((float(-2) * Mass) / decorMass) * Velocity.Z) / float(400)), self, Location, 0.5000000 * Velocity, Class'Engine.Crushed');
				}
			}
		}
	}
	OldBase = Base;
	//return;	
}

final function bool CanMantle()
{
	local Vector X, Y, Z, TraceStart, TraceEnd, HitLocation,
		HitNormal;

	local Actor HitActor;
	local Rotator TurnRot;

	// End:0x1F
	if((MultiJumpRemaining == 0) || int(Physics) != int(2))
	{
		return false;
	}
	TurnRot.Yaw = Rotation.Yaw;
	GetAxes(TurnRot, X, Y, Z);
	TraceEnd = X;
	TraceStart = (Location - (CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000))) + (TraceEnd * CollisionRadius);
	TraceEnd = TraceStart + (TraceEnd * 32.0000000);
	HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart, false, vect(1.0000000, 1.0000000, 1.0000000));
	return ((HitActor != none) && HitActor.bWorldGeometry) || Mover(HitActor) != none;
	//return;	
}

function bool CanDoubleJump()
{
	// End:0x2B
	if((BallisticWeapon(Weapon) != none) && BallisticWeapon(Weapon).bScopeView)
	{
		return false;
	}
	// End:0x44
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsTactical())
	{
		return CanMantle();
	}
	// End:0x51
	if(!bCanDoubleJump)
	{
		return false;
	}
	return super.CanDoubleJump();
	//return;	
}

function bool CanMultiJump()
{
	// End:0x0D
	if(!bCanDoubleJump)
	{
		return false;
	}
	return super.CanMultiJump();
	//return;	
}

function bool Dodge(Actor.EDoubleClickDir DoubleClickMove)
{
	// End:0x0D
	if(!bCanDodge)
	{
		return false;
	}
	// End:0x2E
	if((Level.TimeSeconds - LastDodgeTime) < DodgeInterval)
	{
		return false;
	}
	// End:0x76
	if(super.Dodge(DoubleClickMove))
	{
		LastDodgeTime = Level.TimeSeconds;
		// End:0x74
		if(int(Role) == int(ROLE_Authority))
		{
			Inventory.OwnerEvent('Dodged');
		}
		return true;
	}
	return false;
	//return;	
}

function bool DoJump(bool bUpdating)
{
	local float OldJumpZ;

	OldJumpZ = JumpZ;
	// End:0x36
	if(BallisticWeapon(Weapon) != none)
	{
		JumpZ = BallisticWeapon(Weapon).GetModifiedJumpZ(self);
	}
	// End:0xB5
	if(((!bUpdating && CanDoubleJump()) && Abs(Velocity.Z) < float(100)) && IsLocallyControlled())
	{
		// End:0x94
		if(PlayerController(Controller) != none)
		{
			PlayerController(Controller).bDoubleJump = true;
		}
		DoDoubleJump(bUpdating);
		MultiJumpRemaining -= 1;
		JumpZ = OldJumpZ;
		return true;
	}
	// End:0x2A9
	if(((int(Physics) == int(1)) || int(Physics) == int(11)) || int(Physics) == int(9))
	{
		// End:0x17A
		if(int(Role) == int(ROLE_Authority))
		{
			// End:0x150
			if((Level.Game != none) && Level.Game.GameDifficulty > float(2))
			{
				MakeNoise(0.1000000 * Level.Game.GameDifficulty);
			}
			// End:0x17A
			if(bCountJumps && Inventory != none)
			{
				Inventory.OwnerEvent('Jumped');
			}
		}
		// End:0x19F
		if(int(Physics) == int(9))
		{
			Velocity = JumpZ * Floor;			
		}
		else
		{
			// End:0x1C2
			if(int(Physics) == int(11))
			{
				Velocity.Z = 0.0000000;				
			}
			else
			{
				// End:0x1DE
				if(bIsWalking)
				{
					Velocity.Z = default.JumpZ;					
				}
				else
				{
					Velocity.Z = JumpZ;
				}
			}
		}
		// End:0x224
		if((Base != none) && !Base.bWorldGeometry)
		{
			Velocity += Base.Velocity;
		}
		// End:0x271
		if((bIsCrouched || bWantsToCrouch) || (Level.TimeSeconds - CrouchEndTime) < JumpCrouchTime)
		{
			Velocity.Z -= (JumpZ * JumpCrouchPenalty);
		}
		SetPhysics(2);
		// End:0x29C
		if(!bUpdating)
		{
			PlayOwnedSound(GetSound(3), 2, GruntVolume,, GruntRadius);
		}
		JumpZ = OldJumpZ;
		return true;
	}
	JumpZ = OldJumpZ;
	return false;
	//return;	
}

function bool AddShieldStrength(int ShieldAmount)
{
	local BallisticArmor BA;

	BA = BallisticArmor(FindInventoryType(Class'BallisticProV55.BallisticArmor'));
	// End:0x41
	if(BA == none)
	{
		BA = Spawn(Class'BallisticProV55.BallisticArmor', self);
		BA.GiveTo(self, none);
	}
	return super.AddShieldStrength(ShieldAmount);
	//return;	
}

function bool PerformDodge(Actor.EDoubleClickDir DoubleClickMove, Vector Dir, Vector Cross)
{
	local float VelocityZ;
	local name Anim;
	local float DodgeGroundSpeed;

	// End:0xEC
	if(int(Physics) == int(2))
	{
		// End:0x30
		if(int(DoubleClickMove) == int(3))
		{
			Anim = WallDodgeAnims[0];			
		}
		else
		{
			// End:0x50
			if(int(DoubleClickMove) == int(4))
			{
				Anim = WallDodgeAnims[1];				
			}
			else
			{
				// End:0x71
				if(int(DoubleClickMove) == int(1))
				{
					Anim = WallDodgeAnims[2];					
				}
				else
				{
					// End:0x8F
					if(int(DoubleClickMove) == int(2))
					{
						Anim = WallDodgeAnims[3];
					}
				}
			}
		}
		// End:0xAC
		if(PlayAnim(Anim, 1.0000000, 0.1000000))
		{
			bWaitForAnim = true;
		}
		AnimAction = Anim;
		// End:0xEC
		if(Velocity.Z < (-DodgeSpeedZ * 0.5000000))
		{
			Velocity.Z += (DodgeSpeedZ * 0.5000000);
		}
	}
	VelocityZ = Velocity.Z;
	DodgeGroundSpeed = GroundSpeed;
	// End:0x15B
	if((Class'BCoreProV55.BallisticReplicationInfo'.static.IsTactical() || Class'BCoreProV55.BallisticReplicationInfo'.static.IsRealism()) && Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerGroundSpeed < GroundSpeed)
	{
		DodgeGroundSpeed = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerGroundSpeed;
	}
	Velocity = ((DodgeSpeedFactor * DodgeGroundSpeed) * Dir) + ((Velocity Dot Cross) * Cross);
	// End:0x1E2
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsTactical() || Class'BCoreProV55.BallisticReplicationInfo'.static.IsRealism())
	{
		// End:0x1E2
		if(VSize(Velocity) > (DodgeGroundSpeed * DodgeSpeedFactor))
		{
			Velocity = (Normal(Velocity) * DodgeGroundSpeed) * DodgeSpeedFactor;
		}
	}
	// End:0x1F4
	if(!bCanDodgeDoubleJump)
	{
		MultiJumpRemaining = 0;
	}
	// End:0x22F
	if(bCanBoostDodge || Velocity.Z < float(-100))
	{
		Velocity.Z = VelocityZ + DodgeSpeedZ;		
	}
	else
	{
		Velocity.Z = DodgeSpeedZ;
	}
	CurrentDir = DoubleClickMove;
	SetPhysics(2);
	PlayOwnedSound(GetSound(8), 2, GruntVolume,, GruntRadius);
	return true;
	//return;	
}

simulated function ClientSetMovable(bool bNew)
{
	bMovable = bNew;
	//return;	
}

function TakeDrowningDamage()
{
	// End:0x11
	if(Controller != none)
	{
		super(UnrealPawn).TakeDrowningDamage();
	}
	//return;	
}

simulated function ClientSetCrouchAbility(bool bCrouch)
{
	bCanCrouch = bCrouch;
	//return;	
}

simulated function ChangedWeapon()
{
	super(Pawn).ChangedWeapon();
	// End:0x5F
	if((Weapon != none) && int(Role) < int(ROLE_Authority))
	{
		// End:0x3E
		if(bBerserk)
		{
			Weapon.StartBerserk();			
		}
		else
		{
			// End:0x5F
			if(Weapon.bBerserk)
			{
				Weapon.StopBerserk();
			}
		}
	}
	//return;	
}

function IncrementBWKill(PlayerReplicationInfo PRI, string DamageIdent)
{
	local BallisticPlayerReplicationInfo BWPRI;

	// End:0x35
	if(((PRI == none) || DamageIdent == "Unknown") || DamageIdent == "Melee")
	{
		return;
	}
	BWPRI = Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(PRI);
	// End:0x5C
	if(BWPRI == none)
	{
		return;
	}
	switch(Caps(DamageIdent))
	{
		// End:0x8B
		case "GRENADE":
			BWPRI.HitStats[0].Kills++;
			// End:0x1E8
			break;
		// End:0xB0
		case "STREAK":
			BWPRI.HitStats[1].Kills++;
			// End:0x1E8
			break;
		// End:0xD6
		case "PISTOL":
			BWPRI.HitStats[2].Kills++;
			// End:0x1E8
			break;
		// End:0xF9
		case "SMG":
			BWPRI.HitStats[3].Kills++;
			// End:0x1E8
			break;
		// End:0x120
		case "ASSAULT":
			BWPRI.HitStats[4].Kills++;
			// End:0x1E8
			break;
		// End:0x146
		case "ENERGY":
			BWPRI.HitStats[5].Kills++;
			// End:0x1E8
			break;
		// End:0x170
		case "MACHINEGUN":
			BWPRI.HitStats[6].Kills++;
			// End:0x1E8
			break;
		// End:0x197
		case "SHOTGUN":
			BWPRI.HitStats[7].Kills++;
			// End:0x1E8
			break;
		// End:0x1BF
		case "ORDNANCE":
			BWPRI.HitStats[8].Kills++;
			// End:0x1E8
			break;
		// End:0x1E5
		case "SNIPER":
			BWPRI.HitStats[9].Kills++;
			// End:0x1E8
			break;
		// End:0xFFFF
		default:
			break;
	}
	//return;	
}

function IncrementBWDeathsWith()
{
	local BallisticPlayerReplicationInfo BWPRI;
	local byte WepGroup;

	// End:0x1A
	if((PlayerReplicationInfo == none) || Weapon == none)
	{
		return;
	}
	BWPRI = Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(PlayerReplicationInfo);
	// End:0x41
	if(BWPRI == none)
	{
		return;
	}
	// End:0x63
	if(int(Weapon.InventoryGroup) == 10)
	{
		WepGroup = 1;		
	}
	else
	{
		WepGroup = Weapon.InventoryGroup;
	}
	BWPRI.HitStats[int(WepGroup)].DeathsWith++;
	//return;	
}

function SetBWHitStats(PlayerReplicationInfo PRI, string damageIndent, int Damage)
{
	local BallisticPlayerReplicationInfo BWPRI;

	// End:0x2F
	if(((PRI == none) || damageIndent == "Unknown") || Damage <= 0)
	{
		return;
	}
	BWPRI = Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(PRI);
	// End:0x56
	if(BWPRI == none)
	{
		return;
	}
	switch(Caps(damageIndent))
	{
		// End:0xA1
		case "GRENADE":
			BWPRI.HitStats[0].Hit++;
			BWPRI.HitStats[0].Damage += Damage;
			// End:0x324
			break;
		// End:0xE2
		case "STREAK":
			BWPRI.HitStats[1].Hit++;
			BWPRI.HitStats[1].Damage += Damage;
			// End:0x324
			break;
		// End:0x125
		case "PISTOL":
			BWPRI.HitStats[2].Hit++;
			BWPRI.HitStats[2].Damage += Damage;
			// End:0x324
			break;
		// End:0x165
		case "SMG":
			BWPRI.HitStats[3].Hit++;
			BWPRI.HitStats[3].Damage += Damage;
			// End:0x324
			break;
		// End:0x1A9
		case "ASSAULT":
			BWPRI.HitStats[4].Hit++;
			BWPRI.HitStats[4].Damage += Damage;
			// End:0x324
			break;
		// End:0x1EC
		case "ENERGY":
			BWPRI.HitStats[5].Hit++;
			BWPRI.HitStats[5].Damage += Damage;
			// End:0x324
			break;
		// End:0x233
		case "MACHINEGUN":
			BWPRI.HitStats[6].Hit++;
			BWPRI.HitStats[6].Damage += Damage;
			// End:0x324
			break;
		// End:0x277
		case "SHOTGUN":
			BWPRI.HitStats[7].Hit++;
			BWPRI.HitStats[7].Damage += Damage;
			// End:0x324
			break;
		// End:0x2BC
		case "ORDNANCE":
			BWPRI.HitStats[8].Hit++;
			BWPRI.HitStats[8].Damage += Damage;
			// End:0x324
			break;
		// End:0x2FF
		case "SNIPER":
			BWPRI.HitStats[9].Hit++;
			BWPRI.HitStats[9].Damage += Damage;
			// End:0x324
			break;
		// End:0x321
		case "MELEE":
			BWPRI.SGDamage += Damage;
			// End:0x324
			break;
		// End:0xFFFF
		default:
			break;
	}
	//return;	
}

function RemoveCoverAnchor(Actor A)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x38 [Loop If]
	if((i < CoverAnchors.Length) && CoverAnchors[i] != A)
	{
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0x54
	if(i < CoverAnchors.Length)
	{
		CoverAnchors.Remove(i, 1);
	}
	//return;	
}

function int ShieldAbsorb(int Dam)
{
	local float Absorption;

	// End:0x13
	if(ShieldStrength == float(0))
	{
		return Dam;
	}
	Absorption = FMin(ShieldStrength, float(Dam));
	// End:0x45
	if(Absorption == float(Dam))
	{
		ShieldViewFlash(int(Absorption));
	}
	Dam -= int(Absorption);
	ShieldStrength -= Absorption;
	return Dam;
	//return;	
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	local int actualDamage;
	local Controller Killer;
	local Vector HitLocationMatchZ;

	// End:0x21
	if((Controller != none) && Controller.bGodMode)
	{
		return;
	}
	// End:0x8E
	if(DamageType == none)
	{
		// End:0x83
		if(instigatedBy != none)
		{
			Warn((("No damagetype for damage by " $ string(instigatedBy)) $ " with weapon ") $ string(instigatedBy.Weapon));
		}
		DamageType = Class'Engine.DamageType';
	}
	// End:0xD7
	if(int(Role) < int(ROLE_Authority))
	{
		Log((((string(self) $ " client damage type ") $ string(DamageType)) $ " by ") $ string(instigatedBy));
		return;
	}
	// End:0xE4
	if(Health <= 0)
	{
		return;
	}
	// End:0x140
	if((Mover(Base) != none) || Level.TimeSeconds < (LastMoverLeaveTime + MoverLeaveGrace))
	{
		// End:0x140
		if((Class<BallisticDamageType>(DamageType) != none) && Class<BallisticDamageType>(DamageType).default.bIgnoredOnLifts)
		{
			return;
		}
	}
	// End:0x196
	if((((instigatedBy == none) || instigatedBy.Controller == none) && DamageType.default.bDelayedDamage) && DelayedDamageInstigatorController != none)
	{
		instigatedBy = DelayedDamageInstigatorController.Pawn;
	}
	// End:0x1B9
	if((int(Physics) == int(0)) && DrivenVehicle == none)
	{
		SetMovementPhysics();
	}
	// End:0x285
	if(true)
	{
		// End:0x206
		if((int(Physics) == int(1)) && DamageType.default.bExtraMomentumZ)
		{
			Momentum.Z = FMax(Momentum.Z, 0.4000000 * VSize(Momentum));
		}
		// End:0x21D
		if(instigatedBy == self)
		{
			Momentum *= 0.6000000;
		}
		Momentum = Momentum / Mass;
		// End:0x255
		if(Momentum.Z > float(950))
		{
			Momentum.Z = 950.0000000;
		}
		// End:0x285
		if(Momentum.Z < float(-300))
		{
			Momentum *= (float(-300) / Momentum.Z);
		}
	}
	// End:0x2B8
	if(Weapon != none)
	{
		Weapon.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	}
	// End:0x2EB
	if(DrivenVehicle != none)
	{
		DrivenVehicle.AdjustDriverDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	}
	// End:0x315
	if((instigatedBy != none) && instigatedBy.HasUDamage())
	{
		Damage *= float(2);
	}
	actualDamage = Level.Game.ReduceDamage(Damage, self, instigatedBy, HitLocation, Momentum, DamageType);
	// End:0x3EB
	if(((instigatedBy != none) && instigatedBy != self) && Class<BallisticDamageType>(DamageType) != none)
	{
		// End:0x3EB
		if(!Level.Game.bTeamGame || (instigatedBy.GetTeamNum() != (GetTeamNum())) && (GetTeamNum()) != 255)
		{
			SetBWHitStats(instigatedBy.PlayerReplicationInfo, Class<BallisticDamageType>(DamageType).default.DamageIdent, actualDamage);
		}
	}
	// End:0x502
	if((CoverAnchors.Length > 0) && DamageType.default.bArmorStops)
	{
		J0x40B:

		// End:0x431 [Loop If]
		if((CoverAnchors[0] == none) && CoverAnchors.Length > 0)
		{
			CoverAnchors.Remove(0, 1);
			// [Loop Continue]
			goto J0x40B;
		}
		HitLocationMatchZ = HitLocation;
		HitLocationMatchZ.Z = Location.Z;
		// End:0x502
		if((DamageType.default.bInstantHit && (Normal(instigatedBy.Location - Location) Dot Vector(Rotation)) > float(0)) || (Normal(HitLocationMatchZ - Location) Dot Vector(Rotation)) > float(0))
		{
			CoverAnchors[0].TakeDamage(int(float(actualDamage) * 0.8000000), instigatedBy, CoverAnchors[0].Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
			actualDamage *= 0.2000000;
		}
	}
	// End:0x532
	if(DamageType.default.bArmorStops && actualDamage > 0)
	{
		actualDamage = ShieldAbsorb(actualDamage);
	}
	Health -= actualDamage;
	// End:0x5A0
	if((Damage > 0) && ((instigatedBy == none) || instigatedBy.GetTeamNum() != (GetTeamNum())) || (GetTeamNum()) == 255)
	{
		LastDamagedTime = Level.TimeSeconds;
		LastDamagedType = DamageType;
	}
	// End:0x5C2
	if(HitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		HitLocation = Location;
	}
	PlayHit(float(actualDamage), instigatedBy, HitLocation, DamageType, Momentum);
	// End:0x75B
	if(Health <= 0)
	{
		// End:0x635
		if((DamageType.default.bCausedByWorld && (instigatedBy == none) || instigatedBy == self) && LastHitBy != none)
		{
			Killer = LastHitBy;			
		}
		else
		{
			// End:0x655
			if(instigatedBy != none)
			{
				Killer = instigatedBy.GetKillerController();
			}
		}
		// End:0x67F
		if((Killer == none) && DamageType.default.bDelayedDamage)
		{
			Killer = DelayedDamageInstigatorController;
		}
		// End:0x693
		if(bPhysicsAnimUpdate)
		{
			TearOffMomentum = Momentum;
		}
		// End:0x72C
		if(((instigatedBy != none) && instigatedBy != self) && Class<BallisticDamageType>(DamageType) != none)
		{
			// End:0x72C
			if(!Level.Game.bTeamGame || (instigatedBy.GetTeamNum() != (GetTeamNum())) && (GetTeamNum()) != 255)
			{
				IncrementBWKill(instigatedBy.PlayerReplicationInfo, Class<BallisticDamageType>(DamageType).default.DamageIdent);
			}
		}
		// End:0x73D
		if(Weapon != none)
		{
			IncrementBWDeathsWith();
		}
		CancelTransparency();
		Died(Killer, DamageType, HitLocation);		
	}
	else
	{
		// End:0x7B4
		if((Class<BallisticDamageType>(DamageType) != none) && Class<BallisticDamageType>(DamageType).default.bNegatesMomentum)
		{
			HitLocationMatchZ = Velocity;
			HitLocationMatchZ.Z = 0.0000000;
			AddVelocity(Momentum - HitLocationMatchZ);			
		}
		else
		{
			AddVelocity(Momentum);
		}
		// End:0x7DA
		if(VSize(Momentum) > float(50000))
		{
			bPendingNegation = true;
		}
		// End:0x80D
		if(Controller != none)
		{
			Controller.NotifyTakeHit(instigatedBy, HitLocation, actualDamage, DamageType, Momentum);
		}
		// End:0x839
		if((instigatedBy != none) && instigatedBy != self)
		{
			LastHitBy = instigatedBy.Controller;
		}
		DamageViewFlash(actualDamage);
	}
	MakeNoise(1.0000000);
	//return;	
}

function ShieldViewFlash(int Damage)
{
	local int RND;

	// End:0x33
	if(((BallisticPlayer(Controller) == none) || Damage == 0) || Controller.bGodMode)
	{
		return;
	}
	RND = int(FClamp(float(Damage / 2), 25.0000000, 50.0000000));
	BallisticPlayer(Controller).ClientDmgFlash(-0.0170000 * float(RND), ShieldFlashV);
	//return;	
}

function DamageViewFlash(int Damage)
{
	local int RND;

	// End:0x33
	if(((BallisticPlayer(Controller) == none) || Damage == 0) || Controller.bGodMode)
	{
		return;
	}
	RND = int(FClamp(float(Damage / 2), 25.0000000, 50.0000000));
	BallisticPlayer(Controller).ClientDmgFlash(-0.0170000 * float(RND), BloodFlashV);
	//return;	
}

simulated exec function TestFlash(int Damage)
{
	DamageViewFlash(Damage);
	//return;	
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	local string t;
	local name Anim;
	local float frame, Rate;

	super(Actor).DisplayDebug(Canvas, YL, YPos);
	Canvas.SetDrawColor(byte(255), byte(255), byte(255));
	GetAnimParams(1, Anim, frame, Rate);
	Canvas.DrawText((((("Channel 1:" @ string(Anim)) @ "Frame:") @ string(frame)) @ "Rate:") @ string(Rate));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	Canvas.DrawText((("Animation Action " $ string(AnimAction)) $ " Health ") $ string(Health));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	Canvas.DrawText((((("Anchor " $ string(Anchor)) $ " Serpentine Dist ") $ string(SerpentineDist)) $ " Time ") $ string(SerpentineTime));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	Canvas.DrawText("FireState:" @ string(GetEnum(Enum'XGame.xPawn.EFireAnimState', int(FireState))));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	t = (((((((((("Floor " $ string(Floor)) $ " DesiredSpeed ") $ string(DesiredSpeed)) $ " Crouched ") $ string(bIsCrouched)) $ " Try to uncrouch ") $ string(UncrouchTime)) $ " GroundSpeed ") $ string(GroundSpeed)) $ " CrouchedPct ") $ string(CrouchedPct);
	// End:0x2B6
	if((OnLadder != none) || int(Physics) == int(11))
	{
		t = (t $ " on ladder ") $ string(OnLadder);
	}
	Canvas.DrawText(t);
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	Canvas.DrawText((((((((((((((("EyeHeight " $ string(EyeHeight)) $ " BaseEyeHeight ") $ string(BaseEyeHeight)) $ " Physics Anim ") $ string(bPhysicsAnimUpdate)) $ " Sliding ") $ string(bIsSliding)) $ " SlideVelocity ") $ string(VSize(SlideVelocity))) $ " SlideStartSpeed ") $ string(SlideStartSpeed)) $ " SlideStopSpeed ") $ string(SlideStopSpeed)) $ " MaxSlideSpeed ") $ string(MaxSlideSpeed));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	// End:0x45B
	if(Controller == none)
	{
		Canvas.SetDrawColor(byte(255), 0, 0);
		Canvas.DrawText("NO CONTROLLER");
		YPos += YL;
		Canvas.SetPos(4.0000000, YPos);		
	}
	else
	{
		// End:0x4DB
		if(Controller.PlayerReplicationInfo != none)
		{
			Canvas.SetDrawColor(byte(255), 0, 0);
			Canvas.DrawText("Owned by " $ Controller.PlayerReplicationInfo.PlayerName);
			YPos += YL;
			Canvas.SetPos(4.0000000, YPos);
		}
		Controller.DisplayDebug(Canvas, YL, YPos);
	}
	// End:0x55A
	if(Weapon == none)
	{
		Canvas.SetDrawColor(0, byte(255), 0);
		Canvas.DrawText("NO WEAPON");
		YPos += YL;
		Canvas.SetPos(4.0000000, YPos);		
	}
	else
	{
		Weapon.DisplayDebug(Canvas, YL, YPos);
	}
	//return;	
}

simulated event ModifyVelocity(float DeltaTime, Vector OldVelocity)
{
	local Vector X, Y, Z, Dir;
	local float FSpeed, Control, NewSpeed, Drop, XSpeed, YSpeed,
		CosAngle, MaxStrafeSpeed, MaxBackSpeed;

	// End:0x0D
	if(Controller == none)
	{
		return;
	}
	// End:0x28
	if(int(Physics) == int(2))
	{
		LastFallingVelocity = Velocity;
	}
	// End:0x332
	if(int(Physics) == int(1))
	{
		// End:0x15F
		if((StrafeScale < float(1)) || BackpedalScale < float(1))
		{
			GetAxes(GetViewRotation(), X, Y, Z);
			MaxStrafeSpeed = GroundSpeed * StrafeScale;
			MaxBackSpeed = GroundSpeed * BackpedalScale;
			XSpeed = Abs(X Dot Velocity);
			// End:0x102
			if((XSpeed > MaxBackSpeed) && (X Dot Velocity) < float(0))
			{
				Dir = Normal(Velocity);
				CosAngle = Abs(X Dot Dir);
				Velocity = Dir * (MaxBackSpeed / CosAngle);
			}
			YSpeed = Abs(Y Dot Velocity);
			// End:0x15F
			if(YSpeed > MaxStrafeSpeed)
			{
				Dir = Normal(Velocity);
				CosAngle = Abs(Y Dot Dir);
				Velocity = Dir * (MaxStrafeSpeed / CosAngle);
			}
		}
		// End:0x21B
		if(Class'BCoreProV55.BallisticReplicationInfo'.default.bPlayerDeceleration)
		{
			FSpeed = VSize(Velocity);
			// End:0x21B
			if(((VSize(Acceleration) < 1.0000000) && FSpeed > 1.0000000) && !bIsSliding)
			{
				Control = FMin(100.0000000, FSpeed);
				Drop = (Control * DeltaTime) * MyFriction;
				NewSpeed = FSpeed + Drop;
				NewSpeed = FClamp(NewSpeed, 0.0000000, OldMovementSpeed * 0.9700000) / FSpeed;
				Velocity *= NewSpeed;
			}
		}
		// End:0x23D
		if(bIsSliding)
		{
			TickSlopeCalculation(DeltaTime);
			HandleSliding(DeltaTime);			
		}
		else
		{
			SlideStartSpeed = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerGroundSpeed * 1.1000000;
			SlideStopSpeed = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerGroundSpeed * default.CrouchedPct;
			MaxSlideSpeed = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerGroundSpeed * 2.5000000;
			// End:0x2C0
			if(Level.TimeSeconds > (LastLandTime + 0.1000000))
			{
				LastFallingVelocity = vect(0.0000000, 0.0000000, 0.0000000);
			}
			// End:0x301
			if(bIsCrouched)
			{
				// End:0x2FE
				if(int(Physics) != int(2))
				{
					CrouchedPct = FClamp(CrouchedPct - (DeltaTime * 5.0000000), default.CrouchedPct, 1.0000000);
				}				
			}
			else
			{
				CrouchedPct = FClamp(CrouchedPct + (DeltaTime * float(100)), default.CrouchedPct, 1.0000000);
			}
		}
		OldMovementSpeed = VSize(Velocity);
	}
	// End:0x39F
	if(bIsSliding && ((((PlayerController(Controller) != none) && !bIsCrouched) || VSize(SlideVelocity) < SlideStopSpeed) || (VSize(OldVelocity) + 100.0000000) < SlideStopSpeed) || int(Physics) != int(1))
	{
		EndSlide();
	}
	//return;	
}

simulated function StartSlide()
{
	local name Anim;
	local Vector X, Y, Z;
	local float DirDot, EffSlidePower, EffImpulse, EffBackSpeedScale;

	// End:0x0D
	if(!bAllowCrouchSliding)
	{
		return;
	}
	// End:0x22A
	if((((!bIsSliding && int(Controller.bDuck) > 0) && ((VSize(LastFallingVelocity) >= SlideStartSpeed) || VSize(Velocity) >= SlideStartSpeed) || SlopeAngleDeg < 0.0000000) && int(Physics) == int(1)) && (Level.TimeSeconds - LastSlideEndTime) > SlideCooldownTime)
	{
		Sprinter.Stamina = FMax(0.0000000, Sprinter.Stamina - Sprinter.JumpDrain);
		Sprinter.DelayRecharge();
		Sprinter.StopSprint();
		SlideVelocity = Velocity + (LastFallingVelocity * 0.5000000);
		GetAxes(GetViewRotation(), X, Y, Z);
		DirDot = Normal(SlideVelocity) Dot X;
		EffSlidePower = SlidePower;
		EffBackSpeedScale = 1.0000000;
		// End:0x178
		if(DirDot < BackSlideDotThreshold)
		{
			EffSlidePower *= BackSlidePowerScale;
			EffBackSpeedScale = BackMaxSlideSpeedScale;
			MaxSlideSpeed *= EffBackSpeedScale;
		}
		EffImpulse = FMax(EffSlidePower * 0.2500000, EffSlidePower * (Sprinter.Stamina / Sprinter.MaxStamina));
		SlideVelocity += (Normal(SlideVelocity) * EffImpulse);
		LastFallingVelocity = vect(0.0000000, 0.0000000, 0.0000000);
		bIsSliding = true;
		Sprinter.UpdateSpeed(2.5000000);
		Anim = SlideStartAnims[Get4WayDirection()];
		// End:0x21F
		if(PlayAnim(Anim, 2.0000000))
		{
			bWaitForAnim = true;
		}
		AnimAction = Anim;
	}
	//return;	
}

simulated function LoopSlideAnim()
{
	local name LoopName, CurAnim;
	local float frame, Rate;

	// End:0x0D
	if(!bIsSliding)
	{
		return;
	}
	LoopName = SlideAnims[Get4WayDirection()];
	// End:0x30
	if(LoopName == 'None')
	{
		return;
	}
	GetAnimParams(0, CurAnim, frame, Rate);
	// End:0x60
	if(CurAnim != LoopName)
	{
		SetAnimAction(LoopName);
	}
	//return;	
}

simulated function RefreshSlideLoop()
{
	// End:0x1C
	if(bIsSliding && !bSlideWaitingStart)
	{
		LoopSlideAnim();
	}
	//return;	
}

simulated function EndSlide()
{
	local name Anim;

	// End:0x0D
	if(!bIsSliding)
	{
		return;
	}
	bSlideWaitingStart = false;
	// End:0x55
	if(!bIsCrouched)
	{
		Anim = SlideEndAnims[Get4WayDirection()];
		// End:0x4A
		if(PlayAnim(Anim, 2.0000000))
		{
			bWaitForAnim = true;
		}
		AnimAction = Anim;
	}
	bIsSliding = false;
	SlideVelocity = vect(0.0000000, 0.0000000, 0.0000000);
	LastSlideEndTime = Level.TimeSeconds;
	// End:0xB0
	if((int(Role) == int(ROLE_Authority)) && Sprinter != none)
	{
		Sprinter.UpdateSpeed();
	}
	//return;	
}

simulated function TickSlopeCalculation(float dt)
{
	DownSlopeVect = Normal(vect(0.0000000, 0.0000000, -1.0000000) - ((Floor Dot vect(0.0000000, 0.0000000, -1.0000000)) * Floor));
	SlopeAngleRad = Acos(Floor Dot vect(0.0000000, 0.0000000, 1.0000000));
	SlopeAngleDeg = SlopeAngleRad * (180.0000000 / 3.1415930);
	// End:0x8E
	if((Normal(Velocity) Dot DownSlopeVect) > float(0))
	{
		SlopeAngleDeg = -SlopeAngleDeg;
	}
	//return;	
}

simulated function HandleSliding(float dt)
{
	local float DynamicFriction;

	CrouchedPct = 1.0000000;
	GravityAlongSlope = -PhysicsVolume.Gravity.Z * Sin(SlopeAngleRad);
	DynamicFriction = SlideFriction;
	// End:0x72
	if(SlopeAngleDeg < float(0))
	{
		DynamicFriction *= FClamp(1.0000000 - (Abs(SlopeAngleDeg) / 60.0000000), 0.2000000, 1.0000000);		
	}
	else
	{
		DynamicFriction *= FClamp(1.0000000 + (SlopeAngleDeg / 45.0000000), 1.0000000, 2.5000000);
	}
	// End:0x121
	if(((SlopeAngleDeg == 0.0000000) && Floor != vect(0.0000000, 0.0000000, 1.0000000)) && PlayerController(Controller) != none)
	{
		// End:0x109
		if(PlayerController(Controller).FindStairRotation(dt) < 0)
		{
			DynamicFriction *= 0.5000000;
			GravityAlongSlope *= 1.5000000;			
		}
		else
		{
			DynamicFriction *= 1.5000000;
			GravityAlongSlope *= 0.5000000;
		}
	}
	SlideVelocity += (((DownSlopeVect * GravityAlongSlope) * 1.5000000) * dt);
	// End:0x192
	if(VSize(SlideVelocity) > 0.1000000)
	{
		SlideVelocity -= ((((Normal(SlideVelocity) * DynamicFriction) * -PhysicsVolume.Gravity.Z) * Cos(SlopeAngleRad)) * dt);		
	}
	else
	{
		EndSlide();
	}
	// End:0x1BD
	if(VSize(SlideVelocity) > MaxSlideSpeed)
	{
		SlideVelocity = Normal(SlideVelocity) * MaxSlideSpeed;
	}
	// End:0x1D8
	if(int(Role) == int(ROLE_Authority))
	{
		Velocity = SlideVelocity;
	}
	RefreshSlideLoop();
	//return;	
}

state Dying
{
	simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
	{
		// End:0x39
		if(Level.TimeSeconds == LastPainTime)
		{
			PlayHit(float(Damage), instigatedBy, HitLocation, DamageType, Momentum);
		}
		super.TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
		//return;		
	}

	simulated function Timer()
	{
		local KarmaParamsSkel skelParams;

		// End:0xCA
		if((LifeSpan <= DeResTime) && bDeRes == false)
		{
			skelParams = KarmaParamsSkel(KParams);
			// End:0xB0
			if(((PlayerController(OldController) != none) && PlayerController(OldController).ViewTarget == self) && Viewport(PlayerController(OldController).Player) != none)
			{
				skelParams.bKImportantRagdoll = true;
				LifeSpan = FMax(LifeSpan, DeResTime + 2.0000000);
				SetTimer(1.0000000, false);
				return;				
			}
			else
			{
				skelParams.bKImportantRagdoll = false;
			}
			StartDeRes();			
		}
		else
		{
			SetTimer(1.0000000, false);
		}
		//return;		
	}

	event KVelDropBelow()
	{
		//return;		
	}
	stop;	
}

defaultproperties
{
	MoverLeaveGrace=1.0000000
	MinDragDistance=40.0000000
	MaxPoolVelocity=20.0000000
	HighImpactVelocity=1000.0000000
	LowImpactVelocity=500.0000000
	TimeBetweenImpacts=1.0000000
	BloodFlashV=(X=1000.0000000,Y=250.0000000,Z=250.0000000)
	ShieldFlashV=(X=750.0000000,Y=500.0000000,Z=350.0000000)
	NewDeResSound=SoundGroup'BW_Core_WeaponSound.Misc.DeRes'
	MeleeAnim="Melee_Smack"
	GruntRadius=28.0000000
	FootstepRadius=1536.0000000
	CrouchEyeHeight=19
	Fades[0]=Texture'BW_Core_WeaponTex.Icons.stealth_8'
	Fades[1]=Texture'BW_Core_WeaponTex.Icons.stealth_16'
	Fades[2]=Texture'BW_Core_WeaponTex.Icons.stealth_24'
	Fades[3]=Texture'BW_Core_WeaponTex.Icons.stealth_32'
	Fades[4]=Texture'BW_Core_WeaponTex.Icons.stealth_40'
	Fades[5]=Texture'BW_Core_WeaponTex.Icons.stealth_48'
	Fades[6]=Texture'BW_Core_WeaponTex.Icons.stealth_56'
	Fades[7]=Texture'BW_Core_WeaponTex.Icons.stealth_64'
	Fades[8]=Texture'BW_Core_WeaponTex.Icons.stealth_72'
	Fades[9]=Texture'BW_Core_WeaponTex.Icons.stealth_80'
	Fades[10]=Texture'BW_Core_WeaponTex.Icons.stealth_88'
	Fades[11]=Texture'BW_Core_WeaponTex.Icons.stealth_96'
	Fades[12]=Texture'BW_Core_WeaponTex.Icons.stealth_104'
	Fades[13]=Texture'BW_Core_WeaponTex.Icons.stealth_112'
	Fades[14]=Texture'BW_Core_WeaponTex.Icons.stealth_120'
	Fades[15]=Texture'BW_Core_WeaponTex.Icons.stealth_128'
	StrafeScale=1.0000000
	BackpedalScale=1.0000000
	bCanDodge=true
	bAllowCrouchSliding=true
	SlideFriction=1.1000000
	SlideCooldownTime=0.6000000
	SlidePower=350.0000000
	SlideAnims[0]="SlideF"
	SlideAnims[1]="SlideL"
	SlideAnims[2]="SlideR"
	SlideAnims[3]="SlideB"
	SlideStartAnims[0]="SlideFStart"
	SlideStartAnims[1]="SlideLStart"
	SlideStartAnims[2]="SlideRStart"
	SlideStartAnims[3]="SlideBStart"
	SlideEndAnims[0]="SlideFEnd"
	SlideEndAnims[1]="SlideLEnd"
	SlideEndAnims[2]="SlideREnd"
	SlideEndAnims[3]="SlideBEnd"
	JumpCrouchPenalty=0.3500000
	JumpCrouchTime=0.3000000
	BackSlidePowerScale=0.6000000
	BackMaxSlideSpeedScale=0.7500000
	BackSlideDotThreshold=-0.2500000
	UDamageSound=Sound'BW_Core_WeaponSound.Udamage.UDamageFire'
	GruntVolume=0.2500000
	FootstepVolume=0.2500000
	DeResTime=4.0000000
	RagdollLifeSpan=20.0000000
	RagDeathUpKick=0.0000000
	bCanWalkOffLedges=true
	bSpecialHUD=true
	Visibility=64
	GroundSpeed=360.0000000
	WaterSpeed=150.0000000
	LadderSpeed=280.0000000
	WalkingPct=0.9000000
	CrouchedPct=0.3500000
	BaseEyeHeight=30.0000000
	CrouchHeight=32.0000000
	HeadRadius=13.0000000
	bAlwaysRelevant=true
	SoundOcclusion=1
	CollisionRadius=22.0000000
	// Reference: KarmaParamsSkel'BallisticProV55.BallisticPawn.PawnKParams'
	begin object name="PawnKParams" class=Engine.KarmaParamsSkel
		KConvulseSpacing=(Min=0.5000000,Max=2.2000000)
		KLinearDamping=0.1500000
		KAngularDamping=0.0500000
		KBuoyancy=1.0000000
		KStartEnabled=true
		KVelDropBelowThreshold=-1.0000000
		bHighDetailOnly=false
		KFriction=0.6000000
		KRestitution=0.3000000
		KImpactThreshold=500.0000000
	end object
	KParams=PawnKParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: KarmaParamsSkel'BallisticProV55.BallisticPawn.PawnKParams'
begin object name="PawnKParams" class=Engine.KarmaParamsSkel
	KConvulseSpacing=(Min=0.5000000,Max=2.2000000)
	KLinearDamping=0.1500000
	KAngularDamping=0.0500000
	KBuoyancy=1.0000000
	KStartEnabled=true
	KVelDropBelowThreshold=-1.0000000
	bHighDetailOnly=false
	KFriction=0.6000000
	KRestitution=0.3000000
	KImpactThreshold=500.0000000
end object
