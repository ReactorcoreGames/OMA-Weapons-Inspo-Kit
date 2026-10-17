class XK2SubMachinegun extends BallisticHandgun
	config(BallisticProV55);

const ChargeInterval = 0.5;

var(XK2) bool bHasSuppressor;
var(XK2) bool bSilenced;
var(XK2) name SilencerBone;
var(XK2) name SilencerOnAnim;
var(XK2) name SilencerOffAnim;
var(XK2) Sound SilencerOnSound;
var(XK2) Sound SilencerOffSound;
var(XK2) Sound SilencerOnTurnSound;
var(XK2) Sound SilencerOffTurnSound;
var() array<Material> AmpMaterials;
var(XK2) bool bHasAmp;
var(XK2) bool bAmped;
var(XK2) name AmplifierBone;
var(XK2) name AmplifierOnAnim;
var(XK2) name AmplifierOffAnim;
var(XK2) Sound AmplifierOnSound;
var(XK2) Sound AmplifierOffSound;
var(XK2) Sound AmplifierPowerOnSound;
var(XK2) Sound AmplifierPowerOffSound;
var(XK2) float AmpCharge;
var(XK2) float DrainRate;
var(XK2) bool bShowCharge;
var int IceCharge;
var float LastChargeTime;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerSwitchAmplifier, ServerSwitchSilencer;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		ClientSetHeat, IceCharge;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasSuppressor = true;
	bHasAmp = true;
	// End:0x5E
	if(InStr(WeaponParams.LayoutTags, "no_muzzle") != -1)
	{
		bHasSuppressor = false;
		bHasAmp = false;
		bSilenced = false;
	}
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
	// End:0x8D
	if(AmpCharge > float(0))
	{
		AmpCharge = FMax(0.0000000, AmpCharge - (DrainRate * dt));
	}
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x14
	if(!bShowCharge)
	{
		return 0.0000000;		
	}
	else
	{
		return AmpCharge / float(10);
	}
	//return;	
}

function ServerSwitchSilencer(bool bNewValue)
{
	bSilenced = bNewValue;
	SwitchSilencer(bSilenced);
	bServerReloading = true;
	ReloadState = 9;
	Xk2PrimaryFire(bFireMode[0]).SetSilenced(bNewValue);
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x24
	if((int(ReloadState) != int(0)) || int(SightingState) != int(0))
	{
		return;
	}
	// End:0x36
	if(int(ClientState) != int(4))
	{
		return;
	}
	TemporaryScopeDown(0.5000000);
	// End:0x74
	if(bAmped)
	{
		bAmped = !bAmped;
		ServerSwitchAmplifier(bAmped);
		SwitchAmplifier(bAmped);		
	}
	else
	{
		// End:0x81
		if(!bHasSuppressor)
		{
			return;
		}
		bSilenced = !bSilenced;
		ServerSwitchSilencer(bSilenced);
		SwitchSilencer(bSilenced);
		ReloadState = 9;
	}
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

simulated function Notify_XK2SilencerOn()
{
	PlaySound(SilencerOnSound,, 0.5000000);
	//return;	
}

simulated function Notify_XK2SilencerOnTurn()
{
	PlaySound(SilencerOnTurnSound,, 0.5000000);
	//return;	
}

simulated function Notify_XK2SilencerOff()
{
	PlaySound(SilencerOffSound,, 0.5000000);
	//return;	
}

simulated function Notify_XK2SilencerOffTurn()
{
	PlaySound(SilencerOffTurnSound,, 0.5000000);
	//return;	
}

simulated function Notify_XK2SilencerShow()
{
	SetBoneScale(0, 1.0000000, SilencerBone);
	//return;	
}

simulated function Notify_XK2SilencerHide()
{
	SetBoneScale(0, 0.0000000, SilencerBone);
	//return;	
}

simulated exec function ToggleAmplifier(optional byte i)
{
	// End:0x24
	if((int(ReloadState) != int(0)) || int(SightingState) != int(0))
	{
		return;
	}
	// End:0x36
	if(int(ClientState) != int(4))
	{
		return;
	}
	TemporaryScopeDown(0.5000000);
	// End:0x7C
	if(bSilenced)
	{
		bSilenced = !bSilenced;
		ServerSwitchSilencer(bSilenced);
		SwitchSilencer(bSilenced);
		ReloadState = 9;		
	}
	else
	{
		// End:0x89
		if(!bHasAmp)
		{
			return;
		}
		bAmped = !bAmped;
		ServerSwitchAmplifier(bAmped);
		SwitchAmplifier(bAmped);
	}
	//return;	
}

function ServerSwitchAmplifier(bool bNewValue)
{
	bAmped = bNewValue;
	SwitchAmplifier(bAmped);
	bServerReloading = true;
	ReloadState = 9;
	// End:0x9E
	if(bAmped)
	{
		WeaponModes[0].bUnavailable = true;
		WeaponModes[1].bUnavailable = true;
		WeaponModes[2].bUnavailable = true;
		WeaponModes[3].bUnavailable = true;
		WeaponModes[4].bUnavailable = false;
		CurrentWeaponMode = 4;
		ServerSwitchWeaponMode(4);
		AmpCharge = 10.0000000;		
	}
	else
	{
		WeaponModes[0].bUnavailable = false;
		WeaponModes[1].bUnavailable = false;
		WeaponModes[2].bUnavailable = false;
		WeaponModes[3].bUnavailable = false;
		WeaponModes[4].bUnavailable = true;
		CurrentWeaponMode = 3;
		ServerSwitchWeaponMode(3);
		AmpCharge = 0.0000000;
	}
	// End:0x131
	if(int(Role) == int(ROLE_Authority))
	{
		Xk2Attachment(ThirdPersonActor).SetAmped(bNewValue);
	}
	// End:0x16D
	if((int(CurrentWeaponMode) == 1) && AmpCharge > float(0))
	{
		Skins[2] = AmpMaterials[0];
		Skins[3] = AmpMaterials[1];
	}
	//return;	
}

simulated function SwitchAmplifier(bool bNewValue)
{
	// End:0x18
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = true;
	}
	ReloadState = 9;
	// End:0x8D
	if(bNewValue)
	{
		PlayAnim(AmplifierOnAnim);
		WeaponModes[0].bUnavailable = true;
		WeaponModes[1].bUnavailable = true;
		WeaponModes[2].bUnavailable = true;
		WeaponModes[3].bUnavailable = true;
		WeaponModes[4].bUnavailable = false;
		AmpCharge = 10.0000000;		
	}
	else
	{
		PlayAnim(AmplifierOffAnim);
		WeaponModes[0].bUnavailable = false;
		WeaponModes[1].bUnavailable = false;
		WeaponModes[2].bUnavailable = false;
		WeaponModes[3].bUnavailable = false;
		WeaponModes[4].bUnavailable = true;
		CurrentWeaponMode = 3;
		ServerSwitchWeaponMode(3);
		AmpCharge = 0.0000000;
	}
	// End:0x128
	if(int(Role) == int(ROLE_Authority))
	{
		Xk2Attachment(ThirdPersonActor).SetAmped(bNewValue);
	}
	// End:0x165
	if((int(CurrentWeaponMode) == 4) && AmpCharge > float(0))
	{
		Skins[2] = AmpMaterials[0];
		Skins[3] = AmpMaterials[1];
	}
	//return;	
}

