class MidGameTab_Conflict extends MidGamePanel
	editinlinenew
	instanced;

const MAIN_SECTION_INDEX = 0;
const SUB_SECTION_INDEX = 1;

struct Item
{
	var() string Title;
	var() Material Icon;
	var() string ClassName;
	var() int Size;
	var() string Ammo;
	var() int InventoryGroup;
	var() int LayoutIndex;
	var() int CamoIndex;
	var() bool bBad;
	var() int SectionIndex;
	var() int ListIndex;
};

var bool bInitialized;
var bool bLoadInitialized;
var bool bCamosInstalled;
var int SectionSizes[2];
var int MaxInventorySize;
var int SpaceUsed[2];
var() automated GUIListBox lb_Weapons;
var export editinline GUIList li_Weapons;
var() automated GUIImage Box_WeapList;
var() automated GUIImage Box_Inventory;
var() automated GUIImage Pic_Weapon;
var() automated GUIImage Box_WeapIcon;
var() automated GUILabel l_WeapTitle;
var() automated GUIComboBox cb_WeapLayoutIndex;
var() automated GUIComboBox cb_WeapCamoIndex;
var() automated GUIScrollTextBox tb_Desc;
var() automated GUIButton bStats;
var() automated GUIButton bClear;
var() automated GUIButton bSave;
var() automated GUIButton BLoad;
var() automated GUILabel l_StatTime;
var() automated GUILabel l_StatFrags;
var() automated GUILabel l_StatEfficiency;
var() automated GUILabel l_StatDamageRate;
var() automated GUILabel l_StatSniperEff;
var() automated GUILabel l_StatShotgunEff;
var() automated GUILabel l_StatHazardEff;
var() automated GUILabel l_StatHeading;
var() automated GUILabel l_Loading;
var() automated moComboBox cb_Presets;
var() localized string StatTimeCaption;
var() localized string StatFragsCaption;
var() localized string StatEffCaption;
var() localized string StatDmgRtCaption;
var() localized string StatSnprEffCaption;
var() localized string StatStgnEffCaption;
var() localized string StatHzrdEffCaption;
var() localized string HealthText;
var() localized string ArmorText;
var() localized string AmmoText;
var() Texture HealthIcon;
var() Texture ArmorIcon;
var() Texture AmmoIcon;
var() array<Item> Inventory;
var() byte LoadoutIndex;
var() array<int> LayoutIndexList;
var() array<int> CamoIndexList;
var() bool bUpdatingWeapon;
var() Material BoxTex;
var ConflictLoadoutLRI CLRI;
var bool bWaitingWeaps;
var bool bWaitingSkill;
var export editinline GUIStyles ConflictListStyle;

function InitPanel()
{
	super(GUITabPanel).InitPanel();
	Initialize();
	//return;	
}

function ShowPanel(bool bShow)
{
	super(GUITabPanel).ShowPanel(bShow);
	// End:0x4B
	if((li_Weapons != none) && li_Weapons.IsSection())
	{
		cb_WeapLayoutIndex.SetVisibility(false);
		cb_WeapCamoIndex.SetVisibility(false);
	}
	// End:0x88
	if(((CLRI != none) && int(CLRI.LoadoutOption) == 1) && CLRI.bHasSkillInfo)
	{
		OnLRIAcquired();
	}
	//return;	
}

function Initialize()
{
	local Class<BC_GameStyle> game_style;
	local GUI.eFontScale FS;
	local WeaponList_ConflictInventory ConfigList;
	local int i;

	// End:0x0B
	if(bInitialized)
	{
		return;
	}
	game_style = Class'BCoreProV55.BallisticGameStyles'.static.GetReplicatedStyle();
	SectionSizes[0] = game_style.default.ConflictWeaponSlots;
	SectionSizes[1] = game_style.default.ConflictEquipmentSlots;
	MaxInventorySize = SectionSizes[0] + SectionSizes[1];
	Controller.RegisterStyle(Class'BallisticProV55.STY2ConflictList', true);
	ConflictListStyle = Controller.GetStyle("ConflictList", FS);
	li_Weapons = lb_Weapons.List;
	li_Weapons.__OnDrawItem__Delegate = OnDrawConflictItem;
	li_Weapons.__OnChange__Delegate = InternalOnChange;
	li_Weapons.__OnDblClick__Delegate = InternalOnDblClick;
	CLRI = ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(PlayerOwner().PlayerReplicationInfo));
	// End:0x12C
	if(CLRI == none)
	{
		SetTimer(0.0500000, true);		
	}
	else
	{
		OnLRIAcquired();
	}
	ConfigList = new (none, game_style.default.StyleName) Class'BallisticProV55.WeaponList_ConflictInventory';
	i = 0;
	J0x155:

	// End:0x196 [Loop If]
	if(i < 5)
	{
		cb_Presets.AddItem(ConfigList.PresetName[i],, string(i));
		i++;
		// [Loop Continue]
		goto J0x155;
	}
	bInitialized = true;
	//return;	
}

event Timer()
{
	// End:0xAB
	if(CLRI != none)
	{
		// End:0x62
		if((bWaitingWeaps && CLRI.bHasList) && (int(CLRI.LoadoutOption) != 1) || CLRI.bHasSkillInfo)
		{
			bWaitingWeaps = false;
			InitWeaponLists();
		}
		// End:0x8D
		if(bWaitingSkill && CLRI.bHasSkillInfo)
		{
			bWaitingSkill = false;
			DisplaySkills();
		}
		// End:0xA8
		if(!bWaitingWeaps && !bWaitingSkill)
		{
			KillTimer();
		}		
	}
	else
	{
		// End:0x10D
		if((PlayerOwner() != none) && ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(PlayerOwner().PlayerReplicationInfo)) != none)
		{
			KillTimer();
			CLRI = ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(PlayerOwner().PlayerReplicationInfo));
			OnLRIAcquired();
			return;
		}
	}
	//return;	
}

function OnLRIAcquired()
{
	// End:0x7B
	if(int(CLRI.LoadoutOption) == 1)
	{
		CLRI.bHasSkillInfo = false;
		CLRI.RequestSkillInfo();
		// End:0x5E
		if(!CLRI.bHasSkillInfo)
		{
			bWaitingSkill = true;
			SetTimer(0.1000000, true);			
		}
		else
		{
			DisplaySkills();
		}
		tb_Desc.WinHeight = 0.2300000;		
	}
	else
	{
		l_StatHeading.Caption = "";
		l_StatTime.Caption = "";
		l_StatFrags.Caption = "";
		l_StatEfficiency.Caption = "";
		l_StatSniperEff.Caption = "";
		l_StatShotgunEff.Caption = "";
		l_StatHazardEff.Caption = "";
		l_StatDamageRate.Caption = "";
		bStats.Hide();
	}
	// End:0x16D
	if(CLRI.bHasList)
	{
		// End:0x164
		if((int(CLRI.LoadoutOption) == 1) && !CLRI.bHasSkillInfo)
		{
			bWaitingWeaps = true;
			SetTimer(0.1000000, true);			
		}
		else
		{
			InitWeaponLists();
		}		
	}
	else
	{
		bWaitingWeaps = true;
		CLRI.FullInventoryList.Length = 0;
		CLRI.RequirementsList.Length = 0;
		CLRI.RequestFullList();
		SetTimer(0.1000000, true);
	}
	//return;	
}

simulated function DisplaySkills()
{
	l_StatTime.Caption = StatTimeCaption $ string(CLRI.MySkillInfo.ElapsedTime);
	l_StatFrags.Caption = StatFragsCaption $ string(int(PlayerOwner().PlayerReplicationInfo.Score));
	// End:0xAE
	if(PlayerOwner().PlayerReplicationInfo.Deaths == float(0))
	{
		l_StatEfficiency.Caption = StatEffCaption $ string(PlayerOwner().PlayerReplicationInfo.Score / 0.1000000);		
	}
	else
	{
		l_StatEfficiency.Caption = StatEffCaption $ string(PlayerOwner().PlayerReplicationInfo.Score / PlayerOwner().PlayerReplicationInfo.Deaths);
	}
	l_StatSniperEff.Caption = StatSnprEffCaption $ string(CLRI.MySkillInfo.SniperEff);
	l_StatShotgunEff.Caption = StatStgnEffCaption $ string(CLRI.MySkillInfo.ShotgunEff);
	l_StatHazardEff.Caption = StatHzrdEffCaption $ string(CLRI.MySkillInfo.HazardEff);
	l_StatDamageRate.Caption = StatDmgRtCaption $ string(CLRI.MySkillInfo.DamageRate);
	//return;	
}

