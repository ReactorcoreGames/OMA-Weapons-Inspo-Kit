class BallisticOutfittingMenu extends UT2K4GUIPage
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

var() automated GUIImage MyBack;
var() automated GUIHeader MyHeader;
var() automated GUIImage Box_Melee;
var() automated GUIImage Box_SideArm;
var() automated GUIImage Box_Primary;
var() automated GUIImage Box_Secondary;
var() automated GUIImage Box_Grenade;
var() automated GUILoadOutItem Item_Melee;
var() automated GUILoadOutItem Item_SideArm;
var() automated GUILoadOutItem Item_Primary;
var() automated GUILoadOutItem Item_Secondary;
var() automated GUILoadOutItem Item_Grenade;
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
var() automated GUIButton bDone;
var() automated GUIButton bCancel;
var() automated GUIButton BSavePreset;
var() automated moComboBox cb_Presets;
var() automated GUILabel l_Receiving;
var int ActiveIndex;
var bool bWeaponsLoaded;
var config LoadoutWeapons SavedLoadouts[5];
var config int CurrentIndex;
var config bool bInitialized;
var int NumPresets;
var() localized string QuickListText;
var localized string ReceivingText[2];
var ClientOutfittingInterface COI;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	local int i;

	super(GUIPage).InitComponent(MyController, MyOwner);
	// End:0xB8
	if(!bInitialized)
	{
		i = 0;
		J0x22:

		// End:0xAD [Loop If]
		if(i < 5)
		{
			SavedLoadouts[0].Weapons[i] = Class'BallisticProV55.Mut_Outfitting'.default.LoadOut[i];
			SavedLoadouts[0].Layouts[i] = Class'BallisticProV55.Mut_Outfitting'.default.Layout[i];
			SavedLoadouts[0].Camos[i] = Class'BallisticProV55.Mut_Outfitting'.default.Camo[i];
			i++;
			// [Loop Continue]
			goto J0x22;
		}
		bInitialized = true;
		SaveConfig();
	}
	// End:0x154
	if(!bWeaponsLoaded)
	{
		// End:0x146
		if((COI == none) || COI.bWeaponsReady)
		{
			// End:0x124
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
	}
	//return;	
}

function SetupCOI(ClientOutfittingInterface newCOI)
{
	COI = newCOI;
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

	i = 0;
	J0x07:

	// End:0xFA [Loop If]
	if(i < COI.GroupLength(0))
	{
		// End:0xF0
		if(GetItemInfo(0, i, ic, IMat, ICN, ICrds))
		{
			Item_Melee.AddItem(ic, IMat, ICN, ICrds);
			Item_Melee.SetItem(SavedLoadouts[CurrentIndex].Weapons[0]);
			LoadLayouts(0, Item_Melee.Index, cb_Melee_LI, SavedLoadouts[CurrentIndex].Layouts[0]);
			LoadCamos(0, cb_Melee_LI.GetIndex(), Item_Melee.Index, cb_Melee_CI, SavedLoadouts[CurrentIndex].Camos[0]);
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0x101:

	// End:0x1F4 [Loop If]
	if(i < COI.GroupLength(1))
	{
		// End:0x1EA
		if(GetItemInfo(1, i, ic, IMat, ICN, ICrds))
		{
			Item_SideArm.AddItem(ic, IMat, ICN, ICrds);
			Item_SideArm.SetItem(SavedLoadouts[CurrentIndex].Weapons[1]);
			LoadLayouts(1, Item_SideArm.Index, cb_SideArm_LI, SavedLoadouts[CurrentIndex].Layouts[1]);
			LoadCamos(1, cb_SideArm_LI.GetIndex(), Item_SideArm.Index, cb_SideArm_CI, SavedLoadouts[CurrentIndex].Camos[1]);
		}
		i++;
		// [Loop Continue]
		goto J0x101;
	}
	i = 0;
	J0x1FB:

	// End:0x2F4 [Loop If]
	if(i < COI.GroupLength(2))
	{
		// End:0x2EA
		if(GetItemInfo(2, i, ic, IMat, ICN, ICrds))
		{
			Item_Primary.AddItem(ic, IMat, ICN, ICrds);
			Item_Primary.SetItem(SavedLoadouts[CurrentIndex].Weapons[2]);
			LoadLayouts(2, Item_Primary.Index, cb_Primary_LI, SavedLoadouts[CurrentIndex].Layouts[2]);
			LoadCamos(2, cb_Primary_LI.GetIndex(), Item_Primary.Index, cb_Primary_CI, SavedLoadouts[CurrentIndex].Camos[2]);
		}
		i++;
		// [Loop Continue]
		goto J0x1FB;
	}
	i = 0;
	J0x2FB:

	// End:0x3F4 [Loop If]
	if(i < COI.GroupLength(3))
	{
		// End:0x3EA
		if(GetItemInfo(3, i, ic, IMat, ICN, ICrds))
		{
			Item_Secondary.AddItem(ic, IMat, ICN, ICrds);
			Item_Secondary.SetItem(SavedLoadouts[CurrentIndex].Weapons[3]);
			LoadLayouts(3, Item_Secondary.Index, cb_Secondary_LI, SavedLoadouts[CurrentIndex].Layouts[3]);
			LoadCamos(3, cb_Secondary_LI.GetIndex(), Item_Secondary.Index, cb_Secondary_CI, SavedLoadouts[CurrentIndex].Camos[3]);
		}
		i++;
		// [Loop Continue]
		goto J0x2FB;
	}
	i = 0;
	J0x3FB:

	// End:0x4F4 [Loop If]
	if(i < COI.GroupLength(4))
	{
		// End:0x4EA
		if(GetItemInfo(4, i, ic, IMat, ICN, ICrds))
		{
			Item_Grenade.AddItem(ic, IMat, ICN, ICrds);
			Item_Grenade.SetItem(SavedLoadouts[CurrentIndex].Weapons[4]);
			LoadLayouts(4, Item_Grenade.Index, cb_Grenade_LI, SavedLoadouts[CurrentIndex].Layouts[4]);
			LoadCamos(4, cb_Grenade_LI.GetIndex(), Item_Grenade.Index, cb_Grenade_CI, SavedLoadouts[CurrentIndex].Camos[4]);
		}
		i++;
		// [Loop Continue]
		goto J0x3FB;
	}
	i = 0;
	J0x4FB:

	// End:0x538 [Loop If]
	if(i < 5)
	{
		cb_Presets.AddItem(SavedLoadouts[i].PresetName,, string(i));
		i++;
		// [Loop Continue]
		goto J0x4FB;
	}
	cb_Presets.SetIndex(CurrentIndex);
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

function bool LoadLayouts(int GroupIndex, int Index, GUIComboBox LayoutComboBox, optional int LayoutIndex)
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
	// End:0x228
	if(LayoutIndex < LayoutComboBox.ItemCount())
	{
		LayoutComboBox.SetIndex(LayoutIndex);
	}
	return true;
	//return;	
}

function bool LoadCamos(int GroupIndex, int LayoutIndex, int Index, GUIComboBox CamoComboBox, optional int CamoIndex)
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
	// End:0x2DC
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
		// End:0x2D9
		if(CamoIndex < CamoComboBox.ItemCount())
		{
			CamoComboBox.SetIndex(CamoIndex);
		}		
	}
	else
	{
		i = 0;
		J0x2E3:

		// End:0x3C9 [Loop If]
		if(i < AllowedCamos.Length)
		{
			CamoComboBox.AddItem(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[AllowedCamos[i]].CamoName,, string(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[AllowedCamos[i]].Index));
			// End:0x3BF
			if(CamoIndex == BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[AllowedCamos[i]].Index)
			{
				CamoComboBox.SetIndex(i);
			}
			i++;
			// [Loop Continue]
			goto J0x2E3;
		}
	}
	// End:0x3F9
	if(CamoComboBox.ItemCount() == 0)
	{
		CamoComboBox.AddItem("None",, "255");
	}
	// End:0x46E
	if((CamoComboBox.ItemCount() > 1) && !Class'BCoreProV55.BallisticReplicationInfo'.default.bNoRandomCamo)
	{
		CamoComboBox.AddItem("Random",, "255");
		// End:0x46E
		if(CamoIndex == 255)
		{
			CamoComboBox.SetIndex(CamoComboBox.ItemCount() - 1);
		}
	}
	return true;
	//return;	
}

