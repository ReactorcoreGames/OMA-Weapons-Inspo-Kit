class BallisticPlayer extends xPlayer
	config(User);

struct UIWeaps
{
	var array<Inventory> items;
};

var() globalconfig bool bUseWeaponUI;
var bool bIsInWeaponUI;
var UIWeaps WeaponGroups[11];
var int WGroup;
var int WItem;
var string GroupNames[11];
var Sound WeapUIEnter;
var Sound WeapUIExit;
var Sound WeapUIFail;
var Sound WeapUIUse;
var Sound WeapUICycle;
var Sound WeapUIChange;
var int InventoryLength;
var globalconfig float ZoomTimeMod;
var globalconfig bool bOldBehindView;
var Rotator BehindViewAimRotator;
var globalconfig float SavedBehindDistFactor;
var float BehindDistFactor;
var() localized string WeapUIHelp[4];
var float IconPulsePhase;
var float LastUIDrawTime;
var Class<Weapon> LastLoadoutClasses[7];
var Class<Weapon> LastStreaks[2];
var float DesiredFlashScale;
var Vector DesiredFlashFog;
var bool bOverrideDmgFlash;
var transient float PitchFraction;
var transient float YawFraction;
var array<Actor> PendingScreenBlood;

replication
{
	// Pos:0x01A
	unreliable if(int(Role) == int(ROLE_Authority))
		ClientDmgFlash;

	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		LastLoadoutClasses;

	// Pos:0x00D
	reliable if(int(Role) < int(ROLE_Authority))
		ServerCamDist, ServerReloaded;
}

simulated event PostBeginPlay()
{
	local int C;

	super(UnrealPlayer).PostBeginPlay();
	C = 0;
	J0x0D:

	// End:0xC7 [Loop If]
	if(C < 16)
	{
		// End:0xBD
		if(ComboNameList[C] != "")
		{
			// End:0x61
			if(ComboNameList[C] ~= "XGame.ComboInvis")
			{
				ComboList[C] = Class'XGame.Combo';				
			}
			else
			{
				ComboList[C] = Class<Combo>(DynamicLoadObject(ComboNameList[C], Class'Core.Class'));
			}
			// End:0x9C
			if(ComboList[C] == none)
			{
				// [Explicit Break]
				goto J0xC7;
			}
			MinAdrenalineCost = FMin(MinAdrenalineCost, ComboList[C].default.AdrenalineCost);
		}
		C++;
		// [Loop Continue]
		goto J0x0D;
	}
	J0xC7:

	FillCameraList();
	LastKillTime = -5.0000000;
	//return;	
}

simulated exec function ChangeCamDist(float F)
{
	SavedBehindDistFactor = F;
	SaveConfig();
	BehindDistFactor = F;
	// End:0x34
	if(int(Role) < int(ROLE_Authority))
	{
		ServerCamDist(SavedBehindDistFactor);
	}
	//return;	
}

function ServerCamDist(float F)
{
	BehindDistFactor = F;
	//return;	
}

function WeaponShakeView(Vector shRotMag, Vector shRotRate, float shRotTime, Vector shOffsetMag, Vector shOffsetRate, float shOffsetTime)
{
	// End:0x67
	if(bWeaponViewShake || Class'BCoreProV55.BallisticGameStyles'.static.GetReplicatedStyle().default.bForceViewShake)
	{
		ShakeView(shRotMag * (1.0000000 - ZoomLevel), shRotRate, shRotTime, shOffsetMag * (1.0000000 - ZoomLevel), shOffsetRate, shOffsetTime);
	}
	//return;	
}

simulated function bool CheckInventoryChange()
{
	local Inventory Inv;
	local int i;

	Inv = Pawn.Inventory;
	J0x14:

	// End:0x3D [Loop If]
	if(Inv != none)
	{
		i++;
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x14;
	}
	// End:0x59
	if(i != InventoryLength)
	{
		InventoryLength = i;
		return true;
	}
	return false;
	//return;	
}

simulated function RenderOverlays(Canvas C)
{
	super(Controller).RenderOverlays(C);
	// End:0x1F
	if(bIsInWeaponUI)
	{
		DrawWeaponUI(C);
	}
	DrawPendingScreenBlood(C);
	//return;	
}

simulated function DrawPendingScreenBlood(Canvas C)
{
	local int i;

	// End:0x0E
	if(PendingScreenBlood.Length == 0)
	{
		return;
	}
	i = PendingScreenBlood.Length - 1;
	J0x1D:

	// End:0x85 [Loop If]
	if(i >= 0)
	{
		// End:0x62
		if((PendingScreenBlood[i] == none) || PendingScreenBlood[i].bDeleteMe)
		{
			PendingScreenBlood.Remove(i, 1);
			// [Explicit Continue]
			goto J0x7B;
		}
		C.DrawActor(PendingScreenBlood[i], false, false);
		J0x7B:

		i--;
		// [Loop Continue]
		goto J0x1D;
	}
	//return;	
}

simulated function DrawCanvasScreenBlood(Class<Actor> SpawnClass, optional Actor SpawnOwner, optional Vector SpawnLocation, optional Rotator SpawnRotation)
{
	local Actor E;

	// End:0x28
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || SpawnClass == none)
	{
		return;
	}
	E = Spawn(SpawnClass, SpawnOwner,, SpawnLocation, SpawnRotation);
	// End:0x74
	if(E != none)
	{
		E.bHidden = false;
		PendingScreenBlood[PendingScreenBlood.Length] = E;
	}
	//return;	
}

