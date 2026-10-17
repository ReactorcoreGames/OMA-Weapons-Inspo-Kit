class MRocketLauncher extends BallisticWeapon
	config(BallisticProV55);

struct RocketState
{
	var name RocketName;
	var bool bHidden;
};

var byte LoadedFrontBarrels;
var byte LoadedBackBarrels;
var float NextLoadTime;
var float RocketActiveReloadRate;
var int BarrelIndex;
var bool bSmallReload;
var() Sound ClipOutSoundSmall;
var() Sound ClipInSoundSmall;
var name RocketCycleAnim;
var bool bPlayingFrontCycle;
var bool bPlayingBackCycle;
var array<RocketState> FrontRockets;
var array<RocketState> BackRockets;
var int BigMagAmmo;
var MRLPrimaryFire PrimaryFire;
var MRLSecondaryFire SecdaryFire;
var byte NetBarrels;
var byte NetBarrelIndex;

replication
{
	// Pos:0x000
	reliable if((bNetOwner && bNetDirty) && int(Role) == int(ROLE_Authority))
		BigMagAmmo, NetBarrelIndex, 
		NetBarrels;
}

simulated function PostNetReceive()
{
	super(Weapon).PostNetReceive();
	// End:0x72
	if((int(Level.NetMode) == int(NM_Client)) && int(NetBarrels) > 127)
	{
		LoadedBackBarrels = byte(int(NetBarrels) & 7);
		LoadedFrontBarrels = byte(int(byte(int(NetBarrels) >> 3)) & 15);
		BarrelIndex = int(NetBarrelIndex);
		NetBarrels = 0;
	}
	//return;	
}

simulated event PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x3B
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
	{
		RocketActiveReloadRate = 0.0833000;
		MRLSecondaryFire(FireMode[1]).RocketMultiplier = 60;
	}
	//return;	
}

function UpdateNetBarrels()
{
	NetBarrels = byte((int(byte(int(LoadedBackBarrels) & 7)) | ((int(LoadedFrontBarrels) & 15) << 3)) | 128);
	NetBarrelIndex = byte(BarrelIndex);
	//return;	
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	PrimaryFire = MRLPrimaryFire(FireMode[0]);
	SecdaryFire = MRLSecondaryFire(FireMode[1]);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	AnimBlendParams(1, 1.0000000, 0.0000000, 0.0000000, 'Feed');
	AnimBlendParams(2, 1.0000000, 0.0000000, 0.0000000, 'Feed2');
	//return;	
}

simulated function HideRocket(bool bFront, byte Index)
{
	// End:0x61
	if(bFront)
	{
		// End:0x5E
		if(!FrontRockets[int(Index)].bHidden)
		{
			SetBoneScale(int(Index) + 3, 0.0000000, FrontRockets[int(Index)].RocketName);
			FrontRockets[int(Index)].bHidden = true;
		}		
	}
	else
	{
		// End:0xB2
		if(!BackRockets[int(Index)].bHidden)
		{
			SetBoneScale(int(Index), 0.0000000, BackRockets[int(Index)].RocketName);
			BackRockets[int(Index)].bHidden = true;
		}
	}
	//return;	
}

simulated function ShowRocket(bool bFront, byte Index)
{
	// End:0x5F
	if(bFront)
	{
		// End:0x5C
		if(FrontRockets[int(Index)].bHidden)
		{
			SetBoneScale(int(Index) + 3, 1.0000000, FrontRockets[int(Index)].RocketName);
			FrontRockets[int(Index)].bHidden = false;
		}		
	}
	else
	{
		// End:0xAE
		if(BackRockets[int(Index)].bHidden)
		{
			SetBoneScale(int(Index), 1.0000000, BackRockets[int(Index)].RocketName);
			BackRockets[int(Index)].bHidden = false;
		}
	}
	//return;	
}

