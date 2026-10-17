class LS14Carbine extends BallisticWeapon
	config(BallisticProV55);

struct RevInfo
{
	var() name ShellName;
};

var() ScriptedTexture WeaponScreen;
var() Material WeaponScreenShader;
var() Material ScreenBase;
var() Material ScreenAmmoBlue;
var() Material ScreenAmmoRed;
var() protected const Color MyFontColor;
var() float AmmoBarLeftPos;
var() float AmmoBarRightPos;
var() Sound GrenOpenSound;
var() Sound GrenLoadSound;
var() Sound GrenCloseSound;
var() Sound DoubleVentSound;
var() Sound OverheatSound;
var() Actor GLIndicator;
var() name GrenadeLoadAnim;
var() float GrenadeLoadAnimRate;
var() name SingleGrenadeLoadAnim;
var() name HatchOpenAnim;
var() float HatchOpenAnimRate;
var() name HatchCloseAnim;
var() float HatchCloseAnimRate;
var() name ShovelAnim;
var() float ShovelAnimRate;
var() int Rockets;
var() byte SelfHeatDecayRate;
var() bool bHeatOnce;
var() bool bBarrelsOnline;
var() bool bIsReloadingGrenade;
var() bool bWantsToShoot;
var() bool bOverloaded;
var() float lastModeChangeTime;
var() float SelfHeatLevel;
var() float SelfHeatDeclineTime;
var() Material StabBackTex;
var(Gfx) Color ChargeColor;
var(Gfx) Vector RechargeOrigin;
var(Gfx) Vector RechargeSize;
var() bool bGatling;
var() bool bRapid;
var() bool bHighPower;
var() float ChargeRate;
var() float CoolRate;
var() float LaserCharge;
var() float MaxCharge;
var() bool bIsCharging;
var float DesiredSpeed;
var float BarrelSpeed;
var int BarrelTurn;
var() Sound BarrelSpinSound;
var() Sound BarrelStopSound;
var() Sound BarrelStartSound;
var() Actor HeatSteam;
var() Actor BarrelFlare;
var() Actor BarrelFlareSmall;
var() Actor VentCore;
var() Actor VentBarrel;
var() Actor CoverGlow;
var() RevInfo Shells[3];

replication
{
	// Pos:0x000
	reliable if(bNetOwner && int(Role) == int(ROLE_Authority))
		Rockets;

	// Pos:0x018
	reliable if(int(Role) == int(ROLE_Authority))
		ChargeRate, ClientScreenStart, 
		ClientSetHeat;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bGatling = false;
	bRapid = false;
	bHighPower = false;
	// End:0x99
	if(InStr(WeaponParams.LayoutTags, "backpack") != -1)
	{
		bNoMag = true;
		AmmoClass[0] = Class'BWBP_SKC_Pro.Ammo_HVPCCells';
		LS14PrimaryFire(FireMode[0]).AmmoClass = Class'BWBP_SKC_Pro.Ammo_HVPCCells';
		LS14PrimaryFire(FireMode[0]).DryFireSound.Sound = none;
	}
	// End:0xDF
	if(InStr(WeaponParams.LayoutTags, "rapid") != -1)
	{
		bRapid = true;
		bFullVolume = true;
		SoundVolume = byte(255);
		SoundRadius = 256.0000000;
	}
	// End:0x111
	if(InStr(WeaponParams.LayoutTags, "gatling") != -1)
	{
		bGatling = true;
		Rockets = 0;
	}
	// End:0x13A
	if(InStr(WeaponParams.LayoutTags, "heavy") != -1)
	{
		bHighPower = true;
	}
	//return;	
}

simulated event PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	LS14PrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
	// End:0xC4
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassic())
	{
		LS14PrimaryFire(FireMode[0]).default.HeatPerShot = 0.0000000;
		LS14PrimaryFire(FireMode[0]).default.SelfHeatPerShot = 1.0000000;
		LS14PrimaryFire(FireMode[0]).default.SelfHeatPerShotDouble = 3.5000000;
		LS14PrimaryFire(FireMode[0]).default.SelfHeatDeclineDelay = 0.0000000;
		SelfHeatDecayRate = byte(2.5000000);
		LS14PrimaryFire(FireMode[0]).bAnimatedOverheat = true;
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
	Skins[4] = WeaponScreenShader;
	UpdateScreen();
	// End:0x58
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	//return;	
}

simulated event RenderTexture(ScriptedTexture Tex)
{
	AmmoBarLeftPos = 256.0000000 - ((float(MagAmmo) / 20.0000000) * float(256));
	Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 256.0000000, ScreenBase, MyFontColor);
	// End:0xB5
	if(MagAmmo > 5)
	{
		Tex.DrawTile(0.0000000, AmmoBarLeftPos, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 512.0000000, ScreenAmmoBlue, MyFontColor);		
	}
	else
	{
		Tex.DrawTile(0.0000000, AmmoBarLeftPos, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 512.0000000, ScreenAmmoRed, MyFontColor);
	}
	//return;	
}

