class LAWLauncher extends BallisticWeapon
	config(BallisticProV55);

var() FullSound HatchSound;
var bool bRunOffsetting;
var bool bInUse;
var() Rotator RunOffset;
var Emitter LaserDot;
var bool bLaserOn;
var LaserActor Laser;
var Emitter LaserBlast;
var() Sound LaserOnSound;
var() Sound LaserOffSound;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLaserOn;
}

simulated event PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x5D
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
	{
		PutDownTime = 2.5000000;
		default.PutDownTime = 2.5000000;
		BringUpTime = 3.0000000;
		default.BringUpTime = 3.0000000;
		SelectAnimRate = 1.0000000;
		PutDownAnimRate = 1.0000000;		
	}
	else
	{
		PutDownTime = default.PutDownTime;
		BringUpTime = default.BringUpTime;
		SelectAnimRate = default.SelectAnimRate;
		PutDownAnimRate = default.PutDownAnimRate;
	}
	//return;	
}

simulated function OutOfAmmo()
{
	local int Channel;
	local name Anim;
	local float frame, Rate;

	// End:0x2E
	if(((Instigator == none) || !Instigator.IsLocallyControlled()) || HasAmmo())
	{
		return;
	}
	GetAnimParams(Channel, Anim, frame, Rate);
	// End:0x53
	if(bPreventReload)
	{
		return;
	}
	DoAutoSwitch();
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	ServerSwitchLaser(true);
	super.BringUp(PrevWeapon);
	// End:0x53
	if(((Instigator != none) && Laser == none) && PlayerController(Instigator.Controller) != none)
	{
		Laser = Spawn(Class'BWBP_SKC_Pro.LaserActor_LAW');
	}
	// End:0x94
	if(((Instigator != none) && LaserBlast == none) && PlayerController(Instigator.Controller) != none)
	{
		LaserBlast = Spawn(Class'BWBP_SKC_Pro.LAWLaserBlast');
	}
	// End:0xCD
	if(((Instigator != none) && LaserDot == none) && PlayerController(Instigator.Controller) != none)
	{
		SpawnLaserDot();
	}
	// End:0x102
	if((Instigator != none) && AIController(Instigator.Controller) != none)
	{
		ServerSwitchLaser(FRand() > 0.5000000);
	}
	// End:0x134
	if(Class'BCoreProV55.BallisticReplicationInfo'.default.bNoReloading && (AmmoAmount(0)) > 1)
	{
		SetBoneScale(0, 1.0000000, 'Rocket');
	}
	// End:0x15A
	if(ThirdPersonActor != none)
	{
		LAWAttachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	//return;	
}

function ServerSwitchLaser(bool bNewLaserOn)
{
	bLaserOn = bNewLaserOn;
	// End:0x33
	if(ThirdPersonActor != none)
	{
		LAWAttachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	// End:0x4B
	if(Instigator.IsLocallyControlled())
	{
		ClientSwitchLaser();
	}
	//return;	
}

simulated function ClientSwitchLaser()
{
	// End:0x26
	if(bLaserOn)
	{
		SpawnLaserDot();
		PlaySound(LaserOnSound,, 3.7000000,, 32.0000000);		
	}
	else
	{
		KillLaserDot();
		PlaySound(LaserOffSound,, 3.7000000,, 32.0000000);
	}
	// End:0x62
	if(!IsInState('DualAction') && !IsInState('PendingDualAction'))
	{
		PlayIdle();
	}
	//return;	
}

simulated function KillLaserDot()
{
	// End:0x21
	if(LaserDot != none)
	{
		LaserDot.Kill();
		LaserDot = none;
	}
	//return;	
}

simulated function SpawnLaserDot(optional Vector loc)
{
	// End:0x20
	if(LaserDot == none)
	{
		LaserDot = Spawn(Class'BWBP_SKC_Pro.LAWLaserDot',,, loc);
	}
	//return;	
}

simulated function PlayIdle()
{
	super.PlayIdle();
	// End:0x3C
	if((bPendingSightUp || int(SightingState) != int(0)) || !CanPlayAnim(IdleAnim,, "IDLE"))
	{
		return;
	}
	FreezeAnimAt(0.0000000);
	//return;	
}

simulated function bool PutDown()
{
	// End:0x4F
	if(super.PutDown())
	{
		// End:0x26
		if(MagAmmo < 2)
		{
			SetBoneScale(0, 0.0000000, 'Rocket');
		}
		KillLaserDot();
		// End:0x4D
		if(ThirdPersonActor != none)
		{
			LAWAttachment(ThirdPersonActor).bLaserOn = false;
		}
		return true;
	}
	return false;
	//return;	
}

simulated function bool CheckScope()
{
	// End:0x1A
	if(Level.TimeSeconds < NextCheckScopeTime)
	{
		return true;
	}
	NextCheckScopeTime = Level.TimeSeconds + 0.2500000;
	// End:0x10E
	if((((((int(ReloadState) != int(0)) && int(ReloadState) != int(8)) || bRunOffsetting) || (int(Instigator.Controller.bRun) == 0) && int(Instigator.Physics) == int(1)) || (int(Instigator.Physics) == int(2)) && VSize(Instigator.Velocity) > (Instigator.GroundSpeed * 1.5000000)) || (SprintControl != none) && SprintControl.bSprinting)
	{
		StopScopeView();
		return false;
	}
	return true;
	//return;	
}

simulated function bool CanUseSights()
{
	// End:0xA9
	if(((((((int(Instigator.Physics) == int(2)) && VSize(Instigator.Velocity) > (Instigator.GroundSpeed * 1.5000000)) || bRunOffsetting) || (SprintControl != none) && SprintControl.bSprinting) || int(ClientState) == int(2)) || int(ClientState) == int(3)) || int(ReloadState) != int(0))
	{
		return false;
	}
	return true;
	//return;	
}

simulated function DrawLaserSight(Canvas Canvas)
{
	local Vector HitLocation, Start, End, HitNormal, Scale3D, loc;

	local Rotator AimDir;
	local Actor Other;

	// End:0x4F
	if(((((int(ClientState) == int(1)) || !bLaserOn) || Instigator == none) || Instigator.Controller == none) || Laser == none)
	{
		return;
	}
	AimDir = BallisticFire(FireMode[0]).GetFireAim(Start);
	loc = GetBoneCoords('tip2').Origin;
	End = Start + (Normal(Vector(AimDir)) * float(5000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	// End:0xE7
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x152
	if((((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x174
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
	}
	Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	Laser.SetLocation(loc);
	HitLocation = ConvertFOVs(End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x25B
	if((((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		AimDir = GetBoneRotation('tip2');
		Laser.SetRotation(AimDir);
	}
	// End:0x2D4
	if(LaserBlast != none)
	{
		LaserBlast.SetLocation(Laser.Location);
		LaserBlast.SetRotation(Laser.Rotation);
		Canvas.DrawActor(LaserBlast, false, false, DisplayFOV);
	}
	Scale3D.X = VSize(HitLocation - loc) / float(128);
	Scale3D.Y = 1.0000000;
	Scale3D.Z = 1.0000000;
	Laser.SetDrawScale3D(Scale3D);
	Canvas.DrawActor(Laser, false, false, DisplayFOV);
	//return;	
}

simulated event DrawFPWeapon(Canvas C)
{
	super.DrawFPWeapon(C);
	DrawLaserSight(C);
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

function byte BestMode()
{
	return 0;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float dist, rating;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	rating = super.GetAIRating();
	// End:0x50
	if(B.Enemy == none)
	{
		return rating;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.5000000, dist, 1024.0000000, 3072.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.9000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.9000000;
	//return;	
}

simulated function Notify_G5HatchOpen()
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, HatchSound);
	//return;	
}

simulated function Notify_G5HideRocket()
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x50
	if(!Class'BCoreProV55.BallisticReplicationInfo'.default.bNoReloading || (AmmoAmount(0)) < 2)
	{
		SetBoneScale(0, 0.0000000, 'Rocket');
	}
	//return;	
}

defaultproperties
{
	HatchSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75Cliphit',Volume=0.7000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	RunOffset=(Pitch=-4000,Yaw=-2000,Roll=0)
	LaserOnSound=Sound'BWBP_SKC_Sounds.AH104.AH104-SightOn'
	LaserOffSound=Sound'BWBP_SKC_Sounds.AH104.AH104-SightOff'
	SpecialInfo[0]=(Id="EvoDefs",Info="500.0;60.0;1.0;80.0;2.0;0.0;1.5")
	AIReloadTime=4.0000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.LAWWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.LAWWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.LAWWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.LAWWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.LAW.BigIcon_LAW'
	BigIconCoords=(X1=0,Y1=36,X2=511,Y2=225)
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-Draw',Volume=2.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.Artillery.Art-Undeploy',Volume=2.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Single Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	ScopeXScale=1.3300000
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MinZoom=2.0000000
	MaxZoom=8.0000000
	ZoomStages=6
	FullZoomFOV=10.0000000
	ScopeViewTex=Texture'BWBP_SKC_Tex.LAW.LAW-ScopeView'
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-UnCock',Volume=2.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bNonCocking=true
	ClipHitSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-Cock',Volume=2.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-TubeUnlock',Volume=2.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.Law-TubeLock',Volume=2.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc8',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc11',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=104),Color2=(R=255,G=255,B=0,A=117),StartSize1=45,StartSize2=41)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.2500000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=2.0000000,CurrentScale=0.0000000)
	NDCrosshairChaosFactor=0.7500000
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Projectile=true
	bWT_Super=true
	ManualLines[0]="Launches a nuclear rocket. Travel time is moderate. Deals extreme damage within a wide radius."
	ManualLines[1]="Fires a shockwave rocket in an arc. Upon impact, the rocket generates shockwaves which penetrate walls and deal damage to targets in a very wide radius. Damage is reduced if the target is obscured from the rocket. The rocket can be destroyed by enemy fire whilst so placed."
	ManualLines[2]="Effective against groups and at controlling areas."
	SightOffset=(X=12.0000000,Y=-1.2500000,Z=1.9000000)
	FireModeClass[0]=Class'BWBP_SKC_Pro.LAWPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.LAWSecondaryFire'
	SelectAnimRate=1.4000000
	PutDownAnimRate=1.4000000
	PutDownTime=1.9000000
	BringUpTime=2.2500000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.9000000
	CurrentRating=0.9000000
	Description="The FGM-70 LAW represents an advancement in portable nuclear technology. Using clean miniature nuclear rockets with no fallout, it is suitable for general deployment within the common soldiery. Able to inflict devastation either immediately through an explosion or over time through generating penetrative shockwaves, the FGM-70 can change the course of combat."
	Priority=164
	HudColor=(R=0,G=200,B=0,A=255)
	CenteredOffsetY=10.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=8
	PickupClass=Class'BWBP_SKC_Pro.LAWPickup'
	PlayerViewOffset=(X=1.0000000,Y=4.0000000,Z=5.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.LAWAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.LAW.SmallIcon_LAW'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="FGM-70 'Shockwave' LAW"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.LAW_FPm'
	DrawScale=0.3000000
}
