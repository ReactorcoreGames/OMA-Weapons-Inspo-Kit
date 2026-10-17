class AS50Rifle extends BallisticWeapon
	config(BallisticProV55);

var() name ScopeBone;
var name BulletBone;
var() FullSound ThermalOnSound;
var() FullSound ThermalOffSound;
var array<Pawn> PawnList;
var() Material WallVisionSkin;
var bool bThermal;
var bool bUpdatePawns;
var Pawn UpdatedPawns[128];
var() Material Flaretex;
var() float ThermalRange;
var ColorModifier ColorMod;
var Actor NVLight;
var float NextPawnListUpdateTime;
var() Texture ScopeViewTexThermal;
var int NumpadYOffset1;
var int NumpadYOffset2;
var() ScriptedTexture WeaponScreen;
var() Material screen;
var() Material ScreenBaseX;
var() Material ScreenBase1;
var() Material ScreenBase2;
var() Material ScreenBase3;
var() Material ScreenBase4;
var() Material Numbers;
var protected const Color MyFontColor;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerAdjustThermal;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		ClientScreenStart;
}

simulated event PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	// End:0x32
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassic())
	{
		FireModeClass[0] = Class'BWBP_SKC_Pro.AS50SecondaryFire';
		FireModeClass[1] = Class'BCoreProV55.BallisticScopeFire';
	}
	// End:0x5E
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsRealism())
	{
		FireModeClass[0] = Class'BWBP_SKC_Pro.AS50SecondaryFire';
		FireModeClass[1] = Class'BWBP_SKC_Pro.AS50DeployFire';
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
	Skins[5] = screen;
	UpdateScreen();
	// End:0x58
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
	// End:0x65
	if(ColorMod != none)
	{
		Level.ObjectPool.FreeObject(ColorMod);
		ColorMod = none;
	}
	AdjustThermalView(false);
	// End:0x83
	if(NVLight != none)
	{
		NVLight.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated event RenderTexture(ScriptedTexture Tex)
{
	Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 128.0000000, 0.0000000, 0.0000000, 256.0000000, 128.0000000, ScreenBaseX, MyFontColor);
	Tex.DrawTile(0.0000000, 45.0000000, 70.0000000, 70.0000000, 45.0000000, float(NumpadYOffset1), 50.0000000, 50.0000000, Numbers, MyFontColor);
	Tex.DrawTile(20.0000000, 45.0000000, 70.0000000, 70.0000000, 40.0000000, float(NumpadYOffset2), 50.0000000, 50.0000000, Numbers, MyFontColor);
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

function ServerSwitchWeaponMode(byte newmode)
{
	super.ServerSwitchWeaponMode(newmode);
	UpdateScreen();
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

	// End:0x205 [Loop If]
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
		// End:0x1E7
		if(((((t != none) && HitLoc.Z <= ((Start.Z - float(Class'BCoreProV55.BallisticTurret'.default.MinTurretEyeDepth)) - float(4))) && t.bWorldGeometry && (Sandbag(t) == none) || Sandbag(t).AttachedWeapon == none) && HitNorm.Z >= 0.9000000) && FastTrace(HitLoc, Start))
		{
			// [Explicit Break]
			goto J0x205;
		}
		// End:0x1F7
		if(Forward <= float(45))
		{
			return;
		}
		Forward -= float(15);
		// [Loop Continue]
		goto J0x5F;
	}
	J0x205:

	FireMode[1].bIsFiring = false;
	FireMode[1].StopFiring();
	// End:0x281
	if(Sandbag(t) != none)
	{
		HitLoc = t.Location;
		HitLoc.Z += (Class'BWBP_SKC_Pro.AS50Turret'.default.CollisionHeight + (t.CollisionHeight * 0.7500000));		
	}
	else
	{
		HitLoc.Z += (Class'BWBP_SKC_Pro.AS50Turret'.default.CollisionHeight - float(9));
	}
	CompressedEq = Instigator.Rotation;
	CompressedEq.Pitch = (CompressedEq.Pitch >> 8) & 255;
	CompressedEq.Yaw = (CompressedEq.Yaw >> 8) & 255;
	CompressedEq.Pitch = CompressedEq.Pitch << 8;
	CompressedEq.Yaw = CompressedEq.Yaw << 8;
	Turret = Spawn(Class'BWBP_SKC_Pro.AS50Turret', none,, HitLoc, Instigator.Rotation);
	// End:0x3A2
	if(Turret != none)
	{
		// End:0x378
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
		Log("Notify_Deploy: Could not spawn turret for AS50 AMR.");
	}
	//return;	
}

simulated function OnScopeViewChanged()
{
	super.OnScopeViewChanged();
	// End:0x3E
	if(!bScopeView)
	{
		// End:0x34
		if(int(Level.NetMode) == int(NM_Client))
		{
			AdjustThermalView(false);			
		}
		else
		{
			ServerAdjustThermal(false);
		}		
	}
	else
	{
		// End:0x71
		if(bThermal)
		{
			// End:0x6A
			if(int(Level.NetMode) == int(NM_Client))
			{
				AdjustThermalView(true);				
			}
			else
			{
				ServerAdjustThermal(true);
			}
		}
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
	// End:0x5E
	if(ColorMod != none)
	{
		return;
	}
	ColorMod = ColorModifier(Level.ObjectPool.AllocateObject(Class'Engine.ColorModifier'));
	// End:0x121
	if(ColorMod != none)
	{
		ColorMod.Material = Texture'Engine.MenuWhite';
		ColorMod.Color.R = byte(255);
		ColorMod.Color.G = 0;
		ColorMod.Color.B = 0;
		ColorMod.Color.A = 0;
		ColorMod.AlphaBlend = false;
		ColorMod.RenderTwoSided = true;
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x35
	if(super.PutDown())
	{
		// End:0x2C
		if(int(Level.NetMode) == int(NM_Client))
		{
			AdjustThermalView(false);			
		}
		else
		{
			ServerAdjustThermal(false);
		}
		return true;
	}
	return false;
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x24
	if((int(ClientState) != int(4)) || int(ReloadState) != int(0))
	{
		return;
	}
	bThermal = !bThermal;
	// End:0x5C
	if(bThermal)
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ThermalOnSound);
		ServerWeaponSpecial(1);		
	}
	else
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ThermalOffSound);
		ServerWeaponSpecial(0);
	}
	AdjustThermalView(bThermal);
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	bThermal = bool(i);
	ServerAdjustThermal(bThermal);
	//return;	
}

