class SARAssaultRifle extends BallisticWeapon
	config(BallisticProV55);

const AUTO_MODE = 0;
const BURST_MODE = 1;

struct UziBrass
{
	var() Actor Actor;
	var() float KillTime;
};

var() name StockOpenAnim;
var() name StockCloseAnim;
var() bool bStockExtended;
var() bool bStockBoneOpen;
var() bool bLockedStock;
var() bool bHasLaserSight;
var() bool bLaserOn;
var() bool bOldLaserOn;
var() bool bStriking;
var() LaserActor Laser;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var Emitter LaserDot;
var bool bHasCombatLaser;
var Emitter LaserBlast;
var() float LaserAmmo;
var() float LaserChargeRate;
var array<UziBrass> UziBrassList;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		LaserAmmo, bLaserOn;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasCombatLaser = false;
	bHasLaserSight = false;
	bLockedStock = false;
	// End:0x59
	if(InStr(WeaponParams.LayoutTags, "combat_laser") != -1)
	{
		bHasCombatLaser = true;
	}
	// End:0x91
	if(InStr(WeaponParams.LayoutTags, "target_laser") != -1)
	{
		bHasLaserSight = true;
		bShowChargingBar = false;
	}
	// End:0xD3
	if(InStr(WeaponParams.LayoutTags, "lock_stock") != -1)
	{
		bLockedStock = true;
		bStockExtended = true;
		SetStockRotation();
		OnStockSwitched();
	}
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x25
	if(bHasCombatLaser)
	{
		return FClamp(LaserAmmo / default.LaserAmmo, 0.0000000, 1.0000000);		
	}
	else
	{
		// End:0xB5
		if(Level.TimeSeconds >= FireMode[1].NextFireTime)
		{
			// End:0x86
			if(FireMode[1].bIsFiring)
			{
				return FMin(1.0000000, FireMode[1].HoldTime / FireMode[1].MaxHoldTime);
			}
			return FMin(1.0000000, SARSecondaryFire(FireMode[1]).DecayCharge / FireMode[1].MaxHoldTime);
		}
		return (FireMode[1].NextFireTime - Level.TimeSeconds) / FireMode[1].FireRate;
	}
	//return;	
}

static function Class<Pickup> RecommendAmmoPickup(int Mode)
{
	return Class'BallisticProV55.AP_SARClip';
	//return;	
}

simulated function OnAimParamsChanged()
{
	super.OnAimParamsChanged();
	// End:0x15
	if(bLaserOn)
	{
		ApplyLaserAim();
	}
	// End:0x24
	if(bStockExtended)
	{
		ApplyStockAim();
	}
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x12
	if(int(ReloadState) != int(0))
	{
		return;
	}
	// End:0x24
	if(int(ClientState) != int(4))
	{
		return;
	}
	// End:0x2F
	if(bLockedStock)
	{
		return;
	}
	SwitchStock(!bStockExtended);
	//return;	
}

simulated function OnStockSwitched()
{
	// End:0x12
	if(bStockExtended)
	{
		ApplyStockAim();		
	}
	else
	{
		AimComponent.Recalculate();
	}
	AdjustStockProperties();
	//return;	
}

simulated function SwitchStock(bool bNewValue)
{
	// End:0x18
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = true;
	}
	ReloadState = 9;
	TemporaryScopeDown(0.4000000);
	// End:0x3C
	if(!bStockExtended)
	{
		SetStockRotation();
	}
	bStockExtended = !bStockExtended;
	// End:0x5C
	if(!bStockExtended)
	{
		SetStockRotation();
	}
	// End:0x70
	if(bStockExtended)
	{
		PlayAnim(StockOpenAnim);		
	}
	else
	{
		PlayAnim(StockCloseAnim);
	}
	OnStockSwitched();
	//return;	
}

simulated function ApplyStockAim()
{
	// End:0x1E
	if(bStockExtended)
	{
		AimComponent.CrouchMultiplier *= 0.7000000;
	}
	//return;	
}

simulated function AdjustStockProperties()
{
	// End:0x4F
	if(bStockExtended)
	{
		LongGunPivot = rot(4000, -12000, 0);
		LongGunOffset = vect(15.0000000, 20.0000000, -7.0000000);
		GunLength = 64.0000000;
		SightingTime = default.SightingTime * 1.2500000;		
	}
	else
	{
		GunLength = default.GunLength;
		LongGunPivot = default.LongGunPivot;
		LongGunOffset = default.LongGunOffset;
		SightingTime = default.SightingTime;
	}
	//return;	
}

