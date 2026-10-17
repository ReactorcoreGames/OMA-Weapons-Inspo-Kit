class xPawn extends UnrealPawn
	config(User);

enum EFireAnimState
{
	FS_None,                        // 0
	FS_PlayOnce,                    // 1
	FS_Looping,                     // 2
	FS_Ready                        // 3
};

var int RepeaterDeathCount;
var Combo CurrentCombo;
var bool bBerserk;
var bool bInvis;
var bool bOldInvis;
var bool bGibbed;
var bool bCanDodgeDoubleJump;
var bool bCanBoostDodge;
var bool bAlreadySetup;
var bool bSpawnIn;
var bool bSpawnDone;
var bool bFrozenBody;
var bool bFlaming;
var bool bRubbery;
var bool bClearWeaponOffsets;
var(Udamage) Material UDamageWeaponMaterial;
var(Udamage) Sound UDamageSound;
var UDamageTimer UDamageTimer;
var float UDamageTime;
var float LastUDamageSoundTime;
var Material InvisMaterial;
var(Shield) float ShieldStrengthMax;
var float SmallShieldStrength;
var(Shield) Material ShieldHitMat;
var(Shield) float ShieldHitMatTime;
var Class<SpeciesType> Species;
var(Sounds) float GruntVolume;
var(Sounds) float FootstepVolume;
var transient int SimHitFxTicker;
var(Gib) Class<xPawnGibGroup> GibGroupClass;
var(Gib) int GibCountCalf;
var(Gib) int GibCountForearm;
var(Gib) int GibCountHead;
var(Gib) int GibCountTorso;
var(Gib) int GibCountUpperArm;
var float MinTimeBetweenPainSounds;
var localized string HeadShotMessage;
var(Sounds) Sound SoundFootsteps[11];
var(Sounds) Class<xPawnSoundGroup> SoundGroupClass;
var Class<Actor> TeleportFXClass;
var Class<Actor> TransEffects[2];
var xWeaponAttachment WeaponAttachment;
var ShadowProjector PlayerShadow;
var int MultiJumpRemaining;
var int MaxMultiJump;
var int MultiJumpBoost;
var name WallDodgeAnims[4];
var name IdleHeavyAnim;
var name IdleRifleAnim;
var name FireHeavyRapidAnim;
var name FireHeavyBurstAnim;
var name FireRifleRapidAnim;
var name FireRifleBurstAnim;
var name FireRootBone;
var xPawn.EFireAnimState FireState;
var Mesh SkeletonMesh;
var bool bSkeletized;
var bool bDeRes;
var float DeResTime;
var Emitter DeResFX;
var Material DeResMat0;
var Material DeResMat1;
var(DeRes) InterpCurve DeResLiftVel;
var(DeRes) InterpCurve DeResLiftSoftness;
var(DeRes) float DeResGravScale;
var(DeRes) float DeResLateralFriction;
var(Karma) float RagdollLifeSpan;
var(Karma) float RagInvInertia;
var(Karma) float RagDeathVel;
var(Karma) float RagShootStrength;
var(Karma) float RagSpinScale;
var(Karma) float RagDeathUpKick;
var(Karma) float RagGravScale;
var(Karma) Material RagConvulseMaterial;
var(Karma) array<Sound> RagImpactSounds;
var(Karma) float RagImpactSoundInterval;
var(Karma) float RagImpactVolume;
var transient float RagLastSoundTime;
var string RagdollOverride;
var Class<Actor> TransOutEffect[2];
var Controller OldController;
var Material RealSkins[4];
var Class<TeamVoicePack> VoiceClass;
var(AI) globalconfig string PlacedCharacterName;
var globalconfig string PlacedFemaleCharacterName;
var byte TeamSkin;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bInvis;

	// Pos:0x00D
	reliable if(bNetOwner && int(Role) == int(ROLE_Authority))
		MaxMultiJump, MultiJumpBoost, 
		bBerserk, bCanBoostDodge, 
		bCanDodgeDoubleJump;

	// Pos:0x025
	reliable if(int(Role) == int(ROLE_Authority))
		ClientSetUDamageTime;
}

simulated function Fire(optional float F)
{
	// End:0x51
	if((Weapon != none) && Weapon.bBerserk != bBerserk)
	{
		// End:0x42
		if(bBerserk)
		{
			Weapon.StartBerserk();			
		}
		else
		{
			Weapon.StopBerserk();
		}
	}
	super(Pawn).Fire(F);
	//return;	
}

simulated function AltFire(optional float F)
{
	// End:0x51
	if((Weapon != none) && Weapon.bBerserk != bBerserk)
	{
		// End:0x42
		if(bBerserk)
		{
			Weapon.StartBerserk();			
		}
		else
		{
			Weapon.StopBerserk();
		}
	}
	super(Pawn).AltFire(F);
	//return;	
}

simulated function PlayWaiting()
{
	//return;	
}

function RosterEntry GetPlacedRoster()
{
	PlayerReplicationInfo.CharacterName = PlacedCharacterName;
	return Class'XGame.xRosterEntry'.static.CreateRosterEntryCharacter(PlacedCharacterName);
	//return;	
}

function PossessedBy(Controller C)
{
	super(Pawn).PossessedBy(C);
	// End:0x21
	if(Controller != none)
	{
		OldController = Controller;
	}
	//return;	
}

simulated function bool WasPlayerPawn()
{
	return (OldController != none) && OldController.bIsPlayer;
	//return;	
}

function DoTranslocateOut(Vector PrevLocation)
{
	// End:0x62
	if(((PlayerReplicationInfo == none) || PlayerReplicationInfo.Team == none) || PlayerReplicationInfo.Team.TeamIndex == 0)
	{
		Spawn(TransOutEffect[0], self,, PrevLocation, Rotator(Location - PrevLocation));		
	}
	else
	{
		Spawn(TransOutEffect[1], self,, PrevLocation, Rotator(Location - PrevLocation));
	}
	//return;	
}

simulated function AssignInitialPose()
{
	// End:0x4A
	if(DrivenVehicle != none)
	{
		// End:0x39
		if(HasAnim(DrivenVehicle.DriveAnim))
		{
			LoopAnim(DrivenVehicle.DriveAnim,, 0.1000000);			
		}
		else
		{
			LoopAnim('Vehicle_Driving',, 0.1000000);
		}		
	}
	else
	{
		TweenAnim(MovementAnims[0], 0.0000000);
	}
	AnimBlendParams(1, 1.0000000, 0.2000000, 0.2000000, 'Bip01 Spine1');
	BoneRefresh();
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(PlayerShadow != none)
	{
		PlayerShadow.Destroy();
	}
	// End:0x4C
	if(DeResFX != none)
	{
		DeResFX.Emitters[0].SkeletalMeshActor = none;
		DeResFX.Kill();
	}
	super(Pawn).Destroyed();
	//return;	
}

simulated function RemoveFlamingEffects()
{
	local int i;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	i = 0;
	J0x22:

	// End:0x90 [Loop If]
	if(i < Attached.Length)
	{
		// End:0x86
		if(Attached[i].IsA('xEmitter') && !Attached[i].IsA('BloodJet'))
		{
			xEmitter(Attached[i]).mRegen = false;
		}
		i++;
		// [Loop Continue]
		goto J0x22;
	}
	//return;	
}

simulated event PhysicsVolumeChange(PhysicsVolume NewVolume)
{
	// End:0x18
	if(NewVolume.bWaterVolume)
	{
		RemoveFlamingEffects();
	}
	super(Actor).PhysicsVolumeChange(NewVolume);
	//return;	
}

function float AdjustedStrength()
{
	// End:0x0F
	if(bBerserk)
	{
		return 1.0000000;
	}
	return 0.0000000;
	//return;	
}

function DeactivateSpawnProtection()
{
	// End:0x0B
	if(bSpawnDone)
	{
		return;
	}
	bSpawnDone = true;
	// End:0xA4
	if((Level.TimeSeconds - SpawnTime) < DeathMatch(Level.Game).SpawnProtectionTime)
	{
		bSpawnIn = true;
		// End:0x6D
		if(OverlayMaterial == ShieldHitMat)
		{
			SetOverlayMaterial(none, 0.0000000, true);
		}
		SpawnTime = (Level.TimeSeconds - DeathMatch(Level.Game).SpawnProtectionTime) - float(1);
	}
	//return;	
}

