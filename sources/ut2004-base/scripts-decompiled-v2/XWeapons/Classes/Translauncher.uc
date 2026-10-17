class Translauncher extends Weapon
	config(User)
	hidedropdown;

var TransBeacon TransBeacon;
var() float MaxCamDist;
var() float AmmoChargeF;
var int RepAmmo;
var() float AmmoChargeMax;
var() float AmmoChargeRate;
var globalconfig bool bPrevWeaponSwitch;
var xBombFlag Bomb;
var bool bDrained;
var bool bBeaconDeployed;
var bool bTeamSet;
var byte ViewBeaconVolume;
var float PreDrainAmmo;
var Rotator TranslocRot;
var float TranslocScale;
var float OldTime;

replication
{
	// Pos:0x000
	reliable if(bNetOwner && int(Role) == int(ROLE_Authority))
		RepAmmo, TransBeacon;
}

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	super.GiveTo(Other, Pickup);
	// End:0x48
	if(Bot(Other.Controller) != none)
	{
		Bot(Other.Controller).bHasTranslocator = true;
	}
	//return;	
}

function bool ShouldTranslocatorHop(Bot B)
{
	local float Dist;
	local Actor N;
	local bool bHop;

	bHop = B.bTranslocatorHop;
	B.bTranslocatorHop = false;
	// End:0x26E
	if((((bHop && B.Focus == B.TranslocationTarget) && B.NextTranslocTime < Level.TimeSeconds) && B.InLatentExecution(B.503)) && B.Squad.AllowTranslocationBy(B))
	{
		// End:0xE9
		if((TransBeacon != none) && TransBeacon.IsMonitoring(B.Focus))
		{
			return false;
		}
		Dist = VSize(B.TranslocationTarget.Location - B.Pawn.Location);
		// End:0x213
		if(Dist < float(300))
		{
			N = B.AlternateTranslocDest();
			// End:0x1CC
			if((N == none) || (Vector(B.Rotation) Dot Normal(N.Location - B.Pawn.Location)) < 0.5000000)
			{
				// End:0x1C9
				if(Dist < float(200))
				{
					B.TranslocationTarget = none;
					B.RealTranslocationTarget = none;
					return false;
				}				
			}
			else
			{
				B.TranslocationTarget = N;
				B.RealTranslocationTarget = B.TranslocationTarget;
				B.Focus = N;
				return true;
			}
		}
		// End:0x26C
		if((Vector(B.Rotation) Dot Normal(B.TranslocationTarget.Location - B.Pawn.Location)) < 0.5000000)
		{
			SetTimer(0.1000000, false);
			return false;
		}
		return true;
	}
	return false;
	//return;	
}

simulated function Timer()
{
	local Bot B;

	// End:0x71
	if(Instigator != none)
	{
		B = Bot(Instigator.Controller);
		// End:0x71
		if(((B != none) && B.TranslocationTarget != none) && B.bPreparingMove || ShouldTranslocatorHop(B))
		{
			FireHack(0);
		}
	}
	super.Timer();
	//return;	
}

function FireHack(byte Mode)
{
	local Actor TTarget;
	local Vector TTargetLoc;

	// End:0x336
	if(int(Mode) == 0)
	{
		// End:0x3C
		if(TransBeacon != none)
		{
			TransBeacon.bNoAI = true;
			TransBeacon.Destroy();
			TransBeacon = none;
		}
		TTarget = Bot(Instigator.Controller).TranslocationTarget;
		// End:0x6B
		if(TTarget == none)
		{
			return;
		}
		FireMode[0].PlayFiring();
		FireMode[0].FlashMuzzleFlash();
		FireMode[0].StartMuzzleSmoke();
		IncrementFlashCount(0);
		ProjectileFire(FireMode[0]).SpawnProjectile(Instigator.Location, rot(0, 0, 0));
		TTargetLoc = TTarget.Location;
		// End:0x1CD
		if(JumpSpot(TTarget) != none)
		{
			TTargetLoc.Z += JumpSpot(TTarget).TranslocZOffset;
			// End:0x1CA
			if((Instigator.Anchor != none) && Instigator.ReachedDestination(Instigator.Anchor))
			{
				TransBeacon.SetLocation(((TransBeacon.Location + Instigator.Anchor.Location) + ((Instigator.CollisionHeight - Instigator.Anchor.CollisionHeight) * vect(0.0000000, 0.0000000, 1.0000000))) - Instigator.Location);
			}			
		}
		else
		{
			// End:0x23D
			if(TTarget.Velocity != vect(0.0000000, 0.0000000, 0.0000000))
			{
				TTargetLoc += (0.3000000 * TTarget.Velocity);
				TTargetLoc.Z = 0.5000000 * (TTargetLoc.Z + TTarget.Location.Z);				
			}
			else
			{
				// End:0x2BD
				if(((int(Instigator.Physics) == int(2)) && Instigator.Location.Z < TTarget.Location.Z) && Instigator.PhysicsVolume.Gravity.Z > float(-800))
				{
					TTargetLoc.Z += float(128);
				}
			}
		}
		TransBeacon.Velocity = Bot(Instigator.Controller).AdjustToss(TransBeacon.Speed, TransBeacon.Location, TTargetLoc, false);
		TransBeacon.SetTranslocationTarget(Bot(Instigator.Controller).RealTranslocationTarget);
	}
	//return;	
}