simulated function DrawWeaponUI(Canvas C)
{
	local int i, j;
	local float ScaleFactor, Xs, Ys, IconXSize, IconYSize, OutXSize,
		SmoothPulsePhase, XL, YL, YLC;

	local string ammoTxt;

	// End:0x0D
	if(Pawn == none)
	{
		return;
	}
	// End:0x1C
	if(CheckInventoryChange())
	{
		ListItems();
	}
	IconPulsePhase = Class'BCoreProV55.BUtil'.static.LoopFloat(IconPulsePhase, (Level.TimeSeconds - LastUIDrawTime) * float(2), 1.0000000, 0.0000000);
	// End:0x8F
	if(IconPulsePhase > 0.5000000)
	{
		SmoothPulsePhase = Smerp((IconPulsePhase * float(2)) - float(1), 1.0000000, 0.0000000);		
	}
	else
	{
		SmoothPulsePhase = Smerp(IconPulsePhase * float(2), 0.0000000, 1.0000000);
	}
	ScaleFactor = FMin(float(C.SizeX) / float(2200), float(C.SizeY) / float(1800)) * Class'Engine.HUD'.default.HudScale;
	Xs = 128.0000000 * ScaleFactor;
	Ys = 64.0000000 * ScaleFactor;
	LastUIDrawTime = Level.TimeSeconds;
	// End:0x156
	if(int(C.Style) != 5)
	{
		C.Style = 5;
	}
	i = 0;
	J0x15D:

	// End:0x8B6 [Loop If]
	if(i < 10)
	{
		C.SetPos(4.0000000 * ScaleFactor, (188.0000000 + float(96 * i)) * ScaleFactor);
		C.SetDrawColor(byte(255), byte(255), byte(255));
		C.Font = Class'BCoreProV55.BallisticWeapon'.static.GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
		C.DrawColor.A = byte(Class'Engine.HUD'.default.HudOpacity);
		// End:0x258
		if(WeaponGroups[i].items.Length < 1)
		{
			C.SetDrawColor(0, 0, 0, byte(Class'Engine.HUD'.default.HudOpacity));
		}
		// End:0x29D
		if((WeaponGroups[i].items.Length > 0) || !Class'Engine.HUD'.default.bSmallWeaponBar)
		{
			C.DrawText(GroupNames[i], false);
		}
		j = 0;
		J0x2A4:

		// End:0x8AC [Loop If]
		if(j < WeaponGroups[i].items.Length)
		{
			// End:0x2DE
			if(WeaponGroups[i].items[j] == none)
			{
				// [Explicit Continue]
				goto J0x8A2;
			}
			C.SetPos((96.0000000 + float(132 * j)) * ScaleFactor, (160.0000000 + float(96 * i)) * ScaleFactor);
			// End:0x386
			if((Weapon(WeaponGroups[i].items[j]) != none) && !Weapon(WeaponGroups[i].items[j]).HasAmmo())
			{
				C.SetDrawColor(byte(255), 0, 0);				
			}
			else
			{
				// End:0x3F1
				if((BallisticWeapon(WeaponGroups[i].items[j]) != none) && !BallisticWeapon(WeaponGroups[i].items[j]).HasAmmoLoaded(byte(255)))
				{
					C.SetDrawColor(byte(255), 128, 0);					
				}
				else
				{
					C.SetDrawColor(0, 0, byte(255));
				}
			}
			// End:0x473
			if((Weapon(WeaponGroups[i].items[j]) != none) && int(Weapon(WeaponGroups[i].items[j]).ClientState) != int(1))
			{
				C.DrawColor.G += byte(128);
			}
			// End:0x52C
			if((i == WGroup) && j == WItem)
			{
				C.DrawColor.R = byte(Min(255, int(C.DrawColor.R) + 96));
				C.DrawColor.G = byte(Min(255, int(C.DrawColor.G) + 96));
				C.DrawColor.B = byte(Min(255, int(C.DrawColor.B) + 96));
			}
			C.DrawTileStretched(Texture'BW_Core_WeaponTex.ui.WeaponUIFrame', Xs, Ys);
			// End:0x56D
			if((i == WGroup) && j == WItem)
			{
				// [Explicit Continue]
				goto J0x8A2;
			}
			C.SetDrawColor(byte(255), byte(255), byte(255));
			// End:0x667
			if((BallisticWeapon(WeaponGroups[i].items[j]) != none) && BallisticWeapon(WeaponGroups[i].items[j]).BigIconMaterial != none)
			{
				C.SetPos((96.0000000 + float(132 * j)) * ScaleFactor, (160.0000000 + float(96 * i)) * ScaleFactor);
				C.DrawTile(BallisticWeapon(WeaponGroups[i].items[j]).BigIconMaterial, Xs, Ys, 0.0000000, 0.0000000, 512.0000000, 256.0000000);
				// [Explicit Continue]
				goto J0x8A2;
			}
			// End:0x832
			if(WeaponGroups[i].items[j].IconMaterial != none)
			{
				IconXSize = float(WeaponGroups[i].items[j].IconCoords.X2 - WeaponGroups[i].items[j].IconCoords.X1);
				IconYSize = float(WeaponGroups[i].items[j].IconCoords.Y2 - WeaponGroups[i].items[j].IconCoords.Y1);
				OutXSize = Ys * (IconXSize / IconYSize);
				C.SetPos((((96.0000000 + float(132 * j)) * ScaleFactor) + (Xs / float(2))) - (OutXSize / float(2)), (160.0000000 + float(96 * i)) * ScaleFactor);
				C.DrawTile(WeaponGroups[i].items[j].IconMaterial, OutXSize, Ys, float(WeaponGroups[i].items[j].IconCoords.X1), float(WeaponGroups[i].items[j].IconCoords.Y1), IconXSize, IconYSize);
				// [Explicit Continue]
				goto J0x8A2;
			}
			C.SetPos((96.0000000 + float(132 * j)) * ScaleFactor, (160.0000000 + float(96 * i)) * ScaleFactor);
			C.DrawTile(Texture'BW_Core_WeaponTex.Icons.BigIcon_NA', Xs, Ys, 0.0000000, 0.0000000, 512.0000000, 256.0000000);
			J0x8A2:

			j++;
			// [Loop Continue]
			goto J0x2A4;
		}
		i++;
		// [Loop Continue]
		goto J0x15D;
	}
	// End:0x11C5
	if((WeaponGroups[WGroup].items.Length > WItem) && WeaponGroups[WGroup].items[WItem] != none)
	{
		C.Font = Class'BCoreProV55.BallisticWeapon'.static.GetFontSizeIndex(C, int(float(2) * Class'Engine.HUD'.default.HudScale));
		C.StrLen(WeaponGroups[WGroup].items[WItem].ItemName, XL, YL);
		C.SetDrawColor(byte(255), byte(255), byte(255));
		// End:0xB96
		if((BallisticWeapon(WeaponGroups[WGroup].items[WItem]) != none) && BallisticWeapon(WeaponGroups[WGroup].items[WItem]).BigIconMaterial != none)
		{
			Xs = 192.0000000 + (float(128) * 0.8000000);
			Ys = 96.0000000 + (float(64) * 0.8000000);
			C.SetPos((C.ClipX / float(2)) - ((Xs / float(2)) * ScaleFactor), (C.ClipY * 0.8000000) - (YL * 3.0000000));
			C.DrawTile(BallisticWeapon(WeaponGroups[WGroup].items[WItem]).BigIconMaterial, Xs * ScaleFactor, Ys * ScaleFactor, 0.0000000, 0.0000000, 512.0000000, 256.0000000);
			Xs = 192.0000000 + (float(128) * SmoothPulsePhase);
			Ys = 96.0000000 + (float(64) * SmoothPulsePhase);
			C.SetPos(((160.0000000 + float(132 * WItem)) - (Xs / float(2))) * ScaleFactor, ((192.0000000 + float(96 * WGroup)) - (Ys / 2.5000000)) * ScaleFactor);
			C.DrawTile(BallisticWeapon(WeaponGroups[WGroup].items[WItem]).BigIconMaterial, Xs * ScaleFactor, Ys * ScaleFactor, 0.0000000, 0.0000000, 512.0000000, 256.0000000);			
		}
		else
		{
			// End:0xD88
			if(WeaponGroups[WGroup].items[WItem].IconMaterial != none)
			{
				IconXSize = float(WeaponGroups[WGroup].items[WItem].IconCoords.X2 - WeaponGroups[WGroup].items[WItem].IconCoords.X1);
				IconYSize = float(WeaponGroups[WGroup].items[WItem].IconCoords.Y2 - WeaponGroups[WGroup].items[WItem].IconCoords.Y1);
				Ys = 96.0000000 + (float(64) * SmoothPulsePhase);
				OutXSize = Ys * (IconXSize / IconYSize);
				C.SetPos(((160.0000000 + float(132 * WItem)) - (OutXSize / float(2))) * ScaleFactor, ((192.0000000 + float(96 * WGroup)) - (Ys / 2.5000000)) * ScaleFactor);
				C.DrawTile(WeaponGroups[WGroup].items[WItem].IconMaterial, OutXSize * ScaleFactor, Ys * ScaleFactor, float(WeaponGroups[WGroup].items[WItem].IconCoords.X1), float(WeaponGroups[WGroup].items[WItem].IconCoords.Y1), IconXSize, IconYSize);				
			}
			else
			{
				Xs = 192.0000000 + (float(128) * SmoothPulsePhase);
				Ys = 96.0000000 + (float(64) * SmoothPulsePhase);
				C.SetPos(((160.0000000 + float(132 * WItem)) - (Xs / float(2))) * ScaleFactor, ((192.0000000 + float(96 * WGroup)) - (Ys / 2.5000000)) * ScaleFactor);
				C.DrawTile(Texture'BW_Core_WeaponTex.Icons.BigIcon_NA', Xs * ScaleFactor, Ys * ScaleFactor, 0.0000000, 0.0000000, 512.0000000, 256.0000000);
			}
		}
		C.Font = Class'BCoreProV55.BallisticWeapon'.static.GetFontSizeIndex(C, int(float(2) * Class'Engine.HUD'.default.HudScale));
		C.SetPos((C.ClipX / float(2)) - (XL / float(2)), (C.ClipY * 0.8000000) - YL);
		C.DrawText(WeaponGroups[WGroup].items[WItem].ItemName);
		// End:0xF17
		if(!Class'Engine.HUD'.default.bShowWeaponInfo)
		{
			return;
		}
		YLC = YL;
		// End:0x10A5
		if((BallisticWeapon(WeaponGroups[WGroup].items[WItem]) != none) && !BallisticWeapon(WeaponGroups[WGroup].items[WItem]).bNoMag)
		{
			ammoTxt = (("Mag: " $ string(BallisticWeapon(WeaponGroups[WGroup].items[WItem]).MagAmmo)) $ " / Total: ") $ string(BallisticWeapon(WeaponGroups[WGroup].items[WItem]).AmmoAmount(0));
			C.Font = Class'BCoreProV55.BallisticWeapon'.static.GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
			C.StrLen(ammoTxt, XL, YL);
			C.SetPos((C.ClipX / float(2)) - (XL / float(2)), ((C.ClipY * 0.8000000) - (YL * 2.0000000)) + YLC);
			C.DrawText(ammoTxt);			
		}
		else
		{
			// End:0x11C5
			if(Weapon(WeaponGroups[WGroup].items[WItem]) != none)
			{
				ammoTxt = "Total: " $ string(BallisticWeapon(WeaponGroups[WGroup].items[WItem]).AmmoAmount(0));
				C.Font = Class'BCoreProV55.BallisticWeapon'.static.GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
				C.StrLen(ammoTxt, XL, YL);
				C.SetPos((C.ClipX / float(2)) - (XL / float(2)), ((C.ClipY * 0.8000000) - (YL * 2.0000000)) + YLC);
				C.DrawText(ammoTxt);
			}
		}
	}
	//return;	
}