function PlayTeleportEffect(bool bOut, bool bSound)
{
	// End:0x107
	if(!bSpawnIn && (Level.TimeSeconds - SpawnTime) < DeathMatch(Level.Game).SpawnProtectionTime)
	{
		bSpawnIn = true;
		SetOverlayMaterial(ShieldHitMat, DeathMatch(Level.Game).SpawnProtectionTime, false);
		// End:0xDD
		if(((PlayerReplicationInfo == none) || PlayerReplicationInfo.Team == none) || PlayerReplicationInfo.Team.TeamIndex == 0)
		{
			Spawn(TransEffects[0],,, Location + (CollisionHeight * vect(0.0000000, 0.0000000, 0.7500000)));			
		}
		else
		{
			Spawn(TransEffects[1],,, Location + (CollisionHeight * vect(0.0000000, 0.0000000, 0.7500000)));
		}		
	}
	else
	{
		// End:0x11E
		if(bOut)
		{
			DoTranslocateOut(Location);			
		}
		else
		{
			// End:0x188
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
	super(Pawn).PlayTeleportEffect(bOut, bSound);
	//return;	
}

function PlayMoverHitSound()
{
	PlaySound(SoundGroupClass.static.GetHitSound(), 3);
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
	PlaySound(SoundGroupClass.static.GetDeathSound(), 2, 2.5000000 * TransientSoundVolume, true, 500.0000000);
	//return;	
}

function Gasp()
{
	// End:0x12
	if(int(Role) != int(ROLE_Authority))
	{
		return;
	}
	// End:0x30
	if(BreathTime < float(2))
	{
		PlaySound(GetSound(5), 3);		
	}
	else
	{
		PlaySound(GetSound(7), 3);
	}
	//return;	
}

function Controller GetKillerController()
{
	// End:0x11
	if(Controller != none)
	{
		return Controller;
	}
	// End:0x22
	if(OldController != none)
	{
		return OldController;
	}
	return none;
	//return;	
}

simulated function int GetTeamNum()
{
	// End:0x1B
	if(Controller != none)
	{
		return Controller.GetTeamNum();
	}
	// End:0x55
	if((DrivenVehicle != none) && DrivenVehicle.Controller != none)
	{
		return DrivenVehicle.Controller.GetTeamNum();
	}
	// End:0x70
	if(OldController != none)
	{
		return OldController.GetTeamNum();
	}
	// End:0x94
	if((PlayerReplicationInfo == none) || PlayerReplicationInfo.Team == none)
	{
		return 255;
	}
	return PlayerReplicationInfo.Team.TeamIndex;
	//return;	
}

function TeamInfo GetTeam()
{
	// End:0x1A
	if(PlayerReplicationInfo != none)
	{
		return PlayerReplicationInfo.Team;
	}
	// End:0x53
	if((DrivenVehicle != none) && DrivenVehicle.PlayerReplicationInfo != none)
	{
		return DrivenVehicle.PlayerReplicationInfo.Team;
	}
	// End:0x8C
	if((OldController != none) && OldController.PlayerReplicationInfo != none)
	{
		return OldController.PlayerReplicationInfo.Team;
	}
	return none;
	//return;	
}

function RemovePowerups()
{
	// End:0x36
	if(CurrentCombo != none)
	{
		CurrentCombo.Destroy();
		// End:0x36
		if(Controller != none)
		{
			Controller.Adrenaline = 0.0000000;
		}
	}
	// End:0x53
	if(UDamageTimer != none)
	{
		UDamageTimer.Destroy();
		DisableUDamage();
	}
	super(Pawn).RemovePowerups();
	//return;	
}

simulated function TickFX(float DeltaTime)
{
	local int i, NumSkins;

	// End:0x15
	if(SimHitFxTicker != HitFxTicker)
	{
		ProcessHitFX();
	}
	// End:0x11E
	if(bInvis && !bOldInvis)
	{
		// End:0x91
		if(Left(string(Skins[0]), 21) ~= "UT2004PlayerSkins.Xan")
		{
			Skins[2] = Material(DynamicLoadObject("UT2004PlayerSkins.XanMk3V2_abdomen", Class'Engine.Material'));
		}
		NumSkins = Clamp(Skins.Length, 2, 4);
		i = 0;
		J0xAA:

		// End:0xEB [Loop If]
		if(i < NumSkins)
		{
			RealSkins[i] = Skins[i];
			Skins[i] = InvisMaterial;
			i++;
			// [Loop Continue]
			goto J0xAA;
		}
		bAcceptsProjectors = false;
		ClearAttachedDecals();
		// End:0x115
		if(PlayerShadow != none)
		{
			PlayerShadow.bShadowActive = false;
		}
		RemoveFlamingEffects();		
	}
	else
	{
		// End:0x1A6
		if(!bInvis && bOldInvis)
		{
			NumSkins = Clamp(Skins.Length, 2, 4);
			i = 0;
			J0x14D:

			// End:0x17D [Loop If]
			if(i < NumSkins)
			{
				Skins[i] = RealSkins[i];
				i++;
				// [Loop Continue]
				goto J0x14D;
			}
			bAcceptsProjectors = default.bAcceptsProjectors;
			// End:0x1A6
			if(PlayerShadow != none)
			{
				PlayerShadow.bShadowActive = true;
			}
		}
	}
	bOldInvis = bInvis;
	bDrawCorona = (((((!bNoCoronas && !bInvis) && int(Level.NetMode) != int(NM_DedicatedServer)) && !bPlayedDeath) && Level.GRI != none) && Level.GRI.bAllowPlayerLights) && PlayerReplicationInfo != none;
	// End:0x28C
	if(bDrawCorona && PlayerReplicationInfo.Team != none)
	{
		// End:0x281
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

simulated function StartDriving(Vehicle V)
{
	local int i;

	super(Pawn).StartDriving(V);
	// End:0x27
	if(PlayerShadow != none)
	{
		PlayerShadow.bShadowActive = false;
	}
	// End:0x42
	if(WeaponAttachment != none)
	{
		WeaponAttachment.Hide(true);
	}
	i = 0;
	J0x49:

	// End:0x8C [Loop If]
	if(i < Attached.Length)
	{
		// End:0x82
		if(Projectile(Attached[i]) != none)
		{
			Attached[i].SetBase(none);
		}
		i++;
		// [Loop Continue]
		goto J0x49;
	}
	//return;	
}

simulated function StopDriving(Vehicle V)
{
	super(Pawn).StopDriving(V);
	// End:0x2E
	if(PlayerShadow != none)
	{
		PlayerShadow.bShadowActive = !bInvis;
	}
	// End:0x49
	if(WeaponAttachment != none)
	{
		WeaponAttachment.Hide(false);
	}
	//return;	
}

simulated function AttachEffect(Class<xEmitter> EmitterClass, name BoneName, Vector Location, Rotator Rotation)
{
	local Actor A;
	local int i;

	// End:0x1C
	if(bSkeletized || BoneName == 'None')
	{
		return;
	}
	i = 0;
	J0x23:

	// End:0x93 [Loop If]
	if(i < Attached.Length)
	{
		// End:0x47
		if(Attached[i] == none)
		{
			// [Explicit Continue]
			goto J0x89;
		}
		// End:0x68
		if(Attached[i].AttachmentBone != BoneName)
		{
			// [Explicit Continue]
			goto J0x89;
		}
		// End:0x89
		if(ClassIsChildOf(EmitterClass, Attached[i].Class))
		{
			return;
		}
		J0x89:

		i++;
		// [Loop Continue]
		goto J0x23;
	}
	A = Spawn(EmitterClass,,, Location, Rotation);
	// End:0x103
	if(!AttachToBone(A, BoneName))
	{
		Log((("Couldn't attach " $ string(EmitterClass)) $ " to ") $ string(BoneName), 'Error');
		A.Destroy();
		return;
	}
	i = 0;
	J0x10A:

	// End:0x13C [Loop If]
	if(i < Attached.Length)
	{
		// End:0x132
		if(Attached[i] == A)
		{
			// [Explicit Break]
			goto J0x13C;
		}
		i++;
		// [Loop Continue]
		goto J0x10A;
	}
	J0x13C:

	A.SetRelativeRotation(Rotation);
	//return;	
}

simulated event SetHeadScale(float NewScale)
{
	HeadScale = NewScale;
	SetBoneScale(4, HeadScale, 'head');
	//return;	
}

simulated function SpawnGiblet(Class<Gib> GibClass, Vector Location, Rotator Rotation, float GibPerterbation)
{
	local Gib Giblet;
	local Vector direction, Dummy;

	// End:0x21
	if((GibClass == none) || Class'Engine.GameInfo'.static.UseLowGore())
	{
		return;
	}
	Instigator = self;
	Giblet = Spawn(GibClass,,, Location, Rotation);
	// End:0x4F
	if(Giblet == none)
	{
		return;
	}
	Giblet.bFlaming = bFlaming;
	Giblet.SpawnTrail();
	GibPerterbation *= 32768.0000000;
	Rotation.Pitch += int(((FRand() * 2.0000000) * GibPerterbation) - GibPerterbation);
	Rotation.Yaw += int(((FRand() * 2.0000000) * GibPerterbation) - GibPerterbation);
	Rotation.Roll += int(((FRand() * 2.0000000) * GibPerterbation) - GibPerterbation);
	GetAxes(Rotation, Dummy, Dummy, direction);
	Giblet.Velocity = Velocity + (Normal(direction) * (float(250) + (float(260) * FRand())));
	Giblet.LifeSpan = (Giblet.LifeSpan + (float(2) * FRand())) - float(1);
	//return;	
}

simulated function ProcessHitFX()
{
	local Coords boneCoords;
	local Class<xEmitter> HitEffects[4];
	local int i, j;
	local float GibPerterbation;

	// End:0x4D
	if((((int(Level.NetMode) == int(NM_DedicatedServer)) || bSkeletized) || Mesh == SkeletonMesh) || bGibbed)
	{
		SimHitFxTicker = HitFxTicker;
		return;
	}
	SimHitFxTicker = SimHitFxTicker;
	J0x58:

	// End:0x607 [Loop If]
	if(SimHitFxTicker != HitFxTicker)
	{
		j++;
		// End:0x87
		if(j > 30)
		{
			SimHitFxTicker = HitFxTicker;
			return;
		}
		// End:0xE1
		if((HitFx[SimHitFxTicker].damtype == none) || (Level.bDropDetail && (Level.TimeSeconds - LastRenderTime) > float(3)) && !IsHumanControlled())
		{			
		}
		else
		{
			boneCoords = GetBoneCoords(HitFx[SimHitFxTicker].Bone);
			// End:0x201
			if(!Level.bDropDetail && !bSkeletized)
			{
				AttachEffect(GibGroupClass.static.GetBloodEmitClass(), HitFx[SimHitFxTicker].Bone, boneCoords.Origin, HitFx[SimHitFxTicker].rotDir);
				HitFx[SimHitFxTicker].damtype.static.GetHitEffects(HitEffects, Health);
				// End:0x201
				if(!PhysicsVolume.bWaterVolume)
				{
					i = 0;
					J0x19C:

					// End:0x201 [Loop If]
					if(i < 4)
					{
						// End:0x1BC
						if(HitEffects[i] == none)
						{
							// [Explicit Continue]
							goto J0x1F7;
						}
						AttachEffect(HitEffects[i], HitFx[SimHitFxTicker].Bone, boneCoords.Origin, HitFx[SimHitFxTicker].rotDir);
						J0x1F7:

						i++;
						// [Loop Continue]
						goto J0x19C;
					}
				}
			}
			// End:0x226
			if(Class'Engine.GameInfo'.static.UseLowGore())
			{
				HitFx[SimHitFxTicker].bSever = false;
			}
			// End:0x5EC
			if(HitFx[SimHitFxTicker].bSever)
			{
				GibPerterbation = HitFx[SimHitFxTicker].damtype.default.GibPerterbation;
				bFlaming = HitFx[SimHitFxTicker].damtype.default.bFlaming;
				switch(HitFx[SimHitFxTicker].Bone)
				{
					// End:0x294
					case 'lthigh':
					// End:0x302
					case 'rthigh':
						SpawnGiblet(GetGibClass(0), boneCoords.Origin, HitFx[SimHitFxTicker].rotDir, GibPerterbation);
						SpawnGiblet(GetGibClass(0), boneCoords.Origin, HitFx[SimHitFxTicker].rotDir, GibPerterbation);
						GibCountCalf -= 2;
						// End:0x5D6
						break;
					// End:0x30A
					case 'rfarm':
					// End:0x37D
					case 'lfarm':
						SpawnGiblet(GetGibClass(5), boneCoords.Origin, HitFx[SimHitFxTicker].rotDir, GibPerterbation);
						SpawnGiblet(GetGibClass(1), boneCoords.Origin, HitFx[SimHitFxTicker].rotDir, GibPerterbation);
						GibCountForearm--;
						GibCountUpperArm--;
						// End:0x5D6
						break;
					// End:0x3BC
					case 'head':
						SpawnGiblet(GetGibClass(3), boneCoords.Origin, HitFx[SimHitFxTicker].rotDir, GibPerterbation);
						GibCountTorso--;
						// End:0x5D6
						break;
					// End:0x3C4
					case 'spine':
					// End:0x5D3
					case 'None':
						SpawnGiblet(GetGibClass(4), boneCoords.Origin, HitFx[SimHitFxTicker].rotDir, GibPerterbation);
						GibCountTorso--;
						bGibbed = true;
						J0x408:

						// End:0x445 [Loop If]
						if(GibCountHead-- > 0)
						{
							SpawnGiblet(GetGibClass(3), boneCoords.Origin, HitFx[SimHitFxTicker].rotDir, GibPerterbation);
							// [Loop Continue]
							goto J0x408;
						}
						J0x445:

						// End:0x482 [Loop If]
						if(GibCountForearm-- > 0)
						{
							SpawnGiblet(GetGibClass(5), boneCoords.Origin, HitFx[SimHitFxTicker].rotDir, GibPerterbation);
							// [Loop Continue]
							goto J0x445;
						}
						J0x482:

						// End:0x4BF [Loop If]
						if(GibCountUpperArm-- > 0)
						{
							SpawnGiblet(GetGibClass(1), boneCoords.Origin, HitFx[SimHitFxTicker].rotDir, GibPerterbation);
							// [Loop Continue]
							goto J0x482;
						}
						// End:0x5D0
						if(((!bFlaming && !Level.bDropDetail) && int(Level.DetailMode) != int(0)) && PlayerCanSeeMe())
						{
							GibPerterbation = FMin(1.0000000, 1.5000000 * GibPerterbation);
							SpawnGiblet(GetGibClass(0), boneCoords.Origin, HitFx[SimHitFxTicker].rotDir, GibPerterbation);
							SpawnGiblet(GetGibClass(0), boneCoords.Origin, HitFx[SimHitFxTicker].rotDir, GibPerterbation);
							SpawnGiblet(GetGibClass(5), boneCoords.Origin, HitFx[SimHitFxTicker].rotDir, GibPerterbation);
							SpawnGiblet(GetGibClass(1), boneCoords.Origin, HitFx[SimHitFxTicker].rotDir, GibPerterbation);
						}
						// End:0x5D6
						break;
					// End:0xFFFF
					default:
						break;
				}
				HideBone(HitFx[SimHitFxTicker].Bone);
			}
		}
		SimHitFxTicker = int(float(SimHitFxTicker + 1) % float(8));
		// [Loop Continue]
		goto J0x58;
	}
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
						// End:0x97
						if(BoneName == 'spine')
						{
							BoneScaleSlot = 5;
						}
					}
				}
			}
		}
	}
	SetBoneScale(BoneScaleSlot, 0.0000000, BoneName);
	//return;	
}

