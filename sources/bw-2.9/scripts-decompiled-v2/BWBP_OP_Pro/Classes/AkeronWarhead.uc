class AkeronWarhead extends Pawn
	config(User);

var float Damage;
var float DamageRadius;
var float MomentumTransfer;
var Class<DamageType> MyDamageType;
var Pawn OldPawn;
var BallisticEmitter SmokeTrail;
var float YawAccel;
var float PitchAccel;
var float OutwardDamageRadius;
var Shader InnerScopeShader;
var Shader OuterScopeShader;
var Shader OuterEdgeShader;
var FinalBlend AltitudeFinalBlend;
var float YawToBankingRatio;
var float BankingResetRate;
var float BankingToScopeRotationRatio;
var int Banking;
var int BankingVelocity;
var int MaxBanking;
var int BankingDamping;
var float VelocityToAltitudePanRate;
var float MaxAltitudePanRate;
var float Fuel;
var() Vector ShakeRotMag;
var() Vector ShakeRotRate;
var() float ShakeRotTime;
var() Vector ShakeOffsetMag;
var() Vector ShakeOffsetRate;
var() float ShakeOffsetTime;
var Rotator InitialControllerRotation;
var bool bStaticScreen;
var bool bFireForce;
var() Class<BCImpactManager> ImpactManager;
var Vector TearOffHitNormal;
var bool bExploded;
var Actor HitActor;
var AkeronLauncher Master;
var float FiredAt;
var float ArmThreshold;
var TeamInfo MyTeam;

replication
{
	// Pos:0x000
	reliable if(bNetOwner && int(Role) == int(ROLE_Authority))
		InitialControllerRotation, bStaticScreen;

	// Pos:0x018
	reliable if(int(Role) < int(ROLE_Authority))
		ServerBlowUp;
}

function PlayerChangedTeam()
{
	Died(none, Class'Engine.DamageType', Location);
	OldPawn.Died(none, Class'Engine.DamageType', OldPawn.Location);
	//return;	
}

function TeamInfo GetTeam()
{
	// End:0x1A
	if(PlayerReplicationInfo != none)
	{
		return PlayerReplicationInfo.Team;
	}
	return MyTeam;
	//return;	
}

simulated function Destroyed()
{
	// End:0x1A
	if(SmokeTrail != none)
	{
		SmokeTrail.Kill();
	}
	super.Destroyed();
	//return;	
}

simulated function bool IsPlayerPawn()
{
	return false;
	//return;	
}

event bool EncroachingOn(Actor Other)
{
	// End:0x33
	if((Level.TimeSeconds - FiredAt) > ArmThreshold)
	{
		// End:0x33
		if(Other.bWorldGeometry)
		{
			return true;
		}
	}
	return false;
	//return;	
}

event EncroachedBy(Actor Other)
{
	// End:0x7B
	if((Level.TimeSeconds - FiredAt) > ArmThreshold)
	{
		// End:0x65
		if(Pawn(Other) != none)
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, Damage, Instigator, Location, MomentumTransfer * Normal(Velocity), MyDamageType);
		}
		HitActor = Other;
		BlowUp(Location);
	}
	//return;	
}

function RelinquishController()
{
	//return;	
}

simulated function PostBeginPlay()
{
	local Vector Dir;

	Dir = Vector(Rotation);
	InitialControllerRotation = Rotation;
	Velocity = AirSpeed * Dir;
	Acceleration = Velocity;
	FiredAt = Level.TimeSeconds;
	// End:0x91
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		SmokeTrail = Spawn(Class'BWBP_OP_Pro.AkeronRocketTrail', self,, Location - (float(40) * Dir));
		SmokeTrail.SetBase(self);
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x5E
	if(PlayerController(Controller) != none)
	{
		Controller.SetRotation(Rotation);
		PlayerController(Controller).SetViewTarget(self);
		Controller.GotoState(LandMovementState);
		PlayOwnedSound(Sound'BWBP_OP_Sounds.Akeron.Akeron-Fire', 3, 1.0000000);
	}
	//return;	
}