simulated function AnimEnded(int Channel, name Anim, float frame, float Rate)
{
	local int i;

	// End:0x107
	if(Anim == RocketCycleAnim)
	{
		// End:0x8A
		if(Channel == 1)
		{
			i = 8;
			J0x22:

			// End:0x6D [Loop If]
			if(i > 0)
			{
				// End:0x55
				if(FrontRockets[i - 1].bHidden)
				{
					HideRocket(true, byte(i));
					// [Explicit Continue]
					goto J0x63;
				}
				ShowRocket(true, byte(i));
				J0x63:

				i--;
				// [Loop Continue]
				goto J0x22;
			}
			bPlayingFrontCycle = false;
			SafePlayAnim(IdleAnim, 1.0000000,, 1);			
		}
		else
		{
			// End:0x104
			if(Channel == 2)
			{
				i = 2;
				J0x9E:

				// End:0xE9 [Loop If]
				if(i > 0)
				{
					// End:0xD1
					if(BackRockets[i - 1].bHidden)
					{
						HideRocket(false, byte(i));
						// [Explicit Continue]
						goto J0xDF;
					}
					ShowRocket(false, byte(i));
					J0xDF:

					i--;
					// [Loop Continue]
					goto J0x9E;
				}
				bPlayingBackCycle = false;
				SafePlayAnim(IdleAnim, 1.0000000,, 2);
			}
		}		
	}
	else
	{
		// End:0x129
		if(Anim == ZoomInAnim)
		{
			SightingState = 3;
			ScopeUpAnimEnd();
			return;			
		}
		else
		{
			// End:0x148
			if(Anim == ZoomOutAnim)
			{
				SightingState = 0;
				ScopeDownAnimEnd();
				return;
			}
		}
	}
	// End:0x195
	if((Anim == FireMode[0].FireAnim) || (FireMode[1] != none) && Anim == FireMode[1].FireAnim)
	{
		bPreventReload = false;
	}
	// End:0x343
	if(((((((Channel == 0) || Anim == ReloadAnim) || Anim == 'Reload1b') || Anim == 'Reload2') || Anim == 'Reload2b') && int(ClientState) == int(4)) && int(ReloadState) == int(0))
	{
		// End:0x268
		if((Anim == FireMode[0].FireAnim) && HasAnim(FireMode[0].FireEndAnim))
		{
			SafePlayAnim(FireMode[0].FireEndAnim, FireMode[0].FireEndAnimRate, 0.0000000);			
		}
		else
		{
			// End:0x2D7
			if(((FireMode[1] != none) && Anim == FireMode[1].FireAnim) && HasAnim(FireMode[1].FireEndAnim))
			{
				SafePlayAnim(FireMode[1].FireEndAnim, FireMode[1].FireEndAnimRate, 0.0000000);				
			}
			else
			{
				// End:0x343
				if((((FireMode[0] == none) || !FireMode[0].bIsFiring) && (FireMode[1] == none) || !FireMode[1].bIsFiring) && int(MeleeState) < int(2))
				{
					bPreventReload = false;
					PlayIdle();
				}
			}
		}
	}
	// End:0x397
	if((int(ReloadState) == int(3)) || int(ReloadState) == int(7))
	{
		bNeedCock = false;
		ReloadState = 0;
		ReloadFinished();
		PlayIdle();
		AimComponent.Reaim(0.0500000);
		return;
	}
	//return;	
}

simulated function PlayReload()
{
	// End:0x4F
	if(MagAmmo < default.MagAmmo)
	{
		SafePlayAnim(ReloadAnim, ReloadAnimRate,, 0, "RELOAD");
		SafePlayAnim('Reload1b', ReloadAnimRate,, 2, "RELOAD");
		bSmallReload = true;		
	}
	else
	{
		SafePlayAnim('Reload2', ReloadAnimRate,, 0, "RELOAD");
		SafePlayAnim('Reload2b', ReloadAnimRate,, 1, "RELOAD");
	}
	//return;	
}

function ServerStartReload(optional byte i)
{
	local int M;

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
	// End:0x3F
	if((MagAmmo >= default.MagAmmo) && BigMagAmmo >= default.BigMagAmmo)
	{
		return;
	}
	// End:0x57
	if(Ammo[0].AmmoAmount < 1)
	{
		return;
	}
	M = 0;
	J0x5E:

	// End:0xAA [Loop If]
	if(M < 2)
	{
		// End:0xA0
		if((FireMode[M] != none) && FireMode[M].bIsFiring)
		{
			StopFire(M);
		}
		M++;
		// [Loop Continue]
		goto J0x5E;
	}
	bServerReloading = true;
	CommonStartReload(i);
	ClientStartReload(i);
	//return;	
}

