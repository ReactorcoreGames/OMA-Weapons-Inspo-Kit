class LonghornLauncher extends BallisticWeapon
	config(BallisticProV55);

var bool bGunCocked;
var bool bQuickFire;
var bool bWasQuick;
var float LonghornHeldTime;
var float LonghornTimer;
var() name Shells[4];

simulated function AltFire(float F)
{
	FirePressed(F);
	//return;	
}

simulated function OnScopeViewChanged()
{
	super.OnScopeViewChanged();
	// End:0x1C
	if(!bScopeView)
	{
		CockAnim = 'Cock1';
	}
	//return;	
}

simulated function CommonStartReload(optional byte i)
{
	local int M;

	// End:0x18
	if(int(ClientState) == int(2))
	{
		ClientState = 4;
	}
	ReloadState = 4;
	PlayReload();
	// End:0x4E
	if(bScopeView && Instigator.IsLocallyControlled())
	{
		TemporaryScopeDown(default.SightingTime);
	}
	M = 0;
	J0x55:

	// End:0x96 [Loop If]
	if(M < 2)
	{
		// End:0x8C
		if(bFireMode[M] != none)
		{
			bFireMode[M].ReloadingGun(i);
		}
		M++;
		// [Loop Continue]
		goto J0x55;
	}
	// End:0xA7
	if(bCockAfterReload)
	{
		bNeedCock = true;
	}
	// End:0xC5
	if(bCockOnEmpty && MagAmmo < 1)
	{
		bNeedCock = true;
	}
	bNeedReload = false;
	//return;	
}

simulated function PlayReload()
{
	// End:0x1B
	if(int(SightingState) != int(0))
	{
		TemporaryScopeDown(0.5000000);
	}
	// End:0x63
	if((MagAmmo < 1) && Ammo[0].AmmoAmount >= default.MagAmmo)
	{
		ShovelIncrement = default.MagAmmo;
		ReloadAnim = 'ReloadFull';
		bCanSkipReload = false;		
	}
	else
	{
		ShovelIncrement = 1;
		ReloadAnim = 'ReloadSingle';
		bCanSkipReload = true;
	}
	SafePlayAnim(StartShovelAnim, ReloadAnimRate,, 0, "RELOAD");
	//return;	
}

simulated function PlayCocking(optional byte Type)
{
	local float AdjustedCockAnimRate;

	// End:0x40
	if((int(ReloadState) != int(0)) && int(ReloadState) != int(8))
	{
		AdjustedCockAnimRate = CockAnimRate * Class'BCoreProV55.BallisticReplicationInfo'.default.ReloadScale;		
	}
	else
	{
		AdjustedCockAnimRate = CockAnimRate;
	}
	// End:0x87
	if((int(Type) == 2) && HasAnim(CockAnimPostReload))
	{
		SafePlayAnim(CockAnimPostReload, AdjustedCockAnimRate, 0.2000000,, "RELOAD");		
	}
	else
	{
		SafePlayAnim(CockAnim, AdjustedCockAnimRate, 0.2000000,, "RELOAD");
	}
	// End:0xD2
	if((int(SightingState) != int(0)) && int(SightingState) != int(3))
	{
		TemporaryScopeDown(0.5000000);
	}
	//return;	
}

simulated function bool CheckScope()
{
	// End:0x1A
	if(Level.TimeSeconds < NextCheckScopeTime)
	{
		return true;
	}
	NextCheckScopeTime = Level.TimeSeconds + 0.2500000;
	// End:0xBC
	if((((int(ReloadState) != int(0)) && int(ReloadState) != int(8)) || (int(Instigator.Controller.bRun) == 0) && int(Instigator.Physics) == int(1)) || (SprintControl != none) && SprintControl.bSprinting)
	{
		StopScopeView();
		return false;
	}
	return true;
	//return;	
}

simulated function LonghornFired()
{
	local float R;

	bGunCocked = false;
	R = FRand();
	// End:0x4B
	if(int(SightingState) != int(0))
	{
		// End:0x3D
		if(R < 0.5000000)
		{
			CockAnim = 'SlowCocking1';			
		}
		else
		{
			CockAnim = 'SlowCocking2';
		}		
	}
	else
	{
		// End:0x68
		if(R < 0.5000000)
		{
			CockAnim = 'Cock1';			
		}
		else
		{
			CockAnim = 'Cock2';
		}
	}
	SetBoneRotation('Hammer', rot(0, 0, 0));
	//return;	
}

simulated function Notify_CockStart()
{
	// End:0x12
	if(int(ReloadState) == int(0))
	{
		return;
	}
	// End:0x73
	if(int(ReloadState) == int(7))
	{
		PlayOwnedSound(ClipHitSound.Sound, ClipHitSound.Slot, ClipHitSound.Volume, ClipHitSound.bNoOverride, ClipHitSound.Radius, ClipHitSound.Pitch, ClipHitSound.bAtten);		
	}
	else
	{
		PlayOwnedSound(CockSound.Sound, CockSound.Slot, CockSound.Volume, CockSound.bNoOverride, CockSound.Radius, CockSound.Pitch, CockSound.bAtten);
	}
	bGunCocked = true;
	bNeedCock = false;
	//return;	
}

