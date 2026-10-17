class AH104Pistol extends BallisticWeapon
	config(BallisticProV55);

var name ReloadAltAnim;
var() int AltMagAmmo;
var FullSound DrumInSound;
var FullSound DrumOutSound;
var bool bLaserOn;
var LaserActor Laser;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var Emitter LaserDot;
var bool bCamoChoosen;
var bool bFiresound1;
var bool bFiresound2;
var RX22ASpray Flame;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		AltMagAmmo, bLaserOn;
}

function ServerStartReload(optional byte i)
{
	local int M;
	local byte Loadings[2];

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
	// End:0x4E
	if((MagAmmo < default.MagAmmo) && Ammo[0].AmmoAmount > 0)
	{
		Loadings[0] = 1;
	}
	// End:0x7F
	if((AltMagAmmo < default.AltMagAmmo) && Ammo[1].AmmoAmount > 0)
	{
		Loadings[1] = 1;
	}
	// End:0xA1
	if((int(Loadings[0]) == 0) && int(Loadings[1]) == 0)
	{
		return;
	}
	M = 0;
	J0xA8:

	// End:0xF4 [Loop If]
	if(M < 2)
	{
		// End:0xEA
		if((FireMode[M] != none) && FireMode[M].bIsFiring)
		{
			StopFire(M);
		}
		M++;
		// [Loop Continue]
		goto J0xA8;
	}
	bServerReloading = true;
	// End:0x113
	if(int(i) == 1)
	{
		M = 0;		
	}
	else
	{
		M = 1;
	}
	// End:0x148
	if(int(Loadings[int(i)]) == 1)
	{
		ClientStartReload(i);
		CommonStartReload(i);		
	}
	else
	{
		// End:0x175
		if(int(Loadings[M]) == 1)
		{
			ClientStartReload(byte(M));
			CommonStartReload(byte(M));
		}
	}
	// End:0x1B8
	if((BallisticAttachment(ThirdPersonActor) != none) && BallisticAttachment(ThirdPersonActor).ReloadAnim != 'None')
	{
		Instigator.SetAnimAction('ReloadGun');
	}
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	// End:0x39
	if(int(Level.NetMode) == int(NM_Client))
	{
		// End:0x31
		if(int(i) == 1)
		{
			CommonStartReload(1);			
		}
		else
		{
			CommonStartReload(0);
		}
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
	// End:0x36
	if(int(i) == 1)
	{
		ReloadState = 1;
		PlayReloadAlt();		
	}
	else
	{
		ReloadState = 4;
		PlayReload();
	}
	// End:0x6C
	if(bScopeView && Instigator.IsLocallyControlled())
	{
		TemporaryScopeDown(default.SightingTime);
	}
	M = 0;
	J0x73:

	// End:0xB4 [Loop If]
	if(M < 2)
	{
		// End:0xAA
		if(bFireMode[M] != none)
		{
			bFireMode[M].ReloadingGun(i);
		}
		M++;
		// [Loop Continue]
		goto J0x73;
	}
	// End:0xC5
	if(bCockAfterReload)
	{
		bNeedCock = true;
	}
	// End:0xE3
	if(bCockOnEmpty && MagAmmo < 1)
	{
		bNeedCock = true;
	}
	bNeedReload = false;
	//return;	
}

simulated function PlayReloadAlt()
{
	SafePlayAnim(ReloadAltAnim, 1.0000000,, 0, "RELOAD");
	//return;	
}

simulated function Notify_ClipOutOfSight()
{
	SetBoneScale(1, 1.0000000, 'Bullet1');
	SetBoneScale(2, 1.0000000, 'Bullet2');
	//return;	
}

simulated function Notify_HideBullet()
{
	// End:0x1D
	if(MagAmmo < 2)
	{
		SetBoneScale(1, 0.0000000, 'Bullet2');
	}
	// End:0x3A
	if(MagAmmo < 1)
	{
		SetBoneScale(2, 0.0000000, 'Bullet1');
	}
	//return;	
}

simulated function PlayReload()
{
	super.PlayReload();
	// End:0x23
	if(MagAmmo < 2)
	{
		SetBoneScale(1, 0.0000000, 'Bullet2');
	}
	// End:0x40
	if(MagAmmo < 1)
	{
		SetBoneScale(2, 0.0000000, 'Bullet1');
	}
	//return;	
}

simulated function Notify_DrumOut()
{
	PlayOwnedSound(DrumOutSound.Sound, DrumOutSound.Slot, DrumOutSound.Volume, DrumOutSound.bNoOverride, DrumOutSound.Radius, DrumOutSound.Pitch, DrumOutSound.bAtten);
	ReloadState = 2;
	//return;	
}

simulated function Notify_DrumIn()
{
	local int AmmoNeeded;

	PlayOwnedSound(DrumInSound.Sound, DrumInSound.Slot, DrumInSound.Volume, DrumInSound.bNoOverride, DrumInSound.Radius, DrumInSound.Pitch, DrumInSound.bAtten);
	ReloadState = 3;
	// End:0xD7
	if(int(Level.NetMode) != int(NM_Client))
	{
		AmmoNeeded = default.AltMagAmmo - AltMagAmmo;
		// End:0xB5
		if(AmmoNeeded > Ammo[1].AmmoAmount)
		{
			AltMagAmmo += Ammo[1].AmmoAmount;			
		}
		else
		{
			AltMagAmmo = default.AltMagAmmo;
		}
		Ammo[1].UseAmmo(AmmoNeeded, true);
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	local float F;

	// End:0x5F
	if(!bCamoChoosen)
	{
		F = FRand();
		// End:0x2D
		if(F > 0.9000000)
		{
			bFiresound1 = true;			
		}
		else
		{
			// End:0x47
			if(F > 0.5000000)
			{
				bFiresound2 = true;				
			}
			else
			{
				bFiresound2 = false;
				bFiresound1 = false;
			}
		}
		bCamoChoosen = true;
	}
	super.BringUp(PrevWeapon);
	// End:0xAB
	if(((Instigator != none) && Laser == none) && PlayerController(Instigator.Controller) != none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor');
	}
	// End:0xE4
	if(((Instigator != none) && LaserDot == none) && PlayerController(Instigator.Controller) != none)
	{
		SpawnLaserDot();
	}
	// End:0x119
	if((Instigator != none) && AIController(Instigator.Controller) != none)
	{
		ServerSwitchLaser(FRand() > 0.5000000);
	}
	// End:0x13F
	if(ThirdPersonActor != none)
	{
		AH104Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	// End:0x16A
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		ReloadAnim = 'ReloadEmpty';		
	}
	else
	{
		ReloadAnim = 'Reload';
	}
	//return;	
}

simulated function PlayIdle()
{
	super.PlayIdle();
	// End:0x54
	if((((!bLaserOn || bPendingSightUp) || int(SightingState) != int(0)) || bScopeView) || !CanPlayAnim(IdleAnim,, "IDLE"))
	{
		return;
	}
	FreezeAnimAt(0.0000000);
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

simulated function OnAimParamsChanged()
{
	super.OnAimParamsChanged();
	// End:0x15
	if(bLaserOn)
	{
		ApplyLaserAim();
	}
	//return;	
}

simulated function ApplyLaserAim()
{
	AimComponent.AimAdjustTime *= 1.5000000;
	AimComponent.AimSpread.Max *= 0.6500000;
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
		AH104Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
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
	// End:0x26
	if(bLaserOn)
	{
		SpawnLaserDot();
		PlaySound(LaserOnSound,, 3.7000000,, 32.0000000);		
	}
	else
	{
		KillLaserDot();
		PlaySound(LaserOffSound,, 3.7000000,, 32.0000000);
	}
	// End:0x62
	if(!IsInState('DualAction') && !IsInState('PendingDualAction'))
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
		LaserDot = Spawn(Class'BWBP_SKC_Pro.AH104LaserDot',,, loc);
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
			AH104Attachment(ThirdPersonActor).bLaserOn = false;
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
	// End:0x52
	if(Flame != none)
	{
		Flame.bHidden = false;
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
	// End:0x152
	if((((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x174
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
	}
	Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	Laser.SetLocation(loc);
	HitLocation = ConvertFOVs(End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x25B
	if((((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
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

simulated event RenderOverlays(Canvas C)
{
	super.RenderOverlays(C);
	// End:0xAB
	if(Flame != none)
	{
		Flame.SetLocation(ConvertFOVs(GetBoneCoords('tip2').Origin, DisplayFOV, Instigator.Controller.FovAngle, 32.0000000));
		Flame.SetRotation(Rotator(Vector(GetAimPivot() + GetRecoilPivot()) >> (GetPlayerAim())));
		C.DrawActor(Flame, false, false, Instigator.Controller.FovAngle);
	}
	// End:0xC3
	if(!IsInState('Lowered'))
	{
		DrawLaserSight(C);
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x8E
	if((((Anim == 'Fire') || Anim == 'Fire') || Anim == CockAnim) || Anim == ReloadAnim)
	{
		// End:0x83
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
		{
			ReloadAnim = 'ReloadEmpty';			
		}
		else
		{
			ReloadAnim = 'Reload';
		}
	}
	super.AnimEnd(Channel);
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
	return 0.3000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.5000000;
	//return;	
}

simulated function float ChargeBar()
{
	return float(AltMagAmmo) / float(default.AltMagAmmo);
	//return;	
}

defaultproperties
{
	ReloadAltAnim="ReloadAlt"
	AltMagAmmo=50
	DrumInSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-FlameMagIn',Volume=1.1000000,Radius=64.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	DrumOutSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-FlameMagOut',Volume=1.1000000,Radius=64.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	LaserOnSound=Sound'BWBP_SKC_Sounds.AH104.AH104-SightOn'
	LaserOffSound=Sound'BWBP_SKC_Sounds.AH104.AH104-SightOff'
	SpecialInfo[0]=(Id="EvoDefs",Info="120.0;15.0;0.8;70.0;0.75;0.5;0.0")
	AIReloadTime=1.5000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.AH104PistolWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.AH104PistolWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.AH104PistolWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.AH104.BigIcon_AH104'
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-Draw',Volume=0.2000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Putaway',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Laser-Auto",bUnavailable=true,ModeID="WM_Burst",Value=7.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	SightBobScale=0.4000000
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-Cock',Volume=0.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-Cock',Volume=0.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-ClipOut',Volume=0.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-ClipIn',Volume=0.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M806OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.R78InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=192),Color2=(R=255,G=255,B=0,A=255),StartSize1=61,StartSize2=62)
	NDCrosshairInfo=(SpreadRatios=(X1=0.7500000,Y1=0.7500000,X2=0.3000000,Y2=0.3000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=4.0000000,CurrentScale=0.0000000)
	bWT_Bullet=true
	PlayerSpeedFactor=1.0000000
	SightOffset=(X=-11.5000000,Y=0.0000000,Z=2.0300000)
	MagAmmo=7
	CockingBringUpTime=1.5000000
	GunLength=4.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.AH104PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.AH104SecondaryFire'
	PutDownTime=1.0000000
	BringUpTime=1.2000000
	SelectForce="SwitchToAssaultRifle"
	bShowChargingBar=true
	Description="AH-104 'Hellfire' Handcannon||Manufacturer: Enravion Combat Solutions|Primary: HEAP Rounds|Secondary: Underbarrel Flamethrower||'The handcannon of the future.' Those were the words of Enravion as they publically released this modified version of the AM67. Nicknamed the 'Pounder' for its potent .600 explosive armor piercing rounds; the AH104 can legally carry the name handcannon. Its immense stopping power and anti-armor capability make this weapon a favorite of military leaders and personnel across the worlds. The full-steel AH104 is known to be absurdly heavy (12 lbs unloaded) in order to compensate for the power of its large rounds and cannot be dual wielded. The new Hellfire variant has a new under barrel flamethrower in lieu of the standard flash bulb from the original AM67 after hearing stories of the Ice Hogs using makeshift flamethrowers taped to the original AH04 to overheat the Cryons on Kalendra."
	Priority=162
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=2
	GroupOffset=12
	PickupClass=Class'BWBP_SKC_Pro.AH104Pickup'
	PlayerViewOffset=(X=7.0000000,Y=4.5000000,Z=-6.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.AH104Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.AH104.SmallIcon_AH104'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="AH104 Handcannon"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.AH104_FPm'
	DrawScale=0.3000000
}