simulated function ServerSwitchWeaponMode(byte newmode)
{
	super.ServerSwitchWeaponMode(newmode);
	// End:0x3A
	if(!Instigator.IsLocallyControlled())
	{
		Xk2PrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
	}
	//return;	
}

simulated function CommonSwitchWeaponMode(byte newmode)
{
	super(BallisticWeapon).CommonSwitchWeaponMode(newmode);
	Xk2PrimaryFire(FireMode[0]).SwitchWeaponMode(newmode);
	// End:0x63
	if((int(newmode) == 4) && AmpCharge > float(0))
	{
		Skins[2] = AmpMaterials[0];
		Skins[3] = AmpMaterials[1];
	}
	//return;	
}

simulated function AddHeat(float Amount)
{
	// End:0x15
	if(bBerserk)
	{
		Amount *= 0.7500000;
	}
	AmpCharge = FMax(0.0000000, AmpCharge + Amount);
	// End:0xF4
	if(AmpCharge <= float(0))
	{
		PlaySound(AmplifierPowerOffSound,, 2.0000000,, 32.0000000);
		Skins[2] = AmpMaterials[2];
		Skins[3] = AmpMaterials[3];
		WeaponModes[0].bUnavailable = false;
		WeaponModes[1].bUnavailable = false;
		WeaponModes[2].bUnavailable = false;
		WeaponModes[3].bUnavailable = false;
		WeaponModes[4].bUnavailable = true;
		CurrentWeaponMode = 3;
		ServerSwitchWeaponMode(3);
		// End:0xF4
		if(int(Role) == int(ROLE_Authority))
		{
			Xk2Attachment(ThirdPersonActor).SetAmped(false);
		}
	}
	//return;	
}

simulated function ClientSetHeat(float NewHeat)
{
	AmpCharge = NewHeat;
	//return;	
}

simulated function Notify_XK2AmpOn()
{
	PlaySound(AmplifierOnSound,, 0.5000000);
	bShowCharge = true;
	//return;	
}

simulated function Notify_XK2AmpOff()
{
	PlaySound(AmplifierOffSound,, 0.5000000);
	bShowCharge = false;
	//return;	
}

simulated function Notify_XK2AmpShow()
{
	SetBoneScale(2, 1.0000000, AmplifierBone);
	//return;	
}

