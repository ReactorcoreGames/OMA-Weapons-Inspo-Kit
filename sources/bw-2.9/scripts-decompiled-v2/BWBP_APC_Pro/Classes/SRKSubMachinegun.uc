class SRKSubMachinegun extends BallisticWeapon
	config(BallisticProV55);

var() bool bFirstDraw;
var() name GrenadeLoadAnim;
var() bool bLoaded;
var() name GrenBone;
var() Sound GrenSlideSound;
var() Sound ClipInSoundEmpty;

static function Class<Pickup> RecommendAmmoPickup(int Mode)
{
	return Class'BWBP_APC_Pro.AP_SHADRACHChaff';
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
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	super.AnimEnd(Channel);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x3F
	if(bFirstDraw && MagAmmo > 0)
	{
		BringUpTime = 2.0000000;
		SelectAnim = 'Pullout';
		bFirstDraw = false;
		bLoaded = false;		
	}
	else
	{
		BringUpTime = default.BringUpTime;
		SelectAnim = 'Pullout';
	}
	// End:0x72
	if(!bLoaded)
	{
		SetBoneScale(5, 0.0000000, GrenBone);
	}
	super.BringUp(PrevWeapon);
	//return;	
}

simulated function bool PutDown()
{
	// End:0x1D
	if(!bLoaded)
	{
		SetBoneScale(5, 0.0000000, GrenBone);
	}
	// End:0x28
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
	// End:0x49
	if(int(ReloadState) == int(0))
	{
		PlayAnim(GrenadeLoadAnim, ReloadAnimRate + 0.2500000,, 0);
	}
	//return;	
}

simulated function Notify_GrenVisible()
{
	SetBoneScale(5, 1.0000000, GrenBone);
	ReloadState = 1;
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

	SRKSmgAttachment(ThirdPersonActor).bGrenadier = true;
	SRKSmgAttachment(ThirdPersonActor).IAOverride(true);
	Ammo[1].UseAmmo(1, true);
	// End:0xB1
	if(Ammo[1].AmmoAmount == 0)
	{
		Inv = Instigator.Inventory;
		J0x68:

		// End:0xB1 [Loop If]
		if(Inv != none)
		{
			// End:0x9A
			if(ChaffGrenadeWeapon(Inv) != none)
			{
				ChaffGrenadeWeapon(Inv).RemoteKill();
				// [Explicit Break]
				goto J0xB1;
			}
			Inv = Inv.Inventory;
			// [Loop Continue]
			goto J0x68;
		}
	}
	J0xB1:

	//return;	
}

simulated function Notify_GrenReady()
{
	ReloadState = 0;
	bLoaded = true;
	//return;	
}

simulated function Notify_GrenLaunch()
{
	SetBoneScale(5, 0.0000000, GrenBone);
	SRKSmgAttachment(ThirdPersonActor).IAOverride(false);
	SRKSmgAttachment(ThirdPersonActor).bGrenadier = false;
	//return;	
}

simulated function Notify_GrenInvisible()
{
	SetBoneScale(5, 0.0000000, GrenBone);
	//return;	
}

simulated function IndirectLaunch()
{
	//return;	
}

simulated function TickSighting(float dt)
{
	// End:0x24
	if((int(SightingState) == int(0)) || int(SightingState) == int(3))
	{
		return;
	}
	// End:0xB9
	if(int(SightingState) == int(2))
	{
		// End:0x9D
		if(SightingPhase < 1.0000000)
		{
			// End:0x78
			if((bScopeHeld || bPendingSightUp) && CanUseSights())
			{
				SightingPhase += (dt / 0.2000000);				
			}
			else
			{
				SightingState = 1;
				Instigator.Controller.bRun = 0;
			}			
		}
		else
		{
			SightingPhase = 1.0000000;
			SightingState = 3;
			ScopeUpAnimEnd();
		}		
	}
	else
	{
		// End:0x126
		if(int(SightingState) == int(1))
		{
			// End:0x10D
			if(SightingPhase > 0.0000000)
			{
				// End:0xF7
				if(bScopeHeld && CanUseSights())
				{
					SightingState = 2;					
				}
				else
				{
					SightingPhase -= (dt / 0.2000000);
				}				
			}
			else
			{
				SightingPhase = 0.0000000;
				SightingState = 0;
				ScopeDownAnimEnd();
			}
		}
	}
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

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0xC7
	if(B.Skill > float(Rand(6)))
	{
		// End:0xC4
		if((AimComponent.GetChaos() < 0.1000000) || (AimComponent.GetChaos() < 0.5000000) && VSize(B.Enemy.Location - Instigator.Location) > float(500))
		{
			return 1;
		}		
	}
	else
	{
		// End:0xD6
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
	bFirstDraw=true
	GrenadeLoadAnim="LoadGrenade"
	GrenBone="Grenade"
	GrenSlideSound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-GrenLock'
	ClipInSoundEmpty=Sound'BWBP_SKC_Sounds.MJ51.MJ51-MagInEmpty'
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;20.0;0.9;75.0;0.8;0.7;0.2")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BWBP_APC_Pro.SRKSmgWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_APC_Pro.SRKSmgWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_APC_Pro.SRKSmgWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_APC_Pro.SRKSmgWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_APC_Tex.SRXSmg.BigIcon_SPXSmg'
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-PullOut',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-Putaway',Volume=0.2700000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=1
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_APC_Sounds.SRKS.SRKS-Cock',Volume=1.6000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_APC_Sounds.SRKS.SRKS-ClipOut',Volume=1.6000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_APC_Sounds.SRKS.SRKS-ClipIn',Volume=1.6000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Dot1',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Cross3',USize1=128,VSize1=128,USize2=128,VSize2=128,Color1=(R=255,G=0,B=0,A=255),Color2=(R=0,G=0,B=0,A=84),StartSize1=16,StartSize2=55)
	bWT_Bullet=true
	SightingTime=0.2000000
	SightOffset=(X=0.0000000,Y=-0.3500000,Z=15.8000000)
	ReloadAnimRate=0.8500000
	GunLength=50.0000000
	FireModeClass[0]=Class'BWBP_APC_Pro.SRKSmgPrimaryFire'
	FireModeClass[1]=Class'BWBP_APC_Pro.SRKSmgSecondaryFire'
	IdleAnimRate=0.2000000
	PutDownTime=0.7000000
	BringUpTime=0.9000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	Description="Primary: 10mm Burst Fire||Secondary: Load/Fire Radioactive Chaff Grenade||With projected success rates for the SRK-650 reaching the minimum requirements, NDTR Industries had already gotten the green light to work on their sister project that originally was supposed to coincide with the SRK-650. The SRK-205 is an SMG version of the 650, chambered in the 10mm Super Auto cartridge to get maximum damage within close quarters confinements. Like it's older brother, the 205 has the same red dot and ammo counter, along with a threaded barrel.  Unlike the 650, the 205 doesn't have any AMP modules made for it, but it does come with radioactive chaff grenades to fry Cryon units and irradiated fleshy targets alike."
	Priority=41
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=3
	PickupClass=Class'BWBP_APC_Pro.SRKSmgPickup'
	PlayerViewOffset=(X=-6.0000000,Y=6.0000000,Z=-14.0000000)
	BobDamping=2.2500000
	AttachmentClass=Class'BWBP_APC_Pro.SRKSmgAttachment'
	IconMaterial=Texture'BWBP_APC_Tex.SRXSmg.SmallIcon_SPXSmg'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="SRK-205 Submachinegun"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_APC_Anim.SRK_FPm'
	DrawScale=0.3000000
}
