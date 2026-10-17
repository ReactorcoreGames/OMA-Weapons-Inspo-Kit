class FMPMachinePistol extends BallisticWeapon
	config(BallisticProV55);

var(FMP) bool bHasAmp;
var(FMP) bool bAmped;
var(FMP) name AmplifierBone;
var(FMP) name AmplifierBone2;
var(FMP) name AmplifierOnAnim;
var(FMP) name AmplifierOffAnim;
var(FMP) Sound AmplifierOnSound;
var(FMP) Sound AmplifierOffSound;
var(FMP) Sound AmplifierPowerOnSound;
var(FMP) Sound AmplifierPowerOffSound;
var(FMP) float AmpCharge;
var(FMP) float DrainRate;
var(FMP) bool bShowCharge;
var() array<Material> AmpMaterials;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerSwitchAmplifier;

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

simulated exec function ToggleAmplifier(optional byte i)
{
	// End:0x31
	if(((int(ReloadState) != int(0)) || int(SightingState) != int(0)) || !bHasAmp)
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
		FMPAttachment(ThirdPersonActor).SetAmped(bNewValue);
	}
	// End:0x147
	if((int(CurrentWeaponMode) == 1) && AmpCharge > float(0))
	{
		FMPAttachment(ThirdPersonActor).SetAmpColour(true, false);
		Skins[3] = AmpMaterials[1];
		Skins[4] = AmpMaterials[2];		
	}
	else
	{
		// End:0x19B
		if((int(CurrentWeaponMode) == 2) && AmpCharge > float(0))
		{
			FMPAttachment(ThirdPersonActor).SetAmpColour(false, true);
			Skins[3] = AmpMaterials[0];
			Skins[4] = AmpMaterials[3];
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
		FMPAttachment(ThirdPersonActor).SetAmped(bNewValue);
	}
	// End:0x11F
	if(int(CurrentWeaponMode) == 1)
	{
		FMPAttachment(ThirdPersonActor).SetAmpColour(true, false);
		Skins[3] = AmpMaterials[1];
		Skins[4] = AmpMaterials[2];		
	}
	else
	{
		// End:0x164
		if(int(CurrentWeaponMode) == 2)
		{
			FMPAttachment(ThirdPersonActor).SetAmpColour(false, true);
			Skins[3] = AmpMaterials[0];
			Skins[4] = AmpMaterials[3];
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
		FMPPrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
	}
	//return;	
}

simulated function CommonSwitchWeaponMode(byte newmode)
{
	super.CommonSwitchWeaponMode(newmode);
	FMPPrimaryFire(FireMode[0]).SwitchWeaponMode(newmode);
	// End:0x7C
	if((int(newmode) == 1) && AmpCharge > float(0))
	{
		FMPAttachment(ThirdPersonActor).SetAmpColour(true, false);
		Skins[3] = AmpMaterials[1];
		Skins[4] = AmpMaterials[2];		
	}
	else
	{
		// End:0xD0
		if((int(newmode) == 2) && AmpCharge > float(0))
		{
			FMPAttachment(ThirdPersonActor).SetAmpColour(false, true);
			Skins[3] = AmpMaterials[0];
			Skins[4] = AmpMaterials[3];
		}
	}
	//return;	
}

simulated function Notify_SilencerOn()
{
	PlaySound(AmplifierOnSound,, 0.5000000);
	PlaySound(AmplifierPowerOnSound,, 1.6000000);
	bShowCharge = true;
	//return;	
}

simulated function Notify_SilencerOff()
{
	PlaySound(AmplifierOffSound,, 0.5000000);
	bShowCharge = false;
	//return;	
}

simulated function Notify_SilencerShow()
{
	SetBoneScale(0, 1.0000000, AmplifierBone);
	SetBoneScale(2, 0.0000000, AmplifierBone2);
	//return;	
}

simulated function Notify_SilencerHide()
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

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x7F
	if(AIController(Instigator.Controller) != none)
	{
		bAmped = FRand() > 0.5000000;
		ServerSwitchAmplifier(bAmped);
		SwitchAmplifier(bAmped);
		// End:0x7F
		if(bAmped)
		{
			AmpCharge = 100.0000000;
			DrainRate = 0.0000000;
			// End:0x7F
			if(FRand() > 0.5000000)
			{
				CommonSwitchWeaponMode(2);
			}
		}
	}
	// End:0xAE
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
		Skins[3] = AmpMaterials[4];
		Skins[4] = AmpMaterials[5];
		WeaponModes[0].bUnavailable = false;
		WeaponModes[1].bUnavailable = true;
		WeaponModes[2].bUnavailable = true;
		CurrentWeaponMode = 0;
		ServerSwitchWeaponMode(0);
		// End:0xD4
		if(int(Role) == int(ROLE_Authority))
		{
			FMPAttachment(ThirdPersonActor).SetAmped(false);
		}
	}
	//return;	
}

simulated function ClientSetHeat(float NewHeat)
{
	AmpCharge = NewHeat;
	//return;	
}

