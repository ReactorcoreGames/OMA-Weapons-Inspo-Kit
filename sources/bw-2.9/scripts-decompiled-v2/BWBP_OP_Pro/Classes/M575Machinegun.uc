class M575Machinegun extends BallisticMachinegun
	config(BallisticProV55);

const ChargeInterval = 0.5;

var bool bScopeOn;
var bool bScopeAnimEnded;
var() name ScopeOnAnim;
var() name ScopeOffAnim;
var() Material ScopeScopeViewTex;
var Rotator ScopeOffRot;
var Rotator ScopeOnRot;
var() array<Material> AmpMaterials;
var(M575) bool bAmped;
var(MARS) name AmplifierBone;
var(MARS) name AmplifierOnAnim;
var(MARS) name AmplifierOffAnim;
var(MARS) Sound AmplifierOnSound;
var(MARS) Sound AmplifierOffSound;
var(MARS) Sound AmplifierPowerOnSound;
var(MARS) Sound AmplifierPowerOffSound;
var(MARS) Sound AmplifierOnTurnSound;
var(MARS) Sound AmplifierOffTurnSound;
var(MARS) float AmpCharge;
var(MARS) float DrainRate;
var(MARS) bool bShowCharge;
var int IceCharge;
var float LastChargeTime;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerSwitchAmplifier;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		ClientSetHeat, IceCharge;
}

simulated function PostNetBeginPlay()
{
	// End:0x1C
	if(bScopeOn)
	{
		SetBoneRotation('ScopeHinge', ScopeOnRot);		
	}
	else
	{
		SetBoneRotation('ScopeHinge', ScopeOffRot);
	}
	bScopeAnimEnded = true;
	SetScopeProperties();
	super(BallisticWeapon).PostNetBeginPlay();
	//return;	
}

simulated event Tick(float dt)
{
	// End:0x35
	if(bScopeAnimEnded)
	{
		// End:0x25
		if(bScopeOn)
		{
			SetBoneRotation('ScopeHinge', ScopeOnRot);			
		}
		else
		{
			SetBoneRotation('ScopeHinge', ScopeOffRot);
		}
	}
	super(BallisticWeapon).Tick(dt);
	//return;	
}

simulated function PlayReload()
{
	PlayAnim('ReloadHold', ReloadAnimRate,, int(0.2500000));
	//return;	
}

simulated function PlayReloadFinish()
{
	SetBoxVisibility();
	SetBeltVisibility((Ammo[0].AmmoAmount + MagAmmo) + 1);
	// End:0x63
	if((Ammo[0].AmmoAmount + MagAmmo) < (BeltLength + 1))
	{
		PlayAnim('ReloadFinishFew', 0.8000000 * ReloadAnimRate,, 0);		
	}
	else
	{
		PlayAnim('ReloadFinish', 0.8000000 * ReloadAnimRate,, 0);
	}
	//return;	
}

simulated function Notify_M353FlapOpenedReload()
{
	PlayReload();
	//return;	
}

simulated function Notify_CockAfterReload()
{
	// End:0x21
	if(bNeedCock && MagAmmo > 0)
	{
		CommonCockGun(2);		
	}
	else
	{
		PlayAnim('ReloadFinishHold', ReloadAnimRate, 0.2000000);
	}
	//return;	
}

