class PugAssaultCannon extends BallisticWeapon
	config(BallisticProV55);

var() Sound GrenOpenSound;
var() Sound GrenLoadSound;
var() Sound GrenCloseSound;
var() Sound CockSoundQuick;
var() Sound CockSoundAlt;
var() Sound CockSoundAltQ;
var() name SGPrepAnim;
var() name CockingAnim;
var() name ShovelAnim;
var int VisGrenades;
var int Grenades;
var bool bAltNeedCock;
var byte ShellIndex;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		Grenades;

	// Pos:0x00D
	reliable if(int(Role) < int(ROLE_Authority))
		ServerLoadFrag;
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	super.DisplayDebug(Canvas, YL, YPos);
	Canvas.SetDrawColor(byte(255), 128, 0);
	Canvas.DrawText((("bNeedCock: " $ string(bNeedCock)) $ ", bAltNeedCock: ") $ string(bAltNeedCock));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	//return;	
}

function GiveAmmo(int M, WeaponPickup WP, bool bJustSpawned)
{
	// End:0x21A
	if((FireMode[M] != none) && FireMode[M].AmmoClass != none)
	{
		Ammo[M] = Ammunition(Instigator.FindInventoryType(FireMode[M].AmmoClass));
		// End:0xB4
		if(Ammo[M] == none)
		{
			Ammo[M] = Spawn(FireMode[M].AmmoClass, Instigator);
			Instigator.AddInventory(Ammo[M]);
		}
		// End:0x11B
		if((WP != none) && WP.bDropped || WP.AmmoAmount[M] > 0)
		{
			Ammo[M].AddAmmo(WP.AmmoAmount[M]);			
		}
		else
		{
			// End:0x204
			if((bJustSpawned && (WP == none) || !WP.bDropped) && (M == 0) || FireMode[M].AmmoClass != FireMode[0].AmmoClass)
			{
				// End:0x1DB
				if(M == 1)
				{
					// End:0x1D8
					if(Ammo[M].InitialAmount > default.Grenades)
					{
						Ammo[M].AddAmmo(Ammo[M].InitialAmount - Grenades);
					}					
				}
				else
				{
					Ammo[M].AddAmmo(Ammo[M].InitialAmount);
				}
			}
		}
		Ammo[M].GotoState('None');
	}
	//return;	
}

