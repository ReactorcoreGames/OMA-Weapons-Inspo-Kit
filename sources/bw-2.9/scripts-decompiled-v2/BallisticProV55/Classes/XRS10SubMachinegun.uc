class XRS10SubMachinegun extends BallisticHandgun
	config(BallisticProV55);

var bool bSilenced;
var() name SilencerBone;
var() name SilencerOnAnim;
var() name SilencerOffAnim;
var() Sound SilencerOnSound;
var() Sound SilencerOffSound;
var() Sound SilencerOnTurnSound;
var() Sound SilencerOffTurnSound;
var bool bLaserOn;
var LaserActor Laser;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var Emitter LaserBlast;
var Emitter LaserDot;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLaserOn;

	// Pos:0x00D
	reliable if(int(Role) < int(ROLE_Authority))
		ServerSwitchSilencer;
}

simulated function PlayIdle()
{
	super(BallisticWeapon).PlayIdle();
	// End:0x54
	if((((!bLaserOn || bPendingSightUp) || int(SightingState) != int(0)) || bScopeView) || !CanPlayAnim(IdleAnim,, "IDLE"))
	{
		return;
	}
	FreezeAnimAt(0.0000000);
	//return;	
}

simulated function OnLaserSwitched()
{
	// End:0x12
	if(bLaserOn)
	{
		ApplyLaserAim();		
	}
	else
	{
		AimComponent.Recalculate();
	}
	//return;	
}

simulated function ApplyLaserAim()
{
	AimComponent.AimAdjustTime *= 0.7500000;
	AimComponent.AimSpread.Max *= 0.6500000;
	AimComponent.AimSpread.Min *= 0.6500000;
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	// End:0x45
	if(bLaserOn != default.bLaserOn)
	{
		OnLaserSwitched();
		default.bLaserOn = bLaserOn;
		ClientSwitchLaser();
	}
	super(Weapon).PostNetReceive();
	//return;	
}

