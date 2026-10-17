class R78Rifle extends BallisticWeapon
	config(BallisticProV55);

var bool bHasSilencer;
var bool bSilenced;
var() name SilencerBone;
var() name SilencerOnAnim;
var() name SilencerOffAnim;
var() Sound SilencerOnSound;
var() Sound SilencerOffSound;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerSwitchSilencer;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasSilencer = false;
	// End:0x7B
	if(InStr(WeaponParams.LayoutTags, "silencer") != -1)
	{
		bHasSilencer = true;
		SetBoneScale(0, 1.0000000, SilencerBone);
		bSilenced = true;
		R78PrimaryFire(bFireMode[0]).SetSilenced(true);
		OnSuppressorSwitched();
	}
	// End:0xC6
	if(InStr(WeaponParams.LayoutTags, "quickpull") != -1)
	{
		CockAnim = 'CockQuick';
		CockAnimPostReload = 'CockQuick';
		CockSound.Sound = Sound'BW_Core_WeaponSound.R78.R78NS-Cock';
	}
	//return;	
}

function ServerSwitchSilencer(bool bDetachSuppressor)
{
	SwitchSilencer(bSilenced);
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x0D
	if(!bHasSilencer)
	{
		return;
	}
	// End:0x31
	if((int(ReloadState) != int(0)) || int(SightingState) != int(0))
	{
		return;
	}
	TemporaryScopeDown(0.5000000);
	ServerSwitchSilencer(bSilenced);
	SwitchSilencer(bSilenced);
	ReloadState = 9;
	//return;	
}

simulated function SwitchSilencer(bool bDetachSuppressor)
{
	// End:0x18
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = true;
	}
	ReloadState = 9;
	// End:0x34
	if(bDetachSuppressor)
	{
		PlayAnim(SilencerOffAnim);		
	}
	else
	{
		PlayAnim(SilencerOnAnim);
	}
	OnSuppressorSwitched();
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

simulated function OnAimParamsChanged()
{
	super.OnAimParamsChanged();
	// End:0x15
	if(bSilenced)
	{
		ApplySuppressorAim();
	}
	//return;	
}

simulated function ApplySuppressorAim()
{
	AimComponent.AimSpread.Min *= 1.2500000;
	AimComponent.AimSpread.Max *= 1.2500000;
	//return;	
}

simulated function Notify_SilencerOn()
{
	PlaySound(SilencerOnSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerOff()
{
	PlaySound(SilencerOffSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerShow()
{
	SetBoneScale(0, 1.0000000, SilencerBone);
	bSilenced = true;
	R78PrimaryFire(bFireMode[0]).SetSilenced(true);
	//return;	
}

simulated function Notify_SilencerHide()
{
	SetBoneScale(0, 0.0000000, SilencerBone);
	bSilenced = false;
	R78PrimaryFire(bFireMode[0]).SetSilenced(false);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x28
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

simulated function Notify_CockAimed()
{
	bNeedCock = false;
	ReloadState = 8;
	PlayOwnedSound(CockSound.Sound, CockSound.Slot, CockSound.Volume, CockSound.bNoOverride, CockSound.Radius, CockSound.Pitch, CockSound.bAtten);
	//return;	
}

simulated function Notify_CockSlow()
{
	bNeedCock = false;
	ReloadState = 8;
	PlayOwnedSound(CockSound.Sound, CockSound.Slot, CockSound.Volume, CockSound.bNoOverride, CockSound.Radius, CockSound.Pitch, CockSound.bAtten);
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
	return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.5000000, dist, 2048.0000000, 3072.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.9000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.9000000;
	//return;	
}

defaultproperties
{
	SilencerBone="Silencer"
	SilencerOnAnim="SilencerAdd"
	SilencerOffAnim="SilencerRemove"
	SilencerOnSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOn'
	SilencerOffSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOff'
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;25.0;0.5;60.0;10.0;0.0;0.0")
	SightAnimScale=0.2000000
	ParamsClasses[0]=Class'BallisticProV55.R78WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.R78WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.R78WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.R78WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_R78'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78Putaway',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Bolt-Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	ScopeXScale=1.3330000
	ZoomInAnim="ZoomIn"
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MinZoom=4.0000000
	MaxZoom=16.0000000
	FullZoomFOV=20.0000000
	ScopeViewTex=Texture'BW_Core_WeaponTex.R78.RifleScopeView'
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78-Cock2',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.R78OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.R78InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=192),Color2=(R=255,G=255,B=0,A=255),StartSize1=98,StartSize2=87)
	bWT_Bullet=true
	ManualLines[0]="Bolt-action sniper rifle fire. High damage, long range, slow fire rate."
	ManualLines[1]="Engages the scope."
	ManualLines[2]="Does not use tracer rounds. Effective at long range and against clustered enemies."
	SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
	SightOffset=(X=-1.5000000,Y=-0.5000000,Z=5.3000000)
	GunLength=80.0000000
	FireModeClass[0]=Class'BallisticProV55.R78PrimaryFire'
	FireModeClass[1]=Class'BCoreProV55.BallisticScopeFire'
	PutDownTime=0.5000000
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	bSniping=true
	Description="Originally taken from the design of a bird hunting rifle, the R78 'Raven' is a favourite among military snipers and commando corps. Used to a great extent by the expert marksmen of the New European Army, the Raven is extremely reliable and capable of incredible damage in a single shot. The added long distance sniping scope makes the R78 one of the most deadly weapons. Of course, the gun is only as good as the soldier using it; it has a low magazine capacity, long reload times and is terribly ineffective in close quarters combat."
	Priority=33
	HudColor=(R=200,G=50,B=50,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=9
	GroupOffset=2
	PickupClass=Class'BallisticProV55.R78Pickup'
	PlayerViewOffset=(X=8.5000000,Y=4.5000000,Z=-6.0000000)
	AttachmentClass=Class'BallisticProV55.R78Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_R78'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="R78A1 Sniper Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.R78_FPm'
	DrawScale=0.3000000
}
