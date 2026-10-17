class Fifty9MachinePistol extends BallisticHandgun
	config(BallisticProV55);

struct UziBrass
{
	var() Actor Actor;
	var() float KillTime;
};

var bool bStockLocked;
var name StockOpenAnim;
var name StockCloseAnim;
var bool bStockOpen;
var bool bStockOpenRotated;
var int StockChaosAimSpread;
var bool bStriking;
var bool bHasLaser;
var bool bLaserOn;
var LaserActor Laser;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var Emitter LaserDot;
var array<UziBrass> UziBrassList;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLaserOn;
}

simulated function PostBeginPlay()
{
	SetBoneRotation('tip', rot(0, 0, 8192));
	super.PostBeginPlay();
	//return;	
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasLaser = false;
	bStockLocked = false;
	// End:0x4A
	if(InStr(WeaponParams.LayoutTags, "laser") != -1)
	{
		bHasLaser = true;
	}
	// End:0x72
	if(InStr(WeaponParams.LayoutTags, "lock") != -1)
	{
		bStockLocked = true;
	}
	// End:0xC0
	if(InStr(WeaponParams.LayoutTags, "open") != -1)
	{
		bStockOpen = true;
		SetBoneRotation('Stock', rot(32768, 0, 0));
		bStockOpenRotated = true;
		AdjustStockProperties();
	}
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

simulated function float ChargeBar()
{
	return MeleeFatigue;
	//return;	
}

simulated function RenderSightFX(Canvas Canvas)
{
	local Coords C;

	// End:0xDC
	if(SightFX != none)
	{
		C = GetBoneCoords(SightFXBone);
		SightFX.SetLocation(C.Origin);
		// End:0x84
		if(RenderedHand < float(0))
		{
			SightFX.SetRotation(OrthoRotation(C.XAxis, -C.YAxis, C.ZAxis) - rot(0, 0, 8192));			
		}
		else
		{
			SightFX.SetRotation(OrthoRotation(C.XAxis, C.YAxis, C.ZAxis) + rot(0, 0, 8192));
		}
		Canvas.DrawActor(SightFX, false, false, DisplayFOV);
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

static function Class<Pickup> RecommendAmmoPickup(int Mode)
{
	return Class'BallisticProV55.AP_Fifty9Clip';
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	local int i;

	super.RenderOverlays(Canvas);
	// End:0x23
	if(!IsInState('Lowered'))
	{
		DrawLaserSight(Canvas);
	}
	// End:0x31
	if(UziBrassList.Length < 1)
	{
		return;
	}
	bDrawingFirstPerson = true;
	i = UziBrassList.Length - 1;
	J0x48:

	// End:0xF6 [Loop If]
	if(i >= 0)
	{
		// End:0x6C
		if(UziBrassList[i].Actor == none)
		{
			// [Explicit Continue]
			goto J0xEC;
		}
		Canvas.DrawActor(UziBrassList[i].Actor, false, false, Instigator.Controller.FovAngle);
		// End:0xEC
		if(UziBrassList[i].KillTime <= Level.TimeSeconds)
		{
			UziBrassList[i].Actor.bHidden = false;
			UziBrassList.Remove(i, 1);
		}
		J0xEC:

		i--;
		// [Loop Continue]
		goto J0x48;
	}
	bDrawingFirstPerson = false;
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	// End:0x0B
	if(bServerReloading)
	{
		return;
	}
	// End:0x22
	if(bHasLaser)
	{
		ServerSwitchLaser(!bLaserOn);
	}
	// End:0x3B
	if(!bStockLocked)
	{
		SwitchStock(!bStockOpen);
	}
	//return;	
}

simulated function SwitchStock(bool bNewValue)
{
	// End:0x13
	if(bNewValue == bStockOpen)
	{
		return;
	}
	// End:0x2B
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = true;
	}
	ReloadState = 9;
	TemporaryScopeDown(0.4000000);
	SetBoneRotation('Stock', rot(0, 0, 0));
	bStockOpen = bNewValue;
	// End:0x77
	if(bNewValue)
	{
		PlayAnim(StockOpenAnim);		
	}
	else
	{
		PlayAnim(StockCloseAnim);
	}
	AdjustStockProperties();
	//return;	
}

simulated function AdjustStockProperties()
{
	// End:0x12
	if(bStockOpen)
	{
		ApplyStockAim();		
	}
	else
	{
		AimComponent.Recalculate();
	}
	//return;	
}

simulated function ApplyStockAim()
{
	// End:0x11F
	if(bStockOpen)
	{
		AimComponent.CrouchMultiplier *= 0.7000000;
		AimComponent.AimAdjustTime *= 1.5000000;
		AimComponent.AimSpread.Max *= 1.2000000;
		AimComponent.AimSpread.Min *= 1.2000000;
		AimComponent.ChaosDeclineTime *= 1.2000000;
		RcComponent.PitchFactor *= 0.8000000;
		RcComponent.YawFactor *= 0.8000000;
		RcComponent.XRandFactor *= 0.8000000;
		RcComponent.YRandFactor *= 0.8000000;
		RcComponent.CrouchMultiplier *= 0.8000000;
		SightingTime = default.SightingTime * 1.5000000;
		SightBobScale = 0.1500000 * Class'BCoreProV55.BallisticGameStyles'.static.GetReplicatedStyle().default.SightBobScale;		
	}
	else
	{
		SightingTime = default.SightingTime;
		SightBobScale = default.SightBobScale * Class'BCoreProV55.BallisticGameStyles'.static.GetReplicatedStyle().default.SightBobScale;
	}
	//return;	
}

simulated function SetStockRotation()
{
	// End:0x2C
	if(bStockOpen)
	{
		SetBoneRotation('Stock', rot(32768, 0, 0));
		bStockOpenRotated = true;		
	}
	else
	{
		SetBoneRotation('Stock', rot(0, 0, 0));
		bStockOpenRotated = false;
	}
	//return;	
}

simulated function PlayIdle()
{
	// End:0x3B
	if(bStockOpen && !bStockOpenRotated)
	{
		SetStockRotation();
		IdleTweenTime = 0.0000000;
		super(BallisticWeapon).PlayIdle();
		IdleTweenTime = default.IdleTweenTime;		
	}
	else
	{
		// End:0x5A
		if(!bStockOpen && bStockOpenRotated)
		{
			SetStockRotation();			
		}
		else
		{
			super(BallisticWeapon).PlayIdle();
		}
	}
	//return;	
}

simulated function Notify_Fifty9Melee()
{
	// End:0x26
	if(int(Role) == int(ROLE_Authority))
	{
		Fifty9SecondaryFire(bFireMode[1]).NotifiedDoFireEffect();
	}
	PlayOwnedSound(bFireMode[1].BallisticFireSound.Sound, bFireMode[1].BallisticFireSound.Slot, bFireMode[1].BallisticFireSound.Volume, bFireMode[1].BallisticFireSound.bNoOverride, bFireMode[1].BallisticFireSound.Radius, bFireMode[1].BallisticFireSound.Pitch, bFireMode[1].BallisticFireSound.bAtten);
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
	AimComponent.AimAdjustTime *= 0.7500000;
	AimComponent.AimSpread.Max *= 0.6500000;
	AimComponent.AimSpread.Min *= 0.6500000;
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
	if(bLaserOn != default.bLaserOn)
	{
		OnLaserSwitched();
		default.bLaserOn = bLaserOn;
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
		Fifty9Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
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
	// End:0x2C
	if(bLaserOn)
	{
		SpawnLaserDot();
		PlaySound(LaserOnSound,, 0.7000000,, 32.0000000);		
	}
	else
	{
		KillLaserDot();
		PlaySound(LaserOffSound,, 0.7000000,, 32.0000000);
	}
	// End:0x7A
	if((!IsInState('DualAction') && !IsInState('PendingDualAction')) && int(ReloadState) != int(9))
	{
		PlayIdle();
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
	// End:0x20
	if(LaserDot == none)
	{
		LaserDot = Spawn(Class'BallisticProV55.MD24LaserDot',,, loc);
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
			Fifty9Attachment(ThirdPersonActor).bLaserOn = false;
		}
		return true;
	}
	return false;
	//return;	
}

simulated function Destroyed()
{
	default.bLaserOn = false;
	// End:0x1F
	if(Laser != none)
	{
		Laser.Destroy();
	}
	// End:0x36
	if(LaserDot != none)
	{
		LaserDot.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function Vector ConvertFOVs(Vector InVec, float InFOV, float OutFOV, float Distance)
{
	local Vector ViewLoc, Outvec, Dir, X, Y, Z;

	local Rotator ViewRot;

	ViewLoc = Instigator.Location + Instigator.EyePosition();
	ViewRot = Instigator.GetViewRotation();
	Dir = InVec - ViewLoc;
	GetAxes(ViewRot, X, Y, Z);
	Outvec.X = Distance / Tan((OutFOV * 3.1415930) / float(360));
	Outvec.Y = ((Dir Dot Y) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec.Z = ((Dir Dot Z) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec = Outvec >> ViewRot;
	return Outvec + ViewLoc;
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
	// End:0x18B
	if(((((!bStriking && int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000) && (Level.TimeSeconds - FireMode[1].NextFireTime) > 0.2000000)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x1AD
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
	}
	Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	Laser.SetLocation(loc);
	HitLocation = ConvertFOVs(End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x2CD
	if(((((!bStriking && int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000) && (Level.TimeSeconds - FireMode[1].NextFireTime) > 0.2000000)
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		AimDir = GetBoneRotation('tip2');
		Laser.SetRotation(AimDir);
	}
	Scale3D.X = VSize(HitLocation - loc) / float(128);
	Scale3D.Y = 1.0000000;
	Scale3D.Z = 1.0000000;
	Laser.SetDrawScale3D(Scale3D);
	Canvas.DrawActor(Laser, false, false, DisplayFOV);
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3500000, dist, 768.0000000, 2048.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.9000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.9000000;
	//return;	
}

defaultproperties
{
	StockOpenAnim="StockOut"
	StockCloseAnim="StockIn"
	StockChaosAimSpread=2048
	LaserOnSound=Sound'BW_Core_WeaponSound.TEC.RSMP-LaserClick'
	LaserOffSound=Sound'BW_Core_WeaponSound.TEC.RSMP-LaserClick'
	SpecialInfo[0]=(Id="EvoDefs",Info="120.0;10.0;0.8;40.0;0.0;0.4;-999.0")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BallisticProV55.Fifty9WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.Fifty9WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.Fifty9WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.Fifty9WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_Fifty9'
	BigIconCoords=(X1=0,Y1=24,X2=511,Y2=212)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Pullout',Volume=0.1500000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway',Volume=0.1480000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Burst",bUnavailable=false,ModeID="WM_Burst",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightFXClass=Class'BallisticProV55.Fifty9SightLEDs'
	bNoCrosshairInScope=true
	SightBobScale=0.3000000
	CockSound=(Sound=Sound'BW_Core_WeaponSound.UZI.UZI-Cock',Volume=0.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.UZI.UZI-ClipOut',Volume=0.7000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.UZI.UZI-ClipIn',Volume=0.7000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc1',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Cross4',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=114),Color2=(R=255,G=228,B=99,A=255),StartSize1=126,StartSize2=33)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.8000000,X2=0.5000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=6.0000000,CurrentScale=0.0000000)
	NDCrosshairChaosFactor=0.3000000
	bWT_Bullet=true
	bWT_Machinegun=true
	ManualLines[0]="Sprays low caliber bullets. Has an extremely high fire rate and very high DPS, but suffers from recoil and hip stability problems and has low penetration and awful effective range."
	ManualLines[1]="Continually slashes with the attached blade. Damage output is modest and range is low."
	ManualLines[2]="The Fifty-9's stock can be engaged or disengaged with the Weapon Function key. With the stock engaged, the recoil is reduced but the hipfire spread increases. The Fifty-9 is extremely effective at very close range."
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	SightOffset=(X=-10.0000000,Y=0.0000000,Z=3.3000000)
	MagAmmo=25
	FireModeClass[0]=Class'BallisticProV55.Fifty9PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.Fifty9SecondaryFire'
	PutDownTime=0.4000000
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8500000
	CurrentRating=0.8500000
	Description="Krome Firepower is a relatively new arms company created with the aim of producing guns with 'style'. The Fifty-9 is one such weapon. Taking an original small arm, and replacing certain parts, adding new attachments, custom paint jobs, etc. Krome weapons are designed for civilian purposes, self defense, bounty hunters, enthusiasts, and collectors. This particular model comes with attached Krome blades, to add some extra flair to the weapon."
	Priority=31
	HudColor=(R=75,G=125,B=255,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=3
	PickupClass=Class'BallisticProV55.Fifty9Pickup'
	PlayerViewOffset=(X=10.0000000,Y=4.0000000,Z=-6.0000000)
	AttachmentClass=Class'BallisticProV55.Fifty9Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_Fifty9'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="Fifty-9 Machine Pistol"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=130.0000000
	LightRadius=3.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.Fifty9_FPm'
	DrawScale=0.3000000
}