function ServerSwitchLaser(bool bNewLaserOn)
{
	bLaserOn = bNewLaserOn;
	// End:0x33
	if(ThirdPersonActor != none)
	{
		XRS10Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	OnLaserSwitched();
	// End:0x51
	if(Instigator.IsLocallyControlled())
	{
		ClientSwitchLaser();
	}
	//return;	
}

simulated function ClientSwitchLaser()
{
	OnLaserSwitched();
	// End:0x2C
	if(bLaserOn)
	{
		SpawnLaserDot();
		PlaySound(LaserOnSound,, 0.7000000,, 32.0000000);		
	}
	else
	{
		KillLaserDot();
		PlaySound(LaserOffSound,, 0.7000000,, 32.0000000);
	}
	// End:0x7A
	if((!IsInState('DualAction') && !IsInState('PendingDualAction')) && int(ReloadState) != int(9))
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

simulated function SpawnLaserDot()
{
	// End:0x19
	if(LaserDot == none)
	{
		LaserDot = Spawn(Class'BallisticProV55.XRS10LaserDot');
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
			XRS10Attachment(ThirdPersonActor).bLaserOn = false;
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
	local name Anim;
	local float frame, Rate;
	local bool bAimAligned;

	// End:0x2C
	if(((int(ClientState) == int(1)) || !bLaserOn) || Laser == none)
	{
		return;
	}
	AimDir = BallisticFire(FireMode[0]).GetFireAim(Start);
	loc = GetBoneCoords('tip3').Origin;
	End = Start + (Normal(Vector(AimDir)) * float(5000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	// End:0xC4
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x15F
	if((((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.1000000)
	{
		GetAnimParams(0, Anim, frame, Rate);
		// End:0x15F
		if((Anim != SilencerOnAnim) && Anim != SilencerOffAnim)
		{
			bAimAligned = true;
		}
	}
	// End:0x171
	if(bAimAligned)
	{
		SpawnLaserDot();		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x1BD
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
		Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	}
	Laser.SetLocation(loc);
	HitLocation = ConvertFOVs(End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x226
	if(bAimAligned)
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		AimDir = GetBoneRotation('tip3');
		Laser.SetRotation(AimDir);
	}
	// End:0x29F
	if(LaserBlast != none)
	{
		LaserBlast.SetLocation(Laser.Location);
		LaserBlast.SetRotation(Laser.Rotation);
		Canvas.DrawActor(LaserBlast, false, false, DisplayFOV);
	}
	Scale3D.X = VSize(HitLocation - loc) / float(128);
	Scale3D.Y = 1.5000000;
	Scale3D.Z = 1.5000000;
	Laser.SetDrawScale3D(Scale3D);
	Canvas.DrawActor(Laser, false, false, DisplayFOV);
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	super.RenderOverlays(Canvas);
	// End:0x23
	if(!IsInState('Lowered'))
	{
		DrawLaserSight(Canvas);
	}
	//return;	
}

function ServerSwitchSilencer(bool bNewValue)
{
	bSilenced = bNewValue;
	SwitchSilencer(bSilenced);
	bServerReloading = true;
	ReloadState = 9;
	XRS10PrimaryFire(bFireMode[0]).SetSilenced(bNewValue);
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x28
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena() || Class'BCoreProV55.BallisticReplicationInfo'.static.IsTactical())
	{
		return;
	}
	// End:0x4C
	if((int(ReloadState) != int(0)) || int(SightingState) != int(0))
	{
		return;
	}
	// End:0x5E
	if(int(ClientState) != int(4))
	{
		return;
	}
	TemporaryScopeDown(0.5000000);
	bSilenced = !bSilenced;
	ServerSwitchSilencer(bSilenced);
	SwitchSilencer(bSilenced);
	ReloadState = 9;
	//return;	
}

simulated function SwitchSilencer(bool bNewValue)
{
	// End:0x14
	if(bNewValue)
	{
		PlayAnim(SilencerOnAnim);		
	}
	else
	{
		PlayAnim(SilencerOffAnim);
	}
	//return;	
}

simulated function Notify_SilencerOn()
{
	PlaySound(SilencerOnSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerOnTurn()
{
	PlaySound(SilencerOnTurnSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerOff()
{
	PlaySound(SilencerOffSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerOffTurn()
{
	PlaySound(SilencerOffTurnSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerShow()
{
	SetBoneScale(0, 1.0000000, SilencerBone);
	//return;	
}

simulated function Notify_SilencerHide()
{
	SetBoneScale(0, 0.0000000, SilencerBone);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x4C
	if(((Instigator != none) && Laser == none) && PlayerController(Instigator.Controller) != none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor_RSBlue');
	}
	// End:0x8D
	if(((Instigator != none) && LaserBlast == none) && PlayerController(Instigator.Controller) != none)
	{
		LaserBlast = Spawn(Class'BallisticProV55.XRS10LaserBlast');
	}
	// End:0xC6
	if(((Instigator != none) && LaserDot == none) && PlayerController(Instigator.Controller) != none)
	{
		SpawnLaserDot();
	}
	// End:0xFB
	if((Instigator != none) && AIController(Instigator.Controller) != none)
	{
		ServerSwitchLaser(FRand() > 0.5000000);
	}
	// End:0x121
	if(ThirdPersonActor != none)
	{
		XRS10Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	// End:0x14A
	if(AIController(Instigator.Controller) != none)
	{
		bSilenced = FRand() > 0.5000000;
	}
	// End:0x167
	if(bSilenced)
	{
		SetBoneScale(0, 1.0000000, SilencerBone);		
	}
	else
	{
		SetBoneScale(0, 0.0000000, SilencerBone);
	}
	//return;	
}

simulated function PlayReload()
{
	super.PlayReload();
	// End:0x23
	if(bSilenced)
	{
		SetBoneScale(0, 1.0000000, SilencerBone);		
	}
	else
	{
		SetBoneScale(0, 0.0000000, SilencerBone);
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.6000000, dist, BallisticInstantFire(bFireMode[0]).DecayRange.Min, BallisticInstantFire(bFireMode[0]).DecayRange.Max);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.8000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.8000000;
	//return;	
}

defaultproperties
{
	bSilenced=true
	SilencerBone="Silencer"
	SilencerOnAnim="SilencerOn"
	SilencerOffAnim="SilencerOff"
	SilencerOnSound=Sound'BW_Core_WeaponSound.XK2.XK2-SilenceOn'
	SilencerOffSound=Sound'BW_Core_WeaponSound.XK2.XK2-SilenceOff'
	SilencerOnTurnSound=SoundGroup'BW_Core_WeaponSound.XK2.XK2-SilencerTurn'
	SilencerOffTurnSound=SoundGroup'BW_Core_WeaponSound.XK2.XK2-SilencerTurn'
	LaserOnSound=Sound'BW_Core_WeaponSound.TEC.RSMP-LaserClick'
	LaserOffSound=Sound'BW_Core_WeaponSound.TEC.RSMP-LaserClick'
	SpecialInfo[0]=(Id="EvoDefs",Info="60.0;5.0;0.4;-1.0;0.0;0.2;-999.0")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BallisticProV55.XRS10WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.XRS10WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.XRS10WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.XRS10WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_XRS10'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Pullout',Volume=0.1500000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway',Volume=0.1480000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_Burst",Value=4.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	SightBobScale=0.6500000
	CockSound=(Sound=Sound'BW_Core_WeaponSound.TEC.RSMP-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.TEC.RSMP-Clipout',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.TEC.RSMP-Clipin',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M806OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M353InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=0,B=145,A=190),Color2=(R=255,G=255,B=77,A=255),StartSize1=80,StartSize2=96)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.8000000,X2=0.5000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=6.0000000,CurrentScale=0.0000000)
	bWT_Bullet=true
	bWT_Machinegun=true
	ManualLines[0]="Automatic machine pistol fire. Moderate damage per bullet and high fire rate. Deals extreme DPS at close range, but has controllability and recoil issues, especially from the hip."
	ManualLines[1]="Toggles the laser sight. While active, reduces the hipfire spread, but broadcasts the user's position to the enemy."
	ManualLines[2]="The Weapon Function key attaches a suppressor, reducing recoil, range and noise output and removing the flash.||This weapon is highly effective at very close range."
	SightOffset=(X=-40.0000000,Y=0.0000000,Z=3.7500000)
	FireModeClass[0]=Class'BallisticProV55.XRS10PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.XRS10SecondaryFire'
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8500000
	CurrentRating=0.8500000
	Description="The XRS10 is a small, suppressable machine pistol, constructed by newcomer arms company Drake & Co. Based on a design from many years ago, the XRS10 is a short, medium-range weapon, using .40 caliber ammunition. The weapon has a medium rate-of-fire, fair damage, and a decent magazine capacity, yet can generate much recoil and chaos. The new model, features silencer and blue-light laser sight, to give it some more edge in stealthier situations."
	Priority=27
	HudColor=(R=200,G=200,B=255,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=3
	GroupOffset=3
	PickupClass=Class'BallisticProV55.XRS10Pickup'
	PlayerViewOffset=(X=32.0000000,Y=8.0000000,Z=-12.5000000)
	AttachmentClass=Class'BallisticProV55.XRS10Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.XRS10.SmallIcon_XRS10'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="XRS-10 Machine Pistol"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=130.0000000
	LightRadius=3.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.XRS10_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BW_Core_WeaponTex.XRS10.XRS10Shiney'
	Skins[2]=Shader'BW_Core_WeaponTex.XRS10.XRS10LaserShiney'
	Skins[3]=Shader'BW_Core_WeaponTex.XRS10.XRS10SilencerShiney'
}
