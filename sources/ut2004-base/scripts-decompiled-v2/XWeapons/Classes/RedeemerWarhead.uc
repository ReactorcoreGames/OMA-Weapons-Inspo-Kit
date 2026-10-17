class RedeemerWarhead extends Pawn
	config(User);

var float Damage;
var float DamageRadius;
var float MomentumTransfer;
var Class<DamageType> MyDamageType;
var Pawn OldPawn;
var RedeemerTrail SmokeTrail;
var float YawAccel;
var float PitchAccel;
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
var() Vector ShakeRotMag;
var() Vector ShakeRotRate;
var() float ShakeRotTime;
var() Vector ShakeOffsetMag;
var() Vector ShakeOffsetRate;
var() float ShakeOffsetTime;
var bool bStaticScreen;
var bool bFireForce;
var TeamInfo MyTeam;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetOwner)
		bStaticScreen;

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
	RelinquishController();
	// End:0x1D
	if(SmokeTrail != none)
	{
		SmokeTrail.Destroy();
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
	// End:0x14
	if(Other.bWorldGeometry)
	{
		return true;
	}
	return false;
	//return;	
}

event EncroachedBy(Actor Other)
{
	BlowUp(Location);
	//return;	
}

function RelinquishController()
{
	// End:0x0D
	if(Controller == none)
	{
		return;
	}
	Controller.Pawn = none;
	// End:0xBA
	if(!Controller.IsInState('GameEnded'))
	{
		// End:0x6B
		if((OldPawn != none) && OldPawn.Health > 0)
		{
			Controller.Possess(OldPawn);			
		}
		else
		{
			// End:0x8D
			if(OldPawn != none)
			{
				Controller.Pawn = OldPawn;				
			}
			else
			{
				Controller.Pawn = self;
			}
			Controller.PawnDied(Controller.Pawn);
		}
	}
	RemoteRole = default.RemoteRole;
	Instigator = OldPawn;
	Controller = none;
	//return;	
}