function CalcHitLoc(Vector HitLoc, Vector hitRay, out name BoneName, out float Dist)
{
	BoneName = GetClosestBone(HitLoc, hitRay, Dist);
	//return;	
}

function DoDamageFX(name BoneName, int Damage, Class<DamageType> DamageType, Rotator R)
{
	local float DismemberProbability;
	local bool bExtraGib;

	// End:0x44F
	if(((FRand() > 0.3000000) || Damage > 30) || Health <= 0)
	{
		HitFx[HitFxTicker].damtype = DamageType;
		// End:0x2D3
		if(Health <= 0)
		{
			switch(BoneName)
			{
				// End:0x65
				case 'lfoot':
					BoneName = 'lthigh';
					// End:0xC8
					break;
				// End:0x7B
				case 'rfoot':
					BoneName = 'rthigh';
					// End:0xC8
					break;
				// End:0x91
				case 'rhand':
					BoneName = 'rfarm';
					// End:0xC8
					break;
				// End:0xA7
				case 'lhand':
					BoneName = 'lfarm';
					// End:0xC8
					break;
				// End:0xAF
				case 'rshoulder':
				// End:0xC5
				case 'lshoulder':
					BoneName = 'spine';
					// End:0xC8
					break;
				// End:0xFFFF
				default:
					break;
			}
			// End:0x130
			if(((DamageType != none) && DamageType.default.bAlwaysSevers) || Damage == 1000)
			{
				HitFx[HitFxTicker].bSever = true;
				// End:0x12D
				if(BoneName == 'None')
				{
					BoneName = 'spine';
					bExtraGib = true;
				}				
			}
			else
			{
				// End:0x1CD
				if((((DamageType != none) && (float(Damage) * DamageType.default.GibModifier) > (float(50) + (float(120) * FRand()))) || (DamageType == none) && float(Damage) > (float(50) + (float(120) * FRand()))) && (Damage + Health) > 0)
				{
					HitFx[HitFxTicker].bSever = true;
					BoneName = 'spine';
					bExtraGib = true;					
				}
				else
				{
					// End:0x1F8
					if(DamageType == none)
					{
						DismemberProbability = Abs(float(Health - Damage) / 130.0000000);						
					}
					else
					{
						DismemberProbability = Abs((float(Health) - (float(Damage) * DamageType.default.GibModifier)) / 130.0000000);
					}
					switch(BoneName)
					{
						// End:0x236
						case 'lthigh':
						// End:0x23E
						case 'rthigh':
						// End:0x246
						case 'rfarm':
						// End:0x24E
						case 'lfarm':
						// End:0x278
						case 'head':
							// End:0x275
							if(FRand() < DismemberProbability)
							{
								HitFx[HitFxTicker].bSever = true;
							}
							// End:0x2D3
							break;
						// End:0x28B
						case 'None':
							BoneName = 'spine';
						// End:0x2D0
						case 'spine':
							// End:0x2CD
							if(FRand() < (DismemberProbability * 0.3000000))
							{
								HitFx[HitFxTicker].bSever = true;
								// End:0x2CD
								if(FRand() < 0.6500000)
								{
									bExtraGib = true;
								}
							}
							// End:0x2D3
							break;
						// End:0xFFFF
						default:
							break;
					}
				}
			}
		}
		else
		{
			// End:0x364
			if((((DamageType != none) && DamageType.default.bNeverSevers) || Class'Engine.GameInfo'.static.UseLowGore()) || (Level.Game != none) && Level.Game.PreventSever(self, BoneName, Damage, DamageType))
			{
				HitFx[HitFxTicker].bSever = false;
				bExtraGib = false;
			}
			HitFx[HitFxTicker].Bone = BoneName;
			HitFx[HitFxTicker].rotDir = R;
			HitFxTicker = HitFxTicker + 1;
			// End:0x3B4
			if(HitFxTicker > (8 - 1))
			{
				HitFxTicker = 0;
			}
			// End:0x44F
			if(bExtraGib)
			{
				// End:0x400
				if(FRand() < 0.2500000)
				{
					DoDamageFX('lthigh', 1000, DamageType, R);
					DoDamageFX('rthigh', 1000, DamageType, R);					
				}
				else
				{
					// End:0x429
					if(FRand() < 0.3500000)
					{
						DoDamageFX('lthigh', 1000, DamageType, R);						
					}
					else
					{
						// End:0x44F
						if(FRand() < 0.5000000)
						{
							DoDamageFX('rthigh', 1000, DamageType, R);
						}
					}
				}
			}
		}/* !MISMATCHING REMOVE, tried If got Type:Else Position:0x2D3! */
		//return;		
	}/* !MISMATCHING REMOVE, tried Else got Type:If Position:0x000! */
}

simulated function StartDeRes()
{
	local KarmaParamsSkel skelParams;
	local int i;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	AmbientGlow = 254;
	MaxLights = 0;
	DeResFX = Spawn(Class'XEffects.DeResPart', self,, Location);
	// End:0x73
	if(DeResFX != none)
	{
		DeResFX.Emitters[0].SkeletalMeshActor = self;
		DeResFX.SetBase(self);
	}
	Skins[0] = DeResMat0;
	Skins[1] = DeResMat1;
	// End:0xCD
	if(Skins.Length > 2)
	{
		i = 2;
		J0xA2:

		// End:0xCD [Loop If]
		if(i < Skins.Length)
		{
			Skins[i] = DeResMat0;
			i++;
			// [Loop Continue]
			goto J0xA2;
		}
	}
	// End:0x144
	if(int(Physics) == int(14))
	{
		KAddBoneLifter('bip01 Spine', DeResLiftVel, DeResLateralFriction, DeResLiftSoftness);
		KAddBoneLifter('bip01 Spine2', DeResLiftVel, DeResLateralFriction, DeResLiftSoftness);
		KSetActorGravScale(DeResGravScale);
		KSetBlockKarma(false);
		skelParams = KarmaParamsSkel(KParams);
		skelParams.bKDoConvulsions = false;
	}
	AmbientSound = Sound'GeneralAmbience.texture19';
	SoundRadius = 40.0000000;
	SetCollision(false, false, false);
	Projectors.Remove(0, Projectors.Length);
	bAcceptsProjectors = false;
	// End:0x191
	if(PlayerShadow != none)
	{
		PlayerShadow.bShadowActive = false;
	}
	RemoveFlamingEffects();
	SetOverlayMaterial(none, 0.0000000, true);
	bDeRes = true;
	//return;	
}

simulated function SetOverlayMaterial(Material mat, float Time, bool bOverride)
{
	// End:0x39
	if(Level.bDropDetail || int(Level.DetailMode) == int(0))
	{
		Time *= 0.7500000;
	}
	super(Actor).SetOverlayMaterial(mat, Time, bOverride);
	//return;	
}

simulated function TickDeRes(float DeltaTime)
{
	// End:0x2A
	if(LifeSpan < 3.0000000)
	{
		AmbientGlow = byte(254.0000000 * (LifeSpan / 3.0000000));
	}
	//return;	
}

simulated function Tick(float DeltaTime)
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x31
	if(Controller != none)
	{
		OldController = Controller;
	}
	TickFX(DeltaTime);
	// End:0x50
	if(bDeRes)
	{
		TickDeRes(DeltaTime);
	}
	//return;	
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	AssignInitialPose();
	// End:0xCF
	if((bActorShadows && bPlayerShadows) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		PlayerShadow = Spawn(Class'Engine.ShadowProjector', self, 'None', Location);
		PlayerShadow.ShadowActor = self;
		PlayerShadow.bBlobShadow = bBlobShadow;
		PlayerShadow.LightDirection = Normal(vect(1.0000000, 1.0000000, 3.0000000));
		PlayerShadow.LightDistance = 320.0000000;
		PlayerShadow.MaxTraceDistance = 350;
		PlayerShadow.InitShadow();
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	MultiJumpRemaining = MaxMultiJump;
	bCanDoubleJump = CanMultiJump();
	//return;	
}

function int ShieldAbsorb(int Dam)
{
	local float Interval, Damage, Remaining;

	Damage = float(Dam);
	// End:0x22
	if(ShieldStrength == float(0))
	{
		return int(Damage);
	}
	SetOverlayMaterial(ShieldHitMat, ShieldHitMatTime, false);
	PlaySound(Sound'WeaponSounds.Misc.ArmorHit', 2, 2.0000000 * TransientSoundVolume,, 400.0000000);
	// End:0xA5
	if(ShieldStrength > float(100))
	{
		Interval = ShieldStrength - float(100);
		// End:0x8E
		if(Interval >= Damage)
		{
			ShieldStrength -= Damage;
			return 0;			
		}
		else
		{
			ShieldStrength = 100.0000000;
			Damage -= Interval;
		}
	}
	// End:0x167
	if(ShieldStrength > SmallShieldStrength)
	{
		Interval = ShieldStrength - SmallShieldStrength;
		// End:0x11B
		if(Interval >= (0.7500000 * Damage))
		{
			ShieldStrength -= (0.7500000 * Damage);
			// End:0x109
			if(ShieldStrength < SmallShieldStrength)
			{
				SmallShieldStrength = ShieldStrength;
			}
			return int(0.2500000 * Damage);			
		}
		else
		{
			ShieldStrength = SmallShieldStrength;
			Damage -= Interval;
			Remaining = 0.3300000 * Interval;
			// End:0x15B
			if(Remaining <= Damage)
			{
				return int(Damage);
			}
			Damage -= Remaining;
		}
	}
	// End:0x1B4
	if(ShieldStrength >= (0.5000000 * Damage))
	{
		ShieldStrength -= (0.5000000 * Damage);
		SmallShieldStrength = ShieldStrength;
		return int(Remaining + (0.5000000 * Damage));		
	}
	else
	{
		Damage -= ShieldStrength;
		ShieldStrength = 0.0000000;
		SmallShieldStrength = 0.0000000;
	}
	return int(Damage + Remaining);
	//return;	
}

