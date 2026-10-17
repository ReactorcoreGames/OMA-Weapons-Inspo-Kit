class BRINKAssaultRifle extends BallisticWeapon
	config(BallisticProV55);

var int NumpadYOffset1;
var int NumpadYOffset2;
var() ScriptedTexture WeaponScreen;
var() int ScreenIndex;
var() Material screen;
var() Material ScreenBase;
var() Material Numbers;
var protected const Color MyFontColor;
var float RadarPulse;
var float RadarScale;
var config float RadarPosX;
var config float RadarPosY;
var float LastDrawRadar;
var float MinEnemyDist;
var int Meters;
var() Sound RadarScanSound;
var() Sound RadarWarnSound;
var bool bRadar;
var() FullSound RadarOnSound;
var() FullSound RadarOffSound;
var float RadarHeat;
var float RadarHeatRate;
var float RadarCoolRate;
var float MaxRadarTime;
var() Sound GrenOpenSound;
var() Sound GrenLoadSound;
var() Sound GrenCloseSound;
var() name GrenadeLoadAnim;
var() name ScopeBone;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientGrenadePickedUp, ClientNotify_ChangeRadarSkin, 
		ClientScreenStart, Meters, 
		MinEnemyDist, bRadar;

	// Pos:0x00D
	reliable if(int(Role) < int(ROLE_Authority))
		Notify_ChangeRadarSkin;
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	local int M;
	local Weapon W;
	local bool bPossiblySwitch, bJustSpawned;

	Instigator = Other;
	W = Weapon(Other.FindInventoryType(Class));
	// End:0x15C
	if(W == none)
	{
		bJustSpawned = true;
		super(Inventory).GiveTo(Other);
		bPossiblySwitch = true;
		W = self;
		// End:0xEA
		if((Pickup != none) && BallisticWeaponPickup(Pickup) != none)
		{
			GenerateLayout(BallisticWeaponPickup(Pickup).LayoutIndex);
			GenerateCamo(BallisticWeaponPickup(Pickup).CamoIndex);
			// End:0xCE
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = BallisticWeaponPickup(Pickup).MagAmmo;			
		}
		else
		{
			GenerateLayout(byte(255));
			GenerateCamo(byte(255));
			// End:0x126
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = MagAmmo + ((int(!bNonCocking) * int(bMagPlusOne)) * int(!bNeedCock));
		}
		Notify_ChangeRadarSkin();		
	}
	else
	{
		// End:0x178
		if(!W.HasAmmo())
		{
			bPossiblySwitch = true;
		}
	}
	// End:0x18B
	if(Pickup == none)
	{
		bPossiblySwitch = true;
	}
	M = 0;
	J0x192:

	// End:0x1EE [Loop If]
	if(M < 2)
	{
		// End:0x1E4
		if(FireMode[M] != none)
		{
			FireMode[M].Instigator = Instigator;
			GiveAmmo(M, WeaponPickup(Pickup), bJustSpawned);
		}
		M++;
		// [Loop Continue]
		goto J0x192;
	}
	// End:0x227
	if((Instigator.Weapon != none) && Instigator.Weapon.IsFiring())
	{
		bPossiblySwitch = false;
	}
	// End:0x254
	if(Instigator.Weapon != W)
	{
		W.ClientWeaponSet(bPossiblySwitch);
	}
	// End:0x28C
	if(!bJustSpawned)
	{
		M = 0;
		J0x266:

		// End:0x289 [Loop If]
		if(M < 2)
		{
			Ammo[M] = none;
			M++;
			// [Loop Continue]
			goto J0x266;
		}
		Destroy();
	}
	//return;	
}

function Notify_ChangeRadarSkin()
{
	// End:0x1A
	if(bRadar)
	{
		Skins[ScreenIndex] = Shader'BWBP_SWC_Tex.BR1NK.RadarShader';
	}
	// End:0x30
	if(int(Role) == int(ROLE_Authority))
	{
		ClientNotify_ChangeRadarSkin();
	}
	//return;	
}

