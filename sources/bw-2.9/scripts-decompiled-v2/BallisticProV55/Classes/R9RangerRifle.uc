class R9RangerRifle extends BallisticWeapon
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

var float lastModeChangeTime;

simulated exec function SwitchWeaponMode(optional byte modeNum)
{
	// End:0x4E
	if((int(ClientState) == int(4)) && int(ReloadState) == int(0))
	{
		// End:0x3C
		if(int(modeNum) == 0)
		{
			ServerSwitchWeaponMode(byte(255));			
		}
		else
		{
			ServerSwitchWeaponMode(byte(int(modeNum) - 1));
		}
	}
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	local int M;

	// End:0x1D
	if(bPreventReload || int(ReloadState) != int(0))
	{
		return;
	}
	// End:0x3D
	if(int(newmode) == 255)
	{
		newmode = byte(int(CurrentWeaponMode) + 1);
	}
	// End:0x52
	if(int(newmode) == int(CurrentWeaponMode))
	{
		return;
	}
	J0x52:

	// End:0xB8 [Loop If]
	if((int(newmode) != int(CurrentWeaponMode)) && (int(newmode) >= WeaponModes.Length) || WeaponModes[int(newmode)].bUnavailable)
	{
		// End:0xAE
		if(int(newmode) >= WeaponModes.Length)
		{
			newmode = 0;			
		}
		else
		{
			newmode++;
		}
		// [Loop Continue]
		goto J0x52;
	}
	// End:0xFF
	if(!WeaponModes[int(newmode)].bUnavailable)
	{
		CommonSwitchWeaponMode(newmode);
		ClientSwitchWeaponMode(CurrentWeaponMode);
		NetUpdateTime = Level.TimeSeconds - float(1);
	}
	R9Attachment(ThirdPersonActor).CurrentTracerMode = CurrentWeaponMode;
	M = 0;
	J0x11F:

	// End:0x16B [Loop If]
	if(M < 2)
	{
		// End:0x161
		if((FireMode[M] != none) && FireMode[M].bIsFiring)
		{
			StopFire(M);
		}
		M++;
		// [Loop Continue]
		goto J0x11F;
	}
	bServerReloading = true;
	// End:0x1B6
	if((BallisticAttachment(ThirdPersonActor) != none) && BallisticAttachment(ThirdPersonActor).ReloadAnim != 'None')
	{
		Instigator.SetAnimAction('ReloadGun');
	}
	CommonStartReload(0);
	ClientStartReload(0);
	//return;	
}

simulated function bool CheckWeaponMode(int Mode)
{
	// End:0x48
	if((WeaponModes[int(CurrentWeaponMode)].ModeID ~= "WM_FullAuto") || WeaponModes[int(CurrentWeaponMode)].ModeID ~= "WM_None")
	{
		return true;
	}
	// End:0x90
	if(((Mode == 0) && float(FireCount) >= WeaponModes[int(CurrentWeaponMode)].Value) || (Mode == 1) && FireCount >= 2)
	{
		return false;
	}
	return true;
	//return;	
}

function int ManageHeatInteraction(Pawn P, int HeatPerShot)
{
	local R9HeatManager HM;
	local int HeatBonus;

	// End:0x1D
	foreach P.BasedActors(Class'BallisticProV55.R9HeatManager', HM)
	{
		// End:0x1D
		break;		
	}	
	// End:0x6B
	if(HM == none)
	{
		HM = Spawn(Class'BallisticProV55.R9HeatManager', P,, P.Location + vect(0.0000000, 0.0000000, -30.0000000));
		HM.SetBase(P);
	}
	// End:0xCF
	if(HM != none)
	{
		HeatBonus = int(HM.Heat);
		// End:0xB9
		if(Vehicle(P) != none)
		{
			HM.AddHeat(float(HeatPerShot / 4));			
		}
		else
		{
			HM.AddHeat(float(HeatPerShot));
		}
	}
	return HeatBonus;
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
	local Bot B;
	local R9HeatManager HM;
	local float dist;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0x76
	if((Level.TimeSeconds - lastModeChangeTime) < (1.4000000 - (B.Skill * 0.1000000)))
	{
		return 0;
	}
	dist = VSize(Instigator.Location - B.Enemy.Location);
	// End:0xCB
	foreach B.Enemy.BasedActors(Class'BallisticProV55.R9HeatManager', HM)
	{
		// End:0xCB
		break;		
	}	
	// End:0x148
	if((HM != none) || (float(B.Enemy.Health) + B.Enemy.ShieldStrength) > float(200))
	{
		// End:0x145
		if(int(CurrentWeaponMode) != 2)
		{
			CurrentWeaponMode = 2;
			R9PrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
		}		
	}
	else
	{
		// End:0x178
		if(int(CurrentWeaponMode) != 0)
		{
			CurrentWeaponMode = 0;
			R9PrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
		}
	}
	lastModeChangeTime = Level.TimeSeconds;
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
	return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.7500000, dist, 2048.0000000, 2048.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.8000000;
	//return;	
}

defaultproperties
{
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;25.0;0.5;50.0;1.0;0.2;0.0")
	ParamsClasses[0]=Class'BallisticProV55.R9WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.R9WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.R9WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.R9WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.R9.BigIcon_R9'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78Pullout',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78Putaway',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Regular",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Freeze",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Laser",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Phosphorous",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="Poison",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	FullZoomFOV=60.0000000
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc6',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.R78InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=192),Color2=(R=255,G=255,B=0,A=255),StartSize1=160,StartSize2=88)
	bWT_Bullet=true
	ManualLines[0]="Semi-automatic rifle fire. High damage, long range, high penetration and moderate recoil. Sustained damage output is modest."
	ManualLines[1]="As primary, except fires subsonic rounds. Loses damage over range but has lower recoil, lesser flash and is quieter."
	ManualLines[2]="As a long-ranged weapon lacking a scope, it has a reasonably quick aiming time. Does not use tracer rounds. Cumbersome to use in close combat."
	SightPivot=(Pitch=50,Yaw=0,Roll=0)
	SightOffset=(X=-3.0000000,Y=0.0200000,Z=2.2000000)
	GunLength=80.0000000
	FireModeClass[0]=Class'BallisticProV55.R9PrimaryFire'
	FireModeClass[1]=Class'BCoreProV55.BallisticScopeFire'
	SelectAnimRate=1.1000000
	BringUpTime=0.4000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	Description="Outstanding reliability and durability in the field are what characterise one of Black & Wood's legendary rifles. Though not widely used by most military forces, the R9 is renowned for its near indestructable design, and superb reliability. Those who use the weapon, mostly snipers, hunters, and specialised squads, swear by it's accuracy and dependability. Often used without fancy features or burdening devices such as optical scopes and similar attachements, the R9 is a true legend with it's users."
	Priority=33
	HudColor=(R=255,G=175,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=9
	GroupOffset=3
	PickupClass=Class'BallisticProV55.R9Pickup'
	PlayerViewOffset=(X=12.0000000,Y=5.7000000,Z=-5.5000000)
	AttachmentClass=Class'BallisticProV55.R9Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.R9.SmallIcon_R9'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="R9 Ranger Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.R9_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BW_Core_WeaponTex.R9.USSR-Shiny'
	Skins[2]=FinalBlend'BW_Core_WeaponTex.SRS.SRS-HSight-FB'
	Skins[3]=Shader'BW_Core_WeaponTex.SRS.SRS-SelfIllum'
}