simulated function DrawWeaponInfo(Canvas Canvas)
{
	NewDrawWeaponInfo(Canvas, 0.7050000 * Canvas.ClipY);
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
	ScaleFactor2 = (99.0000000 * C.ClipX) / float(3200);
	C.Style = 5;
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	Count = Min(3, Grenades);
	// End:0x24C
	if(Grenades > 0)
	{
		C.SetPos(C.ClipX - (float(1) * ScaleFactor2), C.ClipY - ((float(100) * ScaleFactor) * Class'Engine.HUD'.default.HudScale));
		// End:0x15F
		if(!bAltNeedCock)
		{
			C.DrawColor = Class'Engine.HUD'.default.RedColor;
			C.DrawTile(Texture'BWBP_SKC_Tex.Bulldog.Bulldog-FRAGIcon', ScaleFactor2, ScaleFactor2, 0.0000000, 0.0000000, 128.0000000, 128.0000000);
			C.DrawColor = Class'Engine.HUD'.default.WhiteColor;			
		}
		else
		{
			C.DrawTile(Texture'BWBP_SKC_Tex.Bulldog.Bulldog-FRAGIcon', ScaleFactor2, ScaleFactor2, 0.0000000, 0.0000000, 128.0000000, 128.0000000);
		}
		// End:0x24C
		if(Grenades > 1)
		{
			i = 1;
			J0x1A0:

			// End:0x24C [Loop If]
			if(i < Count)
			{
				C.SetPos(C.ClipX - (((0.5000000 * float(i)) + float(1)) * ScaleFactor2), C.ClipY - ((float(100) * ScaleFactor) * Class'Engine.HUD'.default.HudScale));
				C.DrawTile(Texture'BWBP_SKC_Tex.Bulldog.Bulldog-FRAGIcon', ScaleFactor2, ScaleFactor2, 0.0000000, 0.0000000, 128.0000000, 128.0000000);
				i++;
				// [Loop Continue]
				goto J0x1A0;
			}
		}
	}
	// End:0x257
	if(bSkipDrawWeaponInfo)
	{
		return;
	}
	C.Font = GetFontSizeIndex(C, -2 + int(float(2) * Class'Engine.HUD'.default.HudScale));
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	// End:0x372
	if(!bNoMag)
	{
		Temp = GetHUDAmmoText(0);
		C.TextSize(Temp, XL, YL);
		C.CurX = (C.ClipX - ((float(20) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(140) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(Temp, false);
	}
	// End:0x45D
	if((Ammo[1] != none) && Ammo[1] != Ammo[0])
	{
		TempNum = Ammo[1].AmmoAmount;
		C.TextSize(string(TempNum), XL, YL);
		C.CurX = (C.ClipX - ((float(160) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(140) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(string(TempNum), false);
	}
	// End:0x5AB
	if(((int(CurrentWeaponMode) < WeaponModes.Length) && !WeaponModes[int(CurrentWeaponMode)].bUnavailable) && WeaponModes[int(CurrentWeaponMode)].ModeName != "")
	{
		C.Font = GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
		C.TextSize(WeaponModes[int(CurrentWeaponMode)].ModeName, XL, YL2);
		C.CurX = (C.ClipX - ((float(15) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = ((C.ClipY - ((float(150) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL2) - YL;
		C.DrawText(WeaponModes[int(CurrentWeaponMode)].ModeName, false);
	}
	// End:0x741
	if((SprintControl != none) && SprintControl.Stamina < SprintControl.MaxStamina)
	{
		SprintFactor = SprintControl.Stamina / SprintControl.MaxStamina;
		C.CurX = C.OrgX + ((float(5) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		C.CurY = C.ClipY - ((float(330) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		// End:0x69D
		if(SprintFactor < 0.2000000)
		{
			C.SetDrawColor(byte(255), 0, 0);			
		}
		else
		{
			// End:0x6C6
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

simulated function FragFired()
{
	// End:0x17
	if(int(Role) == int(ROLE_Authority))
	{
		Grenades--;
	}
	//return;	
}

simulated function Notify_PugShellIn()
{
	// End:0x58
	if(int(ReloadState) == int(5))
	{
		ReloadState = 6;
		// End:0x43
		if(int(Role) == int(ROLE_Authority))
		{
			Ammo[1].UseAmmo(1, true);
			Grenades += 1;
		}
		PlaySound(GrenLoadSound, 1, 0.5000000,, 64.0000000);
	}
	//return;	
}

simulated function Notify_CockStart()
{
	PlayOwnedSound(CockSound.Sound, CockSound.Slot, CockSound.Volume, CockSound.bNoOverride, CockSound.Radius, CockSound.Pitch, CockSound.bAtten);
	//return;	
}

simulated function Notify_FRAG12LoadStart()
{
	PlayOwnedSound(CockSoundAlt, CockSound.Slot, CockSound.Volume, CockSound.bNoOverride, CockSound.Radius, CockSound.Pitch, CockSound.bAtten);
	//return;	
}

simulated function Notify_FRAG12LoadStartQuick()
{
	PlayOwnedSound(CockSoundAltQ, CockSound.Slot, CockSound.Volume, CockSound.bNoOverride, CockSound.Radius, CockSound.Pitch, CockSound.bAtten);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	VisGrenades = Grenades;
	ShellIndex = byte(FMin(float(Grenades - 1), 2.0000000));
	super.BringUp(PrevWeapon);
	//return;	
}

simulated event AnimEnded(int Channel, name Anim, float frame, float Rate)
{
	// End:0x7B
	if((Anim == bFireMode[0].AimedFireAnim) || Anim == bFireMode[1].AimedFireAnim)
	{
		AnimBlendParams(1, 0.0000000);
		// End:0x73
		if((float(SightingState) > FireAnimCutThreshold) && SafePlayAnim(IdleAnim, 1.0000000))
		{
			FreezeAnimAt(0.0000000);
		}
		bPreventReload = false;
	}
	// End:0xDD
	if(((int(ClientState) == int(4)) || (int(ClientState) == int(0)) && Instigator.Weapon == self) && int(ReloadState) == int(0))
	{
		// End:0xDD
		if(int(MeleeState) < int(2))
		{
			bPreventReload = false;
		}
	}
	// End:0xFD
	if(int(ReloadState) == int(4))
	{
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x151
	if(int(ReloadState) == int(6))
	{
		// End:0x141
		if((Grenades >= 3) || Ammo[1].AmmoAmount < 1)
		{
			PlayShovelEnd();
			ReloadState = 7;
			return;
		}
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x1A5
	if((int(ReloadState) == int(3)) || int(ReloadState) == int(7))
	{
		bNeedCock = false;
		ReloadState = 0;
		ReloadFinished();
		PlayIdle();
		AimComponent.Reaim(0.0500000);
		return;
	}
	// End:0x1FF
	if(int(ReloadState) == int(8))
	{
		bNeedCock = false;
		ReloadState = 0;
		ReloadFinished();
		// End:0x1EB
		if(Anim != SGPrepAnim)
		{
			IdleAnim = 'Idle';
			PlayIdle();
		}
		AimComponent.Reaim(0.0500000);
	}
	//return;	
}

simulated function LoadGrenadeLoop()
{
	// End:0x26
	if((Ammo[1].AmmoAmount < 1) && Grenades > 3)
	{
		return;
	}
	// End:0x77
	if(((int(ReloadState) == int(0)) || int(ReloadState) == int(4)) && Ammo[1].AmmoAmount >= 1)
	{
		PlayAnim(StartShovelAnim, StartShovelAnimRate,, 0);
		ReloadState = 4;
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
		// End:0x34
		if(bNeedReload && int(ClientState) == int(4))
		{
			return;			
		}
		else
		{
			// End:0x86
			if(bCanSkipReload && (int(ReloadState) == int(5)) || int(ReloadState) == int(6))
			{
				ServerSkipReload();
				// End:0x86
				if(int(Level.NetMode) == int(NM_Client))
				{
					SkipReload();
				}
			}
		}
	}
	//return;	
}

simulated function CommonLoadFrag()
{
	// End:0x0B
	if(bNonCocking)
	{
		return;
	}
	// End:0x23
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = true;
	}
	ReloadState = 8;
	PlayAnim(SGPrepAnim, 1.0000000, 0.0000000);
	//return;	
}

function ServerLoadFrag()
{
	CommonLoadFrag();
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
	bNeedReload = false;
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
	// End:0x77
	if(!bAltNeedCock)
	{
		SafePlayAnim(CockAnim, 1.7500000, 0.2000000,, "RELOAD");		
	}
	else
	{
		SafePlayAnim(CockAnim, AdjustedCockAnimRate, 0.2000000,, "RELOAD");
	}
	// End:0xB0
	if(int(SightingState) != int(0))
	{
		TemporaryScopeDown(default.SightingTime);
	}
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
	// End:0x54
	if((MagAmmo >= default.MagAmmo) && (Ammo[1].AmmoAmount < 1) || Grenades >= 3)
	{
		return;
	}
	// End:0x7A
	if((Grenades == 3) && Ammo[0].AmmoAmount < 1)
	{
		return;
	}
	// End:0xAA
	if((Ammo[0].AmmoAmount < 1) && Ammo[1].AmmoAmount < 1)
	{
		return;
	}
	M = 0;
	J0xB1:

	// End:0xFD [Loop If]
	if(M < 2)
	{
		// End:0xF3
		if((FireMode[M] != none) && FireMode[M].bIsFiring)
		{
			StopFire(M);
		}
		M++;
		// [Loop Continue]
		goto J0xB1;
	}
	bServerReloading = true;
	// End:0x169
	if(((Grenades < 3) && Ammo[1].AmmoAmount != 0) && (MagAmmo >= (default.MagAmmo / 2)) || Ammo[0].AmmoAmount < 1)
	{
		CommonStartReload(1);
		ClientStartReload(1);		
	}
	else
	{
		CommonStartReload(0);
		ClientStartReload(0);
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x61
	if(((((AIController(Instigator.Controller) != none) && bAltNeedCock) && (AmmoAmount(1)) > 0) && BotShouldReloadGrenade()) && int(ReloadState) == int(0))
	{
		LoadGrenadeLoop();
	}
	//return;	
}

simulated function PlayShovelLoop()
{
	SafePlayAnim(ShovelAnim, ReloadAnimRate, 0.0000000,, "RELOAD");
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
	// End:0x197
	if((dist < float(500)) && VDot > 0.3000000)
	{
		Result -= ((float(500) - dist) / float(1000));
	}
	// End:0x1FE
	if(VSize(B.Enemy.Velocity) > float(50))
	{
		// End:0x1D6
		if(Abs(VDot) > 0.8000000)
		{
			Result += 0.1000000;
		}
		// End:0x1F2
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
	// End:0x279
	if(Height < float(-100))
	{
		Result += Abs((Height / float(2)) / dist);
	}
	// End:0x28B
	if(Result > 0.5000000)
	{
		return 1;
	}
	return 0;
	//return;	
}

function bool CanAttack(Actor Other)
{
	// End:0x66
	if(bAltNeedCock)
	{
		// End:0x46
		if(int(ReloadState) != int(0))
		{
			// End:0x43
			if((Level.TimeSeconds - Instigator.LastPainTime) > 1.0000000)
			{
				return false;
			}			
		}
		else
		{
			// End:0x66
			if(((AmmoAmount(1)) > 0) && BotShouldReloadGrenade())
			{
				LoadGrenadeLoop();
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
	return 0.5000000;
	//return;	
}

defaultproperties
{
	GrenOpenSound=Sound'BW_Core_WeaponSound.M50.M50GrenOpen'
	GrenLoadSound=Sound'BW_Core_WeaponSound.M50.M50GrenLoad'
	GrenCloseSound=Sound'BW_Core_WeaponSound.M50.M50GrenClose'
	CockSoundQuick=Sound'BWBP_SKC_Sounds.Bulldog.Bulldog-CockQuick'
	CockSoundAlt=Sound'BWBP_SKC_Sounds.Bulldog.Bulldog-CockAlt'
	CockSoundAltQ=Sound'BWBP_SKC_Sounds.Bulldog.Bulldog-CockAltQuick'
	SGPrepAnim="GrenadePrep"
	CockingAnim="Cock"
	ShovelAnim="ReloadGrenadeLoop"
	Grenades=3
	SpecialInfo[0]=(Id="EvoDefs",Info="120.0;15.0;0.8;70.0;0.75;0.5;0.0")
	AIReloadTime=1.5000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.PugWeaponParams'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.PugWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.PugWeaponParamsRealistic'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.PUG.BigIcon_Pug'
	BigIconCoords=(X1=0,Y1=48,X2=511,Y2=230)
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.Bulldog.Bulldog-PullOut',Volume=0.2180000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BWBP_SKC_Sounds.Bulldog.Bulldog-PutAway',Volume=0.2160000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Laser-Auto",bUnavailable=true,ModeID="WM_Burst",Value=7.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="FRAG-12 Loaded",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="ERROR",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[5]=(ModeName="ERROR",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.Bulldog.Bulldog-Cock',Volume=1.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BWBP_SKC_Sounds.Bulldog.Bulldog-MagHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.Bulldog.Bulldog-MagOut',Volume=1.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.Bulldog.Bulldog-MagIn',Volume=2.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	bCanSkipReload=true
	bAltTriggerReload=true
	StartShovelAnim="ReloadGrenadeStartMulti"
	EndShovelAnim="ReloadGrenadeFinishMulti"
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc9',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=192),Color2=(R=255,G=255,B=0,A=255),StartSize1=61,StartSize2=22)
	NDCrosshairInfo=(SpreadRatios=(X1=0.7500000,Y1=0.7500000,X2=0.3000000,Y2=0.3000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=4.0000000,CurrentScale=0.0000000)
	bWT_Bullet=true
	SightOffset=(X=0.0000000,Y=0.0000000,Z=3.0000000)
	GunLength=48.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.PugPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.PugSecondaryFire'
	PutDownAnimRate=1.7000000
	PutDownTime=0.4000000
	BringUpTime=0.9000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	bSniping=true
	Description="No matter what year it is, there will always be those who don't have the same ideals as the UTC troops. Even during the skrith wars, there'll be conscientious objectors who oppose violence and they'll adapt to suppressive tools like the PUG Suppression Cannon.  Designed to fire both rubber slugs and tear gas grenades, it was supposed to be a versatile tool to quell any riots; only it worked a little too well as the slugs managed to break bones and rupture vital organs while the gas suffocated those who got too close. The suppression cannon no longer is used in upholding the law, rather it has ironically found its way in troopers hands to flush out Skrith in their hiding holes."
	Priority=162
	HudColor=(R=255,G=25,B=25,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=8
	GroupOffset=3
	PickupClass=Class'BWBP_SKC_Pro.PugPickup'
	PlayerViewOffset=(X=5.0000000,Y=4.5000000,Z=-2.5000000)
	AttachmentClass=Class'BWBP_SKC_Pro.PugAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.PUG.SmallIcon_Pug'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="PUG-M2 Riot Cannon"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.Pug_FPm'
	DrawScale=0.3000000
}