simulated function UpdateScreen()
{
	// End:0x22
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

simulated function Notify_ClipIn()
{
	super.Notify_ClipIn();
	UpdateScreen();
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x51
	if((Instigator != none) && AIController(Instigator.Controller) == none)
	{
		ScreenStart();
		// End:0x51
		if(!Instigator.IsLocallyControlled())
		{
			ClientScreenStart();
		}
	}
	// End:0x68
	if(CoverGlow != none)
	{
		CoverGlow.Destroy();
	}
	// End:0xD9
	if((Instigator.IsLocallyControlled() && int(Level.DetailMode) >= int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2)
	{
		CoverGlow = none;
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(CoverGlow, Class'BWBP_SKC_Pro.LS14GlowFX', DrawScale, self, 'BarrelGlow');
	}
	//return;	
}

simulated function AddHeat(float Amount, float OverrideAmount, float DeclineTime)
{
	// End:0x15
	if(bBerserk)
	{
		Amount *= 0.7500000;
	}
	// End:0x31
	if(OverrideAmount == float(0))
	{
		SelfHeatLevel += Amount;		
	}
	else
	{
		SelfHeatLevel = OverrideAmount;
	}
	SelfHeatDeclineTime = FMax(Level.TimeSeconds + DeclineTime, SelfHeatDeclineTime);
	// End:0xE1
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena() || Class'BCoreProV55.BallisticReplicationInfo'.static.IsTactical())
	{
		// End:0xDE
		if(SelfHeatLevel >= 9.7500000)
		{
			SelfHeatLevel = 10.0000000;
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 15.0000000, Instigator, Instigator.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'BWBP_SKC_Pro.DTLS14Overheat');
			return;
		}		
	}
	else
	{
		// End:0x153
		if(SelfHeatLevel >= 6.5000000)
		{
			// End:0x12C
			if(int(CurrentWeaponMode) == 0)
			{
				PlaySound(OverheatSound,, 3.7000000,, 32.0000000);
				BallisticInstantFire(FireMode[0]).FireRate = 0.4000000;
			}
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(HeatSteam, Class'BallisticProV55.RSNovaSteam', DrawScale, self, 'BarrelGlow');			
		}
		else
		{
			// End:0x17F
			if(int(CurrentWeaponMode) == 2)
			{
				BallisticInstantFire(FireMode[0]).FireRate = 0.3000000;				
			}
			else
			{
				BallisticInstantFire(FireMode[0]).FireRate = BallisticInstantFire(FireMode[0]).default.FireRate;
			}
		}
	}
	//return;	
}

simulated function ClientSetHeat(float NewHeat)
{
	SelfHeatLevel = NewHeat;
	//return;	
}

simulated function SetLaserCharge(float NewLaserCharge)
{
	LaserCharge = NewLaserCharge;
	//return;	
}

simulated event Tick(float dt)
{
	local float OldBarrelTurn;

	// End:0x18D
	if(bGatling)
	{
		// End:0x84
		if(FireMode[0].IsFiring())
		{
			BarrelSpeed = BarrelSpeed + FClamp(0.2000000 - BarrelSpeed, -0.2000000 * dt, 0.4000000 * dt);
			BarrelTurn += int((BarrelSpeed * float(655360)) * dt);
			CoolRate = 0.0000000;
			bIsCharging = true;			
		}
		else
		{
			// End:0x16D
			if(BarrelSpeed > float(0))
			{
				BarrelSpeed = FMax(BarrelSpeed - (0.1000000 * dt), 0.0100000);
				OldBarrelTurn = float(BarrelTurn);
				BarrelTurn += int((BarrelSpeed * float(655360)) * dt);
				// End:0x157
				if((BarrelSpeed <= 0.0250000) && int(OldBarrelTurn / 10922.6700000) < int(float(BarrelTurn) / 10922.6700000))
				{
					BarrelTurn = int(float(int(float(BarrelTurn) / 10922.6700000)) * 10922.6700000);
					BarrelSpeed = 0.0000000;
					PlaySound(BarrelStopSound, 0, 0.2000000,, 16.0000000, 1.0000000, true);
				}
				CoolRate = default.CoolRate;
				bIsCharging = false;				
			}
			else
			{
				CoolRate = default.CoolRate;
				bIsCharging = false;
			}
		}
		// End:0x18D
		if(BarrelSpeed > float(0))
		{
		}
	}
	// End:0x1D6
	if((SelfHeatLevel > float(0)) && Level.TimeSeconds > SelfHeatDeclineTime)
	{
		SelfHeatLevel = FMax(SelfHeatLevel - (float(SelfHeatDecayRate) * dt), 0.0000000);
	}
	super.Tick(dt);
	//return;	
}