simulated function AdjustThermalView(bool bNewValue)
{
	// End:0x1B
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x31
	if(!bNewValue)
	{
		bUpdatePawns = false;		
	}
	else
	{
		bUpdatePawns = true;
		UpdatePawnList();
		NextPawnListUpdateTime = Level.TimeSeconds + float(1);
	}
	//return;	
}

function ServerAdjustThermal(bool bNewValue)
{
	local int i;

	// End:0x33
	if(bNewValue)
	{
		bUpdatePawns = true;
		UpdatePawnList();
		NextPawnListUpdateTime = Level.TimeSeconds + float(1);		
	}
	else
	{
		bUpdatePawns = false;
		i = 0;
		J0x42:

		// End:0x94 [Loop If]
		if(i < 128)
		{
			// End:0x8A
			if(UpdatedPawns[i] != none)
			{
				UpdatedPawns[i].bAlwaysRelevant = UpdatedPawns[i].default.bAlwaysRelevant;
			}
			i++;
			// [Loop Continue]
			goto J0x42;
		}
	}
	//return;	
}

simulated function WeaponTick(float DeltaTime)
{
	local Actor t;
	local Vector HitLoc, HitNorm, Start, End;

	super.WeaponTick(DeltaTime);
	// End:0x29
	if(Level.TimeSeconds >= NextPawnListUpdateTime)
	{
		UpdatePawnList();
	}
	// End:0x3F
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	// End:0x14B
	if(bThermal && bScopeView)
	{
		SetNVLight(true);
		Start = Instigator.Location + Instigator.EyePosition();
		End = Start + (Vector(Instigator.GetViewRotation()) * float(1500));
		t = Trace(HitLoc, HitNorm, End, Start, true, vect(16.0000000, 16.0000000, 16.0000000));
		// End:0xE7
		if(t == none)
		{
			HitLoc = End;
		}
		// End:0x12A
		if(VSize(HitLoc - Start) > float(400))
		{
			NVLight.SetLocation(Start + ((HitLoc - Start) * 0.5000000));			
		}
		else
		{
			NVLight.SetLocation(HitLoc + (HitNorm * float(30)));
		}		
	}
	else
	{
		SetNVLight(false);
	}
	//return;	
}

final simulated function SetScreenMode()
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
	//return;	
}