function Class<DamageType> GetDamageType()
{
	return Class'XWeapons.DamTypeTeleFrag';
	//return;	
}

function float GetAIRating()
{
	local Bot B;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	// End:0x58
	if(B.bPreparingMove && B.TranslocationTarget != none)
	{
		return 10.0000000;
	}
	// End:0x2AD
	if((B.bTranslocatorHop && (B.Focus == B.MoveTarget) || (B.TranslocationTarget != none) && B.Focus == B.TranslocationTarget) && B.Squad.AllowTranslocationBy(B))
	{
		// End:0x28A
		if((TransBeacon != none) && TransBeacon.IsMonitoring(TransBeacon.TranslocationTarget))
		{
			// End:0x174
			if((GameObject(B.Focus) != none) && B.Focus != TransBeacon.TranslocationTarget)
			{
				// End:0x16E
				if(Instigator.Weapon == self)
				{
					SetTimer(0.2000000, false);
				}
				return 4.0000000;
			}
			// End:0x28A
			if((((((TransBeacon.TranslocationTarget == Instigator.Controller.MoveTarget) || TransBeacon.TranslocationTarget == Instigator.Controller.RouteGoal) || TransBeacon.TranslocationTarget == Instigator.Controller.RouteCache[0]) || TransBeacon.TranslocationTarget == Instigator.Controller.RouteCache[1]) || TransBeacon.TranslocationTarget == Instigator.Controller.RouteCache[2]) || TransBeacon.TranslocationTarget == Instigator.Controller.RouteCache[3])
			{
				return 4.0000000;
			}
		}
		// End:0x2A7
		if(Instigator.Weapon == self)
		{
			SetTimer(0.2000000, false);
		}
		return 4.0000000;
	}
	// End:0x2C7
	if(Instigator.Weapon == self)
	{
		return AIRating;
	}
	//return;	
}

function bool BotFire(bool bFinished, optional name FiringMode)
{
	return false;
	//return;	
}

function bool ConsumeAmmo(int Mode, float load, optional bool bAmountNeededIsMax)
{
	return true;
	//return;	
}

function ReduceAmmo()
{
	Enable('Tick');
	bDrained = false;
	AmmoChargeF -= float(1);
	RepAmmo -= 1;
	// End:0x8A
	if(Bot(Instigator.Controller) != none)
	{
		Bot(Instigator.Controller).TranslocFreq = 3.0000000 + FMax(Bot(Instigator.Controller).TranslocFreq, Level.TimeSeconds);
	}
	//return;	
}

simulated function GetAmmoCount(out float MaxAmmoPrimary, out float CurAmmoPrimary)
{
	MaxAmmoPrimary = AmmoChargeMax;
	CurAmmoPrimary = FMax(0.0000000, AmmoChargeF);
	//return;	
}

function GiveAmmo(int M, WeaponPickup WP, bool bJustSpawned)
{
	super.GiveAmmo(M, WP, bJustSpawned);
	AmmoChargeF = default.AmmoChargeF;
	RepAmmo = int(AmmoChargeF);
	//return;	
}

function DrainCharges()
{
	Enable('Tick');
	PreDrainAmmo = AmmoChargeF;
	AmmoChargeF = -1.0000000;
	RepAmmo = -1;
	bDrained = true;
	// End:0x7B
	if(Bot(Instigator.Controller) != none)
	{
		Bot(Instigator.Controller).NextTranslocTime = Level.TimeSeconds + 3.5000000;
	}
	//return;	
}

simulated function bool StartFire(int Mode)
{
	// End:0x60
	if(((!bPrevWeaponSwitch || Mode == 1) || int(Instigator.Controller.bAltFire) == 0) || PlayerController(Instigator.Controller) == none)
	{
		return super.StartFire(Mode);
	}
	// End:0x93
	if((OldWeapon != none) && OldWeapon.HasAmmo())
	{
		Instigator.PendingWeapon = OldWeapon;
	}
	ClientStopFire(0);
	Instigator.Controller.StopFiring();
	PutDown();
	return false;
	//return;	
}