simulated function InitWeaponLists()
{
	local Class<Actor> A;
	local Class<Weapon> Weap;
	local Class<ConflictItem> CI;
	local int i, j, LastIndex;

	Log("MidGameTab_Conflict: InitWeaponLists");
	l_Loading.Caption = "";
	l_Loading.Hide();
	li_Weapons.Clear();
	LayoutIndexList.Length = 0;
	CamoIndexList.Length = 0;
	cb_WeapLayoutIndex.Clear();
	cb_WeapCamoIndex.Clear();
	Inventory.Length = 0;
	SpaceUsed[0] = 0;
	SpaceUsed[1] = 0;
	i = 0;
	J0xA6:

	// End:0x1A0 [Loop If]
	if(i < Class'BallisticProV55.ConflictLoadoutConfig'.default.SavedInventory.Length)
	{
		A = Class<Actor>(DynamicLoadObject(Class'BallisticProV55.ConflictLoadoutConfig'.default.SavedInventory[i], Class'Core.Class'));
		// End:0x154
		if(Class<BallisticWeapon>(A) != none)
		{
			Weap = Class<BallisticWeapon>(A);
			AddInventory(string(Weap), Weap, Weap.default.ItemName, Class'BallisticProV55.ConflictLoadoutConfig'.default.SavedLayout[i], Class'BallisticProV55.ConflictLoadoutConfig'.default.SavedCamo[i]);
			// [Explicit Continue]
			goto J0x196;
		}
		// End:0x196
		if(Class<ConflictItem>(A) != none)
		{
			CI = Class<ConflictItem>(A);
			AddInventory(string(CI), CI, CI.default.ItemName, 0, 0);
		}
		J0x196:

		i++;
		// [Loop Continue]
		goto J0xA6;
	}
	LastIndex = -1;
	i = 0;
	J0x1B2:

	// End:0x448 [Loop If]
	if(i < CLRI.FullInventoryList.Length)
	{
		// End:0x1F6
		if(!CLRI.WeaponRequirementsOk(CLRI.RequirementsList[i]))
		{
			// [Explicit Continue]
			goto J0x43E;
		}
		// End:0x2ED
		if(InStr(CLRI.FullInventoryList[i].ClassName, "CItem") != -1)
		{
			// End:0x271
			if(LastIndex != -1)
			{
				LastIndex = -1;
				li_Weapons.Add("Misc",, "Mc", true);
				LayoutIndexList.Insert(LayoutIndexList.Length, 1);
				CamoIndexList.Insert(CamoIndexList.Length, 1);
			}
			CI = Class<ConflictItem>(DynamicLoadObject(CLRI.FullInventoryList[i].ClassName, Class'Core.Class'));
			// End:0x2EA
			if(CI != none)
			{
				li_Weapons.Add(CI.default.ItemName,, string(i));
				LayoutIndexList.Insert(LayoutIndexList.Length, 1);
				CamoIndexList.Insert(CamoIndexList.Length, 1);
			}
			// [Explicit Continue]
			goto J0x43E;
		}
		// End:0x383
		if(int(CLRI.FullInventoryList[i].InventoryGroup) != LastIndex)
		{
			LastIndex = int(CLRI.FullInventoryList[i].InventoryGroup);
			li_Weapons.Add(Class'BCoreProV55.BallisticWeaponClassInfo'.static.GetHeading(LastIndex),, "Weapon Category", true);
			LayoutIndexList.Insert(LayoutIndexList.Length, 1);
			CamoIndexList.Insert(CamoIndexList.Length, 1);
		}
		li_Weapons.Add(CLRI.FullInventoryList[i].ItemName,, string(i));
		LayoutIndexList.Insert(LayoutIndexList.Length, 1);
		CamoIndexList.Insert(CamoIndexList.Length, 1);
		j = 0;
		J0x3D4:

		// End:0x43E [Loop If]
		if(j < Inventory.Length)
		{
			// End:0x434
			if(CLRI.FullInventoryList[i].ClassName == Inventory[j].ClassName)
			{
				Inventory[j].ListIndex = li_Weapons.ItemCount - 1;
			}
			j++;
			// [Loop Continue]
			goto J0x3D4;
		}
		J0x43E:

		i++;
		// [Loop Continue]
		goto J0x1B2;
	}
	//return;	
}

function SaveSettings()
{
	local int i;
	local string iw, ic, il;
	local Class<BC_GameStyle> game_style;
	local WeaponList_ConflictInventory ConfigList;

	game_style = Class'BCoreProV55.BallisticGameStyles'.static.GetReplicatedStyle();
	// End:0x6B
	if(game_style == none)
	{
		Log("MidGameTab_ConflictLoadout: Couldn't save - No compatible style found");
		return;
	}
	ConfigList = new (none, game_style.default.StyleName) Class'BallisticProV55.WeaponList_ConflictInventory';
	ConfigList.PresetName[cb_Presets.GetIndex()] = cb_Presets.GetText();
	i = 0;
	J0xBC:

	// End:0x1B3 [Loop If]
	if(i < Inventory.Length)
	{
		// End:0xF1
		if(iw == "")
		{
			iw = Inventory[i].ClassName;			
		}
		else
		{
			iw = (iw $ "|") $ Inventory[i].ClassName;
		}
		// End:0x13A
		if(il == "")
		{
			il = string(Inventory[i].LayoutIndex);			
		}
		else
		{
			il = (il $ "|") $ string(Inventory[i].LayoutIndex);
		}
		// End:0x185
		if(ic == "")
		{
			ic = string(Inventory[i].CamoIndex);
			// [Explicit Continue]
			goto J0x1A9;
		}
		ic = (ic $ "|") $ string(Inventory[i].CamoIndex);
		J0x1A9:

		i++;
		// [Loop Continue]
		goto J0xBC;
	}
	ConfigList.SavedInventory[cb_Presets.GetIndex()] = iw;
	ConfigList.SavedLayout[cb_Presets.GetIndex()] = il;
	ConfigList.SavedCamo[cb_Presets.GetIndex()] = ic;
	ConfigList.SaveConfig();
	//return;	
}

function bool LoadLIFromBW(Class<BallisticWeapon> BW)
{
	local byte GameStyleIndex;
	local int i;

	cb_WeapLayoutIndex.Clear();
	GameStyleIndex = Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle;
	// End:0x75
	if(BW.default.ParamsClasses.Length < int(GameStyleIndex))
	{
		Log("Error loading item for outfitting: " $ string(BW), 'Warning');
		return false;
	}
	i = 0;
	J0x7C:

	// End:0x188 [Loop If]
	if(i < BW.default.ParamsClasses[int(GameStyleIndex)].default.Layouts.Length)
	{
		// End:0x141
		if(BW.default.ParamsClasses[int(GameStyleIndex)].default.Layouts[i].LayoutName == "")
		{
			// End:0x11C
			if(BW.default.ParamsClasses[int(GameStyleIndex)].default.Layouts.Length == 1)
			{
				cb_WeapLayoutIndex.AddItem("Default");				
			}
			else
			{
				cb_WeapLayoutIndex.AddItem("Layout: " $ string(i));
			}
			// [Explicit Continue]
			goto J0x17E;
		}
		cb_WeapLayoutIndex.AddItem(BW.default.ParamsClasses[int(GameStyleIndex)].default.Layouts[i].LayoutName);
		J0x17E:

		i++;
		// [Loop Continue]
		goto J0x7C;
	}
	return true;
	//return;	
}

function bool LoadCIFromBW(Class<BallisticWeapon> BW, int LayoutIndex)
{
	local byte GameStyleIndex;
	local int i;
	local array<int> AllowedCamos;
	local byte OldCamoIndex;

	OldCamoIndex = byte(CamoIndexList[lb_Weapons.List.Index]);
	cb_WeapCamoIndex.Clear();
	// End:0x45
	if(LayoutIndex == -1)
	{
		return false;
	}
	GameStyleIndex = Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle;
	// End:0xAB
	if(BW.default.ParamsClasses.Length < int(GameStyleIndex))
	{
		Log("Error loading item for outfitting: " $ string(BW), 'Warning');
		return false;
	}
	AllowedCamos = BW.default.ParamsClasses[int(GameStyleIndex)].default.Layouts[LayoutIndex].AllowedCamos;
	// End:0x275
	if(AllowedCamos.Length == 0)
	{
		i = 0;
		J0xF2:

		// End:0x25C [Loop If]
		if(i < BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos.Length)
		{
			// End:0x1E4
			if(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[i].CamoName == "")
			{
				// End:0x193
				if(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos.Length == 1)
				{
					cb_WeapCamoIndex.AddItem("None",, "0");					
				}
				else
				{
					cb_WeapCamoIndex.AddItem("Camo: " $ string(i),, string(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[i].Index));
				}
			}
			cb_WeapCamoIndex.AddItem(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[i].CamoName,, string(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[i].Index));
			i++;
			// [Loop Continue]
			goto J0xF2;
		}
		cb_WeapCamoIndex.SetIndex(int(OldCamoIndex));		
	}
	else
	{
		i = 0;
		J0x27C:

		// End:0x364 [Loop If]
		if(i < AllowedCamos.Length)
		{
			cb_WeapCamoIndex.AddItem(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[AllowedCamos[i]].CamoName,, string(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[AllowedCamos[i]].Index));
			// End:0x35A
			if(int(OldCamoIndex) == BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[AllowedCamos[i]].Index)
			{
				cb_WeapCamoIndex.SetIndex(i);
			}
			i++;
			// [Loop Continue]
			goto J0x27C;
		}
	}
	// End:0x394
	if(cb_WeapCamoIndex.ItemCount() == 0)
	{
		cb_WeapCamoIndex.AddItem("None",, "255");
	}
	// End:0x421
	if((cb_WeapCamoIndex.ItemCount() > 1) && !Class'BCoreProV55.BallisticReplicationInfo'.default.bNoRandomCamo)
	{
		cb_WeapCamoIndex.AddItem("Random",, "255");
		// End:0x421
		if(CamoIndexList[lb_Weapons.List.Index] == 255)
		{
			cb_WeapCamoIndex.SetIndex(cb_WeapCamoIndex.ItemCount() - 1);
		}
	}
	return true;
	//return;	
}