function PlayHit(float Damage, Pawn instigatedBy, Vector HitLocation, Class<DamageType> DamageType, Vector Momentum)
{
	local Vector HitNormal, hitRay;
	local name HitBone;
	local float HitBoneDist;
	local PlayerController PC;
	local bool bShowEffects, bRecentHit;
	local BloodSpurt BloodHit;

	bRecentHit = (Level.TimeSeconds - LastPainTime) < 0.5000000;
	super(Pawn).PlayHit(Damage, instigatedBy, HitLocation, DamageType, Momentum);
	// End:0x51
	if(Damage <= float(0))
	{
		return;
	}
	PC = PlayerController(Controller);
	bShowEffects = (((int(Level.NetMode) != int(NM_Standalone)) || (Level.TimeSeconds - LastRenderTime) < 2.5000000) || (instigatedBy != none) && PlayerController(instigatedBy.Controller) != none) || PC != none;
	// End:0xE1
	if(!bShowEffects)
	{
		return;
	}
	hitRay = vect(0.0000000, 0.0000000, 0.0000000);
	// End:0x13B
	if(instigatedBy != none)
	{
		hitRay = Normal(HitLocation - (instigatedBy.Location + (vect(0.0000000, 0.0000000, 1.0000000) * instigatedBy.EyeHeight)));
	}
	// End:0x16A
	if(DamageType.default.bLocationalHit)
	{
		CalcHitLoc(HitLocation, hitRay, HitBone, HitBoneDist);		
	}
	else
	{
		HitLocation = Location;
		HitBone = 'None';
		HitBoneDist = 0.0000000;
	}
	// End:0x1BC
	if(DamageType.default.bAlwaysSevers && DamageType.default.bSpecial)
	{
		HitBone = 'head';
	}
	// End:0x203
	if(instigatedBy != none)
	{
		HitNormal = Normal((Normal(instigatedBy.Location - HitLocation) + (VRand() * 0.2000000)) + vect(0.0000000, 0.0000000, 2.8000000));		
	}
	else
	{
		HitNormal = Normal((vect(0.0000000, 0.0000000, 1.0000000) + (VRand() * 0.2000000)) + vect(0.0000000, 0.0000000, 2.8000000));
	}
	// End:0x3A1
	if(DamageType.default.bCausesBlood)
	{
		// End:0x2BC
		if(Class'Engine.GameInfo'.static.UseLowGore())
		{
			// End:0x292
			if(Class'Engine.GameInfo'.static.NoBlood())
			{
				BloodHit = BloodSpurt(Spawn(GibGroupClass.default.NoBloodHitClass, instigatedBy,, HitLocation));				
			}
			else
			{
				BloodHit = BloodSpurt(Spawn(GibGroupClass.default.LowGoreBloodHitClass, instigatedBy,, HitLocation));
			}			
		}
		else
		{
			BloodHit = BloodSpurt(Spawn(GibGroupClass.default.BloodHitClass, instigatedBy,, HitLocation, Rotator(HitNormal)));
		}
		// End:0x3A1
		if(BloodHit != none)
		{
			BloodHit.bMustShow = !bRecentHit;
			// End:0x33B
			if(Momentum != vect(0.0000000, 0.0000000, 0.0000000))
			{
				BloodHit.HitDir = Momentum;				
			}
			else
			{
				// End:0x36D
				if(instigatedBy != none)
				{
					BloodHit.HitDir = Location - instigatedBy.Location;					
				}
				else
				{
					BloodHit.HitDir = Location - HitLocation;
				}
				BloodHit.HitDir.Z = 0.0000000;
			}
		}
	}
	// End:0x41F
	if((((DamageType.Name == 'DamTypeFlakChunk') && Health < 0) && instigatedBy != none) && VSize(instigatedBy.Location - Location) < float(350))
	{
		DoDamageFX(HitBone, int(float(8) * Damage), DamageType, Rotator(HitNormal));		
	}
	else
	{
		DoDamageFX(HitBone, int(Damage), DamageType, Rotator(HitNormal));
	}
	// End:0x483
	if((DamageType.default.DamageOverlayMaterial != none) && Damage > float(0))
	{
		SetOverlayMaterial(DamageType.default.DamageOverlayMaterial, DamageType.default.DamageOverlayTime, false);
	}
	//return;	
}

function bool CheckReflect(Vector HitLocation, out Vector RefNormal, int Damage)
{
	// End:0x2D
	if(Weapon != none)
	{
		return Weapon.CheckReflect(HitLocation, RefNormal, Damage);		
	}
	else
	{
		return false;
	}
	//return;	
}

function name GetWeaponBoneFor(Inventory i)
{
	return 'righthand';
	//return;	
}

function name GetOffhandBoneFor(Inventory i)
{
	return 'bip01 l hand';
	//return;	
}

event Landed(Vector HitNormal)
{
	super(Pawn).Landed(HitNormal);
	MultiJumpRemaining = MaxMultiJump;
	// End:0x7E
	if(((Health > 0) && !bHidden) && (Level.TimeSeconds - SplashTime) > 0.2500000)
	{
		PlayOwnedSound(GetSound(0), 3, FMin(1.0000000, (-0.3000000 * Velocity.Z) / JumpZ));
	}
	//return;	
}

simulated function name GetAnimSequence()
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	return Anim;
	//return;	
}

simulated function PlayDoubleJump()
{
	local name Anim;

	Anim = DoubleJumpAnims[Get4WayDirection()];
	// End:0x2F
	if(PlayAnim(Anim, 1.0000000, 0.1000000))
	{
		bWaitForAnim = true;
	}
	AnimAction = Anim;
	//return;	
}