simulated function Notify_XK2AmpHide()
{
	SetBoneScale(2, 0.0000000, AmplifierBone);
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
	// End:0x57
	if(bAmped)
	{
		SetBoneScale(2, 1.0000000, AmplifierBone);		
	}
	else
	{
		SetBoneScale(2, 0.0000000, AmplifierBone);
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.6000000, dist, BallisticInstantFire(bFireMode[0]).DecayRange.Min, BallisticInstantFire(bFireMode[0]).DecayRange.Max);
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
	bSilenced=true
	SilencerBone="Silencer"
	SilencerOnAnim="SilencerOn"
	SilencerOffAnim="SilencerOff"
	SilencerOnSound=Sound'BW_Core_WeaponSound.XK2.XK2-SilenceOn'
	SilencerOffSound=Sound'BW_Core_WeaponSound.XK2.XK2-SilenceOff'
	SilencerOnTurnSound=SoundGroup'BW_Core_WeaponSound.XK2.XK2-SilencerTurn'
	SilencerOffTurnSound=SoundGroup'BW_Core_WeaponSound.XK2.XK2-SilencerTurn'
	AmpMaterials[0]=Shader'BW_Core_WeaponTex.AMP.Amp-FinalCyan'
	AmpMaterials[1]=Shader'BW_Core_WeaponTex.AMP.Amp-GlowCyanShader'
	AmpMaterials[2]=Texture'BW_Core_WeaponTex.AMP.Amp-BaseDepleted'
	AmpMaterials[3]=Texture'ONSstructureTextures.CoreGroup.Invisible'
	AmplifierBone="AMP"
	AmplifierOnAnim="AMPOn"
	AmplifierOffAnim="AMPOff"
	AmplifierOnSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOn'
	AmplifierOffSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOff'
	AmplifierPowerOnSound=Sound'BW_Core_WeaponSound.AMP.Amp-Install'
	AmplifierPowerOffSound=Sound'BW_Core_WeaponSound.AMP.Amp-Depleted'
	DrainRate=0.1500000
	SpecialInfo[0]=(Id="EvoDefs",Info="120.0;10.0;0.6;60.0;0.3;0.1;-999.0")
	AIReloadTime=1.0000000
	SightAnimScale=0.4500000
	ParamsClasses[0]=Class'BallisticProV55.XK2WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.XK2WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.XK2WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.XK2WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_XK2'
	BigIconCoords=(X1=24,Y1=48,X2=450,Y2=212)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Pullout',Volume=0.2100000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway',Volume=0.2080000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst of Three",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Burst of Six",bUnavailable=false,ModeID="WM_BigBurst",Value=6.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="Amp: Ice Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=3
	SightFXClass=Class'BallisticProV55.XK2SightLEDs'
	bNoCrosshairInScope=true
	SightBobScale=0.2000000
	CockSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.A73OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=128),Color2=(R=255,G=255,B=0,A=255),StartSize1=70,StartSize2=82)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.8000000,X2=0.5000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=6.0000000,CurrentScale=0.0000000)
	bWT_Bullet=true
	bWT_Machinegun=true
	ManualLines[0]="Low-velocity submachinegun fire. Low recoil, lower damage output than other submachineguns but controllable and excellent hipfire."
	ManualLines[1]="Activates the internal compressor when firing. Rounds will inflict less damage, but will slow the target."
	ManualLines[2]="The Weapon Function key attaches or removes the suppressor. When active, the suppressor reduces recoil and noise output and hides the muzzle flash, but reduces range.||Effective from the hip and at close range."
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	SightOffset=(X=6.0000000,Y=0.0200000,Z=3.7500000)
	FireModeClass[0]=Class'BallisticProV55.Xk2PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.Xk2SecondaryFire'
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	bShowChargingBar=true
	Description="Yet another high quality weapon by Black & Wood, the XK2 is a lightweight, suppressed sub-machinegun. It has a fast rate of fire, but its low velocity bullets make it less dangerous than other weapons. However, these low velocity rounds do allow the weapon to be easily silenced, turning it into an effective stealth weapon, used by many law enforcement organisations, and Black-Ops military units alike. The weapon's high rate of fire, and quick reload times, means that the soldier can pump out rounds quicker than even the M353, making it very useful for cover-fire."
	Priority=32
	HudColor=(R=50,G=150,B=100,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=3
	GroupOffset=1
	PickupClass=Class'BallisticProV55.XK2Pickup'
	PlayerViewOffset=(X=10.0000000,Y=9.0000000,Z=-12.0000000)
	AttachmentClass=Class'BallisticProV55.Xk2Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_XK2'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="XK2 Submachine Gun"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=130.0000000
	LightRadius=3.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.XK2_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BW_Core_WeaponTex.XK2.XK2_Main-Shiney'
	Skins[2]=Shader'BW_Core_WeaponTex.AMP.Amp-FinalCyan'
	Skins[3]=Shader'BW_Core_WeaponTex.AMP.Amp-GlowCyanShader'
}