simulated function SetStockRotation()
{
	// End:0x31
	if(bStockExtended)
	{
		SetBoneLocation('Stock', vect(-38.4720000, 0.0000000, 0.0000000), 1.0000000);
		bStockBoneOpen = true;		
	}
	else
	{
		SetBoneLocation('Stock', vect(0.0000000, 0.0000000, 0.0000000), 1.0000000);
		bStockBoneOpen = false;
	}
	//return;	
}

simulated function PlayIdle()
{
	// End:0x3B
	if(bStockExtended && !bStockBoneOpen)
	{
		SetStockRotation();
		IdleTweenTime = 0.0000000;
		super.PlayIdle();
		IdleTweenTime = default.IdleTweenTime;		
	}
	else
	{
		// End:0x57
		if(!bStockExtended && bStockBoneOpen)
		{
			SetStockRotation();
		}
		super.PlayIdle();
	}
	// End:0xAB
	if((((!bLaserOn || bPendingSightUp) || int(SightingState) != int(0)) || bScopeView) || !CanPlayAnim(IdleAnim,, "IDLE"))
	{
		return;
	}
	FreezeAnimAt(0.0000000);
	//return;	
}

simulated event Tick(float dt)
{
	super.Tick(dt);
	// End:0x9E
	if(bHasCombatLaser)
	{
		// End:0x6A
		if((LaserAmmo < default.LaserAmmo) && (FireMode[1] == none) || !FireMode[1].IsFiring())
		{
			LaserAmmo = FMin(default.LaserAmmo, LaserAmmo + (dt * LaserChargeRate));
		}
		// End:0x9E
		if(bLaserOn && SARAttachment(ThirdPersonActor) != none)
		{
			SARAttachment(ThirdPersonActor).LaserSizeAdjust = LaserAmmo;
		}
	}
	//return;	
}

simulated function OnLaserSwitched()
{
	// End:0x12
	if(bLaserOn)
	{
		ApplyLaserAim();		
	}
	else
	{
		AimComponent.Recalculate();
	}
	//return;	
}

simulated function ApplyLaserAim()
{
	AimComponent.AimAdjustTime *= 1.5000000;
	AimComponent.AimSpread.Max *= 0.8000000;
	AimComponent.AimSpread.Min *= 0.8000000;
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	// End:0x45
	if(bLaserOn != bOldLaserOn)
	{
		OnLaserSwitched();
		bOldLaserOn = bLaserOn;
		ClientSwitchLaser();
	}
	super(Weapon).PostNetReceive();
	//return;	
}

