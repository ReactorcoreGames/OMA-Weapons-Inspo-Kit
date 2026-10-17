class E23PlasmaRifle extends BallisticWeapon
	config(BallisticProV55);

var bool bLaserOn;
var LaserActor Laser;
var Emitter LaserDot;
var bool bNightVision;
var Actor NVLight;
var() float ScopePopupHeight;
var float ScopeExtension;
var float LastSightDownTime;
var byte ModeBefore;
var float lastModeChangeTime;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientSwitchLaser;

	// Pos:0x00D
	reliable if(((int(Role) == int(ROLE_Authority)) && bNetDirty) && bNetOwner)
		bNightVision;
}

simulated event PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x30
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassic())
	{
		E23PrimaryFire(FireMode[0]).SGFireCount = 9;
	}
	E23PrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
	// End:0x64
	if(Laser == none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor_VPR');
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
		E23Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
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
			E23Attachment(ThirdPersonActor).bLaserOn = false;
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
	if(NVLight != none)
	{
		NVLight.Destroy();
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
	// End:0x85
	if(bScopeView)
	{
		loc = Instigator.Location + (vect(0.0000000, 0.0000000, 1.0000000) * (Instigator.EyeHeight - float(8)));		
	}
	else
	{
		loc = GetBoneCoords('tip').Origin;
	}
	End = Start + (Normal(Vector(AimDir)) * float(3000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	// End:0xFC
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x126
	if((int(ReloadState) == int(0)) && int(ClientState) == int(4))
	{
		bAimAligned = true;
	}
	// End:0x14A
	if(bAimAligned && Other != none)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x1D4
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
		LaserDot.SetRotation(Rotator(HitNormal));
		LaserDot.Emitters[5].AutomaticInitialSpawning = Other.bWorldGeometry;
		Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	}
	Laser.SetLocation(loc);
	HitLocation = ConvertFOVs(End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x23D
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
	local Vector V;

	// End:0xC9
	if((((int(SightingState) == int(0)) && Instigator.IsLocallyControlled()) && LastSightDownTime > float(0)) && (Level.TimeSeconds - LastSightDownTime) > float(10))
	{
		ScopeExtension = FMax(0.0000000, ScopeExtension - (dt / float(4)));
		V.Z = ScopePopupHeight * ScopeExtension;
		SetBoneLocation('Scope', V, 1.0000000);
		// End:0xC7
		if((Level.TimeSeconds - LastSightDownTime) > float(14))
		{
			LastSightDownTime = 0.0000000;
		}
		return;
	}
	// End:0xED
	if((int(SightingState) == int(0)) || int(SightingState) == int(3))
	{
		return;
	}
	super.TickSighting(dt);
	// End:0x10E
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	// End:0x16C
	if(int(SightingState) == int(2))
	{
		ScopeExtension = FMin(1.0000000, ScopeExtension + (dt * float(2)));
		V.Z = ScopePopupHeight * ScopeExtension;
		SetBoneLocation('Scope', V, 1.0000000);		
	}
	else
	{
		// End:0x1AF
		if(int(SightingState) == int(3))
		{
			ScopeExtension = 1.0000000;
			V.Z = ScopePopupHeight;
			SetBoneLocation('Scope', V, 1.0000000);			
		}
		else
		{
			// End:0x1D3
			if(int(SightingState) == int(0))
			{
				LastSightDownTime = Level.TimeSeconds;
			}
		}
	}
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	bNightVision = !bNightVision;
	//return;	
}

simulated event WeaponTick(float dt)
{
	local Actor t;
	local Vector HitLoc, HitNorm, Start, End;

	super.WeaponTick(dt);
	// End:0x21
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	// End:0x12D
	if(bNightVision && bScopeView)
	{
		SetNVLight(true);
		Start = Instigator.Location + Instigator.EyePosition();
		End = Start + (Vector(Instigator.GetViewRotation()) * float(1500));
		t = Trace(HitLoc, HitNorm, End, Start, true, vect(16.0000000, 16.0000000, 16.0000000));
		// End:0xC9
		if(t == none)
		{
			HitLoc = End;
		}
		// End:0x10C
		if(VSize(HitLoc - Start) > float(400))
		{
			NVLight.SetLocation(Start + ((HitLoc - Start) * 0.5000000));			
		}
		else
		{
			NVLight.SetLocation(HitLoc + (HitNorm * float(30)));
		}		
	}
	else
	{
		SetNVLight(false);
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

simulated function SetNVLight(bool bOn)
{
	// End:0x16
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	// End:0x6D
	if(bOn)
	{
		// End:0x59
		if(NVLight == none)
		{
			NVLight = Spawn(Class'BallisticProV55.E23NightVisionLight',,, Instigator.Location);
			NVLight.SetBase(Instigator);
		}
		NVLight.bDynamicLight = true;		
	}
	else
	{
		// End:0x89
		if(NVLight != none)
		{
			NVLight.bDynamicLight = false;
		}
	}
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
			E23PrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
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
				E23PrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
			}			
		}
		else
		{
			// End:0x39B
			if(int(CurrentWeaponMode) != 0)
			{
				CurrentWeaponMode = 0;
				E23PrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
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
	return FMax(0.0000000, (E23PrimaryFire(FireMode[0]).NextSGFireTime - Level.TimeSeconds) / 1.5000000);
	//return;	
}

defaultproperties
{
	ScopePopupHeight=17.0000000
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;25.0;0.9;80.0;0.2;0.4;0.1")
	ParamsClasses[0]=Class'BallisticProV55.E23WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.E23WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.E23WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.E23WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.VPR.BigIcon_VPR'
	BigIconCoords=(X1=0,Y1=36,X2=511,Y2=225)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Putaway',Volume=0.2220000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Series Pulse",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Multi Pulse",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Sniper Pulse",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightFXClass=Class'BallisticProV55.E23ClipEffect'
	SightFXBone="Clip"
	ScopeXScale=1.3300000
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MinZoom=2.0000000
	MaxZoom=8.0000000
	FullZoomFOV=45.0000000
	ScopeViewTex=Texture'BW_Core_WeaponTex.VPR.VPR-ScopeUI'
	bNoCrosshairInScope=true
	bNonCocking=true
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.7000000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc7',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.X3OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=52,G=41,B=72,A=121),Color2=(R=201,G=255,B=0,A=255),StartSize1=100,StartSize2=50)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=3.0000000,CurrentScale=0.0000000)
	NDCrosshairChaosFactor=1.0000000
	bWT_RapidProj=true
	bWT_Energy=true
	ManualLines[0]="Series mode fires a continuous stream of high damage projectiles, which gain damage over range.|Multi mode fires five projectiles simultaneously in a spread pattern, mimicking a shotgun.|Sniper mode fires a very fast projectile which is weak up close but quickly gains damage over range."
	ManualLines[1]="Projects a hitscan beam with almost no recoil but low damage output."
	ManualLines[2]="While scoped, the weapon function toggles the infra-red night vision lamp. The E-23 ViPeR is effective at all ranges, but requires mode switching and uses the same ammo pool for all its modes. It has low recoil but poor hipfire. Its energy projectiles repair nodes and vehicles. Plasma projectiles will penetrate players, but not walls and surfaces."
	SightOffset=(X=15.0000000,Y=0.0000000,Z=4.0000000)
	FireModeClass[0]=Class'BallisticProV55.E23PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.E23SecondaryFire'
	SelectAnimRate=1.2500000
	BringUpTime=0.4000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6500000
	CurrentRating=0.6500000
	bShowChargingBar=true
	Description="This experimental prototype was developed on Earth by Frontier Tech and fires variable high-power plasma projectiles from an advanced energy cell. Designed for law enforcement and light infantry sectors, the E-23 is a light, fairly compact and powerful energy assault weapon. The 'ViPeR' is equipped with a sniper scope including optional Infra-Red night-vision lamp."
	Priority=39
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=5
	GroupOffset=12
	PickupClass=Class'BallisticProV55.E23Pickup'
	PlayerViewOffset=(X=3.0000000,Y=6.0000000,Z=-8.0000000)
	AttachmentClass=Class'BallisticProV55.E23Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.VPR.SmallIcon_VPR'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="E-23 'ViPeR' Plasma Rifle"
	LightType=2
	LightEffect=13
	LightHue=64
	LightSaturation=96
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.VPR_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BW_Core_WeaponTex.VPR.VPR-Shiny'
	Skins[2]=Shader'BW_Core_WeaponTex.VPR.VPRGlass-Shiny'
	bFullVolume=true
	SoundRadius=32.0000000
}