function int CountExisting(string weapon_name)
{
	local int i, Count;

	i = 0;
	J0x07:

	// End:0x42 [Loop If]
	if(i < Inventory.Length)
	{
		// End:0x38
		if(Inventory[i].ClassName ~= weapon_name)
		{
			++Count;
		}
		++i;
		// [Loop Continue]
		goto J0x07;
	}
	return Count;
	//return;	
}

function int GetMaxCount(Class<BallisticWeapon> Weapon, int LayoutIndex)
{
	local int base_ammo, max_ammo;
	local byte GameStyleIndex;

	GameStyleIndex = Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle;
	// End:0x5D
	if((Class<BallisticHandgun>(Weapon) != none) && !Weapon.default.ParamsClasses[int(GameStyleIndex)].default.Layouts[LayoutIndex].bDualBlocked)
	{
		return 2;
	}
	// End:0xC5
	if((Weapon.static.GetParams() != none) && int(Weapon.static.GetParams().default.Layouts[0].MaxInventoryCount) > 0)
	{
		return int(Weapon.static.GetParams().default.Layouts[0].MaxInventoryCount);
	}
	base_ammo = Max(1, Weapon.default.FireModeClass[0].default.AmmoClass.default.InitialAmount);
	max_ammo = Weapon.default.FireModeClass[0].default.AmmoClass.default.MaxAmmo;
	// End:0x140
	if((float(max_ammo) % float(base_ammo)) == float(0))
	{
		return Max(1, max_ammo / base_ammo);
	}
	return Max(1, int(Ceil(float(max_ammo) / float(base_ammo))));
	//return;	
}

function bool MaxReached(Class<BallisticWeapon> Weapon, string class_name, int LayoutIndex)
{
	return (CountExisting(class_name)) >= (GetMaxCount(Weapon, LayoutIndex));
	//return;	
}

function bool GroupPriorityOver(int inserting_group, int target_group)
{
	switch(inserting_group)
	{
		// End:0x18
		case 1:
			return inserting_group < target_group;
		// End:0x1F
		case 11:
			return false;
		// End:0xFFFF
		default:
			return target_group == 11;
			break;
	}
	//return;	
}

function int GetInsertionPoint(Class<BallisticWeapon> InsertWeapon)
{
	local int i, SectionIndex, ItemSize, InsertingGroup, CurrentItemGroup;

	SectionIndex = Class'BallisticProV55.Mut_ConflictLoadout'.static.GetSectionIndex(InsertWeapon);
	ItemSize = Class'BallisticProV55.Mut_ConflictLoadout'.static.GetItemSize(InsertWeapon);
	InsertingGroup = int(InsertWeapon.default.InventoryGroup);
	// End:0x5D
	if(InsertingGroup == 0)
	{
		InsertingGroup = 11;
	}
	i = 0;
	J0x64:

	// End:0x114 [Loop If]
	if(i < Inventory.Length)
	{
		// End:0x91
		if(Inventory[i].SectionIndex > SectionIndex)
		{
			// [Explicit Break]
			goto J0x114;
		}
		// End:0xAE
		if(Inventory[i].SectionIndex < SectionIndex)
		{
			// [Explicit Continue]
			goto J0x10A;
		}
		CurrentItemGroup = Inventory[i].InventoryGroup;
		// End:0xD7
		if(CurrentItemGroup == 0)
		{
			CurrentItemGroup = 11;
		}
		// End:0xED
		if(GroupPriorityOver(InsertingGroup, CurrentItemGroup))
		{
			// [Explicit Break]
			goto J0x114;
		}
		// End:0x10A
		if(ItemSize > Inventory[i].Size)
		{
			// [Explicit Break]
			goto J0x114;
		}
		J0x10A:

		++i;
		// [Loop Continue]
		goto J0x64;
	}
	J0x114:

	return i;
	//return;	
}

function bool AddInventory(string ClassName, Class<Actor> InvClass, string FriendlyName, optional int PassedLayoutIndex, optional int PassedCamoIndex)
{
	local int i, Size, A, SectionIndex;
	local Class<BallisticWeapon> WeaponClass;

	// End:0x45
	if(InvClass == none)
	{
		Log("MidGameTab_Conflict::AddInventory: InvClass was None");
		return false;
	}
	// End:0x66
	if(Class<ConflictItem>(InvClass) != none)
	{
		return HandleConflictItem(InvClass, FriendlyName);
	}
	WeaponClass = Class<BallisticWeapon>(InvClass);
	// End:0xCE
	if(WeaponClass == none)
	{
		Log("MidGameTab_Conflict::AddInventory: InvClass was not a Ballistic weapon.");
		return false;
	}
	// End:0x130
	if(MaxReached(WeaponClass, ClassName, PassedLayoutIndex))
	{
		Log("MidGameTab_Conflict::AddInventory: Maximum count reached for " $ ClassName);
		return false;
	}
	SectionIndex = Class'BallisticProV55.Mut_ConflictLoadout'.static.GetSectionIndex(WeaponClass);
	Size = Class'BallisticProV55.Mut_ConflictLoadout'.static.GetItemSize(WeaponClass);
	// End:0x213
	if((SpaceUsed[SectionIndex] + Size) > SectionSizes[SectionIndex])
	{
		Log((((((("MidGameTab_Conflict::AddInventory: No room in section " $ string(SectionIndex)) $ ": Used ") $ string(SpaceUsed[SectionIndex])) $ "/") $ string(SectionSizes[SectionIndex])) $ ", requesting ") $ string(Size));
		return false;
	}
	SpaceUsed[SectionIndex] += Size;
	i = GetInsertionPoint(WeaponClass);
	Inventory.Insert(i, 1);
	Inventory[i].ClassName = string(WeaponClass);
	Inventory[i].Size = Size;
	Inventory[i].Title = FriendlyName;
	Inventory[i].InventoryGroup = int(WeaponClass.default.InventoryGroup);
	Inventory[i].CamoIndex = PassedCamoIndex;
	Inventory[i].LayoutIndex = PassedLayoutIndex;
	Inventory[i].SectionIndex = SectionIndex;
	Inventory[i].ListIndex = li_Weapons.Index;
	A = WeaponClass.default.FireModeClass[0].default.AmmoClass.default.InitialAmount;
	// End:0x359
	if(!WeaponClass.default.bNoMag)
	{
		A += WeaponClass.default.MagAmmo;
	}
	Inventory[i].Icon = WeaponClass.default.BigIconMaterial;
	Inventory[i].Ammo = string(A);
	// End:0x460
	if(((WeaponClass.default.FireModeClass[1].default.AmmoClass != none) && WeaponClass.default.FireModeClass[1].default.AmmoClass != WeaponClass.default.FireModeClass[0].default.AmmoClass) && WeaponClass.default.FireModeClass[1].default.AmmoClass.default.InitialAmount > 0)
	{
		Inventory[i].Ammo = (string(WeaponClass.default.FireModeClass[1].default.AmmoClass.default.InitialAmount) $ " / ") $ Inventory[i].Ammo;
	}
	// End:0x48C
	if(!CLRI.ValidateWeapon(ClassName))
	{
		Inventory[i].bBad = true;
	}
	return true;
	//return;	
}

function UpdateExistingInventory(int weapon_list_index)
{
	local int i, clri_inv_offset;

	clri_inv_offset = int(li_Weapons.GetExtraAtIndex(weapon_list_index));
	i = 0;
	J0x23:

	// End:0xA6 [Loop If]
	if(i < Inventory.Length)
	{
		// End:0x64
		if(Inventory[i].ClassName != CLRI.FullInventoryList[clri_inv_offset].ClassName)
		{
			// [Explicit Continue]
			goto J0x9C;
		}
		Inventory[i].CamoIndex = CamoIndexList[weapon_list_index];
		Inventory[i].LayoutIndex = LayoutIndexList[weapon_list_index];
		J0x9C:

		++i;
		// [Loop Continue]
		goto J0x23;
	}
	//return;	
}