function ServerSwitchLaser(bool bNewLaserOn)
{
	bLaserOn = bNewLaserOn;
	// End:0x33
	if(ThirdPersonActor != none)
	{
		SARAttachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	OnLaserSwitched();
	// End:0x51
	if(Instigator.IsLocallyControlled())
	{
		ClientSwitchLaser();
	}
	//return;	
}

simulated function ClientSwitchLaser()
{
	OnLaserSwitched();
	// End:0x37
	if(bLaserOn)
	{
		SpawnLaserDot();
		// End:0x34
		if(!bHasCombatLaser)
		{
			PlaySound(LaserOnSound,, 0.7000000,, 32.0000000);
		}		
	}
	else
	{
		KillLaserDot();
		// End:0x5C
		if(!bHasCombatLaser)
		{
			PlaySound(LaserOffSound,, 0.7000000,, 32.0000000);
		}
	}
	PlayIdle();
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x66
	if(((Instigator != none) && Laser == none) && PlayerController(Instigator.Controller) != none)
	{
		// End:0x58
		if(bHasCombatLaser)
		{
			Laser = Spawn(Class'BallisticProV55.LaserActor_GRSNine');			
		}
		else
		{
			Laser = Spawn(Class'BallisticProV55.LaserActor');
		}
	}
	// End:0x9F
	if(((Instigator != none) && LaserDot == none) && PlayerController(Instigator.Controller) != none)
	{
		SpawnLaserDot();
	}
	// End:0xF9
	if(((Instigator != none) && LaserBlast == none) && PlayerController(Instigator.Controller) != none)
	{
		LaserBlast = Spawn(Class'BallisticProV55.GRS9LaserOnFX');
		Class'BCoreProV55.DGVEmitter'.static.ScaleEmitter(LaserBlast, DrawScale);
	}
	// End:0x139
	if(((Instigator != none) && bHasLaserSight) && AIController(Instigator.Controller) != none)
	{
		ServerSwitchLaser(FRand() > 0.5000000);
	}
	// End:0x15F
	if(ThirdPersonActor != none)
	{
		SARAttachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	//return;	
}

simulated function KillLaserDot()
{
	// End:0x21
	if(LaserDot != none)
	{
		LaserDot.Kill();
		LaserDot = none;
	}
	//return;	
}

simulated function SpawnLaserDot(optional Vector loc)
{
	// End:0x65
	if(LaserDot == none)
	{
		// End:0x2C
		if(bHasCombatLaser)
		{
			LaserDot = Spawn(Class'BallisticProV55.IE_GRS9LaserHit',,, loc);			
		}
		else
		{
			LaserDot = Spawn(Class'BallisticProV55.M806LaserDot',,, loc);
		}
		// End:0x65
		if(LaserDot != none)
		{
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(LaserDot, 1.5000000);
		}
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x32
	if(super.PutDown())
	{
		KillLaserDot();
		// End:0x30
		if(ThirdPersonActor != none)
		{
			SARAttachment(ThirdPersonActor).bLaserOn = false;
		}
		return true;
	}
	return false;
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(Laser != none)
	{
		Laser.Destroy();
	}
	// End:0x2E
	if(LaserDot != none)
	{
		LaserDot.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function DrawLaserSight(Canvas Canvas)
{
	local Vector HitLocation, Start, End, HitNormal, Scale3D, loc;

	local Rotator AimDir;
	local Actor Other;

	// End:0x4F
	if(((((int(ClientState) == int(1)) || !bLaserOn) || Instigator == none) || Instigator.Controller == none) || Laser == none)
	{
		return;
	}
	AimDir = BallisticFire(FireMode[0]).GetFireAim(Start);
	loc = GetBoneCoords('tip2').Origin;
	End = Start + (Normal(Vector(AimDir)) * float(5000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	// End:0xE7
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x162
	if((((!bStriking && int(ReloadState) == int(0)) && int(ClientState) == int(4)) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000) && int(ReloadState) != int(9))
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x184
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
	}
	Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	Laser.SetLocation(loc);
	HitLocation = Class'BCoreProV55.BUtil'.static.ConvertFOVs(Instigator.Location + Instigator.EyePosition(), Instigator.GetViewRotation(), End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x30C
	if((((!bStriking && int(ReloadState) == int(0)) && int(ClientState) == int(4)) && (FireMode[0].IsFiring() && (Level.TimeSeconds - FireMode[0].NextFireTime) > -0.0500000) || !FireMode[0].IsFiring() && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000) && int(ReloadState) != int(9))
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		AimDir = GetBoneRotation('tip2');
		Laser.SetRotation(AimDir);
	}
	// End:0x390
	if((LaserBlast != none) && bHasCombatLaser)
	{
		LaserBlast.SetLocation(Laser.Location);
		LaserBlast.SetRotation(Laser.Rotation);
		Canvas.DrawActor(LaserBlast, false, false, DisplayFOV);
	}
	Scale3D.X = VSize(HitLocation - loc) / float(128);
	// End:0x400
	if(bHasCombatLaser)
	{
		Scale3D.Y = 3.0000000 * (float(1) + (float(4) * FMax(0.0000000, LaserAmmo - 0.5000000)));
		Scale3D.Z = Scale3D.Y;		
	}
	else
	{
		Scale3D.Y = 3.0000000;
		Scale3D.Z = 3.0000000;
	}
	Laser.SetDrawScale3D(Scale3D);
	Canvas.DrawActor(Laser, false, false, DisplayFOV);
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	local int i;

	super.RenderOverlays(Canvas);
	DrawLaserSight(Canvas);
	// End:0x24
	if(UziBrassList.Length < 1)
	{
		return;
	}
	bDrawingFirstPerson = true;
	i = UziBrassList.Length - 1;
	J0x3B:

	// End:0xE9 [Loop If]
	if(i >= 0)
	{
		// End:0x5F
		if(UziBrassList[i].Actor == none)
		{
			// [Explicit Continue]
			goto J0xDF;
		}
		Canvas.DrawActor(UziBrassList[i].Actor, false, false, Instigator.Controller.FovAngle);
		// End:0xDF
		if(UziBrassList[i].KillTime <= Level.TimeSeconds)
		{
			UziBrassList[i].Actor.bHidden = false;
			UziBrassList.Remove(i, 1);
		}
		J0xDF:

		i--;
		// [Loop Continue]
		goto J0x3B;
	}
	bDrawingFirstPerson = false;
	//return;	
}

simulated function PlayReload()
{
	// End:0x1C
	if(MagAmmo < 1)
	{
		SetBoneScale(1, 0.0000000, 'Bullet');
	}
	super.PlayReload();
	//return;	
}

simulated function Notify_ClipOutOfSight()
{
	SetBoneScale(1, 1.0000000, 'Bullet');
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.6000000, dist, BallisticInstantFire(bFireMode[0]).DecayRange.Min, BallisticInstantFire(bFireMode[0]).DecayRange.Max);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.4000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.4000000;
	//return;	
}

simulated function bool ReadyToFire(int Mode)
{
	local int alt;

	// End:0x15
	if(Mode == 0)
	{
		alt = 1;		
	}
	else
	{
		alt = 0;
	}
	// End:0x2F
	if(FireMode[Mode] == none)
	{
		return false;
	}
	// End:0xD4
	if(((((FireMode[alt] != none) && FireMode[alt] != FireMode[Mode]) && FireMode[alt].bIsFiring) || !FireMode[Mode].AllowFire()) || FireMode[Mode].NextFireTime > (Level.TimeSeconds + FireMode[Mode].PreFireTime))
	{
		return false;
	}
	return true;
	//return;	
}

defaultproperties
{
	StockOpenAnim="StockOn"
	StockCloseAnim="StockOff"
	LaserOnSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	LaserOffSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	LaserAmmo=1.0000000
	LaserChargeRate=0.1000000
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;25.0;0.8;90.0;0.0;1.0;0.0")
	AIReloadTime=1.0000000
	SightAnimScale=0.6500000
	ParamsClasses[0]=Class'BallisticProV55.SARWeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.SARWeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.SARWeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.SARWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.SAR.BigIcon_SAR12'
	BigIconCoords=(X1=0,Y1=24,X2=511,Y2=250)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Pullout',Volume=0.2100000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway',Volume=0.2080000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_Burst",Value=4.0000000,RecoilParamsIndex=1,AimParamsIndex=1)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightFXClass=Class'BallisticProV55.SARSightDot'
	bNoCrosshairInScope=true
	SightBobScale=0.3000000
	CockSound=(Sound=Sound'BW_Core_WeaponSound.SAR.SAR-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.SAR.SAR-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.SAR.SAR-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.A73OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=128),Color2=(R=255,G=255,B=0,A=255),StartSize1=70,StartSize2=82)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.8000000,X2=0.5000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=6.0000000,CurrentScale=0.0000000)
	MeleeFireClass=Class'BallisticProV55.SARMeleeFire'
	bWT_Bullet=true
	bWT_Machinegun=true
	ManualLines[0]="Automatic 5.56mm fire. Slightly shorter range than full-size assault rifles. Low damage and moderate recoil by default."
	ManualLines[1]="Engages the frontal flash device. Inflicts a medium-duration blind upon enemies. The effect is more potent the closer the foe is both to the point of aim and to the user."
	ManualLines[2]="The Weapon Function key engages or disengages the stock. By default, the stock is engaged. Disengaging the stock grants the SAR-12 superior hipfire and shortens the time taken to aim the weapon, but recoil becomes worse and no stabilization bonus is given for crouching.||Effective at close to medium range, depending upon specialisation."
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	SightOffset=(X=11.0000000,Y=-0.0100000,Z=3.6000000)
	GunLength=16.0000000
	FireModeClass[0]=Class'BallisticProV55.SARPrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.SARSecondaryFire'
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7200000
	CurrentRating=0.7200000
	bShowChargingBar=true
	Description="With a growing number of operations and battles taking place in urban and industial enviroments, the UTC realized that their ground infantry units were in dire need of a more effective, balanced weapon system for indoor combat. UTC soldiers fighting in the close confines of urban structures and industrial installatons needed a highly compact, reliable and manouverable weapon, but it needed the power to blast through light walls and take down the agile alien forces they were faced with.||The result was the development of the Sub-Assault Rifle, the most well known of which is the S-AR 12. These weapons have the power of an assault rifle, usually using rifle ammunition such as 5.56mm rounds, and the manouverability of a compact sub-machinegun. Accuracy was not an issue due to the extremely short range of most of the encounters in urban combat."
	Priority=32
	HudColor=(R=100,G=200,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=4
	GroupOffset=4
	PickupClass=Class'BallisticProV55.SARPickup'
	PlayerViewOffset=(X=8.0000000,Y=9.0000000,Z=-10.0000000)
	AttachmentClass=Class'BallisticProV55.SARAttachment'
	IconMaterial=Texture'BW_Core_WeaponTex.SAR.SmallIcon_SAR12'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="Sub-Assault Rifle 12"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=130.0000000
	LightRadius=3.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.SAR12_FPm'
	DrawScale=0.3000000
	SoundPitch=56
	SoundRadius=32.0000000
}
