class MDKSubMachinegun extends BallisticWeapon
	config(BallisticProV55);

const ChargeInterval = 0.5;

var bool bScopeOn;
var bool bScopeAnimEnded;
var() name ScopeOnAnim;
var() name ScopeOffAnim;
var() Material ScopeScopeViewTex;
var() Sound ScopeOnSound;
var() Sound ScopeOffSound;
var() name ScopeBone;
var bool bSilenced;
var() name SilencerBone;
var() name SilencerOnAnim;
var() name SilencerOffAnim;
var() Sound SilencerOnSound;
var() Sound SilencerOffSound;
var() Sound SilencerOnTurnSound;
var() Sound SilencerOffTurnSound;
var int IceCharge;
var float LastChargeTime;
var float LastRangeFound;
var float LastStabilityFound;
var float StealthRating;
var float StealthImps;
var float ZRefHeight;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerSwitchSilencer;
}

simulated function PostNetBeginPlay()
{
	// End:0x1E
	if(bScopeOn)
	{
		SetBoneScale(2, 1.0000000, ScopeBone);		
	}
	else
	{
		SetBoneScale(2, 0.0000000, ScopeBone);
	}
	bScopeAnimEnded = true;
	SetScopeProperties();
	super.PostNetBeginPlay();
	//return;	
}

simulated function AnimEnded(int Channel, name Anim, float frame, float Rate)
{
	// End:0x46
	if((Anim == ScopeOffAnim) || Anim == ScopeOnAnim)
	{
		// End:0x38
		if(int(Role) == int(ROLE_Authority))
		{
			bServerReloading = false;
		}
		bScopeAnimEnded = true;
		SetScopeProperties();
	}
	super.AnimEnded(Channel, Anim, frame, Rate);
	//return;	
}

function ServerSwitchScopeType(bool bNewScope)
{
	SwitchScopeType(bNewScope);
	//return;	
}

simulated function SwitchScopeType(bool bNewScope)
{
	// End:0x13
	if(bNewScope == bScopeOn)
	{
		return;
	}
	// End:0x2B
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = true;
	}
	TemporaryScopeDown(0.5000000);
	ReloadState = 9;
	bScopeAnimEnded = false;
	bScopeOn = bNewScope;
	SetBoneScale(2, 1.0000000, ScopeBone);
	// End:0x79
	if(bNewScope)
	{
		PlayAnim(ScopeOnAnim);		
	}
	else
	{
		PlayAnim(ScopeOffAnim);
	}
	//return;	
}

simulated function SetScopeProperties()
{
	// End:0x1F
	if(bScopeOn)
	{
		ZoomType = 1;
		ScopeViewTex = ScopeScopeViewTex;		
	}
	else
	{
		ZoomType = 0;
		ScopeViewTex = none;
	}
	//return;	
}

simulated exec function ScopeSpecial(optional byte i)
{
	// End:0x36
	if(((int(ReloadState) != int(0)) || int(ClientState) != int(4)) || int(SightingState) != int(0))
	{
		return;
	}
	TemporaryScopeDown(0.5000000);
	// End:0x68
	if(int(Level.NetMode) == int(NM_Client))
	{
		ServerSwitchScopeType(!bScopeOn);
	}
	SwitchScopeType(!bScopeOn);
	//return;	
}

simulated function WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x60
	if((!IsFiring() && IceCharge < 20) && Level.TimeSeconds > (LastChargeTime + 0.5000000))
	{
		IceCharge++;
		LastChargeTime = Level.TimeSeconds;
	}
	//return;	
}

function ServerSwitchSilencer(bool bNewValue)
{
	// End:0x13
	if(bNewValue == bSilenced)
	{
		return;
	}
	bSilenced = bNewValue;
	SwitchSilencer(bSilenced);
	bServerReloading = true;
	ReloadState = 9;
	bFireMode[0].bAISilent = bSilenced;
	MDKPrimaryFire(bFireMode[0]).SetSilenced(bNewValue);
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x24
	if((int(ReloadState) != int(0)) || int(SightingState) != int(0))
	{
		return;
	}
	TemporaryScopeDown(0.5000000);
	bSilenced = !bSilenced;
	ServerSwitchSilencer(bSilenced);
	SwitchSilencer(bSilenced);
	StealthImpulse(0.1000000);
	//return;	
}

simulated function SwitchSilencer(bool bNewValue)
{
	// End:0x18
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = true;
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
	OnSuppressorSwitched();
	//return;	
}

simulated function StealthImpulse(float Amount)
{
	// End:0x2B
	if(Instigator.IsLocallyControlled())
	{
		StealthImps = FMin(1.0000000, StealthImps + Amount);
	}
	//return;	
}

simulated function OnSuppressorSwitched()
{
	// End:0x1E
	if(bSilenced)
	{
		ApplySuppressorAim();
		SightingTime *= 1.2500000;		
	}
	else
	{
		AimComponent.Recalculate();
		SightingTime = default.SightingTime;
	}
	//return;	
}

simulated function ApplySuppressorAim()
{
	AimComponent.AimSpread.Min *= 1.2500000;
	AimComponent.AimSpread.Max *= 1.2500000;
	//return;	
}