simulated function RenderOverlays(Canvas C)
{
	SetScreenMode();
	super.RenderOverlays(C);
	//return;	
}

simulated function DrawScopeOverlays(Canvas C)
{
	// End:0x22
	if(bThermal)
	{
		DrawThermalMode(C);
		ScopeViewTex = ScopeViewTexThermal;		
	}
	else
	{
		ScopeViewTex = default.ScopeViewTex;
	}
	super.DrawScopeOverlays(C);
	//return;	
}

simulated function UpdatePawnList()
{
	local Pawn P;
	local int i;
	local float dist;

	PawnList.Length = 0;
	// End:0x21E
	foreach DynamicActors(Class'Engine.Pawn', P)
	{
		// End:0x96
		if(((P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team != none) && P.PlayerReplicationInfo.Team.TeamIndex == Instigator.PlayerReplicationInfo.Team.TeamIndex)
		{
			continue;			
		}
		PawnList[PawnList.Length] = P;
		dist = VSize(P.Location - Instigator.Location);
		// End:0x21D
		if(((dist <= ThermalRange) && (Normal(P.Location - (Instigator.Location + Instigator.EyePosition())) Dot Vector(Instigator.GetViewRotation())) > (float(1) - ((Instigator.Controller.FovAngle * 0.9000000) / float(180)))) && Instigator.LineOfSightTo(P) || (Normal(P.Location - Instigator.Location) Dot Vector(Instigator.GetViewRotation())) > (0.9850000 + (0.0150000 * (dist / ThermalRange))))
		{
			// End:0x205
			if(!Instigator.IsLocallyControlled())
			{
				P.NetUpdateTime = Level.TimeSeconds - float(1);
				P.bAlwaysRelevant = true;
			}
			UpdatedPawns[i] = P;
			i++;
		}		
	}	
	//return;	
}

simulated event DrawThermalMode(Canvas C)
{
	local Pawn P;
	local int i, j;
	local float dist, DotP;
	local array<Material> OldSkins;
	local int OldSkinCount;
	local bool bFocused;
	local Vector Start;
	local array<Material> AttOldSkins0, AttOldSkins1;

	C.ColorModulate.W = 1.0000000;
	C.Style = 4;
	C.SetPos(float(C.SizeX - C.SizeY) / float(2), C.OrgY);
	C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
	C.DrawTile(FinalBlend'BWBP_SKC_Tex.FSG50.FSGIRFinal', float(C.SizeY), float(C.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);
	C.SetPos(C.OrgX, C.OrgY);
	C.DrawTile(FinalBlend'BWBP_SKC_Tex.SKAR.SKAR-StaticFinal', float(C.SizeX), float(C.SizeY), 0.0000000, 0.0000000, 512.0000000, 512.0000000);
	// End:0x14E
	if(ColorMod == none)
	{
		return;
	}
	C.Style = 5;
	Start = Instigator.Location + Instigator.EyePosition();
	j = 0;
	J0x18B:

	// End:0x7C2 [Loop If]
	if(j < PawnList.Length)
	{
		// End:0x7B8
		if((PawnList[j] != none) && PawnList[j] != Level.GetLocalPlayerController().Pawn)
		{
			P = PawnList[j];
			bFocused = false;
			ThermalRange = default.ThermalRange;
			dist = VSize(P.Location - Instigator.Location);
			// End:0x232
			if(dist > ThermalRange)
			{
				// [Explicit Continue]
				goto J0x7B8;
			}
			DotP = Normal(P.Location - Start) Dot Vector(Instigator.GetViewRotation());
			// End:0x296
			if(DotP < Cos((Instigator.Controller.FovAngle / 1.7000000) * 0.2500000))
			{
				// [Explicit Continue]
				goto J0x7B8;
			}
			// End:0x2BD
			if(!FastTrace(P.Location, Instigator.Location))
			{
				// [Explicit Continue]
				goto J0x7B8;
			}
			OldSkinCount = P.Skins.Length;
			i = 0;
			J0x2D9:

			// End:0x34F [Loop If]
			if(i < Max(2, OldSkinCount))
			{
				// End:0x31E
				if(OldSkinCount > i)
				{
					OldSkins[i] = P.Skins[i];					
				}
				else
				{
					OldSkins[i] = none;
				}
				P.Skins[i] = ColorMod;
				i++;
				// [Loop Continue]
				goto J0x2D9;
			}
			P.bUnlit = true;
			i = 0;
			J0x367:

			// End:0x57A [Loop If]
			if(i < P.Attached.Length)
			{
				// End:0x570
				if(P.Attached[i] != none)
				{
					// End:0x550
					if((Pawn(P.Attached[i]) != none) || ONSWeapon(P.Attached[i]) != none)
					{
						// End:0x451
						if(P.Attached[i].Skins.Length > 0)
						{
							AttOldSkins0[i] = P.Attached[i].Skins[0];
							P.Attached[i].Skins[0] = ColorMod;							
						}
						else
						{
							AttOldSkins0[i] = none;
							P.Attached[i].Skins[0] = ColorMod;
						}
						// End:0x4F7
						if(P.Attached[i].Skins.Length > 1)
						{
							AttOldSkins1[i] = P.Attached[i].Skins[1];
							P.Attached[i].Skins[1] = ColorMod;
						}
						// End:0x54D
						if(P.Attached[i].Skins.Length > 1)
						{
							AttOldSkins1[i] = none;
							P.Attached[i].Skins[1] = ColorMod;
						}
						// [Explicit Continue]
						goto J0x570;
					}
					P.Attached[i].SetDrawType(0);
				}
				J0x570:

				i++;
				// [Loop Continue]
				goto J0x367;
			}
			C.DrawActor(P, false, true);
			P.Skins.Length = OldSkinCount;
			i = 0;
			J0x5A9:

			// End:0x5EC [Loop If]
			if(i < P.Skins.Length)
			{
				P.Skins[i] = OldSkins[i];
				i++;
				// [Loop Continue]
				goto J0x5A9;
			}
			P.bUnlit = false;
			i = 0;
			J0x604:

			// End:0x7A8 [Loop If]
			if(i < P.Attached.Length)
			{
				// End:0x79E
				if(P.Attached[i] != none)
				{
					// End:0x763
					if((Pawn(P.Attached[i]) != none) || ONSWeapon(P.Attached[i]) != none)
					{
						// End:0x70A
						if(AttOldSkins1[i] == none)
						{
							// End:0x6BC
							if(AttOldSkins0[i] == none)
							{
								P.Attached[i].Skins.Length = 0;								
							}
							else
							{
								P.Attached[i].Skins.Length = 1;
								P.Attached[i].Skins[0] = AttOldSkins0[i];
							}							
						}
						else
						{
							P.Attached[i].Skins[0] = AttOldSkins0[i];
							P.Attached[i].Skins[1] = AttOldSkins1[i];
						}
						// [Explicit Continue]
						goto J0x79E;
					}
					P.Attached[i].SetDrawType(P.Attached[i].default.DrawType);
				}
				J0x79E:

				i++;
				// [Loop Continue]
				goto J0x604;
			}
			AttOldSkins0.Length = 0;
			AttOldSkins1.Length = 0;
		}
		J0x7B8:

		j++;
		// [Loop Continue]
		goto J0x18B;
	}
	//return;	
}

simulated function SetNVLight(bool bOn)
{
	// End:0x16
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	// End:0x6D
	if(bOn)
	{
		// End:0x59
		if(NVLight == none)
		{
			NVLight = Spawn(Class'BWBP_SKC_Pro.HKARNVLight',,, Instigator.Location);
			NVLight.SetBase(Instigator);
		}
		NVLight.bDynamicLight = true;		
	}
	else
	{
		// End:0x89
		if(NVLight != none)
		{
			NVLight.bDynamicLight = false;
		}
	}
	//return;	
}

static function Class<Pickup> RecommendAmmoPickup(int Mode)
{
	return Class'BWBP_SKC_Pro.AP_50IncMag';
	//return;	
}

simulated function bool HasAmmo()
{
	// End:0x2B
	if((FireMode[0] != none) && MagAmmo >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	// End:0x70
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
	return -0.7000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.7000000;
	//return;	
}

defaultproperties
{
	ScopeBone="Scope"
	BulletBone="Bullet"
	ThermalOnSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75ThermalOn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ThermalOffSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75ThermalOff',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	WallVisionSkin=FinalBlend'BW_Core_WeaponTex.M75.OrangeFinal'
	Flaretex=FinalBlend'BW_Core_WeaponTex.M75.OrangeFlareFinal'
	ThermalRange=9000.0000000
	ScopeViewTexThermal=Texture'BWBP_SKC_Tex.FSG50.FSG-ScopeViewThermal'
	WeaponScreen=ScriptedTexture'BWBP_SKC_Tex.FSG50.FSG50-ScriptLCD'
	screen=Shader'BWBP_SKC_Tex.FSG50.FSG50-ScriptLCD-SD'
	ScreenBase1=Texture'BWBP_SKC_Tex.FG50.FG50-Screen'
	ScreenBase2=Texture'BWBP_SKC_Tex.FG50.FG50-Screen2'
	ScreenBase3=Texture'BWBP_SKC_Tex.FG50.FG50-Screen3'
	ScreenBase4=Texture'BWBP_SKC_Tex.FG50.FG50-Screen4'
	Numbers=Texture'BWBP_SKC_Tex.PUMA.PUMA-Numbers'
	MyFontColor=(R=255,G=255,B=255,A=255)
	SpecialInfo[0]=(Id="EvoDefs",Info="360.0;35.0;1.0;90.0;10.0;0.0;0.1")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.AS50WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.AS50WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.AS50WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.AS50WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.FSG50.BigIcon_FSG50'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.MRL.MRL-BigOn',Volume=0.2100000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.MRL.MRL-BigOff',Volume=0.2150000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MinZoom=4.0000000
	MaxZoom=16.0000000
	FullZoomFOV=15.0000000
	ScopeViewTex=Texture'BWBP_SKC_Tex.FSG50.FSG-ScopeView'
	bNoCrosshairInScope=true
	CockAnimPostReload="Cock"
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.AS50.FG50-Cock',Volume=2.5000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.AS50.FG50-MagOut',Volume=1.5000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.AS50.FG50-MagIn',Volume=1.5000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.8500000
	bAltTriggerReload=true
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Cross4',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M353OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=255,B=0,A=153),Color2=(R=0,G=0,B=0,A=255),StartSize1=22,StartSize2=61)
	MeleeFireClass=Class'BWBP_SKC_Pro.AS50MeleeFire'
	bWT_Bullet=true
	ManualLines[0]="Semi-automatic .50 cal fire. Extremely unpredictable recoil, but good damage per shot and excellent theoretical sustained damage output."
	ManualLines[1]="Incendiary shot. Deals moderate damage and ignites struck targets, causing them to burn brightly, emit smoke, suffer view flash and take damage over time. Further hits extend the duration of this effect."
	ManualLines[2]="The Weapon Function key toggles the IR component of the weapon's scope. This is useful for highlighting enemies through environmental features like water or trees, or through smoke.||The FSSG-50 is heavy and burdens the player, reducing movement speed and jump height. It takes time to aim.||The FSSG-50 is effective at long range."
	SightOffset=(X=3.0000000,Y=0.0000000,Z=3.7000000)
	MagAmmo=8
	GunLength=80.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.AS50PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.AS50SecondaryFire'
	IdleAnimRate=0.6000000
	PutDownTime=0.6000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	bSniping=true
	Description="[ FallschirmjÃ¤gerscharfschÃºtzengewehr] FSsG-50 is the name given to high-performance FG50 machineguns that are then equipped with match-grade barrels and high-quality custom marksman stocks. FG-50s with exceptional target groupings and perfect reliability ratings are the primary candidates for the FSsG upgrade, though some production plants with extremely tight tolerances and quality control specifically produce the FSsG variant. The result is a very accurate sniper rifle with a muzzle velocity far higher than its standard cousin. These elite rifles are very rarely mounted on vehicle platforms and are often utilized by sharpshooters equipped with enhanced scopes and match-grade N6-BMG rounds for hard target interdiction. This FSSG-50 is firing the mass produced N1-Incendiary round and has an Aeris Mark 2 Suresight scope attached."
	Priority=207
	HudColor=(R=255,G=50,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=9
	PickupClass=Class'BWBP_SKC_Pro.AS50Pickup'
	PlayerViewOffset=(X=4.0000000,Y=4.0000000,Z=-5.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.AS50Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.FSG50.SmallIcon_FSG50'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="FSSG-50 Marksman Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.FSSG-50_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Texture'BWBP_SKC_Tex.FSG50.FSG-Main'
	Skins[2]=Texture'BWBP_SKC_Tex.FSG50.FSG-Misc'
	Skins[3]=Texture'BWBP_SKC_Tex.FSG50.FSG-Stock'
	Skins[4]=Texture'BWBP_SKC_Tex.FSG50.FSG-Scope'
	Skins[5]=Texture'BWBP_SKC_Tex.FG50.FG50-Screen'
}