simulated function bool MayNeedReload(byte Mode, float load)
{
	// End:0x1F
	if((float(MagAmmo + BigMagAmmo) - load) < float(1))
	{
		return true;
	}
	return bNeedReload;
	//return;	
}

simulated function Notify_ClipOut()
{
	// End:0x12
	if(int(ReloadState) == int(0))
	{
		return;
	}
	ReloadState = 2;
	// End:0x6F
	if(bSmallReload)
	{
		PlayOwnedSound(ClipOutSoundSmall, ClipOutSound.Slot, ClipOutSound.Volume, ClipOutSound.bNoOverride, ClipOutSound.Radius, ClipOutSound.Pitch, ClipOutSound.bAtten);		
	}
	else
	{
		PlayOwnedSound(ClipOutSound.Sound, ClipOutSound.Slot, ClipOutSound.Volume, ClipOutSound.bNoOverride, ClipOutSound.Radius, ClipOutSound.Pitch, ClipOutSound.bAtten);
	}
	//return;	
}

simulated function Notify_ClipIn()
{
	local int AmmoNeeded;

	// End:0x1A
	if(int(ReloadState) == int(0))
	{
		bSmallReload = false;
		return;
	}
	ReloadState = 3;
	// End:0x77
	if(bSmallReload)
	{
		PlayOwnedSound(ClipInSoundSmall, ClipInSound.Slot, ClipInSound.Volume, ClipInSound.bNoOverride, ClipInSound.Radius, ClipInSound.Pitch, ClipInSound.bAtten);		
	}
	else
	{
		PlayOwnedSound(ClipInSound.Sound, ClipInSound.Slot, ClipInSound.Volume, ClipInSound.bNoOverride, ClipInSound.Radius, ClipInSound.Pitch, ClipInSound.bAtten);
	}
	// End:0x179
	if(int(Level.NetMode) != int(NM_Client))
	{
		// End:0xFC
		if(bSmallReload)
		{
			AmmoNeeded = default.MagAmmo - MagAmmo;			
		}
		else
		{
			AmmoNeeded = default.BigMagAmmo - BigMagAmmo;
		}
		// End:0x13E
		if(AmmoNeeded > Ammo[0].AmmoAmount)
		{
			AmmoNeeded = Ammo[0].AmmoAmount;
		}
		// End:0x156
		if(bSmallReload)
		{
			MagAmmo += AmmoNeeded;			
		}
		else
		{
			BigMagAmmo += AmmoNeeded;
		}
		Ammo[0].UseAmmo(AmmoNeeded, true);
	}
	bSmallReload = false;
	//return;	
}

simulated function Notify_ClipOutOfSight()
{
	//return;	
}

