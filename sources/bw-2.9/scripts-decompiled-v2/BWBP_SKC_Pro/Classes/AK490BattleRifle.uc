class AK490BattleRifle extends BallisticWeapon
	config(BallisticProV55);

var() name KnifeLoadAnim;
var bool bLoaded;
var() bool bHasKnife;
var() name GrenBone;
var() name GrenBoneBase;
var() Sound GrenLoadSound;
var() Sound GrenDropSound;
var() name KnifeBackAnim;
var() name KnifeThrowAnim;
var float NextThrowTime;
var name BulletBone;
var name BulletBone2;

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasKnife = true;
	// End:0x62
	if(InStr(WeaponParams.LayoutTags, "no_knife") != -1)
	{
		bLoaded = false;
		bHasKnife = false;
		AK490MeleeFire(MeleeFireMode).SwitchBladeMode(false);
	}
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x1C
	if(int(MeleeState) >= int(2))
	{
		Momentum *= 0.5000000;
	}
	super.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

simulated function DrawWeaponInfo(Canvas C)
{
	NewDrawWeaponInfo(C, 0.0000000);
	//return;	
}

simulated function NewDrawWeaponInfo(Canvas C, float YPos)
{
	local float ScaleFactor2, ScaleFactor, XL, YL, YL2, SprintFactor;

	local string Temp;
	local int TempNum;

	ScaleFactor = C.ClipX / float(1600);
	ScaleFactor2 = (99.0000000 * C.ClipX) / float(3200);
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	// End:0xF2
	if(bLoaded)
	{
		C.SetPos(C.ClipX - (2.5000000 * ScaleFactor2), C.ClipY - ((float(110) * ScaleFactor) * Class'Engine.HUD'.default.HudScale));
		C.DrawTile(Texture'BWBP_SKC_Tex.AK490.AK490-KnifeIcon', ScaleFactor2 * float(2), ScaleFactor2, 0.0000000, 0.0000000, 256.0000000, 128.0000000);
	}
	DrawCrosshairs(C);
	// End:0x108
	if(bSkipDrawWeaponInfo)
	{
		return;
	}
	ScaleFactor = C.ClipX / float(1600);
	C.Font = GetFontSizeIndex(C, -2 + int(float(2) * Class'Engine.HUD'.default.HudScale));
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	// End:0x240
	if(!bNoMag)
	{
		Temp = GetHUDAmmoText(0);
		C.TextSize(Temp, XL, YL);
		C.CurX = (C.ClipX - ((float(20) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(120) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(Temp, false);
	}
	// End:0x329
	if((Ammo[1] != none) && Ammo[1] != Ammo[0])
	{
		TempNum = Ammo[1].AmmoAmount;
		C.TextSize(Temp, XL, YL);
		C.CurX = (C.ClipX - ((float(160) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(120) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(string(TempNum), false);
	}
	// End:0x477
	if(((int(CurrentWeaponMode) < WeaponModes.Length) && !WeaponModes[int(CurrentWeaponMode)].bUnavailable) && WeaponModes[int(CurrentWeaponMode)].ModeName != "")
	{
		C.Font = GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
		C.TextSize(WeaponModes[int(CurrentWeaponMode)].ModeName, XL, YL2);
		C.CurX = (C.ClipX - ((float(15) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = ((C.ClipY - ((float(130) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL2) - YL;
		C.DrawText(WeaponModes[int(CurrentWeaponMode)].ModeName, false);
	}
	// End:0x60D
	if((SprintControl != none) && SprintControl.Stamina < SprintControl.MaxStamina)
	{
		SprintFactor = SprintControl.Stamina / SprintControl.MaxStamina;
		C.CurX = C.OrgX + ((float(5) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		C.CurY = C.ClipY - ((float(330) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		// End:0x569
		if(SprintFactor < 0.2000000)
		{
			C.SetDrawColor(byte(255), 0, 0);			
		}
		else
		{
			// End:0x592
			if(SprintFactor < 0.5000000)
			{
				C.SetDrawColor(64, 128, byte(255));				
			}
			else
			{
				C.SetDrawColor(0, 0, byte(255));
			}
		}
		C.DrawTile(Texture'Engine.MenuWhite', ((200.0000000 * ScaleFactor) * Class'Engine.HUD'.default.HudScale) * SprintFactor, (30.0000000 * ScaleFactor) * Class'Engine.HUD'.default.HudScale, 0.0000000, 0.0000000, 1.0000000, 1.0000000);
	}
	//return;	
}

simulated function bool IsKnifeLoaded()
{
	return AK490SecondaryFire(FireMode[1]).bLoaded;
	//return;	
}

simulated function bool IsReloadingKnife()
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x27
	if(Anim == KnifeLoadAnim)
	{
		return true;
	}
	return false;
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x41
	if(Anim == KnifeLoadAnim)
	{
		ReloadState = 0;
		IdleTweenTime = 0.0000000;
		PlayIdle();		
	}
	else
	{
		IdleTweenTime = default.IdleTweenTime;
	}
	// End:0xBF
	if(((Anim == 'Fire') || Anim == 'KnifeFire') || Anim == 'ReloadEmpty')
	{
		// End:0xBF
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 2)
		{
			SetBoneScale(2, 0.0000000, BulletBone);
			SetBoneScale(3, 0.0000000, BulletBone2);
		}
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated function LoadKnife()
{
	// End:0x33
	if((Ammo[1].AmmoAmount < 1) || AK490SecondaryFire(FireMode[1]).bLoaded)
	{
		return;
	}
	// End:0x5A
	if(int(ReloadState) == int(0))
	{
		ReloadState = 8;
		PlayAnim(KnifeLoadAnim, 1.1000000,, 0);
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
	if(seq == KnifeLoadAnim)
	{
		return;
	}
	// End:0xA8
	if((int(i) == 1) || (MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
	{
		// End:0xA6
		if(((AmmoAmount(1)) > 0) && !IsReloadingKnife())
		{
			LoadKnife();
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
			if(((AmmoAmount(1)) > 0) && !IsReloadingKnife())
			{
				LoadKnife();
			}			
		}
		else
		{
			CommonStartReload(i);
		}
	}
	//return;	
}

simulated function Notify_BladeLaunch()
{
	SetBoneScale(0, 0.0000000, GrenBone);
	//return;	
}

simulated function Notify_BladeDrop()
{
	PlaySound(GrenDropSound, 1, 1.5000000,, 32.0000000);
	//return;	
}

simulated function Notify_BladeAppear()
{
	SetBoneScale(0, 1.0000000, GrenBone);
	SetBoneScale(1, 1.0000000, GrenBoneBase);
	//return;	
}

simulated function Notify_BladeLoaded()
{
	PlaySound(GrenLoadSound, 1, 1.5000000,, 32.0000000);
	bLoaded = true;
	AK490SecondaryFire(FireMode[1]).bLoaded = true;
	AK490Attachment(ThirdPersonActor).bLoaded = true;
	FireMode[1].PreFireTime = FireMode[1].default.PreFireTime;
	AK490MeleeFire(MeleeFireMode).SwitchBladeMode(AK490SecondaryFire(FireMode[1]).bLoaded);
	//return;	
}

simulated function BladeOut()
{
	bLoaded = false;
	AK490Attachment(ThirdPersonActor).bLoaded = false;
	AK490MeleeFire(MeleeFireMode).SwitchBladeMode(false);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x46
	if(AK490SecondaryFire(FireMode[1]).bLoaded)
	{
		AK490MeleeFire(MeleeFireMode).SwitchBladeMode(AK490SecondaryFire(FireMode[1]).bLoaded);		
	}
	else
	{
		SetBoneScale(0, 0.0000000, GrenBone);
		SetBoneScale(1, 0.0000000, GrenBoneBase);
	}
	// End:0xA9
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		SetBoneScale(2, 0.0000000, BulletBone);
		SetBoneScale(3, 0.0000000, BulletBone2);
	}
	super.BringUp(PrevWeapon);
	//return;	
}

function AttachToPawn(Pawn P)
{
	super(Inventory).AttachToPawn(P);
	// End:0x3A
	if(AK490SecondaryFire(FireMode[1]).bLoaded)
	{
		AK490Attachment(ThirdPersonActor).bLoaded = true;
	}
	//return;	
}

simulated function Notify_ClipUp()
{
	SetBoneScale(2, 1.0000000, BulletBone);
	SetBoneScale(3, 1.0000000, BulletBone2);
	//return;	
}

simulated function Notify_ClipOut()
{
	super.Notify_ClipOut();
	// End:0x35
	if(MagAmmo < 1)
	{
		SetBoneScale(2, 0.0000000, BulletBone);
		SetBoneScale(3, 0.0000000, BulletBone2);
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
	local float dist;

	B = Bot(Instigator.Controller);
	// End:0x4A
	if(((B == none) || B.Enemy == none) || !bHasKnife)
	{
		return 0;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0x9B
	if((dist < float(1024)) && FRand() > 0.7500000)
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.6000000, dist, BallisticInstantFire(bFireMode[0]).DecayRange.Min, BallisticInstantFire(bFireMode[0]).DecayRange.Max);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.0000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.0000000;
	//return;	
}

defaultproperties
{
	KnifeLoadAnim="ReloadKnife"
	bLoaded=true
	GrenBone="KnifeBlade"
	GrenBoneBase="AttachKnife"
	GrenLoadSound=Sound'BWBP_SKC_Sounds.AK47.Knife-Load'
	GrenDropSound=Sound'BWBP_SKC_Sounds.AK47.Knife-Drop'
	BulletBone="Bullet1"
	BulletBone2="Bullet2"
	SpecialInfo[0]=(Id="EvoDefs",Info="320.0;25.0;1.0;110.0;0.5;0.8;0.0")
	AIReloadTime=1.0000000
	SightAnimScale=0.7500000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.AK490WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.AK490WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.AK490WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.AK490WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.AK490.BigIcon_AK490'
	BigIconCoords=(X1=0,Y1=32,X2=511,Y2=220)
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-Draw',Volume=0.2300000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-Putaway',Volume=0.2400000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_None",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-Cock',Volume=3.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-Cock',Volume=3.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ClipHitSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-ClipHit',Volume=3.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-ClipOut',Volume=3.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-ClipIn',Volume=3.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M353OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50In',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=255,G=255,B=255,A=172),Color2=(R=255,G=0,B=0,A=197),StartSize1=71,StartSize2=55)
	MeleeFireClass=Class'BWBP_SKC_Pro.AK490MeleeFire'
	bWT_Bullet=true
	ManualLines[0]="Automatic 7.62mm fire. High sustained damage and long effective range, but high recoil and inferior hipfire controllability."
	ManualLines[1]="If a knife is attached, it will be launched, dealing high damage. The user must hold the fire key for a short time to prepare the knife for launch.||If no knife is attached, one will be attached if available."
	ManualLines[2]="The AK-490 has a melee attack option. The damage is weakened if the knife has been fired.||The Weapon Function key ||This weapon is effective at medium range."
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	SightOffset=(X=-6.5000000,Y=0.0200000,Z=2.5500000)
	CockingBringUpTime=1.6000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.AK490PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.AK490SecondaryFire'
	IdleAnimRate=0.4000000
	SelectAnimRate=1.7000000
	PutDownAnimRate=1.7500000
	BringUpTime=0.4000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7000000
	CurrentRating=0.7000000
	Description="Chambering 7.62mm armor piercing rounds, this rifle is a homage to its distant predecessor, the AK-47. Though the weapons' looks have hardly changed at all, this model features a vastly improved firing mechanism, allowing it to operate in the most punishing of conditions. Equipped with a heavy reinforced stock, launchable ballistic bayonet, and 20 round box mag, this automatic powerhouse is guaranteed to cut through anything in its way. ZVT Exports designed this weapon to be practical and very easy to maintain. With its rugged and reliable design, the AK490 has spread throughout the cosmos and can be found just about anywhere."
	Priority=65
	HudColor=(R=255,G=100,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=4
	GroupOffset=5
	PickupClass=Class'BWBP_SKC_Pro.AK490Pickup'
	PlayerViewOffset=(X=5.0000000,Y=3.5000000,Z=-4.5000000)
	AttachmentClass=Class'BWBP_SKC_Pro.AK490Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.AK490.SmallIcon_AK490'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="AK-490 Assault Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.AK490_FPm'
	DrawScale=0.3000000
}