simulated function Tick(float dt)
{
	// End:0x183
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x46
		if(AmmoChargeF >= AmmoChargeMax)
		{
			// End:0x3D
			if(RepAmmo != int(AmmoChargeF))
			{
				RepAmmo = int(AmmoChargeF);
			}
			Disable('Tick');
			return;
		}
		AmmoChargeF += (dt * AmmoChargeRate);
		AmmoChargeF = FMin(AmmoChargeF, AmmoChargeMax);
		// End:0x85
		if(AmmoChargeF >= 1.5000000)
		{
			bDrained = false;			
		}
		else
		{
			// End:0x162
			if(bDrained)
			{
				// End:0xE5
				if((Bomb == none) && Level.Game.IsA('xBombingRun'))
				{
					Bomb = xBombFlag(UnrealMPGameInfo(Level.Game).GetGameObject('xBombFlag'));
				}
				// End:0x162
				if((Bomb != none) && Bomb.Holder != none)
				{
					bDrained = false;
					AmmoChargeF = 1.5000000;
					// End:0x162
					if(Bot(Instigator.Controller) != none)
					{
						Bot(Instigator.Controller).NextTranslocTime = Level.TimeSeconds - float(1);
					}
				}
			}
		}
		// End:0x180
		if(RepAmmo != int(AmmoChargeF))
		{
			RepAmmo = int(AmmoChargeF);
		}		
	}
	else
	{
		AmmoChargeF = FMin(((float(RepAmmo) + AmmoChargeF) - float(int(AmmoChargeF))) + (dt * AmmoChargeRate), AmmoChargeMax);
	}
	//return;	
}

simulated function DoAutoSwitch()
{
	//return;	
}

simulated function ViewPlayer()
{
	// End:0xD5
	if((PlayerController(Instigator.Controller) != none) && PlayerController(Instigator.Controller).ViewTarget == TransBeacon)
	{
		PlayerController(Instigator.Controller).ClientSetViewTarget(Instigator);
		PlayerController(Instigator.Controller).SetViewTarget(Instigator);
		// End:0xD5
		if(TransBeacon != none)
		{
			TransBeacon.SetRotation(PlayerController(Instigator.Controller).Rotation);
			TransBeacon.SoundVolume = TransBeacon.default.SoundVolume;
		}
	}
	//return;	
}

simulated function ViewCamera()
{
	// End:0xA8
	if(TransBeacon != none)
	{
		// End:0xA8
		if(Instigator.Controller.IsA('PlayerController'))
		{
			PlayerController(Instigator.Controller).SetViewTarget(TransBeacon);
			PlayerController(Instigator.Controller).ClientSetViewTarget(TransBeacon);
			PlayerController(Instigator.Controller).SetRotation(TransBeacon.Rotation);
			TransBeacon.SoundVolume = ViewBeaconVolume;
		}
	}
	//return;	
}

simulated function Reselect()
{
	// End:0x5B
	if((TransBeacon == none) || Instigator.Controller.IsA('PlayerController') && PlayerController(Instigator.Controller).ViewTarget == TransBeacon)
	{
		ViewPlayer();		
	}
	else
	{
		ViewCamera();
	}
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	local float tileScaleX, tileScaleY, Dist, clr, NewTranslocScale;

	// End:0x2A7
	if((PlayerController(Instigator.Controller) != none) && PlayerController(Instigator.Controller).ViewTarget == TransBeacon)
	{
		tileScaleX = FMin(float(Canvas.SizeX) / 640.0000000, float(Canvas.SizeY) / 480.0000000);
		tileScaleY = tileScaleX;
		Canvas.DrawColor.R = byte(255);
		Canvas.DrawColor.G = byte(255);
		Canvas.DrawColor.B = byte(255);
		Canvas.DrawColor.A = byte(255);
		Canvas.Style = byte(255);
		Canvas.SetPos(0.0000000, 0.0000000);
		Canvas.DrawTile(FinalBlend'XGameShaders.ZoomFX.TransCamFB', float(Canvas.SizeX), float(Canvas.SizeY), 0.0000000, 0.0000000, 512.0000000, 512.0000000);
		Canvas.SetPos(0.0000000, 0.0000000);
		// End:0x2A4
		if(!Level.IsSoftwareRendering())
		{
			Dist = VSize(TransBeacon.Location - Instigator.Location);
			// End:0x1C3
			if(Dist > MaxCamDist)
			{
				clr = 255.0000000;				
			}
			else
			{
				clr = Dist / MaxCamDist;
				clr *= 255.0000000;
			}
			clr = float(Clamp(int(clr), 20, 255));
			Canvas.DrawColor.R = byte(clr);
			Canvas.DrawColor.G = byte(clr);
			Canvas.DrawColor.B = byte(clr);
			Canvas.DrawColor.A = byte(255);
			Canvas.DrawTile(FinalBlend'XGameShaders.ZoomFX.ScreenNoiseFB', float(Canvas.SizeX), float(Canvas.SizeY), 0.0000000, 0.0000000, 512.0000000, 512.0000000);
		}		
	}
	else
	{
		// End:0x2C0
		if(TransBeacon == none)
		{
			NewTranslocScale = 1.0000000;			
		}
		else
		{
			NewTranslocScale = 0.0000000;
		}
		// End:0x2F6
		if(NewTranslocScale != TranslocScale)
		{
			TranslocScale = NewTranslocScale;
			SetBoneScale(0, TranslocScale, 'Beacon');
		}
		// End:0x354
		if(TranslocScale != float(0))
		{
			TranslocRot.Yaw += int(float(120000) * (Level.TimeSeconds - OldTime));
			OldTime = Level.TimeSeconds;
			SetBoneRotation('Beacon', TranslocRot, 0);
		}
		// End:0x3CF
		if((!bTeamSet && Instigator.PlayerReplicationInfo != none) && Instigator.PlayerReplicationInfo.Team != none)
		{
			bTeamSet = true;
			// End:0x3CF
			if(Instigator.PlayerReplicationInfo.Team.TeamIndex == 1)
			{
				Skins[1] = Texture'WeaponSkins.Skins.NEWTranslocatorBLUE';
			}
		}
		super.RenderOverlays(Canvas);
	}
	//return;	
}

