class MJ51Carbine extends BallisticWeapon
	config(BallisticProV55);

var() name GrenadeLoadAnim;
var() bool bLoaded;
var() name GrenBone;
var() name GrenBoneBase;
var() Sound GrenSlideSound;
var() Sound ClipInSoundEmpty;
var() name BulletBone;
var() name BulletBone2;

static function Class<Pickup> RecommendAmmoPickup(int Mode)
{
	return Class'BWBP_SKC_Pro.AP_STANAGChaff';
	//return;	
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	local int M;
	local Weapon W;
	local bool bPossiblySwitch, bJustSpawned;

	Instigator = Other;
	W = Weapon(Other.FindInventoryType(Class));
	// End:0x170
	if((W == none) || Class != W.Class)
	{
		bJustSpawned = true;
		super(Inventory).GiveTo(Other);
		bPossiblySwitch = true;
		W = self;
		// End:0x104
		if((Pickup != none) && BallisticWeaponPickup(Pickup) != none)
		{
			GenerateLayout(BallisticWeaponPickup(Pickup).LayoutIndex);
			GenerateCamo(BallisticWeaponPickup(Pickup).CamoIndex);
			// End:0xE8
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = BallisticWeaponPickup(Pickup).MagAmmo;			
		}
		else
		{
			GenerateLayout(byte(255));
			GenerateCamo(byte(255));
			// End:0x140
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = MagAmmo + ((int(!bNonCocking) * int(bMagPlusOne)) * int(!bNeedCock));
		}		
	}
	else
	{
		// End:0x18C
		if(!W.HasAmmo())
		{
			bPossiblySwitch = true;
		}
	}
	// End:0x19F
	if(Pickup == none)
	{
		bPossiblySwitch = true;
	}
	M = 0;
	J0x1A6:

	// End:0x202 [Loop If]
	if(M < 2)
	{
		// End:0x1F8
		if(FireMode[M] != none)
		{
			FireMode[M].Instigator = Instigator;
			GiveAmmo(M, WeaponPickup(Pickup), bJustSpawned);
		}
		M++;
		// [Loop Continue]
		goto J0x1A6;
	}
	// End:0x23B
	if((Instigator.Weapon != none) && Instigator.Weapon.IsFiring())
	{
		bPossiblySwitch = false;
	}
	// End:0x268
	if(Instigator.Weapon != W)
	{
		W.ClientWeaponSet(bPossiblySwitch);
	}
	bAimDisabled = default.bAimDisabled || !Instigator.IsHumanControlled();
	// End:0x2C3
	if(!bJustSpawned)
	{
		M = 0;
		J0x29D:

		// End:0x2C0 [Loop If]
		if(M < 2)
		{
			Ammo[M] = none;
			M++;
			// [Loop Continue]
			goto J0x29D;
		}
		Destroy();
	}
	// End:0x2DF
	if(Instigator.FindInventoryType(Class'BCoreProV55.BCGhostWeapon') != none)
	{
		return;
	}
	// End:0x362
	if(Instigator.FindInventoryType(Class'BWBP_SKC_Pro.ChaffGrenadeWeapon') != none)
	{
		W = Spawn(Class'BWBP_SKC_Pro.ChaffGrenadeWeapon',,, Instigator.Location);
		// End:0x362
		if(W != none)
		{
			W.GiveTo(Instigator);
			W.ConsumeAmmo(0, 9999.0000000, true);
			W.ConsumeAmmo(1, 9999.0000000, true);
		}
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x78
	if((Anim == 'Fire') || Anim == 'ReloadEmpty')
	{
		// End:0x78
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 2)
		{
			SetBoneScale(4, 0.0000000, BulletBone);
			SetBoneScale(5, 0.0000000, BulletBone2);
		}
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x32
	if(!bLoaded)
	{
		SetBoneScale(2, 0.0000000, GrenBone);
		SetBoneScale(3, 0.0000000, GrenBoneBase);		
	}
	else
	{
		SetBoneScale(2, 1.0000000, GrenBone);
		SetBoneScale(3, 1.0000000, GrenBoneBase);
	}
	// End:0xA5
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		SetBoneScale(4, 0.0000000, BulletBone);
		SetBoneScale(5, 0.0000000, BulletBone2);
		ReloadAnim = 'ReloadEmpty';		
	}
	else
	{
		ReloadAnim = 'Reload';
	}
	super.BringUp(PrevWeapon);
	//return;	
}

simulated function bool PutDown()
{
	// End:0x2F
	if(!bLoaded)
	{
		SetBoneScale(2, 0.0000000, GrenBone);
		SetBoneScale(3, 0.0000000, GrenBoneBase);
	}
	// End:0x3A
	if(super.PutDown())
	{
		return true;
	}
	return false;
	//return;	
}

simulated function LoadGrenade()
{
	// End:0x23
	if((Ammo[1].AmmoAmount < 1) || bLoaded)
	{
		return;
	}
	// End:0x51
	if(int(ReloadState) == int(0))
	{
		ReloadState = 9;
		PlayAnim(GrenadeLoadAnim, ReloadAnimRate + 0.1000000,, 0);
	}
	//return;	
}

simulated function Notify_ClipUp()
{
	SetBoneScale(4, 1.0000000, BulletBone);
	SetBoneScale(5, 1.0000000, BulletBone2);
	//return;	
}

simulated function Notify_ClipOut()
{
	super.Notify_ClipOut();
	// End:0x35
	if(MagAmmo < 1)
	{
		SetBoneScale(4, 0.0000000, BulletBone);
		SetBoneScale(5, 0.0000000, BulletBone2);
	}
	//return;	
}