exec function SwitchWeapon(byte F)
{
	local int i;
	local byte G;

	// End:0x9C
	if(((((UnrealPawn(Pawn) == none) || !Class'BallisticProV55.BallisticPlayer'.default.bUseWeaponUI && !bIsInWeaponUI) || (BallisticWeapon(Pawn.Weapon) != none) && BallisticWeapon(Pawn.Weapon).bRedirectSwitchToFiremode) || int(F) == 1) || int(F) == 10)
	{
		super(PlayerController).SwitchWeapon(F);
		return;
	}
	G = F;
	// End:0xBF
	if(int(F) == 0)
	{
		F = 9;		
	}
	else
	{
		// End:0xD4
		if(int(F) < 10)
		{
			F--;
		}
	}
	// End:0x147
	if(bIsInWeaponUI)
	{
		// End:0x110
		if(int(F) != WGroup)
		{
			ClientPlaySound(WeapUIChange);
			WGroup = int(F);
			WItem = 0;			
		}
		else
		{
			ClientPlaySound(WeapUICycle);
			WItem++;
			// End:0x144
			if(WItem >= WeaponGroups[WGroup].items.Length)
			{
				WItem = 0;
			}
		}		
	}
	else
	{
		ListItems();
		// End:0x173
		if(WeaponGroups[int(F)].items.Length == 1)
		{
			super(PlayerController).SwitchWeapon(G);
			return;
		}
		ClientPlaySound(WeapUIEnter);
		LastUIDrawTime = Level.TimeSeconds;
		bIsInWeaponUI = true;
		WGroup = int(F);
		// End:0x27E
		if((Pawn.Weapon != none) && ((int(Pawn.Weapon.InventoryGroup) == 0) && int(F) == 9) || (int(Pawn.Weapon.InventoryGroup) - 1) == int(F))
		{
			i = 0;
			J0x21D:

			// End:0x27E [Loop If]
			if(i < (WeaponGroups[WGroup].items.Length - 1))
			{
				// End:0x274
				if(WeaponGroups[WGroup].items[i] == Pawn.Weapon)
				{
					WItem = i + 1;
					return;
				}
				i++;
				// [Loop Continue]
				goto J0x21D;
			}
		}
		WItem = 0;
	}
	//return;	
}

exec function PrevWeapon()
{
	local int OldGroupNum, i;

	// End:0x78
	if(((UnrealPawn(Pawn) == none) || !Class'BallisticProV55.BallisticPlayer'.default.bUseWeaponUI && !bIsInWeaponUI) || (BallisticWeapon(Pawn.Weapon) != none) && BallisticWeapon(Pawn.Weapon).bRedirectSwitchToFiremode)
	{
		super(PlayerController).PrevWeapon();
		return;
	}
	// End:0x8E
	if(Level.Pauser != none)
	{
		return;
	}
	// End:0x1DB
	if((((!bIsInWeaponUI && Pawn != none) && Pawn.Weapon != none) && BallisticWeapon(Pawn.Weapon) != none) && BallisticWeapon(Pawn.Weapon).AllowWeapPrevUI())
	{
		ClientPlaySound(WeapUIEnter);
		ListItems();
		LastUIDrawTime = Level.TimeSeconds;
		bIsInWeaponUI = true;
		WGroup = int(Pawn.Weapon.InventoryGroup);
		// End:0x15B
		if(WGroup == 0)
		{
			WGroup = 9;			
		}
		else
		{
			// End:0x16E
			if(WGroup < 10)
			{
				WGroup--;
			}
		}
		WItem = 0;
		i = 0;
		J0x17C:

		// End:0x1DB [Loop If]
		if(i < (WeaponGroups[WGroup].items.Length - 1))
		{
			// End:0x1D1
			if(WeaponGroups[WGroup].items[i] == Pawn.Weapon)
			{
				WItem = i;
				// [Explicit Break]
				goto J0x1DB;
			}
			i++;
			// [Loop Continue]
			goto J0x17C;
		}
	}
	J0x1DB:

	// End:0x29B
	if(bIsInWeaponUI)
	{
		ClientPlaySound(WeapUICycle);
		WItem--;
		// End:0x298
		if(WItem < 0)
		{
			OldGroupNum = WGroup;
			WGroup = Class'BCoreProV55.BUtil'.static.Loop(WGroup, -1, 10, 0);
			J0x22E:

			// End:0x27B [Loop If]
			if((WGroup != OldGroupNum) && WeaponGroups[WGroup].items.Length < 1)
			{
				WGroup = Class'BCoreProV55.BUtil'.static.Loop(WGroup, -1, 10, 0);
				// [Loop Continue]
				goto J0x22E;
			}
			WItem = Max(0, WeaponGroups[WGroup].items.Length - 1);
		}		
	}
	else
	{
		super(PlayerController).PrevWeapon();
	}
	//return;	
}