function bool HandleConflictItem(Class<Actor> InvClass, string FriendlyName)
{
	local int i, Size;

	Size = Class<ConflictItem>(InvClass).default.Size / 5;
	// End:0x39
	if((SpaceUsed[1] + Size) > SectionSizes[1])
	{
		return false;
	}
	SpaceUsed[1] += Size;
	i = Inventory.Length;
	Inventory.Length = i + 1;
	Inventory[i].ClassName = string(InvClass);
	Inventory[i].Size = Size;
	Inventory[i].Title = FriendlyName;
	Inventory[i].Icon = Class<ConflictItem>(InvClass).default.Icon;
	Inventory[i].Ammo = Class<ConflictItem>(InvClass).default.ItemAmount;
	Inventory[i].InventoryGroup = 12;
	Inventory[i].SectionIndex = 1;
	return true;
	//return;	
}

function bool InternalOnDblClick(GUIComponent Sender)
{
	// End:0x6E
	if(Sender == li_Weapons)
	{
		AddInventory(string(li_Weapons.GetObject()), Class<Actor>(li_Weapons.GetObject()), li_Weapons.Get(), LayoutIndexList[li_Weapons.Index], int(cb_WeapCamoIndex.GetExtra()));
	}
	return true;
	//return;	
}

function int GetClickedInventoryIndex()
{
	local int i, X, ItemSize;

	X = int(Box_Inventory.Bounds[0]);
	i = 0;
	J0x1F:

	// End:0xCF [Loop If]
	if((i < Inventory.Length) && Inventory[i].SectionIndex == 0)
	{
		ItemSize = int(Box_Inventory.ActualWidth() / float(MaxInventorySize)) * Inventory[i].Size;
		// End:0xB9
		if((Controller.MouseX > float(X)) && Controller.MouseX < float(X + ItemSize))
		{
			return i;
		}
		X += ItemSize;
		i++;
		// [Loop Continue]
		goto J0x1F;
	}
	X = int(Box_Inventory.Bounds[0] + ((Box_Inventory.ActualWidth() / float(MaxInventorySize)) * float(SectionSizes[0])));
	J0x109:

	// End:0x1A1 [Loop If]
	if(i < Inventory.Length)
	{
		ItemSize = int(Box_Inventory.ActualWidth() / float(MaxInventorySize)) * Inventory[i].Size;
		// End:0x18B
		if((Controller.MouseX > float(X)) && Controller.MouseX < float(X + ItemSize))
		{
			return i;
		}
		X += ItemSize;
		++i;
		// [Loop Continue]
		goto J0x109;
	}
	return Inventory.Length;
	//return;	
}

function bool InternalOnClick(GUIComponent Sender)
{
	local int i;

	// End:0xC4
	if(Sender == Box_Inventory)
	{
		i = GetClickedInventoryIndex();
		// End:0xC2
		if(i < Inventory.Length)
		{
			Class'BallisticProV55.ConflictLoadoutConfig'.static.UpdateSavedInitialIndex(i);
			// End:0xC2
			if(Inventory[i].ListIndex != 0)
			{
				LayoutIndexList[Inventory[i].ListIndex] = Inventory[i].LayoutIndex;
				CamoIndexList[Inventory[i].ListIndex] = Inventory[i].CamoIndex;
				li_Weapons.SetIndex(Inventory[i].ListIndex);
			}
		}
		return true;
	}
	// End:0x153
	if((Sender == bStats) && CLRI != none)
	{
		Controller.OpenMenu("BallisticProV55.BallisticConflictInfoMenu");
		// End:0x151
		if(BallisticConflictInfoMenu(Controller.ActivePage) != none)
		{
			BallisticConflictInfoMenu(Controller.ActivePage).LoadWeapons(self);
		}
		return true;
	}
	// End:0x17E
	if(Sender == bClear)
	{
		Inventory.Length = 0;
		SpaceUsed[0] = 0;
		SpaceUsed[1] = 0;
		return true;
	}
	// End:0x195
	if(Sender == bSave)
	{
		SaveSettings();
		return true;
	}
	return true;
	//return;	
}

function bool InternalOnRightClick(GUIComponent Sender)
{
	local int i;

	// End:0x61
	if(Sender == Box_Inventory)
	{
		i = GetClickedInventoryIndex();
		// End:0x5F
		if(i < Inventory.Length)
		{
			SpaceUsed[Inventory[i].SectionIndex] -= Inventory[i].Size;
			Inventory.Remove(i, 1);
		}
		return true;
	}
	// End:0xF0
	if((Sender == bStats) && CLRI != none)
	{
		Controller.OpenMenu("BallisticProV55.BallisticConflictInfoMenu");
		// End:0xEE
		if(BallisticConflictInfoMenu(Controller.ActivePage) != none)
		{
			BallisticConflictInfoMenu(Controller.ActivePage).LoadWeapons(self);
		}
		return true;
	}
	return true;
	//return;	
}

function InternalOnChange(GUIComponent Sender)
{
	local Class<BallisticWeapon> BW;
	local Class<ConflictItem> CI;
	local int inv_offset, i, j;
	local Class<Actor> A;
	local Class<Weapon> Weap;
	local WeaponList_ConflictInventory ConfigList;
	local Class<BC_GameStyle> game_style;
	local array<string> LoadOut, Layouts, Camos;

	// End:0x478
	if(Sender == li_Weapons)
	{
		l_WeapTitle.Caption = li_Weapons.SelectedText();
		// End:0x47
		if(li_Weapons.Index == -1)
		{
			return;
		}
		// End:0xB8
		if(li_Weapons.IsSection())
		{
			tb_Desc.SetContent(Class'BCoreProV55.BallisticWeaponClassInfo'.static.GetClassDescription(li_Weapons.SelectedText()));
			Pic_Weapon.Image = none;
			cb_WeapLayoutIndex.SetVisibility(false);
			cb_WeapCamoIndex.SetVisibility(false);
			return;
		}
		// End:0x280
		if(li_Weapons.GetObject() != none)
		{
			// End:0x1EA
			if(Class<BallisticWeapon>(li_Weapons.GetObject()) != none)
			{
				bUpdatingWeapon = true;
				BW = Class<BallisticWeapon>(li_Weapons.GetObject());
				Pic_Weapon.Image = BW.default.BigIconMaterial;
				tb_Desc.SetContent(BW.static.GetShortManual(LayoutIndexList[lb_Weapons.List.Index]));
				LoadLIFromBW(BW);
				cb_WeapLayoutIndex.SetIndex(LayoutIndexList[lb_Weapons.List.Index]);
				LoadCIFromBW(BW, LayoutIndexList[lb_Weapons.List.Index]);
				cb_WeapLayoutIndex.SetVisibility(true);
				cb_WeapCamoIndex.SetVisibility(true);
				bUpdatingWeapon = false;
				return;
			}
			// End:0x27E
			if(Class<ConflictItem>(li_Weapons.GetObject()) != none)
			{
				Pic_Weapon.Image = Class<ConflictItem>(li_Weapons.static.GetObject()).default.Icon;
				tb_Desc.SetContent(Class<ConflictItem>(li_Weapons.static.GetObject()).default.Description);
				cb_WeapLayoutIndex.SetVisibility(false);
				cb_WeapCamoIndex.SetVisibility(false);
				return;
			}
			return;
		}
		// End:0x475
		if(li_Weapons.GetObject() == none)
		{
			inv_offset = int(li_Weapons.GetExtra());
			// End:0x475
			if(inv_offset != -1)
			{
				BW = Class<BallisticWeapon>(DynamicLoadObject(CLRI.FullInventoryList[inv_offset].ClassName, Class'Core.Class'));
				// End:0x475
				if(BW != none)
				{
					bUpdatingWeapon = true;
					Pic_Weapon.Image = BW.default.BigIconMaterial;
					tb_Desc.SetContent(BW.static.GetShortManual());
					li_Weapons.SetObjectAtIndex(li_Weapons.Index, BW);
					// End:0x3DC
					if((LayoutIndexList[li_Weapons.Index] == 0) && CamoIndexList[li_Weapons.Index] == 0)
					{
						LoadLIFromBW(BW);
						LayoutIndexList[li_Weapons.Index] = cb_WeapLayoutIndex.GetIndex();
						LoadCIFromBW(BW, cb_WeapLayoutIndex.GetIndex());						
					}
					else
					{
						LoadLIFromBW(BW);
						cb_WeapLayoutIndex.SetIndex(LayoutIndexList[li_Weapons.Index]);
						LoadCIFromBW(BW, LayoutIndexList[li_Weapons.Index]);
					}
					CamoIndexList[li_Weapons.Index] = cb_WeapCamoIndex.GetIndex();
					cb_WeapLayoutIndex.SetVisibility(true);
					cb_WeapCamoIndex.SetVisibility(true);
					bUpdatingWeapon = false;
				}
			}
		}		
	}
	else
	{
		// End:0x580
		if(Sender == cb_WeapLayoutIndex)
		{
			// End:0x57D
			if(((li_Weapons.GetObject() != none) && Class<BallisticWeapon>(li_Weapons.GetObject()) != none) && !bUpdatingWeapon)
			{
				LayoutIndexList[li_Weapons.Index] = cb_WeapLayoutIndex.GetIndex();
				// End:0x569
				if(Class<BallisticWeapon>(li_Weapons.GetObject()) != none)
				{
					BW = Class<BallisticWeapon>(li_Weapons.GetObject());
					LoadCIFromBW(BW, LayoutIndexList[li_Weapons.Index]);
					tb_Desc.SetContent(BW.static.GetShortManual(cb_WeapLayoutIndex.GetIndex()));
				}
				UpdateExistingInventory(li_Weapons.Index);
			}			
		}
		else
		{
			// End:0x60A
			if(Sender == cb_WeapCamoIndex)
			{
				// End:0x607
				if(((li_Weapons.GetObject() != none) && Class<BallisticWeapon>(li_Weapons.GetObject()) != none) && !bUpdatingWeapon)
				{
					CamoIndexList[li_Weapons.Index] = int(cb_WeapCamoIndex.GetExtra());
					UpdateExistingInventory(li_Weapons.Index);
				}				
			}
			else
			{
				// End:0x879
				if((Sender == cb_Presets) && cb_Presets.GetExtra() != "")
				{
					game_style = Class'BCoreProV55.BallisticGameStyles'.static.GetReplicatedStyle();
					// End:0x69A
					if(game_style == none)
					{
						Log("ConfigTab_ConflictLoadout: Couldn't load: No compatible style found");
						return;
					}
					ConfigList = new (none, game_style.default.StyleName) Class'BallisticProV55.WeaponList_ConflictInventory';
					Inventory.Length = 0;
					SpaceUsed[0] = 0;
					SpaceUsed[1] = 0;
					LoadoutIndex = byte(cb_Presets.GetIndex());
					Split(ConfigList.SavedInventory[int(LoadoutIndex)], "|", LoadOut);
					Split(ConfigList.SavedLayout[int(LoadoutIndex)], "|", Layouts);
					Split(ConfigList.SavedCamo[int(LoadoutIndex)], "|", Camos);
					i = 0;
					J0x74E:

					// End:0x828 [Loop If]
					if(i < LoadOut.Length)
					{
						A = Class<Actor>(DynamicLoadObject(LoadOut[i], Class'Core.Class'));
						// End:0x7DC
						if(Class<BallisticWeapon>(A) != none)
						{
							Weap = Class<BallisticWeapon>(A);
							AddInventory(string(Weap), Weap, Weap.default.ItemName, int(Layouts[i]), int(Camos[i]));
							// [Explicit Continue]
							goto J0x81E;
						}
						// End:0x81E
						if(Class<ConflictItem>(A) != none)
						{
							CI = Class<ConflictItem>(A);
							AddInventory(string(CI), CI, CI.default.ItemName, 0, 0);
						}
						J0x81E:

						i++;
						// [Loop Continue]
						goto J0x74E;
					}
					j = 0;
					J0x82F:

					// End:0x879 [Loop If]
					if(j < Inventory.Length)
					{
						Inventory[j].ListIndex = li_Weapons.FindIndex(Inventory[j].Title);
						j++;
						// [Loop Continue]
						goto J0x82F;
					}
				}
			}
		}
	}
	//return;	
}

