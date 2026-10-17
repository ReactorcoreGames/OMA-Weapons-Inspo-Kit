class CYLOUAW extends BallisticWeapon
	config(BallisticProV55);

var() bool bAltNeedCock;
var() bool bReloadingShotgun;
var() name ShotgunLoadAnim;
var() name ShotgunEmptyLoadAnim;
var() name ShotgunSGAnim;
var() name CockSGAnim;
var() Sound TubeOpenSound;
var() Sound TubeInSound;
var() Sound TubeCloseSound;
var() int SGShells;
var byte OldWeaponMode;
var() float GunCockTime;
var() bool bSlugger;
var() bool bOldModel;
var() bool bExplosive;
var() bool bExplosiveOnPlayers;
var() bool bHeatPowered;
var() float HeatLevel;
var() bool bCriticalHeat;
var() float HeatDeclineDelay;
var() Sound OverheatSound;
var() Sound HighHeatSound;
var() Sound MedHeatSound;
var() Actor GlowFX;
var() float NextChangeMindTime;
var CYLOFirestormFireControl FireControl;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		FireControl, SGShells;

	// Pos:0x00D
	reliable if(int(Role) < int(ROLE_Authority))
		ServerSetFireRate;

	// Pos:0x01A
	reliable if(int(Role) == int(ROLE_Authority))
		ClientOverCharge, ClientSetFireRate, 
		ClientSetHeat;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bExplosive = false;
	bExplosiveOnPlayers = false;
	bHeatPowered = false;
	bSlugger = false;
	// End:0x72
	if(InStr(WeaponParams.LayoutTags, "cheap") != -1)
	{
		CYLOPrimaryFire(FireMode[0]).bVariableFirerate = true;
		bOldModel = true;
	}
	// End:0xB1
	if(InStr(WeaponParams.LayoutTags, "inc") != -1)
	{
		bExplosive = true;
		CYLOPrimaryFire(FireMode[0]).bRadiusDamage = true;
	}
	// End:0xF0
	if(InStr(WeaponParams.LayoutTags, "exp") != -1)
	{
		bExplosiveOnPlayers = true;
		CYLOPrimaryFire(FireMode[0]).bPlayerRadiusDamage = true;
	}
	// End:0x130
	if(InStr(WeaponParams.LayoutTags, "heat") != -1)
	{
		bShowChargingBar = true;
		CYLOPrimaryFire(FireMode[0]).bCanOverheat = true;
	}
	// End:0x15A
	if(InStr(WeaponParams.LayoutTags, "charge") != -1)
	{
		bHeatPowered = true;
	}
	// End:0x182
	if(InStr(WeaponParams.LayoutTags, "slug") != -1)
	{
		bSlugger = true;
	}
	//return;	
}

simulated event PostNetBeginPlay()
{
	local CYLOFirestormFireControl FC;

	super.PostNetBeginPlay();
	// End:0x52
	if((int(Role) == int(ROLE_Authority)) && FireControl == none)
	{
		// End:0x42
		foreach DynamicActors(Class'BWBP_SKC_Pro.CYLOFirestormFireControl', FC)
		{
			FireControl = FC;			
			return;			
		}		
		FireControl = Spawn(Class'BWBP_SKC_Pro.CYLOFirestormFireControl', none);
	}
	//return;	
}

function CYLOFirestormFireControl GetFireControl()
{
	return FireControl;
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
	NewDrawWeaponInfo(C, 0.7050000 * C.ClipY);
	//return;	
}