simulated function LS14_DoubleVent()
{
	// End:0x5B
	if(int(CurrentWeaponMode) == 1)
	{
		AddHeat(-1.0000000, 0.0000000, 0.0000000);
		PlaySound(DoubleVentSound, 1, 0.5000000,, 32.0000000);
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(HeatSteam, Class'BallisticProV55.RSNovaSteam', DrawScale, self, 'BarrelGlow');
	}
	//return;	
}

simulated function LS14Overheat()
{
	AddHeat(0.0000000, 10.0000000, 0.0000000);
	TemporaryScopeDown(0.5000000);
	bOverloaded = true;
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 0.0000000, Instigator, Instigator.Location, (-Vector(Instigator.GetViewRotation()) * float(30000)) + vect(0.0000000, 0.0000000, 10000.0000000), Class'BWBP_SKC_Pro.DTLS14Body');
	FireMode[0].NextFireTime += 4.0000000;
	Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(BarrelFlare, Class'BallisticProV55.HVCMk9MuzzleFlash', DrawScale, self, 'BarrelGlow');
	//return;	
}

simulated function LS14OverheatDbl()
{
	AddHeat(0.0000000, 10.0000000, 0.0000000);
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 0.0000000, Instigator, Instigator.Location, (-Vector(Instigator.GetViewRotation()) * float(30000)) + vect(0.0000000, 0.0000000, 10000.0000000), Class'BWBP_SKC_Pro.DTLS14Body');
	FireMode[0].NextFireTime += 3.0000000;
	Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(VentBarrel, Class'BWBP_SKC_Pro.CoachSteam', DrawScale, self, 'tip');
	Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(HeatSteam, Class'BWBP_SKC_Pro.CoachSteam', DrawScale, self, 'BarrelGlow');
	//return;	
}

simulated function LS14OverheatS2()
{
	// End:0x17
	if(BarrelFlare != none)
	{
		BarrelFlare.Destroy();
	}
	Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(BarrelFlareSmall, Class'BWBP_SKC_Pro.LS14BarrelOverheat', DrawScale, self, 'BarrelGlow');
	//return;	
}

simulated function LS14ForceCool()
{
	AddHeat(0.0000000, 6.0000000, 0.0000000);
	bOverloaded = false;
	Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(HeatSteam, Class'BallisticProV55.RSNovaSteam', DrawScale, self, 'BarrelGlow');
	Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(VentBarrel, Class'BWBP_SKC_Pro.CoachSteam', DrawScale, self, 'tip');
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(BarrelFlare);
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(BarrelFlareSmall);
	//return;	
}

simulated function FirePressed(float F)
{
	// End:0x47
	if((int(ReloadState) == int(5)) || int(ReloadState) == int(6))
	{
		ServerSkipReload();
		// End:0x47
		if(int(Level.NetMode) == int(NM_Client))
		{
			SkipReload();
		}
	}
	// End:0x5B
	if(!HasAmmo())
	{
		OutOfAmmo();		
	}
	else
	{
		// End:0x79
		if(bNeedReload && int(ClientState) == int(4))
		{			
		}
		else
		{
			// End:0xF8
			if(((((int(ReloadState) == int(0)) && bNeedCock) && MagAmmo > 0) && !IsFiring()) && Level.TimeSeconds > FireMode[0].NextFireTime)
			{
				CommonCockGun();
				// End:0xF8
				if(int(Level.NetMode) == int(NM_Client))
				{
					ServerCockGun();
				}
			}
		}
	}
	//return;	
}

simulated function SkipReload()
{
	// End:0x59
	if((int(ReloadState) == int(5)) || int(ReloadState) == int(6))
	{
		// End:0x48
		if(Rockets < 3)
		{
			SetBoneScale(2, 0.0000000, Shells[2].ShellName);
		}
		PlayShovelEnd();
		ReloadState = 7;		
	}
	else
	{
		// End:0x7C
		if(int(ReloadState) == int(1))
		{
			ReloadState = 3;
			SetAnimFrame(ClipInFrame);
		}
	}
	//return;	
}

simulated function DrawWeaponInfo(Canvas C)
{
	NewDrawWeaponInfo(C, 0.7050000 * C.ClipY);
	//return;	
}