simulated event Tick(float dt)
{
	super.Tick(dt);
	// End:0x2C
	if(AmpCharge > float(0))
	{
		AddHeat(-DrainRate * dt);
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0xF2
	if((((((Anim == 'Pullout') || Anim == 'PulloutFancy') || Anim == 'Fire') || Anim == 'FireClosed') || Anim == CockAnim) || Anim == ReloadAnim)
	{
		// End:0xC6
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
		{
			IdleAnim = 'IdleClosed';
			PutDownAnim = 'PutawayClosed';
			SelectAnim = 'PulloutClosed';
			ReloadAnim = 'ReloadEmpty';			
		}
		else
		{
			IdleAnim = 'Idle';
			PutDownAnim = 'putaway';
			SelectAnim = 'Pullout';
			ReloadAnim = 'Reload';
		}
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated function float RateSelf()
{
	// End:0x19
	if(!HasAmmo())
	{
		CurrentRating = 0.0000000;		
	}
	else
	{
		// End:0x65
		if((Ammo[0].AmmoAmount < 1) && MagAmmo < 1)
		{
			CurrentRating = Instigator.Controller.RateWeapon(self) * 0.3000000;			
		}
		else
		{
			return super.RateSelf();
		}
	}
	return CurrentRating;
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

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return AIRating;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	Result = super.GetAIRating();
	// End:0xA9
	if(dist < float(500))
	{
		Result -= (float(1) - (dist / float(500)));		
	}
	else
	{
		// End:0xDB
		if(dist < float(3000))
		{
			Result += ((dist - float(1000)) / float(2000));			
		}
		else
		{
			Result = (Result + 0.6600000) - ((dist - float(3000)) / float(2500));
		}
	}
	return Result;
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.0000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.5000000;
	//return;	
}

defaultproperties
{
	AmplifierBone="Amplifier1"
	AmplifierBone2="Amplifier2"
	AmplifierOnAnim="AmplifierOn"
	AmplifierOffAnim="AmplifierOff"
	AmplifierOnSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOn'
	AmplifierOffSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOff'
	AmplifierPowerOnSound=Sound'BW_Core_WeaponSound.AMP.Amp-Install'
	AmplifierPowerOffSound=Sound'BW_Core_WeaponSound.AMP.Amp-Depleted'
	DrainRate=0.1500000
	AmpMaterials[0]=Shader'BW_Core_WeaponTex.AMP.Amp-FinalGreen'
	AmpMaterials[1]=Shader'BW_Core_WeaponTex.AMP.Amp-FinalRed'
	AmpMaterials[2]=Shader'BW_Core_WeaponTex.AMP.Amp-GlowRedShader'
	AmpMaterials[3]=Shader'BW_Core_WeaponTex.AMP.Amp-GlowGreenShader'
	AmpMaterials[4]=Texture'BW_Core_WeaponTex.AMP.Amp-BaseDepleted'
	AmpMaterials[5]=Texture'ONSstructureTextures.CoreGroup.Invisible'
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;15.0;0.9;80.0;0.7;0.7;0.4")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.FMPWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.FMPWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.FMPWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.FMPWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.MP40.BigIcon_MP40'
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.MP40.MP40-Pullout',Volume=0.2150000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BWBP_SKC_Sounds.MP40.MP40-Putaway',Volume=0.2170000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Automatic",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Amplified: Incendiary",bUnavailable=true,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Amplified: Corrosive",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightZoomFactor=1.2000000
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.MP40.MP40-Cock',Volume=1.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_SKC_Sounds.MP40.MP40-Cock',Volume=1.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BWBP_SKC_Sounds.MP40.MP40-MagHit',Volume=1.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.MP40.MP40-MagOut',Volume=1.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.MP40.MP40-MagIn',Volume=1.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M50Out',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50In',USize1=128,VSize1=128,USize2=128,VSize2=128,Color1=(R=255,G=0,B=0,A=158),Color2=(R=255,G=255,B=0,A=255),StartSize1=75,StartSize2=72)
	bWT_Bullet=true
	SightingTime=0.2000000
	SightOffset=(X=-3.5000000,Y=0.0100000,Z=1.6500000)
	CockingBringUpTime=1.3000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.FMPPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.FMPSecondaryFire'
	PutDownTime=0.7000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	bShowChargingBar=true
	Description="CWI is a relatively niche company nowadays, fine tuning weapons from wars of old only to be either preserved in museums across the galaxy or to be bought out by the highest bidders.  One such weapon is the FMP-2012, a retooled sub-machine gun from the second world war that doesn't fire very fast, but can hit pretty hard thanks to its rechambering to shoot over-pressured 9mm rounds.  It's fortunate for CWI to have the FMP be a prime candidate for NDTR's elemental amp technology, able to fire corrosive rounds or explosive rounds, breathing new life into the aging sub-machine gun.  While still inferior to it's modernized counterparts, the FMP-2012 does have its role in opening weak points to the Cryon's armor."
	Priority=41
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=3
	PickupClass=Class'BWBP_SKC_Pro.FMPPickup'
	PlayerViewOffset=(X=4.0000000,Y=3.0000000,Z=-4.5000000)
	AttachmentClass=Class'BWBP_SKC_Pro.FMPAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.MP40.SmallIcon_MP40'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="FMP-2012 Machine Pistol"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.MP40_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BWBP_SKC_Tex.MP40.MP40-MainShine'
	Skins[2]=Shader'BWBP_SKC_Tex.MP40.MP40-MagShine'
	Skins[3]=Shader'BW_Core_WeaponTex.AMP.Amp-FinalRed'
	Skins[4]=Shader'BW_Core_WeaponTex.AMP.Amp-GlowRedShader'
}