function SaveSettings()
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
	// End:0x700
	if(cb_Presets.GetIndex() >= 0)
	{
		CurrentIndex = cb_Presets.GetIndex();
	}
	SaveConfig();
	Class'BallisticProV55.Mut_Outfitting'.static.StaticSaveConfig();
	//return;	
}

function WeaponSelectClosed(optional bool bCancelled)
{
	local string str;
	local array<string> loadoutData;

	// End:0x0B
	if(bCancelled)
	{
		return;
	}
	str = Controller.ActivePage.GetDataString();
	Split(str, "|", loadoutData);
	switch(ActiveIndex)
	{
		// End:0xB2
		case 0:
			Item_Melee.SetItem(loadoutData[0]);
			LoadLayouts(0, Item_Melee.Index, cb_Melee_LI, int(loadoutData[1]));
			LoadCamos(0, cb_Melee_LI.GetIndex(), Item_Melee.Index, cb_Melee_CI, int(loadoutData[2]));
			// End:0x28A
			break;
		// End:0x125
		case 1:
			Item_SideArm.SetItem(loadoutData[0]);
			LoadLayouts(1, Item_SideArm.Index, cb_SideArm_LI, int(loadoutData[1]));
			LoadCamos(1, cb_SideArm_LI.GetIndex(), Item_SideArm.Index, cb_SideArm_CI, int(loadoutData[2]));
			// End:0x28A
			break;
		// End:0x19B
		case 2:
			Item_Primary.SetItem(loadoutData[0]);
			LoadLayouts(2, Item_Primary.Index, cb_Primary_LI, int(loadoutData[1]));
			LoadCamos(2, cb_Primary_LI.GetIndex(), Item_Primary.Index, cb_Primary_CI, int(loadoutData[2]));
			// End:0x28A
			break;
		// End:0x211
		case 3:
			Item_Secondary.SetItem(loadoutData[0]);
			LoadLayouts(3, Item_Secondary.Index, cb_Secondary_LI, int(loadoutData[1]));
			LoadCamos(3, cb_Secondary_LI.GetIndex(), Item_Secondary.Index, cb_Secondary_CI, int(loadoutData[2]));
			// End:0x28A
			break;
		// End:0x287
		case 4:
			Item_Grenade.SetItem(loadoutData[0]);
			LoadLayouts(4, Item_Grenade.Index, cb_Grenade_LI, int(loadoutData[1]));
			LoadCamos(4, cb_Grenade_LI.GetIndex(), Item_Grenade.Index, cb_Grenade_CI, int(loadoutData[2]));
			// End:0x28A
			break;
		// End:0xFFFF
		default:
			break;
	}
	//return;	
}

