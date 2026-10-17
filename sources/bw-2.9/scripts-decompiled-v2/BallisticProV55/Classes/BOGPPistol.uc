class BOGPPistol extends BallisticHandgun
	config(BallisticProV55);

var() name GrenadeBone;
var bool bHideHead;
var bool bCockOtherGun;
var float LastFlareTime;
var float FlareSwitchTime;

simulated function FirePressed(float F)
{
	// End:0x1A
	if(IsInState('DualAction') || IsInState('PendingDualAction'))
	{
		return;
	}
	// End:0x5E
	if((!HasAmmo() && !IsSlave()) && (OtherGun == none) || !OtherGun.HasAmmo())
	{
		OutOfAmmo();		
	}
	else
	{
		// End:0xC5
		if(bCanSkipReload && ((int(ReloadState) == int(5)) || int(ReloadState) == int(6)) || int(ReloadState) == int(1))
		{
			ServerSkipReload();
			// End:0xC2
			if(int(Level.NetMode) == int(NM_Client))
			{
				SkipReload();
			}			
		}
		else
		{
			// End:0x17E
			if((((((int(ReloadState) == int(0)) && bNeedCock) && MagAmmo > 0) && !IsFiring()) && Level.TimeSeconds > FireMode[0].NextFireTime) && ((OtherGun == none) || OtherGun.bNeedCock) || !OtherGun.HasAmmo())
			{
				CommonCockGun();
				// End:0x17B
				if(int(Level.NetMode) == int(NM_Client))
				{
					ServerCockGun();
				}				
			}
			else
			{
				// End:0x19B
				if(IsMaster())
				{
					OtherGun.FirePressed(F);
				}
			}
		}
	}
	//return;	
}

