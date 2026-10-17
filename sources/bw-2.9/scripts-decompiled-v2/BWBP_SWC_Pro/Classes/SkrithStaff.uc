class SkrithStaff extends BallisticWeapon
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

var Actor GlowFX;
var float lastModeChangeTime;
var bool bLaserOn;
var LaserActor Laser;
var Emitter LaserDot;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientSwitchCannonMode, ClientSwitchLaser;
}

simulated event RenderOverlays(Canvas C)
{
	super.RenderOverlays(C);
	DrawLaserSight(C);
	//return;	
}

simulated event PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x1F
	if(Laser == none)
	{
		Laser = Spawn(Class'BWBP_SWC_Pro.LaserActor_SSRed');
	}
	//return;	
}

simulated function ClientSwitchLaser(bool bNewLaserOn)
{
	// End:0x25
	if((bLaserOn == bNewLaserOn) || int(Role) == int(ROLE_Authority))
	{
		return;
	}
	bLaserOn = bNewLaserOn;
	// End:0x43
	if(!bLaserOn)
	{
		KillLaserDot();
	}
	//return;	
}

simulated function SwitchLaser(bool bNewLaserOn)
{
	// End:0x13
	if(bLaserOn == bNewLaserOn)
	{
		return;
	}
	bLaserOn = bNewLaserOn;
	ClientSwitchLaser(bLaserOn);
	// End:0x64
	if((int(Role) == int(ROLE_Authority)) && ThirdPersonActor != none)
	{
		SkrithStaffAttachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	// End:0x75
	if(!bLaserOn)
	{
		KillLaserDot();
	}
	//return;	
}

simulated function DrawLaserSight(Canvas Canvas)
{
	local Vector HitLocation, Start, End, HitNormal, Scale3D, loc;

	local Rotator AimDir;
	local Actor Other;
	local bool bAimAligned;

	// End:0x1F
	if((int(ClientState) == int(1)) || !bLaserOn)
	{
		return;
	}
	AimDir = BallisticFire(FireMode[0]).GetFireAim(Start);
	loc = GetBoneCoords('Muzzle').Origin;
	End = Start + (Normal(Vector(AimDir)) * float(3000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	// End:0xB7
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0xE1
	if((int(ReloadState) == int(0)) && int(ClientState) == int(4))
	{
		bAimAligned = true;
	}
	// End:0x105
	if(bAimAligned && Other != none)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x18F
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
		LaserDot.SetRotation(Rotator(HitNormal));
		LaserDot.Emitters[5].AutomaticInitialSpawning = Other.bWorldGeometry;
		Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	}
	Laser.SetLocation(loc);
	HitLocation = ConvertFOVs(End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x1F8
	if(bAimAligned)
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		AimDir = GetBoneRotation('Muzzle');
		Laser.SetRotation(AimDir);
	}
	Scale3D.X = VSize(HitLocation - loc) / float(128);
	Scale3D.Y = 10.0000000;
	Scale3D.Z = 10.0000000;
	Laser.SetDrawScale3D(Scale3D);
	Canvas.DrawActor(Laser, false, false, DisplayFOV);
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

simulated function SpawnLaserDot(Vector loc)
{
	// End:0x20
	if(LaserDot == none)
	{
		LaserDot = Spawn(Class'BallisticProV55.IE_GRS9LaserHit',,, loc);
	}
	//return;	
}

simulated function KillLaserDot()
{
	// End:0x32
	if(LaserDot != none)
	{
		LaserDot.bHidden = false;
		LaserDot.Kill();
		LaserDot = none;
	}
	//return;	
}

static function Class<Pickup> RecommendAmmoPickup(int Mode)
{
	return Class'BWBP_SWC_Pro.AP_SkrithStaffClip';
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

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	SoundPitch = 45;
	GunLength = default.GunLength;
	// End:0xA9
	if(((Instigator.IsLocallyControlled() && int(Level.DetailMode) == int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2) && (GlowFX == none) || GlowFX.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GlowFX, Class'BWBP_SWC_Pro.SkrithStaffGlowFX', DrawScale, self, 'Muzzle');
	}
	//return;	
}

simulated event Timer()
{
	// End:0x24
	if(int(ClientState) == int(3))
	{
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(GlowFX);
	}
	super.Timer();
	//return;	
}

simulated function bool PutDown()
{
	// End:0x32
	if(super.PutDown())
	{
		KillLaserDot();
		// End:0x30
		if(ThirdPersonActor != none)
		{
			SkrithStaffAttachment(ThirdPersonActor).bLaserOn = false;
		}
		return true;
	}
	return false;
	//return;	
}

simulated function Destroyed()
{
	default.bLaserOn = false;
	// End:0x1F
	if(Laser != none)
	{
		Laser.Destroy();
	}
	// End:0x36
	if(LaserDot != none)
	{
		LaserDot.Destroy();
	}
	// End:0x4D
	if(GlowFX != none)
	{
		GlowFX.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function Notify_ClipIn()
{
	local int AmmoNeeded;

	ReloadState = 3;
	PlayOwnedSound(ClipInSound.Sound, ClipInSound.Slot, ClipInSound.Volume, ClipInSound.bNoOverride, ClipInSound.Radius, ClipInSound.Pitch, ClipInSound.bAtten);
	// End:0xE0
	if(int(Level.NetMode) != int(NM_Client))
	{
		AmmoNeeded = (default.MagAmmo + (0 + Rand(0))) - MagAmmo;
		// End:0xBD
		if(AmmoNeeded > Ammo[0].AmmoAmount)
		{
			MagAmmo += Ammo[0].AmmoAmount;			
		}
		else
		{
			MagAmmo += AmmoNeeded;
		}
		Ammo[0].UseAmmo(AmmoNeeded, true);
	}
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

function byte BestMode()
{
	local Bot B;
	local float dist;
	local Vector Dir;
	local Vehicle V;

	// End:0x0E
	if(MagAmmo < 1)
	{
		return 1;
	}
	B = Bot(Instigator.Controller);
	// End:0x4F
	if((B == none) || B.Enemy == none)
	{
		return byte(Rand(2));
	}
	Dir = Instigator.Location - B.Enemy.Location;
	dist = VSize(Dir);
	// End:0x175
	if((((DestroyableObjective(B.Squad.SquadObjective) != none) && B.Squad.SquadObjective.TeamLink(B.GetTeamNum())) || ((B.Squad.SquadObjective == none) && DestroyableObjective(B.Target) != none) && B.Target.TeamLink(B.GetTeamNum())) && (B.Enemy == none) || !B.EnemyVisible())
	{
		return 0;
	}
	// End:0x1B1
	if(FocusOnLeader(B.Focus == B.Squad.SquadLeader.Pawn))
	{
		return 0;
	}
	// End:0x1C5
	if(dist > float(300))
	{
		return 0;
	}
	V = B.Squad.GetLinkVehicle(B);
	// End:0x20C
	if(V == none)
	{
		V = Vehicle(B.MoveTarget);
	}
	// End:0x227
	if(V == B.Target)
	{
		return 0;
	}
	// End:0x288
	if((((V != none) && float(V.Health) < V.HealthMax) && V.LinkHealMult > float(0)) && B.LineOfSightTo(V))
	{
		return 0;
	}
	// End:0x2A6
	if(dist < FireMode[1].MaxRange())
	{
		return 1;
	}
	return 0;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float Result, dist;
	local Vector Dir;
	local DestroyableObjective O;
	local Vehicle V;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	// End:0x28F
	if((HasMagAmmo(0)) || Ammo[0].AmmoAmount > 0)
	{
		V = B.Squad.GetLinkVehicle(B);
		// End:0xFD
		if((((V != none) && VSize(Instigator.Location - V.Location) < (1.5000000 * FireMode[0].MaxRange())) && float(V.Health) < V.HealthMax) && V.LinkHealMult > float(0))
		{
			return 1.2000000;
		}
		// End:0x1AB
		if((((Vehicle(B.RouteGoal) != none) && B.Enemy == none) && VSize(Instigator.Location - B.RouteGoal.Location) < (1.5000000 * FireMode[0].MaxRange())) && Vehicle(B.RouteGoal).TeamLink(B.GetTeamNum()))
		{
			return 1.2000000;
		}
		O = DestroyableObjective(B.Squad.SquadObjective);
		// End:0x28F
		if((((((O != none) && B.Enemy == none) && O.TeamLink(B.GetTeamNum())) && O.Health < O.DamageCapacity) && VSize(Instigator.Location - O.Location) < (1.1000000 * FireMode[0].MaxRange())) && B.LineOfSightTo(O))
		{
			return 1.2000000;
		}
	}
	// End:0x2AA
	if(B.Enemy == none)
	{
		return super.GetAIRating();
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Result = super.GetAIRating();
	// End:0x347
	if(!HasMagAmmo(0) && Ammo[0].AmmoAmount < 1)
	{
		// End:0x32C
		if(dist > float(400))
		{
			return 0.0000000;
		}
		return Result / (float(1) + (dist / float(400)));
	}
	// End:0x376
	if(dist > float(1300))
	{
		Result -= ((dist - float(1000)) / float(3000));
	}
	// End:0x393
	if(dist < float(500))
	{
		Result += 0.5000000;
	}
	// End:0x3E9
	if(Result < 0.1400000)
	{
		// End:0x3E6
		if(int(CurrentWeaponMode) != 0)
		{
			lastModeChangeTime = Level.TimeSeconds;
			CurrentWeaponMode = 0;
			SkrithStaffPrimaryFire(FireMode[0]).SwitchCannonMode(CurrentWeaponMode);
		}		
	}
	else
	{
		// End:0x44A
		if((Result < 0.3400000) && MagAmmo > 10)
		{
			// End:0x44A
			if(int(CurrentWeaponMode) != 1)
			{
				lastModeChangeTime = Level.TimeSeconds;
				CurrentWeaponMode = 1;
				SkrithStaffPrimaryFire(FireMode[0]).SwitchCannonMode(CurrentWeaponMode);
			}
		}
	}
	return Result;
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
	// End:0x15E
	if(!bLeaderFiring)
	{
		return false;
	}
	// End:0x20C
	if(Vehicle(LeaderPawn) != none)
	{
		StartTrace = Instigator.Location + Instigator.EyePosition();
		// End:0x20C
		if(VSize(LeaderPawn.Location - StartTrace) < FireMode[0].MaxRange())
		{
			Other = Trace(HitLocation, HitNormal, LeaderPawn.Location, StartTrace, true);
			// End:0x20C
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

function float SuggestAttackStyle()
{
	// End:0x22
	if(!HasNonMagAmmo(0) && !HasMagAmmo(0))
	{
		return 1.2000000;
	}
	return 0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.5000000;
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

function ServerSwitchWeaponMode(byte newmode)
{
	// End:0x25
	if((int(CurrentWeaponMode) > 0) && FireMode[0].IsFiring())
	{
		return;
	}
	super.ServerSwitchWeaponMode(newmode);
	// End:0x5F
	if(!Instigator.IsLocallyControlled())
	{
		SkrithStaffPrimaryFire(FireMode[0]).SwitchCannonMode(CurrentWeaponMode);
	}
	ClientSwitchCannonMode(CurrentWeaponMode);
	//return;	
}

simulated function ClientSwitchCannonMode(byte newmode)
{
	SkrithStaffPrimaryFire(FireMode[0]).SwitchCannonMode(newmode);
	//return;	
}

defaultproperties
{
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;25.0;0.5;85.0;0.2;0.2;0.2")
	ParamsClasses[0]=Class'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_SWC_Pro.SkrithStaffWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Pullout',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Putaway',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Plasma Charge",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Plasma Bomb",bUnavailable=false,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="ALaser",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="BLaser",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="CLaser",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNonCocking=true
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.7000000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc7',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Cross4',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=68,B=67,A=137),Color2=(R=255,G=185,B=96,A=208),StartSize1=133,StartSize2=47)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=3.0000000,CurrentScale=0.0000000)
	MeleeFireClass=Class'BWBP_SWC_Pro.SkrithStaffMeleeFire'
	bWT_RapidProj=true
	bWT_Energy=true
	UsedAmbientSound=Sound'BW_Core_WeaponSound.A73.A73Hum1'
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	SightOffset=(X=-20.0000000,Y=0.3100000,Z=12.5000000)
	MagAmmo=60
	GunLength=128.0000000
	FireModeClass[0]=Class'BWBP_SWC_Pro.SkrithStaffPrimaryFire'
	FireModeClass[1]=Class'BWBP_SWC_Pro.SkrithStaffSecondaryFire'
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	bMeleeWeapon=true
	Description="In Skrith culture, staffs are given to those who showed fearsome prowess and cunning in the field, usually fitted with blades and nothing more. Although these days, with bullet weaponry and other fancy tech, the Skrith had to adapt or else be humiliated by their terran enemies. Modifying their old staffs with the A73 tech, these can now contend with their mortal enemies with plasma bolts, bombs and a continuous beam, the Skrith can reward their elite few with this new staff. Few have seen this weapon in action, those who do have dubbed it the 'Shillelagh' due to its power to knock people down and out, permanently."
	Priority=92
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=5
	PickupClass=Class'BWBP_SWC_Pro.SkrithStaffPickup'
	PlayerViewOffset=(X=9.0000000,Y=4.0000000,Z=-7.0000000)
	BobDamping=1.6000000
	AttachmentClass=Class'BWBP_SWC_Pro.SkrithStaffAttachment'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="A2-W Skrith Shillelagh"
	LightType=2
	LightEffect=13
	LightHue=180
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	SoundPitch=32
	SoundRadius=32.0000000
}