event Closed(GUIComponent Sender, bool bCancelled)
{
	super(GUIMultiComponent).Closed(Sender, bCancelled);
	UpdateInventory();
	//return;	
}

function UpdateInventory()
{
	// End:0x16
	if(bWaitingWeaps || bWaitingSkill)
	{
		return;
	}
	Class'BallisticProV55.ConflictLoadoutConfig'.static.UpdateSavedInventory(Inventory);
	CLRI.OnInventoryUpdated();
	//return;	
}

function OnDrawConflictItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
	local GUI.eMenuState M;
	local GUI.eFontScale F;
	local float XL, YL;
	local export editinline GUIStyles draw_style;
	local float mX, mY, BarW;
	local string S;
	local int inv_offset, inv_size;

	F = 1;
	Y += (H * 0.1000000);
	H -= (H * 0.2000000);
	// End:0x42
	if(bSelected)
	{
		M = 2;		
	}
	else
	{
		M = 0;
	}
	// End:0x27B
	if(li_Weapons.Elements[i].bSection)
	{
		draw_style = li_Weapons.SectionStyle;
		draw_style.TextSize(Canvas, M, li_Weapons.GetItemAtIndex(i), XL, YL, F);
		mX = X + (W / float(2));
		mY = Y + (H / float(2));
		draw_style.DrawText(Canvas, M, mX - (XL / float(2)), mY - (YL / float(2)), XL, YL, 1, li_Weapons.GetItemAtIndex(i), F);
		BarW = ((W - XL) / float(2)) * 0.8000000;
		Canvas.SetPos(X + (BarW * 0.1000000), mY - float(2));
		Canvas.SetDrawColor(byte(255), 128, 64, byte(255));
		Canvas.DrawTile(Controller.DefaultPens[0], BarW, 5.0000000, 0.0000000, 0.0000000, 8.0000000, 8.0000000);
		Canvas.SetPos((mX + (XL / float(2))) + (BarW * 0.1000000), mY - float(2));
		Canvas.SetDrawColor(byte(255), 128, 64, byte(255));
		Canvas.DrawTile(Controller.DefaultPens[0], BarW, 5.0000000, 0.0000000, 0.0000000, 8.0000000, 8.0000000);
		return;
	}
	draw_style = ConflictListStyle;
	// End:0x2FB
	if(bSelected)
	{
		Canvas.SetPos(X, Y);
		Canvas.SetDrawColor(32, 32, 128, byte(255));
		Canvas.DrawTile(Controller.DefaultPens[0], W, H, 0.0000000, 0.0000000, 2.0000000, 2.0000000);
	}
	inv_offset = int(li_Weapons.GetExtraAtIndex(i));
	inv_size = int(CLRI.FullInventoryList[inv_offset].InventorySize);
	// End:0x497
	if(CLRI.CanUseWeaponAtIndex(inv_offset))
	{
		draw_style.TextSize(Canvas, M, li_Weapons.GetItemAtIndex(i), XL, YL, F);
		draw_style.DrawText(Canvas, M, X, Y, W, YL, 0, li_Weapons.GetItemAtIndex(i), F);
		// End:0x3F8
		if(inv_size > 1)
		{
			S = string(inv_size) $ " slots";			
		}
		else
		{
			// End:0x414
			if(inv_size == 1)
			{
				S = "1 slot";				
			}
			else
			{
				S = "Free";
			}
		}
		draw_style.TextSize(Canvas, M, S, XL, YL, F);
		draw_style.DrawText(Canvas, M, (X + W) - XL, Y, XL, YL, 2, S, F);		
	}
	else
	{
		Canvas.SetDrawColor(64, 64, 64, byte(255));
		draw_style.TextSize(Canvas, M, li_Weapons.GetItemAtIndex(i), XL, YL, F);
		Canvas.SetPos(X, Y);
		Canvas.DrawText(li_Weapons.GetItemAtIndex(i));
		Canvas.TextSize("Disabled", XL, YL);
		Canvas.SetPos((X + W) - XL, Y);
		Canvas.DrawText("Disabled");
	}
	//return;	
}