simulated function NewDrawWeaponInfo(Canvas C, float YPos)
{
	local int i, Count;
	local float ScaleFactor2, ScaleFactor, XL, YL, YL2, SprintFactor;

	local string Temp;
	local int TempNum;

	DrawCrosshairs(C);
	ScaleFactor = C.ClipX / float(1600);
	ScaleFactor2 = 45.0000000 * ScaleFactor;
	C.Style = 5;
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	Count = Min(6, SGShells);
	i = 0;
	J0x7E:

	// End:0x12A [Loop If]
	if(i < Count)
	{
		C.SetPos(C.ClipX - (((0.5000000 * float(i)) + float(1)) * ScaleFactor2), C.ClipY - ((float(100) * ScaleFactor) * Class'Engine.HUD'.default.HudScale));
		C.DrawTile(Texture'BWBP_SKC_Tex.CYLO.CYLO-SGIcon', ScaleFactor2, ScaleFactor2, 0.0000000, 0.0000000, 128.0000000, 128.0000000);
		i++;
		// [Loop Continue]
		goto J0x7E;
	}
	// End:0x135
	if(bSkipDrawWeaponInfo)
	{
		return;
	}
	C.Font = GetFontSizeIndex(C, -2 + int(float(2) * Class'Engine.HUD'.default.HudScale));
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	// End:0x250
	if(!bNoMag)
	{
		Temp = GetHUDAmmoText(0);
		C.TextSize(Temp, XL, YL);
		C.CurX = (C.ClipX - ((float(20) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(120) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(Temp, false);
	}
	// End:0x339
	if((Ammo[1] != none) && Ammo[1] != Ammo[0])
	{
		TempNum = Ammo[1].AmmoAmount;
		C.TextSize(Temp, XL, YL);
		C.CurX = (C.ClipX - ((float(160) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(120) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(string(TempNum), false);
	}
	// End:0x487
	if(((int(CurrentWeaponMode) < WeaponModes.Length) && !WeaponModes[int(CurrentWeaponMode)].bUnavailable) && WeaponModes[int(CurrentWeaponMode)].ModeName != "")
	{
		C.Font = GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
		C.TextSize(WeaponModes[int(CurrentWeaponMode)].ModeName, XL, YL2);
		C.CurX = (C.ClipX - ((float(15) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = ((C.ClipY - ((float(130) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL2) - YL;
		C.DrawText(WeaponModes[int(CurrentWeaponMode)].ModeName, false);
	}
	// End:0x61D
	if((SprintControl != none) && SprintControl.Stamina < SprintControl.MaxStamina)
	{
		SprintFactor = SprintControl.Stamina / SprintControl.MaxStamina;
		C.CurX = C.OrgX + ((float(5) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		C.CurY = C.ClipY - ((float(330) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		// End:0x579
		if(SprintFactor < 0.2000000)
		{
			C.SetDrawColor(byte(255), 0, 0);			
		}
		else
		{
			// End:0x5A2
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

simulated function FirePressed(float F)
{
	// End:0x14
	if(!HasAmmo())
	{
		OutOfAmmo();		
	}
	else
	{
		// End:0x32
		if(bNeedReload && int(ClientState) == int(4))
		{			
		}
		else
		{
			// End:0x99
			if(bCanSkipReload && ((int(ReloadState) == int(5)) || int(ReloadState) == int(6)) || int(ReloadState) == int(1))
			{
				ServerSkipReload();
				// End:0x96
				if(int(Level.NetMode) == int(NM_Client))
				{
					SkipReload();
				}				
			}
			else
			{
				// End:0x139
				if(F == float(0))
				{
					// End:0x136
					if((((((int(ReloadState) == int(0)) && bNeedCock) && !bPreventReload) && MagAmmo > 0) && !IsFiring()) && Level.TimeSeconds > FireMode[0].NextFireTime)
					{
						CommonCockGun(0);
						// End:0x136
						if(int(Level.NetMode) == int(NM_Client))
						{
							ServerCockGun(NM_Standalone);
						}
					}					
				}
				else
				{
					// End:0x1C9
					if((((((int(ReloadState) == int(0)) && bAltNeedCock) && !bPreventReload) && SGShells > 0) && !IsFiring()) && Level.TimeSeconds > FireMode[1].NextFireTime)
					{
						CommonCockGun(5);
						// End:0x1C9
						if(int(Level.NetMode) == int(NM_Client))
						{
							ServerCockGun();
						}
					}
				}
			}
		}
	}
	//return;	
}

simulated function PlayCocking(optional byte Type)
{
	local float AdjustedCockAnimRate;

	// End:0x40
	if((int(ReloadState) != int(0)) && int(ReloadState) != int(8))
	{
		AdjustedCockAnimRate = CockAnimRate * Class'BCoreProV55.BallisticReplicationInfo'.default.ReloadScale;		
	}
	else
	{
		AdjustedCockAnimRate = CockAnimRate;
	}
	// End:0x87
	if((int(Type) == 2) && HasAnim(CockAnimPostReload))
	{
		SafePlayAnim(CockAnimPostReload, AdjustedCockAnimRate, 0.2000000,, "RELOAD");		
	}
	else
	{
		// End:0xB6
		if(int(Type) == 5)
		{
			SafePlayAnim(CockSGAnim, AdjustedCockAnimRate, 0.2000000,, "RELOAD");			
		}
		else
		{
			SafePlayAnim(CockAnim, AdjustedCockAnimRate, 0.2000000,, "RELOAD");
		}
	}
	// End:0xEF
	if(int(SightingState) != int(0))
	{
		TemporaryScopeDown(default.SightingTime);
	}
	//return;	
}

simulated function Notify_TubeSlideOut()
{
	PlaySound(TubeOpenSound, 1, 0.5000000,, 64.0000000);
	ReloadState = 2;
	//return;	
}

simulated function Notify_TubeIn()
{
	local int AmmoNeeded;

	PlaySound(TubeInSound, 1, 0.5000000,, 64.0000000);
	ReloadState = 3;
	// End:0x9E
	if(int(Level.NetMode) != int(NM_Client))
	{
		AmmoNeeded = default.SGShells - SGShells;
		// End:0x7C
		if(AmmoNeeded > Ammo[1].AmmoAmount)
		{
			SGShells += Ammo[1].AmmoAmount;			
		}
		else
		{
			SGShells = default.SGShells;
		}
		Ammo[1].UseAmmo(AmmoNeeded, true);
	}
	//return;	
}

simulated function Notify_TubeSlideIn()
{
	PlaySound(TubeCloseSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_SGCockEnd()
{
	bAltNeedCock = false;
	ReloadState = 9;
	//return;	
}

simulated function bool IsReloadingShotgun()
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x27
	if(Anim == ShotgunLoadAnim)
	{
		return true;
	}
	return false;
	//return;	
}

function bool BotShouldReloadShotgun()
{
	// End:0x2A
	if((Level.TimeSeconds - Instigator.LastPainTime) > 1.0000000)
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
	// End:0x55
	if((Anim == CockSGAnim) || Anim == ShotgunEmptyLoadAnim)
	{
		bAltNeedCock = false;
		ReloadState = 0;
		ReloadFinished();
		PlayIdle();		
	}
	else
	{
		super.AnimEnd(Channel);
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
	// End:0x4E
	if((int(i) == 0) && MagAmmo >= default.MagAmmo)
	{
		// End:0x4E
		if(bNeedCock)
		{
			ServerCockGun(0);
			return;
		}
	}
	// End:0x7F
	if((int(i) == 1) && SGShells >= default.SGShells)
	{
		// End:0x7F
		if(bAltNeedCock)
		{
			ServerCockGun(5);
			return;
		}
	}
	// End:0xB0
	if((MagAmmo < default.MagAmmo) && Ammo[0].AmmoAmount > 0)
	{
		Loadings[0] = 1;
	}
	// End:0xE1
	if((SGShells < default.SGShells) && Ammo[1].AmmoAmount > 0)
	{
		Loadings[1] = 1;
	}
	// End:0x103
	if((int(Loadings[0]) == 0) && int(Loadings[1]) == 0)
	{
		return;
	}
	M = 0;
	J0x10A:

	// End:0x156 [Loop If]
	if(M < 2)
	{
		// End:0x14C
		if((FireMode[M] != none) && FireMode[M].bIsFiring)
		{
			StopFire(M);
		}
		M++;
		// [Loop Continue]
		goto J0x10A;
	}
	bServerReloading = true;
	// End:0x175
	if(int(i) == 1)
	{
		M = 0;		
	}
	else
	{
		M = 1;
	}
	// End:0x1BF
	if((BallisticAttachment(ThirdPersonActor) != none) && BallisticAttachment(ThirdPersonActor).ReloadAnim != 'None')
	{
		Instigator.SetAnimAction('ReloadGun');
	}
	// End:0x1ED
	if(int(Loadings[int(i)]) == 1)
	{
		ClientStartReload(i);
		CommonStartReload(i);		
	}
	else
	{
		// End:0x21A
		if(int(Loadings[M]) == 1)
		{
			ClientStartReload(byte(M));
			CommonStartReload(byte(M));
		}
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
	// End:0xF0
	if(int(i) == 0)
	{
		// End:0xD2
		if(bCockAfterReload)
		{
			bNeedCock = true;
		}
		// End:0xF0
		if(bCockOnEmpty && MagAmmo < 1)
		{
			bNeedCock = true;
		}
	}
	bNeedReload = false;
	//return;	
}

simulated function PlayReloadAlt()
{
	// End:0x35
	if((SGShells == 0) && !bOldModel)
	{
		SafePlayAnim(ShotgunEmptyLoadAnim, 1.0000000,, 0, "RELOAD");		
	}
	else
	{
		SafePlayAnim(ShotgunLoadAnim, 1.0000000,, 0, "RELOAD");
	}
	//return;	
}

simulated function ClientOverCharge()
{
	// End:0x1B
	if(FireMode[0].bIsFiring)
	{
		StopFire(1);
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0xB6
	if((((((HeatLevel >= float(7)) && Instigator.IsLocallyControlled()) && GlowFX == none) && int(Level.DetailMode) == int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2) && (GlowFX == none) || GlowFX.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GlowFX, Class'BWBP_SKC_Pro.CYLOFirestormRedGlow', DrawScale, self, 'tip');		
	}
	else
	{
		// End:0xE3
		if(HeatLevel < float(7))
		{
			// End:0xE3
			if(GlowFX != none)
			{
				Emitter(GlowFX).Kill();
			}
		}
	}
	// End:0x136
	if(((((AIController(Instigator.Controller) != none) && bAltNeedCock) && (AmmoAmount(1)) > 0) && BotShouldReloadShotgun()) && !IsReloadingShotgun())
	{
		ServerStartReload(1);
	}
	//return;	
}

simulated function float ChargeBar()
{
	return HeatLevel / float(12);
	//return;	
}

simulated event Tick(float dt)
{
	// End:0x4D
	if((HeatLevel > float(0)) && Level.TimeSeconds > (LastFireTime + HeatDeclineDelay))
	{
		HeatLevel = FMax(HeatLevel - (float(6) * dt), 0.0000000);
	}
	super.Tick(dt);
	//return;	
}

simulated function AddHeat(float Amount)
{
	// End:0x15
	if(bBerserk)
	{
		Amount *= 0.7500000;
	}
	HeatLevel += Amount;
	// End:0x107
	if(HeatLevel >= 11.7500000)
	{
		HeatLevel = 12.0000000;
		PlaySound(OverheatSound,, 0.7000000,, 32.0000000);
		// End:0xC7
		if(int(Instigator.Physics) != int(2))
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 10.0000000, Instigator, Instigator.Location, (-Vector(Instigator.GetViewRotation()) * float(30000)) + vect(0.0000000, 0.0000000, 10000.0000000), Class'BWBP_SKC_Pro.DTCYLOFirestormOverheat');			
		}
		else
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 10.0000000, Instigator, Instigator.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'BWBP_SKC_Pro.DTCYLOFirestormOverheat');
		}
		return;
	}
	// End:0x57C
	if(bHeatPowered)
	{
		// End:0x1DE
		if((HeatLevel >= 9.7500000) && HeatLevel < float(10))
		{
			HeatLevel = 12.0000000;
			PlaySound(OverheatSound,, 0.7000000,, 32.0000000);
			// End:0x182
			if(int(Level.NetMode) != int(NM_DedicatedServer))
			{
				BallisticInstantFire(FireMode[0]).JamChance = 0.3500000;
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 3.0000000, Instigator, Instigator.Location, (-Vector(Instigator.GetViewRotation()) * float(30000)) + vect(0.0000000, 0.0000000, 10000.0000000), Class'BWBP_SKC_Pro.DTCYLOFirestormOverheat');
		}
		// End:0x30C
		if(HeatLevel >= 9.0000000)
		{
			PlaySound(HighHeatSound,, 1.0000000,, 32.0000000);
			// End:0x235
			if(int(Level.NetMode) != int(NM_DedicatedServer))
			{
				BallisticInstantFire(FireMode[0]).JamChance = 0.2500000;
			}
			BallisticInstantFire(FireMode[0]).FireRate = BallisticInstantFire(FireMode[0]).Params.FireInterval * float(4);
			BallisticInstantFire(FireMode[0]).Damage = BallisticInstantFire(FireMode[0]).default.Damage + float(13);
			BallisticInstantFire(FireMode[0]).MuzzleFlashClass = Class'BWBP_SKC_Pro.CYLOFirestormHeatEmitter';
			BallisticInstantFire(FireMode[0]).DamageType = Class'BWBP_SKC_Pro.DTCYLOFirestormHot';
			BallisticInstantFire(FireMode[0]).DamageTypeHead = Class'BWBP_SKC_Pro.DTCYLOFirestormHotHead';
			BallisticInstantFire(FireMode[0]).DamageTypeArm = Class'BWBP_SKC_Pro.DTCYLOFirestormHot';
		}
		// End:0x43D
		if(HeatLevel >= 6.0000000)
		{
			PlaySound(MedHeatSound,, 0.7000000,, 32.0000000);
			// End:0x363
			if(int(Level.NetMode) != int(NM_DedicatedServer))
			{
				BallisticInstantFire(FireMode[0]).JamChance = 0.1000000;
			}
			BallisticInstantFire(FireMode[0]).FireRate = BallisticInstantFire(FireMode[0]).Params.FireInterval * float(2);
			BallisticInstantFire(FireMode[0]).Damage = BallisticInstantFire(FireMode[0]).default.Damage + float(8);
			BallisticInstantFire(FireMode[0]).MuzzleFlashClass = Class'BWBP_SKC_Pro.CYLOFirestormHeatEmitter';
			BallisticInstantFire(FireMode[0]).DamageType = Class'BWBP_SKC_Pro.DTCYLOFirestormHot';
			BallisticInstantFire(FireMode[0]).DamageTypeHead = Class'BWBP_SKC_Pro.DTCYLOFirestormHotHead';
			BallisticInstantFire(FireMode[0]).DamageTypeArm = Class'BWBP_SKC_Pro.DTCYLOFirestormHot';			
		}
		else
		{
			// End:0x471
			if(int(Level.NetMode) != int(NM_DedicatedServer))
			{
				BallisticInstantFire(FireMode[0]).JamChance = 0.0020000;
			}
			BallisticInstantFire(FireMode[0]).Damage = BallisticInstantFire(FireMode[0]).default.Damage;
			BallisticInstantFire(FireMode[0]).MuzzleFlashClass = BallisticInstantFire(FireMode[0]).default.MuzzleFlashClass;
			BallisticInstantFire(FireMode[0]).FireRate = BallisticInstantFire(FireMode[0]).Params.FireInterval;
			BallisticInstantFire(FireMode[0]).DamageType = BallisticInstantFire(FireMode[0]).default.DamageType;
			BallisticInstantFire(FireMode[0]).DamageTypeHead = BallisticInstantFire(FireMode[0]).default.DamageTypeHead;
			BallisticInstantFire(FireMode[0]).DamageTypeArm = BallisticInstantFire(FireMode[0]).default.DamageTypeArm;
		}
	}
	//return;	
}

simulated function ClientSetHeat(float NewHeat)
{
	HeatLevel = NewHeat;
	//return;	
}

simulated event Timer()
{
	// End:0x24
	if(int(ClientState) == int(3))
	{
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(GlowFX);
	}
	super.Timer();
	//return;	
}

simulated event Destroyed()
{
	// End:0x17
	if(GlowFX != none)
	{
		GlowFX.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function SetFireRate(float NewFireRate)
{
	ServerSetFireRate(byte(NewFireRate));
	BallisticInstantFire(FireMode[0]).FireRate = NewFireRate;
	//return;	
}

function ServerSetFireRate(byte NewFireRate)
{
	BallisticInstantFire(FireMode[0]).FireRate = float(NewFireRate);
	ClientSetFireRate(NewFireRate);
	NetUpdateTime = Level.TimeSeconds - float(1);
	//return;	
}

simulated function CommonSwitchFireRate(byte NewFireRate)
{
	// End:0x0D
	if(Instigator == none)
	{
		return;
	}
	BallisticInstantFire(FireMode[0]).FireRate = float(NewFireRate);
	//return;	
}

simulated function ClientSetFireRate(byte NewFireRate)
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	CommonSwitchFireRate(NewFireRate);
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
	// End:0x5B
	if(((AmmoAmount(1)) < 1) || bAltNeedCock)
	{
		return 0;		
	}
	else
	{
		// End:0x69
		if(MagAmmo < 1)
		{
			return 1;
		}
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	Height = B.Enemy.Location.Z - Instigator.Location.Z;
	VDot = Normal(B.Enemy.Velocity) Dot Normal(Instigator.Location - B.Enemy.Location);
	Result = FRand() - 0.3000000;
	// End:0x157
	if(dist > float(800))
	{
		Result -= ((dist - float(800)) / float(2000));
	}
	// End:0x1BE
	if(VSize(B.Enemy.Velocity) > float(50))
	{
		// End:0x196
		if(Abs(VDot) > 0.8000000)
		{
			Result += 0.1000000;
		}
		// End:0x1B2
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
	// End:0x239
	if(Height < float(-100))
	{
		Result += Abs((Height / float(2)) / dist);
	}
	// End:0x24B
	if(Result > 0.5000000)
	{
		return 1;
	}
	return 0;
	//return;	
}

function bool CanAttack(Actor Other)
{
	// End:0x61
	if(bAltNeedCock)
	{
		// End:0x3F
		if(IsReloadingShotgun())
		{
			// End:0x3C
			if((Level.TimeSeconds - Instigator.LastPainTime) > 1.0000000)
			{
				return false;
			}			
		}
		else
		{
			// End:0x61
			if(((AmmoAmount(1)) > 0) && BotShouldReloadShotgun())
			{
				ServerStartReload(1);
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.6000000, dist, BallisticInstantFire(bFireMode[0]).DecayRange.Min, BallisticInstantFire(bFireMode[0]).DecayRange.Max);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.6000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.6000000;
	//return;	
}

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

defaultproperties
{
	ShotgunLoadAnim="ReloadSG"
	ShotgunEmptyLoadAnim="ReloadSGEmpty"
	CockSGAnim="CockSG"
	TubeOpenSound=Sound'BW_Core_WeaponSound.M50.M50GrenOpen'
	TubeInSound=Sound'BW_Core_WeaponSound.M50.M50GrenLoad'
	TubeCloseSound=Sound'BW_Core_WeaponSound.M50.M50GrenClose'
	SGShells=6
	HeatDeclineDelay=0.2000000
	OverheatSound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-OverHeat'
	HighHeatSound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-HighHeat'
	MedHeatSound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-MedHeat'
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;20.0;0.9;85.0;0.1;0.9;0.4")
	AIReloadTime=1.0000000
	SightAnimScale=0.6500000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.CYLOWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.CYLOWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.CYLOWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.CYLOWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.CYLO.BigIcon_CYLOMK3'
	BigIconCoords=(X1=16,Y1=30,X2=511,Y2=212)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Pullout',Volume=0.2250000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Putaway',Volume=0.2250000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	bNoCrosshairInScope=true
	CockAnimPostReload="Cock"
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-Cock',Volume=1.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-MagOut',Volume=1.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-MagIn',Volume=1.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.7000000
	bAltTriggerReload=true
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M763OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.G5InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=0,B=0,A=255),Color2=(R=255,G=0,B=0,A=255),StartSize1=90,StartSize2=93)
	MeleeFireClass=Class'BWBP_SKC_Pro.CYLOMeleeFire'
	bWT_Bullet=true
	bWT_Shotgun=true
	bWT_Machinegun=true
	ManualLines[0]="Automatic 7.62mm fire. High power, but shorter effective range and suffers from high recoil."
	ManualLines[1]="Engages the secondary shotgun. Has a shorter range than other shotguns and moderate spread."
	ManualLines[2]="Effective at close to medium range."
	SightOffset=(X=1.0000000,Y=0.0000000,Z=2.1300000)
	MagAmmo=22
	GunLength=16.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.CYLOPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.CYLOSecondaryFire'
	SelectAnimRate=2.0000000
	PutDownAnimRate=1.6000000
	PutDownTime=0.3300000
	BringUpTime=0.4500000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7500000
	CurrentRating=0.7500000
	AmmoClass[0]=Class'BWBP_SKC_Pro.Ammo_CYLOInc'
	AmmoClass[1]=Class'BWBP_SKC_Pro.Ammo_CYLOInc'
	Description="Dipheox's most popular weapon, the CYLO Versatile Urban Assault Weapon is designed with one goal in mind: Brutal close quarters combat. The CYLO accomplishes this goal quite well, earning itself the nickname of Badger with its small frame, brutal effectiveness, and unpredictability. UTC refuses to let this weapon in the hands of its soldiers because of its erratic firing and tendency to jam.||The CYLO Versatile UAW is fully capable for urban combat. The rifle's caseless 7.62mm rounds can easily shoot through doors and thin walls, while the shotgun can clear a room quickly with its semi-automatic firing. Proper training with the bayonet can turn the gun itself into a deadly melee weapon."
	Priority=41
	HudColor=(R=255,G=135,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=4
	GroupOffset=10
	PickupClass=Class'BWBP_SKC_Pro.CYLOPickup'
	PlayerViewOffset=(X=4.0000000,Y=3.5000000,Z=-5.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.CYLOAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.CYLO.SmallIcon_CYLOMK3'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="CYLO Urban Assault Weapon"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.CYLOUAW_FPm'
	DrawScale=0.3000000
}
