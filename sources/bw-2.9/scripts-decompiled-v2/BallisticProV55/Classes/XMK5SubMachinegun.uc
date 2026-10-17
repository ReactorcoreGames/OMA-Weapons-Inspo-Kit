class XMK5SubMachinegun extends BallisticWeapon
	config(BallisticProV55);

var() name DartLoadAnim;
var() Sound DartLoadSound;
var() Sound DartCockSound;

replication
{
	// Pos:0x000
	unreliable if(int(Role) == int(ROLE_Authority))
		ClientDartPickedUp;
}

simulated function Notify_DartIn()
{
	PlaySound(DartLoadSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_DartHit()
{
	PlaySound(DartCockSound, 1, 0.7500000,, 64.0000000);
	XMK5SecondaryFire(FireMode[1]).bLoaded = true;
	//return;	
}

function DartPickedUp()
{
	// End:0x5A
	if(Ammo[1].AmmoAmount < Ammo[1].MaxAmmo)
	{
		// End:0x42
		if(Instigator.Weapon == self)
		{
			LoadDart();			
		}
		else
		{
			XMK5SecondaryFire(FireMode[1]).bLoaded = true;
		}
	}
	// End:0x74
	if(!Instigator.IsLocallyControlled())
	{
		ClientDartPickedUp();
	}
	//return;	
}

simulated function ClientDartPickedUp()
{
	// End:0x2B
	if(Ammo[1].AmmoAmount < Ammo[1].MaxAmmo)
	{
		LoadDart();
	}
	//return;	
}

simulated function bool IsDartLoaded()
{
	return XMK5SecondaryFire(FireMode[1]).bLoaded;
	//return;	
}

function GiveAmmo(int M, WeaponPickup WP, bool bJustSpawned)
{
	super.GiveAmmo(M, WP, bJustSpawned);
	// End:0x4E
	if((Ammo[1] != none) && Ammo_XMK5Darts(Ammo[1]) != none)
	{
		Ammo_XMK5Darts(Ammo[1]).DaXMK5 = self;
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x59
	if(Anim == DartLoadAnim)
	{
		ReloadState = 0;
		// End:0x45
		if(int(Role) == int(ROLE_Authority))
		{
			bServerReloading = false;
		}
		IdleTweenTime = 0.0000000;
		PlayIdle();		
	}
	else
	{
		IdleTweenTime = default.IdleTweenTime;
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated function LoadDart()
{
	// End:0x33
	if((Ammo[1].AmmoAmount < 1) || XMK5SecondaryFire(FireMode[1]).bLoaded)
	{
		return;
	}
	// End:0x72
	if(int(ReloadState) == int(0))
	{
		ReloadState = 8;
		// End:0x63
		if(int(Role) == int(ROLE_Authority))
		{
			bServerReloading = true;
		}
		PlayAnim(DartLoadAnim, 1.1000000,, 0);
	}
	//return;	
}

function ServerStartReload(optional byte i)
{
	local int Channel;
	local name seq;
	local float frame, Rate;

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
	GetAnimParams(Channel, seq, frame, Rate);
	// End:0x48
	if(seq == DartLoadAnim)
	{
		return;
	}
	// End:0xA8
	if((int(i) == 1) || (MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
	{
		// End:0xA6
		if(((AmmoAmount(1)) > 0) && !IsReloadingDart())
		{
			LoadDart();
			ClientStartReload(1);
		}
		return;
	}
	super.ServerStartReload();
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	// End:0x7D
	if(int(Level.NetMode) == int(NM_Client))
	{
		// End:0x72
		if((int(i) == 1) || (MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
		{
			// End:0x6F
			if(((AmmoAmount(1)) > 0) && !IsReloadingDart())
			{
				LoadDart();
			}			
		}
		else
		{
			CommonStartReload(i);
		}
	}
	//return;	
}

simulated function bool CheckWeaponMode(int Mode)
{
	// End:0x14
	if(Mode == 1)
	{
		return FireCount < 1;
	}
	return super.CheckWeaponMode(Mode);
	//return;	
}

function bool BotShouldReloadDart()
{
	// End:0x2A
	if((Level.TimeSeconds - Instigator.LastPainTime) > 1.0000000)
	{
		return true;
	}
	return false;
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x5E
	if(((((AIController(Instigator.Controller) != none) && !IsDartLoaded()) && (AmmoAmount(1)) > 0) && BotShouldReloadDart()) && !IsReloadingDart())
	{
		LoadDart();
	}
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float Result, Height, dist, VDot;

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
	dist = VSize(B.Enemy.Location - Instigator.Location);
	Height = B.Enemy.Location.Z - Instigator.Location.Z;
	VDot = Normal(B.Enemy.Velocity) Dot Normal(Instigator.Location - B.Enemy.Location);
	Result = FRand() - 0.3000000;
	// End:0x137
	if(dist > float(800))
	{
		Result -= ((dist - float(800)) / float(2000));
	}
	// End:0x177
	if((dist < float(500)) && VDot > 0.3000000)
	{
		Result -= ((float(500) - dist) / float(1000));
	}
	// End:0x1DE
	if(VSize(B.Enemy.Velocity) > float(50))
	{
		// End:0x1B6
		if(Abs(VDot) > 0.8000000)
		{
			Result += 0.1000000;
		}
		// End:0x1D2
		if(VDot < float(0))
		{
			Result -= 0.2000000;			
		}
		else
		{
			Result += 0.2000000;
		}
	}
	dist = VSize((B.Enemy.Location * vect(1.0000000, 1.0000000, 0.0000000)) - (Instigator.Location * vect(1.0000000, 1.0000000, 0.0000000)));
	// End:0x259
	if(Height < float(-100))
	{
		Result += Abs((Height / float(2)) / dist);
	}
	// End:0x26B
	if(Result > 0.5000000)
	{
		return 1;
	}
	return 0;
	//return;	
}

simulated function bool IsReloadingDart()
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x27
	if(Anim == DartLoadAnim)
	{
		return true;
	}
	return false;
	//return;	
}

function bool CanAttack(Actor Other)
{
	// End:0x61
	if(!IsDartLoaded())
	{
		// End:0x41
		if(IsReloadingDart())
		{
			// End:0x3E
			if((Level.TimeSeconds - Instigator.LastPainTime) > 1.0000000)
			{
				return false;
			}			
		}
		else
		{
			// End:0x61
			if(((AmmoAmount(1)) > 0) && BotShouldReloadDart())
			{
				LoadDart();
				return false;
			}
		}
	}
	return super.CanAttack(Other);
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.6000000, dist, BallisticInstantFire(bFireMode[0]).DecayRange.Min, BallisticInstantFire(bFireMode[0]).DecayRange.Max);
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
	DartLoadAnim="Reload2"
	DartLoadSound=Sound'BW_Core_WeaponSound.OA-SMG.OA-SMG_LoadDart'
	DartCockSound=Sound'BW_Core_WeaponSound.OA-SMG.OA-SMG_CockDart'
	SpecialInfo[0]=(Id="EvoDefs",Info="180.0;15.0;0.7;60.0;0.1;0.4;-999.0")
	AIReloadTime=1.0000000
	SightAnimScale=0.5000000
	ParamsClasses[0]=Class'BallisticProV55.XMK5WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.Xmk5WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.XMK5WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.XMK5WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.OA-SMG.BigIcon_OASMG'
	BigIconCoords=(X1=0,Y1=16,X2=511,Y2=210)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Putaway',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	SightZoomFactor=1.2000000
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.OA-SMG.OA-SMG_Cock',Volume=1.3500000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.OA-SMG.OA-SMG_ClipOut',Volume=1.1500000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.OA-SMG.OA-SMG_ClipIn',Volume=1.1500000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.7600000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M50OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=105,B=0,A=133),Color2=(R=255,G=0,B=0,A=255),StartSize1=87,StartSize2=55)
	bWT_Bullet=true
	bWT_Machinegun=true
	bWT_Projectile=true
	ManualLines[0]="Automatic submachinegun fire. Higher damage per bullet than other SMGs, good range and solid DPS, but higher recoil. Penetration is acceptable."
	ManualLines[1]="Launches a stun dart. Upon impact with the enemy, deals damage over time and inflicts a blinding effect multiple times upon them."
	ManualLines[2]="Effective at close range."
	SightOffset=(X=1.0000000,Y=0.0100000,Z=1.8000000)
	GunLength=40.0000000
	FireModeClass[0]=Class'BallisticProV55.XMK5PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.XMK5SecondaryFire'
	PutDownTime=0.3500000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	Description="NDTR's recent line of urban submachineguns, specfically the XMk5, has garnered attention from various UTC units operating in such environments. The XMk5 is often, and is indeed encouraged to be, fitted with all manner of attachments designed by NDTR as well. While many of the attachments are 'standard' sights, grenade launchers, flash lights and laser sights, there are other more peculiar devices. One of the most popular of these, is a unique, air-powered, dart launcher. The most commonly used dart, is one that stuns and poisons the victim, making them easy prey for the XMk5's primary bullet fire mode."
	Priority=41
	HudColor=(R=225,G=150,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=3
	GroupOffset=2
	PickupClass=Class'BallisticProV55.XMK5Pickup'
	PlayerViewOffset=(X=4.0000000,Y=3.5000000,Z=-1.5000000)
	AttachmentClass=Class'BallisticProV55.XMK5Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.OA-SMG.SmallIcon_OASMG'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="XMk5 Submachine Gun"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.XMK5_FPm'
	DrawScale=0.3000000
}