simulated function ClientNotify_ChangeRadarSkin()
{
	// End:0x1A
	if(bRadar)
	{
		Skins[ScreenIndex] = Shader'BWBP_SWC_Tex.BR1NK.RadarShader';
	}
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'InterfaceContent.HUD.SkinA');
	Level.AddPrecacheMaterial(Texture'AS_FX_TX.HUD.AssaultRadar');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function ShowTeamScorePassA(Canvas C)
{
	local float RadarWidth, PulseWidth, PulseBrightness;

	RadarScale = default.RadarScale * Class'Engine.HUD'.default.HudScale;
	RadarWidth = (0.5000000 * RadarScale) * C.ClipX;
	PulseWidth = RadarScale * C.ClipX;
	C.DrawColor = Class'Engine.HUD'.default.BlueColor;
	C.Style = 3;
	PulseBrightness = FMax(0.0000000, (1.0000000 - (float(2) * RadarPulse)) * 255.0000000);
	C.DrawColor.B = byte(PulseBrightness);
	C.SetPos((RadarPosX * C.ClipX) - (0.5000000 * PulseWidth), ((RadarPosY * C.ClipY) + RadarWidth) - (0.5000000 * PulseWidth));
	C.DrawTile(Texture'InterfaceContent.HUD.SkinA', PulseWidth, PulseWidth, 0.0000000, 880.0000000, 142.0000000, 142.0000000);
	PulseWidth = (RadarPulse * RadarScale) * C.ClipX;
	C.DrawColor = Class'Engine.HUD'.default.BlueColor;
	C.SetPos((RadarPosX * C.ClipX) - (0.5000000 * PulseWidth), ((RadarPosY * C.ClipY) + RadarWidth) - (0.5000000 * PulseWidth));
	C.DrawTile(Texture'InterfaceContent.HUD.SkinA', PulseWidth, PulseWidth, 0.0000000, 880.0000000, 142.0000000, 142.0000000);
	C.Style = 5;
	C.DrawColor.R = 167;
	C.DrawColor.G = 218;
	C.DrawColor.B = 232;
	C.SetPos((RadarPosX * C.ClipX) - RadarWidth, (RadarPosY * C.ClipY) + RadarWidth);
	C.DrawTile(Texture'AS_FX_TX.HUD.AssaultRadar', RadarWidth, RadarWidth, 0.0000000, 512.0000000, 512.0000000, -512.0000000);
	C.SetPos(RadarPosX * C.ClipX, (RadarPosY * C.ClipY) + RadarWidth);
	C.DrawTile(Texture'AS_FX_TX.HUD.AssaultRadar', RadarWidth, RadarWidth, 512.0000000, 512.0000000, -512.0000000, -512.0000000);
	C.SetPos((RadarPosX * C.ClipX) - RadarWidth, RadarPosY * C.ClipY);
	C.DrawTile(Texture'AS_FX_TX.HUD.AssaultRadar', RadarWidth, RadarWidth, 0.0000000, 0.0000000, 512.0000000, 512.0000000);
	C.SetPos(RadarPosX * C.ClipX, RadarPosY * C.ClipY);
	C.DrawTile(Texture'AS_FX_TX.HUD.AssaultRadar', RadarWidth, RadarWidth, 512.0000000, 0.0000000, -512.0000000, 512.0000000);
	//return;	
}

