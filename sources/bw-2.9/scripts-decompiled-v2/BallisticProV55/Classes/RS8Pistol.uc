class RS8Pistol extends BallisticHandgun
	config(BallisticProV55);

var() bool bSilenced;
var() bool bCompensated;
var() name SilencerBone;
var() name SilencerOnAnim;
var() name SilencerOffAnim;
var() Sound SilencerOnSound;
var() Sound SilencerOffSound;
var() Sound SilencerOnTurnSound;
var() Sound SilencerOffTurnSound;
var() bool bLaserOn;
var() LaserActor Laser;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var() Emitter LaserBlast;
var() Emitter LaserDot;
var() bool bStriking;
var() bool bHasKnife;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLaserOn;

	// Pos:0x00D
	reliable if(int(Role) < int(ROLE_Authority))
		ServerSwitchSilencer;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasKnife = false;
	bCompensated = false;
	// End:0x61
	if(InStr(WeaponParams.LayoutTags, "tacknife") != -1)
	{
		bHasKnife = true;
		MeleeFireMode.Damage = 70.0000000;
	}
	// End:0x89
	if(InStr(WeaponParams.LayoutTags, "comp") != -1)
	{
		bCompensated = true;
	}
	//return;	
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
	AimComponent.AimAdjustTime *= 0.6500000;
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
		RS8Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
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
			RS8Attachment(ThirdPersonActor).bLaserOn = false;
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
	// End:0x198
	if(((((!bStriking && int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.1000000) && (Level.TimeSeconds - FireMode[1].NextFireTime) > 0.2000000)
	{
		GetAnimParams(0, Anim, frame, Rate);
		// End:0x198
		if((Anim != SilencerOnAnim) && Anim != SilencerOffAnim)
		{
			bAimAligned = true;
		}
	}
	// End:0x1AA
	if(bAimAligned)
	{
		SpawnLaserDot();		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x1F6
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
		Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	}
	Laser.SetLocation(loc);
	HitLocation = ConvertFOVs(End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x2EC
	if(((((!bStriking && int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000) && (Level.TimeSeconds - FireMode[1].NextFireTime) > 0.2000000)
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		AimDir = GetBoneRotation('tip3');
		Laser.SetRotation(AimDir);
	}
	// End:0x365
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

simulated function OnScopeViewChanged()
{
	super(BallisticWeapon).OnScopeViewChanged();
	// End:0x31
	if(hand < float(0))
	{
		SightOffset.Y = default.SightOffset.Y * float(-1);
	}
	//return;	
}

function ServerSwitchSilencer(bool bNewValue)
{
	bSilenced = bNewValue;
	bFireMode[0].bAISilent = bSilenced;
	SwitchSilencer(bSilenced);
	// End:0x54
	if(bSilenced)
	{
		bFireMode[0].FireRecoil *= 0.8500000;		
	}
	else
	{
		bFireMode[0].FireRecoil = bFireMode[0].default.FireRecoil;
	}
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x24
	if((int(ReloadState) != int(0)) || int(SightingState) != int(0))
	{
		return;
	}
	// End:0x3C
	if(bIsPendingHandGun || PendingHandgun != none)
	{
		return;
	}
	// End:0x4E
	if(int(ClientState) != int(4))
	{
		return;
	}
	// End:0x59
	if(bCompensated)
	{
		return;
	}
	// End:0x72
	if(bHasKnife)
	{
		ServerSwitchLaser(!bLaserOn);
		return;
	}
	// End:0xC4
	if(OtherGun != none)
	{
		// End:0x98
		if(int(OtherGun.ClientState) != int(4))
		{
			return;
		}
		// End:0xA5
		if(IsInState('DualAction'))
		{
			return;
		}
		// End:0xC4
		if(!OtherGun.IsInState('Lowered'))
		{
			GotoState('PendingSwitchSilencer');
			return;
		}
	}
	TemporaryScopeDown(0.5000000);
	bSilenced = !bSilenced;
	ServerSwitchSilencer(bSilenced);
	SwitchSilencer(bSilenced);
	//return;	
}

simulated function SwitchSilencer(bool bNewValue)
{
	// End:0x18
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = false;
	}
	ReloadState = 9;
	// End:0x34
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
		RS8Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	// End:0x16D
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		IdleAnim = 'OpenIdle';
		ReloadAnim = 'OpenReload';
		SelectAnim = 'PulloutOpen';
		PutDownAnim = 'PutawayOpen';		
	}
	else
	{
		IdleAnim = 'Idle';
		ReloadAnim = 'Reload';
		SelectAnim = 'Pullout';
		PutDownAnim = 'putaway';
	}
	// End:0x1CF
	if(!bCompensated && AIController(Instigator.Controller) != none)
	{
		bSilenced = FRand() > 0.5000000;
	}
	// End:0x1F7
	if(bSilenced || bCompensated)
	{
		SetBoneScale(0, 1.0000000, SilencerBone);		
	}
	else
	{
		SetBoneScale(0, 0.0000000, SilencerBone);
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x2D
	if(Anim != 'MeleePrep')
	{
		bStriking = false;
	}
	// End:0x109
	if((((((Anim == 'OpenFire') || Anim == 'Fire') || Anim == CockAnim) || Anim == ReloadAnim) || Anim == DualReloadAnim) || Anim == DualReloadEmptyAnim)
	{
		// End:0xDD
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
		{
			IdleAnim = 'OpenIdle';
			ReloadAnim = 'OpenReload';
			SelectAnim = 'PulloutOpen';
			PutDownAnim = 'PutawayOpen';			
		}
		else
		{
			IdleAnim = 'Idle';
			ReloadAnim = 'Reload';
			SelectAnim = 'Pullout';
			PutDownAnim = 'putaway';
		}
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated function Notify_ClipOutOfSight()
{
	SetBoneScale(1, 1.0000000, 'Bullet');
	//return;	
}

simulated function PlayReload()
{
	super.PlayReload();
	// End:0x22
	if(MagAmmo < 1)
	{
		SetBoneScale(1, 0.0000000, 'Bullet');
	}
	// End:0x4A
	if(bSilenced || bCompensated)
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3500000, dist, 768.0000000, 2048.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.1000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.5000000;
	//return;	
}

static function Class<Pickup> RecommendAmmoPickup(int Mode)
{
	return Class'BallisticProV55.AP_RS8Clip';
	//return;	
}

simulated state PendingSwitchSilencer extends PendingDualAction
{
	simulated function BeginState()
	{
		OtherGun.LowerHandGun();
		//return;		
	}

	simulated function HandgunLowered(BallisticHandgun Other)
	{
		global.HandgunLowered(Other);
		// End:0x20
		if(Other == OtherGun)
		{
			WeaponSpecial();
		}
		//return;		
	}

	simulated event AnimEnd(int Channel)
	{
		OtherGun.RaiseHandGun();
		global.AnimEnd(Channel);
		//return;		
	}
	stop;	
}

defaultproperties
{
	SilencerBone="Silencer"
	SilencerOnAnim="SilencerOn"
	SilencerOffAnim="SilencerOff"
	SilencerOnSound=Sound'BW_Core_WeaponSound.XK2.XK2-SilenceOn'
	SilencerOffSound=Sound'BW_Core_WeaponSound.XK2.XK2-SilenceOff'
	SilencerOnTurnSound=Sound'BW_Core_WeaponSound.Pistol.RSP-SilencerTurn'
	SilencerOffTurnSound=Sound'BW_Core_WeaponSound.Pistol.RSP-SilencerTurn'
	LaserOnSound=Sound'BW_Core_WeaponSound.TEC.RSMP-LaserClick'
	LaserOffSound=Sound'BW_Core_WeaponSound.TEC.RSMP-LaserClick'
	SpecialInfo[0]=(Id="EvoDefs",Info="0.0;-5.0;-999.0;-1.0;0.0;-999.0;-999.0")
	AIReloadTime=1.0000000
	SightAnimScale=0.3000000
	ParamsClasses[0]=Class'BallisticProV55.RS8WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.RS8WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.RS8WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.RS8WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_RS8'
	BigIconCoords=(X1=64,Y1=70,X2=418,Y2=212)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Pullout',Volume=0.1450000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway',Volume=0.1450000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightDisplayFOV=60.0000000
	bNoCrosshairInScope=true
	SightBobScale=0.5000000
	CockSound=(Sound=Sound'BW_Core_WeaponSound.Pistol.RSP-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BW_Core_WeaponSound.Pistol.RSP-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.Pistol.RSP-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.Pistol.RSP-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M806OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Cross4',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=0,B=203,A=160),Color2=(R=255,G=255,B=0,A=255),StartSize1=79,StartSize2=33)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.8000000,X2=0.5000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=6.0000000,CurrentScale=0.0000000)
	MeleeFireClass=Class'BallisticProV55.RS8MeleeFire'
	bWT_Bullet=true
	ManualLines[0]="Semi-automatic 10mm fire. Moderate damage and fire rate. Has the option of burst fire."
	ManualLines[1]="Attaches a suppressor, reducing the effective range but removing the flash and reducing the noise output."
	ManualLines[2]="Weapon Function toggles a laser sight, reducing the hipfire spread."
	SightPivot=(Pitch=-200,Yaw=0,Roll=-1050)
	SightOffset=(X=-43.0000000,Y=-1.4000000,Z=13.4000000)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=3000,Yaw=-290,Roll=0)
	CockingBringUpTime=0.8000000
	FireModeClass[0]=Class'BallisticProV55.RS8PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.RS8SecondaryFire'
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	Description="A fine and reliable weapon, produced by a rather new company, the 10mm RS8 pistol is bound for success. Featuring a 14 round, 10mm magazine, laser sight and silencer, as well as an effective closer range, 3-round burst fire mode. Use the laser sight to see exactly where your gun is aimed, and the silencer when stealth and quietness are required. The RS8 being a fairly recent firearm, first manufactured during the second-war, has not seen as much action as other older pistols, and some critics say it won't be able to stand up to a Cryon, let alone a Skrith!"
	Priority=17
	HudColor=(R=200,G=200,B=255,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=2
	GroupOffset=7
	PickupClass=Class'BallisticProV55.RS8Pickup'
	PlayerViewOffset=(X=20.0000000,Y=3.0000000,Z=-8.0000000)
	AttachmentClass=Class'BallisticProV55.RS8Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.RS8.SmallIcon_RS8'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="RS8 Pistol"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=130.0000000
	LightRadius=3.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.RS8_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BW_Core_WeaponTex.RS8.RS8-Shiney'
}