simulated function bool PutDown()
{
	// End:0x3D
	if(super.PutDown())
	{
		// End:0x3B
		if(Instigator.IsLocallyControlled())
		{
			bGunCocked = false;
			SetBoneRotation('Hammer', rot(0, 0, 0));
		}
		return true;
	}
	return false;
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x6D
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		SetBoneScale(0, 0.0000000, Shells[0]);
		SetBoneScale(1, 0.0000000, Shells[1]);
		SetBoneScale(2, 0.0000000, Shells[2]);
		SetBoneScale(3, 0.0000000, Shells[3]);
	}
	super.BringUp(PrevWeapon);
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x64
	if((bGunCocked && Anim == CockAnim) || Anim == EndShovelAnim)
	{
		SetBoneRotation('Hammer', rot(0, 7282, 0));
		IdleTweenTime = 0.0000000;
	}
	super.AnimEnd(Channel);
	IdleTweenTime = default.IdleTweenTime;
	//return;	
}

simulated function AnimEnded(int Channel, name Anim, float frame, float Rate)
{
	// End:0x88
	if(Channel == 1)
	{
		// End:0x86
		if((Anim == bFireMode[0].AimedFireAnim) || Anim == bFireMode[1].AimedFireAnim)
		{
			AnimBlendParams(1, 0.0000000);
			// End:0x7E
			if((float(SightingState) > FireAnimCutThreshold) && SafePlayAnim(IdleAnim, 1.0000000))
			{
				FreezeAnimAt(0.0000000);
			}
			bPreventReload = false;
		}
		return;
	}
	// End:0xAA
	if(Anim == ZoomInAnim)
	{
		SightingState = 3;
		ScopeUpAnimEnd();
		return;		
	}
	else
	{
		// End:0xC9
		if(Anim == ZoomOutAnim)
		{
			SightingState = 0;
			ScopeDownAnimEnd();
			return;
		}
	}
	// End:0x116
	if((Anim == FireMode[0].FireAnim) || (FireMode[1] != none) && Anim == FireMode[1].FireAnim)
	{
		bPreventReload = false;
	}
	// End:0x1A3
	if(((int(ReloadState) == int(0)) && Anim == bFireMode[0].AimedFireAnim) || Anim == bFireMode[1].AimedFireAnim)
	{
		AnimBlendParams(1, 0.0000000);
		// End:0x19B
		if((float(SightingState) > FireAnimCutThreshold) && SafePlayAnim(IdleAnim, 1.0000000))
		{
			FreezeAnimAt(0.0000000);
		}
		bPreventReload = false;
	}
	// End:0x2EE
	if((int(ClientState) == int(4)) && int(ReloadState) == int(0))
	{
		// End:0x225
		if((Anim == FireMode[0].FireAnim) && HasAnim(FireMode[0].FireEndAnim))
		{
			SafePlayAnim(FireMode[0].FireEndAnim, FireMode[0].FireEndAnimRate, 0.0000000);			
		}
		else
		{
			// End:0x294
			if(((FireMode[1] != none) && Anim == FireMode[1].FireAnim) && HasAnim(FireMode[1].FireEndAnim))
			{
				SafePlayAnim(FireMode[1].FireEndAnim, FireMode[1].FireEndAnimRate, 0.0000000);				
			}
			else
			{
				// End:0x2EE
				if(((FireMode[0] == none) || !FireMode[0].bIsFiring) && (FireMode[1] == none) || !FireMode[1].bIsFiring)
				{
					bPreventReload = false;
					PlayIdle();
				}
			}
		}
	}
	// End:0x30E
	if(int(ReloadState) == int(4))
	{
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x365
	if(int(ReloadState) == int(6))
	{
		// End:0x355
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
	// End:0x3D8
	if((int(ReloadState) == int(3)) || int(ReloadState) == int(7))
	{
		// End:0x3A6
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
	// End:0x418
	if(int(ReloadState) == int(8))
	{
		bNeedCock = false;
		ReloadState = 0;
		ReloadFinished();
		PlayIdle();
		AimComponent.Reaim(0.0500000);
	}
	//return;	
}

simulated function Notify_GrenVisible()
{
	SetBoneScale(0, 1.0000000, Shells[0]);
	SetBoneScale(1, 1.0000000, Shells[1]);
	SetBoneScale(2, 1.0000000, Shells[2]);
	SetBoneScale(3, 1.0000000, Shells[3]);
	//return;	
}

simulated function Notify_GrenVisiblePart()
{
	SetBoneScale(3, 1.0000000, Shells[3]);
	//return;	
}

simulated function Notify_GrenHide()
{
	// End:0x5B
	if(MagAmmo <= 1)
	{
		SetBoneScale(0, 0.0000000, Shells[0]);
		SetBoneScale(1, 0.0000000, Shells[1]);
		SetBoneScale(2, 0.0000000, Shells[2]);
		SetBoneScale(3, 0.0000000, Shells[3]);
	}
	//return;	
}

simulated function UpdateBones()
{
	local int i;

	i = 3;
	J0x08:

	// End:0x3C [Loop If]
	if(i >= MagAmmo)
	{
		SetBoneScale(i, 0.0000000, Shells[i]);
		i--;
		// [Loop Continue]
		goto J0x08;
	}
	i = 0;
	J0x43:

	// End:0x85 [Loop If]
	if((i < MagAmmo) && i < 4)
	{
		SetBoneScale(i, 1.0000000, Shells[i]);
		i++;
		// [Loop Continue]
		goto J0x43;
	}
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float dist;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0x80
	if(dist < float(2048))
	{
		return 1;
	}
	// End:0xA2
	if((dist < float(3072)) && FRand() > 0.5000000)
	{
		return 1;
	}
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.6000000, dist, 1536.0000000, 2048.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.4000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.4000000;
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x2A
	if(int(CurrentWeaponMode) == 0)
	{
		return LonghornPrimaryFire(FireMode[0]).HoldTime / 0.4000000;
	}
	return LonghornPrimaryFire(FireMode[0]).HoldTime / 0.8000000;
	//return;	
}

defaultproperties
{
	Shells[0]="GrenadeA"
	Shells[1]="GrenadeB"
	Shells[2]="GrenadeC"
	Shells[3]="GrenadeD"
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;25.0;0.6;50.0;1.0;0.5;-999.0")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.LonghornWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.LonghornWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.LonghornWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.LonghornWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.Longhorn.BigIcon_LHorn'
	BigIconCoords=(X1=0,Y1=30,X2=511,Y2=212)
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.Bulldog.Bulldog-PullOut',Volume=0.2180000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BWBP_SKC_Sounds.Bulldog.Bulldog-PutAway',Volume=0.2160000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Single Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightZoomFactor=1.2000000
	FullZoomFOV=70.0000000
	bNoCrosshairInScope=true
	CockAnim="Cock1"
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.Longhorn.Longhorn-CockAlt',Volume=0.9500000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ReloadAnim="ReloadSingle"
	ClipHitSound=(Sound=Sound'BWBP_SKC_Sounds.Longhorn.Longhorn-CockShut',Volume=1.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.Longhorn.Longhorn-CockOpen',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=SoundGroup'BW_Core_WeaponSound.Marlin.Mar-ShellIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	bCanSkipReload=true
	bShovelLoad=true
	StartShovelAnim="ReloadStart"
	EndShovelAnim="ReloadEnd"
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Grenade=true
	bWT_Spam=true
	ManualLines[0]="Fires a grenade which inflicts massive damage on direct impact.||If the Fire key is held down, the grenade will enter manual detonation mode. Fire can then be released to cause the grenade to explode with moderate damage and split into clusters. These clusters inflict moderate damage.||If detonated high above the ground, the clusters will project downwards instead of randomly, and will inflict heavier damage with a wider radius."
	ManualLines[1]="Fires the grenade as its component clusters. Essentially an explosive projectile shotgun attack."
	ManualLines[2]="Effective at close and medium range and as a bombardment and indirect fire weapon."
	SightPivot=(Pitch=150,Yaw=0,Roll=0)
	SightOffset=(X=-3.0000000,Y=0.0000000,Z=2.3000000)
	FireModeClass[0]=Class'BWBP_SKC_Pro.LonghornPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.LonghornSecondaryFire'
	SelectAnimRate=1.1000000
	PutDownAnimRate=1.5000000
	PutDownTime=0.5000000
	BringUpTime=0.4500000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7500000
	CurrentRating=0.7500000
	bShowChargingBar=true
	Description="Longhorn Lever-Action Repeater|Manufacturer: Redwood Firearms|Primary: Cluster Round|Secondary: Split Cluster Round|| The Longhorn is a large caliber lever-action rifle capable of firing everything from solid slugs to fragmentation grenades. This heavy duty hunting rifle first entered combat with the UTC Silver Ranger Division based in New Arizona. Outnumbered and outgunned, they had lost the battle of Phoenix Dam to the rebelling separatist groups. As the hostiles marched towards the colony's atmospheric stabilizer, they were continually dogged by the Rangers who had armed themselves with Longhorns filled with explosives and shrapnel. The lever-action launcher was easy to use and reliable and the rangers inflicted heavy casualties on the separatists before the stabilizer was lost and the colony compromised. Today, it is still in use with the Silver Rangers and is often loaded with powerful X2 SMRT Tandem-Cluster Grenades."
	HudColor=(R=225,G=200,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=8
	PickupClass=Class'BWBP_SKC_Pro.LonghornPickup'
	PlayerViewOffset=(X=5.0000000,Y=4.0000000,Z=-5.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.LonghornAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.Longhorn.SmallIcon_LHorn'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="Longhorn Repeater"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.Longhorn_FPm'
	DrawScale=0.3000000
}