simulated function Notify_GrenVisible()
{
	SetBoneScale(2, 1.0000000, GrenBone);
	SetBoneScale(3, 1.0000000, GrenBoneBase);
	ReloadState = 2;
	//return;	
}

simulated function Notify_GrenSlide()
{
	PlaySound(GrenSlideSound, 1, 2.2000000,, 64.0000000);
	//return;	
}

simulated function Notify_GrenLoaded()
{
	local Inventory Inv;

	// End:0x12
	if(int(ReloadState) == int(0))
	{
		return;
	}
	ReloadState = 3;
	MJ51Attachment(ThirdPersonActor).bGrenadier = true;
	MJ51Attachment(ThirdPersonActor).IAOverride(true);
	Ammo[1].UseAmmo(1, true);
	bLoaded = true;
	// End:0xD3
	if(Ammo[1].AmmoAmount == 0)
	{
		Inv = Instigator.Inventory;
		J0x8A:

		// End:0xD3 [Loop If]
		if(Inv != none)
		{
			// End:0xBC
			if(ChaffGrenadeWeapon(Inv) != none)
			{
				ChaffGrenadeWeapon(Inv).RemoteKill();
				// [Explicit Break]
				goto J0xD3;
			}
			Inv = Inv.Inventory;
			// [Loop Continue]
			goto J0x8A;
		}
	}
	J0xD3:

	//return;	
}

simulated function Notify_GrenReady()
{
	ReloadState = 0;
	//return;	
}

simulated function Notify_GrenLaunch()
{
	SetBoneScale(2, 0.0000000, GrenBone);
	MJ51Attachment(ThirdPersonActor).IAOverride(false);
	MJ51Attachment(ThirdPersonActor).bGrenadier = false;
	//return;	
}

simulated function Notify_GrenInvisible()
{
	SetBoneScale(3, 0.0000000, GrenBoneBase);
	//return;	
}

simulated function PlayReload()
{
	// End:0x29
	if(MagAmmo < 1)
	{
		ReloadAnim = 'ReloadEmpty';
		ClipHitSound.Sound = ClipInSoundEmpty;		
	}
	else
	{
		ReloadAnim = 'Reload';
		ClipHitSound.Sound = default.ClipHitSound.Sound;
	}
	// End:0x78
	if(!bLoaded)
	{
		SetBoneScale(2, 0.0000000, GrenBone);
		SetBoneScale(3, 0.0000000, GrenBoneBase);
	}
	SafePlayAnim(ReloadAnim, ReloadAnimRate,, 0, "RELOAD");
	//return;	
}

simulated function IndirectLaunch()
{
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
	local Bot B;

	// End:0x0C
	if(bNoaltfire)
	{
		return 0;
	}
	B = Bot(Instigator.Controller);
	// End:0x49
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0xD3
	if(B.Skill > float(Rand(6)))
	{
		// End:0xD0
		if((AimComponent.GetChaos() < 0.1000000) || (AimComponent.GetChaos() < 0.5000000) && VSize(B.Enemy.Location - Instigator.Location) > float(500))
		{
			return 1;
		}		
	}
	else
	{
		// End:0xE2
		if(FRand() > 0.7500000)
		{
			return 1;
		}
	}
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
	GrenadeLoadAnim="LoadGrenade"
	GrenBone="Grenade"
	GrenBoneBase="GrenadeHandle"
	GrenSlideSound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-GrenLock'
	ClipInSoundEmpty=Sound'BWBP_SKC_Sounds.MJ51.MJ51-MagInEmpty'
	BulletBone="Bullet1"
	BulletBone2="Bullet2"
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;20.0;0.9;75.0;0.8;0.7;0.2")
	AIReloadTime=1.0000000
	SightAnimScale=0.3000000
	ParamsClasses[0]=Class'BWBP_APC_Pro.MJ51WeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_APC_Pro.MJ51WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_APC_Pro.MJ51WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_APC_Pro.MJ51WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_APC_Tex.M4A1.BigIcon_MJ51'
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-PullOut',Volume=0.2230000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-Putaway',Volume=0.2700000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=1
	bNoCrosshairInScope=true
	SightBobScale=0.2000000
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-Cock',Volume=1.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-Cock',Volume=1.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-MagOut',Volume=1.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-MagInEmpty',Volume=1.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M50Out',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50In',USize1=128,VSize1=128,USize2=128,VSize2=128,Color1=(R=255,G=0,B=0,A=158),Color2=(R=255,G=255,B=0,A=255),StartSize1=75,StartSize2=72)
	LongGunOffset=(X=10.0000000,Y=10.0000000,Z=-11.0000000)
	bWT_Bullet=true
	SightingTime=0.2000000
	SightOffset=(X=0.0000000,Y=-6.4500000,Z=20.5000000)
	CockingBringUpTime=1.2000000
	GunLength=50.0000000
	FireModeClass[0]=Class'BWBP_APC_Pro.MJ51PrimaryFire'
	FireModeClass[1]=Class'BWBP_APC_Pro.MJ51SecondaryFire'
	IdleAnimRate=0.2000000
	PutDownTime=0.7000000
	BringUpTime=0.9000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	Description="MJ51 Carbine"
	Priority=41
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=4
	PickupClass=Class'BWBP_APC_Pro.MJ51Pickup'
	PlayerViewOffset=(X=-10.0000000,Y=10.0000000,Z=-15.5000000)
	AttachmentClass=Class'BWBP_APC_Pro.MJ51Attachment'
	IconMaterial=Texture'BWBP_APC_Tex.M4A1.SmallIcon_MJ51'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="MJ51 Carbine"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_APC_Anim.MJ51Carbine_FPm'
	DrawScale=0.3000000
}
