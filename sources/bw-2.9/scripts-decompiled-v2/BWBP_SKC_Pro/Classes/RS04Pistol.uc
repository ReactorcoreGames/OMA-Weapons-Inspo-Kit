class RS04Pistol extends BallisticHandgun
	config(BallisticProV55);

var() float AltCharge;
var() float ChargeRateSensor;
var() float ChargeRateLight;
var() bool bHasLight;
var() bool bHasFlash;
var Projector FlashLightProj;
var Emitter FlashLightEmitter;
var bool bLightsOn;
var Vector TorchOffset;
var() Sound TorchOnSound;
var() Sound TorchOffSound;
var() Sound DrawSoundQuick;
var() name FlashlightAnim;
var bool bStriking;
var() bool bHasKnife;
var() bool bHasSensor;
var() bool bLoaded;
var() Sound PingSound;
var() Sound PingDetectSound;
var() Sound PingDetectSoundDirect;
var() int SensorRadius;
var() int PingSoundRadius;
var() name SensorLoadAnim;
var() FullSound SensorLoadSound;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerFlashLight, ServerPing;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		AltCharge;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasLight = false;
	bHasFlash = false;
	bHasKnife = false;
	bHasSensor = false;
	// End:0x86
	if(InStr(WeaponParams.LayoutTags, "tacknife") != -1)
	{
		bHasKnife = true;
		MeleeFireMode.Damage = 70.0000000;
		RS04MeleeFire(MeleeFireMode).SwitchBladeMode(true);
	}
	// End:0xAF
	if(InStr(WeaponParams.LayoutTags, "light") != -1)
	{
		bHasLight = true;
	}
	// End:0xE0
	if(InStr(WeaponParams.LayoutTags, "flash") != -1)
	{
		bHasFlash = true;
		bShowChargingBar = true;
	}
	// End:0x137
	if(InStr(WeaponParams.LayoutTags, "sensor") != -1)
	{
		bHasSensor = true;
		RS04SecondaryFire(FireMode[1]).bLoaded = true;
		bShowChargingBar = true;
		AmmoClass[1] = Class'BWBP_SKC_Pro.Ammo_G51Grenades';
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

simulated exec function WeaponSpecial(optional byte i)
{
	SafePlayAnim(FlashlightAnim, 1.0000000, 0.0000000,, "FIRE");
	// End:0x57
	if((bHasSensor && RS04SecondaryFire(FireMode[1]).bLoaded) && AltCharge >= default.AltCharge)
	{
		ServerPing();
	}
	// End:0x10B
	if(bHasLight)
	{
		bLightsOn = !bLightsOn;
		ServerFlashLight(bLightsOn);
		// End:0xDA
		if(bLightsOn)
		{
			PlaySound(TorchOnSound,, 0.7000000,, 32.0000000);
			// End:0xB8
			if(FlashLightEmitter == none)
			{
				FlashLightEmitter = Spawn(Class'BallisticProV55.MRS138TorchEffect', self,, Location);
			}
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(FlashLightEmitter, DrawScale);
			StartProjector();			
		}
		else
		{
			PlaySound(TorchOffSound,, 0.7000000,, 32.0000000);
			// End:0x105
			if(FlashLightEmitter != none)
			{
				FlashLightEmitter.Destroy();
			}
			KillProjector();
		}
	}
	//return;	
}

function ServerFlashLight(bool bNew)
{
	bLightsOn = bNew;
	RS04Attachment(ThirdPersonActor).bLightsOn = bLightsOn;
	//return;	
}

simulated function StartProjector()
{
	// End:0x20
	if(FlashLightProj == none)
	{
		FlashLightProj = Spawn(Class'BallisticProV55.MRS138TorchProjector', self,, Location);
	}
	AttachToBone(FlashLightProj, 'tip2');
	FlashLightProj.SetRelativeLocation(TorchOffset);
	//return;	
}

simulated function KillProjector()
{
	// End:0x17
	if(FlashLightProj != none)
	{
		FlashLightProj.Destroy();
	}
	//return;	
}

function ServerPing()
{
	local xPawn P;

	PlaySound(PingSound,, 2.0000000,, float(PingSoundRadius * 2));
	// End:0x12A
	foreach CollidingActors(Class'XGame.xPawn', P, float(SensorRadius), Location)
	{
		// End:0x129
		if(((((P.Controller != none) && P.bCanBeDamaged) && P.bProjTarget) && P != Instigator) && !Level.Game.bTeamGame || !Instigator.Controller.SameTeamAs(P.Controller))
		{
			// End:0x10A
			if(FastTrace(P.Location, Location))
			{
				P.PlaySound(PingDetectSoundDirect,, 2.0000000,, float(PingSoundRadius));
				// End:0x129
				continue;
			}
			P.PlaySound(PingDetectSound,, 2.0000000,, float(PingSoundRadius));
		}		
	}	
	AltCharge = 0.0000000;
	//return;	
}

simulated function LoadSensor()
{
	// End:0x54
	if((Ammo[1].AmmoAmount < 1) || RS04SecondaryFire(FireMode[1]).bLoaded)
	{
		// End:0x52
		if(!RS04SecondaryFire(FireMode[1]).bLoaded)
		{
			PlayIdle();
		}
		return;
	}
	// End:0x7B
	if(int(ReloadState) == int(0))
	{
		ReloadState = 9;
		PlayAnim(SensorLoadAnim, 1.0000000,, 0);
	}
	//return;	
}

simulated function bool IsReloadingSensor()
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x27
	if(Anim == SensorLoadAnim)
	{
		return true;
	}
	return false;
	//return;	
}

