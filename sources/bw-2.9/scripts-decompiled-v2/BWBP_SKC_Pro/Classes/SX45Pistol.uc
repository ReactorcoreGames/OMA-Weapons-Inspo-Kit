class SX45Pistol extends BallisticHandgun
	config(BallisticProV55);

var(SX45) bool bHasAmp;
var(SX45) bool bAmped;
var(SX45) name AmplifierBone;
var(SX45) name AmplifierBone2;
var(SX45) name AmplifierOnAnim;
var(SX45) name AmplifierOffAnim;
var(SX45) Sound AmplifierOnSound;
var(SX45) Sound AmplifierOffSound;
var(SX45) Sound AmplifierPowerOnSound;
var(SX45) Sound AmplifierPowerOffSound;
var(SX45) Sound SlideReleaseSound;
var(SX45) float AmpCharge;
var(SX45) float DrainRate;
var(SX45) bool bShowCharge;
var() array<Material> AmpMaterials;
var Projector FlashLightProj;
var Emitter FlashLightEmitter;
var bool bLightsOn;
var() name FlashlightAnim;
var bool bFirstDraw;
var Vector TorchOffset;
var() Sound TorchOnSound;
var() Sound TorchOffSound;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerFlashLight, ServerSwitchAmplifier;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		ClientSetHeat;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasAmp = true;
	// End:0x43
	if(InStr(WeaponParams.LayoutTags, "no_amp") != -1)
	{
		bHasAmp = false;
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

simulated exec function ToggleAmplifier(optional byte i)
{
	// End:0x24
	if((int(ReloadState) != int(0)) || int(SightingState) != int(0))
	{
		return;
	}
	// End:0x31
	if(!bHasAmp)
	{
		return;
	}
	// End:0x83
	if(OtherGun != none)
	{
		// End:0x57
		if(int(OtherGun.ClientState) != int(4))
		{
			return;
		}
		// End:0x64
		if(IsInState('DualAction'))
		{
			return;
		}
		// End:0x83
		if(!OtherGun.IsInState('Lowered'))
		{
			GotoState('PendingSwitchAmplifier');
			return;
		}
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
	// End:0x7E
	if(bAmped)
	{
		WeaponModes[0].bUnavailable = true;
		WeaponModes[1].bUnavailable = false;
		WeaponModes[2].bUnavailable = false;
		CurrentWeaponMode = 1;
		ServerSwitchWeaponMode(1);
		AmpCharge = 10.0000000;		
	}
	else
	{
		WeaponModes[0].bUnavailable = false;
		WeaponModes[1].bUnavailable = true;
		WeaponModes[2].bUnavailable = true;
		CurrentWeaponMode = 0;
		ServerSwitchWeaponMode(0);
		AmpCharge = 0.0000000;
	}
	// End:0xF1
	if(int(Role) == int(ROLE_Authority))
	{
		SX45Attachment(ThirdPersonActor).SetAmped(bNewValue);
	}
	// End:0x147
	if((int(CurrentWeaponMode) == 1) && AmpCharge > float(0))
	{
		SX45Attachment(ThirdPersonActor).SetAmpColour(true, false);
		Skins[6] = AmpMaterials[1];
		Skins[7] = AmpMaterials[2];		
	}
	else
	{
		// End:0x19B
		if((int(CurrentWeaponMode) == 2) && AmpCharge > float(0))
		{
			SX45Attachment(ThirdPersonActor).SetAmpColour(false, true);
			Skins[6] = AmpMaterials[0];
			Skins[7] = AmpMaterials[3];
		}
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
	// End:0x6D
	if(bNewValue)
	{
		PlayAnim(AmplifierOnAnim);
		WeaponModes[0].bUnavailable = true;
		WeaponModes[1].bUnavailable = false;
		WeaponModes[2].bUnavailable = false;
		AmpCharge = 10.0000000;		
	}
	else
	{
		PlayAnim(AmplifierOffAnim);
		WeaponModes[0].bUnavailable = false;
		WeaponModes[1].bUnavailable = true;
		WeaponModes[2].bUnavailable = true;
		AmpCharge = 0.0000000;
	}
	// End:0xD8
	if(int(Role) == int(ROLE_Authority))
	{
		SX45Attachment(ThirdPersonActor).SetAmped(bNewValue);
	}
	// End:0x12E
	if((int(CurrentWeaponMode) == 1) && AmpCharge > float(0))
	{
		SX45Attachment(ThirdPersonActor).SetAmpColour(true, false);
		Skins[6] = AmpMaterials[1];
		Skins[7] = AmpMaterials[2];		
	}
	else
	{
		// End:0x182
		if((int(CurrentWeaponMode) == 2) && AmpCharge > float(0))
		{
			SX45Attachment(ThirdPersonActor).SetAmpColour(false, true);
			Skins[6] = AmpMaterials[0];
			Skins[7] = AmpMaterials[3];
		}
	}
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	super.ServerSwitchWeaponMode(newmode);
	// End:0x3A
	if(!Instigator.IsLocallyControlled())
	{
		SX45PrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
	}
	//return;	
}

simulated function CommonSwitchWeaponMode(byte newmode)
{
	super(BallisticWeapon).CommonSwitchWeaponMode(newmode);
	SX45PrimaryFire(FireMode[0]).SwitchWeaponMode(newmode);
	// End:0x7C
	if((int(newmode) == 1) && AmpCharge > float(0))
	{
		SX45Attachment(ThirdPersonActor).SetAmpColour(true, false);
		Skins[6] = AmpMaterials[1];
		Skins[7] = AmpMaterials[2];		
	}
	else
	{
		// End:0xD0
		if((int(newmode) == 2) && AmpCharge > float(0))
		{
			SX45Attachment(ThirdPersonActor).SetAmpColour(false, true);
			Skins[6] = AmpMaterials[0];
			Skins[7] = AmpMaterials[3];
		}
	}
	//return;	
}

simulated function Notify_AmplifierOn()
{
	PlaySound(AmplifierOnSound,, 0.5000000);
	//return;	
}

simulated function Notify_AmplifierOff()
{
	PlaySound(AmplifierOffSound,, 0.5000000);
	bShowCharge = false;
	//return;	
}

simulated function Notify_AmplifierCharged()
{
	PlaySound(AmplifierPowerOnSound,, 1.6000000);
	bShowCharge = true;
	//return;	
}

simulated function Notify_AmplifierShow()
{
	SetBoneScale(0, 1.0000000, AmplifierBone);
	SetBoneScale(2, 0.0000000, AmplifierBone2);
	//return;	
}

simulated function Notify_AmplifierHide()
{
	SetBoneScale(0, 0.0000000, AmplifierBone);
	SetBoneScale(2, 1.0000000, AmplifierBone2);
	//return;	
}

simulated function Notify_ClipOutOfSight()
{
	SetBoneScale(1, 1.0000000, 'Bullet');
	//return;	
}

simulated function Notify_SlideRelease()
{
	PlaySound(SlideReleaseSound,, 1.2000000);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x99
	if(AIController(Instigator.Controller) != none)
	{
		// End:0x88
		if(bHasAmp)
		{
			bAmped = FRand() > 0.5000000;
			ServerSwitchAmplifier(bAmped);
			SwitchAmplifier(bAmped);
			// End:0x88
			if(bAmped)
			{
				AmpCharge = 100.0000000;
				DrainRate = 0.0000000;
				// End:0x88
				if(FRand() > 0.5000000)
				{
					CommonSwitchWeaponMode(2);
				}
			}
		}
		bLightsOn == (FRand() > 0.5000000);
	}
	// End:0xC8
	if(bAmped)
	{
		SetBoneScale(0, 1.0000000, AmplifierBone);
		SetBoneScale(2, 0.0000000, AmplifierBone2);		
	}
	else
	{
		SetBoneScale(0, 0.0000000, AmplifierBone);
		SetBoneScale(2, 1.0000000, AmplifierBone2);
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

simulated function AddHeat(float Amount)
{
	// End:0x15
	if(bBerserk)
	{
		Amount *= 0.7500000;
	}
	AmpCharge = FMax(0.0000000, AmpCharge + Amount);
	// End:0xD4
	if(AmpCharge <= float(0))
	{
		PlaySound(AmplifierPowerOffSound,, 2.0000000,, 32.0000000);
		Skins[6] = AmpMaterials[4];
		Skins[7] = AmpMaterials[5];
		WeaponModes[0].bUnavailable = false;
		WeaponModes[1].bUnavailable = true;
		WeaponModes[2].bUnavailable = true;
		CurrentWeaponMode = 0;
		ServerSwitchWeaponMode(0);
		// End:0xD4
		if(int(Role) == int(ROLE_Authority))
		{
			SX45Attachment(ThirdPersonActor).SetAmped(false);
		}
	}
	//return;	
}

simulated function ClientSetHeat(float NewHeat)
{
	AmpCharge = NewHeat;
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x12
	if(int(ReloadState) != int(0))
	{
		return;
	}
	SafePlayAnim(FlashlightAnim, 1.0000000, 0.0000000,, "FIRE");
	bLightsOn = !bLightsOn;
	ServerFlashLight(bLightsOn);
	// End:0xA8
	if(bLightsOn)
	{
		PlaySound(TorchOnSound,, 0.7000000,, 32.0000000);
		// End:0x86
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
		// End:0xD3
		if(FlashLightEmitter != none)
		{
			FlashLightEmitter.Destroy();
		}
		KillProjector();
	}
	//return;	
}

function ServerFlashLight(bool bNew)
{
	bLightsOn = bNew;
	SX45Attachment(ThirdPersonActor).bLightsOn = bLightsOn;
	//return;	
}

simulated function StartProjector()
{
	// End:0x20
	if(FlashLightProj == none)
	{
		FlashLightProj = Spawn(Class'BallisticProV55.MRS138TorchProjector', self,, Location);
	}
	AttachToBone(FlashLightProj, 'tip3');
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

simulated event Tick(float dt)
{
	super(BallisticWeapon).Tick(dt);
	// End:0x2C
	if(AmpCharge > float(0))
	{
		AddHeat(-DrainRate * dt);
	}
	// End:0x4B
	if(!bLightsOn || int(ClientState) != int(4))
	{
		return;
	}
	// End:0x68
	if(!Instigator.IsFirstPerson())
	{
		KillProjector();		
	}
	else
	{
		// End:0x79
		if(FlashLightProj == none)
		{
			StartProjector();
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
		TazLoc = GetBoneCoords('tip3').Origin;
		TazRot = GetBoneRotation('tip3');
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

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x184
	if((((((((((((Anim == 'FireOpen') || Anim == 'Pullout') || Anim == 'PulloutAlt') || Anim == 'Fire') || Anim == 'FireDualOpen') || Anim == 'FireDual') || Anim == CockAnim) || Anim == ReloadAnim) || Anim == 'FireOpen') || Anim == 'SightFireOpen') || Anim == DualReloadAnim) || Anim == DualReloadEmptyAnim)
	{
		// End:0x142
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
		{
			IdleAnim = 'IdleOpen';
			PutDownAnim = 'PutawayOpen';
			ReloadAnim = 'ReloadOpen';
			FlashlightAnim = 'ToggleFlashLightOpen';
			AmplifierOnAnim = 'AmpAddOpen';
			AmplifierOffAnim = 'AMPRemoveOpen';			
		}
		else
		{
			IdleAnim = 'Idle';
			PutDownAnim = 'putaway';
			ReloadAnim = 'Reload';
			FlashlightAnim = 'ToggleFlashLight';
			AmplifierOnAnim = 'AmpAdd';
			AmplifierOffAnim = 'AMPRemove';
		}
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated function PlayReload()
{
	super.PlayReload();
	// End:0x23
	if(MagAmmo < 2)
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

simulated state PendingSwitchAmplifier extends PendingDualAction
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
			ToggleAmplifier();
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
	AmplifierBone="AMP"
	AmplifierBone2="AMP2"
	AmplifierOnAnim="AmpAdd"
	AmplifierOffAnim="AMPRemove"
	AmplifierOnSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOn'
	AmplifierOffSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOff'
	AmplifierPowerOnSound=Sound'BW_Core_WeaponSound.AMP.Amp-Install'
	AmplifierPowerOffSound=Sound'BW_Core_WeaponSound.AMP.Amp-Depleted'
	SlideReleaseSound=Sound'BWBP_SKC_Sounds.SX45.SX45-SlideRelease'
	DrainRate=0.1500000
	AmpMaterials[0]=Shader'BW_Core_WeaponTex.AMP.Amp-FinalYellow'
	AmpMaterials[1]=Shader'BW_Core_WeaponTex.AMP.Amp-FinalCyan'
	AmpMaterials[2]=Shader'BW_Core_WeaponTex.AMP.Amp-GlowCyanShader'
	AmpMaterials[3]=Shader'BW_Core_WeaponTex.AMP.Amp-GlowYellowShader'
	AmpMaterials[4]=Texture'BW_Core_WeaponTex.AMP.Amp-BaseDepleted'
	AmpMaterials[5]=Texture'ONSstructureTextures.CoreGroup.Invisible'
	FlashlightAnim="ToggleFlashLight"
	TorchOnSound=Sound'BW_Core_WeaponSound.MRS38.RSS-FlashClick'
	TorchOffSound=Sound'BW_Core_WeaponSound.MRS38.RSS-FlashClick'
	SpecialInfo[0]=(Id="EvoDefs",Info="120.0;12.0;-999.0;35.0;0.0;0.0;-999.0")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.SX45WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.SX45WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.SX45WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.SX45WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.SX45.BigIcon_SX45'
	BigIconCoords=(X1=64,Y1=70,X2=418,Y2=212)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Pullout',Volume=0.1470000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway',Volume=0.1470000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Amplified: Cryogenic",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Amplified: Radiation",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.SX45.SX45-Cock',Volume=1.6000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806-ClipHit',Volume=0.6000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.SX45.SX45-MagOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.SX45.SX45-MagIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M806OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=176,G=178,B=175,A=160),Color2=(R=255,G=0,B=0,A=255),StartSize1=52,StartSize2=40)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.8000000,X2=0.5000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=6.0000000,CurrentScale=0.0000000)
	bWT_Bullet=true
	ManualLines[0]="Semi-automatic .45 ACP Fire. Moderate damage and fire rate."
	ManualLines[1]="Attach/Detach AMP. With a Choice of Radiation Bullets and Cryogenic Bullets"
	ManualLines[2]="Torch Available on the Weapon Function"
	SightOffset=(X=-15.0000000,Y=0.0000000,Z=2.3000000)
	FireModeClass[0]=Class'BWBP_SKC_Pro.SX45PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.SX45SecondaryFire'
	SelectAnimRate=1.5000000
	BringUpTime=0.7000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	bShowChargingBar=true
	Description="As the skrith wars wages onwards, new companies are sprouting left and right to aid in trying times.  The latest to enter into the foray is Storm-X, or SX LTD for short with their offerings of the SX-45K Combat Handgun, chambered in .45ACP and intends to replace the service standard M806.  Precision and power is the motto of this handgun with a Mini-RDS and a threaded barrel to mount various options, including the experimental elemental amp that makes the pistol fire cyro bullets that split or radioactive bullets that leaves clouds behind."
	Priority=17
	HudColor=(R=200,G=200,B=255,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=2
	GroupOffset=11
	PickupClass=Class'BWBP_SKC_Pro.SX45Pickup'
	PlayerViewOffset=(X=8.0000000,Y=3.0000000,Z=-6.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.SX45Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.SX45.SmallIcon_SX45'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="SX-45K Combat Handgun"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=130.0000000
	LightRadius=3.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.SX45_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Texture'BWBP_SKC_Tex.SX45.SX45-Mag'
	Skins[2]=Shader'BWBP_SKC_Tex.SX45.SX45-SightReticle_S'
	Skins[3]=Texture'BWBP_SKC_Tex.SX45.SX45-Sight'
	Skins[4]=Texture'BWBP_SKC_Tex.SX45.SX45-Main'
	Skins[5]=Texture'BWBP_SKC_Tex.SX45.SX45-Laser'
	Skins[6]=Shader'BW_Core_WeaponTex.AMP.Amp-FinalCyan'
	Skins[7]=Shader'BW_Core_WeaponTex.AMP.Amp-GlowCyanShader'
}
