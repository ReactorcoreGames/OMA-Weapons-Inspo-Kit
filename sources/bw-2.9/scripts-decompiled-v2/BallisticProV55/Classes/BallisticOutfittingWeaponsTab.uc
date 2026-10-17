class BallisticOutfittingWeaponsTab extends UT2K4TabPanel
	config(BallisticProV55)
	editinlinenew
	instanced;

struct LoadoutWeapons
{
	var string PresetName;
	var string Weapons[5];
	var int Layouts[5];
	var int Camos[5];
};

struct WeaponItemInfo
{
	var string ItemCap;
	var Material ItemImage;
	var string ItemClassName;
	var IntBox ImageCoords;
	var int InventoryGroup;
	var byte Index;
};

var() automated GUILoadOutItem Item_Melee;
var() automated GUILoadOutItem Item_SideArm;
var() automated GUILoadOutItem Item_Primary;
var() automated GUILoadOutItem Item_Secondary;
var() automated GUILoadOutItem Item_Grenade;
var() automated GUIComboBox cb_Melee;
var() automated GUIComboBox cb_SideArm;
var() automated GUIComboBox cb_Primary;
var() automated GUIComboBox cb_Secondary;
var() automated GUIComboBox cb_Grenade;
var() automated GUIComboBox cb_Melee_LI;
var() automated GUIComboBox cb_SideArm_LI;
var() automated GUIComboBox cb_Primary_LI;
var() automated GUIComboBox cb_Secondary_LI;
var() automated GUIComboBox cb_Grenade_LI;
var() automated GUIComboBox cb_Melee_CI;
var() automated GUIComboBox cb_SideArm_CI;
var() automated GUIComboBox cb_Primary_CI;
var() automated GUIComboBox cb_Secondary_CI;
var() automated GUIComboBox cb_Grenade_CI;
var() automated moComboBox cb_Presets;
var() automated GUIImage Box_Melee;
var() automated GUIImage Box_SideArm;
var() automated GUIImage Box_Primary;
var() automated GUIImage Box_Secondary;
var() automated GUIImage Box_Grenade;
var() automated GUIImage Box_Streak1;
var() automated GUIImage Box_Streak2;
var() automated GUIImage Box_Streak3;
var() automated GUIImage MeleeBack;
var() automated GUIImage SideArmBack;
var() automated GUIImage PrimaryBack;
var() automated GUIImage SecondaryBack;
var() automated GUIImage GrenadeBack;
var() automated GUIButton bDone;
var() automated GUIButton bCancel;
var() automated GUIButton BSavePreset;
var() automated GUILabel l_Receiving;
var export editinline BallisticOutfittingMenu p_Anchor;
var config int CurrentIndex;
var config bool bInitialized;
var bool bWeaponsLoaded;
var() config LoadoutWeapons SavedLoadouts[5];
var array<WeaponItemInfo> sortedPrimaries;
var array<WeaponItemInfo> sortedSecondaries;
var int NumPresets;
var() localized string QuickListText;
var localized string ReceivingText[2];
var ClientOutfittingInterface COI;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	super(GUIPanel).InitComponent(MyController, MyOwner);
	// End:0x42
	if(BallisticOutfittingMenu(Controller.ActivePage) != none)
	{
		p_Anchor = BallisticOutfittingMenu(Controller.ActivePage);
	}
	Item_Melee.__OnItemChange__Delegate = OnLoadoutItemChange;
	Item_SideArm.__OnItemChange__Delegate = OnLoadoutItemChange;
	Item_Primary.__OnItemChange__Delegate = OnLoadoutItemChange;
	Item_Secondary.__OnItemChange__Delegate = OnLoadoutItemChange;
	Item_Grenade.__OnItemChange__Delegate = OnLoadoutItemChange;
	//return;	
}

function ShowPanel(bool bShow)
{
	local int i;

	super(GUITabPanel).ShowPanel(bShow);
	// End:0xB4
	if(!bInitialized)
	{
		i = 0;
		J0x1E:

		// End:0x5B [Loop If]
		if(i < 5)
		{
			SavedLoadouts[0].Weapons[i] = Class'BallisticProV55.Mut_Outfitting'.default.LoadOut[i];
			i++;
			// [Loop Continue]
			goto J0x1E;
		}
		SavedLoadouts[0].Layouts[i] = Class'BallisticProV55.Mut_Outfitting'.default.Layout[i];
		SavedLoadouts[0].Camos[i] = Class'BallisticProV55.Mut_Outfitting'.default.Camo[i];
		bInitialized = true;
		SaveConfig();
	}
	// End:0x19E
	if(!bWeaponsLoaded)
	{
		// End:0x142
		if((COI == none) || COI.bWeaponsReady)
		{
			// End:0x120
			if(int(PlayerOwner().Level.NetMode) == int(NM_Client))
			{
				l_Receiving.Caption = ReceivingText[0];
				SetTimer(0.5000000, true);				
			}
			else
			{
				l_Receiving.Caption = ReceivingText[1];
				SetTimer(0.1000000, true);
			}			
		}
		else
		{
			LoadWeapons();
			bWeaponsLoaded = true;
		}
		cb_Melee.List.bSorted = true;
		cb_SideArm.List.bSorted = true;
		cb_Grenade.List.bSorted = true;
	}
	//return;	
}

event Timer()
{
	// End:0x3D
	if(((COI != none) && COI.bWeaponsReady) && !bWeaponsLoaded)
	{
		KillTimer();
		LoadWeapons();
		bWeaponsLoaded = true;
	}
	//return;	
}