exec function NextWeapon()
{
	local int OldGroupNum, i;

	// End:0x78
	if(((UnrealPawn(Pawn) == none) || !Class'BallisticProV55.BallisticPlayer'.default.bUseWeaponUI && !bIsInWeaponUI) || (BallisticWeapon(Pawn.Weapon) != none) && BallisticWeapon(Pawn.Weapon).bRedirectSwitchToFiremode)
	{
		super(PlayerController).NextWeapon();
		return;
	}
	// End:0x8E
	if(Level.Pauser != none)
	{
		return;
	}
	// End:0x1DB
	if((((!bIsInWeaponUI && Pawn != none) && Pawn.Weapon != none) && BallisticWeapon(Pawn.Weapon) != none) && BallisticWeapon(Pawn.Weapon).AllowWeapNextUI())
	{
		ClientPlaySound(WeapUIEnter);
		ListItems();
		LastUIDrawTime = Level.TimeSeconds;
		bIsInWeaponUI = true;
		WGroup = int(Pawn.Weapon.InventoryGroup);
		// End:0x15B
		if(WGroup == 0)
		{
			WGroup = 9;			
		}
		else
		{
			// End:0x16E
			if(WGroup < 10)
			{
				WGroup--;
			}
		}
		WItem = 0;
		i = 0;
		J0x17C:

		// End:0x1DB [Loop If]
		if(i < (WeaponGroups[WGroup].items.Length - 1))
		{
			// End:0x1D1
			if(WeaponGroups[WGroup].items[i] == Pawn.Weapon)
			{
				WItem = i;
				// [Explicit Break]
				goto J0x1DB;
			}
			i++;
			// [Loop Continue]
			goto J0x17C;
		}
	}
	J0x1DB:

	// End:0x28D
	if(bIsInWeaponUI)
	{
		ClientPlaySound(WeapUICycle);
		WItem++;
		// End:0x28A
		if(WItem >= WeaponGroups[WGroup].items.Length)
		{
			WItem = 0;
			OldGroupNum = WGroup;
			WGroup = Class'BCoreProV55.BUtil'.static.Loop(WGroup, 1, 10, 0);
			J0x241:

			// End:0x28A [Loop If]
			if((WGroup != OldGroupNum) && WeaponGroups[WGroup].items.Length < 1)
			{
				WGroup = Class'BCoreProV55.BUtil'.static.Loop(WGroup, 1, 10, 0);
				// [Loop Continue]
				goto J0x241;
			}
		}		
	}
	else
	{
		super(PlayerController).NextWeapon();
	}
	//return;	
}

exec function GetLoadoutWeapon(byte Slot)
{
	GetWeaponOrSubclass(LastLoadoutClasses[int(Slot)]);
	//return;	
}

exec function GetWeaponOrSubclass(Class<Weapon> NewWeaponClass)
{
	local Inventory Inv;

	// End:0x30
	if(((Pawn == none) || Pawn.Inventory == none) || NewWeaponClass == none)
	{
		return;
	}
	// End:0x97
	if(((Pawn.Weapon != none) && Pawn.Weapon.Class == NewWeaponClass) && Pawn.PendingWeapon == none)
	{
		Pawn.Weapon.Reselect();
		return;
	}
	// End:0xCA
	if((Pawn.PendingWeapon != none) && Pawn.PendingWeapon.bForceSwitch)
	{
		return;
	}
	Inv = Pawn.FindInventoryType(NewWeaponClass);
	// End:0xF1
	if(Inv == none)
	{
		return;
	}
	Pawn.PendingWeapon = Weapon(Inv);
	// End:0x16F
	if(!Pawn.PendingWeapon.HasAmmo())
	{
		ClientMessage(Pawn.PendingWeapon.ItemName $ Pawn.PendingWeapon.MessageNoAmmo);
		Pawn.PendingWeapon = none;
		return;
	}
	Pawn.Weapon.PutDown();
	return;
	//return;	
}

exec function ToggleMainWeapons()
{
	// End:0x23
	if((Pawn == none) || Pawn.Weapon == none)
	{
		return;
	}
	// End:0x58
	if(LastLoadoutClasses[2] == Pawn.Weapon.Class)
	{
		GetWeaponOrSubclass(LastLoadoutClasses[3]);		
	}
	else
	{
		GetWeaponOrSubclass(LastLoadoutClasses[2]);
	}
	//return;	
}

function WeapUIFire(float F)
{
	// End:0x70
	if((WeaponGroups[WGroup].items.Length > WItem) && WeaponGroups[WGroup].items[WItem] != none)
	{
		ClientPlaySound(WeapUIUse);
		bFire = 0;
		SetWeapon(Weapon(WeaponGroups[WGroup].items[WItem]));		
	}
	else
	{
		ClientPlaySound(WeapUIFail);
	}
	bIsInWeaponUI = false;
	//return;	
}

function WeapUIAltFire(float F)
{
	ClientPlaySound(WeapUIExit);
	bAltFire = 0;
	bIsInWeaponUI = false;
	//return;	
}