simulated function FaceRotation(Rotator NewRotation, float DeltaTime)
{
	//return;	
}

function UpdateRocketAcceleration(float DeltaTime, float YawChange, float PitchChange)
{
	local Vector X, Y, Z;
	local float PitchThreshold;
	local int Pitch;
	local Rotator TempRotation;

	YawAccel = ((1.0000000 - (float(2) * DeltaTime)) * YawAccel) + (DeltaTime * YawChange);
	PitchAccel = ((1.0000000 - (float(2) * DeltaTime)) * PitchAccel) + (DeltaTime * PitchChange);
	SetRotation(Rotator(Velocity));
	GetAxes(Rotation, X, Y, Z);
	PitchThreshold = 3000.0000000;
	Pitch = Rotation.Pitch & 65535;
	// End:0x12D
	if((float(Pitch) > (float(16384) - PitchThreshold)) && float(Pitch) < (float(49152) + PitchThreshold))
	{
		// End:0x101
		if(float(Pitch) > (float(49152) - PitchThreshold))
		{
			PitchAccel = float(Max(int(PitchAccel), 0));			
		}
		else
		{
			// End:0x12D
			if(float(Pitch) < (float(16384) + PitchThreshold))
			{
				PitchAccel = float(Min(int(PitchAccel), 0));
			}
		}
	}
	Acceleration = Velocity + (float(5) * ((YawAccel * Y) + (PitchAccel * Z)));
	// End:0x17C
	if(Acceleration == vect(0.0000000, 0.0000000, 0.0000000))
	{
		Acceleration = Velocity;
	}
	Acceleration = Normal(Acceleration) * AccelRate;
	BankingVelocity += int(DeltaTime * (((YawToBankingRatio * YawChange) - (BankingResetRate * float(Banking))) - float(BankingDamping * BankingVelocity)));
	Banking += int(DeltaTime * float(BankingVelocity));
	Banking = Clamp(Banking, -MaxBanking, MaxBanking);
	TempRotation = Rotation;
	TempRotation.Roll = Banking;
	SetRotation(TempRotation);
	//return;	
}

simulated function PhysicsVolumeChange(PhysicsVolume Volume)
{
	//return;	
}

simulated function Landed(Vector HitNormal)
{
	BlowUp(Location);
	//return;	
}

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	BlowUp(Location);
	//return;	
}

singular simulated function Touch(Actor Other)
{
	// End:0x8F
	if(Other.bBlockActors && (Level.TimeSeconds - FiredAt) > ArmThreshold)
	{
		// End:0x79
		if(Pawn(Other) != none)
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, Damage, Instigator, Location, MomentumTransfer * Normal(Velocity), MyDamageType);
		}
		HitActor = Other;
		BlowUp(Location);
	}
	//return;	
}

singular simulated function Bump(Actor Other)
{
	// End:0x3E
	if(Other.bBlockActors && (Level.TimeSeconds - FiredAt) > ArmThreshold)
	{
		BlowUp(Location);
	}
	//return;	
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x14D
	if((Damage > 0) && ((((instigatedBy == none) || instigatedBy.Controller == none) || Instigator == none) || Instigator.Controller == none) || !instigatedBy.Controller.SameTeamAs(Instigator.Controller))
	{
		// End:0xBC
		if(((instigatedBy == none) || DamageType.default.bVehicleHit) || DamageType == Class'Engine.Crushed')
		{
			BlowUp(Location);			
		}
		else
		{
			Health -= Damage;
			// End:0xD5
			if(Health > 0)
			{
				return;
			}
			// End:0x101
			if(PlayerController(Controller) != none)
			{
				PlayerController(Controller).PlayRewardAnnouncement('Denied', 1, true);
			}
			// End:0x13F
			if(PlayerController(instigatedBy.Controller) != none)
			{
				PlayerController(instigatedBy.Controller).PlayRewardAnnouncement('Denied', 1, true);
			}
			Spawn(Class'XEffects.SmallRedeemerExplosion');
			ServerBlowUp();
		}
	}
	//return;	
}