simulated function bool FindValidTaunt(out name Sequence)
{
	local int i, j;

	i = 0;
	J0x07:

	// End:0x38 [Loop If]
	if(i < TauntAnims.Length)
	{
		// End:0x2E
		if(Sequence == TauntAnims[i])
		{
			return true;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	j = Class'XGame.SpeciesType'.static.GetOffsetForSequence(Sequence);
	// End:0x71
	if((j < 0) || j >= TauntAnims.Length)
	{
		return false;
	}
	Sequence = TauntAnims[j];
	return Sequence != 'None';
	//return;	
}

simulated event SetAnimAction(name NewAction)
{
	// End:0x240
	if(!bWaitForAnim)
	{
		AnimAction = NewAction;
		// End:0x52
		if(AnimAction == 'Weapon_Switch')
		{
			AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
			PlayAnim(NewAction,, 0.0000000, 1);			
		}
		else
		{
			// End:0xC6
			if(((int(Physics) == int(0)) || (Level.Game != none) && Level.Game.IsInState('MatchOver')) && DrivenVehicle == none)
			{
				PlayAnim(AnimAction,, 0.1000000);
				AnimBlendToAlpha(1, 0.0000000, 0.0500000);				
			}
			else
			{
				// End:0x1A2
				if(((DrivenVehicle != none) || int(Physics) == int(2)) || (int(Physics) == int(1)) && Velocity.Z != float(0))
				{
					// End:0x16E
					if(CheckTauntValid(AnimAction))
					{
						// End:0x16B
						if((int(FireState) == int(0)) || int(FireState) == int(3))
						{
							AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
							PlayAnim(NewAction,, 0.1000000, 1);
							FireState = 3;
						}						
					}
					else
					{
						// End:0x194
						if(PlayAnim(AnimAction))
						{
							// End:0x191
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
					// End:0x1EC
					if((bIsIdle && !bIsCrouched) && Bot(Controller) == none)
					{
						PlayAnim(AnimAction,, 0.1000000);
						AnimBlendToAlpha(1, 0.0000000, 0.0500000);						
					}
					else
					{
						// End:0x240
						if((int(FireState) == int(0)) || int(FireState) == int(3))
						{
							AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
							PlayAnim(NewAction,, 0.1000000, 1);
							FireState = 3;
						}
					}
				}
			}
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
	// End:0x9A
	if(bHeavy)
	{
		// End:0x8C
		if(bRapid)
		{
			FireAnim = FireHeavyRapidAnim;			
		}
		else
		{
			FireAnim = FireHeavyBurstAnim;
		}		
	}
	else
	{
		// End:0xB1
		if(bRapid)
		{
			FireAnim = FireRifleRapidAnim;			
		}
		else
		{
			FireAnim = FireRifleBurstAnim;
		}
	}
	AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
	// End:0x10A
	if(bRapid)
	{
		// End:0x107
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
	//return;	
}

simulated function StopFiring()
{
	// End:0x18
	if(int(FireState) == int(2))
	{
		FireState = 1;
	}
	IdleTime = Level.TimeSeconds;
	//return;	
}

simulated function AnimEnd(int Channel)
{
	// End:0x89
	if(Channel == 1)
	{
		// End:0x37
		if(int(FireState) == int(3))
		{
			AnimBlendToAlpha(1, 0.0000000, 0.1200000);
			FireState = 0;			
		}
		else
		{
			// End:0x75
			if(int(FireState) == int(1))
			{
				PlayAnim(IdleWeaponAnim,, 0.2000000, 1);
				FireState = 3;
				IdleTime = Level.TimeSeconds;				
			}
			else
			{
				AnimBlendToAlpha(1, 0.0000000, 0.1200000);
			}
		}		
	}
	else
	{
		// End:0xA5
		if(bKeepTaunting && Channel == 0)
		{
			PlayVictoryAnimation();
		}
	}
	//return;	
}

function PlayWeaponSwitch(Weapon newWeapon)
{
	SetAnimAction('Weapon_Switch');
	//return;	
}

function PlayVictoryAnimation()
{
	local int tauntNum;

	tauntNum = Rand(TauntAnims.Length - 3);
	SetAnimAction(TauntAnims[3 + tauntNum]);
	//return;	
}

simulated function SetWeaponAttachment(xWeaponAttachment NewAtt)
{
	WeaponAttachment = NewAtt;
	// End:0x2B
	if(WeaponAttachment.bHeavy)
	{
		IdleWeaponAnim = IdleHeavyAnim;		
	}
	else
	{
		IdleWeaponAnim = IdleRifleAnim;
	}
	//return;	
}

event KSkelConvulse()
{
	// End:0x1C
	if(RagConvulseMaterial != none)
	{
		SetOverlayMaterial(RagConvulseMaterial, 0.4000000, true);
	}
	//return;	
}

final simulated function RandSpin(float spinRate)
{
	DesiredRotation = RotRand(true);
	RotationRate.Yaw = int(((spinRate * float(2)) * FRand()) - spinRate);
	RotationRate.Pitch = int(((spinRate * float(2)) * FRand()) - spinRate);
	RotationRate.Roll = int(((spinRate * float(2)) * FRand()) - spinRate);
	bFixedRotationDir = true;
	bRotateToDesired = false;
	//return;	
}

simulated function PlayDying(Class<DamageType> DamageType, Vector HitLoc)
{
	local float frame, Rate;
	local name seq;
	local LavaDeath LD;
	local BodyEffect BE;

	AmbientSound = none;
	bCanTeleport = false;
	bReplicateMovement = false;
	bTearOff = true;
	bPlayedDeath = true;
	// End:0x3E
	if(CurrentCombo != none)
	{
		CurrentCombo.Destroy();
	}
	HitDamageType = DamageType;
	TakeHitLocation = HitLoc;
	// End:0x2C3
	if(DamageType != none)
	{
		// End:0x21A
		if(DamageType.default.bSkeletize)
		{
			SetOverlayMaterial(DamageType.default.DamageOverlayMaterial, 4.0000000, true);
			// End:0x217
			if(!bSkeletized)
			{
				// End:0x15F
				if((int(Level.NetMode) != int(NM_DedicatedServer)) && SkeletonMesh != none)
				{
					// End:0x118
					if(DamageType.default.bLeaveBodyEffect)
					{
						BE = Spawn(Class'XGame.BodyEffect', self);
						// End:0x118
						if(BE != none)
						{
							BE.DamageType = DamageType;
							BE.HitLoc = HitLoc;
							bFrozenBody = true;
						}
					}
					GetAnimParams(0, seq, frame, Rate);
					LinkMesh(SkeletonMesh, true);
					Skins.Length = 0;
					PlayAnim(seq, 0.0000000, 0.0000000);
					SetAnimFrame(frame);
				}
				// End:0x182
				if(int(Physics) == int(1))
				{
					Velocity = vect(0.0000000, 0.0000000, 0.0000000);
				}
				TearOffMomentum *= 0.2500000;
				bSkeletized = true;
				// End:0x217
				if((int(Level.NetMode) != int(NM_DedicatedServer)) && DamageType == Class'Engine.FellLava')
				{
					LD = Spawn(Class'XEffects.LavaDeath',,, Location + vect(0.0000000, 0.0000000, 10.0000000), Rotation);
					// End:0x201
					if(LD != none)
					{
						LD.SetBase(self);
					}
					PlaySound(Sound'WeaponSounds.BaseImpactAndExplosions.BExplosion5', 0, 1.5000000 * TransientSoundVolume);
				}
			}			
		}
		else
		{
			// End:0x254
			if(DamageType.default.DeathOverlayMaterial != none)
			{
				SetOverlayMaterial(DamageType.default.DeathOverlayMaterial, DamageType.default.DeathOverlayTime, true);				
			}
			else
			{
				// End:0x2C3
				if(((DamageType.default.DamageOverlayMaterial != none) && int(Level.DetailMode) != int(0)) && !Level.bDropDetail)
				{
					SetOverlayMaterial(DamageType.default.DamageOverlayMaterial, 2.0000000 * DamageType.default.DamageOverlayTime, true);
				}
			}
		}
	}
	AnimBlendParams(1, 0.0000000);
	FireState = 0;
	LifeSpan = RagdollLifeSpan;
	GotoState('Dying');
	// End:0x2F6
	if(BE != none)
	{
		return;
	}
	PlayDyingAnimation(DamageType, HitLoc);
	//return;	
}

function PlayDyingAnimation(Class<DamageType> DamageType, Vector HitLoc)
{
	local Vector shotDir, hitLocRel, deathAngVel, shotStrength;
	local float maxDim;
	local string RagSkelName;
	local KarmaParamsSkel skelParams;
	local bool PlayersRagdoll;
	local PlayerController PC;

	// End:0x52F
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x34
		if(OldController != none)
		{
			PC = PlayerController(OldController);
		}
		// End:0x5D
		if((PC != none) && PC.ViewTarget == self)
		{
			PlayersRagdoll = true;
		}
		// End:0xA8
		if(((int(Level.PhysicsDetailLevel) != int(2)) && !PlayersRagdoll) && (Level.TimeSeconds - LastRenderTime) > float(3))
		{
			Destroy();
			return;
		}
		// End:0xC2
		if(RagdollOverride != "")
		{
			RagSkelName = RagdollOverride;			
		}
		else
		{
			// End:0xEB
			if(Species != none)
			{
				RagSkelName = Species.static.GetRagSkelName(GetMeshName());				
			}
			else
			{
				Log("xPawn.PlayDying: No Species");
			}
		}
		// End:0x135
		if(RagSkelName != "")
		{
			// End:0x12D
			if(KRagdollExists(RagSkelName))
			{
				KMakeRagdollAvailable();				
			}
			else
			{
				RagSkelName = "";
			}
		}
		// End:0x52F
		if(KIsRagdollAvailable() && RagSkelName != "")
		{
			skelParams = KarmaParamsSkel(KParams);
			skelParams.KSkeleton = RagSkelName;
			StopAnimating(true);
			// End:0x1E1
			if(DamageType != none)
			{
				// End:0x1A7
				if(DamageType.default.bLeaveBodyEffect)
				{
					TearOffMomentum = vect(0.0000000, 0.0000000, 0.0000000);
				}
				// End:0x1E1
				if(DamageType.default.bKUseOwnDeathVel)
				{
					RagDeathVel = DamageType.default.KDeathVel;
					RagDeathUpKick = DamageType.default.KDeathUpKick;
				}
			}
			shotDir = Normal(TearOffMomentum);
			shotStrength = RagDeathVel * shotDir;
			hitLocRel = TakeHitLocation - Location;
			hitLocRel.X *= RagSpinScale;
			hitLocRel.Y *= RagSpinScale;
			// End:0x257
			if(VSize(TearOffMomentum) < 0.0100000)
			{
				deathAngVel = VRand() * 18000.0000000;				
			}
			else
			{
				deathAngVel = RagInvInertia * (hitLocRel Cross shotStrength);
			}
			// End:0x29E
			if(DamageType.default.bRubbery)
			{
				skelParams.KStartLinVel = vect(0.0000000, 0.0000000, 0.0000000);
			}
			// End:0x2CE
			if(DamageType.default.bKUseTearOffMomentum)
			{
				skelParams.KStartLinVel = TearOffMomentum + Velocity;				
			}
			else
			{
				skelParams.KStartLinVel.X = 0.6000000 * Velocity.X;
				skelParams.KStartLinVel.Y = 0.6000000 * Velocity.Y;
				skelParams.KStartLinVel.Z = 1.0000000 * Velocity.Z;
				skelParams.KStartLinVel += shotStrength;
			}
			// End:0x3AE
			if((!DamageType.default.bLeaveBodyEffect && !DamageType.default.bRubbery) && Velocity.Z > float(-10))
			{
				skelParams.KStartLinVel.Z += RagDeathUpKick;
			}
			// End:0x3F2
			if(DamageType.default.bRubbery)
			{
				Velocity = vect(0.0000000, 0.0000000, 0.0000000);
				skelParams.KStartAngVel = vect(0.0000000, 0.0000000, 0.0000000);				
			}
			else
			{
				skelParams.KStartAngVel = deathAngVel;
				maxDim = float(Max(int(CollisionRadius), int(CollisionHeight)));
				skelParams.KShotStart = TakeHitLocation - (float(1) * shotDir);
				skelParams.KShotEnd = TakeHitLocation + ((float(2) * maxDim) * shotDir);
				skelParams.KShotStrength = RagShootStrength;
			}
			// End:0x4BE
			if((DamageType != none) && DamageType.default.bCauseConvulsions)
			{
				RagConvulseMaterial = DamageType.default.DamageOverlayMaterial;
				skelParams.bKDoConvulsions = true;
			}
			KSetBlockKarma(true);
			SetPhysics(14);
			// End:0x4E4
			if(PlayersRagdoll)
			{
				skelParams.bKImportantRagdoll = true;
			}
			skelParams.bRubbery = DamageType.default.bRubbery;
			bRubbery = DamageType.default.bRubbery;
			skelParams.KActorGravScale = RagGravScale;
			return;
		}
	}
	Velocity += TearOffMomentum;
	BaseEyeHeight = default.BaseEyeHeight;
	SetTwistLook(0, 0);
	SetInvisibility(0.0000000);
	PlayDirectionalDeath(HitLoc);
	SetPhysics(2);
	//return;	
}

simulated function SpawnGibs(Rotator HitRotation, float ChunkPerterbation)
{
	// End:0x0B
	if(bGibbed)
	{
		return;
	}
	bGibbed = true;
	PlayDyingSound();
	// End:0x93
	if((((GibCountTorso + GibCountHead) + GibCountForearm) + GibCountUpperArm) > 3)
	{
		// End:0x7B
		if(Class'Engine.GameInfo'.static.UseLowGore())
		{
			// End:0x78
			if(!Class'Engine.GameInfo'.static.NoBlood())
			{
				Spawn(GibGroupClass.default.LowGoreBloodGibClass,,, Location);
			}			
		}
		else
		{
			Spawn(GibGroupClass.default.BloodGibClass,,, Location);
		}
	}
	// End:0xA7
	if(Class'Engine.GameInfo'.static.UseLowGore())
	{
		return;
	}
	SpawnGiblet(GetGibClass(4), Location, HitRotation, ChunkPerterbation);
	GibCountTorso--;
	J0xCB:

	// End:0xF8 [Loop If]
	if(GibCountTorso-- > 0)
	{
		SpawnGiblet(GetGibClass(4), Location, HitRotation, ChunkPerterbation);
		// [Loop Continue]
		goto J0xCB;
	}
	J0xF8:

	// End:0x125 [Loop If]
	if(GibCountHead-- > 0)
	{
		SpawnGiblet(GetGibClass(3), Location, HitRotation, ChunkPerterbation);
		// [Loop Continue]
		goto J0xF8;
	}
	J0x125:

	// End:0x152 [Loop If]
	if(GibCountForearm-- > 0)
	{
		SpawnGiblet(GetGibClass(5), Location, HitRotation, ChunkPerterbation);
		// [Loop Continue]
		goto J0x125;
	}
	J0x152:

	// End:0x17F [Loop If]
	if(GibCountUpperArm-- > 0)
	{
		SpawnGiblet(GetGibClass(1), Location, HitRotation, ChunkPerterbation);
		// [Loop Continue]
		goto J0x152;
	}
	//return;	
}

function ClientDying(Class<DamageType> DamageType, Vector HitLocation)
{
	//return;	
}

function PlayTakeHit(Vector HitLocation, int Damage, Class<DamageType> DamageType)
{
	local Sound mySound;
	local float mySoundLength;

	PlayDirectionalHit(HitLocation);
	// End:0x2C
	if((Level.TimeSeconds - LastPainSound) < MinTimeBetweenPainSounds)
	{
		return;
	}
	LastPainSound = Level.TimeSeconds;
	// End:0xE0
	if(HeadVolume.bWaterVolume)
	{
		// End:0xC5
		if(ClassIsChildOf(DamageType, Class'GamePlay.Drowned'))
		{
			mySound = GetSound(6);
			mySoundLength = GetSoundDuration(mySound);
			// End:0xA9
			if(mySoundLength > 0.0000000)
			{
				PlaySound(mySound, 2, 1.5000000 * TransientSoundVolume);				
			}
			else
			{
				PlaySound(GetSound(2), 2, 1.5000000 * TransientSoundVolume);
			}			
		}
		else
		{
			PlaySound(GetSound(2), 2, 1.5000000 * TransientSoundVolume);
		}
		return;
	}
	PlaySound(SoundGroupClass.static.GetHitSound(), 2, 2.0000000 * TransientSoundVolume,, 200.0000000);
	//return;	
}

event KImpact(Actor Other, Vector pos, Vector impactVel, Vector impactNorm)
{
	local int numSounds, SoundNum;

	numSounds = RagImpactSounds.Length;
	// End:0x6E
	if((numSounds > 0) && Level.TimeSeconds > (RagLastSoundTime + RagImpactSoundInterval))
	{
		SoundNum = Rand(numSounds);
		PlaySound(RagImpactSounds[SoundNum], 2, RagImpactVolume);
		RagLastSoundTime = Level.TimeSeconds;
	}
	//return;	
}

simulated function PlayDirectionalDeath(Vector HitLoc)
{
	local Vector X, Y, Z, Dir;

	GetAxes(Rotation, X, Y, Z);
	HitLoc.Z = Location.Z;
	// End:0x61
	if((VSize(Velocity) < 10.0000000) && VSize(Location - HitLoc) < 1.0000000)
	{
		Dir = VRand();		
	}
	else
	{
		// End:0x92
		if(VSize(Velocity) > 0.0000000)
		{
			Dir = Normal(Velocity * vect(1.0000000, 1.0000000, 0.0000000));			
		}
		else
		{
			Dir = -Normal(Location - HitLoc);
		}
	}
	// End:0xE8
	if(((Dir Dot X) > 0.7000000) || Dir == vect(0.0000000, 0.0000000, 0.0000000))
	{
		PlayAnim('DeathB',, 0.2000000);		
	}
	else
	{
		// End:0x10F
		if((Dir Dot X) < -0.7000000)
		{
			PlayAnim('DeathF',, 0.2000000);			
		}
		else
		{
			// End:0x134
			if((Dir Dot Y) > float(0))
			{
				PlayAnim('DeathL',, 0.2000000);				
			}
			else
			{
				// End:0x150
				if(HasAnim('DeathR'))
				{
					PlayAnim('DeathR',, 0.2000000);					
				}
				else
				{
					PlayAnim('DeathF',, 0.2000000);
				}
			}
		}
	}
	//return;	
}

simulated function PlayDirectionalHit(Vector HitLoc)
{
	local Vector X, Y, Z, Dir;

	// End:0x0D
	if(DrivenVehicle != none)
	{
		return;
	}
	GetAxes(Rotation, X, Y, Z);
	HitLoc.Z = Location.Z;
	// End:0x5B
	if(VSize(Location - HitLoc) < 1.0000000)
	{
		Dir = VRand();		
	}
	else
	{
		Dir = -Normal(Location - HitLoc);
	}
	// End:0xB1
	if(((Dir Dot X) > 0.7000000) || Dir == vect(0.0000000, 0.0000000, 0.0000000))
	{
		PlayAnim('HitF',, 0.1000000);		
	}
	else
	{
		// End:0xD8
		if((Dir Dot X) < -0.7000000)
		{
			PlayAnim('HitB',, 0.1000000);			
		}
		else
		{
			// End:0xFD
			if((Dir Dot Y) > float(0))
			{
				PlayAnim('HitR',, 0.1000000);				
			}
			else
			{
				PlayAnim('HitL',, 0.1000000);
			}
		}
	}
	//return;	
}

simulated function FootStepping(int Side)
{
	local int SurfaceNum, i;
	local Actor A;
	local Material FloorMat;
	local Vector hl, hn, Start, End, HitLocation, HitNormal;

	SurfaceNum = 0;
	i = 0;
	J0x0E:

	// End:0x150 [Loop If]
	if(i < Touching.Length)
	{
		// End:0x146
		if(((PhysicsVolume(Touching[i]) != none) && PhysicsVolume(Touching[i]).bWaterVolume) || FluidSurfaceInfo(Touching[i]) != none)
		{
			// End:0x89
			if(FRand() < 0.5000000)
			{
				PlaySound(Sound'PlayerSounds.BFootsteps.FootstepWater2', 3, FootstepVolume);				
			}
			else
			{
				PlaySound(Sound'PlayerSounds.BFootsteps.FootstepWater1', 3, FootstepVolume);
			}
			// End:0x144
			if(((!Level.bDropDetail && int(Level.DetailMode) != int(0)) && int(Level.NetMode) != int(NM_DedicatedServer)) && !Touching[i].TraceThisActor(HitLocation, HitNormal, Location - (CollisionHeight * vect(0.0000000, 0.0000000, 1.1000000)), Location))
			{
				Spawn(Class'XGame.WaterRing',,, HitLocation, rot(16384, 0, 0));
			}
			return;
		}
		i++;
		// [Loop Continue]
		goto J0x0E;
	}
	// End:0x166
	if(bIsCrouched || bIsWalking)
	{
		return;
	}
	// End:0x1BA
	if(((Base != none) && !Base.IsA('LevelInfo')) && int(Base.SurfaceType) != 0)
	{
		SurfaceNum = int(Base.SurfaceType);		
	}
	else
	{
		Start = Location - (vect(0.0000000, 0.0000000, 1.0000000) * CollisionHeight);
		End = Start - vect(0.0000000, 0.0000000, 16.0000000);
		A = Trace(hl, hn, End, Start, false,, FloorMat);
		// End:0x23A
		if(FloorMat != none)
		{
			SurfaceNum = int(FloorMat.SurfaceType);
		}
	}
	PlaySound(SoundFootsteps[SurfaceNum], 3, FootstepVolume,, 400.0000000);
	//return;	
}

simulated function PlayFootStepLeft()
{
	PlayFootStep(-1);
	//return;	
}

simulated function PlayFootStepRight()
{
	PlayFootStep(1);
	//return;	
}

function float GetShieldStrengthMax()
{
	return ShieldStrengthMax;
	//return;	
}

function float GetShieldStrength()
{
	return ShieldStrength;
	//return;	
}

function int CanUseShield(int ShieldAmount)
{
	ShieldStrength = float(Max(int(ShieldStrength), 0));
	// End:0x65
	if(ShieldStrength < ShieldStrengthMax)
	{
		// End:0x40
		if(ShieldAmount == 50)
		{
			ShieldAmount = int(float(50) - SmallShieldStrength);
		}
		return int(float(Min(int(ShieldStrengthMax), int(ShieldStrength + float(ShieldAmount)))) - ShieldStrength);
	}
	return 0;
	//return;	
}

function bool AddShieldStrength(int ShieldAmount)
{
	local int OldShieldStrength;

	OldShieldStrength = int(ShieldStrength);
	ShieldStrength += float(CanUseShield(ShieldAmount));
	// End:0x51
	if(ShieldAmount == 50)
	{
		SmallShieldStrength = 50.0000000;
		// End:0x51
		if(ShieldStrength < float(50))
		{
			ShieldStrength = 50.0000000;
		}
	}
	return ShieldStrength != float(OldShieldStrength);
	//return;	
}

function bool InCurrentCombo()
{
	return CurrentCombo != none;
	//return;	
}

function DoComboName(string ComboClassName)
{
	local Class<Combo> ComboClass;

	ComboClass = Class<Combo>(DynamicLoadObject(ComboClassName, Class'Core.Class'));
	// End:0x34
	if(ComboClass != none)
	{
		DoCombo(ComboClass);		
	}
	else
	{
		Log("WARNING - Couldn't create combo " $ ComboClassName);
	}
	//return;	
}

function DoCombo(Class<Combo> ComboClass)
{
	local int i;

	// End:0x10B
	if(ComboClass != none)
	{
		// End:0x10B
		if(CurrentCombo == none)
		{
			CurrentCombo = Spawn(ComboClass, self);
			UnrealMPGameInfo(Level.Game).SpecialEvent(PlayerReplicationInfo, "" $ string(CurrentCombo.Class));
			// End:0x7D
			if(ComboClass.Name == 'ComboSpeed')
			{
				i = 0;				
			}
			else
			{
				// End:0x9F
				if(ComboClass.Name == 'ComboBerserk')
				{
					i = 1;					
				}
				else
				{
					// End:0xC2
					if(ComboClass.Name == 'ComboDefensive')
					{
						i = 2;						
					}
					else
					{
						// End:0xE5
						if(ComboClass.Name == 'ComboInvis')
						{
							i = 3;							
						}
						else
						{
							i = 4;
						}
					}
				}
			}
			TeamPlayerReplicationInfo(PlayerReplicationInfo).Combos[i] += byte(1);
		}
	}
	//return;	
}

simulated function bool HasUDamage()
{
	return UDamageTime > Level.TimeSeconds;
	//return;	
}

function ClientSetUDamageTime(float NewUDam)
{
	UDamageTime = Level.TimeSeconds + NewUDam;
	//return;	
}

function EnableUDamage(float Amount)
{
	UDamageTime = FMax(UDamageTime, Level.TimeSeconds + Amount);
	ClientSetUDamageTime(UDamageTime - Level.TimeSeconds);
	// End:0x57
	if(UDamageTimer == none)
	{
		UDamageTimer = Spawn(Class'XGame.UDamageTimer', self);
	}
	UDamageTimer.SetTimer((UDamageTime - Level.TimeSeconds) - float(3), false);
	LightType = 1;
	bDynamicLight = true;
	SetWeaponOverlay(UDamageWeaponMaterial, UDamageTime - Level.TimeSeconds, false);
	//return;	
}

function DisableUDamage()
{
	LightType = 0;
	bDynamicLight = false;
	UDamageTime = Level.TimeSeconds - float(1);
	ClientSetUDamageTime(-1.0000000);
	SetWeaponOverlay(UDamageWeaponMaterial, UDamageTime - Level.TimeSeconds, false);
	//return;	
}

function SetWeaponOverlay(Material mat, float Time, bool override)
{
	// End:0x70
	if(Weapon != none)
	{
		Weapon.SetOverlayMaterial(mat, Time, override);
		// End:0x70
		if(WeaponAttachment(Weapon.ThirdPersonActor) != none)
		{
			WeaponAttachment(Weapon.ThirdPersonActor).SetOverlayMaterial(mat, Time, override);
		}
	}
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

function ServerChangedWeapon(Weapon OldWeapon, Weapon newWeapon)
{
	local float InvisTime;

	// End:0x50
	if(bInvis)
	{
		// End:0x45
		if((OldWeapon != none) && OldWeapon.OverlayMaterial == InvisMaterial)
		{
			InvisTime = OldWeapon.ClientOverlayCounter;			
		}
		else
		{
			InvisTime = 20000.0000000;
		}
	}
	// End:0x71
	if((HasUDamage()) || bInvis)
	{
		SetWeaponOverlay(none, 0.0000000, true);
	}
	super(Pawn).ServerChangedWeapon(OldWeapon, newWeapon);
	// End:0x9E
	if(bInvis)
	{
		SetWeaponOverlay(InvisMaterial, InvisTime, true);		
	}
	else
	{
		// End:0xC8
		if(HasUDamage())
		{
			SetWeaponOverlay(UDamageWeaponMaterial, UDamageTime - Level.TimeSeconds, false);
		}
	}
	// End:0x10F
	if(Weapon != none)
	{
		// End:0xEE
		if(bBerserk)
		{
			Weapon.StartBerserk();			
		}
		else
		{
			// End:0x10F
			if(Weapon.bBerserk)
			{
				Weapon.StopBerserk();
			}
		}
	}
	//return;	
}

function SetInvisibility(float Time)
{
	bInvis = Time > 0.0000000;
	// End:0xC9
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x84
		if(bInvis)
		{
			// End:0x68
			if((Time == 2000000.0000000) && Level.Game.IsA('xMutantGame'))
			{
				Visibility = default.Visibility;				
			}
			else
			{
				Visibility = 1;
			}
			SetWeaponOverlay(InvisMaterial, Time, true);			
		}
		else
		{
			Visibility = default.Visibility;
			// End:0xBC
			if(HasUDamage())
			{
				SetWeaponOverlay(UDamageWeaponMaterial, UDamageTime - Level.TimeSeconds, true);				
			}
			else
			{
				SetWeaponOverlay(none, 0.0000000, true);
			}
		}
	}
	//return;	
}

function Vector BotDodge(Vector Dir)
{
	local Vector Vel;

	Vel = (DodgeSpeedFactor * GroundSpeed) * Dir;
	Vel.Z = DodgeSpeedZ;
	return Vel;
	//return;	
}

function bool Dodge(Actor.EDoubleClickDir DoubleClickMove)
{
	local Vector X, Y, Z, TraceStart, TraceEnd, Dir,
		Cross, HitLocation, HitNormal;

	local Actor HitActor;
	local Rotator TurnRot;

	// End:0x3A
	if((bIsCrouched || bWantsToCrouch) || (int(Physics) != int(1)) && int(Physics) != int(2))
	{
		return false;
	}
	TurnRot.Yaw = Rotation.Yaw;
	GetAxes(TurnRot, X, Y, Z);
	// End:0x1A3
	if(int(Physics) == int(2))
	{
		// End:0x82
		if(!bCanWallDodge)
		{
			return false;
		}
		// End:0xA2
		if(int(DoubleClickMove) == int(3))
		{
			TraceEnd = -X;			
		}
		else
		{
			// End:0xC0
			if(int(DoubleClickMove) == int(4))
			{
				TraceEnd = X;				
			}
			else
			{
				// End:0xDE
				if(int(DoubleClickMove) == int(1))
				{
					TraceEnd = Y;					
				}
				else
				{
					// End:0xFB
					if(int(DoubleClickMove) == int(2))
					{
						TraceEnd = -Y;
					}
				}
			}
		}
		TraceStart = (Location - (CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000))) + (TraceEnd * CollisionRadius);
		TraceEnd = TraceStart + (TraceEnd * 32.0000000);
		HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart, false, vect(1.0000000, 1.0000000, 1.0000000));
		// End:0x1A3
		if((HitActor == none) || !HitActor.bWorldGeometry && Mover(HitActor) == none)
		{
			return false;
		}
	}
	// End:0x1CC
	if(int(DoubleClickMove) == int(3))
	{
		Dir = X;
		Cross = Y;		
	}
	else
	{
		// End:0x1FE
		if(int(DoubleClickMove) == int(4))
		{
			Dir = float(-1) * X;
			Cross = Y;			
		}
		else
		{
			// End:0x230
			if(int(DoubleClickMove) == int(1))
			{
				Dir = float(-1) * Y;
				Cross = X;				
			}
			else
			{
				// End:0x256
				if(int(DoubleClickMove) == int(2))
				{
					Dir = Y;
					Cross = X;
				}
			}
		}
	}
	// End:0x279
	if(AIController(Controller) != none)
	{
		Cross = vect(0.0000000, 0.0000000, 0.0000000);
	}
	return PerformDodge(DoubleClickMove, Dir, Cross);
	//return;	
}

function bool PerformDodge(Actor.EDoubleClickDir DoubleClickMove, Vector Dir, Vector Cross)
{
	local float VelocityZ;
	local name Anim;

	// End:0xF2
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
		TakeFallingDamage();
		// End:0xF2
		if(Velocity.Z < (-DodgeSpeedZ * 0.5000000))
		{
			Velocity.Z += (DodgeSpeedZ * 0.5000000);
		}
	}
	VelocityZ = Velocity.Z;
	Velocity = ((DodgeSpeedFactor * GroundSpeed) * Dir) + ((Velocity Dot Cross) * Cross);
	// End:0x142
	if(!bCanDodgeDoubleJump)
	{
		MultiJumpRemaining = 0;
	}
	// End:0x17D
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
	PlayOwnedSound(GetSound(8), 2, GruntVolume,, 80.0000000);
	return true;
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
			PlayOwnedSound(GetSound(9), 2, GruntVolume,, 80.0000000);
		}
	}
	//return;	
}

function bool CanDoubleJump()
{
	return (MultiJumpRemaining > 0) && int(Physics) == int(2);
	//return;	
}

function bool CanMultiJump()
{
	return MaxMultiJump > 0;
	//return;	
}

function bool DoJump(bool bUpdating)
{
	// End:0x74
	if(((!bUpdating && CanDoubleJump()) && Abs(Velocity.Z) < float(100)) && IsLocallyControlled())
	{
		// End:0x5E
		if(PlayerController(Controller) != none)
		{
			PlayerController(Controller).bDoubleJump = true;
		}
		DoDoubleJump(bUpdating);
		MultiJumpRemaining -= 1;
		return true;
	}
	// End:0xAB
	if(super(Pawn).DoJump(bUpdating))
	{
		// End:0xA9
		if(!bUpdating)
		{
			PlayOwnedSound(GetSound(3), 2, GruntVolume,, 80.0000000);
		}
		return true;
	}
	return false;
	//return;	
}

simulated function NotifyTeamChanged()
{
	PostNetReceive();
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x2F
	if(ForceDefaultCharacter())
	{
		Setup(Class'XGame.xUtil'.static.FindPlayerRecord(GetDefaultCharacter()));
		bNetNotify = false;		
	}
	else
	{
		// End:0x68
		if(PlayerReplicationInfo != none)
		{
			Setup(Class'XGame.xUtil'.static.FindPlayerRecord(PlayerReplicationInfo.CharacterName));
			bNetNotify = false;			
		}
		else
		{
			// End:0xBD
			if((DrivenVehicle != none) && DrivenVehicle.PlayerReplicationInfo != none)
			{
				Setup(Class'XGame.xUtil'.static.FindPlayerRecord(DrivenVehicle.PlayerReplicationInfo.CharacterName));
				bNetNotify = false;
			}
		}
	}
	//return;	
}

simulated function ClientReStart()
{
	super(Pawn).ClientReStart();
	// End:0x1C
	if(Controller != none)
	{
		OldController = Controller;
	}
	//return;	
}

simulated function bool CheckValidFemaleDefault()
{
	return ((((((PlacedFemaleCharacterName ~= "Tamika") || PlacedFemaleCharacterName ~= "Sapphire") || PlacedFemaleCharacterName ~= "Enigma") || PlacedFemaleCharacterName ~= "Cathode") || PlacedFemaleCharacterName ~= "Rylisa") || PlacedFemaleCharacterName ~= "Ophelia") || PlacedFemaleCharacterName ~= "Zarina";
	//return;	
}

simulated function bool CheckValidMaleDefault()
{
	return ((((((PlacedCharacterName ~= "Jakob") || PlacedCharacterName ~= "Gorge") || PlacedCharacterName ~= "Malcolm") || PlacedCharacterName ~= "Xan") || PlacedCharacterName ~= "Brock") || PlacedCharacterName ~= "Gaargod") || PlacedCharacterName ~= "Axon";
	//return;	
}

simulated function bool ForceDefaultCharacter()
{
	local PlayerController P;

	// End:0x16
	if(!Class'UnrealGame.DeathMatch'.default.bForceDefaultCharacter)
	{
		return false;
	}
	P = Level.GetLocalPlayerController();
	// End:0xD9
	if((P != none) && P.PlayerReplicationInfo != none)
	{
		// End:0xA2
		if(P.PlayerReplicationInfo.bIsFemale)
		{
			PlacedFemaleCharacterName = P.PlayerReplicationInfo.CharacterName;
			// End:0x9F
			if(!CheckValidFemaleDefault())
			{
				PlacedFemaleCharacterName = "Tamika";
				return false;
			}			
		}
		else
		{
			PlacedCharacterName = P.PlayerReplicationInfo.CharacterName;
			// End:0xD9
			if(!CheckValidMaleDefault())
			{
				PlacedCharacterName = "Jakob";
				return false;
			}
		}
	}
	return true;
	//return;	
}

simulated function string GetDefaultCharacter()
{
	// End:0x30
	if(Level.IsDemoBuild())
	{
		PlacedFemaleCharacterName = "Tamika";
		PlacedCharacterName = "Jakob";		
	}
	else
	{
		// End:0x49
		if(!CheckValidFemaleDefault())
		{
			PlacedFemaleCharacterName = "Tamika";
		}
		// End:0x61
		if(!CheckValidMaleDefault())
		{
			PlacedCharacterName = "Jakob";
		}
	}
	// End:0x89
	if((PlayerReplicationInfo != none) && PlayerReplicationInfo.bIsFemale)
	{
		return PlacedFemaleCharacterName;		
	}
	else
	{
		return PlacedCharacterName;
	}
	//return;	
}

simulated function Setup(PlayerRecord Rec, optional bool bLoadNow)
{
	// End:0x36
	if((Rec.Species == none) || ForceDefaultCharacter())
	{
		Rec = Class'XGame.xUtil'.static.FindPlayerRecord(GetDefaultCharacter());
	}
	Species = Rec.Species;
	RagdollOverride = Rec.Ragdoll;
	// End:0xA7
	if(!Species.static.Setup(self, Rec))
	{
		Rec = Class'XGame.xUtil'.static.FindPlayerRecord(GetDefaultCharacter());
		// End:0xA7
		if(!Species.static.Setup(self, Rec))
		{
			return;
		}
	}
	ResetPhysicsBasedAnim();
	//return;	
}

simulated function ResetPhysicsBasedAnim()
{
	bIsIdle = false;
	bWaitForAnim = false;
	//return;	
}

function Sound GetSound(xPawnSoundGroup.ESoundType soundType)
{
	return SoundGroupClass.static.GetSound(soundType);
	//return;	
}

function Class<Gib> GetGibClass(xPawnGibGroup.EGibType gibType)
{
	return GibGroupClass.static.GetGibClass(gibType);
	//return;	
}

simulated function DoDerezEffect()
{
	Spawn(TeleportFXClass);
	//return;	
}

state Dying
{
	simulated function AnimEnd(int Channel)
	{
		ReduceCylinder();
		//return;		
	}

	event FellOutOfWorld(Actor.eKillZType KillType)
	{
		local LavaDeath LD;

		// End:0x9B
		if(int(KillType) == int(1))
		{
			// End:0x99
			if(!bSkeletized)
			{
				// End:0x3A
				if(SkeletonMesh != none)
				{
					LinkMesh(SkeletonMesh, true);
					Skins.Length = 0;
				}
				bSkeletized = true;
				LD = Spawn(Class'XEffects.LavaDeath',,, Location + vect(0.0000000, 0.0000000, 10.0000000), Rotation);
				// End:0x83
				if(LD != none)
				{
					LD.SetBase(self);
				}
				PlaySound(Sound'WeaponSounds.BaseImpactAndExplosions.BExplosion5', 0, 1.5000000 * TransientSoundVolume);
			}
			return;
		}
		super.FellOutOfWorld(KillType);
		//return;		
	}

	function LandThump()
	{
		// End:0x23
		if(int(Physics) == int(0))
		{
			bThumped = true;
			PlaySound(GetSound(1));
		}
		//return;		
	}

	simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
	{
		local Vector SelfToHit, SelfToInstigator, CrossPlaneNormal;
		local float W, YawDir;
		local Vector HitNormal, shotDir, PushLinVel, PushAngVel;
		local name HitBone;
		local float HitBoneDist;
		local int MaxCorpseYawRate;

		// End:0x16
		if(bFrozenBody || bRubbery)
		{
			return;
		}
		// End:0x29E
		if(int(Physics) == int(14))
		{
			// End:0x3C
			if(bDeRes || bRubbery)
			{
				return;
			}
			// End:0xC1
			if((DamageType != none) && DamageType.default.bThrowRagdoll)
			{
				shotDir = Normal(Momentum);
				PushLinVel = (RagDeathVel * shotDir) + vect(0.0000000, 0.0000000, 250.0000000);
				PushAngVel = Normal(shotDir Cross vect(0.0000000, 0.0000000, 1.0000000)) * float(-18000);
				KSetSkelVel(PushLinVel, PushAngVel);				
			}
			else
			{
				// End:0x203
				if((DamageType != none) && DamageType.default.bRagdollBullet)
				{
					// End:0x112
					if(Momentum == vect(0.0000000, 0.0000000, 0.0000000))
					{
						Momentum = HitLocation - instigatedBy.Location;
					}
					// End:0x1AC
					if(FRand() < 0.6500000)
					{
						// End:0x143
						if(Velocity.Z <= float(0))
						{
							PushLinVel = vect(0.0000000, 0.0000000, 40.0000000);
						}
						PushAngVel = Normal(Normal(Momentum) Cross vect(0.0000000, 0.0000000, 1.0000000)) * float(-8000);
						PushAngVel.X *= 0.5000000;
						PushAngVel.Y *= 0.5000000;
						PushAngVel.Z *= float(4);
						KSetSkelVel(PushLinVel, PushAngVel);
					}
					PushLinVel = RagShootStrength * Normal(Momentum);
					KAddImpulse(PushLinVel, HitLocation);
					// End:0x200
					if((LifeSpan > float(0)) && LifeSpan < (DeResTime + float(2)))
					{
						LifeSpan += 0.2000000;
					}					
				}
				else
				{
					PushLinVel = RagShootStrength * Normal(Momentum);
					KAddImpulse(PushLinVel, HitLocation);
				}
			}
			// End:0x29C
			if((((DamageType != none) && DamageType.default.DamageOverlayMaterial != none) && int(Level.DetailMode) != int(0)) && !Level.bDropDetail)
			{
				SetOverlayMaterial(DamageType.default.DamageOverlayMaterial, DamageType.default.DamageOverlayTime, true);
			}
			return;
		}
		// End:0x2F5
		if((((DamageType != none) && DamageType.default.bFastInstantHit) && (GetAnimSequence()) == 'Death_Spasm') && RepeaterDeathCount < 6)
		{
			PlayAnim('Death_Spasm',, 0.2000000);
			RepeaterDeathCount++;			
		}
		else
		{
			// End:0x587
			if(Damage > 0)
			{
				// End:0x3E5
				if(instigatedBy != none)
				{
					// End:0x343
					if(instigatedBy.IsA('xPawn') && xPawn(instigatedBy).bBerserk)
					{
						Damage *= float(2);
					}
					// End:0x3E5
					if(instigatedBy.Location != Location)
					{
						SelfToInstigator = instigatedBy.Location - Location;
						SelfToHit = HitLocation - Location;
						CrossPlaneNormal = Normal(SelfToInstigator Cross vect(0.0000000, 0.0000000, 1.0000000));
						W = CrossPlaneNormal Dot Location;
						// End:0x3DA
						if((HitLocation Dot CrossPlaneNormal) < W)
						{
							YawDir = -1.0000000;							
						}
						else
						{
							YawDir = 1.0000000;
						}
					}
				}
				// End:0x42B
				if(VSize(Momentum) < float(10))
				{
					Momentum = (-Normal(SelfToInstigator) * float(Damage)) * 1000.0000000;
					Momentum.Z = Abs(Momentum.Z);
				}
				SetPhysics(2);
				Momentum = Momentum / Mass;
				AddVelocity(Momentum);
				bBounce = true;
				RotationRate.Pitch = 0;
				RotationRate.Yaw += int(VSize(Momentum) * YawDir);
				MaxCorpseYawRate = 150000;
				RotationRate.Yaw = Clamp(RotationRate.Yaw, -MaxCorpseYawRate, MaxCorpseYawRate);
				RotationRate.Roll = 0;
				bFixedRotationDir = true;
				bRotateToDesired = false;
				Health -= Damage;
				CalcHitLoc(HitLocation, vect(0.0000000, 0.0000000, 0.0000000), HitBone, HitBoneDist);
				// End:0x53C
				if(instigatedBy != none)
				{
					HitNormal = Normal((Normal(instigatedBy.Location - HitLocation) + (VRand() * 0.2000000)) + vect(0.0000000, 0.0000000, 2.8000000));					
				}
				else
				{
					HitNormal = Normal((vect(0.0000000, 0.0000000, 1.0000000) + (VRand() * 0.2000000)) + vect(0.0000000, 0.0000000, 2.8000000));
				}
				DoDamageFX(HitBone, Damage, DamageType, Rotator(HitNormal));
			}
		}
		//return;		
	}

	simulated function BeginState()
	{
		super.BeginState();
		AmbientSound = none;
		//return;		
	}

	simulated function Timer()
	{
		local KarmaParamsSkel skelParams;

		// End:0x0E
		if(!PlayerCanSeeMe())
		{
			Destroy();			
		}
		else
		{
			// End:0xD8
			if((LifeSpan <= DeResTime) && bDeRes == false)
			{
				skelParams = KarmaParamsSkel(KParams);
				// End:0xBE
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
		}
		//return;		
	}

	event KVelDropBelow()
	{
		local float NewLifeSpan;

		// End:0x38
		if(bDeRes == false)
		{
			NewLifeSpan = DeResTime + 3.5000000;
			// End:0x38
			if(NewLifeSpan < LifeSpan)
			{
				LifeSpan = NewLifeSpan;
			}
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	bCanDodgeDoubleJump=true
	UDamageWeaponMaterial=Shader'XGameShaders.PlayerShaders.WeaponUDamageShader'
	UDamageSound=Sound'GameSounds.UDamageFire'
	InvisMaterial=FinalBlend'XEffectMat.Combos.InvisOverlayFB'
	ShieldStrengthMax=150.0000000
	ShieldHitMat=Shader'XGameShaders.PlayerShaders.PlayerShieldSh'
	ShieldHitMatTime=1.0000000
	Species=Class'XGame.SPECIES_Merc'
	GruntVolume=0.1800000
	FootstepVolume=0.1500000
	GibGroupClass=Class'XEffects.xPawnGibGroup'
	GibCountCalf=4
	GibCountForearm=2
	GibCountHead=2
	GibCountTorso=2
	GibCountUpperArm=2
	MinTimeBetweenPainSounds=0.3500000
	SoundFootsteps[0]=SoundGroup'PlayerSounds.Final.FootstepDefault'
	SoundFootsteps[1]=SoundGroup'PlayerSounds.Final.FootstepRock'
	SoundFootsteps[2]=SoundGroup'PlayerSounds.Final.FootstepDirt'
	SoundFootsteps[3]=SoundGroup'PlayerSounds.Final.FootstepMetal'
	SoundFootsteps[4]=SoundGroup'PlayerSounds.Final.FootstepWood'
	SoundFootsteps[5]=SoundGroup'PlayerSounds.Final.FootstepPlant'
	SoundFootsteps[6]=SoundGroup'PlayerSounds.Final.FootstepFlesh'
	SoundFootsteps[7]=SoundGroup'PlayerSounds.Final.FootstepIce'
	SoundFootsteps[8]=SoundGroup'PlayerSounds.Final.FootstepSnow'
	SoundFootsteps[9]=SoundGroup'PlayerSounds.Final.FootstepWater'
	SoundFootsteps[10]=SoundGroup'PlayerSounds.Final.FootstepGlass'
	SoundGroupClass=Class'XGame.xMercMaleSoundGroup'
	TeleportFXClass=Class'XEffects.TransEffect'
	TransEffects[0]=Class'XEffects.NewTransEffect'
	TransEffects[1]=Class'XEffects.NewTransEffectBlue'
	MultiJumpRemaining=1
	MaxMultiJump=1
	MultiJumpBoost=25
	WallDodgeAnims[0]="WallDodgeF"
	WallDodgeAnims[1]="WallDodgeB"
	WallDodgeAnims[2]="WallDodgeL"
	WallDodgeAnims[3]="WallDodgeR"
	IdleHeavyAnim="Idle_Biggun"
	IdleRifleAnim="Idle_Rifle"
	FireHeavyRapidAnim="Biggun_Burst"
	FireHeavyBurstAnim="Biggun_Aimed"
	FireRifleRapidAnim="Rifle_Burst"
	FireRifleBurstAnim="Rifle_Aimed"
	FireRootBone="bip01 Spine"
	DeResTime=6.0000000
	DeResMat0=FinalBlend'DeRez.Shaders.DeRezFinalBody'
	DeResMat1=FinalBlend'DeRez.Shaders.DeRezFinalHead'
	DeResLiftVel=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=2.5000000,OutVal=32.0000000),(InVal=100.0000000,OutVal=32.0000000)))
	DeResLiftSoftness=(Points=((InVal=0.0000000,OutVal=0.3000000),(InVal=2.5000000,OutVal=0.0500000),(InVal=100.0000000,OutVal=0.0500000)))
	DeResLateralFriction=0.3000000
	RagdollLifeSpan=13.0000000
	RagInvInertia=4.0000000
	RagDeathVel=200.0000000
	RagShootStrength=8000.0000000
	RagSpinScale=2.5000000
	RagDeathUpKick=150.0000000
	RagGravScale=1.0000000
	RagImpactSounds[0]=Sound'GeneralImpacts.Wet.Breakbone_01'
	RagImpactSounds[1]=Sound'GeneralImpacts.Wet.Breakbone_02'
	RagImpactSounds[2]=Sound'GeneralImpacts.Wet.Breakbone_03'
	RagImpactSoundInterval=0.5000000
	RagImpactVolume=2.5000000
	TransOutEffect[0]=Class'XEffects.NewTransDeresRed'
	TransOutEffect[1]=Class'XEffects.NewTransDeresBlue'
	PlacedCharacterName="Jakob"
	PlacedFemaleCharacterName="Tamika"
	RequiredEquipment[0]="XWeapons.AssaultRifle"
	RequiredEquipment[1]="XWeapons.ShieldGun"
	VoiceType="xGame.MercMaleVoice"
	bCanWallDodge=true
	bNoCoronas=false
	GroundSpeed=440.0000000
	WaterSpeed=220.0000000
	AirSpeed=440.0000000
	JumpZ=340.0000000
	WalkingPct=0.4000000
	CrouchedPct=0.4000000
	BaseEyeHeight=38.0000000
	EyeHeight=38.0000000
	CrouchHeight=29.0000000
	CrouchRadius=25.0000000
	ControllerClass=Class'XGame.xBot'
	bPhysicsAnimUpdate=true
	bDoTorsoTwist=true
	MovementAnims[0]="RunF"
	MovementAnims[1]="RunB"
	MovementAnims[2]="RunL"
	MovementAnims[3]="RunR"
	TurnLeftAnim="TurnL"
	TurnRightAnim="TurnR"
	DodgeSpeedFactor=1.5000000
	DodgeSpeedZ=210.0000000
	SwimAnims[0]="SwimF"
	SwimAnims[1]="SwimB"
	SwimAnims[2]="SwimL"
	SwimAnims[3]="SwimR"
	CrouchAnims[0]="CrouchF"
	CrouchAnims[1]="CrouchB"
	CrouchAnims[2]="CrouchL"
	CrouchAnims[3]="CrouchR"
	WalkAnims[0]="WalkF"
	WalkAnims[1]="WalkB"
	WalkAnims[2]="WalkL"
	WalkAnims[3]="WalkR"
	AirAnims[0]="JumpF_Mid"
	AirAnims[1]="JumpB_Mid"
	AirAnims[2]="JumpL_Mid"
	AirAnims[3]="JumpR_Mid"
	TakeoffAnims[0]="JumpF_Takeoff"
	TakeoffAnims[1]="JumpB_Takeoff"
	TakeoffAnims[2]="JumpL_Takeoff"
	TakeoffAnims[3]="JumpR_Takeoff"
	LandAnims[0]="JumpF_Land"
	LandAnims[1]="JumpB_Land"
	LandAnims[2]="JumpL_Land"
	LandAnims[3]="JumpR_Land"
	DoubleJumpAnims[0]="DoubleJumpF"
	DoubleJumpAnims[1]="DoubleJumpB"
	DoubleJumpAnims[2]="DoubleJumpL"
	DoubleJumpAnims[3]="DoubleJumpR"
	DodgeAnims[0]="DodgeF"
	DodgeAnims[1]="DodgeB"
	DodgeAnims[2]="DodgeL"
	DodgeAnims[3]="DodgeR"
	AirStillAnim="Jump_Mid"
	TakeoffStillAnim="Jump_Takeoff"
	CrouchTurnRightAnim="Crouch_TurnR"
	CrouchTurnLeftAnim="Crouch_TurnL"
	IdleCrouchAnim="Crouch"
	IdleSwimAnim="Swim_Tread"
	IdleWeaponAnim="Idle_Rifle"
	IdleRestAnim="Idle_Rest"
	IdleChatAnim="idle_chat"
	RootBone="Bip01"
	HeadBone="Bip01 Head"
	SpineBone1="Bip01 Spine1"
	SpineBone2="bip01 Spine2"
	LightHue=204
	LightSaturation=0
	LightBrightness=255.0000000
	LightRadius=3.0000000
	bActorShadows=true
	bDramaticLighting=true
	Mesh=SkeletalMesh'ThunderCrash.JakobM'
	LODBias=1.8000000
	Texture=Texture'XEffects.RedMarker_t'
	PrePivot=(X=0.0000000,Y=0.0000000,Z=-5.0000000)
	Skins[0]=Texture'DemoPlayerSkins.Jakob_Body'
	Skins[1]=Texture'DemoPlayerSkins.Jakob_NewHead'
	MaxLights=8
	CollisionRadius=25.0000000
	CollisionHeight=44.0000000
	bNetNotify=true
	RotationRate=(Pitch=3072,Yaw=20000,Roll=2048)
	// Reference: KarmaParamsSkel'XGame.xPawn.PawnKParams'
	begin object name="PawnKParams" class=Engine.KarmaParamsSkel
		KConvulseSpacing=(Min=0.5000000,Max=2.2000000)
		KLinearDamping=0.1500000
		KAngularDamping=0.0500000
		KBuoyancy=1.0000000
		KStartEnabled=true
		KVelDropBelowThreshold=50.0000000
		bHighDetailOnly=false
		KFriction=0.6000000
		KRestitution=0.3000000
		KImpactThreshold=500.0000000
	end object
	KParams=PawnKParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: KarmaParamsSkel'XGame.xPawn.PawnKParams'
begin object name="PawnKParams" class=Engine.KarmaParamsSkel
	KConvulseSpacing=(Min=0.5000000,Max=2.2000000)
	KLinearDamping=0.1500000
	KAngularDamping=0.0500000
	KBuoyancy=1.0000000
	KStartEnabled=true
	KVelDropBelowThreshold=50.0000000
	bHighDetailOnly=false
	KFriction=0.6000000
	KRestitution=0.3000000
	KImpactThreshold=500.0000000
end object