simulated function ShowTeamScorePassC(Canvas C)
{
	local Pawn P;
	local float dist, MaxDist, RadarWidth, PulseBrightness, Angle, DotSize,
		OffsetY, OffsetScale;

	local Rotator Dir;
	local Vector Start;

	Start = Pawn(Owner).Location;
	LastDrawRadar = Level.TimeSeconds;
	RadarWidth = (0.5000000 * RadarScale) * C.ClipX;
	DotSize = (24.0000000 * C.ClipX) * (Class'Engine.HUD'.default.HudScale / float(1600));
	MaxDist = 3000.0000000 * RadarPulse;
	C.Style = 3;
	OffsetY = RadarPosY + (RadarWidth / C.ClipY);
	MinEnemyDist = 3000.0000000;
	// End:0x545
	foreach DynamicActors(Class'Engine.Pawn', P)
	{
		// End:0x544
		if(P.Health > 0)
		{
			dist = VSize(Start - P.Location);
			// End:0x544
			if(dist < float(3000))
			{
				// End:0x15F
				if(dist < MaxDist)
				{
					PulseBrightness = 255.0000000 - (float(255) * Abs((dist * 0.0003300) - RadarPulse));					
				}
				else
				{
					PulseBrightness = 255.0000000 - (float(255) * Abs(((dist * 0.0003300) - RadarPulse) - float(1)));
				}
				// End:0x354
				if((xPawn(P) != none) && P != Owner)
				{
					MinEnemyDist = FMin(MinEnemyDist, dist);
					C.DrawColor.R = byte(PulseBrightness);
					C.DrawColor.G = byte(PulseBrightness);
					C.DrawColor.B = byte(PulseBrightness);
					Dir = Rotator(P.Location - Start);
					OffsetScale = (RadarScale * dist) * 0.0001670;
					Angle = (float(int(float(Dir.Yaw - Pawn(Owner).Rotation.Yaw)) & 65535) * 6.2832000) / float(65536);
					C.SetPos(((RadarPosX * C.ClipX) + ((OffsetScale * C.ClipX) * Sin(Angle))) - (0.5000000 * DotSize), ((OffsetY * C.ClipY) - ((OffsetScale * C.ClipX) * Cos(Angle))) - (0.5000000 * DotSize));
					C.DrawTile(Texture'InterfaceContent.HUD.SkinA', DotSize, DotSize, 838.0000000, 238.0000000, 144.0000000, 144.0000000);
					// End:0x544
					continue;
				}
				// End:0x4FD
				if((xPawn(P) != none) && P == Owner)
				{
					C.DrawColor.R = 128;
					C.DrawColor.G = 128;
					C.DrawColor.B = byte(255);
					Dir = Rotator(P.Location - Start);
					OffsetScale = (RadarScale * dist) * 0.0001670;
					Angle = (float(int(float(Dir.Yaw - Pawn(Owner).Rotation.Yaw)) & 65535) * 6.2832000) / float(65536);
					C.SetPos(((RadarPosX * C.ClipX) + ((OffsetScale * C.ClipX) * Sin(Angle))) - (0.5000000 * DotSize), ((OffsetY * C.ClipY) - ((OffsetScale * C.ClipX) * Cos(Angle))) - (0.5000000 * DotSize));
					C.DrawTile(Texture'InterfaceContent.HUD.SkinA', DotSize, DotSize, 838.0000000, 238.0000000, 144.0000000, 144.0000000);
					// End:0x544
					continue;
				}
				C.DrawColor.R = 0;
				C.DrawColor.G = 0;
				C.DrawColor.B = byte(PulseBrightness);
			}
		}		
	}	
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x5E
	if(((((AIController(Instigator.Controller) != none) && !IsGrenadeLoaded()) && (AmmoAmount(1)) > 0) && BotShouldReloadGrenade()) && !IsReloadingGrenade())
	{
		LoadGrenade();
	}
	// End:0x173
	if(bRadar)
	{
		RadarHeat = FMin(MaxRadarTime, RadarHeat + (RadarHeatRate * dt));
		RadarPulse = RadarPulse + (0.7500000 * dt);
		// End:0xC0
		if(RadarHeat >= MaxRadarTime)
		{
			ServerSwitchRadar(!bRadar);			
		}
		else
		{
			// End:0x170
			if(RadarPulse >= float(1))
			{
				// End:0x139
				if(MinEnemyDist < float(3000))
				{
					Meters = int(MinEnemyDist / 25.0000000);
					Pawn(Owner).PlaySound(RadarWarnSound,, FMin(2.0000000, 1200.0000000 / MinEnemyDist),,, FClamp(2000.0000000 / MinEnemyDist, 0.8100000, 2.0000000));					
				}
				else
				{
					Meters = -1;
					Pawn(Owner).PlaySound(RadarScanSound,, 1.0000000);
				}
				RadarPulse = RadarPulse - float(1);
			}
		}		
	}
	else
	{
		RadarHeat = FMax(0.0000000, RadarHeat - (RadarCoolRate * dt));
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
	Instigator.AmbientSound = UsedAmbientSound;
	Instigator.SoundVolume = default.SoundVolume;
	Instigator.SoundPitch = default.SoundPitch;
	Instigator.SoundRadius = default.SoundRadius;
	Instigator.bFullVolume = true;
	//return;	
}

simulated function float ChargeBar()
{
	return RadarHeat / MaxRadarTime;
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	// End:0x1C
	if(!bRadar && RadarHeat > float(0))
	{
		return;
	}
	ServerSwitchRadar(!bRadar);
	//return;	
}

function ServerSwitchRadar(bool bNewRadar)
{
	bRadar = bNewRadar;
	Notify_ChangeRadarSkin();
	// End:0x3E
	if(!bRadar)
	{
		ScreenStart();
		// End:0x3E
		if(!Instigator.IsLocallyControlled())
		{
			ClientScreenStart();
		}
	}
	UpdateScreen();
	// End:0x5C
	if(Instigator.IsLocallyControlled())
	{
		ClientSwitchRadar();
	}
	//return;	
}

simulated function ClientSwitchRadar()
{
	// End:0x21
	if(bRadar)
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, RadarOnSound);		
	}
	else
	{
		ScreenStart();
		// End:0x41
		if(!Instigator.IsLocallyControlled())
		{
			ClientScreenStart();
		}
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, RadarOffSound);
	}
	Notify_ChangeRadarSkin();
	UpdateScreen();
	//return;	
}