simulated function bool HasAmmo()
{
	// End:0x2B
	if((FireMode[0] != none) && MagAmmo >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	// End:0x70
	if(((Ammo[0] != none) && FireMode[0] != none) && Ammo[0].AmmoAmount >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	return false;
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
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

function ServerSwitchScopeType(bool bNewScope)
{
	SwitchScopeType(bNewScope);
	//return;	
}

simulated function byte GetRecoilParamsIndex()
{
	return byte(bScopeOn);
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
	SetBoneRotation('ScopeHinge', ScopeOnRot);
	// End:0x77
	if(bNewScope)
	{
		PlayAnim(ScopeOnAnim);		
	}
	else
	{
		PlayAnim(ScopeOffAnim);
	}
	static.GetParams().SetRecoilParams(self);
	//return;	
}

simulated function Notify_ScopeShow()
{
	UpdateBones();
	//return;	
}

simulated function Notify_ScopeHide()
{
	UpdateBones();
	//return;	
}

simulated function UpdateBones()
{
	// End:0x1C
	if(bScopeOn)
	{
		SetBoneRotation('ScopeHinge', ScopeOnRot);		
	}
	else
	{
		SetBoneRotation('ScopeHinge', ScopeOffRot);
	}
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
	super(BallisticWeapon).AnimEnded(Channel, Anim, frame, Rate);
	//return;	
}

simulated function SetScopeProperties()
{
	// End:0x3C
	if(bScopeOn)
	{
		ZoomType = 1;
		SightingTime = default.SightingTime * 1.3300000;
		ScopeViewTex = ScopeScopeViewTex;
		MaxZoom = 2.0000000;		
	}
	else
	{
		ZoomType = 0;
		ScopeViewTex = none;
		SightingTime = default.SightingTime;
	}
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
	return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.7500000, dist, 1024.0000000, 2048.0000000);
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

simulated function WeaponTick(float dt)
{
	super(BallisticWeapon).WeaponTick(dt);
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
	bAmped = !bAmped;
	ServerSwitchAmplifier(bAmped);
	SwitchAmplifier(bAmped);
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
		M575Attachment(ThirdPersonActor).SetAmped(bNewValue);
	}
	// End:0x16D
	if((int(CurrentWeaponMode) == 1) && AmpCharge > float(0))
	{
		Skins[4] = AmpMaterials[0];
		Skins[5] = AmpMaterials[1];
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
		M575Attachment(ThirdPersonActor).SetAmped(bNewValue);
	}
	// End:0x165
	if((int(CurrentWeaponMode) == 4) && AmpCharge > float(0))
	{
		Skins[4] = AmpMaterials[0];
		Skins[5] = AmpMaterials[1];
	}
	//return;	
}

simulated function ServerSwitchWeaponMode(byte newmode)
{
	super(BallisticWeapon).ServerSwitchWeaponMode(newmode);
	// End:0x3A
	if(!Instigator.IsLocallyControlled())
	{
		M575PrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
	}
	//return;	
}

simulated function CommonSwitchWeaponMode(byte newmode)
{
	super(BallisticWeapon).CommonSwitchWeaponMode(newmode);
	M575PrimaryFire(FireMode[0]).SwitchWeaponMode(newmode);
	// End:0x63
	if((int(newmode) == 4) && AmpCharge > float(0))
	{
		Skins[4] = AmpMaterials[0];
		Skins[5] = AmpMaterials[1];
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
		Skins[4] = AmpMaterials[2];
		Skins[5] = AmpMaterials[3];
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
			M575Attachment(ThirdPersonActor).SetAmped(false);
		}
	}
	//return;	
}

simulated function ClientSetHeat(float NewHeat)
{
	AmpCharge = NewHeat;
	//return;	
}

simulated function Notify_AmpOn()
{
	PlaySound(AmplifierOnSound,, 0.5000000);
	bShowCharge = true;
	//return;	
}

simulated function Notify_AmpOff()
{
	PlaySound(AmplifierOffSound,, 0.5000000);
	bShowCharge = false;
	//return;	
}

simulated function Notify_AMPShow()
{
	SetBoneScale(2, 1.0000000, AmplifierBone);
	//return;	
}

simulated function Notify_AmpHide()
{
	SetBoneScale(2, 0.0000000, AmplifierBone);
	//return;	
}

simulated function Notify_AMPOnTurn()
{
	PlaySound(AmplifierOnTurnSound,, 0.5000000);
	//return;	
}

simulated function Notify_AMPOffTurn()
{
	PlaySound(AmplifierOffTurnSound,, 0.5000000);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x29
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

function float SuggestAttackStyle()
{
	return -0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.5000000;
	//return;	
}

defaultproperties
{
	ScopeOnAnim="ScopeOn"
	ScopeOffAnim="ScopeOff"
	ScopeScopeViewTex=Texture'BWBP_OP_Tex.M575.M575Scope'
	ScopeOffRot=(Pitch=0,Yaw=0,Roll=-21845)
	AmpMaterials[0]=Shader'BW_Core_WeaponTex.AMP.Amp-FinalCyan'
	AmpMaterials[1]=Shader'BW_Core_WeaponTex.AMP.Amp-GlowCyanShader'
	AmpMaterials[2]=Texture'BW_Core_WeaponTex.AMP.Amp-BaseDepleted'
	AmpMaterials[3]=Texture'ONSstructureTextures.CoreGroup.Invisible'
	AmplifierBone="AMP"
	AmplifierOnAnim="AMPApply"
	AmplifierOffAnim="AMPRemove"
	AmplifierOnSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOn'
	AmplifierOffSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOff'
	AmplifierPowerOnSound=Sound'BW_Core_WeaponSound.AMP.Amp-Install'
	AmplifierPowerOffSound=Sound'BW_Core_WeaponSound.AMP.Amp-Depleted'
	AmplifierOnTurnSound=SoundGroup'BW_Core_WeaponSound.XK2.XK2-SilencerTurn'
	AmplifierOffTurnSound=SoundGroup'BW_Core_WeaponSound.XK2.XK2-SilencerTurn'
	DrainRate=0.1500000
	BoxOnSound=(Sound=Sound'BWBP_OP_Sounds.M575.M575-BoxOn',Volume=1.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	BoxOffSound=(Sound=Sound'BWBP_OP_Sounds.M575.M575-BoxOff',Volume=1.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	FlapUpSound=(Sound=Sound'BWBP_OP_Sounds.M575.M575-Open',Volume=1.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	FlapDownSound=(Sound=Sound'BWBP_OP_Sounds.M575.M575-Close',Volume=1.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="330.0;25.0;0.7;-1.0;1.0;0.2;-999.0")
	AIReloadTime=4.0000000
	SightAnimScale=0.5000000
	ParamsClasses[0]=Class'BWBP_OP_Pro.M575MachinegunWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.M575.BigIcon_M575'
	BigIconCoords=(X1=0,Y1=50,X2=511,Y2=240)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-Pullout',Volume=0.2150000,Radius=24.0000000,Slot=3,Pitch=0.9000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-Putaway',Volume=0.2850000,Radius=24.0000000,Slot=3,Pitch=0.9000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst of Three",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Burst of Five",bUnavailable=false,ModeID="WM_BigBurst",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="Amp: Ice Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=3
	SightFXClass=Class'BWBP_OP_Pro.M575SightLEDs'
	bNoCrosshairInScope=true
	SightBobScale=0.6000000
	CockSound=(Sound=Sound'BWBP_OP_Sounds.M575.M575-BoltQuick',Volume=1.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_OP_Sounds.M575.M575-BoltQuick',Volume=1.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ReloadAnim="ReloadStart"
	ClipOutSound=(Sound=Sound'BWBP_OP_Sounds.M575.M575-Belt',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-ShellIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M353OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M353InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=0,B=162,A=255),Color2=(R=255,G=255,B=0,A=255),StartSize1=96,StartSize2=96)
	bWT_Bullet=true
	bWT_Machinegun=true
	ManualLines[0]="Automatic 5.56mm fire. Has a high rate of fire, moderate damage and good sustained damage output. As a machinegun, it has a very long effective range. Large magazine capacity allows the weapon to fire for a long time, but the reload time is long."
	ManualLines[1]="Automatic Ice Rounds. Slows the enemy down a small amount making it easier to hit the primary fire rounds. Does less damage and has a slightly slower fire rate, but will give an advantage once used."
	ManualLines[2]="Enable the Hybrid Scope. While the hybrid scope is enabled, you will have access to a fixed 2X Scope, which can be taken off when out of combat."
	ManualLines[3]="In response to not just the regular UTC troops demanding a new LMG, but also the ODST troops finding the M353 to be inadequate in stopping skrith dead in their tracks, Enravion updated the platform into the new M575 Machine Gun. In addition to firing 7.62mm rounds instead of the old 5.56mm rounds, the M575 also has rail support for all the optics one could ever ask for; when the weapon first debuted, it came with a C-All Red Dot Sight along with a 2x magnifier scope. While the M353 is still hanging around, it is slated to be phased by the M575 within 6 months if all goes well."
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=2.1000000)
	CockingBringUpTime=2.1000000
	FireModeClass[0]=Class'BWBP_OP_Pro.M575PrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.M575SecondaryFire'
	SelectAnimRate=1.3500000
	PutDownTime=0.5500000
	BringUpTime=0.7000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7500000
	CurrentRating=0.7500000
	bShowChargingBar=true
	Description="In response to not just the regular UTC troops demanding a new LMG, but also the ODST troops finding the M353 to be inadequate in stopping skrith dead in their tracks, Enravion updated the platform into the new M575 Machine Gun. In addition to firing 7.62mm rounds instead of the old 5.56mm rounds, the M575 also has rail support for all the optics one could ever ask for; when the weapon first debuted, it came with a C-All Red Dot Sight along with a 2x magnifier scope. While the M353 is still hanging around, it is slated to be phased by the M575 within 6 months if all goes well."
	Priority=43
	HudColor=(R=15,G=175,B=200,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=6
	PickupClass=Class'BWBP_OP_Pro.M575Pickup'
	PlayerViewOffset=(X=6.0000000,Y=4.5000000,Z=-4.0000000)
	AttachmentClass=Class'BWBP_OP_Pro.M575Attachment'
	IconMaterial=Texture'BWBP_OP_Tex.M575.SmallIcon_M575'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="M575 Medium Machinegun"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_OP_Anim.M575_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BWBP_SKC_Tex.CYLO.CYLO-SightShader'
	Skins[2]=Shader'BWBP_OP_Tex.M575.M575_scope_SH1'
	Skins[3]=Shader'BWBP_OP_Tex.M575.M575_body_SH1'
	Skins[4]=Shader'BW_Core_WeaponTex.AMP.Amp-FinalCyan'
	Skins[5]=Shader'BW_Core_WeaponTex.AMP.Amp-GlowCyanShader'
}