function InternalOnChange(GUIComponent Sender)
{
	// End:0x23
	if((COI == none) || !COI.bWeaponsReady)
	{
		return;
	}
	// End:0x39A
	if((Sender == cb_Presets) && cb_Presets.GetExtra() != "")
	{
		Item_Melee.SetItem(SavedLoadouts[cb_Presets.GetIndex()].Weapons[0]);
		LoadLayouts(0, Item_Melee.Index, cb_Melee_LI, SavedLoadouts[cb_Presets.GetIndex()].Layouts[0]);
		LoadCamos(0, cb_Melee_LI.GetIndex(), Item_Melee.Index, cb_Melee_CI, SavedLoadouts[cb_Presets.GetIndex()].Camos[0]);
		Item_SideArm.SetItem(SavedLoadouts[cb_Presets.GetIndex()].Weapons[1]);
		LoadLayouts(1, Item_SideArm.Index, cb_SideArm_LI, SavedLoadouts[cb_Presets.GetIndex()].Layouts[1]);
		LoadCamos(1, cb_SideArm_LI.GetIndex(), Item_SideArm.Index, cb_SideArm_CI, SavedLoadouts[cb_Presets.GetIndex()].Camos[1]);
		Item_Primary.SetItem(SavedLoadouts[cb_Presets.GetIndex()].Weapons[2]);
		LoadLayouts(2, Item_Primary.Index, cb_Primary_LI, SavedLoadouts[cb_Presets.GetIndex()].Layouts[2]);
		LoadCamos(2, cb_Primary_LI.GetIndex(), Item_Primary.Index, cb_Primary_CI, SavedLoadouts[cb_Presets.GetIndex()].Camos[2]);
		Item_Secondary.SetItem(SavedLoadouts[cb_Presets.GetIndex()].Weapons[3]);
		LoadLayouts(3, Item_Secondary.Index, cb_Secondary_LI, SavedLoadouts[cb_Presets.GetIndex()].Layouts[3]);
		LoadCamos(3, cb_Secondary_LI.GetIndex(), Item_Secondary.Index, cb_Secondary_CI, SavedLoadouts[cb_Presets.GetIndex()].Camos[3]);
		Item_Grenade.SetItem(SavedLoadouts[cb_Presets.GetIndex()].Weapons[4]);
		LoadLayouts(4, Item_Grenade.Index, cb_Grenade_LI, SavedLoadouts[cb_Presets.GetIndex()].Layouts[4]);
		LoadCamos(4, cb_Grenade_LI.GetIndex(), Item_Grenade.Index, cb_Grenade_CI, SavedLoadouts[cb_Presets.GetIndex()].Camos[4]);		
	}
	else
	{
		// End:0x3D5
		if(Sender == cb_Melee_LI)
		{
			LoadCamos(0, cb_Melee_LI.GetIndex(), Item_Melee.Index, cb_Melee_CI);			
		}
		else
		{
			// End:0x410
			if(Sender == cb_SideArm_LI)
			{
				LoadCamos(1, cb_SideArm_LI.GetIndex(), Item_SideArm.Index, cb_SideArm_CI);				
			}
			else
			{
				// End:0x44C
				if(Sender == cb_Primary_LI)
				{
					LoadCamos(2, cb_Primary_LI.GetIndex(), Item_Primary.Index, cb_Primary_CI);					
				}
				else
				{
					// End:0x488
					if(Sender == cb_Secondary_LI)
					{
						LoadCamos(3, cb_Secondary_LI.GetIndex(), Item_Secondary.Index, cb_Secondary_CI);						
					}
					else
					{
						// End:0x4C1
						if(Sender == cb_Grenade_LI)
						{
							LoadCamos(4, cb_Grenade_LI.GetIndex(), Item_Grenade.Index, cb_Grenade_CI);
						}
					}
				}
			}
		}
	}
	//return;	
}

function bool InternalOnKeyEvent(out byte Key, out byte State, float Delta)
{
	// End:0x2D
	if((int(Key) == 13) && int(State) == 3)
	{
		return InternalOnClick(bDone);		
	}
	else
	{
		// End:0x57
		if((int(Key) == 27) && int(State) == 3)
		{
			return InternalOnClick(bCancel);
		}
	}
	return false;
	//return;	
}

function bool InternalOnClick(GUIComponent Sender)
{
	// End:0xB1
	if(Sender == Item_Melee)
	{
		Controller.OpenMenu("BallisticProV55.BallisticOutfittingWeaponSelect");
		// End:0xAF
		if(BallisticOutfittingWeaponSelect(Controller.ActivePage) != none)
		{
			BallisticOutfittingWeaponSelect(Controller.ActivePage).LoadWeapons(COI, 0);
			ActiveIndex = 0;
			Controller.ActivePage.__OnClose__Delegate = WeaponSelectClosed;
		}
		return true;
	}
	// End:0x162
	if(Sender == Item_SideArm)
	{
		Controller.OpenMenu("BallisticProV55.BallisticOutfittingWeaponSelect");
		// End:0x160
		if(BallisticOutfittingWeaponSelect(Controller.ActivePage) != none)
		{
			BallisticOutfittingWeaponSelect(Controller.ActivePage).LoadWeapons(COI, 1);
			ActiveIndex = 1;
			Controller.ActivePage.__OnClose__Delegate = WeaponSelectClosed;
		}
		return true;
	}
	// End:0x215
	if(Sender == Item_Primary)
	{
		Controller.OpenMenu("BallisticProV55.BallisticOutfittingWeaponSelect");
		// End:0x213
		if(BallisticOutfittingWeaponSelect(Controller.ActivePage) != none)
		{
			BallisticOutfittingWeaponSelect(Controller.ActivePage).LoadWeapons(COI, 2);
			ActiveIndex = 2;
			Controller.ActivePage.__OnClose__Delegate = WeaponSelectClosed;
		}
		return true;
	}
	// End:0x2C8
	if(Sender == Item_Secondary)
	{
		Controller.OpenMenu("BallisticProV55.BallisticOutfittingWeaponSelect");
		// End:0x2C6
		if(BallisticOutfittingWeaponSelect(Controller.ActivePage) != none)
		{
			BallisticOutfittingWeaponSelect(Controller.ActivePage).LoadWeapons(COI, 3);
			ActiveIndex = 3;
			Controller.ActivePage.__OnClose__Delegate = WeaponSelectClosed;
		}
		return true;
	}
	// End:0x37B
	if(Sender == Item_Grenade)
	{
		Controller.OpenMenu("BallisticProV55.BallisticOutfittingWeaponSelect");
		// End:0x379
		if(BallisticOutfittingWeaponSelect(Controller.ActivePage) != none)
		{
			BallisticOutfittingWeaponSelect(Controller.ActivePage).LoadWeapons(COI, 4);
			ActiveIndex = 4;
			Controller.ActivePage.__OnClose__Delegate = WeaponSelectClosed;
		}
		return true;
	}
	// End:0x769
	if(Sender == BSavePreset)
	{
		SavedLoadouts[cb_Presets.GetIndex()].PresetName = cb_Presets.GetText();
		// End:0x46F
		if(Item_Melee.items.Length > Item_Melee.Index)
		{
			SavedLoadouts[cb_Presets.GetIndex()].Weapons[0] = Item_Melee.items[Item_Melee.Index].Text;
			SavedLoadouts[cb_Presets.GetIndex()].Layouts[0] = cb_Melee_LI.GetIndex();
			SavedLoadouts[cb_Presets.GetIndex()].Camos[0] = int(cb_Melee_CI.GetExtra());
		}
		// End:0x52A
		if(Item_SideArm.items.Length > Item_SideArm.Index)
		{
			SavedLoadouts[cb_Presets.GetIndex()].Weapons[1] = Item_SideArm.items[Item_SideArm.Index].Text;
			SavedLoadouts[cb_Presets.GetIndex()].Layouts[1] = cb_SideArm_LI.GetIndex();
			SavedLoadouts[cb_Presets.GetIndex()].Camos[1] = int(cb_SideArm_CI.GetExtra());
		}
		// End:0x5E8
		if(Item_Primary.items.Length > Item_Primary.Index)
		{
			SavedLoadouts[cb_Presets.GetIndex()].Weapons[2] = Item_Primary.items[Item_Primary.Index].Text;
			SavedLoadouts[cb_Presets.GetIndex()].Layouts[2] = cb_Primary_LI.GetIndex();
			SavedLoadouts[cb_Presets.GetIndex()].Camos[2] = int(cb_Primary_CI.GetExtra());
		}
		// End:0x6A6
		if(Item_Secondary.items.Length > Item_Secondary.Index)
		{
			SavedLoadouts[cb_Presets.GetIndex()].Weapons[3] = Item_Secondary.items[Item_Secondary.Index].Text;
			SavedLoadouts[cb_Presets.GetIndex()].Layouts[3] = cb_Secondary_LI.GetIndex();
			SavedLoadouts[cb_Presets.GetIndex()].Camos[3] = int(cb_Secondary_CI.GetExtra());
		}
		// End:0x764
		if(Item_Grenade.items.Length > Item_Grenade.Index)
		{
			SavedLoadouts[cb_Presets.GetIndex()].Weapons[4] = Item_Grenade.items[Item_Grenade.Index].Text;
			SavedLoadouts[cb_Presets.GetIndex()].Layouts[4] = cb_Grenade_LI.GetIndex();
			SavedLoadouts[cb_Presets.GetIndex()].Camos[4] = int(cb_Grenade_CI.GetExtra());
		}
		SaveConfig();
		return true;
	}
	// End:0x789
	if(Sender == bCancel)
	{
		Controller.CloseMenu();
		return true;
	}
	// End:0x7CC
	if(Sender == bDone)
	{
		SaveSettings();
		COI.LoadoutChanged(Class'BallisticProV55.Mut_Outfitting'.default.LoadOut);
		Controller.CloseMenu();
		return true;
	}
	return true;
	//return;	
}