function ListItems()
{
	local int i, j, G;
	local Inventory Inv;

	i = 0;
	J0x07:

	// End:0x30 [Loop If]
	if(i < 11)
	{
		WeaponGroups[i].items.Length = 0;
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	Inv = Pawn.Inventory;
	Inv = Pawn.Inventory;
	J0x58:

	// End:0x1B3 [Loop If]
	if(Inv != none)
	{
		// End:0x19C
		if(Weapon(Inv) != none)
		{
			G = int(Weapon(Inv).InventoryGroup);
			// End:0xA4
			if(G == 0)
			{
				G = 9;				
			}
			else
			{
				// End:0xB7
				if(G < 10)
				{
					G--;
				}
			}
			j = 0;
			J0xBE:

			// End:0x159 [Loop If]
			if(j < WeaponGroups[G].items.Length)
			{
				// End:0x14F
				if(int(Weapon(Inv).Priority) > int(Weapon(WeaponGroups[G].items[j]).Priority))
				{
					WeaponGroups[G].items.Insert(j, 1);
					WeaponGroups[G].items[j] = Inv;
					// [Explicit Break]
					goto J0x159;
				}
				j++;
				// [Loop Continue]
				goto J0xBE;
			}
			J0x159:

			// End:0x19C
			if(j >= WeaponGroups[G].items.Length)
			{
				WeaponGroups[G].items[WeaponGroups[G].items.Length] = Inv;
			}
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x58;
	}
	i = 0;
	J0x1BA:

	// End:0x29C [Loop If]
	if(i < 11)
	{
		j = 1;
		J0x1CD:

		// End:0x292 [Loop If]
		if(j < (WeaponGroups[i].items.Length - 1))
		{
			// End:0x288
			if(WeaponGroups[i].items[j].Class == WeaponGroups[i].items[j - 1].Class)
			{
				WeaponGroups[i].items[WeaponGroups[i].items.Length] = WeaponGroups[i].items[j];
				WeaponGroups[i].items.Remove(j, 1);
				j--;
			}
			j++;
			// [Loop Continue]
			goto J0x1CD;
		}
		i++;
		// [Loop Continue]
		goto J0x1BA;
	}
	i = 0;
	J0x2A3:

	// End:0x32F [Loop If]
	if(i < 11)
	{
		// End:0x2C5
		if(i == 9)
		{
			j = 0;			
		}
		else
		{
			// End:0x2DF
			if(i > 9)
			{
				j = i;				
			}
			else
			{
				j = i + 1;
			}
		}
		GroupNames[i] = Class'Engine.GameInfo'.static.GetKeyBindName("switchweapon" @ string(j), self) $ ".";
		i++;
		// [Loop Continue]
		goto J0x2A3;
	}
	//return;	
}

exec function Fire(optional float F)
{
	// End:0x33
	if((Level.Pauser == PlayerReplicationInfo) || !bIsInWeaponUI)
	{
		super(PlayerController).Fire(F);		
	}
	else
	{
		WeapUIFire(F);
		bFire = 0;
	}
	//return;	
}

exec function AltFire(optional float F)
{
	// End:0x33
	if((Level.Pauser == PlayerReplicationInfo) || !bIsInWeaponUI)
	{
		super(PlayerController).AltFire(F);		
	}
	else
	{
		WeapUIAltFire(F);
		bAltFire = 0;
	}
	//return;	
}

exec function SetWeapon(Weapon newWeapon)
{
	// End:0x30
	if(((Pawn == none) || Pawn.Inventory == none) || newWeapon == none)
	{
		return;
	}
	// End:0x8E
	if(((Pawn.Weapon != none) && Pawn.Weapon == newWeapon) && Pawn.PendingWeapon == none)
	{
		Pawn.Weapon.Reselect();
		return;
	}
	// End:0xC1
	if((Pawn.PendingWeapon != none) && Pawn.PendingWeapon.bForceSwitch)
	{
		return;
	}
	Pawn.PendingWeapon = newWeapon;
	// End:0x104
	if(Pawn.Weapon != none)
	{
		Pawn.Weapon.PutDown();		
	}
	else
	{
		Pawn.ChangedWeapon();
	}
	//return;	
}

exec function SwitchToBestWeapon()
{
	local float rating;

	// End:0x23
	if((Pawn == none) || Pawn.Inventory == none)
	{
		return;
	}
	// End:0x144
	if(Pawn.PendingWeapon == none)
	{
		// End:0x8E
		if((Pawn.Weapon != none) && (Level.TimeSeconds - Pawn.SpawnTime) > float(3))
		{
			Pawn.Weapon.default.Priority = 0;
		}
		Pawn.PendingWeapon = Pawn.Inventory.RecommendWeapon(rating);
		// End:0xFD
		if(Pawn.Weapon != none)
		{
			Pawn.Weapon.default.Priority = Pawn.Weapon.Priority;
		}
		// End:0x12E
		if(Pawn.PendingWeapon == Pawn.Weapon)
		{
			Pawn.PendingWeapon = none;
		}
		// End:0x144
		if(Pawn.PendingWeapon == none)
		{
			return;
		}
	}
	StopFiring();
	// End:0x170
	if(Pawn.Weapon == none)
	{
		Pawn.ChangedWeapon();		
	}
	else
	{
		// End:0x1A9
		if(Pawn.Weapon != Pawn.PendingWeapon)
		{
			Pawn.Weapon.PutDown();
		}
	}
	//return;	
}

simulated exec function Ballistic()
{
	ClientOpenMenu("BallisticProV55.ConfigMenu_Preferences");
	//return;	
}

simulated exec function Manual()
{
	ClientOpenMenu("BallisticProV55.GameMenu_WeaponStats");
	//return;	
}

simulated exec function BWManual()
{
	Manual();
	//return;	
}

simulated exec function BWStats()
{
	Manual();
	//return;	
}

simulated exec function Stats()
{
	Manual();
	//return;	
}

simulated exec function Reloaded()
{
	ServerReloaded(-1);
	//return;	
}

simulated exec function GiveWeapons(int Group)
{
	ServerReloaded(Group);
	//return;	
}

final function ServerReloaded(optional int Group)
{
	local Class<Weapon> Weap;
	local Inventory Inv;
	local int i;
	local array<WeaponRecord> Recs;

	// End:0x50
	if((((int(Level.NetMode) != int(NM_Standalone)) && !PlayerReplicationInfo.bAdmin) || Pawn == none) || Vehicle(Pawn) != none)
	{
		return;
	}
	Class'Engine.CacheManager'.static.GetWeaponList(Recs);
	i = 0;
	J0x68:

	// End:0x152 [Loop If]
	if(i < Recs.Length)
	{
		// End:0xE6
		if(!Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(Recs[i].ClassName).bIsBW || (Group != -1) && Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(Recs[i].ClassName).InventoryGroup != Group)
		{
			// [Explicit Continue]
			goto J0x148;
		}
		Weap = Class<Weapon>(DynamicLoadObject(Recs[i].ClassName, Class'Core.Class'));
		// End:0x148
		if((Weap != none) && ClassIsChildOf(Weap, Class'BCoreProV55.BallisticWeapon'))
		{
			Pawn.GiveWeapon(Recs[i].ClassName);
		}
		J0x148:

		i++;
		// [Loop Continue]
		goto J0x68;
	}
	Class'BCoreProV55.BC_WeaponInfoCache'.static.EndSession();
	Inv = Pawn.Inventory;
	J0x175:

	// End:0x1BB [Loop If]
	if(Inv != none)
	{
		// End:0x1A4
		if(Weapon(Inv) != none)
		{
			Weapon(Inv).SuperMaxOutAmmo();
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x175;
	}
	//return;	
}

function CalcBehindView(out Vector CameraLocation, out Rotator CameraRotation, float dist)
{
	local Vector View, HitLocation, HitNormal;
	local float ViewDist, RealDist;
	local Vector globalX, globalY, globalZ, localX, localY, localZ;

	// End:0x47
	if((bOldBehindView || ViewTarget != Pawn) || !Pawn.bProjTarget)
	{
		super(PlayerController).CalcBehindView(CameraLocation, CameraRotation, dist);
		return;
	}
	CameraRotation = Rotation;
	CameraRotation.Roll = 0;
	GetAxes(CameraRotation, localX, localY, localZ);
	CameraLocation.Z += float(22);
	CameraLocation += ((localY * 1.8000000) * CameraDist);
	CameraLocation += ((localZ * 3.4000000) * CameraDist);
	CameraRotation += CameraDeltaRotation;
	View = vect(1.0000000, 0.0000000, 0.0000000) >> CameraRotation;
	RealDist = dist;
	dist += CameraDeltaRad;
	dist *= BehindDistFactor;
	// End:0x161
	if(Trace(HitLocation, HitNormal, CameraLocation - (dist * Vector(CameraRotation)), CameraLocation, false, vect(10.0000000, 10.0000000, 10.0000000)) != none)
	{
		ViewDist = FMin((CameraLocation - HitLocation) Dot View, dist);		
	}
	else
	{
		ViewDist = dist;
	}
	// End:0x1E3
	if((!bBlockCloseCamera || !bValidBehindCamera) || ViewDist > (float(10) + FMax(ViewTarget.CollisionRadius, ViewTarget.CollisionHeight)))
	{
		bValidBehindCamera = true;
		OldCameraLoc = CameraLocation - (ViewDist * View);
		OldCameraRot = CameraRotation;		
	}
	else
	{
		SetRotation(OldCameraRot);
	}
	CameraLocation = OldCameraLoc;
	CameraRotation = OldCameraRot;
	GetAxes(CameraSwivel, globalX, globalY, globalZ);
	localX = globalX >> CameraRotation;
	localY = globalY >> CameraRotation;
	localZ = globalZ >> CameraRotation;
	CameraRotation = OrthoRotation(localX, localY, localZ);
	//return;	
}

simulated function Rotator GetViewRotation()
{
	// End:0x45
	if(Pawn != none)
	{
		// End:0x45
		if(bBehindView)
		{
			// End:0x3E
			if(bOldBehindView || Vehicle(Pawn) != none)
			{
				return Pawn.Rotation;
			}
			return TraceView();
		}
	}
	return Rotation;
	//return;	
}

simulated function Rotator TraceView()
{
	local Vector HitLocation, HitNormal;

	// End:0x45
	if(((LastPlayerCalcView == Level.TimeSeconds) && CalcViewActor != none) && CalcViewActor.Location == CalcViewActorLocation)
	{
		return BehindViewAimRotator;
	}
	// End:0xA6
	if(Trace(HitLocation, HitNormal, (float(15000) * Vector(OldCameraRot)) + OldCameraLoc, OldCameraLoc, false) != none)
	{
		BehindViewAimRotator = Rotator(HitLocation - (Pawn.Location + Pawn.EyePosition()));		
	}
	else
	{
		BehindViewAimRotator = Rotator(((float(15000) * Vector(OldCameraRot)) + OldCameraLoc) - (Pawn.Location + Pawn.EyePosition()));
	}
	return BehindViewAimRotator;
	//return;	
}

function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int aimerror)
{
	local Vector FireDir, AimSpot, HitNormal, HitLocation, OldAim, AimOffset;

	local Actor BestTarget;
	local float bestAim, BestDist, projSpeed;
	local Actor HitActor;
	local bool bNoZAdjust, bLeading;
	local Rotator AimRot;

	FireDir = Vector(GetViewRotation());
	// End:0x4D
	if(FiredAmmunition.bInstantHit)
	{
		HitActor = Trace(HitLocation, HitNormal, projStart + (float(10000) * FireDir), projStart, true);		
	}
	else
	{
		HitActor = Trace(HitLocation, HitNormal, projStart + (float(4000) * FireDir), projStart, true);
	}
	// End:0xE1
	if((HitActor != none) && HitActor.bProjTarget)
	{
		BestTarget = HitActor;
		bNoZAdjust = true;
		OldAim = HitLocation;
		BestDist = VSize(BestTarget.Location - Pawn.Location);		
	}
	else
	{
		bestAim = 0.9000000;
		// End:0x157
		if((int(Level.NetMode) == int(NM_Standalone)) && bAimingHelp)
		{
			bestAim = 0.9300000;
			// End:0x134
			if(FiredAmmunition.bInstantHit)
			{
				bestAim = 0.9700000;
			}
			// End:0x154
			if(FovAngle < (DefaultFOV - float(8)))
			{
				bestAim = 0.9900000;
			}			
		}
		else
		{
			// End:0x170
			if(FiredAmmunition.bInstantHit)
			{
				bestAim = 1.0000000;
			}
		}
		BestTarget = PickTarget(bestAim, BestDist, FireDir, projStart, FiredAmmunition.MaxRange);
		// End:0x1A9
		if(BestTarget == none)
		{
			return GetViewRotation();
		}
		OldAim = projStart + (FireDir * BestDist);
	}
	InstantWarnTarget(BestTarget, FiredAmmunition, FireDir);
	ShotTarget = Pawn(BestTarget);
	// End:0x214
	if(!bAimingHelp || int(Level.NetMode) != int(NM_Standalone))
	{
		return GetViewRotation();
	}
	// End:0x3BD
	if(!FiredAmmunition.bInstantHit)
	{
		projSpeed = FiredAmmunition.ProjectileClass.default.Speed;
		BestDist = VSize((BestTarget.Location + (BestTarget.Velocity * FMin(1.0000000, 0.0200000 + (BestDist / projSpeed)))) - projStart);
		bLeading = true;
		FireDir = (BestTarget.Location + (BestTarget.Velocity * FMin(1.0000000, 0.0200000 + (BestDist / projSpeed)))) - projStart;
		AimSpot = projStart + (BestDist * Normal(FireDir));
		// End:0x3BA
		if(FiredAmmunition.bTrySplash && (BestTarget.Velocity != vect(0.0000000, 0.0000000, 0.0000000)) || BestDist > float(1500))
		{
			HitActor = Trace(HitLocation, HitNormal, AimSpot - (BestTarget.CollisionHeight * vect(0.0000000, 0.0000000, 2.0000000)), AimSpot, false);
			// End:0x3BA
			if((HitActor != none) && FastTrace(HitLocation + vect(0.0000000, 0.0000000, 4.0000000), projStart))
			{
				return Rotator((HitLocation + vect(0.0000000, 0.0000000, 6.0000000)) - projStart);
			}
		}		
	}
	else
	{
		FireDir = BestTarget.Location - projStart;
		AimSpot = projStart + (BestDist * Normal(FireDir));
	}
	AimOffset = AimSpot - OldAim;
	// End:0x452
	if(bNoZAdjust || bLeading && Abs(AimOffset.Z) < BestTarget.CollisionHeight)
	{
		AimSpot.Z = OldAim.Z;		
	}
	else
	{
		// End:0x49C
		if(AimOffset.Z < float(0))
		{
			AimSpot.Z = BestTarget.Location.Z + (0.4000000 * BestTarget.CollisionHeight);			
		}
		else
		{
			AimSpot.Z = BestTarget.Location.Z - (0.7000000 * BestTarget.CollisionHeight);
		}
	}
	// End:0x563
	if(!bLeading)
	{
		// End:0x560
		if(!bNoZAdjust)
		{
			AimRot = Rotator(AimSpot - projStart);
			// End:0x535
			if(FovAngle < (DefaultFOV - float(8)))
			{
				AimRot.Yaw = (AimRot.Yaw + 200) - Rand(400);				
			}
			else
			{
				AimRot.Yaw = (AimRot.Yaw + 375) - Rand(750);
			}
			return AimRot;
		}		
	}
	else
	{
		// End:0x5C2
		if(!FastTrace(projStart + ((0.9000000 * BestDist) * Normal(FireDir)), projStart))
		{
			FireDir = BestTarget.Location - projStart;
			AimSpot = projStart + (BestDist * Normal(FireDir));
		}
	}
	return Rotator(AimSpot - projStart);
	//return;	
}

function AdjustView(float DeltaTime)
{
	// End:0x9F
	if(FovAngle != DesiredFOV)
	{
		// End:0x4F
		if(FovAngle > DesiredFOV)
		{
			FovAngle = FovAngle - FMax(7.0000000, (0.9000000 * DeltaTime) * (FovAngle - DesiredFOV));			
		}
		else
		{
			FovAngle = FovAngle - FMin(-7.0000000, (0.9000000 * DeltaTime) * (FovAngle - DesiredFOV));
		}
		// End:0x9F
		if(Abs(FovAngle - DesiredFOV) <= float(10))
		{
			FovAngle = DesiredFOV;
		}
	}
	// End:0x11F
	if(bZooming)
	{
		// End:0xDA
		if(DesiredZoomLevel < ZoomLevel)
		{
			ZoomLevel = FMax(ZoomLevel - (DeltaTime * ZoomTimeMod), DesiredZoomLevel);			
		}
		else
		{
			ZoomLevel = FMin(ZoomLevel + (DeltaTime * ZoomTimeMod), DesiredZoomLevel);
		}
		DesiredFOV = FClamp(90.0000000 - (ZoomLevel * 88.0000000), 1.0000000, 170.0000000);
	}
	//return;	
}

function bool AutoTaunt()
{
	// End:0x20
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		return super(UnrealPlayer).AutoTaunt();
	}
	return false;
	//return;	
}

function DamageShake(int Damage)
{
	super(PlayerController).DamageShake(Min(Damage, 0));
	//return;	
}

function AskForPawn()
{
	// End:0x1E
	if(IsInState('GameEnded'))
	{
		ClientGotoState('GameEnded', 'Begin');		
	}
	else
	{
		// End:0x3C
		if(IsInState('RoundEnded'))
		{
			ClientGotoState('RoundEnded', 'Begin');			
		}
		else
		{
			// End:0x5A
			if(IsInState('Spectating'))
			{
				ClientGotoState('Spectating', 'None');				
			}
			else
			{
				// End:0x73
				if(Pawn != none)
				{
					GivePawn(Pawn);					
				}
				else
				{
					bFrozen = false;
					ServerReStartPlayer();
				}
			}
		}
	}
	//return;	
}

exec function ViewSelf()
{
	ServerViewSelf();
	//return;	
}

function AwardAdrenaline(float Amount)
{
	// End:0x0B
	if(bGodMode)
	{
		return;
	}
	// End:0x76
	if(bAdrenalineEnabled)
	{
		// End:0x6B
		if(((Adrenaline < AdrenalineMax) && (Adrenaline + Amount) >= AdrenalineMax) && (Pawn == none) || !Pawn.InCurrentCombo())
		{
			ClientDelayedAnnouncementNamed('adrenalin', 15);
		}
		super(UnrealPlayer).AwardAdrenaline(Amount);
	}
	//return;	
}

function ClientDmgFlash(float Scale, Vector fog)
{
	// End:0x0B
	if(bGodMode)
	{
		return;
	}
	DesiredFlashScale = Scale;
	DesiredFlashFog = 0.0010000 * fog;
	//return;	
}

function ClientFlash(float Scale, Vector fog)
{
	// End:0x0B
	if(bGodMode)
	{
		return;
	}
	FlashScale = Scale * vect(1.0000000, 1.0000000, 1.0000000);
	FlashFog = 0.0010000 * fog;
	bOverrideDmgFlash = true;
	//return;	
}

function ViewFlash(float DeltaTime)
{
	local Vector goalFog;
	local float goalscale, Delta, Step;
	local PhysicsVolume ViewVolume;

	// End:0x45
	if(Pawn != none)
	{
		// End:0x31
		if(bBehindView)
		{
			ViewVolume = Level.GetPhysicsVolume(CalcViewLocation);			
		}
		else
		{
			ViewVolume = Pawn.HeadVolume;
		}
	}
	// End:0x1BB
	if(bOverrideDmgFlash)
	{
		Delta = FMin(0.1000000, DeltaTime);
		goalscale = 1.0000000;
		goalFog = vect(0.0000000, 0.0000000, 0.0000000);
		// End:0xB8
		if(ViewVolume != none)
		{
			goalscale += ViewVolume.ViewFlash.X;
			goalFog += ViewVolume.ViewFog;
		}
		Step = 0.6000000 * Delta;
		FlashScale.X = UpdateFlashComponent(FlashScale.X, Step, goalscale);
		FlashScale = FlashScale.X * vect(1.0000000, 1.0000000, 1.0000000);
		FlashFog.X = UpdateFlashComponent(FlashFog.X, Step, goalFog.X);
		FlashFog.Y = UpdateFlashComponent(FlashFog.Y, Step, goalFog.Y);
		FlashFog.Z = UpdateFlashComponent(FlashFog.Z, Step, goalFog.Z);
		// End:0x1B8
		if(FlashFog.Z < 0.0030000)
		{
			FlashFog.Z = 0.0000000;
			bOverrideDmgFlash = false;
		}		
	}
	else
	{
		Delta = FMin(0.1000000, DeltaTime);
		goalscale = (1.0000000 + DesiredFlashScale) + ConstantGlowScale;
		goalFog = DesiredFlashFog + ConstantGlowFog;
		// End:0x232
		if(ViewVolume != none)
		{
			goalscale += ViewVolume.ViewFlash.X;
			goalFog += ViewVolume.ViewFog;
		}
		DesiredFlashScale -= ((DesiredFlashScale * float(2)) * Delta);
		DesiredFlashFog -= ((DesiredFlashFog * float(2)) * Delta);
		FlashScale.X += (((goalscale - FlashScale.X) * float(10)) * Delta);
		FlashFog += (((goalFog - FlashFog) * float(10)) * Delta);
		// End:0x2D2
		if(FlashScale.X > 0.9810000)
		{
			FlashScale.X = 1.0000000;
		}
		FlashScale = FlashScale.X * vect(1.0000000, 1.0000000, 1.0000000);
		// End:0x315
		if(FlashFog.X < 0.0030000)
		{
			FlashFog.X = 0.0000000;
		}
		// End:0x339
		if(FlashFog.Y < 0.0030000)
		{
			FlashFog.Y = 0.0000000;
		}
		// End:0x35D
		if(FlashFog.Z < 0.0030000)
		{
			FlashFog.Z = 0.0000000;
		}
	}
	//return;	
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	super(UnrealPlayer).DisplayDebug(Canvas, YL, YPos);
	Canvas.SetDrawColor(byte(255), byte(255), byte(255));
	Canvas.DrawText((((((("Rotation:" @ string(Rotation)) @ "Pawn Rotation:") @ string(Pawn.Rotation)) @ "Smooth View Yaw:") @ string(Pawn.SmoothViewYaw)) @ "Aim rotator:") @ string(BehindViewAimRotator));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	//return;	
}

function int FractionCorrection(float in, out float fraction)
{
	local int Result;
	local float tmp;

	tmp = in + fraction;
	Result = int(tmp);
	fraction = tmp - float(Result);
	return Result;
	//return;	
}

function UpdateRotation(float DeltaTime, float maxPitch)
{
	local Rotator NewRotation, ViewRotation;

	// End:0x37
	if(bInterpolating || (Pawn != none) && Pawn.bInterpolating)
	{
		ViewShake(DeltaTime);
		return;
	}
	// End:0x133
	if(bFreeCam == true)
	{
		// End:0x79
		if(bFreeCamZoom == true)
		{
			CameraDeltaRad += float(FractionCorrection((DeltaTime * 0.2500000) * aLookUp, PitchFraction));			
		}
		else
		{
			// End:0xDC
			if(bFreeCamSwivel == true)
			{
				CameraSwivel.Yaw += (FractionCorrection((16.0000000 * DeltaTime) * aTurn, YawFraction));
				CameraSwivel.Pitch += (FractionCorrection((16.0000000 * DeltaTime) * aLookUp, PitchFraction));				
			}
			else
			{
				CameraDeltaRotation.Yaw += (FractionCorrection((32.0000000 * DeltaTime) * aTurn, YawFraction));
				CameraDeltaRotation.Pitch += (FractionCorrection((32.0000000 * DeltaTime) * aLookUp, PitchFraction));
			}
		}		
	}
	else
	{
		ViewRotation = Rotation;
		// End:0x225
		if((Pawn != none) && int(Pawn.Physics) != int(4))
		{
			// End:0x1C6
			if((Pawn.DesiredRotation.Roll < 65535) && (ViewRotation.Roll < Pawn.DesiredRotation.Roll) || ViewRotation.Roll > 0)
			{
				ViewRotation.Roll = 0;				
			}
			else
			{
				// End:0x225
				if((Pawn.DesiredRotation.Roll > 0) && (ViewRotation.Roll > Pawn.DesiredRotation.Roll) || ViewRotation.Roll < 65535)
				{
					ViewRotation.Roll = 0;
				}
			}
		}
		DesiredRotation = ViewRotation;
		// End:0x246
		if(int(bTurnToNearest) != 0)
		{
			TurnTowardNearestEnemy();			
		}
		else
		{
			// End:0x25C
			if(int(bTurn180) != 0)
			{
				TurnAround();				
			}
			else
			{
				TurnTarget = none;
				bRotateToDesired = false;
				bSetTurnRot = false;
				ViewRotation.Yaw += (FractionCorrection((32.0000000 * DeltaTime) * aTurn, YawFraction));
				ViewRotation.Pitch += (FractionCorrection((32.0000000 * DeltaTime) * aLookUp, PitchFraction));
			}
		}
		// End:0x2F6
		if(Pawn != none)
		{
			ViewRotation.Pitch = Pawn.LimitPitch(ViewRotation.Pitch);
		}
		SetRotation(ViewRotation);
		ViewShake(DeltaTime);
		ViewFlash(DeltaTime);
		NewRotation = ViewRotation;
		// End:0x36A
		if((!bRotateToDesired && Pawn != none) && !bFreeCamera || !bBehindView)
		{
			Pawn.FaceRotation(NewRotation, DeltaTime);
		}
	}
	//return;	
}

exec function ShowVoteMenu()
{
	local string S;

	// End:0x3E
	if(((int(Level.NetMode) == int(NM_Standalone)) || VoteReplicationInfo == none) || !VoteReplicationInfo.MapVoteEnabled())
	{
		return;
	}
	S = VoteReplicationInfo.GetPropertyText("MapVotingMenu");
	// End:0x9B
	if(S == "")
	{
		S = Player.GUIController.GetPropertyText("MapVotingMenu");
	}
	Player.GUIController.OpenMenu(S);
	//return;	
}

state PlayerWalking
{
	ignores ServerSpectate;

	function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
	{
		local Vector OldAccel;
		local bool OldCrouch;

		// End:0x0D
		if(Pawn == none)
		{
			return;
		}
		// End:0x43
		if((int(DoubleClickMove) == int(5)) && int(Pawn.Physics) == int(2))
		{
			DoubleClickDir = 5;			
		}
		else
		{
			// End:0x89
			if((int(DoubleClickMove) != int(0)) && int(DoubleClickMove) < int(5))
			{
				// End:0x89
				if(UnrealPawn(Pawn).Dodge(DoubleClickMove))
				{
					DoubleClickDir = 5;
				}
			}
		}
		OldAccel = Pawn.Acceleration;
		// End:0xC9
		if(Pawn.Acceleration != NewAccel)
		{
			Pawn.Acceleration = NewAccel;
		}
		// End:0x109
		if(bDoubleJump && bUpdating || Pawn.CanDoubleJump())
		{
			Pawn.DoDoubleJump(bUpdating);			
		}
		else
		{
			// End:0x127
			if(bPressedJump)
			{
				Pawn.DoJump(bUpdating);
			}
		}
		// End:0x14E
		if(!bBehindView)
		{
			Pawn.SetViewPitch(Rotation.Pitch);			
		}
		else
		{
			Pawn.SetViewPitch(BehindViewAimRotator.Pitch);
		}
		// End:0x1D8
		if(int(Pawn.Physics) != int(2))
		{
			OldCrouch = Pawn.bWantsToCrouch;
			// End:0x1B6
			if(int(bDuck) == 0)
			{
				Pawn.ShouldCrouch(false);				
			}
			else
			{
				// End:0x1D8
				if(Pawn.bCanCrouch)
				{
					Pawn.ShouldCrouch(true);
				}
			}
		}
		//return;		
	}
	stop;	
}

state PlayerClimbing
{
	ignores ServerSpectate;
	stop;	
}

state PlayerDriving
{
	ignores ServerSpectate;
	stop;	
}

state PlayerSwimming
{
	ignores ServerSpectate;
	stop;	
}

state PlayerSpaceFlying
{
	ignores ServerSpectate;
	stop;	
}

auto state PlayerWaiting
{
	ignores ServerSpectate, SwitchToBestWeapon, PrevWeapon, NextWeapon, TakeDamage;
	stop;	
}

state WaitingForPawn
{
	ignores ServerSpectate, SwitchWeapon, KilledBy;
	stop;	
}

state PlayerFlying
{
	ignores ServerSpectate;

	function PlayerMove(float DeltaTime)
	{
		local Rotator OldRotation;
		local Vector X, Y, Z, NewAccel;

		GetAxes(Rotation, X, Y, Z);
		NewAccel = ((aForward * X) + (aStrafe * Y)) + (aUp * vect(0.0000000, 0.0000000, 1.0000000));
		// End:0x70
		if(VSize(NewAccel) < 1.0000000)
		{
			NewAccel = vect(0.0000000, 0.0000000, 0.0000000);
		}
		OldRotation = Rotation;
		UpdateRotation(DeltaTime, 2.0000000);
		// End:0xBD
		if(int(Role) < int(ROLE_Authority))
		{
			ReplicateMove(DeltaTime, NewAccel, 0, OldRotation - Rotation);			
		}
		else
		{
			ProcessMove(DeltaTime, NewAccel, 0, OldRotation - Rotation);
		}
		//return;		
	}
	stop;	
}

state PlayerSpidering
{
	ignores ServerSpectate;

	function UpdateRotation(float DeltaTime, float maxPitch)
	{
		local Rotator ViewRotation;
		local Vector MyFloor, CrossDir, FwdDir, OldFwdDir, OldX, RealFloor;

		// End:0x2A
		if(bInterpolating || Pawn.bInterpolating)
		{
			ViewShake(DeltaTime);
			return;
		}
		TurnTarget = none;
		bRotateToDesired = false;
		bSetTurnRot = false;
		// End:0x8D
		if((Pawn.Base == none) || Pawn.Floor == vect(0.0000000, 0.0000000, 0.0000000))
		{
			MyFloor = vect(0.0000000, 0.0000000, 1.0000000);			
		}
		else
		{
			MyFloor = Pawn.Floor;
		}
		// End:0x209
		if(MyFloor != OldFloor)
		{
			RealFloor = MyFloor;
			MyFloor = Normal(((float(6) * DeltaTime) * MyFloor) + ((float(1) - (float(6) * DeltaTime)) * OldFloor));
			// End:0x112
			if((RealFloor Dot MyFloor) > 0.9990000)
			{
				MyFloor = RealFloor;				
			}
			else
			{
				CrossDir = Normal(RealFloor Cross OldFloor);
				FwdDir = CrossDir Cross MyFloor;
				OldFwdDir = CrossDir Cross OldFloor;
				ViewX = ((MyFloor * (OldFloor Dot ViewX)) + (CrossDir * (CrossDir Dot ViewX))) + (FwdDir * (OldFwdDir Dot ViewX));
				ViewX = Normal(ViewX);
				ViewZ = ((MyFloor * (OldFloor Dot ViewZ)) + (CrossDir * (CrossDir Dot ViewZ))) + (FwdDir * (OldFwdDir Dot ViewZ));
				ViewZ = Normal(ViewZ);
				OldFloor = MyFloor;
				ViewY = Normal(MyFloor Cross ViewX);
			}
		}
		// End:0x35F
		if((aTurn != float(0)) || aLookUp != float(0))
		{
			// End:0x263
			if(aTurn != float(0))
			{
				ViewX = Normal(ViewX + ((float(5) * ViewY) * Sin((0.0005000 * DeltaTime) * aTurn)));
			}
			// End:0x34B
			if(aLookUp != float(0))
			{
				OldX = ViewX;
				ViewX = Normal(ViewX + ((float(5) * ViewZ) * Sin((0.0005000 * DeltaTime) * aLookUp)));
				ViewZ = Normal(ViewX Cross ViewY);
				// End:0x34B
				if((ViewZ Dot MyFloor) < 0.7070000)
				{
					OldX = Normal(OldX - (MyFloor * (MyFloor Dot OldX)));
					// End:0x323
					if((ViewX Dot MyFloor) > float(0))
					{
						ViewX = Normal(OldX + MyFloor);						
					}
					else
					{
						ViewX = Normal(OldX - MyFloor);
					}
					ViewZ = Normal(ViewX Cross ViewY);
				}
			}
			ViewY = Normal(MyFloor Cross ViewX);
		}
		ViewRotation = OrthoRotation(ViewX, ViewY, ViewZ);
		SetRotation(ViewRotation);
		ViewShake(DeltaTime);
		ViewFlash(DeltaTime);
		Pawn.FaceRotation(ViewRotation, DeltaTime);
		//return;		
	}
	stop;	
}

defaultproperties
{
	WeapUIEnter=Sound'MenuSounds.selectDshort'
	WeapUIExit=Sound'MenuSounds.selectK'
	WeapUIFail=Sound'MenuSounds.denied1'
	WeapUIUse=Sound'MenuSounds.selectJ'
	WeapUICycle=Sound'MenuSounds.MS_ListChangeDown'
	WeapUIChange=Sound'MenuSounds.MS_ListChangeUp'
	ZoomTimeMod=1.5000000
	SavedBehindDistFactor=1.0000000
	BehindDistFactor=1.0000000
	WeapUIHelp[0]="Fire to confirm selection."
	WeapUIHelp[1]="Altfire to exit UI."
	WeapUIHelp[2]="Next and Previous Weapon to cycle."
	WeapUIHelp[3]="Weapon Numbers to skip to group."
	ComboNameList[3]="BallisticProV55.Ballistic_ComboMiniMe"
	AnnouncerLevel=1
	PawnClass=Class'BallisticProV55.BallisticPawn'
}
