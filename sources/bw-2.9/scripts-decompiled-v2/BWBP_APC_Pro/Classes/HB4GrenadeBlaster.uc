class HB4GrenadeBlaster extends BallisticHandgun
	config(BallisticProV55);

simulated function bool MasterCanSendMode(int Mode)
{
	return ((Mode == 0) || OtherGun.Class == Class) || Level.TimeSeconds <= FireMode[1].NextFireTime;
	//return;	
}

simulated function bool CanAlternate(int Mode)
{
	// End:0x0D
	if(Mode != 0)
	{
		return true;
	}
	return super.CanAlternate(Mode);
	//return;	
}

simulated function bool CanSynch(byte Mode)
{
	return false;
	// End:0x11
	if(int(Mode) != 0)
	{
		return false;
	}
	return super.CanSynch(Mode);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x14
	if(bNeedCock)
	{
		BringUpTime = 0.4000000;
	}
	super.BringUp(PrevWeapon);
	BringUpTime = default.BringUpTime;
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x90
	if(Level.TimeSeconds >= FireMode[1].NextFireTime)
	{
		// End:0x61
		if(FireMode[1].bIsFiring)
		{
			return FMin(1.0000000, FireMode[1].HoldTime / FireMode[1].MaxHoldTime);
		}
		return FMin(1.0000000, HB4SecondaryFire(FireMode[1]).DecayCharge / FireMode[1].MaxHoldTime);
	}
	return (FireMode[1].NextFireTime - Level.TimeSeconds) / FireMode[1].FireRate;
	//return;	
}

function byte BestMode()
{
	// End:0x34
	if((Level.TimeSeconds >= FireMode[1].NextFireTime) && FRand() > 0.6000000)
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.5000000, dist, 1536.0000000, 2048.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.7000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.7000000;
	//return;	
}

defaultproperties
{
	bShouldDualInLoadout=false
	SpecialInfo[0]=(Id="EvoDefs",Info="120.0;15.0;0.8;50.0;0.0;0.5;-999.0")
	AIReloadTime=1.5000000
	ParamsClasses[0]=Class'BWBP_APC_Pro.HB4WeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_APC_Pro.HB4WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_APC_Pro.HB4WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_APC_Pro.HB4WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_APC_Tex.HoloBlaster.BigIcon_HoloBlaster'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Pullout',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Putaway',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.R78OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Dot1',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=255,G=255,B=255,A=255),Color2=(R=0,G=255,B=255,A=137),StartSize1=106,StartSize2=47)
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Projectile=true
	ManualLines[0]="High-powered Blaster fire. Recoil is high."
	SightingTime=0.2500000
	SightOffset=(X=10.0000000,Y=0.0400000,Z=7.9500000)
	MagAmmo=3
	CockAnimRate=1.2500000
	CockingBringUpTime=1.2000000
	ReloadAnimRate=1.2500000
	FireModeClass[0]=Class'BWBP_APC_Pro.HB4PrimaryFire'
	FireModeClass[1]=Class'BWBP_APC_Pro.HB4SecondaryFire'
	PutDownTime=0.6000000
	BringUpTime=0.9000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	bShowChargingBar=true
	Description="Maramu Tek might've joined the war against the Skrith late, but their arrival couldn't have come at a better time after the Cryon attack on Neo York.  The situation of having tough armored warriors in an urban situation full of civilians was tough and delicate, if it weren't for Maramu Tek's first offering of the HB4 Grenade Blaster, things would've gone awry very fast. Firing compact stun bolts akin to the Electrobolts that MK781 fires, they disabled the Cyron's intricate wiring systems quickly, and the flash temporarily scrambled their visual processing units, making it handy to have. Neo York was saved while the HB4 went on to perform in situations similar to the Cryon crisis."
	Priority=24
	HudColor=(R=50,G=150,B=25,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=8
	GroupOffset=6
	PickupClass=Class'BWBP_APC_Pro.HB4Pickup'
	PlayerViewOffset=(X=-5.0000000,Y=11.0000000,Z=-13.0000000)
	AttachmentClass=Class'BWBP_APC_Pro.HB4Attachment'
	IconMaterial=Texture'BWBP_APC_Tex.HoloBlaster.SmallIcon_HoloBlaster'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="HB4 Electro Grenade Blaster"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_APC_Anim.HB4_FPm'
	DrawScale=0.3000000
}