simulated function Notify_SensorReload()
{
	ReloadState = 3;
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, SensorLoadSound);
	RS04SecondaryFire(FireMode[1]).bLoaded = true;
	//return;	
}

function ServerStartReload(optional byte i)
{
	local int Channel;
	local name seq;
	local float frame, Rate;

	// End:0x0B
	if(bPreventReload)
	{
		return;
	}
	// End:0x1D
	if(int(ReloadState) != int(0))
	{
		return;
	}
	GetAnimParams(Channel, seq, frame, Rate);
	// End:0x48
	if(seq == SensorLoadAnim)
	{
		return;
	}
	// End:0xB3
	if(bHasSensor && (int(i) == 1) || (MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
	{
		// End:0xB1
		if(((AmmoAmount(1)) > 0) && !IsReloadingSensor())
		{
			LoadSensor();
			ClientStartReload(1);
		}
		return;
	}
	super.ServerStartReload();
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	// End:0x88
	if(int(Level.NetMode) == int(NM_Client))
	{
		// End:0x7D
		if(bHasSensor && (int(i) == 1) || (MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
		{
			// End:0x7A
			if(((AmmoAmount(1)) > 0) && !IsReloadingSensor())
			{
				LoadSensor();
			}			
		}
		else
		{
			CommonStartReload(i);
		}
	}
	//return;	
}

simulated event Tick(float dt)
{
	super(BallisticWeapon).Tick(dt);
	// End:0x54
	if(bLightsOn && int(ClientState) == int(4))
	{
		// End:0x43
		if(!Instigator.IsFirstPerson())
		{
			KillProjector();			
		}
		else
		{
			// End:0x54
			if(FlashLightProj == none)
			{
				StartProjector();
			}
		}
	}
	// End:0x10B
	if(bHasFlash || bHasSensor && RS04SecondaryFire(FireMode[1]).bLoaded)
	{
		// End:0x10B
		if((AltCharge < default.AltCharge) && (FireMode[1] == none) || !FireMode[1].IsFiring())
		{
			// End:0xE2
			if(bHasLight)
			{
				AltCharge = FMin(default.AltCharge, AltCharge + (dt * ChargeRateLight));
			}
			// End:0x10B
			if(bHasSensor)
			{
				AltCharge = FMin(default.AltCharge, AltCharge + (dt * ChargeRateSensor));
			}
		}
	}
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x49
	if(bHasSensor)
	{
		// End:0x2D
		if(!RS04SecondaryFire(FireMode[1]).bLoaded)
		{
			return 0.0000000;			
		}
		else
		{
			return FClamp(AltCharge / default.AltCharge, 0.0000000, 1.0000000);
		}		
	}
	else
	{
		// End:0x115
		if(bHasFlash)
		{
			// End:0xE2
			if(Level.TimeSeconds >= FireMode[1].NextFireTime)
			{
				// End:0xB3
				if(FireMode[1].bIsFiring)
				{
					return FMin(1.0000000, FireMode[1].HoldTime / FireMode[1].MaxHoldTime);
				}
				return FMin(1.0000000, RS04SecondaryFire(FireMode[1]).DecayCharge / FireMode[1].MaxHoldTime);
			}
			return (FireMode[1].NextFireTime - Level.TimeSeconds) / FireMode[1].FireRate;
		}
	}
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	local Vector TazLoc;
	local Rotator TazRot;

	super.RenderOverlays(Canvas);
	// End:0x80
	if(bLightsOn)
	{
		TazLoc = GetBoneCoords('tip2').Origin;
		TazRot = GetBoneRotation('tip2');
		// End:0x80
		if(FlashLightEmitter != none)
		{
			FlashLightEmitter.SetLocation(TazLoc);
			FlashLightEmitter.SetRotation(TazRot);
			Canvas.DrawActor(FlashLightEmitter, false, false, DisplayFOV);
		}
	}
	//return;	
}

simulated function PlayIdle()
{
	super(BallisticWeapon).PlayIdle();
	// End:0x47
	if(((bPendingSightUp || int(SightingState) != int(0)) || bScopeView) || !CanPlayAnim(IdleAnim,, "IDLE"))
	{
		return;
	}
	FreezeAnimAt(0.0000000);
	//return;	
}

simulated function TickFireCounter(float dt)
{
	// End:0x5B
	if(int(CurrentWeaponMode) == 1)
	{
		// End:0x58
		if((!IsFiring() && FireCount > 0) && (FireMode[0].NextFireTime - Level.TimeSeconds) < -0.5000000)
		{
			FireCount = 0;
		}		
	}
	else
	{
		super(BallisticWeapon).TickFireCounter(dt);
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x28
	if(super.PutDown())
	{
		KillProjector();
		// End:0x26
		if(FlashLightEmitter != none)
		{
			FlashLightEmitter.Destroy();
		}
		return true;
	}
	return false;
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(FlashLightEmitter != none)
	{
		FlashLightEmitter.Destroy();
	}
	KillProjector();
	super.Destroyed();
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x4C
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		IdleAnim = 'IdleOpen';
		ReloadAnim = 'ReloadOpen';
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
	super.BringUp(PrevWeapon);
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x41
	if(Anim == SensorLoadAnim)
	{
		ReloadState = 0;
		IdleTweenTime = 0.0000000;
		PlayIdle();		
	}
	else
	{
		IdleTweenTime = default.IdleTweenTime;
	}
	// End:0x198
	if((((((((((Anim == 'FireOpen') || Anim == 'Pullout') || Anim == 'PulloutFancy') || Anim == 'Fire') || Anim == 'FireDualOpen') || Anim == 'FireDual') || Anim == CockAnim) || Anim == ReloadAnim) || Anim == DualReloadAnim) || Anim == DualReloadEmptyAnim)
	{
		// End:0x156
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
		{
			IdleAnim = 'IdleOpen';
			SelectAnim = 'PulloutOpen';
			PutDownAnim = 'PutawayOpen';
			ReloadAnim = 'ReloadOpen';
			FlashlightAnim = 'FlashLightToggleOpen';
			SensorLoadAnim = 'ReloadLauncherOpen';			
		}
		else
		{
			IdleAnim = 'Idle';
			SelectAnim = 'Pullout';
			PutDownAnim = 'putaway';
			ReloadAnim = 'Reload';
			FlashlightAnim = 'FlashLightToggle';
			SensorLoadAnim = 'ReloadLauncher';
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
	CurrentWeaponMode = 2;
	return 0;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float Result, dist;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x41
	if((B == none) || B.Enemy == none)
	{
		return super.GetAIRating();
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Result = super.GetAIRating();
	// End:0xA7
	if(dist > float(500))
	{
		Result += 0.2000000;		
	}
	else
	{
		// End:0x106
		if((B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon)
		{
			Result -= (0.0500000 * B.Skill);
		}
	}
	// End:0x135
	if(dist > float(1000))
	{
		Result -= ((dist - float(1000)) / float(4000));
	}
	return Result;
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
	return Class'BallisticProV55.AP_M806Clip';
	//return;	
}

defaultproperties
{
	AltCharge=1.0000000
	ChargeRateSensor=0.0600000
	ChargeRateLight=0.1250000
	TorchOffset=(X=-75.0000000,Y=0.0000000,Z=0.0000000)
	TorchOnSound=Sound'BW_Core_WeaponSound.MRS38.RSS-FlashClick'
	TorchOffSound=Sound'BW_Core_WeaponSound.MRS38.RSS-FlashClick'
	DrawSoundQuick=Sound'BWBP_SKC_Sounds.M1911.RS04-QuickDraw'
	FlashlightAnim="FlashLightToggle"
	PingSound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-SensorPing'
	PingDetectSound=Sound'GeneralAmbience.beep6'
	PingDetectSoundDirect=Sound'BWBP_SKC_Sounds.MJ51.Sensor-PingDirect'
	SensorRadius=512
	PingSoundRadius=72
	SensorLoadAnim="ReloadLauncher"
	SensorLoadSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50ClipHit',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.5000000,bAtten=false,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="60.0;6.0;1.0;90.0;0.2;0.0;0.0")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.RS04WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.RS04WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.RS04WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.RS04WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.RS04.BigIcon_RS04'
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.M1911.RS04-Draw',Volume=0.1500000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway',Volume=0.1450000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi-Automatic",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Small Burst",bUnavailable=false,ModeID="WM_Burst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806-Cock',Volume=1.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_SKC_Sounds.M1911.RS04-SlideLock',Volume=0.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BWBP_SKC_Sounds.M1911.RS04-SlideLock',Volume=0.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.SAR.SAR-StockOut',Volume=1.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.M1911.RS04-ClipIn',Volume=1.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M806OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=176,G=178,B=175,A=160),Color2=(R=255,G=0,B=0,A=255),StartSize1=52,StartSize2=40)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.8000000,X2=0.5000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=6.0000000,CurrentScale=0.0000000)
	MeleeFireClass=Class'BWBP_SKC_Pro.RS04MeleeFire'
	bWT_Bullet=true
	SightingTime=0.2000000
	SightPivot=(Pitch=0,Yaw=0,Roll=-256)
	SightOffset=(X=-3.5000000,Y=0.2000000,Z=1.0700000)
	CockingBringUpTime=0.9000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.RS04PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.RS04SecondaryFire'
	PutDownTime=0.6000000
	BringUpTime=0.8000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.4000000
	Description="RS04 .45 Compact||Manufacturer: Drake & Co Firearms|Primary: .45 Fire|Secondary: Flashlight||A brand new precision handgun designed by Drake & Co firearms, the Redstrom .45 is an advanced composite pistol currently undergoing military trials. Dubbed the RS04, this unique and accurate pistol is still in its prototype stages. The .45 HV rounds used in the RS04 prototype allow for much improved stopping power at the expense of clip capacity and recoil. Current features include a tactical flashlight and a quick loading double shot firemode. Currently undergoing combat testing by private military contractors, the 8-round Redstrom is seen frequently in the battlefields of corporate warfare. The RS04 .45 Compact model is the latest variant."
	Priority=155
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=2
	GroupOffset=10
	PickupClass=Class'BWBP_SKC_Pro.RS04Pickup'
	PlayerViewOffset=(X=3.0000000,Y=3.0000000,Z=-6.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.RS04Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.RS04.SmallIcon_RS04'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="RS04 Compact Pistol"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=130.0000000
	LightRadius=3.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.RS04_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BWBP_SKC_Tex.RS04.RS04-MainShine'
}
