class M2020GaussDMR extends BallisticWeapon
	config(BallisticProV55);

var(M2020) Emitter LaserDot;
var(M2020) bool bLaserOn;
var(M2020) bool bSuppressed;
var(M2020) bool bOverheat;
var(M2020) Sound DrawSoundLong;
var(M2020) Sound VentingSound;
var(M2020) Sound OverheatSound;
var(M2020) Sound ShieldHitSound;
var(M2020) float HeatLevel;
var(M2020) float MaxHeat;
var(M2020) name BulletBone1;
var(M2020) name BulletBone2;
var(M2020) Actor Arc;
var(M2020) float MagnetSwitchTime;
var(M2020) float MagnetSwitchFireRate;
var(M2020) name MagnetOpenAnim;
var(M2020) name MagnetCloseAnim;
var(M2020) name MagnetForceCloseAnim;
var(M2020) bool bMagnetOpen;
var(M2020) byte PreviousWeaponMode;
var(M2020) ScriptedTexture WeaponScreen;
var(M2020) int NumpadXOffset;
var(M2020) int NumpadYOffset;
var(M2020) Material screen;
var(M2020) Material ScreenBaseX;
var(M2020) Material ScreenBase1;
var(M2020) Material ScreenBase2;
var(M2020) Material Numbers;
var protected const Color MyFontColor;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientScreenStart, ClientSetHeat;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bSuppressed = false;
	// End:0x94
	if(InStr(WeaponParams.LayoutTags, "supp") != -1)
	{
		bSuppressed = true;
		// End:0x94
		if((((int(Role) == int(ROLE_Authority)) && int(CurrentWeaponMode) != 2) && int(CurrentWeaponMode) != 3) && ThirdPersonActor != none)
		{
			M2020GaussAttachment(ThirdPersonActor).SetTracerMode(1);
		}
	}
	//return;	
}

simulated function ClientScreenStart()
{
	ScreenStart();
	//return;	
}

simulated function ScreenStart()
{
	// End:0x22
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Client = self;
	}
	Skins[3] = screen;
	// End:0x52
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	//return;	
}