simulated event RenderOverlays(Canvas C)
{
	// End:0x1F
	if(bRadar)
	{
		ShowTeamScorePassA(C);
		ShowTeamScorePassC(C);
	}
	NumpadYOffset1 = 5 + ((MagAmmo / 10) * 49);
	NumpadYOffset2 = int(float(5) + ((float(MagAmmo) % float(10)) * float(49)));
	// End:0x79
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	super.RenderOverlays(C);
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
	super.Destroyed();
	//return;	
}

simulated event RenderTexture(ScriptedTexture Tex)
{
	Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 128.0000000, 0.0000000, 0.0000000, 256.0000000, 128.0000000, ScreenBase, MyFontColor);
	Tex.DrawTile(40.0000000, 65.0000000, 128.0000000, 128.0000000, 45.0000000, float(NumpadYOffset1), 50.0000000, 50.0000000, Numbers, MyFontColor);
	Tex.DrawTile(110.0000000, 65.0000000, 128.0000000, 128.0000000, 45.0000000, float(NumpadYOffset2), 50.0000000, 50.0000000, Numbers, MyFontColor);
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

simulated function Notify_BRINKGrenOpen()
{
	PlaySound(GrenOpenSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_BRINKGrenLoad()
{
	PlaySound(GrenLoadSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_BRINKGrenClose()
{
	PlaySound(GrenCloseSound, 1, 0.5000000,, 64.0000000);
	BRINKSecondaryFire(FireMode[1]).bLoaded = true;
	FireMode[1].PreFireTime = FireMode[1].default.PreFireTime;
	//return;	
}

function GrenadePickedUp()
{
	// End:0x5A
	if(Ammo[1].AmmoAmount < Ammo[1].MaxAmmo)
	{
		// End:0x42
		if(Instigator.Weapon == self)
		{
			LoadGrenade();			
		}
		else
		{
			BRINKSecondaryFire(FireMode[1]).bLoaded = true;
		}
	}
	// End:0x74
	if(!Instigator.IsLocallyControlled())
	{
		ClientGrenadePickedUp();
	}
	//return;	
}

simulated function ClientGrenadePickedUp()
{
	// End:0x56
	if(Ammo[1].AmmoAmount < Ammo[1].MaxAmmo)
	{
		// End:0x3E
		if(int(ClientState) == int(4))
		{
			LoadGrenade();			
		}
		else
		{
			BRINKSecondaryFire(FireMode[1]).bLoaded = true;
		}
	}
	//return;	
}

simulated function bool IsGrenadeLoaded()
{
	return BRINKSecondaryFire(FireMode[1]).bLoaded;
	//return;	
}

function GiveAmmo(int M, WeaponPickup WP, bool bJustSpawned)
{
	super.GiveAmmo(M, WP, bJustSpawned);
	// End:0x4E
	if((Ammo[1] != none) && Ammo_BRINKGrenades(Ammo[1]) != none)
	{
		Ammo_BRINKGrenades(Ammo[1]).DaF2K = self;
	}
	//return;	
}

simulated function LoadGrenade()
{
	// End:0x54
	if((Ammo[1].AmmoAmount < 1) || BRINKSecondaryFire(FireMode[1]).bLoaded)
	{
		// End:0x52
		if(!BRINKSecondaryFire(FireMode[1]).bLoaded)
		{
			PlayIdle();
		}
		return;
	}
	// End:0x82
	if(int(ReloadState) == int(0))
	{
		ReloadState = 9;
		PlayAnim(GrenadeLoadAnim, ReloadAnimRate + 0.1000000,, 0);
	}
	//return;	
}

function ServerStartReload(optional byte i)
{
	local int Channel;
	local name seq;
	local float frame, Rate;

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
	GetAnimParams(Channel, seq, frame, Rate);
	// End:0x48
	if(seq == GrenadeLoadAnim)
	{
		return;
	}
	// End:0xA8
	if((int(i) == 1) || (MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
	{
		// End:0xA6
		if(((AmmoAmount(1)) > 0) && !IsReloadingGrenade())
		{
			LoadGrenade();
			ClientStartReload(1);
		}
		return;
	}
	super.ServerStartReload();
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	// End:0x7D
	if(int(Level.NetMode) == int(NM_Client))
	{
		// End:0x72
		if((int(i) == 1) || (MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
		{
			// End:0x6F
			if(((AmmoAmount(1)) > 0) && !IsReloadingGrenade())
			{
				LoadGrenade();
			}			
		}
		else
		{
			CommonStartReload(i);
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

simulated function bool PutDown()
{
	// End:0x6C
	if(super.PutDown())
	{
		Instigator.AmbientSound = UsedAmbientSound;
		Instigator.SoundVolume = default.SoundVolume;
		Instigator.SoundPitch = default.SoundPitch;
		Instigator.SoundRadius = default.SoundRadius;
		Instigator.bFullVolume = false;
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
	// End:0x5D
	if(((AmmoAmount(1)) < 1) || !IsGrenadeLoaded())
	{
		return 0;		
	}
	else
	{
		// End:0x6B
		if(MagAmmo < 1)
		{
			return 1;
		}
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	Height = B.Enemy.Location.Z - Instigator.Location.Z;
	VDot = Normal(B.Enemy.Velocity) Dot Normal(Instigator.Location - B.Enemy.Location);
	Result = FRand() - 0.3000000;
	// End:0x159
	if(dist > float(800))
	{
		Result -= ((dist - float(800)) / float(2000));
	}
	// End:0x199
	if((dist < float(500)) && VDot > 0.3000000)
	{
		Result -= ((float(500) - dist) / float(1000));
	}
	// End:0x200
	if(VSize(B.Enemy.Velocity) > float(50))
	{
		// End:0x1D8
		if(Abs(VDot) > 0.8000000)
		{
			Result += 0.1000000;
		}
		// End:0x1F4
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
	// End:0x27B
	if(Height < float(-100))
	{
		Result += Abs((Height / float(2)) / dist);
	}
	// End:0x28D
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
	if(Anim == GrenadeLoadAnim)
	{
		return true;
	}
	return false;
	//return;	
}

function bool CanAttack(Actor Other)
{
	// End:0x61
	if(!IsGrenadeLoaded())
	{
		// End:0x41
		if(IsReloadingGrenade())
		{
			// End:0x3E
			if((Level.TimeSeconds - Instigator.LastPainTime) > 1.0000000)
			{
				return false;
			}			
		}
		else
		{
			// End:0x61
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.5000000, dist, BallisticProInstantFire(bFireMode[0]).DecayRange.Min, BallisticProInstantFire(bFireMode[0]).DecayRange.Max);
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

defaultproperties
{
	WeaponScreen=ScriptedTexture'BWBP_SWC_Tex.BR1NK.PulseScreen'
	ScreenIndex=3
	screen=Shader'BWBP_SWC_Tex.BR1NK.PulseScreenTex_SD'
	ScreenBase=FinalBlend'ONSstructureTextures.CoreGroup.InvisibleFinal'
	Numbers=Texture'BWBP_SKC_Tex.PUMA.PUMA-Numbers'
	MyFontColor=(R=255,G=255,B=255,A=255)
	RadarScale=0.2000000
	RadarPosX=0.9000000
	RadarPosY=0.2500000
	RadarScanSound=Sound'BWBP_SWC_Sounds.BR1NK.RadarScan'
	RadarWarnSound=Sound'BWBP_SWC_Sounds.BR1NK.RadarWarn'
	RadarOnSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75ThermalOn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=2.0000000,bAtten=false,bNoOverride=false)
	RadarOffSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75ThermalOff',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=2.0000000,bAtten=false,bNoOverride=false)
	RadarHeatRate=2.0000000
	RadarCoolRate=1.0000000
	MaxRadarTime=30.0000000
	GrenOpenSound=Sound'BW_Core_WeaponSound.M50.M50GrenOpen'
	GrenLoadSound=Sound'BW_Core_WeaponSound.M50.M50GrenLoad'
	GrenCloseSound=Sound'BW_Core_WeaponSound.M50.M50GrenClose'
	GrenadeLoadAnim="GrenadeReload"
	ScopeBone="EOTech"
	SpecialInfo[0]=(Id="EvoDefs",Info="320.0;25.0;1.0;110.0;0.8;0.5;0.0")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SWC_Tex.BR1NK.BigIcon_BR1NK'
	BigIconCoords=(X1=32,Y1=40,X2=475,Y2=212)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Pullout',Volume=0.2220000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Putaway',Volume=0.2220000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Double Barrel",bUnavailable=false,ModeID="WM_Burst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Single Barrel",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_SWC_Sounds.BR1NK.BR1NK-Cock',Volume=1.1000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-MagFiddle',Volume=1.2000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SWC_Sounds.BR1NK.BR1NK-CLipOut',Volume=1.2000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SWC_Sounds.BR1NK.BR1NK-ClipIn',Volume=1.2000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc9',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.A73OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=129,G=0,B=255,A=140),Color2=(R=255,G=0,B=0,A=255),StartSize1=84,StartSize2=26)
	bWT_Bullet=true
	ManualLines[0]="5.56mm fire. Has a fast fire rate and high sustained DPS, but high recoil, limiting its hipfire."
	ManualLines[1]="Launches a cryogenic grenade. Upon impact, freezes nearby enemies, slowing their movement. The effect is proportional to their distance from the epicentre. This attack will also extinguish the fires of an FP7 grenade."
	ManualLines[2]="The Weapon Special key attaches a suppressor. This reduces the recoil, but also the effective range. The flash is removed and the gunfire becomes less audible.||Effective at close to medium range."
	SightOffset=(X=-7.0000000,Y=-0.4000000,Z=16.2000000)
	CockAnimRate=0.9500000
	ReloadAnimRate=0.9500000
	FireModeClass[0]=Class'BWBP_SWC_Pro.BRINKPrimaryFire'
	FireModeClass[1]=Class'BWBP_SWC_Pro.BRINKSecondaryFire'
	PutDownTime=0.7000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7500000
	CurrentRating=0.7500000
	bShowChargingBar=true
	Description="BR1-NK Light Support Weapon||Manufacturer: Black & Wood|Primary: Variable bullets (fully automatic)|Secondary: Launch Grenade|Special: Motion Tracker||The UTC space station 'Argent' was responsible for reverse engineering Skrith technology for use in the war. When Argent was taken by a regiment of Krao, the UTC commissioned Black & Wood to create a new weapon that would allow a small strike team to reclaim the outpost. The BR1-NK was given smaller rounds and a high rate of fire in order to quickly dispatch Krao swarms, as well as piercing rounds that could be shot through the Kraos' newly erected barriers. The high-velocity grenades were intentionally made less potent so as not to damage the facility. The one thing that made the weapon invaluable against the Krao, however, was the advanced motion tracker that the UTC soldiers used to avoid ambushes and any roaming Krao that hid in vents. Thanks to the BR1-NK, the UTC reclaimed the station with minimal damage and zero loss of life."
	Priority=65
	HudColor=(R=125,G=175,B=255,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=6
	PickupClass=Class'BWBP_SWC_Pro.BRINKPickup'
	PlayerViewOffset=(X=5.0000000,Y=4.5000000,Z=-11.5000000)
	BobDamping=2.0000000
	AttachmentClass=Class'BWBP_SWC_Pro.BRINKAttachment'
	IconMaterial=Texture'BWBP_SWC_Tex.BR1NK.SmallIcon_BR1NK'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="BR1-NK Mod-2 LSW"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_SWC_Anims.BRINK_FPm'
	DrawScale=0.2500000
}
