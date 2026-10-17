class LinkGun extends Weapon
	config(User);

var() int Links;
var() bool Linking;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		Linking, Links;
}

simulated function UpdateLinkColor(LinkAttachment.ELinkColor Color)
{
	// End:0x28
	if(FireMode[1] != none)
	{
		LinkFire(FireMode[1]).UpdateLinkColor(Color);
	}
	// End:0x39
	if(Mesh == OldMesh)
	{
		return;
	}
	switch(Color)
	{
		// End:0x62
		case 0:
			Skins[0] = Shader'UT2004Weapons.Shaders.LinkGunShader';
			Skins[1] = Shader'UT2004Weapons.Shaders.PowerPulseShader';
			// End:0xCB
			break;
		// End:0x84
		case 1:
			Skins[0] = Shader'UT2004Weapons.Shaders.LinkGunRedShader';
			Skins[1] = Shader'UT2004Weapons.Shaders.PowerPulseShaderRed';
			// End:0xCB
			break;
		// End:0xA6
		case 2:
			Skins[0] = Shader'UT2004Weapons.Shaders.LinkGunBlueShader';
			Skins[1] = Shader'UT2004Weapons.Shaders.PowerPulseShaderBlue';
			// End:0xCB
			break;
		// End:0xC8
		case 3:
			Skins[0] = Shader'UT2004Weapons.Shaders.LinkGunYellowShader';
			Skins[1] = Shader'UT2004Weapons.Shaders.PowerPulseShaderYellow';
			// End:0xCB
			break;
		// End:0xFFFF
		default:
			break;
	}
	//return;	
}

simulated function bool HasAmmo()
{
	return ((AmmoClass[0] != none) && FireMode[0] != none) && AmmoCharge[0] >= 1;
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	// End:0x71
	if(((FireMode[1] != none) && !FireMode[1].bIsFiring) && LinkAttachment(ThirdPersonActor) != none)
	{
		// End:0x5B
		if(Links > 0)
		{
			LinkAttachment(ThirdPersonActor).SetLinkColor(3);			
		}
		else
		{
			LinkAttachment(ThirdPersonActor).SetLinkColor(0);
		}
	}
	super.RenderOverlays(Canvas);
	//return;	
}

simulated function Vector GetEffectStart()
{
	local Vector X, Y, Z, offset;
	local float Extra;

	// End:0x12F
	if(Instigator.IsFirstPerson())
	{
		// End:0x22
		if(WeaponCentered())
		{
			return CenteredEffectStart();
		}
		GetViewAxes(X, Y, Z);
		// End:0x57
		if(Class'Engine.PlayerController'.default.bSmallWeapons)
		{
			offset = SmallEffectOffset;			
		}
		else
		{
			offset = EffectOffset;
		}
		// End:0xA9
		if(hand == float(0))
		{
			// End:0x8B
			if(bUseOldWeaponMesh)
			{
				offset.Z -= float(10);				
			}
			else
			{
				offset.Z -= float(14);
			}
			Extra = 3.0000000;			
		}
		else
		{
			// End:0xC4
			if(!bUseOldWeaponMesh)
			{
				offset.Z -= float(10);
			}
		}
		return (((Instigator.Location + Instigator.CalcDrawOffset(self)) + (offset.X * X)) + (((offset.Y * hand) + Extra) * Y)) + (offset.Z * Z);		
	}
	else
	{
		return (Instigator.Location + (Instigator.EyeHeight * vect(0.0000000, 0.0000000, 0.5000000))) + (Vector(Instigator.Rotation) * 40.0000000);
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x39
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x39
		if(LinkFire(FireMode[1]) != none)
		{
			LinkFire(FireMode[1]).SetLinkTo(none);
		}
	}
	super.Destroyed();
	//return;	
}

