class AH250Pistol extends BallisticHandgun
	config(BallisticProV55);

var() name RDSBone;
var() name MuzzBone;
var() name LAMBone;
var() name ScopeBone;
var() name BulletBone;
var() bool bHasLaser;
var() LaserActor Laser;
var() Emitter LaserDot;
var() bool bLaserOn;
var() bool bStriking;
var() Sound LaserOnSound;
var() Sound LaserOffSound;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bHasLaser, bLaserOn;
}

simulated function bool SlaveCanUseMode(int Mode)
{
	return Mode == 0;
	//return;	
}

simulated function bool MasterCanSendMode(int Mode)
{
	return Mode == 0;
	//return;	
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasLaser = false;
	// End:0x42
	if(InStr(WeaponParams.LayoutTags, "laser") != -1)
	{
		bHasLaser = true;
	}
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

simulated function OnAimParamsChanged()
{
	super(BallisticWeapon).OnAimParamsChanged();
	// End:0x15
	if(bLaserOn)
	{
		ApplyLaserAim();
	}
	//return;	
}

simulated function ApplyLaserAim()
{
	AimComponent.AimAdjustTime *= 1.5000000;
	AimComponent.AimSpread.Max *= 0.6500000;
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

function ServerWeaponSpecial(optional byte i)
{
	// End:0x18
	if(!bHasLaser || bServerReloading)
	{
		return;
	}
	ServerSwitchLaser(!bLaserOn);
	//return;	
}

function ServerSwitchLaser(bool bNewLaserOn)
{
	bLaserOn = bNewLaserOn;
	// End:0x33
	if(ThirdPersonActor != none)
	{
		AH250Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
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
	// End:0x68
	if(!IsInState('DualAction') && !IsInState('PendingDualAction'))
	{
		PlayIdle();
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x5E
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		IdleAnim = 'OpenIdle';
		ReloadAnim = 'OpenReload';
		SelectAnim = 'OpenPullout';
		BringUpTime = default.BringUpTime;
		SetBoneScale(4, 0.0000000, BulletBone);		
	}
	else
	{
		IdleAnim = 'Idle';
		ReloadAnim = 'Reload';
		SelectAnim = 'Pullout';
		BringUpTime = default.BringUpTime;
	}
	super.BringUp(PrevWeapon);
	// End:0xD6
	if(((Instigator != none) && Laser == none) && PlayerController(Instigator.Controller) != none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor');
	}
	// End:0x10F
	if(((Instigator != none) && LaserDot == none) && PlayerController(Instigator.Controller) != none)
	{
		SpawnLaserDot();
	}
	// End:0x14F
	if((bHasLaser && Instigator != none) && AIController(Instigator.Controller) != none)
	{
		ServerSwitchLaser(FRand() > 0.5000000);
	}
	// End:0x175
	if(ThirdPersonActor != none)
	{
		AH250Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
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
		LaserDot = Spawn(Class'BallisticProV55.M806LaserDot',,, loc);
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
			AH250Attachment(ThirdPersonActor).bLaserOn = false;
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
	// End:0x15F
	if((((!bStriking && int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x181
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
	}
	Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	Laser.SetLocation(loc);
	HitLocation = ConvertFOVs(End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x275
	if((((!bStriking && int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		AimDir = GetBoneRotation('tip2');
		Laser.SetRotation(AimDir);
	}
	Scale3D.X = VSize(HitLocation - loc) / float(128);
	Scale3D.Y = 1.0000000;
	Scale3D.Z = 1.0000000;
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

simulated function Notify_HideBullet()
{
	// End:0x1E
	if(MagAmmo < 2)
	{
		SetBoneScale(4, 0.0000000, BulletBone);
	}
	//return;	
}

simulated function Notify_ShowBullet()
{
	SetBoneScale(4, 1.0000000, BulletBone);
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x114
	if((((((((Anim == 'OpenFire') || Anim == 'Fire') || Anim == 'OpenFire') || Anim == 'OpenSightFire') || Anim == CockAnim) || Anim == ReloadAnim) || Anim == DualReloadAnim) || Anim == DualReloadEmptyAnim)
	{
		// End:0xE8
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
		{
			IdleAnim = 'OpenIdle';
			ReloadAnim = 'OpenReload';
			PutDownAnim = 'OpenPutaway';
			SelectAnim = 'OpenPullout';			
		}
		else
		{
			IdleAnim = 'Idle';
			ReloadAnim = 'Reload';
			PutDownAnim = 'putaway';
			SelectAnim = 'Pullout';
		}
	}
	super.AnimEnd(Channel);
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
	return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.7500000, dist, 2048.0000000, 2048.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.3000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.5000000;
	//return;	
}

defaultproperties
{
	RDSBone="RedDotSight"
	MuzzBone="Compensator"
	LAMBone="LAM"
	ScopeBone="Scope"
	BulletBone="Bullet"
	LaserOnSound=Sound'BW_Core_WeaponSound.TEC.RSMP-LaserClick'
	LaserOffSound=Sound'BW_Core_WeaponSound.TEC.RSMP-LaserClick'
	SpecialInfo[0]=(Id="EvoDefs",Info="140.0;12.0;0.7;70.0;0.55;0.0;-999.0")
	AIReloadTime=1.5000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.AH250WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.AH250WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.AH250WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.AH250WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.Eagle.BigIcon_Eagle'
	BigIconCoords=(X1=48,Y1=0,X2=455,Y2=255)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Pullout',Volume=0.1700000,Radius=24.0000000,Slot=3,Pitch=0.9000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Putaway',Volume=0.1750000,Radius=24.0000000,Slot=3,Pitch=0.9000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Mode-2",bUnavailable=true,ModeID="WM_Burst",Value=7.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	FullZoomFOV=40.0000000
	ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
	bNoCrosshairInScope=true
	SightBobScale=0.4500000
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.Eagle.Eagle-Cock',Volume=5.1000000,Radius=48.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Lever',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BWBP_SKC_Sounds.Eagle.Eagle-ClipHit',Volume=2.5000000,Radius=48.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.Eagle.Eagle-ClipOut',Volume=2.5000000,Radius=48.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.Eagle.Eagle-ClipIn',Volume=2.5000000,Radius=48.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.G5OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M806InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=122),Color2=(R=255,G=255,B=122,A=255),StartSize1=64,StartSize2=76)
	NDCrosshairInfo=(SpreadRatios=(X1=0.7500000,Y1=0.7500000,X2=0.3000000,Y2=0.3000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=4.0000000,CurrentScale=0.0000000)
	MeleeFireClass=Class'BWBP_SKC_Pro.AH250MeleeFire'
	bWT_Bullet=true
	ManualLines[0]="High-powered semi-automatic fire."
	ManualLines[1]="Engages the sight."
	ManualLines[2]="Effective at medium range."
	SightOffset=(X=18.5000000,Y=0.0000000,Z=2.7500000)
	CockingBringUpTime=1.3000000
	GunLength=4.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.AH250PrimaryFire'
	FireModeClass[1]=Class'BCoreProV55.BallisticScopeFire'
	SelectAnimRate=2.0000000
	PutDownAnimRate=1.6000000
	PutDownTime=0.5000000
	BringUpTime=0.6000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	Description="AH-250 'Hawk' Assault Pistol||Manufacturer: Enravion Combat Solutions|Primary: Magnum Rounds|Secondary: Scope||Built as a more affordable alternative to the AH-104, the AH-250 is an alternate design chambered for .44 magnum rounds instead of the usual $100 .600 HEAP ones. It is less accurate than the AH-104 and D49, but its 8 round magazine and faster reload times let it put more rounds down range than both. Its significant weight and recoil means it requires both hands to shoot and is harder to control than its revolver and hand cannon siblings, a fact that comes into play where range is a concern. An updated version known as the AH-250M2 'Hawk' is also available, complete with a compensator, match-grade internals, and a 6x precision scope to make aiming easier. Military adoption remains low due to the heavy recoil and impracticality of carrying around such a large sidearm, yet big game hunters have taken a liking to it, plus it remains a popular weapon in every outer planet action flick."
	Priority=96
	HudColor=(R=255,G=200,B=200,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=2
	GroupOffset=13
	PickupClass=Class'BWBP_SKC_Pro.AH250Pickup'
	PlayerViewOffset=(X=5.0000000,Y=3.0000000,Z=-6.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.AH250Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.Eagle.SmallIcon_Eagle'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="AH250 Assault Pistol"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.AHDeagle_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BWBP_SKC_Tex.Eagle.Eagle-MainShine'
	Skins[2]=Texture'BWBP_SKC_Tex.Eagle.Eagle-Misc'
	Skins[3]=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeRed'
	Skins[4]=Texture'BWBP_SKC_Tex.Eagle.Eagle-Front'
	Skins[5]=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDotGreen'
}
