class FG50MachineGun extends BallisticWeapon
	config(BallisticProV55);

var(FG50) bool bIsArmorPiercing;
var(FG50) Emitter LaserDot;
var(FG50) LaserActor Laser;
var(FG50) Sound LaserOnSound;
var(FG50) Sound LaserOffSound;
var(FG50) bool bLaserOn;
var bool bStriking;
var(FG50) FG50Heater Heater;
var(FG50) float HeatLevel;
var(FG50) float HeatDeclineDelay;
var(FG50) float HeatDecayRate;
var(FG50) Sound OverheatSound;
var(FG50) bool bDecorativeHeat;
var(FG50) name ScopeBone;
var(FG50) name BulletBone;
var(FG50) int NumpadYOffset1;
var(FG50) int NumpadYOffset2;
var(FG50) ScriptedTexture WeaponScreen;
var(FG50) int ScreenIndex;
var(FG50) Material screen;
var(FG50) Material ScreenBaseX;
var(FG50) Material ScreenBase1;
var(FG50) Material ScreenBase2;
var(FG50) Material ScreenBase3;
var(FG50) Material ScreenBase4;
var(FG50) Material ScreenRedBar;
var(FG50) Material Numbers;
var protected const Color MyFontColor;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientScreenStart, bLaserOn;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bIsArmorPiercing = false;
	// End:0x60
	if(InStr(WeaponParams.LayoutTags, "AP") != -1)
	{
		bIsArmorPiercing = true;
		// End:0x60
		if(ThirdPersonActor != none)
		{
			FG50Attachment(ThirdPersonActor).CurrentTracerMode = 1;
		}
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	local Actor A;

	super.PostNetBeginPlay();
	// End:0x20
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
	{
		bDecorativeHeat = true;
	}
	// End:0x99
	if((Heater == none) || Heater.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(A, Class'BWBP_SKC_Pro.FG50Heater', DrawScale * bFireMode[0].FlashScaleFactor, self, 'tip3');
		Heater = FG50Heater(A);
		Heater.SetHeat(0.0000000);
	}
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	// End:0x3F
	if(bLaserOn != default.bLaserOn)
	{
		default.bLaserOn = bLaserOn;
		ClientSwitchLaser();
	}
	super(Weapon).PostNetReceive();
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
	Skins[ScreenIndex] = screen;
	UpdateScreen();
	// End:0x5B
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x36
	if((Instigator != none) && AIController(Instigator.Controller) == none)
	{
		WeaponScreen.Client = none;
	}
	default.bLaserOn = false;
	// End:0x55
	if(Laser != none)
	{
		Laser.Destroy();
	}
	// End:0x6C
	if(LaserDot != none)
	{
		LaserDot.Destroy();
	}
	// End:0x83
	if(Heater != none)
	{
		Heater.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated event RenderTexture(ScriptedTexture Tex)
{
	Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 128.0000000, 0.0000000, 0.0000000, 256.0000000, 128.0000000, ScreenBaseX, MyFontColor);
	Tex.DrawTile(0.0000000, 45.0000000, 70.0000000, 70.0000000, 45.0000000, float(NumpadYOffset1), 50.0000000, 50.0000000, Numbers, MyFontColor);
	Tex.DrawTile(20.0000000, 45.0000000, 70.0000000, 70.0000000, 40.0000000, float(NumpadYOffset2), 50.0000000, 50.0000000, Numbers, MyFontColor);
	Tex.DrawTile(75.0000000, 110.0000000, HeatLevel * float(12), 10.0000000, 5.0000000, 5.0000000, 10.0000000, 10.0000000, ScreenRedBar, MyFontColor);
	//return;	
}

simulated function UpdateScreen()
{
	// End:0x28
	if((Instigator != none) && AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x4A
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
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

function ServerSwitchLaser(bool bNewLaserOn)
{
	bLaserOn = bNewLaserOn;
	// End:0x33
	if(ThirdPersonActor != none)
	{
		FG50Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	// End:0x4D
	if(!Instigator.IsLocallyControlled())
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
		PlaySound(LaserOnSound,, 0.7000000,, 32.0000000);		
	}
	else
	{
		KillLaserDot();
		PlaySound(LaserOffSound,, 0.7000000,, 32.0000000);
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
	super.BringUp(PrevWeapon);
	// End:0x92
	if(((Instigator != none) && Laser == none) && PlayerController(Instigator.Controller) != none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor');
	}
	// End:0xCB
	if(((Instigator != none) && LaserDot == none) && PlayerController(Instigator.Controller) != none)
	{
		SpawnLaserDot();
	}
	// End:0x101
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		IdleAnim = 'Idle';
		ReloadAnim = 'Reload';		
	}
	else
	{
		IdleAnim = 'Idle';
		ReloadAnim = 'ReloadEmpty';
	}
	// End:0x13D
	if(ThirdPersonActor != none)
	{
		FG50Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	//return;	
}

simulated function PlayReload()
{
	// End:0x19
	if(MagAmmo < 1)
	{
		ReloadAnim = 'ReloadEmpty';		
	}
	else
	{
		ReloadAnim = 'Reload';
	}
	SafePlayAnim(ReloadAnim, ReloadAnimRate,, 0, "RELOAD");
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
			FG50Attachment(ThirdPersonActor).bLaserOn = false;
		}
		return true;
	}
	return false;
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
	// End:0x34
	if(int(CurrentWeaponMode) == 0)
	{
		// End:0x26
		if(MagAmmo == 0)
		{
			ScreenBaseX = ScreenBase4;			
		}
		else
		{
			ScreenBaseX = ScreenBase2;
		}		
	}
	else
	{
		// End:0x4D
		if(MagAmmo == 0)
		{
			ScreenBaseX = ScreenBase3;			
		}
		else
		{
			ScreenBaseX = ScreenBase1;
		}
	}
	NumpadYOffset1 = 5 + ((MagAmmo / 10) * 49);
	NumpadYOffset2 = int(float(5) + ((float(MagAmmo) % float(10)) * float(49)));
	// End:0xB2
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	super.RenderOverlays(Canvas);
	// End:0xD5
	if(!IsInState('Lowered'))
	{
		DrawLaserSight(Canvas);
	}
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	super.ServerSwitchWeaponMode(newmode);
	// End:0x4C
	if(int(CurrentWeaponMode) == 0)
	{
		// End:0x36
		if(SafePlayAnim(IdleAnim, 1.0000000))
		{
			FreezeAnimAt(0.0000000);
		}
		IdleAnimRate = 0.0000000;
		bLaserOn = true;		
	}
	else
	{
		IdleAnimRate = 0.8000000;
		bLaserOn = false;
	}
	// End:0x7B
	if(int(Role) == int(ROLE_Authority))
	{
		ServerSwitchLaser(bLaserOn);
	}
	//return;	
}

simulated function CommonSwitchWeaponMode(byte newmode)
{
	super.CommonSwitchWeaponMode(newmode);
	UpdateScreen();
	//return;	
}

simulated function PlayIdle()
{
	// End:0x16
	if(bFireMode[0].IsFiring())
	{
		return;
	}
	// End:0x28
	if(bPendingSightUp)
	{
		ScopeBackUp();		
	}
	else
	{
		// End:0x59
		if(int(SightingState) != int(0))
		{
			// End:0x56
			if(SafePlayAnim(IdleAnim, 1.0000000))
			{
				FreezeAnimAt(0.0000000);
			}			
		}
		else
		{
			// End:0x83
			if(bScopeView)
			{
				// End:0x80
				if(SafePlayAnim(ZoomOutAnim, 1.0000000))
				{
					FreezeAnimAt(0.0000000);
				}				
			}
			else
			{
				SafeLoopAnim(IdleAnim, IdleAnimRate, IdleTweenTime,, "IDLE");
			}
		}
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

simulated event Tick(float dt)
{
	super.Tick(dt);
	// End:0x7E
	if((HeatLevel > float(0)) && Level.TimeSeconds > (LastFireTime + HeatDeclineDelay))
	{
		HeatLevel = FMax(0.0000000, HeatLevel - (HeatDecayRate * dt));
		// End:0x7E
		if(Heater != none)
		{
			Heater.SetHeat(HeatLevel / float(10));
		}
	}
	//return;	
}

simulated function AddHeat(float Amount)
{
	HeatLevel += Amount;
	// End:0x31
	if(Heater != none)
	{
		Heater.SetHeat(HeatLevel / float(10));
	}
	// End:0xC7
	if(HeatLevel >= float(10))
	{
		HeatLevel = 10.0000000;
		// End:0xC5
		if(!bDecorativeHeat)
		{
			PlaySound(OverheatSound,, 3.7000000,, 32.0000000);
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 25.0000000, Instigator, Instigator.Location, (-Vector(Instigator.GetViewRotation()) * float(30000)) + vect(0.0000000, 0.0000000, 10000.0000000), Class'BWBP_SKC_Pro.DT_FG50Overheat');
		}
		return;
	}
	//return;	
}

simulated function ClientSetHeat(float NewHeat)
{
	HeatLevel = NewHeat;
	//return;	
}

simulated function float ChargeBar()
{
	return HeatLevel / float(10);
	//return;	
}

function InitWeaponFromTurret(BallisticTurret Turret)
{
	bNeedCock = false;
	Ammo[0].AmmoAmount = Turret.AmmoAmount[0];
	// End:0x48
	if(!Instigator.IsLocallyControlled())
	{
		ClientInitWeaponFromTurret(Turret);
	}
	//return;	
}

simulated function ClientInitWeaponFromTurret(BallisticTurret Turret)
{
	bNeedCock = false;
	//return;	
}

simulated function Notify_ClipUp()
{
	SetBoneScale(1, 1.0000000, BulletBone);
	//return;	
}

simulated function Notify_ClipOut()
{
	super.Notify_ClipOut();
	// End:0x23
	if(MagAmmo < 2)
	{
		SetBoneScale(1, 0.0000000, BulletBone);
	}
	//return;	
}

simulated function Notify_ClipIn()
{
	local int AmmoNeeded;

	// End:0x12
	if(int(ReloadState) == int(0))
	{
		return;
	}
	ReloadState = 3;
	PlayOwnedSound(ClipInSound.Sound, ClipInSound.Slot, ClipInSound.Volume, ClipInSound.bNoOverride, ClipInSound.Radius, ClipInSound.Pitch, ClipInSound.bAtten);
	// End:0xE9
	if(int(Level.NetMode) != int(NM_Client))
	{
		AmmoNeeded = default.MagAmmo - MagAmmo;
		// End:0xC7
		if(AmmoNeeded > Ammo[0].AmmoAmount)
		{
			MagAmmo += Ammo[0].AmmoAmount;			
		}
		else
		{
			MagAmmo = default.MagAmmo;
		}
		Ammo[0].UseAmmo(AmmoNeeded, true);
	}
	UpdateScreen();
	//return;	
}

function Notify_Deploy()
{
	local Vector HitLoc, HitNorm, Start, End;
	local Actor t;
	local Rotator CompressedEq;
	local BallisticTurret Turret;
	local float Forward;

	// End:0x12
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x2F
	if(Instigator.HeadVolume.bWaterVolume)
	{
		return;
	}
	Start = Instigator.Location + Instigator.EyePosition();
	Forward = 75.0000000;
	J0x5F:

	// End:0x1D2 [Loop If]
	if(Forward >= float(45))
	{
		End = Start + (Vector(Instigator.Rotation) * Forward);
		t = Trace(HitLoc, HitNorm, End, Start, true, vect(6.0000000, 6.0000000, 6.0000000));
		// End:0xE2
		if((t != none) && VSize(HitLoc - Start) < float(30))
		{
			return;
		}
		// End:0xF8
		if(t == none)
		{
			HitLoc = End;
		}
		End = HitLoc - vect(0.0000000, 0.0000000, 100.0000000);
		t = Trace(HitLoc, HitNorm, End, HitLoc, true, vect(6.0000000, 6.0000000, 6.0000000));
		// End:0x1B4
		if((((t != none) && t.bWorldGeometry && (Sandbag(t) == none) || Sandbag(t).AttachedWeapon == none) && HitNorm.Z >= 0.9000000) && FastTrace(HitLoc, Start))
		{
			// [Explicit Break]
			goto J0x1D2;
		}
		// End:0x1C4
		if(Forward <= float(45))
		{
			return;
		}
		Forward -= float(15);
		// [Loop Continue]
		goto J0x5F;
	}
	J0x1D2:

	FireMode[1].bIsFiring = false;
	FireMode[1].StopFiring();
	// End:0x23D
	if(Sandbag(t) != none)
	{
		HitLoc = t.Location;
		HitLoc.Z += (Class'BWBP_SKC_Pro.FG50Turret'.default.CollisionHeight + float(15));		
	}
	else
	{
		HitLoc.Z += (Class'BWBP_SKC_Pro.FG50Turret'.default.CollisionHeight - float(9));
	}
	CompressedEq = Instigator.Rotation;
	CompressedEq.Pitch = (CompressedEq.Pitch >> 8) & 255;
	CompressedEq.Yaw = (CompressedEq.Yaw >> 8) & 255;
	CompressedEq.Pitch = CompressedEq.Pitch << 8;
	CompressedEq.Yaw = CompressedEq.Yaw << 8;
	Turret = Spawn(Class'BWBP_SKC_Pro.FG50Turret', none,, HitLoc, Instigator.Rotation);
	// End:0x35E
	if(Turret != none)
	{
		// End:0x334
		if(Sandbag(t) != none)
		{
			Sandbag(t).AttachedWeapon = Turret;
		}
		Turret.InitDeployedTurretFor(self);
		Turret.TryToDrive(Instigator);
		Destroy();		
	}
	else
	{
		Log("Notify_Deploy: Could not spawn turret for FG50 Machinegun.");
	}
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
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
	return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.7500000, dist, 1024.0000000, 2048.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.6000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.6000000;
	//return;	
}

defaultproperties
{
	LaserOnSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	LaserOffSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	HeatDeclineDelay=0.4000000
	HeatDecayRate=7.0000000
	OverheatSound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-OverHeat'
	ScopeBone="Holosight"
	BulletBone="Bullet"
	WeaponScreen=ScriptedTexture'BWBP_SKC_Tex.FG50.FG50-ScriptLCD'
	ScreenIndex=3
	screen=Shader'BWBP_SKC_Tex.FG50.FG50-ScriptLCD-SD'
	ScreenBase1=Texture'BWBP_SKC_Tex.FG50.FG50-Screen'
	ScreenBase2=Texture'BWBP_SKC_Tex.FG50.FG50-Screen2'
	ScreenBase3=Texture'BWBP_SKC_Tex.FG50.FG50-Screen3'
	ScreenBase4=Texture'BWBP_SKC_Tex.FG50.FG50-Screen4'
	ScreenRedBar=Texture'BWBP_SKC_Tex.M2020.M2020-ScreenOff'
	Numbers=Texture'BWBP_SKC_Tex.PUMA.PUMA-Numbers'
	MyFontColor=(R=255,G=255,B=255,A=255)
	SpecialInfo[0]=(Id="EvoDefs",Info="320.0;35.0;1.0;100.0;0.8;0.5;0.1")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.FG50WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.FG50WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.FG50WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.FG50WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.FG50.BigIcon_FG50'
	BigIconCoords=(X1=0,Y1=36,X2=511,Y2=225)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Pullout',Volume=0.2220000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Putaway',Volume=0.2220000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Controlled",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=1)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	FullZoomFOV=60.0000000
	bNoCrosshairInScope=true
	SightBobScale=0.4500000
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.AS50.FG50-Cock',Volume=2.5000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.AS50.FG50-DrumOut',Volume=1.5000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.AS50.FG50-DrumIn',Volume=1.5000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M806InA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M353OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=0,B=0,A=255),Color2=(R=58,G=66,B=67,A=255),StartSize1=99,StartSize2=86)
	MeleeFireClass=Class'BWBP_SKC_Pro.FG50MeleeFire'
	bWT_Bullet=true
	ManualLines[0]="Fires powerful explosive rounds. Upon impact with the enemy, these rounds explode, dealing heavy damage to nearby targets. Sustained DPS is massive. Has no penetration ability.|Controlled mode dramatically improves the hipfire at the cost of fire rate. A laser is projected which may give away the user's position."
	ManualLines[1]="Fires more rapidly, but overheats the weapon. An extremely powerful burst attack."
	ManualLines[2]="The FG50 is heavy and restricts movement. However, the weight compensates for a significant amount of recoil. Takes a long time to aim. Effective at medium to long range."
	SightOffset=(X=3.0000000,Y=0.0000000,Z=3.2500000)
	MagAmmo=40
	FireModeClass[0]=Class'BWBP_SKC_Pro.FG50PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.FG50SecondaryFire'
	IdleAnimRate=0.6000000
	PutDownAnimRate=1.2500000
	PutDownTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7500000
	CurrentRating=0.7500000
	bShowChargingBar=true
	Description="The FG50 Heavy Machine Gun is a specialized .50 caliber weapon designed for use on automated weapons platforms and vehicles. Built under contract for the UTC, the NDTR FG50 is the primary weapon for many light assault vehicles and combat drones. An infantry version was developed for UTC's Sub-Orbital Insertion Troops as a high powered combat rifle, after complaints that the current M925 was too bulky to carry and store in Armored Insertion Pods and that the MG33 simply did not pack the punch required to stop a charging Skrith.||Hunter-killer SOIT teams swear by the FG50 now, and praise its ability to fire with precision and accuracy. However ask any veteran and you'll hear many stories about those who disrespected the power of the weapon and foolishly ended up with broken arms and damaged prides. The HMG is not a weapon to toy with."
	Priority=65
	HudColor=(R=255,G=25,B=25,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=6
	GroupOffset=3
	PickupClass=Class'BWBP_SKC_Pro.FG50Pickup'
	PlayerViewOffset=(X=4.0000000,Y=4.0000000,Z=-5.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.FG50Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.FG50.SmallIcon_FG50'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="FG50 Heavy Machinegun"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.FG50_FPm'
	DrawScale=0.3000000
}