simulated function bool StartFire(int Mode)
{
	local SquadAI S;
	local Bot B;
	local Vector AimDir;

	// End:0x1D0
	if(((int(Role) == int(ROLE_Authority)) && PlayerController(Instigator.Controller) != none) && UnrealTeamInfo(Instigator.PlayerReplicationInfo.Team) != none)
	{
		S = UnrealTeamInfo(Instigator.PlayerReplicationInfo.Team).AI.GetSquadLedBy(Instigator.Controller);
		// End:0x1D0
		if(S != none)
		{
			AimDir = Vector(Instigator.Controller.Rotation);
			B = S.SquadMembers;
			J0xD0:

			// End:0x1D0 [Loop If]
			if(B != none)
			{
				// End:0x1B9
				if(((((HoldSpot(B.GoalScript) == none) && B.Pawn != none) && LinkGun(B.Pawn.Weapon) != none) && B.Pawn.Weapon.FocusOnLeader(true)) && (AimDir Dot Normal(B.Pawn.Location - Instigator.Location)) < 0.9000000)
				{
					B.Focus = Instigator;
					B.FireWeaponAt(Instigator);
				}
				B = B.NextSquadMember;
				// [Loop Continue]
				goto J0xD0;
			}
		}
	}
	return super.StartFire(Mode);
	//return;	
}

function bool FocusOnLeader(bool bLeaderFiring)
{
	local Bot B;
	local Pawn LeaderPawn;
	local Actor Other;
	local Vector HitLocation, HitNormal, StartTrace;
	local Vehicle V;

	B = Bot(Instigator.Controller);
	// End:0x26
	if(B == none)
	{
		return false;
	}
	// End:0x71
	if(PlayerController(B.Squad.SquadLeader) != none)
	{
		LeaderPawn = B.Squad.SquadLeader.Pawn;		
	}
	else
	{
		V = B.Squad.GetLinkVehicle(B);
		// End:0x113
		if(V != none)
		{
			LeaderPawn = V;
			bLeaderFiring = ((float(LeaderPawn.Health) < LeaderPawn.HealthMax) && V.LinkHealMult > float(0)) && (B.Enemy == none) || V.bKeyVehicle;
		}
	}
	// End:0x151
	if(LeaderPawn == none)
	{
		LeaderPawn = B.Squad.SquadLeader.Pawn;
		// End:0x151
		if(LeaderPawn == none)
		{
			return false;
		}
	}
	// End:0x193
	if(!bLeaderFiring && (LeaderPawn.Weapon == none) || !LeaderPawn.Weapon.IsFiring())
	{
		return false;
	}
	// End:0x2B0
	if((Vehicle(LeaderPawn) != none) || (LinkGun(LeaderPawn.Weapon) != none) && (Vector(B.Squad.SquadLeader.Rotation) Dot Normal(Instigator.Location - LeaderPawn.Location)) < 0.9000000)
	{
		StartTrace = Instigator.Location + Instigator.EyePosition();
		// End:0x2B0
		if(VSize(LeaderPawn.Location - StartTrace) < LinkFire(FireMode[1]).TraceRange)
		{
			Other = Trace(HitLocation, HitNormal, LeaderPawn.Location, StartTrace, true);
			// End:0x2B0
			if(Other == LeaderPawn)
			{
				B.Focus = Other;
				return true;
			}
		}
	}
	return false;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local DestroyableObjective O;
	local Vehicle V;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	// End:0xB0
	if(((PlayerController(B.Squad.SquadLeader) != none) && B.Squad.SquadLeader.Pawn != none) && LinkGun(B.Squad.SquadLeader.Pawn.Weapon) != none)
	{
		return 1.2000000;
	}
	V = B.Squad.GetLinkVehicle(B);
	// End:0x164
	if((((V != none) && VSize(Instigator.Location - V.Location) < (1.5000000 * LinkFire(FireMode[1]).TraceRange)) && float(V.Health) < V.HealthMax) && V.LinkHealMult > float(0))
	{
		return 1.2000000;
	}
	// End:0x216
	if((((Vehicle(B.RouteGoal) != none) && B.Enemy == none) && VSize(Instigator.Location - B.RouteGoal.Location) < (1.5000000 * LinkFire(FireMode[1]).TraceRange)) && Vehicle(B.RouteGoal).TeamLink(B.GetTeamNum()))
	{
		return 1.2000000;
	}
	O = DestroyableObjective(B.Squad.SquadObjective);
	// End:0x2FE
	if((((((O != none) && B.Enemy == none) && O.TeamLink(B.GetTeamNum())) && O.Health < O.DamageCapacity) && VSize(Instigator.Location - O.Location) < (1.1000000 * LinkFire(FireMode[1]).TraceRange)) && B.LineOfSightTo(O))
	{
		return 1.2000000;
	}
	return AIRating * FMin(Pawn(Owner).DamageScaling, 1.5000000);
	//return;	
}