function DrawInventory(Canvas C)
{
	local int i, j;
	local float X, ItemSize, IconX, IconY, XL, YL,
		MyX, MyY, MyW, MyH, ScaleFactor;

	local string S;
	local int initial_wep_index, LastSectionIndex, SlotWidth;
	local string DisplayString;

	initial_wep_index = Class'BallisticProV55.ConflictLoadoutConfig'.static.GetSavedInitialWeaponIndex();
	ScaleFactor = float(Controller.ResX) / float(1600);
	MyX = Box_Inventory.Bounds[0] + (float(24) * ScaleFactor);
	MyY = Box_Inventory.Bounds[1] + (float(24) * ScaleFactor);
	MyW = Box_Inventory.ActualWidth() - (float(48) * ScaleFactor);
	MyH = Box_Inventory.ActualHeight() - (float(48) * ScaleFactor);
	SlotWidth = int(MyW / float(MaxInventorySize));
	C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
	C.SetPos(MyX, MyY);
	C.DrawTile(Controller.DefaultPens[1], MyW, MyH, 0.0000000, 0.0000000, 1.0000000, 1.0000000);
	C.SetDrawColor(128, 64, 0, byte(255));
	X = MyX;
	X += float(SlotWidth * SpaceUsed[0]);
	i = SpaceUsed[0];
	J0x188:

	// End:0x1FB [Loop If]
	if(i < SectionSizes[0])
	{
		C.SetPos(X, MyY);
		C.DrawTile(BoxTex, float(SlotWidth), MyH, 0.0000000, 0.0000000, 128.0000000, 64.0000000);
		X += float(SlotWidth);
		i++;
		// [Loop Continue]
		goto J0x188;
	}
	C.SetDrawColor(0, 64, 128, byte(255));
	X += float(SlotWidth * SpaceUsed[1]);
	i = SpaceUsed[1];
	J0x238:

	// End:0x2AB [Loop If]
	if(i < SectionSizes[1])
	{
		C.SetPos(X, MyY);
		C.DrawTile(BoxTex, float(SlotWidth), MyH, 0.0000000, 0.0000000, 128.0000000, 64.0000000);
		X += float(SlotWidth);
		i++;
		// [Loop Continue]
		goto J0x238;
	}
	X = MyX;
	C.Style = 6;
	i = 0;
	J0x2CE:

	// End:0x87E [Loop If]
	if(i < Inventory.Length)
	{
		// End:0x32B
		if(Inventory[i].SectionIndex != LastSectionIndex)
		{
			LastSectionIndex = Inventory[i].SectionIndex;
			X = MyX + float(SlotWidth * SectionSizes[0]);
		}
		// End:0x35D
		if(Inventory[i].bBad)
		{
			C.SetDrawColor(byte(255), 64, 64, byte(255));			
		}
		else
		{
			// End:0x38A
			if(i == initial_wep_index)
			{
				C.SetDrawColor(192, byte(255), 192, byte(255));				
			}
			else
			{
				C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
			}
		}
		ItemSize = float(SlotWidth * Inventory[i].Size);
		IconX = FMin(ItemSize, MyH * 2.3000000);
		IconY = IconX / float(2);
		// End:0x4B1
		if(Inventory[i].Icon != none)
		{
			C.SetPos(X + ((ItemSize - IconX) / float(2)), MyY + ((MyH - IconY) / float(2)));
			C.DrawTile(Inventory[i].Icon, IconX, IconY, 0.0000000, 0.0000000, float(Inventory[i].Icon.MaterialUSize()), float(Inventory[i].Icon.MaterialVSize()));
		}
		// End:0x4E3
		if(Inventory[i].bBad)
		{
			C.SetDrawColor(byte(255), 0, 0, byte(255));			
		}
		else
		{
			// End:0x517
			if(Inventory[i].SectionIndex == 0)
			{
				C.SetDrawColor(byte(255), 128, 0, byte(255));				
			}
			else
			{
				C.SetDrawColor(0, 128, byte(255), byte(255));
			}
		}
		C.SetPos(X, MyY);
		C.DrawTileStretched(BoxTex, ItemSize, MyH);
		DisplayString = Inventory[i].Title;
		// End:0x5C1
		if(i == initial_wep_index)
		{
			C.SetDrawColor(32, byte(255), 0, byte(255));
			DisplayString $= " - Initial";			
		}
		else
		{
			// End:0x5F5
			if(Inventory[i].SectionIndex == 0)
			{
				C.SetDrawColor(byte(255), 128, 0, byte(255));				
			}
			else
			{
				C.SetDrawColor(0, 128, byte(255), byte(255));
			}
		}
		C.Font = Controller.GetMenuFont("UT2SmallFont").GetFont(int(C.ClipX * 0.8000000));
		C.StrLen(DisplayString, XL, YL);
		// End:0x776
		if(XL > ItemSize)
		{
			j = InStr(DisplayString, " ");
			S = Left(DisplayString, j);
			C.SetPos(X + (float(4) * ScaleFactor), ((MyY + MyH) - (YL * float(2))) - (float(4) * ScaleFactor));
			C.DrawText(S, false);
			S = Right(DisplayString, (Len(DisplayString) - j) - 1);
			C.SetPos(X + (float(4) * ScaleFactor), ((MyY + MyH) - YL) - (float(4) * ScaleFactor));
			C.DrawText(S, false);			
		}
		else
		{
			C.SetPos(X + (float(4) * ScaleFactor), ((MyY + MyH) - YL) - (float(4) * ScaleFactor));
			C.DrawText(DisplayString, false);
		}
		C.SetDrawColor(byte(255), 64, 64, byte(255));
		C.StrLen(Inventory[i].Ammo, XL, YL);
		C.SetPos(((X + ItemSize) - (float(6) * ScaleFactor)) - XL, MyY + (float(4) * ScaleFactor));
		C.DrawText(Inventory[i].Ammo, false);
		X += ItemSize;
		i++;
		// [Loop Continue]
		goto J0x2CE;
	}
	//return;	
}