function Fire(optional float F)
{
	ServerBlowUp();
	// End:0x3B
	if(F == float(1))
	{
		OldPawn.Health = -1;
		OldPawn.KilledBy(OldPawn);
	}
	//return;	
}

function ServerBlowUp()
{
	BlowUp(Location);
	//return;	
}

function BlowUp(Vector HitLocation)
{
	// End:0x57
	if((bExploded || ((Owner != none) && PlayerController(Controller) != none) && PlayerController(Controller).AcknowledgedPawn != self) || int(Role) != int(ROLE_Authority))
	{
		return;
	}
	ShakeView();
	// End:0xE1
	if((ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0xBE
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, -Vector(Rotation), 0, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, -Vector(Rotation), 0, Instigator);
		}
	}
	// End:0xFB
	if(Master != none)
	{
		Master.LostWarhead();
	}
	Instigator = self;
	// End:0x145
	if((Level.TimeSeconds - FiredAt) > ArmThreshold)
	{
		TargetedHurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation, HitActor);
	}
	bExploded = true;
	GotoState('NetTrapped');
	//return;	
}

simulated function TornOff()
{
	ShakeView();
	// End:0x8A
	if((ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x67
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(Location, -Vector(Rotation), 0, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(Location, -Vector(Rotation), 0, Instigator);
		}
	}
	bHidden = true;
	Velocity = vect(0.0000000, 0.0000000, 0.0000000);
	SetCollision(false, false, false);
	SetPhysics(0);
	// End:0xC7
	if(SmokeTrail != none)
	{
		SmokeTrail.Destroy();
	}
	LifeSpan = 1.0000000;
	//return;	
}

function bool DoJump(bool bUpdating)
{
	return false;
	//return;	
}

singular event BaseChange()
{
	//return;	
}

simulated function DrawHUD(Canvas Canvas)
{
	local float offset;
	local Plane SavedCM;

	SavedCM = Canvas.ColorModulate;
	Canvas.ColorModulate.X = 1.0000000;
	Canvas.ColorModulate.Y = 1.0000000;
	Canvas.ColorModulate.Z = 1.0000000;
	Canvas.ColorModulate.W = 1.0000000;
	Canvas.Style = byte(255);
	Canvas.SetPos(0.0000000, 0.0000000);
	Canvas.DrawColor = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255));
	// End:0x11F
	if(bStaticScreen)
	{
		Canvas.DrawTile(FinalBlend'XGameShaders.ZoomFX.ScreenNoiseFB', float(Canvas.SizeX), float(Canvas.SizeY), 0.0000000, 0.0000000, 512.0000000, 512.0000000);		
	}
	else
	{
		// End:0xE5F
		if(!Level.IsSoftwareRendering())
		{
			// End:0x7E1
			if(Canvas.ClipX >= Canvas.ClipY)
			{
				offset = Canvas.ClipX / Canvas.ClipY;
				Canvas.DrawTile(OuterEdgeShader, 0.5000000 * float(Canvas.SizeX), 0.5000000 * float(Canvas.SizeY), 512.0000000 * (float(1) - offset), 0.0000000, offset * float(512), 512.0000000);
				Canvas.SetPos(0.5000000 * float(Canvas.SizeX), 0.0000000);
				Canvas.DrawTile(OuterEdgeShader, 0.5000000 * float(Canvas.SizeX), 0.5000000 * float(Canvas.SizeY), 512.0000000, 0.0000000, -512.0000000 * offset, 512.0000000);
				Canvas.SetPos(0.0000000, 0.5000000 * float(Canvas.SizeY));
				Canvas.DrawTile(OuterEdgeShader, 0.5000000 * float(Canvas.SizeX), 0.5000000 * float(Canvas.SizeY), 512.0000000 * (float(1) - offset), 512.0000000, offset * float(512), -512.0000000);
				Canvas.SetPos(0.5000000 * float(Canvas.SizeX), 0.5000000 * float(Canvas.SizeY));
				Canvas.DrawTile(OuterEdgeShader, 0.5000000 * float(Canvas.SizeX), 0.5000000 * float(Canvas.SizeY), 512.0000000, 512.0000000, -512.0000000 * offset, -512.0000000);
				Canvas.SetPos(0.0000000, 0.0000000);
				Canvas.DrawTile(InnerScopeShader, 0.5000000 * float(Canvas.SizeX), 0.5000000 * float(Canvas.SizeY), 512.0000000 * (float(1) - offset), 0.0000000, offset * float(512), 512.0000000);
				Canvas.SetPos(0.5000000 * float(Canvas.SizeX), 0.0000000);
				Canvas.DrawTile(InnerScopeShader, 0.5000000 * float(Canvas.SizeX), 0.5000000 * float(Canvas.SizeY), 512.0000000, 0.0000000, -512.0000000 * offset, 512.0000000);
				Canvas.SetPos(0.0000000, 0.5000000 * float(Canvas.SizeY));
				Canvas.DrawTile(InnerScopeShader, 0.5000000 * float(Canvas.SizeX), 0.5000000 * float(Canvas.SizeY), 512.0000000 * (float(1) - offset), 512.0000000, offset * float(512), -512.0000000);
				Canvas.SetPos(0.5000000 * float(Canvas.SizeX), 0.5000000 * float(Canvas.SizeY));
				Canvas.DrawTile(InnerScopeShader, 0.5000000 * float(Canvas.SizeX), 0.5000000 * float(Canvas.SizeY), 512.0000000, 512.0000000, -512.0000000 * offset, -512.0000000);
				Canvas.SetPos(0.5000000 * float(Canvas.SizeX - Canvas.SizeY), 0.0000000);
				Canvas.DrawTile(OuterScopeShader, float(Canvas.SizeX), float(Canvas.SizeY), 0.0000000, 0.0000000, 1024.0000000 * offset, 1024.0000000);
				Canvas.SetPos(((512.0000000 * (offset - float(1))) + float(383)) * (float(Canvas.SizeX) / (float(1024) * offset)), float(Canvas.SizeY) * (451.0000000 / 1024.0000000));
				Canvas.DrawTile(AltitudeFinalBlend, float(Canvas.SizeX) / (float(8) * offset), float(Canvas.SizeY / 8), 0.0000000, 0.0000000, 128.0000000, 128.0000000);
				Canvas.SetPos(((((512.0000000 * (offset - float(1))) + float(383)) + float(2 * (512 - 383))) - float(128)) * (float(Canvas.SizeX) / (float(1024) * offset)), float(Canvas.SizeY) * (451.0000000 / 1024.0000000));
				Canvas.DrawTile(AltitudeFinalBlend, float(Canvas.SizeX) / (float(8) * offset), float(Canvas.SizeY / 8), 128.0000000, 0.0000000, -128.0000000, 128.0000000);				
			}
			else
			{
				offset = Canvas.ClipY / Canvas.ClipX;
				Canvas.DrawTile(OuterEdgeShader, 0.5000000 * float(Canvas.SizeX), 0.5000000 * float(Canvas.SizeY), 0.0000000, 512.0000000 * (float(1) - offset), 512.0000000, 512.0000000 * offset);
				Canvas.SetPos(0.5000000 * float(Canvas.SizeX), 0.0000000);
				Canvas.DrawTile(OuterEdgeShader, 0.5000000 * float(Canvas.SizeX), 0.5000000 * float(Canvas.SizeY), 512.0000000, 512.0000000 * (float(1) - offset), -512.0000000, 512.0000000 * offset);
				Canvas.SetPos(0.0000000, 0.5000000 * float(Canvas.SizeY));
				Canvas.DrawTile(OuterEdgeShader, 0.5000000 * float(Canvas.SizeX), 0.5000000 * float(Canvas.SizeY), 0.0000000, 512.0000000, 512.0000000, -512.0000000 * offset);
				Canvas.SetPos(0.5000000 * float(Canvas.SizeX), 0.5000000 * float(Canvas.SizeY));
				Canvas.DrawTile(OuterEdgeShader, 0.5000000 * float(Canvas.SizeX), 0.5000000 * float(Canvas.SizeY), 512.0000000, 512.0000000, -512.0000000, -512.0000000 * offset);
				Canvas.SetPos(0.0000000, 0.0000000);
				Canvas.DrawTile(InnerScopeShader, 0.5000000 * float(Canvas.SizeX), 0.5000000 * float(Canvas.SizeY), 0.0000000, 512.0000000 * (float(1) - offset), 512.0000000, 512.0000000 * offset);
				Canvas.SetPos(0.5000000 * float(Canvas.SizeX), 0.0000000);
				Canvas.DrawTile(InnerScopeShader, 0.5000000 * float(Canvas.SizeX), 0.5000000 * float(Canvas.SizeY), 512.0000000, 512.0000000 * (float(1) - offset), -512.0000000, 512.0000000 * offset);
				Canvas.SetPos(0.0000000, 0.5000000 * float(Canvas.SizeY));
				Canvas.DrawTile(InnerScopeShader, 0.5000000 * float(Canvas.SizeX), 0.5000000 * float(Canvas.SizeY), 0.0000000, 512.0000000, 512.0000000, -512.0000000 * offset);
				Canvas.SetPos(0.5000000 * float(Canvas.SizeX), 0.5000000 * float(Canvas.SizeY));
				Canvas.DrawTile(InnerScopeShader, 0.5000000 * float(Canvas.SizeX), 0.5000000 * float(Canvas.SizeY), 512.0000000, 512.0000000, -512.0000000, -512.0000000 * offset);
				Canvas.SetPos(0.0000000, 0.5000000 * float(Canvas.SizeY - Canvas.SizeX));
				Canvas.DrawTile(OuterScopeShader, float(Canvas.SizeX), float(Canvas.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000 * offset);
				Canvas.SetPos(float(Canvas.SizeX) * (383.0000000 / 1024.0000000), ((512.0000000 * (offset - float(1))) + float(451)) * (float(Canvas.SizeY) / (float(1024) * offset)));
				Canvas.DrawTile(AltitudeFinalBlend, float(Canvas.SizeX / 8), float(Canvas.SizeY) / (float(8) * offset), 0.0000000, 0.0000000, 128.0000000, 128.0000000);
				Canvas.SetPos(float((Canvas.SizeX * ((383 + (2 * (512 - 383))) - 128)) / 1024), ((512.0000000 * (offset - float(1))) + float(451)) * (float(Canvas.SizeY) / (float(1024) * offset)));
				Canvas.DrawTile(AltitudeFinalBlend, float(Canvas.SizeX / 8), float(Canvas.SizeY) / (float(8) * offset), 128.0000000, 0.0000000, -128.0000000, 128.0000000);
			}
		}
	}
	Canvas.ColorModulate = SavedCM;
	//return;	
}