simulated event Destroyed()
{
	// End:0x36
	if((Instigator != none) && AIController(Instigator.Controller) == none)
	{
		WeaponScreen.Client = none;
	}
	// End:0x4D
	if(Arc != none)
	{
		Arc.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated event RenderTexture(ScriptedTexture Tex)
{
	Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 256.0000000, ScreenBaseX, MyFontColor);
	Tex.DrawTile(100.0000000, 120.0000000, 100.0000000, 160.0000000, float(NumpadXOffset), float(NumpadYOffset), 70.0000000, 60.0000000, Numbers, MyFontColor);
	//return;	
}

simulated function UpdateScreen()
{
	// End:0x28
	if((Instigator != none) && AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x53
	if(bMagnetOpen)
	{
		ScreenBaseX = ScreenBase2;
		Instigator.AmbientSound = VentingSound;		
	}
	else
	{
		ScreenBaseX = ScreenBase1;
		Instigator.AmbientSound = UsedAmbientSound;
	}
	//return;	
}

simulated function bool ConsumeMagAmmo(int Mode, float load, optional bool bAmountNeededIsMax)
{
	// End:0x52
	if(bNoMag || (bFireMode[Mode] != none) && bFireMode[Mode].bUseWeaponMag == false)
	{
		ConsumeAmmo(Mode, load, bAmountNeededIsMax);		
	}
	else
	{
		// End:0x6D
		if(float(MagAmmo) < load)
		{
			MagAmmo = 0;			
		}
		else
		{
			MagAmmo -= int(load);
		}
	}
	UpdateScreen();
	return true;
	//return;	
}

static function Class<Pickup> RecommendAmmoPickup(int Mode)
{
	return Class'BWBP_SKC_Pro.AP_42MachineGun';
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x46
	if((Instigator != none) && AIController(Instigator.Controller) == none)
	{
		ScreenStart();
		// End:0x46
		if(!Instigator.IsLocallyControlled())
		{
			ClientScreenStart();
		}
	}
	bMagnetOpen = false;
	UpdateScreen();
	super.BringUp(PrevWeapon);
	//return;	
}

simulated function bool PutDown()
{
	// End:0x39
	if(super.PutDown())
	{
		// End:0x20
		if(bMagnetOpen)
		{
			bMagnetOpen = false;
			AdjustMagnetProperties();
		}
		// End:0x37
		if(Arc != none)
		{
			Arc.Destroy();
		}
		return true;
	}
	return false;
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x0B
	if(bOverheat)
	{
		return;
	}
	// End:0x37
	if((Level.TimeSeconds < MagnetSwitchTime) || int(ReloadState) != int(0))
	{
		return;
	}
	// End:0x49
	if(int(ClientState) != int(4))
	{
		return;
	}
	bMagnetOpen = !bMagnetOpen;
	ReloadState = 9;
	TemporaryScopeDown(0.4000000);
	MagnetSwitchTime = Level.TimeSeconds + MagnetSwitchFireRate;
	PlayMagnetSwitching(bMagnetOpen);
	AdjustMagnetProperties();
	// End:0xBF
	if(int(Level.NetMode) == int(NM_Client))
	{
		ServerWeaponSpecial(byte(bMagnetOpen));
	}
	//return;	
}

function ServerWeaponSpecial(byte i)
{
	// End:0x0B
	if(bOverheat)
	{
		return;
	}
	bMagnetOpen = bool(i);
	PlayMagnetSwitching(bMagnetOpen);
	AdjustMagnetProperties();
	//return;	
}

simulated function PlayMagnetSwitching(bool bOpen)
{
	// End:0x14
	if(bOpen)
	{
		PlayAnim(MagnetOpenAnim);		
	}
	else
	{
		PlayAnim(MagnetCloseAnim);
	}
	//return;	
}

simulated function Overheat(bool bForceClose)
{
	// End:0x14
	if(bForceClose)
	{
		PlayAnim(MagnetForceCloseAnim);		
	}
	else
	{
		PlayAnim(MagnetCloseAnim);
	}
	ReloadState = 9;
	bMagnetOpen = false;
	MagnetSwitchTime = Level.TimeSeconds + float(5);
	AdjustMagnetProperties();
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 30.0000000, none, Instigator.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'BWBP_SKC_Pro.DT_M2020Overheat');
	//return;	
}

simulated function AdjustMagnetProperties()
{
	// End:0x7B
	if(bMagnetOpen)
	{
		// End:0x38
		if(Arc == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Arc, Class'BWBP_SKC_Pro.M2020ShieldEffect', DrawScale, self, 'tip');
		}
		IdleAnim = 'IdleShield';
		WeaponModes[3].bUnavailable = false;
		PreviousWeaponMode = CurrentWeaponMode;
		CurrentWeaponMode = 3;
		SwitchWeaponMode(byte(int(CurrentWeaponMode) + 1));		
	}
	else
	{
		// End:0x9A
		if(Arc != none)
		{
			Emitter(Arc).Kill();
		}
		IdleAnim = 'Idle';
		Instigator.AmbientSound = UsedAmbientSound;
		CurrentWeaponMode = PreviousWeaponMode;
		SwitchWeaponMode(byte(int(CurrentWeaponMode) + 1));
		WeaponModes[3].bUnavailable = true;
	}
	UpdateScreen();
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	// End:0x1B
	if(bMagnetOpen && int(newmode) != 3)
	{
		return;
	}
	super.ServerSwitchWeaponMode(newmode);
	//return;	
}

simulated event WeaponTick(float dt)
{
	// End:0x21
	if(bOverheat && HeatLevel == 0.2000000)
	{
		Overheat(false);
	}
	super.WeaponTick(dt);
	//return;	
}

