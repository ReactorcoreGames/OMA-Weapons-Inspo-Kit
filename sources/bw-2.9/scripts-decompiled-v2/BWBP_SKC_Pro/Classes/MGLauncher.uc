class MGLauncher extends BallisticWeapon
	config(BallisticProV55);

var() Material MatDef;
var() Material MatArmed;
var() Rotator DrumRot;
var bool bRemoteGrenadeOut;

replication
{
	// Pos:0x000
	unreliable if(int(Role) == int(ROLE_Authority))
		ClientUpdateGrenadeStatus;
}

function ServerSwitchWeaponMode(byte newmode)
{
	// End:0x25
	if((int(CurrentWeaponMode) > 0) && FireMode[0].IsFiring())
	{
		return;
	}
	super.ServerSwitchWeaponMode(newmode);
	//return;	
}

simulated function AnimEnded(int Channel, name Anim, float frame, float Rate)
{
	// End:0x72
	if((Anim == FireMode[0].FireAnim) || (FireMode[1] != none) && Anim == FireMode[1].FireAnim)
	{
		bPreventReload = false;
		DrumRot.Roll -= (65535 / 6);
		SetBoneRotation('drum', DrumRot);
	}
	// End:0x112
	if((Anim == bFireMode[0].AimedFireAnim) || Anim == bFireMode[1].AimedFireAnim)
	{
		AnimBlendParams(1, 0.0000000);
		// End:0xE5
		if((float(SightingState) > FireAnimCutThreshold) && SafePlayAnim(IdleAnim, 1.0000000))
		{
			FreezeAnimAt(0.0000000);
		}
		bPreventReload = false;
		DrumRot.Roll -= (65535 / 6);
		SetBoneRotation('drum', DrumRot);
	}
	// End:0x254
	if(((int(ClientState) == int(4)) || (int(ClientState) == int(0)) && Instigator.Weapon == self) && int(ReloadState) == int(0))
	{
		// End:0x1BC
		if((Anim == FireMode[0].FireAnim) && HasAnim(FireMode[0].FireEndAnim))
		{
			SafePlayAnim(FireMode[0].FireEndAnim, FireMode[0].FireEndAnimRate, 0.0000000);			
		}
		else
		{
			// End:0x22B
			if(((FireMode[1] != none) && Anim == FireMode[1].FireAnim) && HasAnim(FireMode[1].FireEndAnim))
			{
				SafePlayAnim(FireMode[1].FireEndAnim, FireMode[1].FireEndAnimRate, 0.0000000);				
			}
			else
			{
				// End:0x243
				if(int(MeleeState) < int(2))
				{
					bPreventReload = false;
				}
			}
		}
		// End:0x254
		if(Channel == 0)
		{
			PlayIdle();
		}
	}
	// End:0x274
	if(int(ReloadState) == int(4))
	{
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x2CB
	if(int(ReloadState) == int(6))
	{
		// End:0x2BB
		if((MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
		{
			PlayShovelEnd();
			ReloadState = 7;
			return;
		}
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x33E
	if((int(ReloadState) == int(3)) || int(ReloadState) == int(7))
	{
		// End:0x30C
		if(bNeedCock && MagAmmo > 0)
		{
			CommonCockGun();			
		}
		else
		{
			bNeedCock = false;
			ReloadState = 0;
			ReloadFinished();
			PlayIdle();
			AimComponent.Reaim(0.0500000);
		}
		return;
	}
	// End:0x37E
	if(int(ReloadState) == int(8))
	{
		bNeedCock = false;
		ReloadState = 0;
		ReloadFinished();
		PlayIdle();
		AimComponent.Reaim(0.0500000);
	}
	// End:0x396
	if(int(ReloadState) == int(9))
	{
		ReloadState = 0;
	}
	//return;	
}

function UpdateGrenadeStatus(bool bDetonatable)
{
	bRemoteGrenadeOut = bDetonatable;
	// End:0x27
	if(bDetonatable)
	{
		Skins[2] = MatArmed;		
	}
	else
	{
		Skins[2] = MatDef;
	}
	// End:0x67
	if((int(Role) == int(ROLE_Authority)) && !Instigator.IsLocallyControlled())
	{
		ClientUpdateGrenadeStatus(bDetonatable);
	}
	//return;	
}

simulated function ClientUpdateGrenadeStatus(bool bDet)
{
	bRemoteGrenadeOut = bDet;
	// End:0x27
	if(bDet)
	{
		Skins[2] = MatArmed;		
	}
	else
	{
		Skins[2] = MatDef;
	}
	//return;	
}

simulated function bool HasAmmo()
{
	// End:0x0B
	if(bRemoteGrenadeOut)
	{
		return true;
	}
	return super.HasAmmo();
	//return;	
}

simulated function float RateSelf()
{
	// End:0x54
	if(((PlayerController(Instigator.Controller) != none) && Ammo[0].AmmoAmount <= 0) && MagAmmo <= 0)
	{
		CurrentRating = super.RateSelf() * 0.2000000;		
	}
	else
	{
		return super.RateSelf();
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
	return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.5000000, dist, 1024.0000000, 3072.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.2000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.2000000;
	//return;	
}

simulated function Notify_BrassOut()
{
	//return;	
}

defaultproperties
{
	MatDef=Texture'BWBP_SKC_Tex.MGL.MGL-ScreenBase'
	MatArmed=Texture'BWBP_SKC_Tex.MGL.MGL-Screen'
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;35.0;0.5;60.0;0.0;1.0;1.0")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.MGLWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.MGLWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.MGLWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.MGLWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	TeamSkins[1]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.MGL.BigIcon_MGL'
	IdleTweenTime=0.0000000
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Putaway',Volume=0.2600000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Timed",bUnavailable=true,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Impact",bUnavailable=false,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="4-Round Burst",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=1
	bNoCrosshairInScope=true
	SightBobScale=1.0000000
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.M781.M781-Pump',Volume=2.3000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bNonCocking=true
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.BX5.BX5-SecOff',Volume=1.3000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.BX5.BX5-SecOn',Volume=1.3000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.3250000
	StartShovelAnim="ReloadStart"
	EndShovelAnim="ReloadEnd"
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.G5InA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.NRP57InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=255,B=255,A=127),Color2=(R=255,G=255,B=0,A=192),StartSize1=113,StartSize2=244)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=0.7500000,Y1=1.0000000,X2=0.7500000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Projectile=true
	bWT_Super=true
	ManualLines[0]="Launches a grenade. Fire rate, damage and explosive radius are good. These grenades have an arming delay and if striking a surface when unarmed will ricochet. Direct impacts will always result in explosion."
	ManualLines[1]="Employs a manually controlled grenade. Pressing altfire again detonates the grenade."
	ManualLines[2]="Effective with height advantage and at medium range."
	SightPivot=(Pitch=512,Yaw=0,Roll=0)
	SightOffset=(X=-1.0000000,Y=0.0000000,Z=18.1000000)
	GunLength=48.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.MGLPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.MGLSecondaryFire'
	SelectAnimRate=1.5000000
	PutDownAnimRate=2.0000000
	PutDownTime=0.6600000
	BringUpTime=0.6600000
	AIRating=0.9000000
	CurrentRating=0.9000000
	Description="The big, bad Conqueror' is an alias to the VDML-6 Multiple Grenade Launcher, designed as a heavier, tactical version of the old world M32, and a more direct way of punting grenades down range, unlike the PUMA's Airburst grenades or the Longhorn's smart cluster. Black and Wood designed this weapon to bring down explosives over the Skrith's plasma barriers with haste, the user can fire timed grenades to flush out any hiders, or impact to wreck enemies without bouncing off of them (note, when fired at a short range, the impact fuse will not engage). But when tactics are needed, the 'Conqueror' can also fire remote detonated grenades for traps. So far, the Conqueror has already conquered 2 services and will be seeing more as they come."
	Priority=245
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=8
	PickupClass=Class'BWBP_SKC_Pro.MGLPickup'
	PlayerViewOffset=(X=16.0000000,Y=10.0000000,Z=-12.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.MGLAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.MGL.SmallIcon_MGL'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=35)
	ItemName="Conqueror MGL"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.MGL_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Texture'BWBP_SKC_Tex.MGL.MGL-Main'
	Skins[2]=Texture'BWBP_SKC_Tex.MGL.MGL-ScreenBase'
	Skins[3]=Shader'BWBP_SKC_Tex.MGL.MGL-HolosightGlowBasic'
}