simulated function NewDrawWeaponInfo(Canvas C, float YPos)
{
	local int i, Count;
	local float ScaleFactor2, ScaleFactor, XL, YL, YL2, SprintFactor;

	local string Temp;

	super.NewDrawWeaponInfo(C, YPos);
	DrawCrosshairs(C);
	// End:0x26
	if(bSkipDrawWeaponInfo)
	{
		return;
	}
	ScaleFactor = C.ClipX / float(1600);
	C.Font = GetFontSizeIndex(C, -2 + int(float(2) * Class'Engine.HUD'.default.HudScale));
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	// End:0x15E
	if(!bNoMag)
	{
		Temp = GetHUDAmmoText(0);
		C.TextSize(Temp, XL, YL);
		C.CurX = (C.ClipX - ((float(20) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(120) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(Temp, false);
	}
	// End:0x23C
	if((Ammo[1] != none) && Ammo[1] != Ammo[0])
	{
		Temp = GetHUDAmmoText(1);
		C.TextSize(Temp, XL, YL);
		C.CurX = (C.ClipX - ((float(160) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(120) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(Temp, false);
	}
	// End:0x38A
	if(((int(CurrentWeaponMode) < WeaponModes.Length) && !WeaponModes[int(CurrentWeaponMode)].bUnavailable) && WeaponModes[int(CurrentWeaponMode)].ModeName != "")
	{
		C.Font = GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
		C.TextSize(WeaponModes[int(CurrentWeaponMode)].ModeName, XL, YL2);
		C.CurX = (C.ClipX - ((float(15) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = ((C.ClipY - ((float(130) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL2) - YL;
		C.DrawText(WeaponModes[int(CurrentWeaponMode)].ModeName, false);
	}
	// End:0x520
	if((SprintControl != none) && SprintControl.Stamina < SprintControl.MaxStamina)
	{
		SprintFactor = SprintControl.Stamina / SprintControl.MaxStamina;
		C.CurX = C.OrgX + ((float(5) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		C.CurY = C.ClipY - ((float(330) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		// End:0x47C
		if(SprintFactor < 0.2000000)
		{
			C.SetDrawColor(byte(255), 0, 0);			
		}
		else
		{
			// End:0x4A5
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
	ScaleFactor2 = (99.0000000 * C.ClipX) / float(3200);
	C.Style = 5;
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	Count = Min(8, Rockets);
	i = 0;
	J0x588:

	// End:0x634 [Loop If]
	if(i < Count)
	{
		C.SetPos(C.ClipX - (((0.5000000 * float(i)) + float(1)) * ScaleFactor2), C.ClipY - ((float(100) * ScaleFactor) * Class'Engine.HUD'.default.HudScale));
		C.DrawTile(Texture'BWBP_SKC_Tex.LS14.LS14-RocketIcon', ScaleFactor2, ScaleFactor2, 0.0000000, 0.0000000, 128.0000000, 128.0000000);
		i++;
		// [Loop Continue]
		goto J0x588;
	}
	// End:0x6E8
	if(Rockets > 8)
	{
		Count = Min(16, Rockets);
		i = 8;
		J0x657:

		// End:0x6E8 [Loop If]
		if(i < Count)
		{
			C.SetPos(C.ClipX - (((0.5000000 * float(i - 8)) + float(1)) * ScaleFactor2), YPos - ScaleFactor2);
			C.DrawTile(Texture'BWBP_SKC_Tex.LS14.LS14-RocketIcon', ScaleFactor2, ScaleFactor2, 174.0000000, 259.0000000, 46.0000000, 45.0000000);
			i++;
			// [Loop Continue]
			goto J0x657;
		}
	}
	//return;	
}

simulated function DrawScopeOverlays(Canvas Canvas)
{
	local float tileScaleX, tileScaleY, HeatBar, ScaleFactor, barOrgX, barOrgY,
		barSizeX, barSizeY;

	ScaleFactor = Canvas.ClipX / float(1600);
	// End:0x80C
	if(ScopeViewTex != none)
	{
		Canvas.ColorModulate.W = 1.0000000;
		// End:0x22A
		if(int(CurrentWeaponMode) == 1)
		{
			Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
			Canvas.SetPos(Canvas.OrgX, Canvas.OrgY);
			Canvas.DrawTile(Texture'BWBP_SKC_Tex.LS14.LS14ScopeDbl', float(Canvas.SizeX - Canvas.SizeY) / float(2), float(Canvas.SizeY), 0.0000000, 0.0000000, 1.0000000, 1024.0000000);
			Canvas.SetPos(float(Canvas.SizeX - Canvas.SizeY) / float(2), Canvas.OrgY);
			Canvas.DrawTile(Texture'BWBP_SKC_Tex.LS14.LS14ScopeDbl', float(Canvas.SizeY), float(Canvas.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);
			Canvas.SetPos(float(Canvas.SizeX - ((Canvas.SizeX - Canvas.SizeY) / 2)), Canvas.OrgY);
			Canvas.DrawTile(Texture'BWBP_SKC_Tex.LS14.LS14ScopeDbl', float(Canvas.SizeX - Canvas.SizeY) / float(2), float(Canvas.SizeY), 0.0000000, 0.0000000, 1.0000000, 1024.0000000);			
		}
		else
		{
			// End:0x2E0
			if(int(CurrentWeaponMode) == 2)
			{
				Canvas.SetPos(Canvas.OrgX + (Canvas.OrgX / float(4)), Canvas.OrgY + (Canvas.OrgY / float(4)));
				Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
				Canvas.DrawTile(Texture'BWBP_SKC_Tex.LS14.LS14ScopeDbl', 1024.0000000, 1024.0000000, 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);				
			}
			else
			{
				Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
				Canvas.SetPos(Canvas.OrgX, Canvas.OrgY);
				Canvas.DrawTile(ScopeViewTex, float(Canvas.SizeX - Canvas.SizeY) / float(2), float(Canvas.SizeY), 0.0000000, 0.0000000, 1.0000000, 1024.0000000);
				Canvas.SetPos(float(Canvas.SizeX - Canvas.SizeY) / float(2), Canvas.OrgY);
				Canvas.DrawTile(ScopeViewTex, float(Canvas.SizeY), float(Canvas.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);
				Canvas.SetPos(float(Canvas.SizeX - ((Canvas.SizeX - Canvas.SizeY) / 2)), Canvas.OrgY);
				Canvas.DrawTile(ScopeViewTex, float(Canvas.SizeX - Canvas.SizeY) / float(2), float(Canvas.SizeY), 0.0000000, 0.0000000, 1.0000000, 1024.0000000);
			}
		}
		Canvas.Font = GetFontSizeIndex(Canvas, -2 + int(float(2) * Class'Engine.HUD'.default.HudScale));
		// End:0x56C
		if((Canvas.ClipX / Canvas.ClipY) > 1.4000000)
		{
			Canvas.SetPos(float(Canvas.SizeX) * 0.5490000, float(Canvas.SizeY) * 0.6890000);
			Canvas.DrawText(string(Rockets), false);			
		}
		else
		{
			Canvas.SetPos(float(Canvas.SizeX) * 0.5600000, float(Canvas.SizeY) * 0.7000000);
			Canvas.DrawText(string(Rockets) $ "R", false);
		}
		HeatBar = SelfHeatLevel / float(10);
		barOrgX = RechargeOrigin.X * tileScaleX;
		barOrgY = RechargeOrigin.Y * tileScaleY;
		barSizeX = RechargeSize.X * tileScaleX;
		barSizeY = RechargeSize.Y * tileScaleY;
		Canvas.DrawColor = ChargeColor;
		Canvas.DrawColor.A = byte(255);
		// End:0x689
		if(HeatBar < float(1))
		{
			Canvas.DrawColor.R = byte(float(255) * HeatBar);
		}
		// End:0x6B1
		if(HeatBar == float(0))
		{
			Canvas.DrawColor.G = byte(255);			
		}
		else
		{
			Canvas.DrawColor.G = 0;
		}
		Canvas.Style = 5;
		// End:0x740
		if((Canvas.ClipX / Canvas.ClipY) > 1.5000000)
		{
			Canvas.SetPos(float(Canvas.SizeX) * 0.3660000, float(Canvas.SizeY) * 0.6510000);			
		}
		else
		{
			Canvas.SetPos(float(Canvas.SizeX) * 0.3160000, float(Canvas.SizeY) * 0.6450000);
		}
		Canvas.DrawTile(Texture'Engine.WhiteTexture', 1.0000000 + (float(100) * HeatBar), 15.0000000, 0.0000000, 0.0000000, float(Texture'Engine.WhiteTexture'.USize) * HeatBar, float(Texture'Engine.WhiteTexture'.VSize));
		// End:0x7ED
		if(BarrelFlare != none)
		{
			BarrelFlare.Destroy();
		}
		// End:0x804
		if(BarrelFlareSmall != none)
		{
			BarrelFlareSmall.Destroy();
		}
		bOverloaded = false;
	}
	//return;	
}

simulated event DrawElectro(Canvas C)
{
	C.SetPos(C.OrgX, C.OrgY);
	C.DrawTile(TexPanner'BWBP_SKC_Tex.LS14.ElectroShock', float(C.SizeX), float(C.SizeY), 0.0000000, 0.0000000, 512.0000000, 512.0000000);
	//return;	
}

function int ManageHeatInteraction(Pawn P, int HeatPerShot)
{
	local LS14HeatManager HM;
	local int HeatBonus;

	// End:0x1D
	foreach P.BasedActors(Class'BWBP_SKC_Pro.LS14HeatManager', HM)
	{
		// End:0x1D
		break;		
	}	
	// End:0x6B
	if(HM == none)
	{
		HM = Spawn(Class'BWBP_SKC_Pro.LS14HeatManager', P,, P.Location + vect(0.0000000, 0.0000000, -30.0000000));
		HM.SetBase(P);
	}
	// End:0xCF
	if(HM != none)
	{
		HeatBonus = int(HM.Heat);
		// End:0xB9
		if(Vehicle(P) != none)
		{
			HM.AddHeat(float(HeatPerShot / 4));			
		}
		else
		{
			HM.AddHeat(float(HeatPerShot));
		}
	}
	return HeatBonus;
	//return;	
}

simulated function UpdateGLIndicator()
{
	// End:0x16
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	// End:0x61
	if(LS14SecondaryFire(FireMode[1]).bLoaded)
	{
		// End:0x5E
		if(GLIndicator == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GLIndicator, Class'BallisticProV55.M50GLIndicator', DrawScale, self, 'tip');
		}		
	}
	else
	{
		// End:0x7F
		if(GLIndicator != none)
		{
			GLIndicator.Destroy();
			GLIndicator = none;
		}
	}
	//return;	
}

simulated function LS14HatchOpen()
{
	PlaySound(GrenOpenSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function LS14RocketsIn()
{
	PlaySound(GrenLoadSound, 1, 0.5000000,, 64.0000000);
	LS14SecondaryFire(FireMode[1]).bLoaded = true;
	UpdateGLIndicator();
	Rockets = 3;
	ReloadState = 3;
	//return;	
}

simulated function LS14HatchClose()
{
	ReloadState = 7;
	PlaySound(GrenCloseSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function LS14RocketIn()
{
	PlaySound(GrenLoadSound, 1, 0.5000000,, 64.0000000);
	UpdateGLIndicator();
	ReloadState = 6;
	// End:0x4E
	if(int(Role) == int(ROLE_Authority))
	{
		Rockets += 1;
		Ammo[1].UseAmmo(1, true);
	}
	//return;	
}

simulated function bool IsGrenadeLoaded()
{
	return LS14SecondaryFire(FireMode[1]).bLoaded;
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x39
	if(Anim == SingleGrenadeLoadAnim)
	{
		IdleTweenTime = 0.0000000;
		PlayIdle();		
	}
	else
	{
		IdleTweenTime = default.IdleTweenTime;
	}
	// End:0xB2
	if(int(ReloadState) == int(6))
	{
		// End:0x88
		if((Rockets == 3) || Ammo[1].AmmoAmount == 0)
		{
			PlayShovelEnd();
			ReloadState = 7;
			return;
		}
		ReloadState = 5;
		SetBoneScale(2, 1.0000000, Shells[2].ShellName);
		PlayShovelLoop();
		return;
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated function LoadGrenade()
{
	// End:0x34
	if((Ammo[1].AmmoAmount < 3) || LS14SecondaryFire(FireMode[1]).bLoaded)
	{
		return;
	}
	// End:0x6B
	if(int(ReloadState) == int(0))
	{
		PlayAnim(HatchOpenAnim, HatchOpenAnimRate * Class'BCoreProV55.BallisticReplicationInfo'.default.ReloadScale,, 0);
		ReloadState = 1;
	}
	//return;	
}

simulated function LoadGrenadeLoop()
{
	// End:0x18
	if(Ammo[1].AmmoAmount < 1)
	{
		return;
	}
	// End:0x4F
	if(int(ReloadState) == int(0))
	{
		PlayAnim(HatchOpenAnim, HatchOpenAnimRate * Class'BCoreProV55.BallisticReplicationInfo'.default.ReloadScale,, 0);
		ReloadState = 4;
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
		ReloadState = 4;
		PlayReloadAlt();		
	}
	else
	{
		ReloadState = 1;
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
	SafePlayAnim(StartShovelAnim, StartShovelAnimRate,, 0, "RELOAD");
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
	// End:0x4E
	if((MagAmmo < default.MagAmmo) && Ammo[0].AmmoAmount > 0)
	{
		Loadings[0] = 1;
	}
	// End:0x89
	if(((Rockets < 3) && Ammo[1].AmmoAmount > 0) && !bGatling)
	{
		Loadings[1] = 1;
	}
	// End:0xAB
	if((int(Loadings[0]) == 0) && int(Loadings[1]) == 0)
	{
		return;
	}
	M = 0;
	J0xB2:

	// End:0xFE [Loop If]
	if(M < 2)
	{
		// End:0xF4
		if((FireMode[M] != none) && FireMode[M].bIsFiring)
		{
			StopFire(M);
		}
		M++;
		// [Loop Continue]
		goto J0xB2;
	}
	bServerReloading = true;
	// End:0x11D
	if(int(i) == 1)
	{
		M = 0;		
	}
	else
	{
		M = 1;
	}
	// End:0x152
	if(int(Loadings[int(i)]) == 1)
	{
		ClientStartReload(i);
		CommonStartReload(i);		
	}
	else
	{
		// End:0x17F
		if(int(Loadings[M]) == 1)
		{
			ClientStartReload(byte(M));
			CommonStartReload(byte(M));
		}
	}
	// End:0x1C2
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

simulated function bool CheckWeaponMode(int Mode)
{
	// End:0x14
	if(Mode == 1)
	{
		return FireCount < 1;
	}
	return super.CheckWeaponMode(Mode);
	//return;	
}

simulated function bool PutDown()
{
	// End:0x37
	if(super.PutDown())
	{
		// End:0x20
		if(BarrelFlare != none)
		{
			BarrelFlare.Destroy();
		}
		// End:0x37
		if(BarrelFlareSmall != none)
		{
			BarrelFlareSmall.Destroy();
		}
	}
	bOverloaded = false;
	return false;
	//return;	
}

simulated function Destroyed()
{
	// End:0x36
	if((Instigator != none) && AIController(Instigator.Controller) == none)
	{
		WeaponScreen.Client = none;
	}
	// End:0x4D
	if(BarrelFlare != none)
	{
		BarrelFlare.Destroy();
	}
	// End:0x64
	if(BarrelFlareSmall != none)
	{
		BarrelFlareSmall.Destroy();
	}
	// End:0x7B
	if(CoverGlow != none)
	{
		CoverGlow.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function Notify_BrassOut()
{
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

simulated event WeaponTick(float dt)
{
	local int i;
	local Rotator bt;

	// End:0x29
	if(bGatling)
	{
		bt.Roll = BarrelTurn;
		SetBoneRotation('BarrelArray', bt);
	}
	super.WeaponTick(dt);
	// End:0x159
	if(!bGatling)
	{
		// End:0x60
		if(LS14PrimaryFire(FireMode[0]).bSecondBarrel)
		{
			bBarrelsOnline = true;
		}
		// End:0xB3
		if(((((AIController(Instigator.Controller) != none) && !IsGrenadeLoaded()) && (AmmoAmount(1)) > 0) && BotShouldReloadGrenade()) && !IsReloadingGrenade())
		{
			LoadGrenade();
		}
		// End:0xC5
		if(Rockets < 0)
		{
			Rockets = 0;
		}
		i = 2;
		J0xCD:

		// End:0x119 [Loop If]
		if(i > (Rockets - 1))
		{
			// End:0x10F
			if(int(ReloadState) == int(0))
			{
				SetBoneScale(i, 0.0000000, Shells[i].ShellName);
			}
			i--;
			// [Loop Continue]
			goto J0xCD;
		}
		i = 0;
		J0x120:

		// End:0x159 [Loop If]
		if(i < Rockets)
		{
			SetBoneScale(i, 1.0000000, Shells[i].ShellName);
			i++;
			// [Loop Continue]
			goto J0x120;
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
	// End:0x68
	if((((AmmoAmount(1)) < 1) || !IsGrenadeLoaded()) || bGatling)
	{
		return 0;		
	}
	else
	{
		// End:0x76
		if(MagAmmo < 1)
		{
			return 1;
		}
	}
	// End:0x8C
	if(int(CurrentWeaponMode) != 2)
	{
		CurrentWeaponMode = 2;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	Height = B.Enemy.Location.Z - Instigator.Location.Z;
	VDot = Normal(B.Enemy.Velocity) Dot Normal(Instigator.Location - B.Enemy.Location);
	Result = FRand() - 0.3000000;
	// End:0x17A
	if(dist > float(800))
	{
		Result -= ((dist - float(800)) / float(2000));
	}
	// End:0x1BA
	if((dist < float(500)) && VDot > 0.3000000)
	{
		Result -= ((float(500) - dist) / float(1000));
	}
	// End:0x221
	if(VSize(B.Enemy.Velocity) > float(50))
	{
		// End:0x1F9
		if(Abs(VDot) > 0.8000000)
		{
			Result += 0.1000000;
		}
		// End:0x215
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
	// End:0x29C
	if(Height < float(-100))
	{
		Result += Abs((Height / float(2)) / dist);
	}
	// End:0x2AE
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
	if(Anim == SingleGrenadeLoadAnim)
	{
		return true;
	}
	return false;
	//return;	
}

function bool CanAttack(Actor Other)
{
	// End:0x10
	if(SelfHeatLevel > float(11))
	{
		return false;
	}
	// End:0x71
	if(!IsGrenadeLoaded())
	{
		// End:0x51
		if(IsReloadingGrenade())
		{
			// End:0x4E
			if((Level.TimeSeconds - Instigator.LastPainTime) > 1.0000000)
			{
				return false;
			}			
		}
		else
		{
			// End:0x71
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
	return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.7500000, dist, 2048.0000000, 2048.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.8000000;
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	super.ServerSwitchWeaponMode(newmode);
	LS14Attachment(ThirdPersonActor).bDouble = bool(CurrentWeaponMode);
	//return;	
}

simulated function PlayShovelLoop()
{
	SetBoneScale(2, 1.0000000, Shells[2].ShellName);
	SafePlayAnim(ShovelAnim, ShovelAnimRate, 0.0000000,, "RELOAD");
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x19
	if(bRapid)
	{
		return FMin(LaserCharge, MaxCharge);		
	}
	else
	{
		return SelfHeatLevel / float(10);
	}
	//return;	
}

defaultproperties
{
	WeaponScreen=ScriptedTexture'BWBP_SKC_Tex.LS14.LS14-ScriptLCD'
	WeaponScreenShader=Shader'BWBP_SKC_Tex.LS14.LS14-ScriptLCD-SD'
	ScreenBase=Texture'BWBP_SKC_Tex.LS14.LS14-ScreenBase'
	ScreenAmmoBlue=Texture'BWBP_SKC_Tex.LS14.LS14-Screen'
	ScreenAmmoRed=Texture'BWBP_SKC_Tex.LS14.LS14-ScreenRed'
	MyFontColor=(R=255,G=255,B=255,A=255)
	GrenOpenSound=Sound'BW_Core_WeaponSound.M50.M50GrenOpen'
	GrenLoadSound=Sound'BW_Core_WeaponSound.M50.M50GrenLoad'
	GrenCloseSound=Sound'BW_Core_WeaponSound.M50.M50GrenClose'
	DoubleVentSound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-MedHeat'
	OverheatSound=Sound'WeaponSounds.BaseImpactAndExplosions.BShieldReflection'
	GrenadeLoadAnim="RLLoad"
	GrenadeLoadAnimRate=1.5000000
	SingleGrenadeLoadAnim="RLLoadLoop"
	HatchOpenAnim="RLLoadPrep"
	HatchOpenAnimRate=1.5000000
	HatchCloseAnim="RLLoadEnd"
	HatchCloseAnimRate=1.5000000
	ShovelAnim="RLLoadLoop"
	ShovelAnimRate=1.5000000
	Rockets=3
	SelfHeatDecayRate=10
	ChargeColor=(R=255,G=255,B=100,A=255)
	RechargeOrigin=(X=600.0000000,Y=330.0000000,Z=0.0000000)
	RechargeSize=(X=10.0000000,Y=-180.0000000,Z=0.0000000)
	ChargeRate=1.0000000
	CoolRate=1.0000000
	MaxCharge=1.0000000
	BarrelSpinSound=Sound'BW_Core_WeaponSound.XMV-850.XMV-BarrelSpinLoop'
	BarrelStopSound=Sound'BW_Core_WeaponSound.XMV-850.XMV-BarrelStop'
	BarrelStartSound=Sound'BW_Core_WeaponSound.XMV-850.XMV-BarrelStart'
	Shells[0]=(ShellName="RocketThree")
	Shells[1]=(ShellName="RocketTwo")
	Shells[2]=(ShellName="RocketOne")
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;15.0;1.1;90.0;1.0;0.0;0.3")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.LS14WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.LS14WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.LS14WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.LS14WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.LS14.BigIcon_LS14'
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.LS14.Gauss-Select',Volume=0.2180000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BWBP_SKC_Sounds.LS14.Gauss-Deselect',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Single Barrel",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Double Barrel",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MinZoom=2.0000000
	MaxZoom=4.0000000
	ZoomStages=1
	FullZoomFOV=20.0000000
	ScopeViewTex=Texture'BWBP_SKC_Tex.LS14.LS14Scope'
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.LS14.Gauss-Heat',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	StartShovelAnim="RLLoadPrep"
	EndShovelAnim="RLLoadEnd"
	bWT_Bullet=true
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Projectile=true
	bWT_Energy=true
	ManualLines[0]="Single Fire mode fires one barrel at once for low damage, with good fire rate.||Double Fire fires both barrels, for moderate damage, with low fire rate.||Both modes heat up the target, causing subsequent shots to inflict greater damage. This effect on the target decays with time."
	ManualLines[1]="Launches miniature rockets. These rockets deal high damage and good radius damage. The rockets have a short period of low speed before igniting."
	ManualLines[2]="Effective at long range and against enemies using healing weapons and items."
	UsedAmbientSound=Sound'BWBP_SKC_Sounds.XM20.XM20-Idle'
	SightPivot=(Pitch=600,Yaw=0,Roll=-1024)
	SightOffset=(X=11.0000000,Y=-0.5000000,Z=7.5000000)
	StartShovelAnimRate=2.0000000
	EndShovelAnimRate=2.0000000
	GunLength=80.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.LS14PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.LS14SecondaryFire'
	SelectAnimRate=1.5000000
	PutDownAnimRate=2.0000000
	PutDownTime=0.5000000
	BringUpTime=0.4000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	bSniping=true
	bShowChargingBar=true
	Description="LS-14 Laser Carbine||Manufacturer: UTC Defense Tech|Primary: Focused Photon Beam|Secondary: Mini Rockets"
	Priority=194
	HudColor=(R=100,G=150,B=255,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=5
	GroupOffset=4
	PickupClass=Class'BWBP_SKC_Pro.LS14Pickup'
	PlayerViewOffset=(X=2.0000000,Y=4.5000000,Z=-7.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.LS14Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.LS14.SmallIcon_LS14'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="LS-14 Laser Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.LS14_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BWBP_SKC_Tex.LS14.LS14_SD'
	Skins[2]=Texture'BWBP_SKC_Tex.LS14.LS14-RDS'
	Skins[3]=Shader'BWBP_OP_Tex.CX61.CX61SightShad'
	Skins[4]=Combiner'BW_Core_WeaponTex.M50.NoiseComb'
}