simulated event PlayDying(Class<DamageType> DamageType, Vector HitLoc)
{
	//return;	
}

function Died(Controller Killer, Class<DamageType> DamageType, Vector HitLocation)
{
	BlowUp(Location);
	//return;	
}

function bool CheatWalk()
{
	return false;
	//return;	
}

function bool CheatGhost()
{
	return false;
	//return;	
}

function bool CheatFly()
{
	return false;
	//return;	
}

function ShouldCrouch(bool Crouch)
{
	//return;	
}

event SetWalking(bool bNewIsWalking)
{
	//return;	
}

function Suicide()
{
	BlowUp(Location);
	// End:0x40
	if((OldPawn != none) && OldPawn.Health > 0)
	{
		OldPawn.KilledBy(OldPawn);
	}
	//return;	
}

function ShakeView()
{
	local Controller C;
	local PlayerController PC;
	local float dist, Scale;

	C = Level.ControllerList;
	J0x14:

	// End:0x136 [Loop If]
	if(C != none)
	{
		PC = PlayerController(C);
		// End:0x11F
		if(((PC != none) && PC.ViewTarget != none) && AkeronWarhead(PC.ViewTarget) == none)
		{
			dist = VSize(Location - PC.ViewTarget.Location);
			// End:0x11F
			if(dist < (DamageRadius * 2.0000000))
			{
				// End:0xC4
				if(dist < DamageRadius)
				{
					Scale = 1.0000000;					
				}
				else
				{
					Scale = ((DamageRadius * 2.0000000) - dist) / DamageRadius;
				}
				C.ShakeView(ShakeRotMag * Scale, ShakeRotRate, ShakeRotTime, ShakeOffsetMag * Scale, ShakeOffsetRate, ShakeOffsetTime);
			}
		}
		C = C.nextController;
		// [Loop Continue]
		goto J0x14;
	}
	//return;	
}