function byte BestMode()
{
	local float enemyDist;
	local Bot B;
	local Vehicle V;

	B = Bot(Instigator.Controller);
	// End:0x27
	if(B == none)
	{
		return 0;
	}
	// End:0x166
	if(((((DestroyableObjective(B.Squad.SquadObjective) != none) && B.Squad.SquadObjective.TeamLink(B.GetTeamNum())) || ((B.Squad.SquadObjective == none) && DestroyableObjective(B.Target) != none) && B.Target.TeamLink(B.GetTeamNum())) && VSize(B.Squad.SquadObjective.Location - B.Pawn.Location) < FireMode[1].MaxRange()) && (B.Enemy == none) || !B.EnemyVisible())
	{
		return 1;
	}
	// End:0x1A2
	if(FocusOnLeader(B.Focus == B.Squad.SquadLeader.Pawn))
	{
		return 1;
	}
	V = B.Squad.GetLinkVehicle(B);
	// End:0x1E9
	if(V == none)
	{
		V = Vehicle(B.MoveTarget);
	}
	// End:0x204
	if(V == B.Target)
	{
		return 1;
	}
	// End:0x2A1
	if(((((V != none) && VSize(Instigator.Location - V.Location) < LinkFire(FireMode[1]).TraceRange) && float(V.Health) < V.HealthMax) && V.LinkHealMult > float(0)) && B.LineOfSightTo(V))
	{
		return 1;
	}
	// End:0x2B8
	if(B.Enemy == none)
	{
		return 0;
	}
	enemyDist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0x309
	if(enemyDist > LinkFire(FireMode[1]).TraceRange)
	{
		return 0;
	}
	return 1;
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.8000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.4000000;
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

function bool LinkedTo(LinkGun L)
{
	local Pawn Other;
	local LinkGun OtherWeapon, head;
	local int sanity;

	head = self;
	J0x07:

	// End:0xB7 [Loop If]
	if(((head != none) && head.Linking) && sanity < 20)
	{
		Other = LinkFire(head.FireMode[1]).LockedPawn;
		// End:0x68
		if(Other == none)
		{
			return false;			
		}
		else
		{
			OtherWeapon = LinkGun(Other.Weapon);
			// End:0x91
			if(OtherWeapon == none)
			{
				return false;				
			}
			else
			{
				head = OtherWeapon;
			}
		}
		// End:0xAD
		if(head == L)
		{
			return true;
		}
		sanity++;
		// [Loop Continue]
		goto J0x07;
	}
	return false;
	//return;	
}

function bool ConsumeAmmo(int Mode, float load, optional bool bAmountNeededIsMax)
{
	local Controller C;

	// End:0x4A
	if((Linking && LinkFire(FireMode[1]).LockedPawn != none) && Vehicle(LinkFire(FireMode[1]).LockedPawn) == none)
	{
		return true;
	}
	// End:0x5D
	if(Mode == 0)
	{
		bAmountNeededIsMax = true;
	}
	// End:0x16D
	if(((Instigator != none) && Instigator.PlayerReplicationInfo != none) && Instigator.PlayerReplicationInfo.Team != none)
	{
		C = Level.ControllerList;
		J0xB1:

		// End:0x16D [Loop If]
		if(C != none)
		{
			// End:0x156
			if(((C.Pawn != none) && LinkGun(C.Pawn.Weapon) != none) && LinkGun(C.Pawn.Weapon).LinkedTo(self))
			{
				LinkGun(C.Pawn.Weapon).LinkedConsumeAmmo(Mode, load, bAmountNeededIsMax);
			}
			C = C.nextController;
			// [Loop Continue]
			goto J0xB1;
		}
	}
	return super.ConsumeAmmo(Mode, load, bAmountNeededIsMax);
	return super.ConsumeAmmo(Mode, load, bAmountNeededIsMax);
	//return;	
}

function bool LinkedConsumeAmmo(int Mode, float load, optional bool bAmountNeededIsMax)
{
	// End:0x13
	if(Mode == 0)
	{
		bAmountNeededIsMax = true;
	}
	return ConsumeAmmo(Mode, load, bAmountNeededIsMax);
	//return;	
}

simulated function IncrementFlashCount(int Mode)
{
	super.IncrementFlashCount(Mode);
	// End:0x34
	if(LinkAttachment(ThirdPersonActor) != none)
	{
		LinkAttachment(ThirdPersonActor).Links = Links;
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x29
	if(LinkFire(FireMode[1]) != none)
	{
		LinkFire(FireMode[1]).SetLinkTo(none);
	}
	Links = 0;
	return super.PutDown();
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	Links = 0;
	super.BringUp(PrevWeapon);
	//return;	
}

simulated event WeaponTick(float dt)
{
	local PlayerController PC;
	local LinkFire LF;

	PC = PlayerController(Instigator.Controller);
	LF = LinkFire(FireMode[1]);
	// End:0x115
	if((PC != none) && LF != none)
	{
		// End:0xC7
		if((Links > 0) && !LF.bLinkFeedbackPlaying)
		{
			LF.bLinkFeedbackPlaying = true;
			PC.ClientPlayForceFeedback(LF.MakeLinkForce);
			// End:0xC4
			if(!LF.bIsFiring)
			{
				PC.ClientPlayForceFeedback("BLinkGunBeam1");
			}			
		}
		else
		{
			// End:0x115
			if((Links <= 0) && LF.bLinkFeedbackPlaying)
			{
				LF.bLinkFeedbackPlaying = false;
				PC.StopForceFeedback("BLinkGunBeam1");
			}
		}
	}
	//return;	
}

defaultproperties
{
	FireModeClass[0]=Class'XWeapons.LinkAltFire'
	FireModeClass[1]=Class'XWeapons.LinkFire'
	PutDownAnim="PutDown"
	IdleAnimRate=0.0300000
	SelectSound=Sound'NewWeaponSounds.NewLinkSelect'
	SelectForce="SwitchToLinkGun"
	AIRating=0.6800000
	CurrentRating=0.6800000
	bMatchWeapons=true
	OldMesh=SkeletalMesh'Weapons.LinkGun_1st'
	OldPickup="WeaponStaticMesh.LinkGunPickup"
	OldCenteredOffsetY=-12.0000000
	OldPlayerViewOffset=(X=-2.0000000,Y=-2.0000000,Z=-3.0000000)
	OldSmallViewOffset=(X=10.0000000,Y=4.0000000,Z=-9.0000000)
	OldPlayerViewPivot=(Pitch=0,Yaw=500,Roll=0)
	OldCenteredRoll=3000
	OldCenteredYaw=-300
	Description="Riordan Dynamic Weapon Systems combines the best of weapon design in the Advanced Plasma Rifle v23, commonly known as the Link Gun.|While the primary firing mode of the Link remains the same as its plasma-firing predecessor, the secondary cutting torch has been replaced with a switchable energy matrix. Upon contacting a teammate, it converts to a harmless carrier stream, offloading energy from the onboard cells to boost the output of any targeted player also using the Link.|It should be noted that while players are boosting a teammate, they are unable to defend themselves from attack."
	EffectOffset=(X=100.0000000,Y=25.0000000,Z=-3.0000000)
	DisplayFOV=60.0000000
	Priority=7
	HudColor=(R=128,G=255,B=128,A=255)
	SmallViewOffset=(X=2.0000000,Y=0.0000000,Z=-1.5000000)
	CenteredOffsetY=-5.0000000
	CenteredRoll=3000
	CenteredYaw=-1000
	CustomCrosshair=10
	CustomCrossHairColor=(R=128,G=255,B=128,A=255)
	CustomCrossHairTextureName="Crosshairs.Hud.Crosshair_Bracket1"
	InventoryGroup=5
	PickupClass=Class'XWeapons.LinkGunPickup'
	PlayerViewOffset=(X=-5.0000000,Y=-3.0000000,Z=0.0000000)
	PlayerViewPivot=(Pitch=0,Yaw=500,Roll=0)
	BobDamping=1.5750000
	AttachmentClass=Class'XWeapons.LinkAttachment'
	IconMaterial=Texture'HudContent.Generic.HUD'
	IconCoords=(X1=169,Y1=78,X2=244,Y2=124)
	ItemName="Link Gun"
	Mesh=SkeletalMesh'NewWeapons2004.FatLinkGun'
}
