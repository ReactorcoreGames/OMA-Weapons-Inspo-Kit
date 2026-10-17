class AR23HeavyRifle extends BallisticWeapon
	config(BallisticProV55);

var() bool bFirstDraw;
var() name GrenadeLoadAnim;
var() Sound GrenOpenSound;
var() Sound GrenLoadSound;
var() Sound GrenCloseSound;
var() name IronSightBone;
var() name IronSightBone2;
var() name IronSightBone3;
var() name ReflexSightBone;

replication
{
	// Pos:0x000
	unreliable if(int(Role) == int(ROLE_Authority))
		ClientGrenadePickedUp;
}

simulated function Notify_AR23GrenadeOut()
{
	PlaySound(GrenOpenSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_AR23GrenadeIn()
{
	PlaySound(GrenLoadSound, 1, 0.5000000,, 64.0000000);
	AR23SecondaryFire(FireMode[1]).bLoaded = true;
	//return;	
}

function GrenadePickedUp()
{
	// End:0x5A
	if(Ammo[1].AmmoAmount < Ammo[1].MaxAmmo)
	{
		// End:0x42
		if(Instigator.Weapon == self)
		{
			LoadGrenade();			
		}
		else
		{
			AR23SecondaryFire(FireMode[1]).bLoaded = true;
		}
	}
	// End:0x74
	if(!Instigator.IsLocallyControlled())
	{
		ClientGrenadePickedUp();
	}
	//return;	
}

simulated function ClientGrenadePickedUp()
{
	// End:0x56
	if(Ammo[1].AmmoAmount < Ammo[1].MaxAmmo)
	{
		// End:0x3E
		if(int(ClientState) == int(4))
		{
			LoadGrenade();			
		}
		else
		{
			AR23SecondaryFire(FireMode[1]).bLoaded = true;
		}
	}
	//return;	
}

simulated function bool IsGrenadeLoaded()
{
	return AR23SecondaryFire(FireMode[1]).bLoaded;
	//return;	
}

function GiveAmmo(int M, WeaponPickup WP, bool bJustSpawned)
{
	super.GiveAmmo(M, WP, bJustSpawned);
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x39
	if(Anim == GrenadeLoadAnim)
	{
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

simulated function LoadGrenade()
{
	// End:0x54
	if((Ammo[1].AmmoAmount < 1) || AR23SecondaryFire(FireMode[1]).bLoaded)
	{
		// End:0x52
		if(!AR23SecondaryFire(FireMode[1]).bLoaded)
		{
			PlayIdle();
		}
		return;
	}
	// End:0x7A
	if(int(ReloadState) == int(0))
	{
		PlayAnim(GrenadeLoadAnim, ReloadAnimRate + 0.1000000,, 0);
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
	if(seq == GrenadeLoadAnim)
	{
		return;
	}
	// End:0x99
	if((MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
	{
		// End:0x97
		if(((AmmoAmount(1)) > 0) && !IsReloadingGrenade())
		{
			LoadGrenade();
			ClientStartReload(1);
		}
		return;
	}
	super.ServerStartReload();
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	// End:0x54
	if(int(Level.NetMode) == int(NM_Client))
	{
		// End:0x49
		if(int(i) == 1)
		{
			// End:0x46
			if(((AmmoAmount(1)) > 0) && !IsReloadingGrenade())
			{
				LoadGrenade();
			}			
		}
		else
		{
			CommonStartReload(i);
		}
	}
	//return;	
}

function bool BotShouldReloadGrenade()
{
	// End:0x2A
	if((Level.TimeSeconds - Instigator.LastPainTime) > 1.0000000)
	{
		return true;
	}
	return false;
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x5E
	if(((((AIController(Instigator.Controller) != none) && !IsGrenadeLoaded()) && (AmmoAmount(1)) > 0) && BotShouldReloadGrenade()) && !IsReloadingGrenade())
	{
		LoadGrenade();
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
	local float Result, Height, dist, VDot;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0x5D
	if(((AmmoAmount(1)) < 1) || !IsGrenadeLoaded())
	{
		return 0;		
	}
	else
	{
		// End:0x6B
		if(MagAmmo < 1)
		{
			return 1;
		}
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	Height = B.Enemy.Location.Z - Instigator.Location.Z;
	VDot = Normal(B.Enemy.Velocity) Dot Normal(Instigator.Location - B.Enemy.Location);
	Result = FRand() - 0.3000000;
	// End:0x159
	if(dist > float(800))
	{
		Result -= ((dist - float(800)) / float(2000));
	}
	// End:0x199
	if((dist < float(500)) && VDot > 0.3000000)
	{
		Result -= ((float(500) - dist) / float(1000));
	}
	// End:0x200
	if(VSize(B.Enemy.Velocity) > float(50))
	{
		// End:0x1D8
		if(Abs(VDot) > 0.8000000)
		{
			Result += 0.1000000;
		}
		// End:0x1F4
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
	// End:0x27B
	if(Height < float(-100))
	{
		Result += Abs((Height / float(2)) / dist);
	}
	// End:0x28D
	if(Result > 0.5000000)
	{
		return 1;
	}
	return 0;
	//return;	
}

simulated function bool IsReloadingGrenade()
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x27
	if(Anim == GrenadeLoadAnim)
	{
		return true;
	}
	return false;
	//return;	
}

function bool CanAttack(Actor Other)
{
	// End:0x61
	if(!IsGrenadeLoaded())
	{
		// End:0x41
		if(IsReloadingGrenade())
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
			if(((AmmoAmount(1)) > 0) && BotShouldReloadGrenade())
			{
				LoadGrenade();
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
	if(dist > float(700))
	{
		Result += 0.3000000;		
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
	if(dist > float(3000))
	{
		Result -= ((dist - float(3000)) / float(4000));
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

defaultproperties
{
	GrenadeLoadAnim="GrenadeReload"
	GrenOpenSound=Sound'BW_Core_WeaponSound.M50.M50GrenOpen'
	GrenLoadSound=Sound'BW_Core_WeaponSound.M50.M50GrenLoad'
	GrenCloseSound=Sound'BW_Core_WeaponSound.M50.M50GrenClose'
	IronSightBone="IronsFront"
	IronSightBone2="IronsRear"
	IronSightBone3="GLIrons"
	ReflexSightBone="Holo"
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;30.0;0.9;80.0;1.3;1.3;0.0")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.AR23WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.AR23WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.AR23WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.AR23WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.AR23.BigIcon_AR23'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Pullout',Volume=0.2220000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Putaway',Volume=0.2220000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	FullZoomFOV=55.0000000
	bNoCrosshairInScope=true
	SightBobScale=0.3500000
	CockSound=(Sound=Sound'BW_Core_WeaponSound.OA-AR.OA-AR_Cock',Volume=1.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BW_Core_WeaponSound.OA-AR.OA-AR_Cock',Volume=1.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.OA-AR.OA-AR_ClipHit',Volume=1.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.OA-AR.OA-AR_ClipOut',Volume=1.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.OA-AR.OA-AR_ClipIn',Volume=1.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.7000000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.R78InA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc4',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=144,G=116,B=0,A=255),Color2=(R=40,G=44,B=42,A=116),StartSize1=115,StartSize2=116)
	bWT_Bullet=true
	bWT_Splash=true
	bWT_Machinegun=true
	bWT_Projectile=true
	SightOffset=(X=0.5000000,Y=0.0000000,Z=3.9500000)
	MagAmmo=18
	CockingBringUpTime=1.6000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.AR23PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.AR23SecondaryFire'
	PutDownTime=0.7000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	bSniping=true
	Description="Originally designed for boar hunting, the .50 Beowulf Cartridge is a novel yet powerful round that big game hunters across the several galaxies used to take down the biggest of beasties.  Wot Ya Packing was inspired by this big bullet and managed to make an automatic rifle out of it; the AR23 ''Punisher'' Heavy Rifle.  Chambered in the titular .50 Beowulf Cartridge, the AR23 can fire several of these rounds at a rate of fire around 500RPM, not the fastest but more than makes up for it in accuracy.  The AR23 also comes with a customized underslung grenade launcher that specializes in launching 40mm Canister Grenades that can flush bad guys out of their hiding holes like the boars.  When it was released, the AR23 was compared to the Hawk; not a practical weapon for military use and only a niche weapon for paramilitary forces or gun enthusiasts wanting to add to their collection, yet actually became useful for shattering Cryons like a bull in a china shop."
	Priority=62
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=6
	PickupClass=Class'BWBP_SKC_Pro.AR23Pickup'
	PlayerViewOffset=(X=8.0000000,Y=5.0000000,Z=-6.5000000)
	AttachmentClass=Class'BWBP_SKC_Pro.AR23Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.AR23.SmallIcon_AR23'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="AR23 Heavy Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.AR23_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BWBP_SKC_Tex.AR23.AR23-MainShine'
	Skins[2]=Shader'BWBP_SKC_Tex.AR23.AR23-MiscShine'
	Skins[3]=Shader'BWBP_SKC_Tex.AR23.AR23-HoloShine'
	Skins[4]=Texture'BWBP_SKC_Tex.AR23.Muzzle_2D_View'
}