defaultproperties
{
	// Reference: GUIImage'BallisticProV55.BallisticOutfittingMenu.BackImage'
	begin object name="BackImage" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display95'
		ImageStyle=1
		WinTop=0.1250000
		WinLeft=0.0500000
		WinWidth=0.9000000
		WinHeight=0.6750000
		RenderWeight=0.0010000
	end object
	MyBack=BackImage
	// Reference: GUIHeader'BallisticProV55.BallisticOutfittingMenu.DaBeegHeader'
	begin object name="DaBeegHeader" class=XInterface.GUIHeader
		bUseTextHeight=true
		Caption="Select your equipment"
		WinTop=0.1250000
		WinLeft=0.0500000
		WinWidth=0.9000000
		WinHeight=0.7000000
	end object
	MyHeader=DaBeegHeader
	// Reference: GUIImage'BallisticProV55.BallisticOutfittingMenu.ImageBoxMelee'
	begin object name="ImageBoxMelee" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.ScrollGripWatched'
		ImageStyle=1
		WinTop=0.2050000
		WinLeft=0.1100000
		WinWidth=0.1800000
		WinHeight=0.1400000
		RenderWeight=0.0020000
	end object
	Box_Melee=ImageBoxMelee
	// Reference: GUIImage'BallisticProV55.BallisticOutfittingMenu.ImageBoxSideArm'
	begin object name="ImageBoxSideArm" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.ScrollGripWatched'
		ImageStyle=1
		WinTop=0.2050000
		WinLeft=0.4100000
		WinWidth=0.1800000
		WinHeight=0.1400000
		RenderWeight=0.0020000
	end object
	Box_SideArm=ImageBoxSideArm
	// Reference: GUIImage'BallisticProV55.BallisticOutfittingMenu.ImageBoxPrimary'
	begin object name="ImageBoxPrimary" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.ScrollGripWatched'
		ImageStyle=1
		WinTop=0.4500000
		WinLeft=0.2600000
		WinWidth=0.1800000
		WinHeight=0.1400000
		RenderWeight=0.0020000
	end object
	Box_Primary=ImageBoxPrimary
	// Reference: GUIImage'BallisticProV55.BallisticOutfittingMenu.ImageBoxSecondary'
	begin object name="ImageBoxSecondary" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.ScrollGripWatched'
		ImageStyle=1
		WinTop=0.4500000
		WinLeft=0.5600000
		WinWidth=0.1800000
		WinHeight=0.1400000
		RenderWeight=0.0020000
	end object
	Box_Secondary=ImageBoxSecondary
	// Reference: GUIImage'BallisticProV55.BallisticOutfittingMenu.ImageBoxGrenade'
	begin object name="ImageBoxGrenade" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.ScrollGripWatched'
		ImageStyle=1
		WinTop=0.2050000
		WinLeft=0.7100000
		WinWidth=0.1800000
		WinHeight=0.1400000
		RenderWeight=0.0020000
	end object
	Box_Grenade=ImageBoxGrenade
	// Reference: GUILoadOutItem'BallisticProV55.BallisticOutfittingMenu.MeleeImage'
	begin object name="MeleeImage" class=BCoreProV55.GUILoadOutItem
		NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
		Caption="Melee Weapon"
		WinTop=0.2090000
		WinLeft=0.1000000
		WinWidth=0.2000000
		WinHeight=0.1333330
		OnRendered=MeleeImage.InternalOnDraw
		OnClick=BallisticOutfittingMenu.InternalOnClick
		OnRightClick=BallisticOutfittingMenu.InternalOnClick
	end object
	Item_Melee=MeleeImage
	// Reference: GUILoadOutItem'BallisticProV55.BallisticOutfittingMenu.SideArmImage'
	begin object name="SideArmImage" class=BCoreProV55.GUILoadOutItem
		NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
		Caption="SideArm"
		WinTop=0.2090000
		WinLeft=0.4000000
		WinWidth=0.2000000
		WinHeight=0.1333330
		OnRendered=SideArmImage.InternalOnDraw
		OnClick=BallisticOutfittingMenu.InternalOnClick
		OnRightClick=BallisticOutfittingMenu.InternalOnClick
	end object
	Item_SideArm=SideArmImage
	// Reference: GUILoadOutItem'BallisticProV55.BallisticOutfittingMenu.PrimaryImage'
	begin object name="PrimaryImage" class=BCoreProV55.GUILoadOutItem
		NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
		Caption="Primary Weapon"
		WinTop=0.4530000
		WinLeft=0.2500000
		WinWidth=0.2000000
		WinHeight=0.1333330
		OnRendered=PrimaryImage.InternalOnDraw
		OnClick=BallisticOutfittingMenu.InternalOnClick
		OnRightClick=BallisticOutfittingMenu.InternalOnClick
	end object
	Item_Primary=PrimaryImage
	// Reference: GUILoadOutItem'BallisticProV55.BallisticOutfittingMenu.SecondaryImage'
	begin object name="SecondaryImage" class=BCoreProV55.GUILoadOutItem
		NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
		Caption="Secondary Weapon"
		WinTop=0.4530000
		WinLeft=0.5500000
		WinWidth=0.2000000
		WinHeight=0.1333330
		OnRendered=SecondaryImage.InternalOnDraw
		OnClick=BallisticOutfittingMenu.InternalOnClick
		OnRightClick=BallisticOutfittingMenu.InternalOnClick
	end object
	Item_Secondary=SecondaryImage
	// Reference: GUILoadOutItem'BallisticProV55.BallisticOutfittingMenu.GrenadeImage'
	begin object name="GrenadeImage" class=BCoreProV55.GUILoadOutItem
		NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
		Caption="Grenades"
		WinTop=0.2090000
		WinLeft=0.7000000
		WinWidth=0.2000000
		WinHeight=0.1333330
		OnRendered=GrenadeImage.InternalOnDraw
		OnClick=BallisticOutfittingMenu.InternalOnClick
		OnRightClick=BallisticOutfittingMenu.InternalOnClick
	end object
	Item_Grenade=GrenadeImage
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingMenu.cb_MeleeComBox_LI'
	begin object name="cb_MeleeComBox_LI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Gear layouts."
		WinTop=0.3900000
		WinLeft=0.0921480
		WinWidth=0.1160940
		WinHeight=0.0350000
		TabOrder=0
		OnChange=BallisticOutfittingMenu.InternalOnChange
		OnKeyEvent=cb_MeleeComBox_LI.InternalOnKeyEvent
	end object
	cb_Melee_LI=cb_MeleeComBox_LI
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingMenu.cb_SideArmBox_LI'
	begin object name="cb_SideArmBox_LI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Sidearm layouts."
		WinTop=0.3900000
		WinLeft=0.3929300
		WinWidth=0.1160940
		WinHeight=0.0350000
		TabOrder=0
		OnChange=BallisticOutfittingMenu.InternalOnChange
		OnKeyEvent=cb_SideArmBox_LI.InternalOnKeyEvent
	end object
	cb_SideArm_LI=cb_SideArmBox_LI
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingMenu.cb_PrimaryComBox_LI'
	begin object name="cb_PrimaryComBox_LI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Primary Weapon layouts."
		WinTop=0.6300000
		WinLeft=0.2415630
		WinWidth=0.1160940
		WinHeight=0.0350000
		TabOrder=0
		OnChange=BallisticOutfittingMenu.InternalOnChange
		OnKeyEvent=cb_PrimaryComBox_LI.InternalOnKeyEvent
	end object
	cb_Primary_LI=cb_PrimaryComBox_LI
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingMenu.cb_SecondaryComBox_LI'
	begin object name="cb_SecondaryComBox_LI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Secondary weapon layouts."
		WinTop=0.6300000
		WinLeft=0.5409770
		WinWidth=0.1160940
		WinHeight=0.0350000
		TabOrder=0
		OnChange=BallisticOutfittingMenu.InternalOnChange
		OnKeyEvent=cb_SecondaryComBox_LI.InternalOnKeyEvent
	end object
	cb_Secondary_LI=cb_SecondaryComBox_LI
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingMenu.cb_GrenadeComBox_LI'
	begin object name="cb_GrenadeComBox_LI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Grenade layouts."
		WinTop=0.3900000
		WinLeft=0.6921480
		WinWidth=0.1160940
		WinHeight=0.0350000
		TabOrder=0
		OnChange=BallisticOutfittingMenu.InternalOnChange
		OnKeyEvent=cb_GrenadeComBox_LI.InternalOnKeyEvent
	end object
	cb_Grenade_LI=cb_GrenadeComBox_LI
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingMenu.cb_MeleeComBox_CI'
	begin object name="cb_MeleeComBox_CI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Gear camos."
		WinTop=0.3900000
		WinLeft=0.2121480
		WinWidth=0.1160940
		WinHeight=0.0350000
		TabOrder=0
		OnChange=BallisticOutfittingMenu.InternalOnChange
		OnKeyEvent=cb_MeleeComBox_CI.InternalOnKeyEvent
	end object
	cb_Melee_CI=cb_MeleeComBox_CI
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingMenu.cb_SideArmBox_CI'
	begin object name="cb_SideArmBox_CI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Sidearm camos."
		WinTop=0.3900000
		WinLeft=0.5129300
		WinWidth=0.1160940
		WinHeight=0.0350000
		TabOrder=0
		OnChange=BallisticOutfittingMenu.InternalOnChange
		OnKeyEvent=cb_SideArmBox_CI.InternalOnKeyEvent
	end object
	cb_SideArm_CI=cb_SideArmBox_CI
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingMenu.cb_PrimaryComBox_CI'
	begin object name="cb_PrimaryComBox_CI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Primary Weapon camos."
		WinTop=0.6300000
		WinLeft=0.3615630
		WinWidth=0.1160940
		WinHeight=0.0350000
		TabOrder=0
		OnChange=BallisticOutfittingMenu.InternalOnChange
		OnKeyEvent=cb_PrimaryComBox_CI.InternalOnKeyEvent
	end object
	cb_Primary_CI=cb_PrimaryComBox_CI
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingMenu.cb_SecondaryComBox_CI'
	begin object name="cb_SecondaryComBox_CI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Secondary weapon camos."
		WinTop=0.6300000
		WinLeft=0.6609770
		WinWidth=0.1160940
		WinHeight=0.0350000
		TabOrder=0
		OnChange=BallisticOutfittingMenu.InternalOnChange
		OnKeyEvent=cb_SecondaryComBox_CI.InternalOnKeyEvent
	end object
	cb_Secondary_CI=cb_SecondaryComBox_CI
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingMenu.cb_GrenadeComBox_CI'
	begin object name="cb_GrenadeComBox_CI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Grenade layouts."
		WinTop=0.3900000
		WinLeft=0.8121480
		WinWidth=0.1160940
		WinHeight=0.0350000
		TabOrder=0
		OnChange=BallisticOutfittingMenu.InternalOnChange
		OnKeyEvent=cb_GrenadeComBox_CI.InternalOnKeyEvent
	end object
	cb_Grenade_CI=cb_GrenadeComBox_CI
	// Reference: GUIButton'BallisticProV55.BallisticOutfittingMenu.DoneButton'
	begin object name="DoneButton" class=XInterface.GUIButton
		Caption="DONE"
		WinTop=0.7200000
		WinLeft=0.2000000
		WinWidth=0.2000000
		TabOrder=0
		OnClick=BallisticOutfittingMenu.InternalOnClick
		OnKeyEvent=DoneButton.InternalOnKeyEvent
	end object
	bDone=DoneButton
	// Reference: GUIButton'BallisticProV55.BallisticOutfittingMenu.CancelButton'
	begin object name="CancelButton" class=XInterface.GUIButton
		Caption="CANCEL"
		WinTop=0.7200000
		WinLeft=0.6000000
		WinWidth=0.2000000
		TabOrder=1
		OnClick=BallisticOutfittingMenu.InternalOnClick
		OnKeyEvent=CancelButton.InternalOnKeyEvent
	end object
	bCancel=CancelButton
	// Reference: GUIButton'BallisticProV55.BallisticOutfittingMenu.BSavePresetButton'
	begin object name="BSavePresetButton" class=XInterface.GUIButton
		Caption="SAVE"
		Hint="Saves the current configuration as a new preset."
		WinTop=0.6650000
		WinLeft=0.2000000
		WinWidth=0.2000000
		TabOrder=0
		OnClick=BallisticOutfittingMenu.InternalOnClick
		OnKeyEvent=BSavePresetButton.InternalOnKeyEvent
	end object
	BSavePreset=BSavePresetButton
	// Reference: moComboBox'BallisticProV55.BallisticOutfittingMenu.co_PresetsCB'
	begin object name="co_PresetsCB" class=XInterface.moComboBox
		ComponentJustification=0
		CaptionWidth=0.4000000
		Caption="Presets"
		OnCreateComponent=co_PresetsCB.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Choose a preset replacements configuration, or type a new preset name here and click 'Save' to make the current configuration a new preset."
		WinTop=0.6650000
		WinLeft=0.6000000
		WinWidth=0.2000000
		OnChange=BallisticOutfittingMenu.InternalOnChange
	end object
	cb_Presets=co_PresetsCB
	// Reference: GUILabel'BallisticProV55.BallisticOutfittingMenu.l_Receivinglabel'
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
	SavedLoadouts[0]=(PresetName="Terran",Weapons="BallisticProV55.X3Knife",Weapons[1]="BallisticProV55.M806Pistol",Weapons[2]="BallisticProV55.M50AssaultRifle",Weapons[3]="BallisticProV55.M763Shotgun",Weapons[4]="BallisticProV55.NRP57Grenade",Layouts[4]=0,Layouts[1]=0,Layouts[2]=0,Layouts[3]=0,Layouts[4]=0,Camos[4]=0,Camos[1]=0,Camos[2]=0,Camos[3]=0,Camos[4]=0)
	SavedLoadouts[1]=(PresetName="Skrith",Weapons="BallisticProV55.A909SkrithBlades",Weapons[1]="BallisticProV55.A42SkrithPistol",Weapons[2]="BallisticProV55.A73SkrithRifle",Weapons[3]="BWBP_SKC_Pro.AY90SkrithBoltcaster",Weapons[4]="BallisticProV55.BX5Mine",Layouts[4]=0,Layouts[1]=0,Layouts[2]=0,Layouts[3]=0,Layouts[4]=0,Camos[4]=0,Camos[1]=0,Camos[2]=0,Camos[3]=0,Camos[4]=0)
	SavedLoadouts[2]=(PresetName="Insurgent",Weapons="BWBP_SKC_Pro.X8Knife",Weapons[1]="BallisticProV55.MRT6Shotgun",Weapons[2]="BallisticProV55.G5Bazooka",Weapons[3]="BWBP_SKC_Pro.AK490BattleRifle",Weapons[4]="BallisticProV55.BX5Mine",Layouts[4]=0,Layouts[1]=0,Layouts[2]=0,Layouts[3]=0,Layouts[4]=0,Camos[4]=0,Camos[1]=0,Camos[2]=0,Camos[3]=0,Camos[4]=0)
	SavedLoadouts[3]=(PresetName="Support",Weapons="BWBP_OP_Pro.BallisticShieldWeapon",Weapons[1]="BallisticProV55.D49Revolver",Weapons[2]="BallisticProV55.M353Machinegun",Weapons[3]="BallisticProV55.BOGPPistol",Weapons[4]="BWBP_OP_Pro.L8GIAmmoPack",Layouts[4]=0,Layouts[1]=0,Layouts[2]=0,Layouts[3]=0,Layouts[4]=0,Camos[4]=0,Camos[1]=0,Camos[2]=0,Camos[3]=0,Camos[4]=0)
	SavedLoadouts[4]=(PresetName="Assassin",Weapons="BWBP_SKC_Pro.DragonsToothSword",Weapons[1]="BallisticProV55.RS8Pistol",Weapons[2]="BWBP_SKC_Pro.X82Rifle",Weapons[3]="BallisticProV55.XK2SubMachinegun",Weapons[4]="BWBP_SKC_Pro.XM84Flashbang",Layouts[4]=0,Layouts[1]=0,Layouts[2]=0,Layouts[3]=0,Layouts[4]=0,Camos[4]=0,Camos[1]=0,Camos[2]=0,Camos[3]=0,Camos[4]=0)
	QuickListText="QuickList"
	ReceivingText[0]="Receiving..."
	ReceivingText[1]="Loading..."
	bRenderWorld=true
	bAllowedAsLast=true
	OnKeyEvent=BallisticOutfittingMenu.InternalOnKeyEvent
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: GUIButton'BallisticProV55.BallisticOutfittingMenu.CancelButton'
begin object name="CancelButton" class=XInterface.GUIButton
	Caption="CANCEL"
	WinTop=0.7200000
	WinLeft=0.6000000
	WinWidth=0.2000000
	TabOrder=1
	OnClick=BallisticOutfittingMenu.InternalOnClick
	OnKeyEvent=CancelButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.BallisticOutfittingMenu.DoneButton'
begin object name="DoneButton" class=XInterface.GUIButton
	Caption="DONE"
	WinTop=0.7200000
	WinLeft=0.2000000
	WinWidth=0.2000000
	TabOrder=0
	OnClick=BallisticOutfittingMenu.InternalOnClick
	OnKeyEvent=DoneButton.InternalOnKeyEvent
end object
// Reference: moComboBox'BallisticProV55.BallisticOutfittingMenu.co_PresetsCB'
begin object name="co_PresetsCB" class=XInterface.moComboBox
	ComponentJustification=0
	CaptionWidth=0.4000000
	Caption="Presets"
	OnCreateComponent=co_PresetsCB.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Choose a preset replacements configuration, or type a new preset name here and click 'Save' to make the current configuration a new preset."
	WinTop=0.6650000
	WinLeft=0.6000000
	WinWidth=0.2000000
	OnChange=BallisticOutfittingMenu.InternalOnChange
end object
// Reference: GUIButton'BallisticProV55.BallisticOutfittingMenu.BSavePresetButton'
begin object name="BSavePresetButton" class=XInterface.GUIButton
	Caption="SAVE"
	Hint="Saves the current configuration as a new preset."
	WinTop=0.6650000
	WinLeft=0.2000000
	WinWidth=0.2000000
	TabOrder=0
	OnClick=BallisticOutfittingMenu.InternalOnClick
	OnKeyEvent=BSavePresetButton.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingMenu.cb_GrenadeComBox_CI'
begin object name="cb_GrenadeComBox_CI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Grenade layouts."
	WinTop=0.3900000
	WinLeft=0.8121480
	WinWidth=0.1160940
	WinHeight=0.0350000
	TabOrder=0
	OnChange=BallisticOutfittingMenu.InternalOnChange
	OnKeyEvent=cb_GrenadeComBox_CI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingMenu.cb_GrenadeComBox_LI'
begin object name="cb_GrenadeComBox_LI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Grenade layouts."
	WinTop=0.3900000
	WinLeft=0.6921480
	WinWidth=0.1160940
	WinHeight=0.0350000
	TabOrder=0
	OnChange=BallisticOutfittingMenu.InternalOnChange
	OnKeyEvent=cb_GrenadeComBox_LI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingMenu.cb_SecondaryComBox_CI'
begin object name="cb_SecondaryComBox_CI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Secondary weapon camos."
	WinTop=0.6300000
	WinLeft=0.6609770
	WinWidth=0.1160940
	WinHeight=0.0350000
	TabOrder=0
	OnChange=BallisticOutfittingMenu.InternalOnChange
	OnKeyEvent=cb_SecondaryComBox_CI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingMenu.cb_SecondaryComBox_LI'
begin object name="cb_SecondaryComBox_LI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Secondary weapon layouts."
	WinTop=0.6300000
	WinLeft=0.5409770
	WinWidth=0.1160940
	WinHeight=0.0350000
	TabOrder=0
	OnChange=BallisticOutfittingMenu.InternalOnChange
	OnKeyEvent=cb_SecondaryComBox_LI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingMenu.cb_PrimaryComBox_CI'
begin object name="cb_PrimaryComBox_CI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Primary Weapon camos."
	WinTop=0.6300000
	WinLeft=0.3615630
	WinWidth=0.1160940
	WinHeight=0.0350000
	TabOrder=0
	OnChange=BallisticOutfittingMenu.InternalOnChange
	OnKeyEvent=cb_PrimaryComBox_CI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingMenu.cb_PrimaryComBox_LI'
begin object name="cb_PrimaryComBox_LI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Primary Weapon layouts."
	WinTop=0.6300000
	WinLeft=0.2415630
	WinWidth=0.1160940
	WinHeight=0.0350000
	TabOrder=0
	OnChange=BallisticOutfittingMenu.InternalOnChange
	OnKeyEvent=cb_PrimaryComBox_LI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingMenu.cb_SideArmBox_CI'
begin object name="cb_SideArmBox_CI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Sidearm camos."
	WinTop=0.3900000
	WinLeft=0.5129300
	WinWidth=0.1160940
	WinHeight=0.0350000
	TabOrder=0
	OnChange=BallisticOutfittingMenu.InternalOnChange
	OnKeyEvent=cb_SideArmBox_CI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingMenu.cb_SideArmBox_LI'
begin object name="cb_SideArmBox_LI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Sidearm layouts."
	WinTop=0.3900000
	WinLeft=0.3929300
	WinWidth=0.1160940
	WinHeight=0.0350000
	TabOrder=0
	OnChange=BallisticOutfittingMenu.InternalOnChange
	OnKeyEvent=cb_SideArmBox_LI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingMenu.cb_MeleeComBox_CI'
begin object name="cb_MeleeComBox_CI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Gear camos."
	WinTop=0.3900000
	WinLeft=0.2121480
	WinWidth=0.1160940
	WinHeight=0.0350000
	TabOrder=0
	OnChange=BallisticOutfittingMenu.InternalOnChange
	OnKeyEvent=cb_MeleeComBox_CI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingMenu.cb_MeleeComBox_LI'
begin object name="cb_MeleeComBox_LI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Gear layouts."
	WinTop=0.3900000
	WinLeft=0.0921480
	WinWidth=0.1160940
	WinHeight=0.0350000
	TabOrder=0
	OnChange=BallisticOutfittingMenu.InternalOnChange
	OnKeyEvent=cb_MeleeComBox_LI.InternalOnKeyEvent
end object
// Reference: GUILoadOutItem'BallisticProV55.BallisticOutfittingMenu.GrenadeImage'
begin object name="GrenadeImage" class=BCoreProV55.GUILoadOutItem
	NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
	Caption="Grenades"
	WinTop=0.2090000
	WinLeft=0.7000000
	WinWidth=0.2000000
	WinHeight=0.1333330
	OnRendered=GrenadeImage.InternalOnDraw
	OnClick=BallisticOutfittingMenu.InternalOnClick
	OnRightClick=BallisticOutfittingMenu.InternalOnClick
end object
// Reference: GUILoadOutItem'BallisticProV55.BallisticOutfittingMenu.SecondaryImage'
begin object name="SecondaryImage" class=BCoreProV55.GUILoadOutItem
	NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
	Caption="Secondary Weapon"
	WinTop=0.4530000
	WinLeft=0.5500000
	WinWidth=0.2000000
	WinHeight=0.1333330
	OnRendered=SecondaryImage.InternalOnDraw
	OnClick=BallisticOutfittingMenu.InternalOnClick
	OnRightClick=BallisticOutfittingMenu.InternalOnClick
end object
// Reference: GUILoadOutItem'BallisticProV55.BallisticOutfittingMenu.PrimaryImage'
begin object name="PrimaryImage" class=BCoreProV55.GUILoadOutItem
	NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
	Caption="Primary Weapon"
	WinTop=0.4530000
	WinLeft=0.2500000
	WinWidth=0.2000000
	WinHeight=0.1333330
	OnRendered=PrimaryImage.InternalOnDraw
	OnClick=BallisticOutfittingMenu.InternalOnClick
	OnRightClick=BallisticOutfittingMenu.InternalOnClick
end object
// Reference: GUILoadOutItem'BallisticProV55.BallisticOutfittingMenu.SideArmImage'
begin object name="SideArmImage" class=BCoreProV55.GUILoadOutItem
	NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
	Caption="SideArm"
	WinTop=0.2090000
	WinLeft=0.4000000
	WinWidth=0.2000000
	WinHeight=0.1333330
	OnRendered=SideArmImage.InternalOnDraw
	OnClick=BallisticOutfittingMenu.InternalOnClick
	OnRightClick=BallisticOutfittingMenu.InternalOnClick
end object
// Reference: GUILoadOutItem'BallisticProV55.BallisticOutfittingMenu.MeleeImage'
begin object name="MeleeImage" class=BCoreProV55.GUILoadOutItem
	NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
	Caption="Melee Weapon"
	WinTop=0.2090000
	WinLeft=0.1000000
	WinWidth=0.2000000
	WinHeight=0.1333330
	OnRendered=MeleeImage.InternalOnDraw
	OnClick=BallisticOutfittingMenu.InternalOnClick
	OnRightClick=BallisticOutfittingMenu.InternalOnClick
end object
// Reference: GUIImage'BallisticProV55.BallisticOutfittingMenu.BackImage'
begin object name="BackImage" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display95'
	ImageStyle=1
	WinTop=0.1250000
	WinLeft=0.0500000
	WinWidth=0.9000000
	WinHeight=0.6750000
	RenderWeight=0.0010000
end object
// Reference: GUIImage'BallisticProV55.BallisticOutfittingMenu.ImageBoxMelee'
begin object name="ImageBoxMelee" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.ScrollGripWatched'
	ImageStyle=1
	WinTop=0.2050000
	WinLeft=0.1100000
	WinWidth=0.1800000
	WinHeight=0.1400000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticOutfittingMenu.ImageBoxSideArm'
begin object name="ImageBoxSideArm" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.ScrollGripWatched'
	ImageStyle=1
	WinTop=0.2050000
	WinLeft=0.4100000
	WinWidth=0.1800000
	WinHeight=0.1400000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticOutfittingMenu.ImageBoxPrimary'
begin object name="ImageBoxPrimary" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.ScrollGripWatched'
	ImageStyle=1
	WinTop=0.4500000
	WinLeft=0.2600000
	WinWidth=0.1800000
	WinHeight=0.1400000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticOutfittingMenu.ImageBoxSecondary'
begin object name="ImageBoxSecondary" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.ScrollGripWatched'
	ImageStyle=1
	WinTop=0.4500000
	WinLeft=0.5600000
	WinWidth=0.1800000
	WinHeight=0.1400000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticOutfittingMenu.ImageBoxGrenade'
begin object name="ImageBoxGrenade" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.ScrollGripWatched'
	ImageStyle=1
	WinTop=0.2050000
	WinLeft=0.7100000
	WinWidth=0.1800000
	WinHeight=0.1400000
	RenderWeight=0.0020000
end object
// Reference: GUILabel'BallisticProV55.BallisticOutfittingMenu.l_Receivinglabel'
begin object name="l_Receivinglabel" class=XInterface.GUILabel
	TextAlign=1
	TextColor=(R=255,G=255,B=0,A=255)
	FontScale=2
	WinTop=0.0870000
	WinLeft=0.0500000
	WinWidth=0.9000000
	WinHeight=0.0400000
end object
// Reference: GUIHeader'BallisticProV55.BallisticOutfittingMenu.DaBeegHeader'
begin object name="DaBeegHeader" class=XInterface.GUIHeader
	bUseTextHeight=true
	Caption="Select your equipment"
	WinTop=0.1250000
	WinLeft=0.0500000
	WinWidth=0.9000000
	WinHeight=0.7000000
end object
