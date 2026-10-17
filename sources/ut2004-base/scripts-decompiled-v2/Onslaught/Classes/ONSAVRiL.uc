class ONSAVRiL extends Weapon
	config(User);

var Material BaseMaterial;
var Material ReticleOFFMaterial;
var Material ReticleONMaterial;
var bool bLockedOn;
var Vehicle HomingTarget;
var float LockCheckFreq;
var float LockCheckTime;
var float MaxLockRange;
var float LockAim;
var Color CrossHairColor;
var float CrosshairX;
var float CrosshairY;
var Texture CrosshairTexture;

replication
{
	// Pos:0x000
	reliable if((bNetDirty && bNetOwner) && int(Role) == int(ROLE_Authority))
		HomingTarget, bLockedOn;
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	Skins[0] = ReticleOFFMaterial;
	Skins[1] = BaseMaterial;
	//return;	
}

simulated function OutOfAmmo()
{
	//return;	
}

simulated function ActivateReticle(bool bActivate)
{
	// End:0x19
	if(bActivate)
	{
		Skins[0] = ReticleONMaterial;		
	}
	else
	{
		Skins[0] = ReticleOFFMaterial;
	}
	//return;	
}

simulated function WeaponTick(float DeltaTime)
{
	local Vector StartTrace, LockTrace;
	local Rotator Aim;
	local float bestAim, BestDist;
	local bool bLastLockedOn, bBotLock;
	local Vehicle LastHomingTarget, AIFocus, V;
	local Actor AlternateTarget;

	// End:0x1E
	if(int(Role) < int(ROLE_Authority))
	{
		ActivateReticle(bLockedOn);
		return;
	}
	// End:0x4E
	if((Instigator == none) || Instigator.Controller == none)
	{
		LoseLock();
		ActivateReticle(false);
		return;
	}
	// End:0x68
	if(Level.TimeSeconds < LockCheckTime)
	{
		return;
	}
	LockCheckTime = Level.TimeSeconds + LockCheckFreq;
	bLastLockedOn = bLockedOn;
	LastHomingTarget = HomingTarget;
	bBotLock = true;
	// End:0x1AA
	if(AIController(Instigator.Controller) != none)
	{
		AIFocus = Vehicle(AIController(Instigator.Controller).Focus);
		// End:0x197
		if(((CanLockOnTo(AIFocus)) && ((AIFocus.Controller != none) || AIFocus != Instigator.Controller.MoveTarget) || AIFocus.HasOccupiedTurret()) && FastTrace(AIFocus.Location, Instigator.Location + (Instigator.EyeHeight * vect(0.0000000, 0.0000000, 1.0000000))))
		{
			HomingTarget = AIFocus;
			bLockedOn = true;			
		}
		else
		{
			bLockedOn = false;
			bBotLock = false;
		}		
	}
	else
	{
		// End:0x2ED
		if((((HomingTarget == none) || (Normal(HomingTarget.Location - Instigator.Location) Dot Vector(Instigator.Controller.Rotation)) < LockAim) || VSize(HomingTarget.Location - Instigator.Location) > MaxLockRange) || !FastTrace(HomingTarget.Location, Instigator.Location + (Instigator.EyeHeight * vect(0.0000000, 0.0000000, 1.0000000))))
		{
			StartTrace = Instigator.Location + Instigator.EyePosition();
			Aim = Instigator.GetViewRotation();
			bestAim = LockAim;
			HomingTarget = Vehicle(Instigator.Controller.PickTarget(bestAim, BestDist, Vector(Aim), StartTrace, MaxLockRange));
		}
	}
	// End:0x43D
	if(HomingTarget == none)
	{
		StartTrace = Instigator.Location + Instigator.EyePosition();
		Aim = Instigator.GetViewRotation();
		V = Level.Game.VehicleList;
		J0x34F:

		// End:0x43D [Loop If]
		if(V != none)
		{
			AlternateTarget = V.AlternateTarget();
			// End:0x426
			if(AlternateTarget != none)
			{
				LockTrace = AlternateTarget.Location - StartTrace;
				// End:0x426
				if((((Normal(LockTrace) Dot Vector(Aim)) > LockAim) && VSize(LockTrace) < MaxLockRange) && FastTrace(AlternateTarget.Location, StartTrace))
				{
					HomingTarget = V;
					// End:0x423
					if(AIController(Instigator.Controller) != none)
					{
						AIController(Instigator.Controller).Focus = V;
					}
					// [Explicit Break]
					goto J0x43D;
				}
			}
			V = V.NextVehicle;
			// [Loop Continue]
			goto J0x34F;
		}
	}
	J0x43D:

	bLockedOn = CanLockOnTo(HomingTarget);
	ActivateReticle(bLockedOn);
	// End:0x4D4
	if(!bLastLockedOn && bLockedOn)
	{
		// End:0x496
		if(bBotLock && HomingTarget != none)
		{
			HomingTarget.NotifyEnemyLockedOn();
		}
		// End:0x4D1
		if(PlayerController(Instigator.Controller) != none)
		{
			PlayerController(Instigator.Controller).ClientPlaySound(SoundGroup'WeaponSounds.RocketLauncher.LockOn');
		}		
	}
	else
	{
		// End:0x506
		if((bLastLockedOn && !bLockedOn) && LastHomingTarget != none)
		{
			LastHomingTarget.NotifyEnemyLostLock();
		}
	}
	//return;	
}