simulated function bool CheckGrenade()
{
	// End:0x13
	if(bNeedCock)
	{
		Reload(0);
		return false;
	}
	return true;
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

simulated function Notify_BOGPOpen()
{
	PlaySound(ClipOutSound.Sound, 1, 0.5000000,, 64.0000000);
	// End:0x3C
	if(bHideHead)
	{
		SetBoneScale(0, 0.0000000, GrenadeBone);
		bHideHead = false;
	}
	//return;	
}

simulated function Notify_BOGPIn()
{
	PlaySound(ClipInSound.Sound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_BOGPClose()
{
	PlaySound(ClipHitSound.Sound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_BOGPUnhide()
{
	SetBoneScale(0, 1.0000000, GrenadeBone);
	//return;	
}

simulated function bool CanReload()
{
	// End:0x6A
	if((((bPreventReload || int(ReloadState) != int(0)) || IsInState('DualAction')) || (OtherGun != none) && int(OtherGun.ReloadState) != int(0)) || Ammo[0].AmmoAmount < 1)
	{
		return false;
	}
	return true;
	//return;	
}

simulated exec function Reload(optional byte i)
{
	// End:0x2A
	if((bIsPendingHandGun || PendingHandgun != none) || int(ClientState) != int(4))
	{
		return;
	}
	// End:0x52
	if((OtherGun != none) && int(OtherGun.ClientState) != int(4))
	{
		return;
	}
	// End:0x66
	if(bNeedCock)
	{
		CockGun(0);		
	}
	else
	{
		// End:0x83
		if(IsMaster())
		{
			OtherGun.Reload(i);
		}
	}
	//return;	
}

simulated function bool CanAlternate(int Mode)
{
	// End:0x0D
	if(Mode != 0)
	{
		return false;
	}
	return super.CanAlternate(Mode);
	//return;	
}

simulated exec function SwitchWeaponMode(optional byte modeNum)
{
	// End:0x12
	if(int(ReloadState) != int(0))
	{
		return;
	}
	// End:0x2C
	if(int(modeNum) == 0)
	{
		ServerSwitchWeaponMode(byte(255));		
	}
	else
	{
		ServerSwitchWeaponMode(byte(int(modeNum) - 1));
	}
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	// End:0x34
	if(((int(ReloadState) != int(0)) || int(newmode) == int(CurrentWeaponMode)) || !HasAmmo())
	{
		return;
	}
	super.ServerSwitchWeaponMode(newmode);
	//return;	
}

simulated function CommonSwitchWeaponMode(byte newmode)
{
	super(BallisticWeapon).CommonSwitchWeaponMode(newmode);
	CommonCockGun();
	//return;	
}

simulated function Notify_CockAfterFire()
{
	bPreventReload = false;
	// End:0x58
	if(((OtherGun != none) && BOGPPistol(OtherGun) == none) || (BOGPPistol(OtherGun) != none) && IsSlave() || OtherGun.bNeedCock)
	{
		return;
	}
	// End:0x69
	if(bNeedCock)
	{
		CommonCockGun(1);
	}
	//return;	
}

simulated function HandgunRaised(BallisticHandgun Other)
{
	// End:0x28
	if((Other == self) && IsMaster())
	{
		// End:0x25
		if(bNeedCock)
		{
			CommonCockGun();
		}		
	}
	else
	{
		// End:0x6C
		if(((OtherGun != none) && Other != self) && IsSlave())
		{
			// End:0x6C
			if(OtherGun.bNeedCock)
			{
				OtherGun.CommonCockGun();
			}
		}
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	FlareSwitchTime = Level.TimeSeconds + 0.6000000;
	// End:0x66
	if(OtherGun != none)
	{
		// End:0x66
		if((int(OtherGun.ClientState) == int(2)) && OtherGun.bNeedCock)
		{
			bCockOtherGun = true;
		}
	}
	//return;	
}

simulated function bool PutDown()
{
	local bool bSuccess;

	bSuccess = super.PutDown();
	// End:0x31
	if(bSuccess)
	{
		FlareSwitchTime = Level.TimeSeconds + 2.0000000;
	}
	return bSuccess;
	//return;	
}

simulated function Vector ConvertFOVs(Vector InVec, float InFOV, float OutFOV, float Distance)
{
	local Vector ViewLoc, Outvec, Dir, X, Y, Z;

	local Rotator ViewRot;

	ViewLoc = Instigator.Location + Instigator.EyePosition();
	ViewRot = Instigator.GetViewRotation();
	Dir = InVec - ViewLoc;
	GetAxes(ViewRot, X, Y, Z);
	Outvec.X = Distance / Tan((OutFOV * 3.1415930) / float(360));
	Outvec.Y = ((Dir Dot Y) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec.Z = ((Dir Dot Z) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec = Outvec >> ViewRot;
	return Outvec + ViewLoc;
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3300000, dist, 1024.0000000, 2048.0000000);
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
	GrenadeBone="GrenadePistolGrenade"
	bShouldDualInLoadout=false
	SpecialInfo[0]=(Id="EvoDefs",Info="120.0;20.0;0.8;40.0;0.0;0.0;0.6")
	AIReloadTime=1.5000000
	SightAnimScale=0.5000000
	ParamsClasses[0]=Class'BallisticProV55.BOGPWeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.BOGPWeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.BOGPWeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.BOGPWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.BOGP.BigIcon_BOGP'
	BigIconCoords=(X1=0,Y1=32,X2=511,Y2=230)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Pullout',Volume=0.1550000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Putaway',Volume=0.1550000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Grenade",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Flare",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	bNoMag=true
	CockAnim="Reload"
	CockSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.BOGP.BOGP_Close',Volume=1.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.BOGP.BOGP_Open',Volume=1.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.BOGP.BOGP_GrenLoad',Volume=1.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.R78OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=126),Color2=(R=255,G=100,B=0,A=134),StartSize1=122,StartSize2=66)
	NDCrosshairInfo=(SpreadRatios=(X1=0.7500000,Y1=0.7500000,X2=0.3000000,Y2=0.3000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=4.0000000,CurrentScale=0.0000000)
	bWT_Splash=true
	bWT_Projectile=true
	ManualLines[0]="Grenade mode launches a grenade with good damage and blast radius. This grenade has an arming delay and upon striking a surface or player when unarmed. will ricochet, dealing only minor damage.|Flare mode will emit a flare which deals upfront damage, burns struck targets over time and obscures their view. If fired into the air, it will eventually explode with a distinctive effect."
	ManualLines[1]="Used to toggle between grenade and flare modes."
	ManualLines[2]="The BORT grenade is effective at medium range and when the player has height advantage. The BORT flare is most effective at close range. Recoil and hip spread are low, except when jumping. When dual wielded, the BORT pistols will fire simultaneously."
	SightPivot=(Pitch=300,Yaw=0,Roll=0)
	SightOffset=(X=-8.0000000,Y=0.0800000,Z=1.9500000)
	FireModeClass[0]=Class'BallisticProV55.BOGPPrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.BOGPSecondaryFire'
	PutDownTime=0.4500000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	Description="The BORT-85 Break-Open Grenade Pistol is a compact grenade launcher manufactured by NDTR Industries. The need for a simple and easy to use grenade launcher arose towards the end of the first war, especially in the large industrial zones of various Outworld colonies. Skrith favoured these areas, as they were perfect for the aliens which prefered to be hidden and strike with surprise. The simple design had several benefits, as it was relatively compact, and could fire many different types of ammunition."
	Priority=19
	HudColor=(R=255,G=50,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=2
	GroupOffset=2
	PickupClass=Class'BallisticProV55.BOGPPickup'
	PlayerViewOffset=(X=6.0000000,Y=1.5000000,Z=-4.5000000)
	AttachmentClass=Class'BallisticProV55.BOGPAttachment'
	IconMaterial=Texture'BW_Core_WeaponTex.BOGP.SmallIcon_BOGP'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="BORT-85 Grenade Pistol"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.BORT_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Texture'BW_Core_WeaponTex.BOGP.BOGP_Main'
	Skins[2]=Shader'BW_Core_WeaponTex.BOGP.BOGP_ScopeShine'
}