defaultproperties
{
	SectionSizes[0]=10
	SectionSizes[1]=2
	// Reference: GUIListBox'BallisticProV55.MidGameTab_Conflict.lb_WeaponsList'
	begin object name="lb_WeaponsList" class=XInterface.GUIListBox
		SelectedStyleName="Page"
		bVisibleWhenEmpty=true
		OnCreateComponent=lb_WeaponsList.InternalOnCreateComponent
		FontScale=1
		IniOption="@Internal"
		StyleName="Page"
		Hint="Available items. Double-click to add them to your inventory."
		WinTop=0.0700000
		WinLeft=0.0150000
		WinWidth=0.4000000
		WinHeight=0.5800000
		RenderWeight=0.5200000
		TabOrder=1
	end object
	lb_Weapons=lb_WeaponsList
	// Reference: GUIImage'BallisticProV55.MidGameTab_Conflict.Box_WeapListImg'
	begin object name="Box_WeapListImg" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.0200000
		WinWidth=0.4300000
		WinHeight=0.6750000
		RenderWeight=0.0020000
	end object
	Box_WeapList=Box_WeapListImg
	// Reference: GUIImage'BallisticProV55.MidGameTab_Conflict.Box_InventoryImg'
	begin object name="Box_InventoryImg" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.7000000
		WinHeight=0.2000000
		RenderWeight=0.0020000
		bAcceptsInput=true
		OnRendered=MidGameTab_Conflict.DrawInventory
		OnClick=MidGameTab_Conflict.InternalOnClick
		OnRightClick=MidGameTab_Conflict.InternalOnRightClick
	end object
	Box_Inventory=Box_InventoryImg
	// Reference: GUIImage'BallisticProV55.MidGameTab_Conflict.Pic_WeaponImg'
	begin object name="Pic_WeaponImg" class=XInterface.GUIImage
		ImageStyle=4
		ImageAlign=1
		WinTop=0.0400000
		WinLeft=0.5150000
		WinWidth=0.4000000
		WinHeight=0.2260000
		RenderWeight=0.0040000
	end object
	Pic_Weapon=Pic_WeaponImg
	// Reference: GUIImage'BallisticProV55.MidGameTab_Conflict.Box_WeapIconImg'
	begin object name="Box_WeapIconImg" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.0200000
		WinLeft=0.4500000
		WinWidth=0.5400000
		WinHeight=0.6750000
		RenderWeight=0.0020000
	end object
	Box_WeapIcon=Box_WeapIconImg
	// Reference: GUILabel'BallisticProV55.MidGameTab_Conflict.l_WeapTitlelabel'
	begin object name="l_WeapTitlelabel" class=XInterface.GUILabel
		TextAlign=1
		TextColor=(R=255,G=255,B=255,A=255)
		WinTop=0.0200000
		WinLeft=0.5100000
		WinWidth=0.4300000
		WinHeight=0.0500000
	end object
	l_WeapTitle=l_WeapTitlelabel
	// Reference: GUIComboBox'BallisticProV55.MidGameTab_Conflict.cb_WeapLayoutIndexComBox'
	begin object name="cb_WeapLayoutIndexComBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Weapon layouts."
		WinTop=0.2800000
		WinLeft=0.4800000
		WinWidth=0.1960940
		WinHeight=0.0400000
		TabOrder=0
		OnChange=MidGameTab_Conflict.InternalOnChange
		OnKeyEvent=cb_WeapLayoutIndexComBox.InternalOnKeyEvent
	end object
	cb_WeapLayoutIndex=cb_WeapLayoutIndexComBox
	// Reference: GUIComboBox'BallisticProV55.MidGameTab_Conflict.cb_WeapCamoIndexComBox'
	begin object name="cb_WeapCamoIndexComBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Weapon camos."
		WinTop=0.2800000
		WinLeft=0.7400000
		WinWidth=0.1960940
		WinHeight=0.0400000
		TabOrder=0
		OnChange=MidGameTab_Conflict.InternalOnChange
		OnKeyEvent=cb_WeapCamoIndexComBox.InternalOnKeyEvent
	end object
	cb_WeapCamoIndex=cb_WeapCamoIndexComBox
	// Reference: GUIScrollTextBox'BallisticProV55.MidGameTab_Conflict.WeaponDescription'
	begin object name="WeaponDescription" class=XInterface.GUIScrollTextBox
		bNoTeletype=true
		CharDelay=0.0015000
		EOLDelay=0.2500000
		bVisibleWhenEmpty=true
		OnCreateComponent=WeaponDescription.InternalOnCreateComponent
		FontScale=0
		WinTop=0.3200000
		WinLeft=0.4800000
		WinWidth=0.5000000
		WinHeight=0.3750000
		RenderWeight=0.5100000
		TabOrder=0
		bAcceptsInput=false
		bNeverFocus=true
	end object
	tb_Desc=WeaponDescription
	// Reference: GUIButton'BallisticProV55.MidGameTab_Conflict.BStatButton'
	begin object name="BStatButton" class=XInterface.GUIButton
		Caption="Stats"
		WinTop=0.9200000
		WinLeft=0.8000000
		WinWidth=0.1800000
		TabOrder=1
		OnClick=MidGameTab_Conflict.InternalOnClick
		OnKeyEvent=CancelButton.InternalOnKeyEvent
	end object
	bStats=BStatButton
	// Reference: GUIButton'BallisticProV55.MidGameTab_Conflict.BClearButton'
	begin object name="BClearButton" class=XInterface.GUIButton
		Caption="Clear Loadout"
		WinTop=0.9200000
		WinLeft=0.5000000
		WinWidth=0.1800000
		TabOrder=1
		OnClick=MidGameTab_Conflict.InternalOnClick
		OnKeyEvent=CancelButton.InternalOnKeyEvent
	end object
	bClear=BClearButton
	// Reference: GUIButton'BallisticProV55.MidGameTab_Conflict.BSaveButton'
	begin object name="BSaveButton" class=XInterface.GUIButton
		Caption="Save Loadout"
		WinTop=0.9200000
		WinLeft=0.3000000
		WinWidth=0.1800000
		TabOrder=1
		OnClick=MidGameTab_Conflict.InternalOnClick
		OnKeyEvent=CancelButton.InternalOnKeyEvent
	end object
	bSave=BSaveButton
	// Reference: GUILabel'BallisticProV55.MidGameTab_Conflict.l_StatTimeLabel'
	begin object name="l_StatTimeLabel" class=XInterface.GUILabel
		Caption="Time"
		TextColor=(R=0,G=255,B=0,A=255)
		TextFont="UT2SmallFont"
		FontScale=0
		WinTop=0.5400000
		WinLeft=0.5500000
		WinWidth=0.4000000
		WinHeight=0.0300000
	end object
	l_StatTime=l_StatTimeLabel
	// Reference: GUILabel'BallisticProV55.MidGameTab_Conflict.l_StatFragsLabel'
	begin object name="l_StatFragsLabel" class=XInterface.GUILabel
		Caption="Frags"
		TextColor=(R=0,G=255,B=0,A=255)
		TextFont="UT2SmallFont"
		FontScale=0
		WinTop=0.5600000
		WinLeft=0.5500000
		WinWidth=0.4000000
		WinHeight=0.0300000
	end object
	l_StatFrags=l_StatFragsLabel
	// Reference: GUILabel'BallisticProV55.MidGameTab_Conflict.l_StatEfficiencyLabel'
	begin object name="l_StatEfficiencyLabel" class=XInterface.GUILabel
		Caption="Efficiency"
		TextColor=(R=0,G=255,B=0,A=255)
		TextFont="UT2SmallFont"
		FontScale=0
		WinTop=0.5800000
		WinLeft=0.5500000
		WinWidth=0.4000000
		WinHeight=0.0300000
	end object
	l_StatEfficiency=l_StatEfficiencyLabel
	// Reference: GUILabel'BallisticProV55.MidGameTab_Conflict.l_StatDamageRateLabel'
	begin object name="l_StatDamageRateLabel" class=XInterface.GUILabel
		Caption="DamageRate"
		TextColor=(R=0,G=255,B=0,A=255)
		TextFont="UT2SmallFont"
		FontScale=0
		WinTop=0.6000000
		WinLeft=0.5500000
		WinWidth=0.4000000
		WinHeight=0.0300000
	end object
	l_StatDamageRate=l_StatDamageRateLabel
	// Reference: GUILabel'BallisticProV55.MidGameTab_Conflict.l_StatSniperEffLabel'
	begin object name="l_StatSniperEffLabel" class=XInterface.GUILabel
		Caption="Sniper Efficiency"
		TextColor=(R=0,G=255,B=0,A=255)
		TextFont="UT2SmallFont"
		FontScale=0
		WinTop=0.6200000
		WinLeft=0.5500000
		WinWidth=0.4000000
		WinHeight=0.0300000
	end object
	l_StatSniperEff=l_StatSniperEffLabel
	// Reference: GUILabel'BallisticProV55.MidGameTab_Conflict.l_StatShotgunEffLabel'
	begin object name="l_StatShotgunEffLabel" class=XInterface.GUILabel
		Caption="Shotgun Efficiency"
		TextColor=(R=0,G=255,B=0,A=255)
		TextFont="UT2SmallFont"
		FontScale=0
		WinTop=0.6400000
		WinLeft=0.5500000
		WinWidth=0.4000000
		WinHeight=0.0300000
	end object
	l_StatShotgunEff=l_StatShotgunEffLabel
	// Reference: GUILabel'BallisticProV55.MidGameTab_Conflict.l_StatHazardEffLabel'
	begin object name="l_StatHazardEffLabel" class=XInterface.GUILabel
		Caption="Hazard Efficiency"
		TextColor=(R=0,G=255,B=0,A=255)
		TextFont="UT2SmallFont"
		FontScale=0
		WinTop=0.6600000
		WinLeft=0.5500000
		WinWidth=0.4000000
		WinHeight=0.0300000
	end object
	l_StatHazardEff=l_StatHazardEffLabel
	// Reference: GUILabel'BallisticProV55.MidGameTab_Conflict.l_StatHeadingLabel'
	begin object name="l_StatHeadingLabel" class=XInterface.GUILabel
		Caption="Your Stats"
		TextAlign=1
		TextColor=(R=255,G=255,B=0,A=255)
		TextFont="UT2SmallFont"
		FontScale=0
		WinTop=0.5100000
		WinLeft=0.5500000
		WinWidth=0.4000000
		WinHeight=0.0300000
	end object
	l_StatHeading=l_StatHeadingLabel
	// Reference: GUILabel'BallisticProV55.MidGameTab_Conflict.l_LoadingLabel'
	begin object name="l_LoadingLabel" class=XInterface.GUILabel
		Caption="Receiving List..."
		TextAlign=1
		TextColor=(R=255,G=255,B=0,A=255)
		WinTop=0.4000000
		WinLeft=0.5500000
		WinWidth=0.4000000
		WinHeight=0.0300000
	end object
	l_Loading=l_LoadingLabel
	// Reference: moComboBox'BallisticProV55.MidGameTab_Conflict.co_PresetsCB'
	begin object name="co_PresetsCB" class=XInterface.moComboBox
		ComponentJustification=0
		CaptionWidth=0.4000000
		Caption="Presets"
		OnCreateComponent=co_PresetsCB.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Choose a preset replacements configuration, or type a new preset name here and click 'Save' to make the current configuration a new preset."
		WinTop=0.9200000
		WinLeft=0.0000000
		WinWidth=0.2800000
		OnChange=MidGameTab_Conflict.InternalOnChange
	end object
	cb_Presets=co_PresetsCB
	StatTimeCaption="Time: "
	StatFragsCaption="Frags: "
	StatEffCaption="Efficiency: "
	StatDmgRtCaption="DamageRate: "
	StatSnprEffCaption="Sniper Efficiency: "
	StatStgnEffCaption="Shotgun Efficiency: "
	StatHzrdEffCaption="Hazard Efficiency: "
	BoxTex=Texture'BW_Core_WeaponTex.ui.SelectionBox'
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: moComboBox'BallisticProV55.MidGameTab_Conflict.co_PresetsCB'
begin object name="co_PresetsCB" class=XInterface.moComboBox
	ComponentJustification=0
	CaptionWidth=0.4000000
	Caption="Presets"
	OnCreateComponent=co_PresetsCB.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Choose a preset replacements configuration, or type a new preset name here and click 'Save' to make the current configuration a new preset."
	WinTop=0.9200000
	WinLeft=0.0000000
	WinWidth=0.2800000
	OnChange=MidGameTab_Conflict.InternalOnChange
end object
// Reference: GUIComboBox'BallisticProV55.MidGameTab_Conflict.cb_WeapCamoIndexComBox'
begin object name="cb_WeapCamoIndexComBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Weapon camos."
	WinTop=0.2800000
	WinLeft=0.7400000
	WinWidth=0.1960940
	WinHeight=0.0400000
	TabOrder=0
	OnChange=MidGameTab_Conflict.InternalOnChange
	OnKeyEvent=cb_WeapCamoIndexComBox.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.MidGameTab_Conflict.cb_WeapLayoutIndexComBox'
begin object name="cb_WeapLayoutIndexComBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Weapon layouts."
	WinTop=0.2800000
	WinLeft=0.4800000
	WinWidth=0.1960940
	WinHeight=0.0400000
	TabOrder=0
	OnChange=MidGameTab_Conflict.InternalOnChange
	OnKeyEvent=cb_WeapLayoutIndexComBox.InternalOnKeyEvent
end object
// Reference: GUIScrollTextBox'BallisticProV55.MidGameTab_Conflict.WeaponDescription'
begin object name="WeaponDescription" class=XInterface.GUIScrollTextBox
	bNoTeletype=true
	CharDelay=0.0015000
	EOLDelay=0.2500000
	bVisibleWhenEmpty=true
	OnCreateComponent=WeaponDescription.InternalOnCreateComponent
	FontScale=0
	WinTop=0.3200000
	WinLeft=0.4800000
	WinWidth=0.5000000
	WinHeight=0.3750000
	RenderWeight=0.5100000
	TabOrder=0
	bAcceptsInput=false
	bNeverFocus=true
end object
// Reference: GUIListBox'BallisticProV55.MidGameTab_Conflict.lb_WeaponsList'
begin object name="lb_WeaponsList" class=XInterface.GUIListBox
	SelectedStyleName="Page"
	bVisibleWhenEmpty=true
	OnCreateComponent=lb_WeaponsList.InternalOnCreateComponent
	FontScale=1
	IniOption="@Internal"
	StyleName="Page"
	Hint="Available items. Double-click to add them to your inventory."
	WinTop=0.0700000
	WinLeft=0.0150000
	WinWidth=0.4000000
	WinHeight=0.5800000
	RenderWeight=0.5200000
	TabOrder=1
end object
// Reference: GUIImage'BallisticProV55.MidGameTab_Conflict.Box_WeapListImg'
begin object name="Box_WeapListImg" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.0200000
	WinWidth=0.4300000
	WinHeight=0.6750000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.MidGameTab_Conflict.Box_InventoryImg'
begin object name="Box_InventoryImg" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.7000000
	WinHeight=0.2000000
	RenderWeight=0.0020000
	bAcceptsInput=true
	OnRendered=MidGameTab_Conflict.DrawInventory
	OnClick=MidGameTab_Conflict.InternalOnClick
	OnRightClick=MidGameTab_Conflict.InternalOnRightClick
end object
// Reference: GUIImage'BallisticProV55.MidGameTab_Conflict.Pic_WeaponImg'
begin object name="Pic_WeaponImg" class=XInterface.GUIImage
	ImageStyle=4
	ImageAlign=1
	WinTop=0.0400000
	WinLeft=0.5150000
	WinWidth=0.4000000
	WinHeight=0.2260000
	RenderWeight=0.0040000
end object
// Reference: GUIImage'BallisticProV55.MidGameTab_Conflict.Box_WeapIconImg'
begin object name="Box_WeapIconImg" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.0200000
	WinLeft=0.4500000
	WinWidth=0.5400000
	WinHeight=0.6750000
	RenderWeight=0.0020000
end object
// Reference: GUILabel'BallisticProV55.MidGameTab_Conflict.l_WeapTitlelabel'
begin object name="l_WeapTitlelabel" class=XInterface.GUILabel
	TextAlign=1
	TextColor=(R=255,G=255,B=255,A=255)
	WinTop=0.0200000
	WinLeft=0.5100000
	WinWidth=0.4300000
	WinHeight=0.0500000
end object
// Reference: GUIButton'BallisticProV55.MidGameTab_Conflict.BSaveButton'
begin object name="BSaveButton" class=XInterface.GUIButton
	Caption="Save Loadout"
	WinTop=0.9200000
	WinLeft=0.3000000
	WinWidth=0.1800000
	TabOrder=1
	OnClick=MidGameTab_Conflict.InternalOnClick
	OnKeyEvent=CancelButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.MidGameTab_Conflict.BClearButton'
begin object name="BClearButton" class=XInterface.GUIButton
	Caption="Clear Loadout"
	WinTop=0.9200000
	WinLeft=0.5000000
	WinWidth=0.1800000
	TabOrder=1
	OnClick=MidGameTab_Conflict.InternalOnClick
	OnKeyEvent=CancelButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.MidGameTab_Conflict.BStatButton'
begin object name="BStatButton" class=XInterface.GUIButton
	Caption="Stats"
	WinTop=0.9200000
	WinLeft=0.8000000
	WinWidth=0.1800000
	TabOrder=1
	OnClick=MidGameTab_Conflict.InternalOnClick
	OnKeyEvent=CancelButton.InternalOnKeyEvent
end object
// Reference: GUILabel'BallisticProV55.MidGameTab_Conflict.l_StatTimeLabel'
begin object name="l_StatTimeLabel" class=XInterface.GUILabel
	Caption="Time"
	TextColor=(R=0,G=255,B=0,A=255)
	TextFont="UT2SmallFont"
	FontScale=0
	WinTop=0.5400000
	WinLeft=0.5500000
	WinWidth=0.4000000
	WinHeight=0.0300000
end object
// Reference: GUILabel'BallisticProV55.MidGameTab_Conflict.l_StatFragsLabel'
begin object name="l_StatFragsLabel" class=XInterface.GUILabel
	Caption="Frags"
	TextColor=(R=0,G=255,B=0,A=255)
	TextFont="UT2SmallFont"
	FontScale=0
	WinTop=0.5600000
	WinLeft=0.5500000
	WinWidth=0.4000000
	WinHeight=0.0300000
end object
// Reference: GUILabel'BallisticProV55.MidGameTab_Conflict.l_StatEfficiencyLabel'
begin object name="l_StatEfficiencyLabel" class=XInterface.GUILabel
	Caption="Efficiency"
	TextColor=(R=0,G=255,B=0,A=255)
	TextFont="UT2SmallFont"
	FontScale=0
	WinTop=0.5800000
	WinLeft=0.5500000
	WinWidth=0.4000000
	WinHeight=0.0300000
end object
// Reference: GUILabel'BallisticProV55.MidGameTab_Conflict.l_StatDamageRateLabel'
begin object name="l_StatDamageRateLabel" class=XInterface.GUILabel
	Caption="DamageRate"
	TextColor=(R=0,G=255,B=0,A=255)
	TextFont="UT2SmallFont"
	FontScale=0
	WinTop=0.6000000
	WinLeft=0.5500000
	WinWidth=0.4000000
	WinHeight=0.0300000
end object
// Reference: GUILabel'BallisticProV55.MidGameTab_Conflict.l_StatSniperEffLabel'
begin object name="l_StatSniperEffLabel" class=XInterface.GUILabel
	Caption="Sniper Efficiency"
	TextColor=(R=0,G=255,B=0,A=255)
	TextFont="UT2SmallFont"
	FontScale=0
	WinTop=0.6200000
	WinLeft=0.5500000
	WinWidth=0.4000000
	WinHeight=0.0300000
end object
// Reference: GUILabel'BallisticProV55.MidGameTab_Conflict.l_StatShotgunEffLabel'
begin object name="l_StatShotgunEffLabel" class=XInterface.GUILabel
	Caption="Shotgun Efficiency"
	TextColor=(R=0,G=255,B=0,A=255)
	TextFont="UT2SmallFont"
	FontScale=0
	WinTop=0.6400000
	WinLeft=0.5500000
	WinWidth=0.4000000
	WinHeight=0.0300000
end object
// Reference: GUILabel'BallisticProV55.MidGameTab_Conflict.l_StatHazardEffLabel'
begin object name="l_StatHazardEffLabel" class=XInterface.GUILabel
	Caption="Hazard Efficiency"
	TextColor=(R=0,G=255,B=0,A=255)
	TextFont="UT2SmallFont"
	FontScale=0
	WinTop=0.6600000
	WinLeft=0.5500000
	WinWidth=0.4000000
	WinHeight=0.0300000
end object
// Reference: GUILabel'BallisticProV55.MidGameTab_Conflict.l_StatHeadingLabel'
begin object name="l_StatHeadingLabel" class=XInterface.GUILabel
	Caption="Your Stats"
	TextAlign=1
	TextColor=(R=255,G=255,B=0,A=255)
	TextFont="UT2SmallFont"
	FontScale=0
	WinTop=0.5100000
	WinLeft=0.5500000
	WinWidth=0.4000000
	WinHeight=0.0300000
end object
// Reference: GUILabel'BallisticProV55.MidGameTab_Conflict.l_LoadingLabel'
begin object name="l_LoadingLabel" class=XInterface.GUILabel
	Caption="Receiving List..."
	TextAlign=1
	TextColor=(R=255,G=255,B=0,A=255)
	WinTop=0.4000000
	WinLeft=0.5500000
	WinWidth=0.4000000
	WinHeight=0.0300000
end object