simulated function Notify_SilencerAdd()
{
	PlaySound(SilencerOnSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerOnTurn()
{
	PlaySound(SilencerOnTurnSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerRemove()
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

simulated function Notify_ScopeShow()
{
	SetBoneScale(1, 1.0000000, ScopeBone);
	//return;	
}

simulated function Notify_ScopeHide()
{
	SetBoneScale(1, 0.0000000, ScopeBone);
	//return;	
}

simulated function Notify_ScopeAdd()
{
	PlaySound(ScopeOnSound,, 0.5000000);
	//return;	
}

simulated function Notify_ScopeRemove()
{
	PlaySound(ScopeOffSound,, 0.5000000);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x34
	if(AIController(Instigator.Controller) != none)
	{
		bSilenced = FRand() > 0.5000000;
	}
	// End:0x51
	if(bSilenced)
	{
		SetBoneScale(0, 1.0000000, SilencerBone);		
	}
	else
	{
		SetBoneScale(0, 0.0000000, SilencerBone);
	}
	// End:0x80
	if(bScopeOn)
	{
		SetBoneScale(2, 1.0000000, ScopeBone);		
	}
	else
	{
		SetBoneScale(2, 0.0000000, ScopeBone);
	}
	//return;	
}

simulated function PlayReload()
{
	// End:0x1C
	if(MagAmmo < 1)
	{
		SetBoneScale(1, 0.0000000, 'Bullet');
	}
	super.PlayReload();
	// End:0x3F
	if(bSilenced)
	{
		SetBoneScale(0, 1.0000000, SilencerBone);		
	}
	else
	{
		SetBoneScale(0, 0.0000000, SilencerBone);
	}
	// End:0x6E
	if(bScopeOn)
	{
		SetBoneScale(2, 1.0000000, ScopeBone);		
	}
	else
	{
		SetBoneScale(2, 0.0000000, ScopeBone);
	}
	//return;	
}

simulated function Notify_ClipOutOfSight()
{
	SetBoneScale(1, 1.0000000, 'Bullet');
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.5000000, dist, BallisticProInstantFire(bFireMode[0]).DecayRange.Min, BallisticProInstantFire(bFireMode[0]).DecayRange.Max);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.6000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.6000000;
	//return;	
}

defaultproperties
{
	ScopeOnAnim="ScopeOn"
	ScopeOffAnim="ScopeOff"
	ScopeScopeViewTex=Texture'BWBP_SWC_Tex.MDK.MDK_Scope'
	ScopeOnSound=Sound'BW_Core_WeaponSound.XK2.XK2-SilenceOn'
	ScopeOffSound=Sound'BW_Core_WeaponSound.XK2.XK2-SilenceOff'
	ScopeBone="Scope"
	bSilenced=true
	SilencerBone="Silencer"
	SilencerOnAnim="SilencerOn"
	SilencerOffAnim="SilencerOff"
	SilencerOnSound=Sound'BW_Core_WeaponSound.XK2.XK2-SilenceOn'
	SilencerOffSound=Sound'BW_Core_WeaponSound.XK2.XK2-SilenceOff'
	SilencerOnTurnSound=SoundGroup'BW_Core_WeaponSound.XK2.XK2-SilencerTurn'
	SilencerOffTurnSound=SoundGroup'BW_Core_WeaponSound.XK2.XK2-SilencerTurn'
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;15.0;0.6;60.0;0.7;0.1;-999.0")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BWBP_SWC_Pro.MDKWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_SWC_Pro.MDKWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SWC_Pro.MDKWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SWC_Pro.MDKWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SWC_Tex.MDK.BigIcon_MDK'
	BigIconCoords=(X1=24,Y1=48,X2=450,Y2=212)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Pullout',Volume=0.2050000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway',Volume=0.2050000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst of Three",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Burst of Six",bUnavailable=false,ModeID="WM_BigBurst",Value=6.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=3
	SightZoomFactor=1.2000000
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-MagFiddle',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc1',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Dot1',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=64,G=64,B=128,A=140),Color2=(R=255,G=0,B=0,A=255),StartSize1=84,StartSize2=26)
	bWT_Bullet=true
	bWT_Machinegun=true
	ManualLines[0]="Low-velocity submachinegun fire. Low recoil, lower damage output than other submachineguns but controllable and excellent hipfire."
	ManualLines[1]="Activates the internal compressor when firing. Rounds will inflict less damage, but will slow the target."
	ManualLines[2]="The Weapon Function key attaches or removes the suppressor. When active, the suppressor reduces recoil and noise output and hides the muzzle flash, but reduces range.||Effective from the hip and at close range."
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	SightOffset=(X=10.0000000,Y=-0.0500000,Z=41.0000000)
	CockAnimRate=1.2500000
	CockingBringUpTime=1.5000000
	FireModeClass[0]=Class'BWBP_SWC_Pro.MDKPrimaryFire'
	FireModeClass[1]=Class'BWBP_SWC_Pro.MDKSecondaryFire'
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	Description="Primary: 9mm Fire||Alt Add/Remove Scope/Silencer||The MDK Modular SMG was created to fill a variety of roles, featuring different rates of fire and varying degrees of accuracy and power to go with them. Though it is fairly compact compared to larger guns, it is quite heavy and cannot be dual-wielded. Black & Wood saw particularly high sales among soldiers and law enforcement officers on fringe colonies that had previously been attacked by the Skrith, as it fills a variety of roles that would normally require multiple weapons."
	Priority=32
	HudColor=(R=50,G=150,B=200,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=3
	GroupOffset=1
	PickupClass=Class'BWBP_SWC_Pro.MDKPickup'
	PlayerViewOffset=(X=9.0000000,Y=11.0000000,Z=-40.0000000)
	AttachmentClass=Class'BWBP_SWC_Pro.MDKAttachment'
	IconMaterial=Texture'BWBP_SWC_Tex.MDK.SmallIcon_MDK'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="MDK-0331 Modular Machine Uzi"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=130.0000000
	LightRadius=3.0000000
	Mesh=SkeletalMesh'BWBP_SWC_Anims.MDK_FPm'
	DrawScale=0.4000000
}