simulated event WeaponTick(float dt)
{
	local bool bPlay;
	local int VisibleRockets;

	super.WeaponTick(dt);
	// End:0x2C1
	if((NextLoadTime <= Level.TimeSeconds) && int(ReloadState) == int(0))
	{
		// End:0x14F
		if((int(LoadedFrontBarrels) < 12) && ((BigMagAmmo - PrimaryFire.ConsumedLoadTwo) - SecdaryFire.ConsumedLoadTwo) > int(LoadedFrontBarrels))
		{
			// End:0x90
			if(!FrontRockets[8].bHidden)
			{
				LoadedFrontBarrels++;
			}
			// End:0xAF
			if(bPlayingFrontCycle)
			{
				AnimEnded(1, RocketCycleAnim, 1.0000000, 1.0000000);
			}
			VisibleRockets = ((BigMagAmmo - PrimaryFire.ConsumedLoadTwo) - SecdaryFire.ConsumedLoadTwo) - int(LoadedFrontBarrels);
			// End:0xFB
			if(VisibleRockets > 7)
			{
				ShowRocket(true, 0);				
			}
			else
			{
				HideRocket(true, 0);
			}
			// End:0x12D
			if(FireMode[1].IsFiring())
			{
				SafePlayAnim(RocketCycleAnim, 6.5000000,, 1);				
			}
			else
			{
				SafePlayAnim(RocketCycleAnim, 0.9000000,, 1);
			}
			bPlay = true;
			bPlayingFrontCycle = true;
		}
		// End:0x26B
		if((int(LoadedBackBarrels) < 6) && ((MagAmmo - PrimaryFire.ConsumedLoad) - SecdaryFire.ConsumedLoad) > int(LoadedBackBarrels))
		{
			// End:0x1AA
			if(!BackRockets[2].bHidden)
			{
				LoadedBackBarrels++;
			}
			// End:0x1CA
			if(bPlayingBackCycle)
			{
				AnimEnded(2, RocketCycleAnim, 1.0000000, 1.0000000);
			}
			VisibleRockets = ((MagAmmo - PrimaryFire.ConsumedLoad) - SecdaryFire.ConsumedLoad) - int(LoadedBackBarrels);
			// End:0x215
			if(VisibleRockets > 1)
			{
				ShowRocket(false, 0);				
			}
			else
			{
				HideRocket(false, 0);
			}
			// End:0x248
			if(FireMode[1].IsFiring())
			{
				SafePlayAnim(RocketCycleAnim, 6.0000000,, 2);				
			}
			else
			{
				SafePlayAnim(RocketCycleAnim, 0.9000000,, 2);
			}
			bPlay = true;
			bPlayingBackCycle = true;
		}
		// End:0x2C1
		if(bPlay)
		{
			// End:0x2A6
			if(FireMode[1].IsFiring())
			{
				NextLoadTime = Level.TimeSeconds + RocketActiveReloadRate;				
			}
			else
			{
				NextLoadTime = Level.TimeSeconds + 0.3000000;
			}
		}
	}
	//return;	
}

simulated function bool ConsumeMRLAmmo(int Mode, float load, float LoadB)
{
	// End:0x53
	if(bNoMag || (bFireMode[Mode] != none) && bFireMode[Mode].bUseWeaponMag == false)
	{
		ConsumeAmmo(Mode, load + LoadB);		
	}
	else
	{
		// End:0x6E
		if(float(MagAmmo) < load)
		{
			MagAmmo = 0;			
		}
		else
		{
			MagAmmo -= int(load);
		}
		// End:0x97
		if(float(BigMagAmmo) < LoadB)
		{
			BigMagAmmo = 0;			
		}
		else
		{
			BigMagAmmo -= int(LoadB);
		}
	}
	return true;
	//return;	
}

simulated function GetAmmoCount(out float MaxAmmoPrimary, out float CurAmmoPrimary)
{
	// End:0x0F
	if(Ammo[0] == none)
	{
		return;
	}
	// End:0x4B
	if(bNoMag)
	{
		MaxAmmoPrimary = float(Ammo[0].MaxAmmo);
		CurAmmoPrimary = float(Ammo[0].AmmoAmount);		
	}
	else
	{
		MaxAmmoPrimary = float(default.MagAmmo + default.BigMagAmmo);
		CurAmmoPrimary = float(MagAmmo + BigMagAmmo);
	}
	//return;	
}

simulated function float ChargeBar()
{
	return float(int(LoadedFrontBarrels) + int(LoadedBackBarrels)) / 18.0000000;
	//return;	
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	super.DisplayDebug(Canvas, YL, YPos);
	Canvas.SetDrawColor(32, 16, 0);
	Canvas.DrawText((((((((("BigMagAmmo: " $ string(BigMagAmmo)) $ ", bSmallReload: ") $ string(bSmallReload)) $ ", BarrelIndex: ") $ string(BarrelIndex)) $ ", LoadedFrontBarrels: ") $ string(LoadedFrontBarrels)) $ ", LoadedBackBarrels: ") $ string(LoadedBackBarrels));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
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
	// End:0x96
	if(dist < float(1024))
	{
		return 0.4000000;
	}
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.6500000, dist, 4096.0000000, 4096.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.9000000;
	//return;	
}