function bool CanLockOnTo(Actor Other)
{
	local Vehicle V;

	V = Vehicle(Other);
	// End:0x2E
	if((V == none) || V == Instigator)
	{
		return false;
	}
	// End:0x4D
	if(!Level.Game.bTeamGame)
	{
		return true;
	}
	return int(V.Team) != Instigator.PlayerReplicationInfo.Team.TeamIndex;
	//return;	
}

function LoseLock()
{
	// End:0x25
	if(bLockedOn && HomingTarget != none)
	{
		HomingTarget.NotifyEnemyLostLock();
	}
	bLockedOn = false;
	//return;	
}

simulated function Destroyed()
{
	LoseLock();
	super.Destroyed();
	//return;	
}

simulated function DetachFromPawn(Pawn P)
{
	LoseLock();
	super.DetachFromPawn(P);
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	// End:0x119
	if(!FireMode[1].bIsFiring || ONSAVRiLAltFire(FireMode[1]) == none)
	{
		// End:0x10E
		if(bLockedOn)
		{
			Canvas.DrawColor = CrossHairColor;
			Canvas.DrawColor.A = byte(255);
			Canvas.Style = 5;
			Canvas.SetPos((float(Canvas.SizeX) * 0.5000000) - CrosshairX, (float(Canvas.SizeY) * 0.5000000) - CrosshairY);
			Canvas.DrawTile(CrosshairTexture, CrosshairX * 2.0000000, CrosshairY * 2.0000000, 0.0000000, 0.0000000, float(CrosshairTexture.USize), float(CrosshairTexture.VSize));
		}
		super.RenderOverlays(Canvas);
	}
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.4000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.5000000;
	//return;	
}

function byte BestMode()
{
	return 0;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float ZDiff, Dist, Result;

	B = Bot(Instigator.Controller);
	// End:0x52
	if((B.Target != none) && B.Target.IsA('ONSMortarCamera'))
	{
		return 2.0000000;
	}
	// End:0x79
	if((B == none) || B.Enemy == none)
	{
		return AIRating;
	}
	// End:0x98
	if(Vehicle(B.Enemy) == none)
	{
		return 0.0000000;
	}
	Result = AIRating;
	ZDiff = Instigator.Location.Z - B.Enemy.Location.Z;
	// End:0xF7
	if(ZDiff < float(-200))
	{
		Result += 0.1000000;
	}
	Dist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0x15B
	if(Dist > float(2000))
	{
		return FMin(2.0000000, Result + ((Dist - float(2000)) * 0.0002000));
	}
	return Result;
	//return;	
}

function bool RecommendRangedAttack()
{
	local Bot B;

	B = Bot(Instigator.Controller);
	// End:0x3C
	if((B == none) || B.Enemy == none)
	{
		return true;
	}
	return VSize(B.Enemy.Location - Instigator.Location) > (float(2000) * (float(1) + FRand()));
	//return;	
}

defaultproperties
{
	BaseMaterial=Texture'VMWeaponsTX.PlayerWeaponsGroup.AVRiLtex'
	ReticleOFFMaterial=Shader'VMWeaponsTX.PlayerWeaponsGroup.AVRiLreticleTEX'
	ReticleONMaterial=Shader'VMWeaponsTX.PlayerWeaponsGroup.AVRiLreticleTEXRed'
	LockCheckFreq=0.2000000
	MaxLockRange=15000.0000000
	LockAim=0.9960000
	CrossHairColor=(R=0,G=255,B=0,A=255)
	CrosshairX=32.0000000
	CrosshairY=32.0000000
	CrosshairTexture=Texture'ONSInterface-TX.avrilRETICLE'
	FireModeClass[0]=Class'Onslaught.ONSAVRiLFire'
	FireModeClass[1]=Class'Onslaught.ONSAVRiLAltFire'
	PutDownAnim="PutDown"
	SelectAnimRate=2.0000000
	PutDownAnimRate=1.7500000
	BringUpTime=0.4500000
	SelectSound=Sound'WeaponSounds.FlakCannon.SwitchToFlakCannon'
	SelectForce="SwitchToFlakCannon"
	AIRating=0.5500000
	CurrentRating=0.5500000
	Description="The AVRiL, or Anti-Vehicle Rocket Launcher, shoots homing missiles that pack quite a punch."
	EffectOffset=(X=100.0000000,Y=32.0000000,Z=-20.0000000)
	DisplayFOV=45.0000000
	Priority=8
	HudColor=(R=0,G=0,B=255,A=255)
	SmallViewOffset=(X=116.0000000,Y=43.5000000,Z=-40.5000000)
	CenteredRoll=5500
	CustomCrosshair=16
	CustomCrossHairColor=(R=0,G=255,B=0,A=255)
	CustomCrossHairTextureName="ONSInterface-TX.avrilRETICLEtrack"
	MinReloadPct=0.0000000
	InventoryGroup=8
	GroupOffset=1
	PickupClass=Class'Onslaught.ONSAVRiLPickup'
	PlayerViewOffset=(X=100.0000000,Y=35.5000000,Z=-32.5000000)
	BobDamping=2.2000000
	AttachmentClass=Class'Onslaught.ONSAVRiLAttachment'
	IconMaterial=Texture'HudContent.Generic.HUD'
	IconCoords=(X1=429,Y1=212,X2=508,Y2=251)
	ItemName="AVRiL"
	Mesh=SkeletalMesh'ONSWeapons-A.AVRiL_1st'
	AmbientGlow=64
}