function LoadWeapons()
{
	local int i;
	local string ic, ICN;
	local Material IMat;
	local IntBox ICrds;
	local int LastIndex;

	i = 0;
	J0x07:

	// End:0xA0 [Loop If]
	if(i < COI.GroupLength(0))
	{
		// End:0x96
		if(GetItemInfo(0, i, ic, IMat, ICN, ICrds))
		{
			Item_Melee.AddItem(ic, IMat, ICN, ICrds);
			cb_Melee.AddItem(ic,, ICN);
			cb_Melee.SetText(QuickListText);
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0xA7:

	// End:0x140 [Loop If]
	if(i < COI.GroupLength(1))
	{
		// End:0x136
		if(GetItemInfo(1, i, ic, IMat, ICN, ICrds))
		{
			Item_SideArm.AddItem(ic, IMat, ICN, ICrds);
			cb_SideArm.AddItem(ic,, ICN);
			cb_SideArm.SetText(QuickListText);
		}
		i++;
		// [Loop Continue]
		goto J0xA7;
	}
	i = 0;
	J0x147:

	// End:0x179 [Loop If]
	if(i < COI.GroupLength(2))
	{
		FillItemInfos(2, i);
		i++;
		// [Loop Continue]
		goto J0x147;
	}
	LastIndex = -1;
	i = 0;
	J0x18B:

	// End:0x2A1 [Loop If]
	if(i < sortedPrimaries.Length)
	{
		// End:0x204
		if(sortedPrimaries[i].InventoryGroup > LastIndex)
		{
			LastIndex = sortedPrimaries[i].InventoryGroup;
			cb_Primary.MyListBox.List.Add(Class'BCoreProV55.BallisticWeaponClassInfo'.static.GetHeading(LastIndex), none, "", true);
		}
		Item_Primary.AddItem(sortedPrimaries[i].ItemCap, sortedPrimaries[i].ItemImage, sortedPrimaries[i].ItemClassName, sortedPrimaries[i].ImageCoords);
		cb_Primary.AddItem(sortedPrimaries[i].ItemCap,, sortedPrimaries[i].ItemClassName);
		cb_Primary.SetText(QuickListText);
		i++;
		// [Loop Continue]
		goto J0x18B;
	}
	i = 0;
	J0x2A8:

	// End:0x2DA [Loop If]
	if(i < COI.GroupLength(3))
	{
		FillItemInfos(3, i);
		i++;
		// [Loop Continue]
		goto J0x2A8;
	}
	LastIndex = -1;
	i = 0;
	J0x2EC:

	// End:0x402 [Loop If]
	if(i < sortedSecondaries.Length)
	{
		// End:0x365
		if(sortedSecondaries[i].InventoryGroup > LastIndex)
		{
			LastIndex = sortedSecondaries[i].InventoryGroup;
			cb_Secondary.MyListBox.List.Add(Class'BCoreProV55.BallisticWeaponClassInfo'.static.GetHeading(LastIndex), none, "", true);
		}
		Item_Secondary.AddItem(sortedSecondaries[i].ItemCap, sortedSecondaries[i].ItemImage, sortedSecondaries[i].ItemClassName, sortedSecondaries[i].ImageCoords);
		cb_Secondary.AddItem(sortedSecondaries[i].ItemCap,, sortedSecondaries[i].ItemClassName);
		cb_Secondary.SetText(QuickListText);
		i++;
		// [Loop Continue]
		goto J0x2EC;
	}
	i = 0;
	J0x409:

	// End:0x4A3 [Loop If]
	if(i < COI.GroupLength(4))
	{
		// End:0x499
		if(GetItemInfo(4, i, ic, IMat, ICN, ICrds))
		{
			Item_Grenade.AddItem(ic, IMat, ICN, ICrds);
			cb_Grenade.AddItem(ic,, ICN);
			cb_Grenade.SetText(QuickListText);
		}
		i++;
		// [Loop Continue]
		goto J0x409;
	}
	Item_Melee.SetItem(SavedLoadouts[CurrentIndex].Weapons[0]);
	LoadLayouts(0, Item_Melee.Index, cb_Melee_LI);
	cb_Melee_LI.SetIndex(SavedLoadouts[CurrentIndex].Layouts[0]);
	LoadCamos(0, cb_Melee_LI.GetIndex(), Item_Melee.Index, cb_Melee_CI);
	Item_SideArm.SetItem(SavedLoadouts[CurrentIndex].Weapons[1]);
	LoadLayouts(1, Item_SideArm.Index, cb_SideArm_LI);
	cb_SideArm_LI.SetIndex(SavedLoadouts[CurrentIndex].Layouts[1]);
	LoadCamos(1, cb_SideArm_LI.GetIndex(), Item_SideArm.Index, cb_SideArm_CI);
	Item_Primary.SetItem(SavedLoadouts[CurrentIndex].Weapons[2]);
	LoadLayouts(2, int(sortedPrimaries[Item_Primary.Index].Index), cb_Primary_LI);
	cb_Primary_LI.SetIndex(SavedLoadouts[CurrentIndex].Layouts[2]);
	LoadCamos(2, cb_Primary_LI.GetIndex(), int(sortedPrimaries[Item_Primary.Index].Index), cb_Primary_CI);
	Item_Secondary.SetItem(SavedLoadouts[CurrentIndex].Weapons[3]);
	LoadLayouts(3, int(sortedSecondaries[Item_Secondary.Index].Index), cb_Secondary_LI);
	cb_Secondary_LI.SetIndex(SavedLoadouts[CurrentIndex].Layouts[3]);
	LoadCamos(3, cb_Secondary_LI.GetIndex(), int(sortedSecondaries[Item_Secondary.Index].Index), cb_Secondary_CI);
	Item_Grenade.SetItem(SavedLoadouts[CurrentIndex].Weapons[4]);
	LoadLayouts(4, Item_Grenade.Index, cb_Grenade_LI);
	cb_Grenade_LI.SetIndex(SavedLoadouts[CurrentIndex].Layouts[4]);
	LoadCamos(4, cb_Grenade_LI.GetIndex(), Item_Grenade.Index, cb_Grenade_CI);
	i = 0;
	J0x783:

	// End:0x7C0 [Loop If]
	if(i < 5)
	{
		cb_Presets.AddItem(SavedLoadouts[i].PresetName,, string(i));
		i++;
		// [Loop Continue]
		goto J0x783;
	}
	cb_Presets.SetIndex(Clamp(CurrentIndex, 0, 5));
	Class'BCoreProV55.BC_WeaponInfoCache'.static.EndSession();
	l_Receiving.Caption = "";
	//return;	
}

function bool GetItemInfo(int Group, int Index, out string ItemCap, out Material ItemImage, out string ItemClassName, optional out IntBox ImageCoords)
{
	local WeaponInfo WI;
	local int i;

	// End:0x24
	if(COI.GetGroupItem(byte(Group), Index) == "")
	{
		return false;
	}
	WI = Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(COI.GetGroupItem(byte(Group), Index), i);
	// End:0xB3
	if(i == -1)
	{
		Log("Error loading item for outfitting: " $ COI.GetGroupItem(byte(Group), Index), 'Warning');
		return false;
	}
	ItemCap = WI.ItemName;
	ItemClassName = COI.GetGroupItem(byte(Group), Index);
	// End:0x145
	if(WI.bIsBW)
	{
		ItemImage = WI.BigIconMaterial;
		ImageCoords.X1 = -1;
		ImageCoords.X2 = -1;
		ImageCoords.Y1 = -1;
		ImageCoords.Y2 = -1;		
	}
	else
	{
		ItemImage = WI.SmallIconMaterial;
		ImageCoords = WI.SmallIconCoords;
	}
	return true;
	//return;	
}

function FillItemInfos(int Group, int Index)
{
	local WeaponInfo WI;
	local int i;
	local WeaponItemInfo WInfo;

	// End:0x24
	if(COI.GetGroupItem(byte(Group), Index) == "")
	{
		return;
	}
	WI = Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(COI.GetGroupItem(byte(Group), Index), i);
	// End:0xB3
	if(i == -1)
	{
		Log("Error loading item for outfitting: " $ COI.GetGroupItem(byte(Group), Index), 'Warning');
		return;
	}
	WInfo.ItemCap = WI.ItemName;
	WInfo.InventoryGroup = WI.InventoryGroup;
	WInfo.ItemClassName = COI.GetGroupItem(byte(Group), Index);
	WInfo.Index = byte(Index);
	// End:0x18F
	if(WI.bIsBW)
	{
		WInfo.ItemImage = WI.BigIconMaterial;
		WInfo.ImageCoords.X1 = -1;
		WInfo.ImageCoords.X2 = -1;
		WInfo.ImageCoords.Y1 = -1;
		WInfo.ImageCoords.Y2 = -1;		
	}
	else
	{
		WInfo.ItemImage = WI.SmallIconMaterial;
		WInfo.ImageCoords = WI.SmallIconCoords;
	}
	// End:0x2D5
	if(Group == 2)
	{
		// End:0x1E6
		if(sortedPrimaries.Length == 0)
		{
			sortedPrimaries[sortedPrimaries.Length] = WInfo;			
		}
		else
		{
			i = 0;
			J0x1ED:

			// End:0x2D2 [Loop If]
			if(i < sortedPrimaries.Length)
			{
				// End:0x23C
				if(WInfo.InventoryGroup < sortedPrimaries[i].InventoryGroup)
				{
					sortedPrimaries.Insert(i, 1);
					sortedPrimaries[i] = WInfo;
					// [Explicit Break]
					goto J0x2D2;
				}
				// End:0x2A0
				if(WInfo.InventoryGroup == sortedPrimaries[i].InventoryGroup)
				{
					// End:0x2A0
					if(StrCmp(WInfo.ItemCap, sortedPrimaries[i].ItemCap, 6, true) <= 0)
					{
						sortedPrimaries.Insert(i, 1);
						sortedPrimaries[i] = WInfo;
						// [Explicit Break]
						goto J0x2D2;
					}
				}
				// End:0x2C8
				if(i == (sortedPrimaries.Length - 1))
				{
					sortedPrimaries[sortedPrimaries.Length] = WInfo;
					// [Explicit Break]
					goto J0x2D2;
				}
				++i;
				// [Loop Continue]
				goto J0x1ED;
			}
		}
		J0x2D2:
		
	}
	else
	{
		// End:0x2F6
		if(sortedSecondaries.Length == 0)
		{
			sortedSecondaries[sortedSecondaries.Length] = WInfo;			
		}
		else
		{
			i = 0;
			J0x2FD:

			// End:0x3E2 [Loop If]
			if(i < sortedSecondaries.Length)
			{
				// End:0x34C
				if(WInfo.InventoryGroup < sortedSecondaries[i].InventoryGroup)
				{
					sortedSecondaries.Insert(i, 1);
					sortedSecondaries[i] = WInfo;
					// [Explicit Break]
					goto J0x3E2;
				}
				// End:0x3B0
				if(WInfo.InventoryGroup == sortedSecondaries[i].InventoryGroup)
				{
					// End:0x3B0
					if(StrCmp(WInfo.ItemCap, sortedSecondaries[i].ItemCap, 6, true) <= 0)
					{
						sortedSecondaries.Insert(i, 1);
						sortedSecondaries[i] = WInfo;
						// [Explicit Break]
						goto J0x3E2;
					}
				}
				// End:0x3D8
				if(i == (sortedSecondaries.Length - 1))
				{
					sortedSecondaries[sortedSecondaries.Length] = WInfo;
					// [Explicit Break]
					goto J0x3E2;
				}
				++i;
				// [Loop Continue]
				goto J0x2FD;
			}
		}
	}
	J0x3E2:

	//return;	
}

function OnLoadoutItemChange(GUIComponent Sender)
{
	// End:0x55
	if(Sender == Item_Melee)
	{
		LoadLayouts(0, Item_Melee.Index, cb_Melee_LI);
		LoadCamos(0, cb_Melee_LI.GetIndex(), Item_Melee.Index, cb_Melee_CI);		
	}
	else
	{
		// End:0xAA
		if(Sender == Item_SideArm)
		{
			LoadLayouts(1, Item_SideArm.Index, cb_SideArm_LI);
			LoadCamos(1, cb_SideArm_LI.GetIndex(), Item_SideArm.Index, cb_SideArm_CI);			
		}
		else
		{
			// End:0x11B
			if(Sender == Item_Primary)
			{
				LoadLayouts(2, int(sortedPrimaries[Item_Primary.Index].Index), cb_Primary_LI);
				LoadCamos(2, cb_Primary_LI.GetIndex(), int(sortedPrimaries[Item_Primary.Index].Index), cb_Primary_CI);				
			}
			else
			{
				// End:0x18C
				if(Sender == Item_Secondary)
				{
					LoadLayouts(3, int(sortedSecondaries[Item_Secondary.Index].Index), cb_Secondary_LI);
					LoadCamos(3, cb_Secondary_LI.GetIndex(), int(sortedSecondaries[Item_Secondary.Index].Index), cb_Secondary_CI);					
				}
				else
				{
					// End:0x1E0
					if(Sender == Item_Grenade)
					{
						LoadLayouts(4, Item_Grenade.Index, cb_Grenade_LI);
						LoadCamos(4, cb_Grenade_LI.GetIndex(), Item_Grenade.Index, cb_Grenade_CI);
					}
				}
			}
		}
	}
	//return;	
}

function bool InternalOnKeyEvent(out byte Key, out byte State, float Delta)
{
	return false;
	//return;	
}

function bool InternalOnClick(GUIComponent Sender)
{
	// End:0x3EC
	if(Sender == BSavePreset)
	{
		SavedLoadouts[cb_Presets.GetIndex()].PresetName = cb_Presets.GetText();
		// End:0xF4
		if(Item_Melee.items.Length > Item_Melee.Index)
		{
			SavedLoadouts[cb_Presets.GetIndex()].Weapons[0] = Item_Melee.items[Item_Melee.Index].Text;
			SavedLoadouts[cb_Presets.GetIndex()].Layouts[0] = cb_Melee_LI.GetIndex();
			SavedLoadouts[cb_Presets.GetIndex()].Camos[0] = int(cb_Melee_CI.GetExtra());
		}
		// End:0x1AF
		if(Item_SideArm.items.Length > Item_SideArm.Index)
		{
			SavedLoadouts[cb_Presets.GetIndex()].Weapons[1] = Item_SideArm.items[Item_SideArm.Index].Text;
			SavedLoadouts[cb_Presets.GetIndex()].Layouts[1] = cb_SideArm_LI.GetIndex();
			SavedLoadouts[cb_Presets.GetIndex()].Camos[1] = int(cb_SideArm_CI.GetExtra());
		}
		// End:0x26D
		if(Item_Primary.items.Length > Item_Primary.Index)
		{
			SavedLoadouts[cb_Presets.GetIndex()].Weapons[2] = Item_Primary.items[Item_Primary.Index].Text;
			SavedLoadouts[cb_Presets.GetIndex()].Layouts[2] = cb_Primary_LI.GetIndex();
			SavedLoadouts[cb_Presets.GetIndex()].Camos[2] = int(cb_Primary_CI.GetExtra());
		}
		// End:0x32B
		if(Item_Secondary.items.Length > Item_Secondary.Index)
		{
			SavedLoadouts[cb_Presets.GetIndex()].Weapons[3] = Item_Secondary.items[Item_Secondary.Index].Text;
			SavedLoadouts[cb_Presets.GetIndex()].Layouts[3] = cb_Secondary_LI.GetIndex();
			SavedLoadouts[cb_Presets.GetIndex()].Camos[3] = int(cb_Secondary_CI.GetExtra());
		}
		// End:0x3E9
		if(Item_Grenade.items.Length > Item_Grenade.Index)
		{
			SavedLoadouts[cb_Presets.GetIndex()].Weapons[4] = Item_Grenade.items[Item_Grenade.Index].Text;
			SavedLoadouts[cb_Presets.GetIndex()].Layouts[4] = cb_Grenade_LI.GetIndex();
			SavedLoadouts[cb_Presets.GetIndex()].Camos[4] = int(cb_Grenade_CI.GetExtra());
		}
		SaveConfig();
	}
	return true;
	//return;	
}

function SaveWeapons()
{
	SavedLoadouts[cb_Presets.GetIndex()].PresetName = cb_Presets.GetText();
	// End:0xE5
	if(Item_Melee.items.Length > Item_Melee.Index)
	{
		SavedLoadouts[cb_Presets.GetIndex()].Weapons[0] = Item_Melee.items[Item_Melee.Index].Text;
		SavedLoadouts[cb_Presets.GetIndex()].Layouts[0] = cb_Melee_LI.GetIndex();
		SavedLoadouts[cb_Presets.GetIndex()].Camos[0] = int(cb_Melee_CI.GetExtra());
	}
	// End:0x1A0
	if(Item_SideArm.items.Length > Item_SideArm.Index)
	{
		SavedLoadouts[cb_Presets.GetIndex()].Weapons[1] = Item_SideArm.items[Item_SideArm.Index].Text;
		SavedLoadouts[cb_Presets.GetIndex()].Layouts[1] = cb_SideArm_LI.GetIndex();
		SavedLoadouts[cb_Presets.GetIndex()].Camos[1] = int(cb_SideArm_CI.GetExtra());
	}
	// End:0x25E
	if(Item_Primary.items.Length > Item_Primary.Index)
	{
		SavedLoadouts[cb_Presets.GetIndex()].Weapons[2] = Item_Primary.items[Item_Primary.Index].Text;
		SavedLoadouts[cb_Presets.GetIndex()].Layouts[2] = cb_Primary_LI.GetIndex();
		SavedLoadouts[cb_Presets.GetIndex()].Camos[2] = int(cb_Primary_CI.GetExtra());
	}
	// End:0x31C
	if(Item_Secondary.items.Length > Item_Secondary.Index)
	{
		SavedLoadouts[cb_Presets.GetIndex()].Weapons[3] = Item_Secondary.items[Item_Secondary.Index].Text;
		SavedLoadouts[cb_Presets.GetIndex()].Layouts[3] = cb_Secondary_LI.GetIndex();
		SavedLoadouts[cb_Presets.GetIndex()].Camos[3] = int(cb_Secondary_CI.GetExtra());
	}
	// End:0x3DA
	if(Item_Grenade.items.Length > Item_Grenade.Index)
	{
		SavedLoadouts[cb_Presets.GetIndex()].Weapons[4] = Item_Grenade.items[Item_Grenade.Index].Text;
		SavedLoadouts[cb_Presets.GetIndex()].Layouts[4] = cb_Grenade_LI.GetIndex();
		SavedLoadouts[cb_Presets.GetIndex()].Camos[4] = int(cb_Grenade_CI.GetExtra());
	}
	// End:0x471
	if(Item_Melee.items.Length > Item_Melee.Index)
	{
		Class'BallisticProV55.Mut_Outfitting'.default.LoadOut[0] = Item_Melee.items[Item_Melee.Index].Text;
		Class'BallisticProV55.Mut_Outfitting'.default.Layout[0] = cb_Melee_LI.GetIndex();
		Class'BallisticProV55.Mut_Outfitting'.default.Camo[0] = int(cb_Melee_CI.GetExtra());
	}
	// End:0x508
	if(Item_SideArm.items.Length > Item_SideArm.Index)
	{
		Class'BallisticProV55.Mut_Outfitting'.default.LoadOut[1] = Item_SideArm.items[Item_SideArm.Index].Text;
		Class'BallisticProV55.Mut_Outfitting'.default.Layout[1] = cb_SideArm_LI.GetIndex();
		Class'BallisticProV55.Mut_Outfitting'.default.Camo[1] = int(cb_SideArm_CI.GetExtra());
	}
	// End:0x5A2
	if(Item_Primary.items.Length > Item_Primary.Index)
	{
		Class'BallisticProV55.Mut_Outfitting'.default.LoadOut[2] = Item_Primary.items[Item_Primary.Index].Text;
		Class'BallisticProV55.Mut_Outfitting'.default.Layout[2] = cb_Primary_LI.GetIndex();
		Class'BallisticProV55.Mut_Outfitting'.default.Camo[2] = int(cb_Primary_CI.GetExtra());
	}
	// End:0x63C
	if(Item_Secondary.items.Length > Item_Secondary.Index)
	{
		Class'BallisticProV55.Mut_Outfitting'.default.LoadOut[3] = Item_Secondary.items[Item_Secondary.Index].Text;
		Class'BallisticProV55.Mut_Outfitting'.default.Layout[3] = cb_Secondary_LI.GetIndex();
		Class'BallisticProV55.Mut_Outfitting'.default.Camo[3] = int(cb_Secondary_CI.GetExtra());
	}
	// End:0x6D6
	if(Item_Grenade.items.Length > Item_Grenade.Index)
	{
		Class'BallisticProV55.Mut_Outfitting'.default.LoadOut[4] = Item_Grenade.items[Item_Grenade.Index].Text;
		Class'BallisticProV55.Mut_Outfitting'.default.Layout[4] = cb_Grenade_LI.GetIndex();
		Class'BallisticProV55.Mut_Outfitting'.default.Camo[4] = int(cb_Grenade_CI.GetExtra());
	}
	CurrentIndex = cb_Presets.GetIndex();
	SaveConfig();
	Class'BallisticProV55.Mut_Outfitting'.static.StaticSaveConfig();
	//return;	
}

function InternalOnChange(GUIComponent Sender)
{
	// End:0x23
	if((COI == none) || !COI.bWeaponsReady)
	{
		return;
	}
	// End:0x96
	if(Sender == cb_Melee)
	{
		Item_Melee.SetItem(cb_Melee.GetExtra());
		LoadLayouts(0, Item_Melee.Index, cb_Melee_LI);
		LoadCamos(0, cb_Melee_LI.GetIndex(), Item_Melee.Index, cb_Melee_CI);		
	}
	else
	{
		// End:0x109
		if(Sender == cb_SideArm)
		{
			Item_SideArm.SetItem(cb_SideArm.GetExtra());
			LoadLayouts(1, Item_SideArm.Index, cb_SideArm_LI);
			LoadCamos(1, cb_SideArm_LI.GetIndex(), Item_SideArm.Index, cb_SideArm_CI);			
		}
		else
		{
			// End:0x198
			if(Sender == cb_Primary)
			{
				Item_Primary.SetItem(cb_Primary.GetExtra());
				LoadLayouts(2, int(sortedPrimaries[Item_Primary.Index].Index), cb_Primary_LI);
				LoadCamos(2, cb_Primary_LI.GetIndex(), int(sortedPrimaries[Item_Primary.Index].Index), cb_Primary_CI);				
			}
			else
			{
				// End:0x227
				if(Sender == cb_Secondary)
				{
					Item_Secondary.SetItem(cb_Secondary.GetExtra());
					LoadLayouts(3, int(sortedSecondaries[Item_Secondary.Index].Index), cb_Secondary_LI);
					LoadCamos(3, cb_Secondary_LI.GetIndex(), int(sortedSecondaries[Item_Secondary.Index].Index), cb_Secondary_CI);					
				}
				else
				{
					// End:0x29C
					if(Sender == cb_Grenade)
					{
						Item_Grenade.SetItem(cb_Grenade.GetExtra());
						LoadLayouts(4, Item_Grenade.Index, cb_Grenade_LI);
						LoadCamos(4, cb_Grenade_LI.GetIndex(), Item_Grenade.Index, cb_Grenade_CI);						
					}
					else
					{
						// End:0x5CE
						if((Sender == cb_Presets) && cb_Presets.GetExtra() != "")
						{
							Item_Melee.SetItem(SavedLoadouts[cb_Presets.GetIndex()].Weapons[0]);
							LoadLayouts(0, Item_Melee.Index, cb_Melee_LI);
							cb_Melee_LI.SetIndex(SavedLoadouts[CurrentIndex].Layouts[0]);
							LoadCamos(0, cb_Melee_LI.GetIndex(), Item_Melee.Index, cb_Melee_CI);
							Item_SideArm.SetItem(SavedLoadouts[cb_Presets.GetIndex()].Weapons[1]);
							LoadLayouts(1, Item_SideArm.Index, cb_SideArm_LI);
							cb_SideArm_LI.SetIndex(SavedLoadouts[CurrentIndex].Layouts[1]);
							LoadCamos(1, cb_SideArm_LI.GetIndex(), Item_SideArm.Index, cb_SideArm_CI);
							Item_Primary.SetItem(SavedLoadouts[cb_Presets.GetIndex()].Weapons[2]);
							LoadLayouts(2, int(sortedPrimaries[Item_Primary.Index].Index), cb_Primary_LI);
							cb_Primary_LI.SetIndex(SavedLoadouts[CurrentIndex].Layouts[2]);
							LoadCamos(2, cb_Primary_LI.GetIndex(), int(sortedPrimaries[Item_Primary.Index].Index), cb_Primary_CI);
							Item_Secondary.SetItem(SavedLoadouts[cb_Presets.GetIndex()].Weapons[3]);
							LoadLayouts(3, int(sortedSecondaries[Item_Secondary.Index].Index), cb_Secondary_LI);
							cb_Secondary_LI.SetIndex(SavedLoadouts[CurrentIndex].Layouts[3]);
							LoadCamos(3, cb_Secondary_LI.GetIndex(), int(sortedSecondaries[Item_Secondary.Index].Index), cb_Secondary_CI);
							Item_Grenade.SetItem(SavedLoadouts[cb_Presets.GetIndex()].Weapons[4]);
							LoadLayouts(4, Item_Grenade.Index, cb_Grenade_LI);
							cb_Grenade_LI.SetIndex(SavedLoadouts[CurrentIndex].Layouts[4]);
							LoadCamos(4, cb_Grenade_LI.GetIndex(), Item_Grenade.Index, cb_Grenade_CI);
						}
					}
				}
			}
		}
	}
	//return;	
}

function bool LoadLayouts(int GroupIndex, int Index, GUIComboBox LayoutComboBox)
{
	local byte GameStyleIndex;
	local int i;
	local Class<BallisticWeapon> BW;

	LayoutComboBox.Clear();
	BW = Class<BallisticWeapon>(DynamicLoadObject(COI.GetGroupItem(byte(GroupIndex), Index), Class'Core.Class'));
	// End:0x82
	if(BW == none)
	{
		Log("Error loading item for outfitting: " $ string(BW), 'Warning');
		return false;
	}
	GameStyleIndex = Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle;
	// End:0xE8
	if(BW.default.ParamsClasses.Length < int(GameStyleIndex))
	{
		Log("Error loading item for outfitting: " $ string(BW), 'Warning');
		return false;
	}
	i = 0;
	J0xEF:

	// End:0x1FB [Loop If]
	if(i < BW.default.ParamsClasses[int(GameStyleIndex)].default.Layouts.Length)
	{
		// End:0x1B4
		if(BW.default.ParamsClasses[int(GameStyleIndex)].default.Layouts[i].LayoutName == "")
		{
			// End:0x18F
			if(BW.default.ParamsClasses[int(GameStyleIndex)].default.Layouts.Length == 1)
			{
				LayoutComboBox.AddItem("Default");				
			}
			else
			{
				LayoutComboBox.AddItem("Layout: " $ string(i));
			}
			// [Explicit Continue]
			goto J0x1F1;
		}
		LayoutComboBox.AddItem(BW.default.ParamsClasses[int(GameStyleIndex)].default.Layouts[i].LayoutName);
		J0x1F1:

		i++;
		// [Loop Continue]
		goto J0xEF;
	}
	return true;
	//return;	
}

function bool LoadCamos(int GroupIndex, int LayoutIndex, int Index, GUIComboBox CamoComboBox)
{
	local byte GameStyleIndex;
	local int i;
	local array<int> AllowedCamos;
	local Class<BallisticWeapon> BW;

	// End:0x11
	if(LayoutIndex == -1)
	{
		return false;
	}
	CamoComboBox.Clear();
	GameStyleIndex = Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle;
	BW = Class<BallisticWeapon>(DynamicLoadObject(COI.GetGroupItem(byte(GroupIndex), Index), Class'Core.Class'));
	// End:0xA7
	if(BW == none)
	{
		Log("Error loading item for outfitting: " $ string(BW), 'Warning');
		return false;
	}
	// End:0xF9
	if(BW.default.ParamsClasses.Length < int(GameStyleIndex))
	{
		Log("Error loading item for outfitting: " $ string(BW), 'Warning');
		return false;
	}
	AllowedCamos = BW.default.ParamsClasses[int(GameStyleIndex)].default.Layouts[LayoutIndex].AllowedCamos;
	// End:0x2D4
	if(AllowedCamos.Length == 0)
	{
		i = 0;
		J0x140:

		// End:0x2AC [Loop If]
		if(i < BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos.Length)
		{
			// End:0x234
			if(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[i].CamoName == "")
			{
				// End:0x1E1
				if(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos.Length == 1)
				{
					CamoComboBox.AddItem("None",, "0");					
				}
				else
				{
					CamoComboBox.AddItem("Layout: " $ string(i),, string(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[i].Index));
				}
			}
			CamoComboBox.AddItem(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[i].CamoName,, string(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[i].Index));
			i++;
			// [Loop Continue]
			goto J0x140;
		}
		CamoComboBox.SetIndex(SavedLoadouts[CurrentIndex].Camos[GroupIndex]);		
	}
	else
	{
		i = 0;
		J0x2DB:

		// End:0x3D2 [Loop If]
		if(i < AllowedCamos.Length)
		{
			CamoComboBox.AddItem(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[AllowedCamos[i]].CamoName,, string(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[AllowedCamos[i]].Index));
			// End:0x3C8
			if(SavedLoadouts[CurrentIndex].Camos[GroupIndex] == BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[AllowedCamos[i]].Index)
			{
				CamoComboBox.SetIndex(i);
			}
			i++;
			// [Loop Continue]
			goto J0x2DB;
		}
	}
	// End:0x402
	if(CamoComboBox.ItemCount() == 0)
	{
		CamoComboBox.AddItem("None",, "255");
	}
	// End:0x472
	if(CamoComboBox.ItemCount() > 1)
	{
		CamoComboBox.AddItem("Random",, "255");
		// End:0x472
		if(SavedLoadouts[CurrentIndex].Camos[GroupIndex] == 255)
		{
			CamoComboBox.SetIndex(CamoComboBox.ItemCount() - 1);
		}
	}
	return true;
	//return;	
}

defaultproperties
{
	// Reference: GUILoadOutItem'BallisticProV55.BallisticOutfittingWeaponsTab.MeleeImage'
	begin object name="MeleeImage" class=BCoreProV55.GUILoadOutItem
		NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
		Caption="Gear"
		WinTop=0.0500000
		WinLeft=0.1000000
		WinWidth=0.2000000
		WinHeight=0.2000000
		OnRendered=MeleeImage.InternalOnDraw
		OnClick=MeleeImage.InternalOnClick
		OnRightClick=MeleeImage.InternalOnRightClick
	end object
	Item_Melee=MeleeImage
	// Reference: GUILoadOutItem'BallisticProV55.BallisticOutfittingWeaponsTab.SideArmImage'
	begin object name="SideArmImage" class=BCoreProV55.GUILoadOutItem
		NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
		Caption="Sidearm"
		WinTop=0.0500000
		WinLeft=0.4000000
		WinWidth=0.2000000
		WinHeight=0.2000000
		OnRendered=SideArmImage.InternalOnDraw
		OnClick=SideArmImage.InternalOnClick
		OnRightClick=SideArmImage.InternalOnRightClick
	end object
	Item_SideArm=SideArmImage
	// Reference: GUILoadOutItem'BallisticProV55.BallisticOutfittingWeaponsTab.PrimaryImage'
	begin object name="PrimaryImage" class=BCoreProV55.GUILoadOutItem
		NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
		Caption="Primary Weapon"
		WinTop=0.3500000
		WinLeft=0.2500000
		WinWidth=0.2000000
		WinHeight=0.2000000
		OnRendered=PrimaryImage.InternalOnDraw
		OnClick=PrimaryImage.InternalOnClick
		OnRightClick=PrimaryImage.InternalOnRightClick
	end object
	Item_Primary=PrimaryImage
	// Reference: GUILoadOutItem'BallisticProV55.BallisticOutfittingWeaponsTab.SecondaryImage'
	begin object name="SecondaryImage" class=BCoreProV55.GUILoadOutItem
		NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
		Caption="Secondary Weapon"
		WinTop=0.3500000
		WinLeft=0.5500000
		WinWidth=0.2000000
		WinHeight=0.2000000
		OnRendered=SecondaryImage.InternalOnDraw
		OnClick=SecondaryImage.InternalOnClick
		OnRightClick=SecondaryImage.InternalOnRightClick
	end object
	Item_Secondary=SecondaryImage
	// Reference: GUILoadOutItem'BallisticProV55.BallisticOutfittingWeaponsTab.GrenadeImage'
	begin object name="GrenadeImage" class=BCoreProV55.GUILoadOutItem
		NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
		Caption="Grenades"
		WinTop=0.0500000
		WinLeft=0.7000000
		WinWidth=0.2000000
		WinHeight=0.2000000
		OnRendered=GrenadeImage.InternalOnDraw
		OnClick=GrenadeImage.InternalOnClick
		OnRightClick=GrenadeImage.InternalOnRightClick
	end object
	Item_Grenade=GrenadeImage
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_MeleeComBox'
	begin object name="cb_MeleeComBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Quick list of gear."
		WinTop=0.2500000
		WinLeft=0.1021480
		WinWidth=0.1960940
		WinHeight=0.0400000
		TabOrder=0
		OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
		OnKeyEvent=cb_MeleeComBox.InternalOnKeyEvent
	end object
	cb_Melee=cb_MeleeComBox
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_SideArmBox'
	begin object name="cb_SideArmBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Quick list of sidearms."
		WinTop=0.2500000
		WinLeft=0.4029300
		WinWidth=0.1960940
		WinHeight=0.0400000
		TabOrder=0
		OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
		OnKeyEvent=cb_SideArmBox.InternalOnKeyEvent
	end object
	cb_SideArm=cb_SideArmBox
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_PrimaryComBox'
	begin object name="cb_PrimaryComBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Quick list of primary weapons."
		WinTop=0.5500000
		WinLeft=0.2515630
		WinWidth=0.1960940
		WinHeight=0.0400000
		TabOrder=0
		OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
		OnKeyEvent=cb_PrimaryComBox.InternalOnKeyEvent
	end object
	cb_Primary=cb_PrimaryComBox
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_SecondaryComBox'
	begin object name="cb_SecondaryComBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Quick list of secondary weapons."
		WinTop=0.5500000
		WinLeft=0.5509770
		WinWidth=0.1960940
		WinHeight=0.0400000
		TabOrder=0
		OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
		OnKeyEvent=cb_SecondaryComBox.InternalOnKeyEvent
	end object
	cb_Secondary=cb_SecondaryComBox
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_GrenadeComBox'
	begin object name="cb_GrenadeComBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Quick list of grenades and traps."
		WinTop=0.2500000
		WinLeft=0.7021480
		WinWidth=0.1960940
		WinHeight=0.0400000
		TabOrder=0
		OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
		OnKeyEvent=cb_GrenadeComBox.InternalOnKeyEvent
	end object
	cb_Grenade=cb_GrenadeComBox
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_MeleeComBox_LI'
	begin object name="cb_MeleeComBox_LI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Gear layouts."
		WinTop=0.2900000
		WinLeft=0.0921480
		WinWidth=0.1160940
		WinHeight=0.0350000
		TabOrder=0
		OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
		OnKeyEvent=cb_MeleeComBox_LI.InternalOnKeyEvent
	end object
	cb_Melee_LI=cb_MeleeComBox_LI
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_SideArmBox_LI'
	begin object name="cb_SideArmBox_LI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Sidearm layouts."
		WinTop=0.2900000
		WinLeft=0.3929300
		WinWidth=0.1160940
		WinHeight=0.0350000
		TabOrder=0
		OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
		OnKeyEvent=cb_SideArmBox_LI.InternalOnKeyEvent
	end object
	cb_SideArm_LI=cb_SideArmBox_LI
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_PrimaryComBox_LI'
	begin object name="cb_PrimaryComBox_LI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Primary Weapon layouts."
		WinTop=0.5900000
		WinLeft=0.2415630
		WinWidth=0.1160940
		WinHeight=0.0350000
		TabOrder=0
		OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
		OnKeyEvent=cb_PrimaryComBox_LI.InternalOnKeyEvent
	end object
	cb_Primary_LI=cb_PrimaryComBox_LI
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_SecondaryComBox_LI'
	begin object name="cb_SecondaryComBox_LI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Secondary weapon layouts."
		WinTop=0.5900000
		WinLeft=0.5409770
		WinWidth=0.1160940
		WinHeight=0.0350000
		TabOrder=0
		OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
		OnKeyEvent=cb_SecondaryComBox_LI.InternalOnKeyEvent
	end object
	cb_Secondary_LI=cb_SecondaryComBox_LI
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_GrenadeComBox_LI'
	begin object name="cb_GrenadeComBox_LI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Grenade layouts."
		WinTop=0.2900000
		WinLeft=0.6921480
		WinWidth=0.1160940
		WinHeight=0.0350000
		TabOrder=0
		OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
		OnKeyEvent=cb_GrenadeComBox_LI.InternalOnKeyEvent
	end object
	cb_Grenade_LI=cb_GrenadeComBox_LI
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_MeleeComBox_CI'
	begin object name="cb_MeleeComBox_CI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Gear camos."
		WinTop=0.2900000
		WinLeft=0.2121480
		WinWidth=0.1160940
		WinHeight=0.0350000
		TabOrder=0
		OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
		OnKeyEvent=cb_MeleeComBox_CI.InternalOnKeyEvent
	end object
	cb_Melee_CI=cb_MeleeComBox_CI
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_SideArmBox_CI'
	begin object name="cb_SideArmBox_CI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Sidearm camos."
		WinTop=0.2900000
		WinLeft=0.5129300
		WinWidth=0.1160940
		WinHeight=0.0350000
		TabOrder=0
		OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
		OnKeyEvent=cb_SideArmBox_CI.InternalOnKeyEvent
	end object
	cb_SideArm_CI=cb_SideArmBox_CI
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_PrimaryComBox_CI'
	begin object name="cb_PrimaryComBox_CI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Primary Weapon camos."
		WinTop=0.5900000
		WinLeft=0.3615630
		WinWidth=0.1160940
		WinHeight=0.0350000
		TabOrder=0
		OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
		OnKeyEvent=cb_PrimaryComBox_CI.InternalOnKeyEvent
	end object
	cb_Primary_CI=cb_PrimaryComBox_CI
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_SecondaryComBox_CI'
	begin object name="cb_SecondaryComBox_CI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Secondary weapon camos."
		WinTop=0.5900000
		WinLeft=0.6609770
		WinWidth=0.1160940
		WinHeight=0.0350000
		TabOrder=0
		OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
		OnKeyEvent=cb_SecondaryComBox_CI.InternalOnKeyEvent
	end object
	cb_Secondary_CI=cb_SecondaryComBox_CI
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_GrenadeComBox_CI'
	begin object name="cb_GrenadeComBox_CI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Grenade layouts."
		WinTop=0.2900000
		WinLeft=0.8121480
		WinWidth=0.1160940
		WinHeight=0.0350000
		TabOrder=0
		OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
		OnKeyEvent=cb_GrenadeComBox_CI.InternalOnKeyEvent
	end object
	cb_Grenade_CI=cb_GrenadeComBox_CI
	// Reference: moComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.co_PresetsCB'
	begin object name="co_PresetsCB" class=XInterface.moComboBox
		ComponentJustification=0
		CaptionWidth=0.4000000
		Caption="Presets"
		OnCreateComponent=co_PresetsCB.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Choose a preset replacements configuration, or type a new preset name here and click 'Save' to make the current configuration a new preset."
		WinTop=0.6400000
		WinLeft=0.6300000
		WinWidth=0.2500000
		OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
	end object
	cb_Presets=co_PresetsCB
	// Reference: GUIImage'BallisticProV55.BallisticOutfittingWeaponsTab.ImageBoxMelee'
	begin object name="ImageBoxMelee" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.ScrollGripWatched'
		ImageStyle=1
		WinTop=0.0300000
		WinLeft=0.0875000
		WinWidth=0.2250000
		WinHeight=0.2400000
		RenderWeight=0.0020000
	end object
	Box_Melee=ImageBoxMelee
	// Reference: GUIImage'BallisticProV55.BallisticOutfittingWeaponsTab.ImageBoxSideArm'
	begin object name="ImageBoxSideArm" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.ScrollGripWatched'
		ImageStyle=1
		WinTop=0.0300000
		WinLeft=0.3875000
		WinWidth=0.2250000
		WinHeight=0.2400000
		RenderWeight=0.0020000
	end object
	Box_SideArm=ImageBoxSideArm
	// Reference: GUIImage'BallisticProV55.BallisticOutfittingWeaponsTab.ImageBoxPrimary'
	begin object name="ImageBoxPrimary" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.ScrollGripWatched'
		ImageStyle=1
		WinTop=0.3375000
		WinLeft=0.2375000
		WinWidth=0.2250000
		WinHeight=0.2400000
		RenderWeight=0.0020000
	end object
	Box_Primary=ImageBoxPrimary
	// Reference: GUIImage'BallisticProV55.BallisticOutfittingWeaponsTab.ImageBoxSecondary'
	begin object name="ImageBoxSecondary" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.ScrollGripWatched'
		ImageStyle=1
		WinTop=0.3375000
		WinLeft=0.5375000
		WinWidth=0.2250000
		WinHeight=0.2400000
		RenderWeight=0.0020000
	end object
	Box_Secondary=ImageBoxSecondary
	// Reference: GUIImage'BallisticProV55.BallisticOutfittingWeaponsTab.ImageBoxGrenade'
	begin object name="ImageBoxGrenade" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.ScrollGripWatched'
		ImageStyle=1
		WinTop=0.0300000
		WinLeft=0.6875000
		WinWidth=0.2250000
		WinHeight=0.2400000
		RenderWeight=0.0020000
	end object
	Box_Grenade=ImageBoxGrenade
	// Reference: GUIButton'BallisticProV55.BallisticOutfittingWeaponsTab.BSavePresetButton'
	begin object name="BSavePresetButton" class=XInterface.GUIButton
		Caption="SAVE"
		Hint="Saves the current configuration as a new preset."
		WinTop=0.6400000
		WinLeft=0.1155000
		WinWidth=0.2570000
		WinHeight=0.0650000
		TabOrder=0
		OnClick=BallisticOutfittingWeaponsTab.InternalOnClick
		OnKeyEvent=BSavePresetButton.InternalOnKeyEvent
	end object
	BSavePreset=BSavePresetButton
	// Reference: GUILabel'BallisticProV55.BallisticOutfittingWeaponsTab.l_Receivinglabel'
	begin object name="l_Receivinglabel" class=XInterface.GUILabel
		TextAlign=1
		TextColor=(R=255,G=255,B=0,A=255)
		FontScale=2
		WinTop=0.0870000
		WinLeft=0.0500000
		WinWidth=0.9000000
		WinHeight=0.0400000
	end object
	l_Receiving=l_Receivinglabel
	SavedLoadouts[0]=(PresetName="DEFAULT",Weapons="BallisticProV55.A909SkrithBlades",Weapons[1]="BallisticProV55.A42SkrithPistol",Weapons[2]="BallisticProV55.A73SkrithRifle",Weapons[3]="BallisticProV55.A73SkrithRifle",Weapons[4]="BallisticProV55.NRP57Grenade",Layouts[4]=0,Layouts[1]=0,Layouts[2]=0,Layouts[3]=0,Layouts[4]=0,Camos[4]=0,Camos[1]=0,Camos[2]=0,Camos[3]=0,Camos[4]=0)
	SavedLoadouts[1]=(PresetName="DEFAULT2",Weapons="BallisticProV55.A909SkrithBlades",Weapons[1]="BallisticProV55.A42SkrithPistol",Weapons[2]="BallisticProV55.A73SkrithRifle",Weapons[3]="BallisticProV55.A73SkrithRifle",Weapons[4]="BallisticProV55.NRP57Grenade",Layouts[4]=0,Layouts[1]=0,Layouts[2]=0,Layouts[3]=0,Layouts[4]=0,Camos[4]=0,Camos[1]=0,Camos[2]=0,Camos[3]=0,Camos[4]=0)
	SavedLoadouts[2]=(PresetName="DEFAULT3",Weapons="BallisticProV55.A909SkrithBlades",Weapons[1]="BallisticProV55.A42SkrithPistol",Weapons[2]="BallisticProV55.A73SkrithRifle",Weapons[3]="BallisticProV55.A73SkrithRifle",Weapons[4]="BallisticProV55.NRP57Grenade",Layouts[4]=0,Layouts[1]=0,Layouts[2]=0,Layouts[3]=0,Layouts[4]=0,Camos[4]=0,Camos[1]=0,Camos[2]=0,Camos[3]=0,Camos[4]=0)
	SavedLoadouts[3]=(PresetName="DEFAULT4",Weapons="BallisticProV55.A909SkrithBlades",Weapons[1]="BallisticProV55.A42SkrithPistol",Weapons[2]="BallisticProV55.A73SkrithRifle",Weapons[3]="BallisticProV55.A73SkrithRifle",Weapons[4]="BallisticProV55.NRP57Grenade",Layouts[4]=0,Layouts[1]=0,Layouts[2]=0,Layouts[3]=0,Layouts[4]=0,Camos[4]=0,Camos[1]=0,Camos[2]=0,Camos[3]=0,Camos[4]=0)
	SavedLoadouts[4]=(PresetName="DEFAULT5",Weapons="BallisticProV55.A909SkrithBlades",Weapons[1]="BallisticProV55.A42SkrithPistol",Weapons[2]="BallisticProV55.A73SkrithRifle",Weapons[3]="BallisticProV55.A73SkrithRifle",Weapons[4]="BallisticProV55.NRP57Grenade",Layouts[4]=0,Layouts[1]=0,Layouts[2]=0,Layouts[3]=0,Layouts[4]=0,Camos[4]=0,Camos[1]=0,Camos[2]=0,Camos[3]=0,Camos[4]=0)
	QuickListText="QuickList"
	ReceivingText[0]="Receiving..."
	ReceivingText[1]="Loading..."
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: GUILoadOutItem'BallisticProV55.BallisticOutfittingWeaponsTab.MeleeImage'
begin object name="MeleeImage" class=BCoreProV55.GUILoadOutItem
	NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
	Caption="Gear"
	WinTop=0.0500000
	WinLeft=0.1000000
	WinWidth=0.2000000
	WinHeight=0.2000000
	OnRendered=MeleeImage.InternalOnDraw
	OnClick=MeleeImage.InternalOnClick
	OnRightClick=MeleeImage.InternalOnRightClick
end object
// Reference: GUILoadOutItem'BallisticProV55.BallisticOutfittingWeaponsTab.SideArmImage'
begin object name="SideArmImage" class=BCoreProV55.GUILoadOutItem
	NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
	Caption="Sidearm"
	WinTop=0.0500000
	WinLeft=0.4000000
	WinWidth=0.2000000
	WinHeight=0.2000000
	OnRendered=SideArmImage.InternalOnDraw
	OnClick=SideArmImage.InternalOnClick
	OnRightClick=SideArmImage.InternalOnRightClick
end object
// Reference: GUILoadOutItem'BallisticProV55.BallisticOutfittingWeaponsTab.PrimaryImage'
begin object name="PrimaryImage" class=BCoreProV55.GUILoadOutItem
	NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
	Caption="Primary Weapon"
	WinTop=0.3500000
	WinLeft=0.2500000
	WinWidth=0.2000000
	WinHeight=0.2000000
	OnRendered=PrimaryImage.InternalOnDraw
	OnClick=PrimaryImage.InternalOnClick
	OnRightClick=PrimaryImage.InternalOnRightClick
end object
// Reference: GUILoadOutItem'BallisticProV55.BallisticOutfittingWeaponsTab.SecondaryImage'
begin object name="SecondaryImage" class=BCoreProV55.GUILoadOutItem
	NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
	Caption="Secondary Weapon"
	WinTop=0.3500000
	WinLeft=0.5500000
	WinWidth=0.2000000
	WinHeight=0.2000000
	OnRendered=SecondaryImage.InternalOnDraw
	OnClick=SecondaryImage.InternalOnClick
	OnRightClick=SecondaryImage.InternalOnRightClick
end object
// Reference: GUILoadOutItem'BallisticProV55.BallisticOutfittingWeaponsTab.GrenadeImage'
begin object name="GrenadeImage" class=BCoreProV55.GUILoadOutItem
	NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
	Caption="Grenades"
	WinTop=0.0500000
	WinLeft=0.7000000
	WinWidth=0.2000000
	WinHeight=0.2000000
	OnRendered=GrenadeImage.InternalOnDraw
	OnClick=GrenadeImage.InternalOnClick
	OnRightClick=GrenadeImage.InternalOnRightClick
end object
// Reference: GUIButton'BallisticProV55.BallisticOutfittingWeaponsTab.BSavePresetButton'
begin object name="BSavePresetButton" class=XInterface.GUIButton
	Caption="SAVE"
	Hint="Saves the current configuration as a new preset."
	WinTop=0.6400000
	WinLeft=0.1155000
	WinWidth=0.2570000
	WinHeight=0.0650000
	TabOrder=0
	OnClick=BallisticOutfittingWeaponsTab.InternalOnClick
	OnKeyEvent=BSavePresetButton.InternalOnKeyEvent
end object
// Reference: moComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.co_PresetsCB'
begin object name="co_PresetsCB" class=XInterface.moComboBox
	ComponentJustification=0
	CaptionWidth=0.4000000
	Caption="Presets"
	OnCreateComponent=co_PresetsCB.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Choose a preset replacements configuration, or type a new preset name here and click 'Save' to make the current configuration a new preset."
	WinTop=0.6400000
	WinLeft=0.6300000
	WinWidth=0.2500000
	OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_GrenadeComBox_CI'
begin object name="cb_GrenadeComBox_CI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Grenade layouts."
	WinTop=0.2900000
	WinLeft=0.8121480
	WinWidth=0.1160940
	WinHeight=0.0350000
	TabOrder=0
	OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
	OnKeyEvent=cb_GrenadeComBox_CI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_GrenadeComBox_LI'
begin object name="cb_GrenadeComBox_LI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Grenade layouts."
	WinTop=0.2900000
	WinLeft=0.6921480
	WinWidth=0.1160940
	WinHeight=0.0350000
	TabOrder=0
	OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
	OnKeyEvent=cb_GrenadeComBox_LI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_GrenadeComBox'
begin object name="cb_GrenadeComBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Quick list of grenades and traps."
	WinTop=0.2500000
	WinLeft=0.7021480
	WinWidth=0.1960940
	WinHeight=0.0400000
	TabOrder=0
	OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
	OnKeyEvent=cb_GrenadeComBox.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_SecondaryComBox_CI'
begin object name="cb_SecondaryComBox_CI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Secondary weapon camos."
	WinTop=0.5900000
	WinLeft=0.6609770
	WinWidth=0.1160940
	WinHeight=0.0350000
	TabOrder=0
	OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
	OnKeyEvent=cb_SecondaryComBox_CI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_SecondaryComBox_LI'
begin object name="cb_SecondaryComBox_LI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Secondary weapon layouts."
	WinTop=0.5900000
	WinLeft=0.5409770
	WinWidth=0.1160940
	WinHeight=0.0350000
	TabOrder=0
	OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
	OnKeyEvent=cb_SecondaryComBox_LI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_SecondaryComBox'
begin object name="cb_SecondaryComBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Quick list of secondary weapons."
	WinTop=0.5500000
	WinLeft=0.5509770
	WinWidth=0.1960940
	WinHeight=0.0400000
	TabOrder=0
	OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
	OnKeyEvent=cb_SecondaryComBox.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_PrimaryComBox_CI'
begin object name="cb_PrimaryComBox_CI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Primary Weapon camos."
	WinTop=0.5900000
	WinLeft=0.3615630
	WinWidth=0.1160940
	WinHeight=0.0350000
	TabOrder=0
	OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
	OnKeyEvent=cb_PrimaryComBox_CI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_PrimaryComBox_LI'
begin object name="cb_PrimaryComBox_LI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Primary Weapon layouts."
	WinTop=0.5900000
	WinLeft=0.2415630
	WinWidth=0.1160940
	WinHeight=0.0350000
	TabOrder=0
	OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
	OnKeyEvent=cb_PrimaryComBox_LI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_PrimaryComBox'
begin object name="cb_PrimaryComBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Quick list of primary weapons."
	WinTop=0.5500000
	WinLeft=0.2515630
	WinWidth=0.1960940
	WinHeight=0.0400000
	TabOrder=0
	OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
	OnKeyEvent=cb_PrimaryComBox.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_SideArmBox_CI'
begin object name="cb_SideArmBox_CI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Sidearm camos."
	WinTop=0.2900000
	WinLeft=0.5129300
	WinWidth=0.1160940
	WinHeight=0.0350000
	TabOrder=0
	OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
	OnKeyEvent=cb_SideArmBox_CI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_SideArmBox_LI'
begin object name="cb_SideArmBox_LI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Sidearm layouts."
	WinTop=0.2900000
	WinLeft=0.3929300
	WinWidth=0.1160940
	WinHeight=0.0350000
	TabOrder=0
	OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
	OnKeyEvent=cb_SideArmBox_LI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_SideArmBox'
begin object name="cb_SideArmBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Quick list of sidearms."
	WinTop=0.2500000
	WinLeft=0.4029300
	WinWidth=0.1960940
	WinHeight=0.0400000
	TabOrder=0
	OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
	OnKeyEvent=cb_SideArmBox.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_MeleeComBox_CI'
begin object name="cb_MeleeComBox_CI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Gear camos."
	WinTop=0.2900000
	WinLeft=0.2121480
	WinWidth=0.1160940
	WinHeight=0.0350000
	TabOrder=0
	OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
	OnKeyEvent=cb_MeleeComBox_CI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_MeleeComBox_LI'
begin object name="cb_MeleeComBox_LI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Gear layouts."
	WinTop=0.2900000
	WinLeft=0.0921480
	WinWidth=0.1160940
	WinHeight=0.0350000
	TabOrder=0
	OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
	OnKeyEvent=cb_MeleeComBox_LI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponsTab.cb_MeleeComBox'
begin object name="cb_MeleeComBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Quick list of gear."
	WinTop=0.2500000
	WinLeft=0.1021480
	WinWidth=0.1960940
	WinHeight=0.0400000
	TabOrder=0
	OnChange=BallisticOutfittingWeaponsTab.InternalOnChange
	OnKeyEvent=cb_MeleeComBox.InternalOnKeyEvent
end object
// Reference: GUIImage'BallisticProV55.BallisticOutfittingWeaponsTab.ImageBoxMelee'
begin object name="ImageBoxMelee" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.ScrollGripWatched'
	ImageStyle=1
	WinTop=0.0300000
	WinLeft=0.0875000
	WinWidth=0.2250000
	WinHeight=0.2400000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticOutfittingWeaponsTab.ImageBoxSideArm'
begin object name="ImageBoxSideArm" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.ScrollGripWatched'
	ImageStyle=1
	WinTop=0.0300000
	WinLeft=0.3875000
	WinWidth=0.2250000
	WinHeight=0.2400000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticOutfittingWeaponsTab.ImageBoxPrimary'
begin object name="ImageBoxPrimary" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.ScrollGripWatched'
	ImageStyle=1
	WinTop=0.3375000
	WinLeft=0.2375000
	WinWidth=0.2250000
	WinHeight=0.2400000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticOutfittingWeaponsTab.ImageBoxSecondary'
begin object name="ImageBoxSecondary" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.ScrollGripWatched'
	ImageStyle=1
	WinTop=0.3375000
	WinLeft=0.5375000
	WinWidth=0.2250000
	WinHeight=0.2400000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticOutfittingWeaponsTab.ImageBoxGrenade'
begin object name="ImageBoxGrenade" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.ScrollGripWatched'
	ImageStyle=1
	WinTop=0.0300000
	WinLeft=0.6875000
	WinWidth=0.2250000
	WinHeight=0.2400000
	RenderWeight=0.0020000
end object
// Reference: GUILabel'BallisticProV55.BallisticOutfittingWeaponsTab.l_Receivinglabel'
begin object name="l_Receivinglabel" class=XInterface.GUILabel
	TextAlign=1
	TextColor=(R=255,G=255,B=0,A=255)
	FontScale=2
	WinTop=0.0870000
	WinLeft=0.0500000
	WinWidth=0.9000000
	WinHeight=0.0400000
end object
