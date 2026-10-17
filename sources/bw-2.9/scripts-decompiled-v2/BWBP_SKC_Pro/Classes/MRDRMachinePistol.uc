class MRDRMachinePistol extends BallisticHandgun
	config(BallisticProV55);

var() Sound SlideReleaseSound;
var() Sound ClipOutSound2;

simulated event PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	bUseSights = true;
	//return;	
}

static function Class<Pickup> RecommendAmmoPickup(int Mode)
{
	return Class'BWBP_SKC_Pro.AP_MRDRClip';
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

simulated function float ChargeBar()
{
	return MeleeFatigue;
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x6B
	if((LastFireTime < (Level.TimeSeconds - RcComponent.DeclineDelay)) && MeleeFatigue > float(0))
	{
		MeleeFatigue = FMax(0.0000000, MeleeFatigue - (dt / RcComponent.DeclineTime));
	}
	//return;	
}

simulated function bool HasAmmoLoaded(byte Mode)
{
	// End:0x0F
	if(int(Mode) == 1)
	{
		return true;
	}
	// End:0x27
	if(bNoMag)
	{
		return HasNonMagAmmo(Mode);		
	}
	else
	{
		return HasMagAmmo(Mode);
	}
	//return;	
}

simulated function Notify_MRDRMelee()
{
	// End:0x26
	if(int(Role) == int(ROLE_Authority))
	{
		MRDRSecondaryFire(bFireMode[1]).NotifiedDoFireEffect();
	}
	PlayOwnedSound(bFireMode[1].BallisticFireSound.Sound, bFireMode[1].BallisticFireSound.Slot, bFireMode[1].BallisticFireSound.Volume, bFireMode[1].BallisticFireSound.bNoOverride, bFireMode[1].BallisticFireSound.Radius, bFireMode[1].BallisticFireSound.Pitch, bFireMode[1].BallisticFireSound.bAtten);
	//return;	
}

simulated function Notify_ClipOut2()
{
	PlaySound(ClipOutSound2,, 0.8000000);
	//return;	
}

simulated function Notify_SlideRelease()
{
	PlaySound(SlideReleaseSound,, 0.8000000);
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float dist;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0x4D
	if(!HasAmmoLoaded(0))
	{
		return 1;
	}
	Dir = Instigator.Location - B.Enemy.Location;
	dist = VSize(Dir);
	// End:0x98
	if(dist > float(200))
	{
		return 0;
	}
	// End:0xB6
	if(dist < FireMode[1].MaxRange())
	{
		return 1;
	}
	return byte(Rand(2));
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3500000, dist, 768.0000000, 1536.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.8000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.8000000;
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x41
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		IdleAnim = 'OpenIdle';
		ReloadAnim = 'OpenReload';		
	}
	else
	{
		IdleAnim = 'Idle';
		ReloadAnim = 'Reload';
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0xA4
	if((((Anim == 'OpenFire') || Anim == 'Fire') || Anim == CockAnim) || Anim == ReloadAnim)
	{
		// End:0x8E
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
		{
			IdleAnim = 'OpenIdle';
			ReloadAnim = 'OpenReload';			
		}
		else
		{
			IdleAnim = 'Idle';
			ReloadAnim = 'Reload';
		}
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated state Lowering
{Begin:

	SafePlayAnim(PutDownAnim, 1.7500000, 0.1000000);
	FinishAnim();
	GotoState('Lowered');
	stop;					
}

defaultproperties
{
	SlideReleaseSound=Sound'BW_Core_WeaponSound.M806.M806-ClipHit'
	ClipOutSound2=Sound'BWBP_SKC_Sounds.MRDR.MRDR-ClipRel'
	SupportHandBone="Root 01"
	bShouldDualInLoadout=false
	HandgunGroup=2
	SpecialInfo[0]=(Id="EvoDefs",Info="60.0;3.0;0.1;125.0;0.0;0.2;-999.0")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.MRDRWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.MRDRWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.MRDRWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.MRDRWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.MRDR.BigIcon_MRDR'
	BigIconCoords=(X1=64,Y1=0,X2=511,Y2=255)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Pullout',Volume=0.1500000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway',Volume=0.1480000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Small Burst",bUnavailable=false,ModeID="WM_Burst",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	bUseSights=false
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.MRDR.MRDR-Cock',Volume=0.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.MRDR.MRDR-ClipOut',Volume=0.7000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.MRDR.MRDR-ClipIn',Volume=0.7000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc1',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.A73OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=134,G=255,B=255,A=71),Color2=(R=255,G=228,B=99,A=161),StartSize1=99,StartSize2=33)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.8000000,X2=0.5000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=6.0000000,CurrentScale=0.0000000)
	NDCrosshairChaosFactor=0.3000000
	bWT_Bullet=true
	bWT_Machinegun=true
	ManualLines[0]="Automatic pistol fire. Good strength and low recoil."
	ManualLines[1]="Continuous melee attack. Lower DPS than dedicated melee weapons."
	ManualLines[2]="As a wrist-mounted weapon, it has no iron sights, but possesses superior hip accuracy.||Moderately effective at close range."
	SightPivot=(Pitch=900,Yaw=0,Roll=-800)
	SightOffset=(X=-5.0000000,Y=-0.6000000,Z=7.1000000)
	GunLength=0.1000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.MRDRPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.MRDRSecondaryFire'
	PutDownTime=0.4000000
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	Description="This bullpup style weapon, made by UTC Defense Tech, features a ring magazine holding 36 rounds of 9mm ammunition that wraps around the forearm and has a spiked steel knuckle on it. Because the bulk of the weight sits on the forearm and not on the wrist, this weapon is very easy to use either single or in pairs. With the unique magazine, some users may find reloading this weapon to be challenging, UTC designed an entirely new feed system for this weapon and as such is still in its experimental stages. This DR88 model uses the same Krome muzzle flash system as the Fifty-9 for massive amounts of style."
	Priority=143
	HudColor=(R=150,G=150,B=150,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=3
	GroupOffset=5
	PickupClass=Class'BWBP_SKC_Pro.MRDRPickup'
	PlayerViewOffset=(X=5.0000000,Y=7.0000000,Z=-4.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.MRDRAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.MRDR.SmallIcon_MRDR'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="MR-DR88 Machine Pistol"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=130.0000000
	LightRadius=3.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.MRDR_FPm'
	DrawScale=0.3000000
}