simulated event Tick(float dt)
{
	// End:0x1E
	if(bMagnetOpen)
	{
		AddHeat(dt * float(200), false);		
	}
	else
	{
		// End:0x54
		if(HeatLevel > float(0))
		{
			HeatLevel = FMax(HeatLevel - ((dt * float(200)) * 0.4500000), 0.0000000);			
		}
		else
		{
			HeatLevel = 0.0000000;
		}
	}
	super.Tick(dt);
	//return;	
}

simulated event RenderOverlays(Canvas C)
{
	// End:0x1E
	if(MagAmmo == 0)
	{
		NumpadXOffset = 160;
		NumpadYOffset = 10;		
	}
	else
	{
		// End:0x3D
		if(MagAmmo > 10)
		{
			NumpadXOffset = 160;
			NumpadYOffset = 60;			
		}
		else
		{
			NumpadXOffset = 50;
			NumpadYOffset = 10 + ((10 - MagAmmo) * 49);
		}
	}
	// End:0x7E
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	super.RenderOverlays(C);
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

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x53
	if((Anim == MagnetCloseAnim) && int(ReloadState) == int(4))
	{
		ReloadState = 1;
		bMagnetOpen = false;
		AdjustMagnetProperties();
		PlayReload();
	}
	// End:0x7B
	if((Anim == MagnetForceCloseAnim) || Anim == MagnetOpenAnim)
	{
		ReloadState = 0;
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated function PlayReload()
{
	// End:0x26
	if(bMagnetOpen)
	{
		SafePlayAnim(MagnetCloseAnim, 1.2000000,, 0, "RELOAD");		
	}
	else
	{
		super.PlayReload();
	}
	//return;	
}

simulated function CommonStartReload(optional byte i)
{
	local int M;

	// End:0x18
	if(int(ClientState) == int(2))
	{
		ClientState = 4;
	}
	// End:0x2C
	if(bMagnetOpen)
	{
		ReloadState = 4;		
	}
	else
	{
		ReloadState = 1;
	}
	PlayReload();
	// End:0x62
	if(bScopeView && Instigator.IsLocallyControlled())
	{
		TemporaryScopeDown(default.SightingTime);
	}
	M = 0;
	J0x69:

	// End:0xAA [Loop If]
	if(M < 2)
	{
		// End:0xA0
		if(bFireMode[M] != none)
		{
			bFireMode[M].ReloadingGun(i);
		}
		M++;
		// [Loop Continue]
		goto J0x69;
	}
	// End:0xBB
	if(bCockAfterReload)
	{
		bNeedCock = true;
	}
	// End:0xD9
	if(bCockOnEmpty && MagAmmo < 1)
	{
		bNeedCock = true;
	}
	bNeedReload = false;
	//return;	
}

simulated function CommonSwitchWeaponMode(byte newmode)
{
	// End:0xA5
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x47
		if((int(newmode) == 2) && int(newmode) == 3)
		{
			M2020GaussAttachment(ThirdPersonActor).SetTracerMode(0);			
		}
		else
		{
			// End:0x69
			if(bSuppressed)
			{
				M2020GaussAttachment(ThirdPersonActor).SetTracerMode(1);				
			}
			else
			{
				// End:0x8F
				if(int(newmode) == 1)
				{
					M2020GaussAttachment(ThirdPersonActor).SetTracerMode(3);					
				}
				else
				{
					M2020GaussAttachment(ThirdPersonActor).SetTracerMode(2);
				}
			}
		}
	}
	super.CommonSwitchWeaponMode(newmode);
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

simulated function Notify_ClipUp()
{
	SetBoneScale(0, 1.0000000, BulletBone1);
	// End:0x38
	if(Ammo[0].AmmoAmount > 1)
	{
		SetBoneScale(1, 1.0000000, BulletBone2);
	}
	//return;	
}

simulated function Notify_ClipOut()
{
	super.Notify_ClipOut();
	// End:0x23
	if(MagAmmo < 3)
	{
		SetBoneScale(1, 0.0000000, BulletBone2);
	}
	// End:0x40
	if(MagAmmo < 2)
	{
		SetBoneScale(0, 0.0000000, BulletBone1);
	}
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
	return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.5000000, dist, 2048.0000000, 3072.0000000);
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

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	local Vector HitNormal;

	// End:0x16
	if(!DamageType.default.bLocationalHit)
	{
		return;
	}
	// End:0x43
	if((Class<BallisticDamageType>(DamageType) != none) && !Class<BallisticDamageType>(DamageType).default.bMetallic)
	{
		return;
	}
	// End:0xB8
	if(CheckReflect(HitLocation, HitNormal, 0))
	{
		AddHeat(float(Damage) * 2.5000000, false);
		Damage /= float(2);
		Momentum /= float(2);
		M2020GaussAttachment(ThirdPersonActor).BlockEffectCount += byte(1);
		M2020GaussAttachment(ThirdPersonActor).DoBlockEffect();
		PlaySound(ShieldHitSound, 0);
	}
	super.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

function bool CheckReflect(Vector HitLocation, out Vector RefNormal, int AmmoDrain)
{
	local Vector HitDir, FaceDir;

	// End:0x0D
	if(!bMagnetOpen)
	{
		return false;
	}
	FaceDir = Vector(Instigator.Controller.Rotation);
	HitDir = Normal((Instigator.Location - HitLocation) + vect(0.0000000, 0.0000000, 8.0000000));
	RefNormal = FaceDir;
	// End:0x7B
	if((FaceDir Dot HitDir) < -0.3700000)
	{
		return true;
	}
	return false;
	//return;	
}

simulated function AddHeat(float Amount, bool bReplicate)
{
	HeatLevel = FClamp(HeatLevel + Amount, 0.0000000, MaxHeat);
	// End:0x48
	if(bReplicate && !Instigator.IsLocallyControlled())
	{
		ClientSetHeat(HeatLevel);
	}
	// End:0x7D
	if((HeatLevel == MaxHeat) && bMagnetOpen)
	{
		PlaySound(OverheatSound,, 1.7000000,, 32.0000000);
		Overheat(true);
	}
	//return;	
}

simulated function ClientSetHeat(float NewHeat)
{
	HeatLevel = NewHeat;
	// End:0x40
	if((HeatLevel == MaxHeat) && bMagnetOpen)
	{
		PlaySound(OverheatSound,, 1.7000000,, 32.0000000);
		Overheat(true);
	}
	//return;	
}

simulated function float ChargeBar()
{
	return HeatLevel / MaxHeat;
	//return;	
}

defaultproperties
{
	bLaserOn=true
	DrawSoundLong=Sound'BWBP_SKC_Sounds.M2020.M2020-DrawLong'
	VentingSound=Sound'BWBP_SKC_Sounds.M2020.M2020-IdleShield'
	OverheatSound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-Overload'
	ShieldHitSound=ProceduralSound'WeaponSounds.ShieldGun.ShieldReflection'
	MaxHeat=2400.0000000
	BulletBone1="Bullet1"
	BulletBone2="Bullet2"
	MagnetSwitchFireRate=2.0000000
	MagnetOpenAnim="ShieldDeploy"
	MagnetCloseAnim="ShieldUndeploy"
	MagnetForceCloseAnim="Overheat"
	WeaponScreen=ScriptedTexture'BWBP_SKC_Tex.M2020.M2020-ScriptLCD'
	screen=Shader'BWBP_SKC_Tex.M2020.M2020-ScriptLCD-SD'
	ScreenBase1=Texture'BWBP_SKC_Tex.M2020.M2020-Screen'
	ScreenBase2=Texture'BWBP_SKC_Tex.M2020.M2020-ScreenOff'
	Numbers=Texture'BWBP_SKC_Tex.M2020.M2020-Numbers'
	MyFontColor=(R=255,G=255,B=255,A=255)
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;25.0;1.0;80.0;2.0;0.1;0.1")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.M2020WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.M2020WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.M2020WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.M2020WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.M2020.BigIcon_M2020'
	BringUpSound=(Sound=Sound'WeaponSounds.LightningGun.SwitchToLightningGun',Volume=0.1820000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Putaway',Volume=0.1870000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Gauss: Recharge",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Gauss: Power",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Gauss: Offline",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=2,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Gauss: Deflecting",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=2,AimParamsIndex=0)
	CurrentWeaponMode=0
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MinFixedZoomLevel=0.3500000
	MinZoom=2.0000000
	MaxZoom=16.0000000
	ZoomStages=8
	FullZoomFOV=20.0000000
	ScopeViewTex=Texture'BWBP_SKC_Tex.M2020.M2020ScopeView'
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.M2020.M2020-Cock',Volume=1.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_SKC_Sounds.M2020.M2020-CockOld',Volume=1.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ClipHitSound=(Sound=Sound'BWBP_SKC_Sounds.M2020.M2020-MagHit',Volume=1.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.M2020.M2020-MagOut',Volume=1.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.M2020.M2020-MagIn',Volume=1.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M353InA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc6',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=231,G=229,B=207,A=197),Color2=(R=0,G=0,B=226,A=255),StartSize1=77,StartSize2=68)
	bWT_Bullet=true
	ManualLines[0]="Power mode fires a single powerful shot with high recoil and damage. Fire rate is poor.|Recharge mode fires more quickly for greater sustained DPS but lower individual shot power.|Offline mode (or Deflecting mode when the shield is active) has the lowest power, but does not generate a bullet trail."
	ManualLines[1]="Raises the scope."
	ManualLines[2]="The Weapon Function key generates a frontal magnetic deflection shield, locking the rifle to Offline mode. This shield lasts up to 10 seconds and immunizes the user against any frontal attack which is delivered by means of any metal object. ||Effective at long range."
	SightOffset=(X=4.0000000,Y=0.0000000,Z=1.9300000)
	CockingBringUpTime=2.4000000
	GunLength=80.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.M2020GaussPrimaryFire'
	FireModeClass[1]=Class'BCoreProV55.BallisticScopeFire'
	SelectAnimRate=1.4000000
	PutDownTime=0.8000000
	BringUpTime=0.8000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	bShowChargingBar=true
	Description="The M2020 is a 2nd generation Gauss rifle in use by UTC marksmen personnel, currently in the process of being phased out by Enravion 3rd generation M30 models. These 2nd generation Gauss rifles are significantly more portable and powerful than their predecessors, however troops have complained about the M2020 in particular's bulkiness and lack of ergonomics. The rifle itself uses two parallel heavy electromagnets to boost its special 7.62mm rounds to extreme velocities. Charge is variable, and the electromagnets can be disabled at will. |UTC Note: When operating this weapon, keep all metallic objects away from the reciprocaiting chargers. While locking the weapon's magnets open can be fun for pranks, troops are advised to not use it near sensitive military equipment."
	Priority=65
	HudColor=(R=100,G=175,B=255,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=9
	GroupOffset=11
	PickupClass=Class'BWBP_SKC_Pro.M2020GaussPickup'
	PlayerViewOffset=(X=2.0000000,Y=4.5000000,Z=-3.5000000)
	AttachmentClass=Class'BWBP_SKC_Pro.M2020GaussAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.M2020.SmallIcon_M2020'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="M2020 Gauss DMR"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.M2020_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BWBP_SKC_Tex.M2020.M2020-ShineAlt'
	Skins[2]=Shader'BWBP_SKC_Tex.M2020.M2020-Shine'
	bFullVolume=true
	SoundVolume=64
	SoundRadius=128.0000000
}