defaultproperties
{
	RocketActiveReloadRate=0.2000000
	ClipOutSoundSmall=Sound'BW_Core_WeaponSound.MRL.MRL-SmallOff'
	ClipInSoundSmall=Sound'BW_Core_WeaponSound.MRL.MRL-SmallOn'
	RocketCycleAnim="RocketCycle"
	FrontRockets[0]=(RocketName="RocketA0",bHidden=false)
	FrontRockets[1]=(RocketName="RocketA1",bHidden=false)
	FrontRockets[2]=(RocketName="RocketA2",bHidden=false)
	FrontRockets[3]=(RocketName="RocketA3",bHidden=false)
	FrontRockets[4]=(RocketName="RocketA4",bHidden=false)
	FrontRockets[5]=(RocketName="RocketA5",bHidden=false)
	FrontRockets[6]=(RocketName="RocketA6",bHidden=false)
	FrontRockets[7]=(RocketName="RocketA7",bHidden=false)
	FrontRockets[8]=(RocketName="RocketA8",bHidden=false)
	BackRockets[0]=(RocketName="RocketB1",bHidden=false)
	BackRockets[1]=(RocketName="RocketB2",bHidden=false)
	BackRockets[2]=(RocketName="RocketB3",bHidden=false)
	BigMagAmmo=72
	SpecialInfo[0]=(Id="EvoDefs",Info="480.0;60.0;1.5;100.0;0.8;2.0;1.5")
	ParamsClasses[0]=Class'BallisticProV55.MRLWeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.MRLWeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.MRLWeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.MRLWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.MRL.BigIcon_MRL'
	BigIconCoords=(X1=0,Y1=30,X2=511,Y2=225)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Putaway',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNonCocking=true
	ReloadAnim="Reload1"
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.MRL.MRL-BigOff',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.MRL.MRL-BigOn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.7000000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc7',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc1',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=119),Color2=(R=255,G=255,B=0,A=73),StartSize1=166,StartSize2=101)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=3.0000000,CurrentScale=0.0000000)
	LongGunOffset=(X=8.0000000,Y=-5.0000000,Z=-3.0000000)
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_RapidProj=true
	bWT_Projectile=true
	ManualLines[0]="Fires miniature explosive rockets at a modest rate. Moderate damage, good damage output and fast travel time. Capacity is extremely high due to the double-magazine setup. Recoil is almost non-existent as the weapon is a multiple rocket launcher. The rockets also deal radius damage."
	ManualLines[1]="As the primary fire, but the rate of fire is significantly increased. The rockets travel slowly at first, before launching at full speed."
	ManualLines[2]="Effective against groups and at medium range."
	SightOffset=(X=-15.0000000,Y=-10.0000000,Z=15.0000000)
	FireModeClass[0]=Class'BallisticProV55.MRLPrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.MRLSecondaryFire'
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8500000
	CurrentRating=0.8500000
	bShowChargingBar=true
	Description="An experimental product of NDTR's ballistics wing, the JL21 missile launcher is yet another armament in a long line of anti-Krao weapons designed by the terrans. A powerful, heavy and highly volatile construct, the 'PeaceMaker' has thus far proved it's worth in field tests. The 18 barrelled monster, can fire small, short ranged missiles very quickly via several feed mechanisms supplied by 2 large ammunition containers. A very distinctive attribute of the MRL lies in it's missles flight paths, most often than not, following a drunk path and flying about in an apparently random manner. This has proved very efficient against hordes of Krao, yet not as effective against single opponents. The latest feature of the weapon, allows an even faster rate of fire, at the greatly increased cost of ammunition."
	Priority=39
	HudColor=(R=140,G=98,B=57,A=255)
	InventoryGroup=8
	GroupOffset=2
	PickupClass=Class'BallisticProV55.MRLPickup'
	PlayerViewOffset=(X=10.0000000,Y=8.0000000,Z=-12.0000000)
	PlayerViewPivot=(Pitch=1024,Yaw=-512,Roll=1024)
	AttachmentClass=Class'BallisticProV55.MRLAttachment'
	IconMaterial=Texture'BW_Core_WeaponTex.MRL.SmallIcon_MRL'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="JL21-MRL PeaceMaker"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.MRL_FPm'
	DrawScale=0.3000000
}
