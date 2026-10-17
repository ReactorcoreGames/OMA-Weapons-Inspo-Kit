class E5PlasmaRifle extends BallisticWeapon
	config(BallisticProV55);

var bool bLaserOn;
var LaserActor Laser;
var Emitter LaserDot;
var() float ScopePopupHeight;
var float ScopeExtension;
var float LastSightDownTime;
var bool bScopeVisible;
var byte ModeBefore;
var float lastModeChangeTime;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientSwitchLaser;
}

simulated event PostNetBeginPlay()
{
	local Vector V;

	super.PostNetBeginPlay();
	E5PrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
	// End:0x3A
	if(Laser == none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor_VPR');
	}
	V.Y = ScopePopupHeight;
	SetBoneLocation('RDS', V, 1.0000000);
	SetBoneScale(1, 0.0000000, 'RDS');
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

simulated function SpawnLaserDot(Vector loc)
{
	// End:0x20
	if(LaserDot == none)
	{
		LaserDot = Spawn(Class'BallisticProV55.IE_VPRLaserHit',,, loc);
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
		E5Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	// End:0x75
	if(!bLaserOn)
	{
		KillLaserDot();
	}
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
			E5Attachment(ThirdPersonActor).bLaserOn = false;
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
	super.Destroyed();
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
	loc = GetBoneCoords('tip').Origin;
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
		AimDir = GetBoneRotation('tip');
		Laser.SetRotation(AimDir);
	}
	Scale3D.X = VSize(HitLocation - loc) / float(128);
	Scale3D.Y = 4.0000000;
	Scale3D.Z = 4.0000000;
	Laser.SetDrawScale3D(Scale3D);
	Canvas.DrawActor(Laser, false, false, DisplayFOV);
	//return;	
}

simulated function TickSighting(float dt)
{
	local Rotator FT;

	// End:0x11C
	if((((int(SightingState) == int(0)) && Instigator.IsLocallyControlled()) && LastSightDownTime > float(0)) && (Level.TimeSeconds - LastSightDownTime) > float(2))
	{
		// End:0x7C
		if(bScopeVisible)
		{
			bScopeVisible = !bScopeVisible;
			SetBoneScale(1, 0.0000000, 'RDS');
		}
		ScopeExtension = FMax(0.0000000, ScopeExtension - (dt / float(2)));
		FT.Roll = int(float(16384) * ScopeExtension);
		SetBoneRotation('RDSFlapLeft', FT);
		FT.Roll = int(float(-16384) * ScopeExtension);
		SetBoneRotation('RDSFlapRight', FT);
		// End:0x11A
		if((Level.TimeSeconds - LastSightDownTime) > float(5))
		{
			LastSightDownTime = 0.0000000;
		}
		return;
	}
	// End:0x140
	if((int(SightingState) == int(0)) || int(SightingState) == int(3))
	{
		return;
	}
	super.TickSighting(dt);
	// End:0x161
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	// End:0x1E9
	if(int(SightingState) == int(2))
	{
		ScopeExtension = FMin(1.0000000, ScopeExtension + (dt * float(2)));
		FT.Roll = int(float(16384) * ScopeExtension);
		SetBoneRotation('RDSFlapLeft', FT);
		FT.Roll = int(float(-16384) * ScopeExtension);
		SetBoneRotation('RDSFlapRight', FT);		
	}
	else
	{
		// End:0x272
		if(int(SightingState) == int(3))
		{
			// End:0x224
			if(!bScopeVisible)
			{
				bScopeVisible = !bScopeVisible;
				SetBoneScale(1, 1.0000000, 'RDS');
			}
			ScopeExtension = 1.0000000;
			FT.Roll = 16384;
			SetBoneRotation('RDSFlapLeft', FT);
			FT.Roll = -16384;
			SetBoneRotation('RDSFlapRight', FT);			
		}
		else
		{
			// End:0x296
			if(int(SightingState) == int(0))
			{
				LastSightDownTime = Level.TimeSeconds;
			}
		}
	}
	//return;	
}

simulated event DrawFPWeapon(Canvas C)
{
	super.DrawFPWeapon(C);
	DrawLaserSight(C);
	//return;	
}

simulated function DrawScopeOverlays(Canvas C)
{
	DrawLaserSight(C);
	super.DrawScopeOverlays(C);
	//return;	
}

simulated function bool HasAmmo()
{
	// End:0x38
	if((!bNoMag && FireMode[0] != none) && MagAmmo >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	// End:0x7D
	if(((Ammo[0] != none) && FireMode[0] != none) && Ammo[0].AmmoAmount >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	return false;
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float dist, Result;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0x129
	if((((DestroyableObjective(B.Squad.SquadObjective) != none) && B.Squad.SquadObjective.TeamLink(B.GetTeamNum())) || ((B.Squad.SquadObjective == none) && DestroyableObjective(B.Target) != none) && B.Target.TeamLink(B.GetTeamNum())) && (B.Enemy == none) || !B.EnemyVisible())
	{
		return 1;
	}
	// End:0x165
	if(FocusOnLeader(B.Focus == B.Squad.SquadLeader.Pawn))
	{
		return 1;
	}
	// End:0x1BB
	if(((Level.TimeSeconds - lastModeChangeTime) < (1.4000000 - (B.Skill * 0.1000000))) && (MagAmmo > 8) || int(CurrentWeaponMode) != 1)
	{
		return 0;
	}
	dist = VSize(Instigator.Location - B.Enemy.Location);
	Result = 0.3500000 + (FRand() * 0.4000000);
	// End:0x247
	if(dist < float(1000))
	{
		Result *= FMax(0.6500000 - (B.Skill * 0.1100000), dist / float(1000));		
	}
	else
	{
		// End:0x2AC
		if(dist > float(3000))
		{
			// End:0x286
			if((dist < float(5000)) && FRand() > 0.9000000)
			{
				Result -= 0.4000000;				
			}
			else
			{
				Result += (0.2000000 + (B.Skill * 0.1000000));
			}			
		}
		else
		{
			Result += ((dist - float(1000)) / float(4000));
		}
	}
	// End:0x31A
	if((MagAmmo > 8) && Result < 0.3500000)
	{
		// End:0x317
		if(int(CurrentWeaponMode) != 1)
		{
			CurrentWeaponMode = 1;
			E5PrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
		}		
	}
	else
	{
		// End:0x36B
		if((MagAmmo > 5) && Result > 0.6000000)
		{
			// End:0x368
			if(int(CurrentWeaponMode) != 2)
			{
				CurrentWeaponMode = 2;
				E5PrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
			}			
		}
		else
		{
			// End:0x39B
			if(int(CurrentWeaponMode) != 0)
			{
				CurrentWeaponMode = 0;
				E5PrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
			}
		}
	}
	lastModeChangeTime = Level.TimeSeconds;
	return 0;
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
	// End:0x3E
	if(RecommendHeal(B))
	{
		return 1.2000000;
	}
	return super.GetAIRating();
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

function float SuggestAttackStyle()
{
	switch(CurrentWeaponMode)
	{
		// End:0x12
		case 0:
			return -0.2000000;
		// End:0x1D
		case 1:
			return 0.8000000;
		// End:0x28
		case 2:
			return -0.7000000;
		// End:0xFFFF
		default:
			return 0.0000000;
			break;
	}
	//return;	
}

function float SuggestDefenseStyle()
{
	switch(CurrentWeaponMode)
	{
		// End:0x12
		case 0:
			return 0.2000000;
		// End:0x1D
		case 1:
			return -0.8000000;
		// End:0x28
		case 2:
			return 0.7000000;
		// End:0xFFFF
		default:
			return 0.0000000;
			break;
	}
	//return;	
}

simulated function float ChargeBar()
{
	return FMax(0.0000000, (E5PrimaryFire(FireMode[0]).NextSGFireTime - Level.TimeSeconds) / 1.5000000);
	//return;	
}

defaultproperties
{
	ScopePopupHeight=-3.0000000
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;25.0;0.9;80.0;0.2;0.4;0.1")
	ParamsClasses[0]=Class'BWBP_APC_Pro.E5WeaponParams'
	ParamsClasses[1]=Class'BWBP_APC_Pro.E5WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_APC_Pro.E5WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_APC_Pro.E5WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_APC_Tex.MVPR.BigIcon_MVPR'
	BigIconCoords=(X1=0,Y1=36,X2=511,Y2=225)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Pullout',Volume=0.1550000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Putaway',Volume=0.1550000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Series Pulse",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Multi Pulse",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Sniper Pulse",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightFXClass=Class'BWBP_APC_Pro.E5ClipEffect'
	SightFXBone="MagFX"
	ScopeXScale=1.3333000
	bNoCrosshairInScope=true
	bNonCocking=true
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.7000000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc7',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.PentagramInA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=52,G=42,B=75,A=125),Color2=(R=224,G=224,B=0,A=138),StartSize1=90,StartSize2=61)
	bWT_RapidProj=true
	bWT_Energy=true
	ManualLines[0]="Series mode fires a continuous stream of high damage projectiles, which gain damage over range.|Multi mode fires three projectiles simultaneously in a spread pattern, mimicking a shotgun."
	ManualLines[1]="Projects a hitscan beam with almost no recoil but low damage output."
	ManualLines[2]=""
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	SightOffset=(X=2.0000000,Y=-0.8500000,Z=10.8500000)
	FireModeClass[0]=Class'BWBP_APC_Pro.E5PrimaryFire'
	FireModeClass[1]=Class'BWBP_APC_Pro.E5SecondaryFire'
	SelectAnimRate=1.2500000
	PutDownTime=0.6000000
	BringUpTime=0.5500000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6500000
	CurrentRating=0.6500000
	bShowChargingBar=true
	Description="Following the success of the E23 Plasma Rifle, Frontier Tech began another prototype, originally it was to be a modular system and an improvement to the original model.  But lack of finances among other technical issues forced the company to make drastic alterations.  It took a lot of work, but soon, the E5 Advanced Science Pistol or 'ASP' was born.  Firing the same variable high-power plasma bolts like the E23, it comes in a more portable package at the cost of losing a powerful single shot bolt and night vision scope. Instead, it comes with a pop up reflex sight, a requested change from the various light infantry sectors across the galaxy, the E5 should do well during the next year if all goes to plan."
	Priority=39
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=3
	GroupOffset=12
	PickupClass=Class'BWBP_APC_Pro.E5Pickup'
	PlayerViewOffset=(X=-6.0000000,Y=4.0000000,Z=-10.0000000)
	BobDamping=2.2000000
	AttachmentClass=Class'BWBP_APC_Pro.E5Attachment'
	IconMaterial=Texture'BWBP_APC_Tex.MVPR.SmallIcon_MVPR'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=40)
	ItemName="E-5 'AsP' Plasma Pistol"
	LightType=2
	LightEffect=13
	LightHue=64
	LightSaturation=96
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BWBP_APC_Anim.E5Plasma_FPm'
	DrawScale=0.2000000
	bFullVolume=true
	SoundRadius=32.0000000
}