simulated function bool PutDown()
{
	ViewPlayer();
	return super.PutDown();
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(TransBeacon != none)
	{
		TransBeacon.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function float ChargeBar()
{
	return AmmoChargeF - float(int(AmmoChargeF));
	//return;	
}

defaultproperties
{
	MaxCamDist=4000.0000000
	AmmoChargeF=6.0000000
	RepAmmo=6
	AmmoChargeMax=6.0000000
	AmmoChargeRate=0.4000000
	bPrevWeaponSwitch=true
	ViewBeaconVolume=40
	TranslocScale=1.0000000
	FireModeClass[0]=Class'XWeapons.TransFire'
	FireModeClass[1]=Class'XWeapons.TransRecall'
	PutDownAnim="PutDown"
	IdleAnimRate=0.2500000
	SelectSound=Sound'WeaponSounds.Misc.translocator_change'
	SelectForce="Translocator_change"
	AIRating=-1.0000000
	CurrentRating=-1.0000000
	bShowChargingBar=true
	bCanThrow=false
	Description="The Translocator was originally designed by Liandri Corporation's R&D sector to facilitate the rapid recall of miners during tunnel collapses. However, rapid deresolution and reconstitution can have several unwelcome effects, including increases in aggression and paranoia.||In order to prolong the careers of today's contenders, limits have been placed on Translocator use in the lower-ranked leagues. The latest iteration of the Translocator features a remotely operated camera, exceptionally useful when scouting out areas of contention.|It should be noted that while viewing the camera's surveillance output, the user is effectively blind to their immediate surroundings."
	EffectOffset=(X=100.0000000,Y=30.0000000,Z=-19.0000000)
	DisplayFOV=60.0000000
	Priority=1
	HudColor=(R=0,G=0,B=255,A=255)
	SmallViewOffset=(X=38.0000000,Y=16.0000000,Z=-16.0000000)
	CenteredOffsetY=0.0000000
	CenteredRoll=0
	CustomCrosshair=2
	CustomCrossHairColor=(R=0,G=0,B=255,A=255)
	CustomCrossHairTextureName="Crosshairs.Hud.Crosshair_Cross3"
	InventoryGroup=10
	PickupClass=Class'XWeapons.Transpickup'
	PlayerViewOffset=(X=28.5000000,Y=12.0000000,Z=-12.0000000)
	PlayerViewPivot=(Pitch=1000,Yaw=400,Roll=0)
	BobDamping=1.8000000
	AttachmentClass=Class'XWeapons.TransAttachment'
	IconMaterial=Texture'HudContent.Generic.HUD'
	IconCoords=(X1=0,Y1=0,X2=2,Y2=2)
	ItemName="Translocator"
	Mesh=SkeletalMesh'NewWeapons2004.NewTranslauncher_1st'
	DrawScale=0.8000000
	Skins[0]=FinalBlend'EpicParticles.JumpPad.NewTransLaunBoltFB'
	Skins[1]=Texture'WeaponSkins.Skins.NEWTranslocatorTEX'
	Skins[2]=Texture'WeaponSkins.AmmoPickups.NEWTranslocatorPUCK'
	Skins[3]=FinalBlend'WeaponSkins.AmmoPickups.NewTransGlassFB'
}