simulated function PostBeginPlay()
{
	local Vector Dir;

	Dir = Vector(Rotation);
	Velocity = AirSpeed * Dir;
	Acceleration = Velocity;
	// End:0x72
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		SmokeTrail = Spawn(Class'XEffects.RedeemerTrail', self,, Location - (float(40) * Dir));
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
		PlayOwnedSound(Sound'WeaponSounds.Misc.redeemer_shoot', 3, 1.0000000);
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
	local TexRotator ScopeTexRotator;
	local VariableTexPanner AltitudeTexPanner;

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
	ScopeTexRotator = TexRotator(OuterScopeShader.Diffuse);
	// End:0x261
	if(ScopeTexRotator != none)
	{
		ScopeTexRotator.Rotation.Yaw = Rotation.Roll;
	}
	AltitudeTexPanner = VariableTexPanner(Shader(AltitudeFinalBlend.Material).Diffuse);
	// End:0x2C1
	if(AltitudeTexPanner != none)
	{
		AltitudeTexPanner.PanRate = FClamp(Velocity.Z * VelocityToAltitudePanRate, -MaxAltitudePanRate, MaxAltitudePanRate);
	}
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

function UnPossessed()
{
	BlowUp(Location);
	//return;	
}

singular simulated function Touch(Actor Other)
{
	// End:0x1D
	if(Other.bBlockActors)
	{
		BlowUp(Location);
	}
	//return;	
}

singular simulated function Bump(Actor Other)
{
	// End:0x1D
	if(Other.bBlockActors)
	{
		BlowUp(Location);
	}
	//return;	
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x165
	if((Damage > 0) && ((((instigatedBy == none) || instigatedBy.Controller == none) || Instigator == none) || Instigator.Controller == none) || !instigatedBy.Controller.SameTeamAs(Instigator.Controller))
	{
		// End:0xBC
		if(((instigatedBy == none) || DamageType.default.bVehicleHit) || DamageType == Class'Engine.Crushed')
		{
			BlowUp(Location);			
		}
		else
		{
			// End:0xE8
			if(PlayerController(Controller) != none)
			{
				PlayerController(Controller).PlayRewardAnnouncement('Denied', 1, true);
			}
			// End:0x126
			if(PlayerController(instigatedBy.Controller) != none)
			{
				PlayerController(instigatedBy.Controller).PlayRewardAnnouncement('Denied', 1, true);
			}
			Spawn(Class'XEffects.SmallRedeemerExplosion');
			RelinquishController();
			SetCollision(false, false, false);
			HurtRadius(float(Damage), DamageRadius * 0.1250000, MyDamageType, MomentumTransfer, Location);
			Destroy();
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
	local Emitter E;

	// End:0x7D
	if(int(Role) == int(ROLE_Authority))
	{
		bHidden = true;
		E = Spawn(Class'XEffects.RedeemerExplosion',,, HitLocation - (float(100) * Normal(Velocity)), rot(0, 16384, 0));
		// End:0x76
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			E.LifeSpan = 0.7000000;
		}
		GotoState('Dying');
	}
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
		// End:0x7B
		if((OldPawn == none) || OldPawn.Health <= 0)
		{
			BlowUp(Location);			
		}
		else
		{
			// End:0xB9
			if(Controller == none)
			{
				// End:0xAE
				if(OldPawn.Controller == none)
				{
					OldPawn.KilledBy(OldPawn);
				}
				BlowUp(Location);
			}
		}
		//return;		
	}
	stop;	
}

state Dying
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
		bHidden = true;
		bStaticScreen = true;
		SetPhysics(0);
		SetCollision(false, false, false);
		Spawn(Class'XEffects.IonCore',,, Location, Rotation);
		// End:0x46
		if(SmokeTrail != none)
		{
			SmokeTrail.Destroy();
		}
		ShakeView();
		//return;		
	}

	function ShakeView()
	{
		local Controller C;
		local PlayerController PC;
		local float Dist, Scale;

		C = Level.ControllerList;
		J0x14:

		// End:0x11B [Loop If]
		if(C != none)
		{
			PC = PlayerController(C);
			// End:0x104
			if((PC != none) && PC.ViewTarget != none)
			{
				Dist = VSize(Location - PC.ViewTarget.Location);
				// End:0x104
				if(Dist < (DamageRadius * 2.0000000))
				{
					// End:0xA9
					if(Dist < DamageRadius)
					{
						Scale = 1.0000000;						
					}
					else
					{
						Scale = ((DamageRadius * 2.0000000) - Dist) / DamageRadius;
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
Begin:

	Instigator = self;
	PlaySound(Sound'WeaponSounds.Misc.redeemer_explosionsound');
	HurtRadius(Damage, DamageRadius * 0.1250000, MyDamageType, MomentumTransfer, Location);
	Sleep(0.5000000);
	HurtRadius(Damage, DamageRadius * 0.3000000, MyDamageType, MomentumTransfer, Location);
	Sleep(0.2000000);
	HurtRadius(Damage, DamageRadius * 0.4750000, MyDamageType, MomentumTransfer, Location);
	Sleep(0.2000000);
	RelinquishController();
	HurtRadius(Damage, DamageRadius * 0.6500000, MyDamageType, MomentumTransfer, Location);
	Sleep(0.2000000);
	HurtRadius(Damage, DamageRadius * 0.8250000, MyDamageType, MomentumTransfer, Location);
	Sleep(0.2000000);
	HurtRadius(Damage, DamageRadius * 1.0000000, MyDamageType, MomentumTransfer, Location);
	Destroy();
	stop;				
}

defaultproperties
{
	Damage=250.0000000
	DamageRadius=2000.0000000
	MomentumTransfer=200000.0000000
	MyDamageType=Class'XWeapons.DamTypeRedeemer'
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
	ShakeRotMag=(X=0.0000000,Y=0.0000000,Z=250.0000000)
	ShakeRotRate=(X=0.0000000,Y=0.0000000,Z=2500.0000000)
	ShakeRotTime=6.0000000
	ShakeOffsetMag=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	ShakeOffsetRate=(X=0.0000000,Y=0.0000000,Z=200.0000000)
	ShakeOffsetTime=10.0000000
	bSimulateGravity=false
	bDirectHitWall=true
	bHideRegularHUD=true
	bSpecialHUD=true
	bNoTeamBeacon=true
	bCanUse=false
	AirSpeed=1000.0000000
	AccelRate=2000.0000000
	BaseEyeHeight=0.0000000
	EyeHeight=0.0000000
	LandMovementState="PlayerRocketing"
	LightType=1
	LightEffect=21
	LightHue=28
	LightBrightness=255.0000000
	LightRadius=6.0000000
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.RedeemerMissile'
	bDynamicLight=true
	bStasis=false
	bReplicateInstigator=true
	bNetInitialRotation=true
	Physics=4
	NetPriority=3.0000000
	AmbientSound=Sound'WeaponSounds.Misc.redeemer_flight'
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
	ForceType=1
	ForceRadius=100.0000000
	ForceScale=5.0000000
}