simulated function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Actor Victims;
	local float damageScale, DmgRadiusScale, dist;
	local Vector Dir, ClosestLinePoint;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x2BC
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x2BB
		if(((((Victims != self) && Victims != OldPawn) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != HitActor)
		{
			Dir = Victims.Location - HitLocation;
			// End:0xC6
			if((Vector(Rotation) Dot Normal(Dir)) < 0.7500000)
			{
				continue;				
			}
			ClosestLinePoint = Location + ((Vector(Rotation) * ((Vector(Rotation) * DamageRadius) Dot (Victims.Location - Location))) / DamageRadius);
			// End:0x12D
			if(VSize(Victims.Location - ClosestLinePoint) > OutwardDamageRadius)
			{
				continue;				
			}
			// End:0x189
			if(!FastTrace(Victims.Location, Location))
			{
				DmgRadiusScale = (DamageRadius - (GetCoverReductionFor(Victims.Location))) / DamageRadius;
				// End:0x189
				if((DamageRadius * DmgRadiusScale) < float(16))
				{
					continue;					
				}
			}
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - (0.6500000 * FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius));
			// End:0x20D
			if(!FastTrace(Location, Victims.Location))
			{
				Damage *= 0.5000000;
			}
			// End:0x242
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(Controller);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

function float SurfaceScale(int Surf, out byte bHard)
{
	switch(Surf)
	{
		// End:0x19
		case 0:
			bHard = 1;
			return 0.5000000;
		// End:0x2B
		case 1:
			bHard = 1;
			return 0.5000000;
		// End:0x36
		case 2:
			return 0.3500000;
		// End:0x49
		case 3:
			bHard = 1;
			return 0.2500000;
		// End:0x54
		case 4:
			return 0.5500000;
		// End:0x5F
		case 5:
			return 0.5000000;
		// End:0x6A
		case 6:
			return 1.0000000;
		// End:0x7D
		case 7:
			bHard = 1;
			return 0.7500000;
		// End:0x88
		case 8:
			return 1.0000000;
		// End:0x93
		case 9:
			return 1.0000000;
		// End:0x9E
		case 10:
			return 1.0000000;
		// End:0xFFFF
		default:
			bHard = 1;
			return 0.5000000;
			break;
	}
	//return;	
}

function float GetCoverReductionFor(Vector TargetLoc)
{
	local Vector HitLocation, HitLocationTwo, HitNormal;
	local Material HitMat;
	local float MatScale, dist;
	local byte bHard;

	Trace(HitLocation, HitNormal, TargetLoc, Location, false,, HitMat);
	Trace(HitLocationTwo, HitNormal, Location, TargetLoc, false);
	MatScale = SurfaceScale(int(HitMat.SurfaceType), bHard);
	dist = VSize(HitLocation - HitLocationTwo);
	// End:0x88
	if(int(bHard) == 0)
	{
		return dist / MatScale;		
	}
	else
	{
		// End:0xA4
		if((dist / MatScale) > DamageRadius)
		{
			return 0.0000000;
		}
	}
	return 1.0000000;
	//return;	
}

state NetTrapped
{
	ignores BreathTimer;

	function Fire(optional float F)
	{
		//return;		
	}

	function BlowUp(Vector HitLocation)
	{
		//return;		
	}

	function ServerBlowUp()
	{
		//return;		
	}

	function Timer()
	{
		//return;		
	}

	function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
	{
		//return;		
	}

	function BeginState()
	{
		bStaticScreen = true;
		bTearOff = true;
		bAlwaysRelevant = true;
		bHidden = true;
		Velocity = vect(0.0000000, 0.0000000, 0.0000000);
		SetCollision(false, false, false);
		SetPhysics(0);
		// End:0x55
		if(SmokeTrail != none)
		{
			SmokeTrail.Destroy();
		}
		//return;		
	}
Begin:

	Sleep(6.0000000);
	Destroy();
	stop;					
}

auto state Flying
{
	function Tick(float DeltaTime)
	{
		// End:0x4C
		if(!bFireForce && PlayerController(Controller) != none)
		{
			bFireForce = true;
			PlayerController(Controller).ClientPlayForceFeedback("FlakCannonAltFire");
		}
		Fuel -= DeltaTime;
		// End:0x93
		if(((Fuel < float(0)) || OldPawn == none) || OldPawn.Health <= 0)
		{
			BlowUp(Location);
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	Damage=110.0000000
	DamageRadius=300.0000000
	MomentumTransfer=70000.0000000
	MyDamageType=Class'BWBP_OP_Pro.DTAkeronGuided'
	OutwardDamageRadius=96.0000000
	InnerScopeShader=Shader'2K4Hud.ZoomFX.RDM_InnerScopeShader'
	OuterScopeShader=Shader'2K4Hud.ZoomFX.RDM_OuterScopeShader'
	OuterEdgeShader=Shader'2K4Hud.ZoomFX.RDM_OuterEdgeShader'
	AltitudeFinalBlend=FinalBlend'2K4Hud.ZoomFX.RDM_AltitudeFinal'
	YawToBankingRatio=60.0000000
	BankingResetRate=15.0000000
	BankingToScopeRotationRatio=8.0000000
	MaxBanking=20000
	BankingDamping=10
	VelocityToAltitudePanRate=0.0017500
	MaxAltitudePanRate=10.0000000
	Fuel=12.0000000
	ShakeRotMag=(X=0.0000000,Y=0.0000000,Z=250.0000000)
	ShakeRotRate=(X=0.0000000,Y=0.0000000,Z=2500.0000000)
	ShakeRotTime=6.0000000
	ShakeOffsetMag=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	ShakeOffsetRate=(X=0.0000000,Y=0.0000000,Z=200.0000000)
	ShakeOffsetTime=10.0000000
	ImpactManager=Class'BWBP_OP_Pro.IM_Akeron'
	ArmThreshold=0.1500000
	bSimulateGravity=false
	bDirectHitWall=true
	bHideRegularHUD=true
	bSpecialHUD=true
	bNoTeamBeacon=true
	bCanUse=false
	AirSpeed=1000.0000000
	AccelRate=3000.0000000
	BaseEyeHeight=0.0000000
	EyeHeight=0.0000000
	HealthMax=25.0000000
	Health=25
	LandMovementState="PlayerRocketing"
	LightType=1
	LightEffect=21
	LightHue=28
	LightBrightness=255.0000000
	LightRadius=6.0000000
	DrawType=8
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.BOGP.BOGP_Grenade'
	bDynamicLight=true
	bStasis=false
	bReplicateInstigator=true
	bNetInitialRotation=true
	Physics=4
	NetPriority=3.0000000
	AmbientSound=Sound'BW_Core_WeaponSound.G5.G5-RocketFly'
	DrawScale=0.5000000
	AmbientGlow=96
	bGameRelevant=true
	bCanTeleport=false
	SoundRadius=100.0000000
	TransientSoundVolume=1.0000000
	TransientSoundRadius=5000.0000000
	CollisionRadius=24.0000000
	CollisionHeight=12.0000000
	bBlockActors=false
	bNetNotify=true
	ForceType=1
	ForceRadius=100.0000000
	ForceScale=5.0000000
}
