class M806Pistol extends BallisticHandgun
	config(BallisticProV55);

var() bool bHasLaser;
var() bool bLaserOn;
var() bool bStriking;
var() LaserActor Laser;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var() Emitter LaserDot;
var() bool bHasShotgun;
var() name ReloadAltAnim;
var() int AltAmmo;
var() FullSound DrumInSound;
var() FullSound DrumOutSound;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		AltAmmo, bLaserOn;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasLaser = true;
	bHasShotgun = false;
	// End:0x4A
	if(InStr(WeaponParams.LayoutTags, "scope") != -1)
	{
		bHasLaser = false;
	}
	// End:0x9D
	if(InStr(WeaponParams.LayoutTags, "shotgun") != -1)
	{
		bHasShotgun = true;
		bHasLaser = false;
		FireMode[1].AmmoClass = Class'BallisticProV55.Ammo_16GaugeleMat';
		SightFXClass = none;		
	}
	else
	{
		AltAmmo = 0;
	}
	//return;	
}

simulated function NewDrawWeaponInfo(Canvas C, float YPos)
{
	local int i, Count;
	local float AmmoDimensions, ScaleFactor, XL, YL, YL2, SprintFactor;

	local string Temp;

	DrawCrosshairs(C);
	ScaleFactor = C.ClipX / float(1600);
	AmmoDimensions = C.ClipY * 0.0600000;
	C.Style = 5;
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	Count = Min(6, AltAmmo);
	i = 0;
	J0x87:

	// End:0x132 [Loop If]
	if(i < Count)
	{
		C.SetPos(C.ClipX - (((0.5000000 * float(i)) + float(1)) * AmmoDimensions), C.ClipY * (float(1) - (0.1200000 * Class'Engine.HUD'.default.HudScale)));
		C.DrawTile(Texture'BW_Core_WeaponTex.Icons.Hud_SGIcon', AmmoDimensions, AmmoDimensions, 0.0000000, 0.0000000, 128.0000000, 128.0000000);
		i++;
		// [Loop Continue]
		goto J0x87;
	}
	// End:0x13D
	if(bSkipDrawWeaponInfo)
	{
		return;
	}
	C.Font = GetFontSizeIndex(C, -2 + int(float(2) * Class'Engine.HUD'.default.HudScale));
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	// End:0x29F
	if(!bNoMag)
	{
		Temp = GetHUDAmmoText(0);
		// End:0x1D3
		if(Temp == "0")
		{
			C.DrawColor = Class'Engine.HUD'.default.RedColor;
		}
		C.TextSize(Temp, XL, YL);
		C.CurX = (C.ClipX - ((float(20) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(120) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(Temp, false);
		C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	}
	// End:0x3C4
	if((Ammo[1] != none) && Ammo[1] != Ammo[0])
	{
		Temp = GetHUDAmmoText(1);
		// End:0x2F8
		if(Temp == "0")
		{
			C.DrawColor = Class'Engine.HUD'.default.RedColor;
		}
		C.TextSize(Temp, XL, YL);
		C.CurX = (C.ClipX - ((float(160) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(120) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(Temp, false);
		C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	}
	// End:0x512
	if(((int(CurrentWeaponMode) < WeaponModes.Length) && !WeaponModes[int(CurrentWeaponMode)].bUnavailable) && WeaponModes[int(CurrentWeaponMode)].ModeName != "")
	{
		C.Font = GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
		C.TextSize(WeaponModes[int(CurrentWeaponMode)].ModeName, XL, YL2);
		C.CurX = (C.ClipX - ((float(15) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = ((C.ClipY - ((float(130) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL2) - YL;
		C.DrawText(WeaponModes[int(CurrentWeaponMode)].ModeName, false);
	}
	// End:0x6A8
	if((SprintControl != none) && SprintControl.Stamina < SprintControl.MaxStamina)
	{
		SprintFactor = SprintControl.Stamina / SprintControl.MaxStamina;
		C.CurX = C.OrgX + ((float(5) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		C.CurY = C.ClipY - ((float(330) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		// End:0x604
		if(SprintFactor < 0.2000000)
		{
			C.SetDrawColor(byte(255), 0, 0);			
		}
		else
		{
			// End:0x62D
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
	// End:0x57
	if((MagAmmo < WeaponParams.MagAmmo) && Ammo[0].AmmoAmount > 0)
	{
		Loadings[0] = 1;
	}
	// End:0x90
	if((bHasShotgun && AltAmmo < 6) && Ammo[1].AmmoAmount > 0)
	{
		Loadings[1] = 1;
	}
	// End:0xB2
	if((int(Loadings[0]) == 0) && int(Loadings[1]) == 0)
	{
		return;
	}
	M = 0;
	J0xB9:

	// End:0x105 [Loop If]
	if(M < 2)
	{
		// End:0xFB
		if((FireMode[M] != none) && FireMode[M].bIsFiring)
		{
			StopFire(M);
		}
		M++;
		// [Loop Continue]
		goto J0xB9;
	}
	bServerReloading = true;
	// End:0x124
	if(int(i) == 1)
	{
		M = 0;		
	}
	else
	{
		M = 1;
	}
	// End:0x159
	if(int(Loadings[int(i)]) == 1)
	{
		ClientStartReload(i);
		CommonStartReload(i);		
	}
	else
	{
		// End:0x186
		if(int(Loadings[M]) == 1)
		{
			ClientStartReload(byte(M));
			CommonStartReload(byte(M));
		}
	}
	// End:0x1C9
	if((BallisticAttachment(ThirdPersonActor) != none) && BallisticAttachment(ThirdPersonActor).ReloadAnim != 'None')
	{
		Instigator.SetAnimAction('ReloadGun');
	}
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	// End:0x44
	if(int(Level.NetMode) == int(NM_Client))
	{
		// End:0x3C
		if((int(i) == 1) && bHasShotgun)
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
	switch(i)
	{
		// End:0x35
		case 0:
			ReloadState = 4;
			PlayReload();
			// End:0x4E
			break;
		// End:0x4B
		case 1:
			ReloadState = 1;
			PlayReloadAlt();
			// End:0x4E
			break;
		// End:0xFFFF
		default:
			break;
	}
	// End:0x76
	if(bScopeView && Instigator.IsLocallyControlled())
	{
		TemporaryScopeDown(default.SightingTime);
	}
	M = 0;
	J0x7D:

	// End:0xBE [Loop If]
	if(M < 2)
	{
		// End:0xB4
		if(bFireMode[M] != none)
		{
			bFireMode[M].ReloadingGun(i);
		}
		M++;
		// [Loop Continue]
		goto J0x7D;
	}
	// End:0xCF
	if(bCockAfterReload)
	{
		bNeedCock = true;
	}
	// End:0xED
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

simulated function Notify_ReloadAltOut()
{
	PlayOwnedSound(DrumOutSound.Sound, DrumOutSound.Slot, DrumOutSound.Volume, DrumOutSound.bNoOverride, DrumOutSound.Radius, DrumOutSound.Pitch, DrumOutSound.bAtten);
	ReloadState = 2;
	//return;	
}

simulated function Notify_ReloadAltIn()
{
	local int AmmoNeeded;

	PlayOwnedSound(DrumInSound.Sound, DrumInSound.Slot, DrumInSound.Volume, DrumInSound.bNoOverride, DrumInSound.Radius, DrumInSound.Pitch, DrumInSound.bAtten);
	ReloadState = 3;
	// End:0xD7
	if(int(Level.NetMode) != int(NM_Client))
	{
		AmmoNeeded = default.AltAmmo - AltAmmo;
		// End:0xB5
		if(AmmoNeeded > Ammo[1].AmmoAmount)
		{
			AltAmmo += Ammo[1].AmmoAmount;			
		}
		else
		{
			AltAmmo = default.AltAmmo;
		}
		Ammo[1].UseAmmo(AmmoNeeded, true);
	}
	//return;	
}

simulated function bool SlaveCanUseMode(int Mode)
{
	// End:0x4F
	if(M806Pistol(OtherGun) != none)
	{
		return (Mode == 0) || (Mode == 1) && Level.TimeSeconds >= FireMode[Mode].NextFireTime;
	}
	return Mode == 0;
	//return;	
}

simulated function bool MasterCanSendMode(int Mode)
{
	// End:0x1A
	if(M806Pistol(OtherGun) != none)
	{
		return Mode < 2;
	}
	return Mode == 0;
	//return;	
}

simulated function bool CanAlternate(int Mode)
{
	// End:0x22
	if((M806Pistol(OtherGun) == none) && Mode != 0)
	{
		return false;		
	}
	else
	{
		// End:0x34
		if(M806Pistol(OtherGun) != none)
		{
			return true;
		}
	}
	return super.CanAlternate(Mode);
	//return;	
}

simulated function PlayIdle()
{
	super(BallisticWeapon).PlayIdle();
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
	super(BallisticWeapon).OnAimParamsChanged();
	// End:0x15
	if(bLaserOn)
	{
		ApplyLaserAim();
	}
	//return;	
}

simulated function ApplyLaserAim()
{
	AimComponent.AimAdjustTime *= 0.6500000;
	AimComponent.AimSpread.Min *= 0.6500000;
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

function ServerWeaponSpecial(optional byte i)
{
	// End:0x18
	if(bServerReloading || !bHasLaser)
	{
		return;
	}
	ServerSwitchLaser(!bLaserOn);
	//return;	
}

function ServerSwitchLaser(bool bNewLaserOn)
{
	// End:0x0D
	if(!bHasLaser)
	{
		return;
	}
	bLaserOn = bNewLaserOn;
	// End:0x40
	if(ThirdPersonActor != none)
	{
		M806Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	OnLaserSwitched();
	// End:0x5E
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
	// End:0x68
	if(!IsInState('DualAction') && !IsInState('PendingDualAction'))
	{
		PlayIdle();
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x4C
	if(((Instigator != none) && Laser == none) && PlayerController(Instigator.Controller) != none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor');
	}
	// End:0x85
	if(((Instigator != none) && LaserDot == none) && PlayerController(Instigator.Controller) != none)
	{
		SpawnLaserDot();
	}
	// End:0xC5
	if(((Instigator != none) && AIController(Instigator.Controller) != none) && bHasLaser)
	{
		ServerSwitchLaser(FRand() > 0.5000000);
	}
	// End:0x11F
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		IdleAnim = 'OpenIdle';
		ReloadAnim = 'OpenReload';
		// End:0x111
		if(AltAmmo < 1)
		{
			ReloadAltAnim = 'ReloadAltOpen';			
		}
		else
		{
			ReloadAltAnim = 'ReloadAlt2Open';
		}		
	}
	else
	{
		IdleAnim = 'Idle';
		ReloadAnim = 'Reload';
		// End:0x14E
		if(AltAmmo < 1)
		{
			ReloadAltAnim = 'ReloadAlt';			
		}
		else
		{
			ReloadAltAnim = 'ReloadAlt2';
		}
	}
	// End:0x17F
	if(ThirdPersonActor != none)
	{
		M806Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
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
		LaserDot = Spawn(Class'BallisticProV55.M806LaserDot',,, loc);
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
			M806Attachment(ThirdPersonActor).bLaserOn = false;
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
	// End:0x15F
	if((((!bStriking && int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x181
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
	}
	Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	Laser.SetLocation(loc);
	HitLocation = ConvertFOVs(End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x275
	if((((!bStriking && int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
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

simulated event RenderOverlays(Canvas Canvas)
{
	super.RenderOverlays(Canvas);
	// End:0x23
	if(!IsInState('Lowered'))
	{
		DrawLaserSight(Canvas);
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x2D
	if(Anim != 'MeleePrep')
	{
		bStriking = false;
	}
	// End:0xF3
	if((((((Anim == 'OpenFire') || Anim == 'Fire') || Anim == CockAnim) || Anim == ReloadAnim) || Anim == DualReloadAnim) || Anim == DualReloadEmptyAnim)
	{
		// End:0xD2
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
		{
			IdleAnim = 'OpenIdle';
			ReloadAnim = 'OpenReload';
			ReloadAltAnim = 'ReloadAltOpen';			
		}
		else
		{
			IdleAnim = 'Idle';
			ReloadAnim = 'Reload';
			ReloadAltAnim = 'ReloadAlt';
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
	local Bot B;
	local float dist, Result;

	// End:0x0E
	if(!bHasShotgun)
	{
		return 0;
	}
	B = Bot(Instigator.Controller);
	// End:0x4B
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0x59
	if(AltAmmo < 1)
	{
		return 0;
	}
	// End:0x67
	if(MagAmmo < 1)
	{
		return 1;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0xAA
	if(dist > float(1700))
	{
		return 0;
	}
	Result = FRand() * 0.5000000;
	Result += (float(1) - (dist / float(1700)));
	// End:0xE5
	if(Result > 0.5000000)
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3500000, dist, 768.0000000, 2048.0000000);
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

defaultproperties
{
	LaserOnSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	LaserOffSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	ReloadAltAnim="ReloadAlt"
	AltAmmo=6
	DrumInSound=(Sound=Sound'BW_Core_WeaponSound.BX5.BX5-SecOn',Volume=0.5000000,Radius=64.0000000,Slot=3,Pitch=1.5000000,bAtten=true,bNoOverride=false)
	DrumOutSound=(Sound=Sound'BW_Core_WeaponSound.BX5.BX5-SecOff',Volume=0.5000000,Radius=64.0000000,Slot=3,Pitch=1.5000000,bAtten=true,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="0.0;8.0;-999.0;25.0;0.0;0.0;-999.0")
	AIReloadTime=1.5000000
	ParamsClasses[0]=Class'BallisticProV55.M806WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.M806WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.M806WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.M806WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_M806'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Pullout',Volume=0.1550000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Putaway',Volume=0.1550000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightFXClass=Class'BallisticProV55.M806SightLEDs'
	bNoCrosshairInScope=true
	SightBobScale=2.0000000
	CockSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M806OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M806InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=192),Color2=(R=255,G=255,B=0,A=255),StartSize1=61,StartSize2=101)
	NDCrosshairInfo=(SpreadRatios=(X1=0.7500000,Y1=0.7500000,X2=0.3000000,Y2=0.3000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=4.0000000,CurrentScale=0.0000000)
	MeleeFireClass=Class'BallisticProV55.M806MeleeFire'
	bWT_Bullet=true
	SightPivot=(Pitch=-110,Yaw=0,Roll=-675)
	SightOffset=(X=-13.0000000,Y=-4.2000000,Z=37.5000000)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3500,Roll=0)
	RootAdjust=(Pitch=3500,Yaw=-375,Roll=0)
	CockingBringUpTime=1.1000000
	FireModeClass[0]=Class'BallisticProV55.M806PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.M806SecondaryFire'
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	Description="M806 High Velocity Pistol||Manufacturer: Enravion Combat Solutions|Primary: Powerful single shot|Secondary: Toggle Laser Sight||The M806 is one of the few sidearms capable of making a full-grown Skrith whimper. Although long used by law enforcment organizations, military forces and ordinary civillians, it gained recognition when an elite commando unit was forced to use it on a difficult mission to disable a heavily armoured, Cryon infantry Division. Poor logistics planning left them with a wealth of ammo for the sidearm and little else, but the pistol was so effective in the mission it quickly grew in favour amongst the UTC Infantry Corps. The M806 is capable of massive damage when targetted at the right area and is a generally reliable, backup weapon. Use of a laser sight turns it into a real weapon by allowing the soldier to accurately direct its powerful bullets."
	Priority=19
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=2
	GroupOffset=8
	PickupClass=Class'BallisticProV55.M806Pickup'
	PlayerViewOffset=(X=0.0000000,Y=6.0000000,Z=-20.0000000)
	AttachmentClass=Class'BallisticProV55.M806Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_M806'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="M806A2 Pistol"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.M806_FPm'
	DrawScale=0.3000000
}
