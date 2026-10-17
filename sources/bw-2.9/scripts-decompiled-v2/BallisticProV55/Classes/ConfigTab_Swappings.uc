class ConfigTab_Swappings extends ConfigTabBase
	config(BallisticProV55)
	editinlinenew
	instanced;

struct Swap
{
	var() config array<string> NIs;
	var() config bool R;
};

struct SwapPreset
{
	var() config string PresetName;
	var() config array<Swap> Swaps;
};

var() automated GUIListBox lb_OldWeapons;
var() automated BC_GUICheckListBox lb_NewWeapons;
var() automated GUIImage Box_Old;
var() automated GUIImage Box_New;
var() automated GUIButton BAddAll;
var() automated GUIButton BRemoveAll;
var() automated GUIButton BSavePreset;
var() automated GUIButton BDeletePreset;
var() automated moComboBox cb_Presets;
var() automated moCheckBox ch_Independent;
var() automated moNumericEdit nu_SwitchTime;
var() automated GUILabel l_OldList;
var() automated GUILabel l_NewList;
var() array<Swap> Swaps;
var() config array<Swap> DefaultSwaps;
var() config bool bDefaultsWritten;
var array<string> TempItems;
var() localized string Headings[12];

function InitializeConfigTab()
{
	local int i, j;
	local array<WeaponRecord> Recs;
	local int Index[12];
	local bool MiscLoaded;
	local WeaponInfo WI, TempItemName;
	local array<string> PresetNames;
	local array<WeaponInfo> TempItemNameList;

	lb_NewWeapons.CheckList.Add(Headings[0],, "MELEE", true);
	lb_NewWeapons.CheckList.Add(Headings[1],, "SIDEARM", true);
	lb_NewWeapons.CheckList.Add(Headings[2],, "SPREAD", true);
	lb_NewWeapons.CheckList.Add(Headings[3],, "SMG", true);
	lb_NewWeapons.CheckList.Add(Headings[4],, "AR", true);
	lb_NewWeapons.CheckList.Add(Headings[5],, "MG", true);
	lb_NewWeapons.CheckList.Add(Headings[6],, "SNIPER", true);
	lb_NewWeapons.CheckList.Add(Headings[7],, "HEAVY", true);
	lb_NewWeapons.CheckList.Add(Headings[8],, "SPECIAL", true);
	lb_NewWeapons.CheckList.Add(Headings[9],, "TRAPS", true);
	i = 0;
	J0x19D:

	// End:0x20C [Loop If]
	if(i < Class'BallisticProV55.Mut_BallisticSwap'.static.GetNumWeapons())
	{
		lb_OldWeapons.List.Add(Class'BallisticProV55.Mut_BallisticSwap'.static.GetOldWeaponClass(i).default.ItemName,, string(Class'BallisticProV55.Mut_BallisticSwap'.static.GetOldWeaponClass(i)));
		i++;
		// [Loop Continue]
		goto J0x19D;
	}
	lb_OldWeapons.List.__OnClick__Delegate = InternalOnClick;
	j = 0;
	J0x230:

	// End:0x25A [Loop If]
	if(j < 12)
	{
		Index[j] = j + 1;
		j++;
		// [Loop Continue]
		goto J0x230;
	}
	Class'Engine.CacheManager'.static.GetWeaponList(Recs);
	i = 0;
	J0x272:

	// End:0x300 [Loop If]
	if(i < Recs.Length)
	{
		// End:0x2A9
		if(!Class'BCoreProV55.BC_WeaponInfoCache'.static.IsValid(Recs[i].ClassName))
		{
			// [Explicit Continue]
			goto J0x2F6;
		}
		WI = Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(Recs[i].ClassName, j);
		// End:0x2E5
		if(j == -1)
		{
			// [Explicit Continue]
			goto J0x2F6;
		}
		TempItemNameList[i] = WI;
		J0x2F6:

		i++;
		// [Loop Continue]
		goto J0x272;
	}
	i = 0;
	J0x307:

	// End:0x3B6 [Loop If]
	if(i < (TempItemNameList.Length - 1))
	{
		j = 0;
		J0x321:

		// End:0x3AC [Loop If]
		if(j < ((TempItemNameList.Length - i) - 1))
		{
			// End:0x3A2
			if(TempItemNameList[j].ItemName > TempItemNameList[j + 1].ItemName)
			{
				TempItemName = TempItemNameList[j];
				TempItemNameList[j] = TempItemNameList[j + 1];
				TempItemNameList[j + 1] = TempItemName;
			}
			j++;
			// [Loop Continue]
			goto J0x321;
		}
		i++;
		// [Loop Continue]
		goto J0x307;
	}
	i = 0;
	J0x3BD:

	// End:0x5D7 [Loop If]
	if(i < TempItemNameList.Length)
	{
		// End:0x5CD
		if(TempItemNameList[i].ClassName != "")
		{
			// End:0x5CD
			if(TempItemNameList[i].bIsBW)
			{
				// End:0x4B8
				if((TempItemNameList[i].InventoryGroup > 0) && TempItemNameList[i].InventoryGroup < 10)
				{
					lb_NewWeapons.CheckList.Insert(Index[TempItemNameList[i].InventoryGroup - 1], TempItemNameList[i].ItemName,, TempItemNameList[i].ClassName);
					j = TempItemNameList[i].InventoryGroup - 1;
					J0x492:

					// End:0x4B5 [Loop If]
					if(j < 12)
					{
						Index[j]++;
						j++;
						// [Loop Continue]
						goto J0x492;
					}
					// [Explicit Continue]
					goto J0x5CD;
				}
				// End:0x53D
				if(TempItemNameList[i].InventoryGroup == 0)
				{
					lb_NewWeapons.CheckList.Insert(Index[9], TempItemNameList[i].ItemName,, TempItemNameList[i].ClassName);
					j = 9;
					J0x517:

					// End:0x53A [Loop If]
					if(j < 12)
					{
						Index[j]++;
						j++;
						// [Loop Continue]
						goto J0x517;
					}
					// [Explicit Continue]
					goto J0x5CD;
				}
				// End:0x578
				if(!MiscLoaded)
				{
					MiscLoaded = true;
					lb_NewWeapons.CheckList.Add(Headings[10],, "MISC", true);
				}
				lb_NewWeapons.CheckList.Insert(Index[10], TempItemNameList[i].ItemName,, TempItemNameList[i].ClassName);
				Index[10]++;
				Index[11]++;
			}
		}
		J0x5CD:

		i++;
		// [Loop Continue]
		goto J0x3BD;
	}
	Class'BCoreProV55.BC_WeaponInfoCache'.static.EndSession();
	// End:0x66E
	if(((lb_NewWeapons.CheckList.Index == 0) && lb_NewWeapons.CheckList.IsSection()) || lb_NewWeapons.CheckList.Index >= lb_NewWeapons.CheckList.ItemCount)
	{
		lb_NewWeapons.CheckList.SetIndex(1);
	}
	SaveConfig();
	lb_NewWeapons.CheckList.__OnClick__Delegate = InternalOnClick;
	PresetNames = GetPerObjectNames("BallisticProV55", "BallisticSwapPreset");
	i = 0;
	J0x6C7:

	// End:0x70E [Loop If]
	if(i < PresetNames.Length)
	{
		cb_Presets.AddItem(PresetNames[i], new (none, PresetNames[i]) Class'BallisticProV55.BallisticSwapPreset');
		i++;
		// [Loop Continue]
		goto J0x6C7;
	}
	cb_Presets.SetIndex(0);
	cb_Presets.SetText("");
	ch_Independent.MyCheckBox.__OnClick__Delegate = InternalOnClick;
	//return;	
}

function InternalOnChange(GUIComponent Sender)
{
	// End:0x66
	if((Sender == cb_Presets) && cb_Presets.GetObject() != none)
	{
		Swaps = BallisticSwapPreset(cb_Presets.GetObject()).Swaps;
		UpdateReplacementsList(lb_OldWeapons.List.Index);
	}
	//return;	
}

function SectionCheck(bool bChecked, int Index)
{
	local int j;

	j = Index + 1;
	J0x0E:

	// End:0xCA [Loop If]
	if(j < lb_NewWeapons.CheckList.Elements.Length)
	{
		// End:0x58
		if(lb_NewWeapons.CheckList.Elements[j].bSection)
		{
			return;
		}
		lb_NewWeapons.CheckList.SetChecked(j, bChecked);
		ChangeSwapListEntry(lb_OldWeapons.List.Index, lb_NewWeapons.List.Elements[j].ExtraStrData, bChecked);
		j++;
		// [Loop Continue]
		goto J0x0E;
	}
	//return;	
}

function bool InternalOnClick(GUIComponent Sender)
{
	local int i;
	local string S;

	// End:0x15C
	if(Sender == lb_NewWeapons.CheckList)
	{
		lb_NewWeapons.CheckList.InternalOnClick(Sender);
		ChangeSwapListEntry(lb_OldWeapons.List.Index, lb_NewWeapons.List.GetExtraAtIndex(lb_NewWeapons.CheckList.LastCheckChanged), int(lb_NewWeapons.CheckList.Checks[lb_NewWeapons.CheckList.LastCheckChanged]) > 0);
		// End:0x159
		if(lb_NewWeapons.CheckList.LastClickWasCheck)
		{
			// End:0x159
			if(lb_NewWeapons.CheckList.Elements[lb_NewWeapons.CheckList.LastCheckChanged].bSection)
			{
				SectionCheck(int(lb_NewWeapons.CheckList.Checks[lb_NewWeapons.CheckList.LastCheckChanged]) > 0, lb_NewWeapons.CheckList.LastCheckChanged);
			}
		}		
	}
	else
	{
		// End:0x1E3
		if(Sender == lb_OldWeapons.List)
		{
			lb_OldWeapons.List.InternalOnClick(Sender);
			UpdateReplacementsList(lb_OldWeapons.List.Index);
			ch_Independent.Checked(Swaps[lb_OldWeapons.List.Index].R);			
		}
		else
		{
			// End:0x2B1
			if(Sender == BAddAll)
			{
				Swaps[lb_OldWeapons.List.Index].NIs.Length = 0;
				i = 0;
				J0x21E:

				// End:0x2AE [Loop If]
				if(i < lb_NewWeapons.List.Elements.Length)
				{
					Swaps[lb_OldWeapons.List.Index].NIs[i] = lb_NewWeapons.List.GetExtraAtIndex(i);
					lb_NewWeapons.CheckList.SetChecked(i, true);
					i++;
					// [Loop Continue]
					goto J0x21E;
				}				
			}
			else
			{
				// End:0x339
				if(Sender == BRemoveAll)
				{
					Swaps[lb_OldWeapons.List.Index].NIs.Length = 0;
					i = 0;
					J0x2EC:

					// End:0x336 [Loop If]
					if(i < lb_NewWeapons.List.Elements.Length)
					{
						lb_NewWeapons.CheckList.SetChecked(i, false);
						i++;
						// [Loop Continue]
						goto J0x2EC;
					}					
				}
				else
				{
					// End:0x434
					if(Sender == BSavePreset)
					{
						S = Repl(cb_Presets.GetText(), " ", Chr(27));
						// End:0x374
						if(S == "")
						{
							return true;
						}
						i = cb_Presets.FindIndex(S, true, false);
						// End:0x3B6
						if(i != -1)
						{
							cb_Presets.SetIndex(i);							
						}
						else
						{
							cb_Presets.AddItem(S, new (none, S) Class'BallisticProV55.BallisticSwapPreset');
							cb_Presets.SetIndex(cb_Presets.ItemCount() - 1);
						}
						BallisticSwapPreset(cb_Presets.GetObject()).Swaps = Swaps;
						cb_Presets.GetObject().SaveConfig();						
					}
					else
					{
						// End:0x47B
						if(Sender == BDeletePreset)
						{
							cb_Presets.GetObject().ClearConfig();
							cb_Presets.RemoveItem(cb_Presets.GetIndex(), 0);							
						}
						else
						{
							// End:0x4E3
							if(Sender == ch_Independent.MyCheckBox)
							{
								ch_Independent.MyCheckBox.InternalOnClick(Sender);
								Swaps[lb_OldWeapons.List.Index].R = ch_Independent.IsChecked();
							}
						}
					}
				}
			}
		}
	}
	return true;
	//return;	
}

function ChangeSwapListEntry(int Index, string Item, bool bAdd)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x73 [Loop If]
	if(i < Swaps[Index].NIs.Length)
	{
		// End:0x69
		if(Swaps[Index].NIs[i] == Item)
		{
			// End:0x50
			if(bAdd)
			{
				return;
				// [Explicit Continue]
				goto J0x69;
			}
			Swaps[Index].NIs.Remove(i, 1);
			return;
		}
		J0x69:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	Swaps[Index].NIs[Swaps[Index].NIs.Length] = Item;
	//return;	
}

function UpdateReplacementsList(int Index)
{
	local int i, j;

	// End:0x96
	if(((Swaps.Length == 0) || Index < 0) || Index >= Swaps.Length)
	{
		Log((("Error: Swaps array is empty or Index is out of bounds. Index: " $ string(Index)) $ ", Swaps.Length: ") $ string(Swaps.Length));
		return;
	}
	i = 0;
	J0x9D:

	// End:0x16E [Loop If]
	if(i < lb_NewWeapons.List.Elements.Length)
	{
		lb_NewWeapons.CheckList.SetChecked(i, false);
		j = 0;
		J0xE4:

		// End:0x164 [Loop If]
		if(j < Swaps[Index].NIs.Length)
		{
			// End:0x15A
			if(Swaps[Index].NIs[j] ~= lb_NewWeapons.List.Elements[i].ExtraStrData)
			{
				lb_NewWeapons.CheckList.SetChecked(i, true);
			}
			j++;
			// [Loop Continue]
			goto J0xE4;
		}
		i++;
		// [Loop Continue]
		goto J0x9D;
	}
	//return;	
}

function LoadSettings()
{
	local int i, j;
	local byte bRandom;
	local array<string> NewWeaps;

	Log("Loading settings from mutator...");
	cb_Presets.SetText("");
	Swaps.Length = Class'BallisticProV55.Mut_BallisticSwap'.static.GetNumWeapons();
	i = 0;
	J0x52:

	// End:0x115 [Loop If]
	if(i < Swaps.Length)
	{
		Swaps[i].R = false;
		NewWeaps = Class'BallisticProV55.Mut_BallisticSwap'.static.GetNewWeapons(i, bRandom);
		Swaps[i].NIs.Length = NewWeaps.Length;
		j = 0;
		J0xB3:

		// End:0xEF [Loop If]
		if(j < NewWeaps.Length)
		{
			Swaps[i].NIs[j] = NewWeaps[j];
			j++;
			// [Loop Continue]
			goto J0xB3;
		}
		Swaps[i].R = int(bRandom) > 0;
		i++;
		// [Loop Continue]
		goto J0x52;
	}
	UpdateReplacementsList(lb_OldWeapons.List.Index);
	nu_SwitchTime.SetValue(int(Class'BallisticProV55.Mut_BallisticSwap'.default.PickupChangeTime));
	//return;	
}

function SaveSettings()
{
	local int i, j;
	local array<string> NewWeaps;

	// End:0x0D
	if(!bInitialized)
	{
		return;
	}
	i = 0;
	J0x14:

	// End:0xC6 [Loop If]
	if(i < Class'BallisticProV55.Mut_BallisticSwap'.static.GetNumWeapons())
	{
		NewWeaps.Length = 0;
		j = 0;
		J0x3C:

		// End:0x83 [Loop If]
		if(j < Swaps[i].NIs.Length)
		{
			NewWeaps[j] = Swaps[i].NIs[j];
			j++;
			// [Loop Continue]
			goto J0x3C;
		}
		Class'BallisticProV55.Mut_BallisticSwap'.static.SetNewWeapons(i, NewWeaps, Swaps[i].R);
		Class'BallisticProV55.Mut_BallisticSwap'.static.StaticSaveConfig();
		i++;
		// [Loop Continue]
		goto J0x14;
	}
	Class'BallisticProV55.Mut_BallisticSwap'.default.PickupChangeTime = float(nu_SwitchTime.GetValue());
	Class'BallisticProV55.Mut_BallisticSwap'.static.StaticSaveConfig();
	// End:0x10B
	if(!bDefaultsWritten)
	{
		bDefaultsWritten = true;
		SaveConfig();
	}
	//return;	
}

function DefaultSettings()
{
	local int i, j;

	cb_Presets.SetText("");
	Swaps.Length = 0;
	i = 0;
	J0x20:

	// End:0xC5 [Loop If]
	if(i < DefaultSwaps.Length)
	{
		Swaps.Length = i + 1;
		Swaps[i].R = DefaultSwaps[i].R;
		j = 0;
		J0x69:

		// End:0xBB [Loop If]
		if(j < DefaultSwaps[i].NIs.Length)
		{
			Swaps[i].NIs[j] = DefaultSwaps[i].NIs[j];
			j++;
			// [Loop Continue]
			goto J0x69;
		}
		i++;
		// [Loop Continue]
		goto J0x20;
	}
	UpdateReplacementsList(lb_OldWeapons.List.Index);
	nu_SwitchTime.SetValue(60);
	//return;	
}

defaultproperties
{
	// Reference: GUIListBox'BallisticProV55.ConfigTab_Swappings.lb_OldWeaponsList'
	begin object name="lb_OldWeaponsList" class=XInterface.GUIListBox
		bVisibleWhenEmpty=true
		OnCreateComponent=lb_OldWeaponsList.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="The original weapons. Select one to choose what replaces it"
		WinTop=0.1000000
		WinLeft=0.1000000
		WinWidth=0.3500000
		WinHeight=0.6000000
		RenderWeight=0.5200000
		TabOrder=1
	end object
	lb_OldWeapons=lb_OldWeaponsList
	// Reference: BC_GUICheckListBox'BallisticProV55.ConfigTab_Swappings.lb_NewWeaponsList'
	begin object name="lb_NewWeaponsList" class=BCoreProV55.BC_GUICheckListBox
		bVisibleWhenEmpty=true
		OnCreateComponent=lb_NewWeaponsList.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Tick the weapons that you want to replace the orignal one selected on the left."
		WinTop=0.1000000
		WinLeft=0.5500000
		WinWidth=0.3500000
		WinHeight=0.6000000
		RenderWeight=0.5200000
		TabOrder=1
	end object
	lb_NewWeapons=lb_NewWeaponsList
	// Reference: GUIImage'BallisticProV55.ConfigTab_Swappings.Box_OldImg'
	begin object name="Box_OldImg" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.0500000
		WinLeft=0.0750000
		WinWidth=0.4000000
		WinHeight=0.6750000
		RenderWeight=0.0020000
	end object
	Box_Old=Box_OldImg
	// Reference: GUIImage'BallisticProV55.ConfigTab_Swappings.Box_NewImg'
	begin object name="Box_NewImg" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.0500000
		WinLeft=0.5250000
		WinWidth=0.4000000
		WinHeight=0.6750000
		RenderWeight=0.0020000
	end object
	Box_New=Box_NewImg
	// Reference: GUIButton'BallisticProV55.ConfigTab_Swappings.AddAllButton'
	begin object name="AddAllButton" class=XInterface.GUIButton
		Caption="FILL"
		Hint="Checks all to replace the original weapon currently selected"
		WinTop=0.8000000
		WinLeft=0.5500000
		WinWidth=0.1500000
		TabOrder=0
		OnClick=ConfigTab_Swappings.InternalOnClick
		OnKeyEvent=AddAllButton.InternalOnKeyEvent
	end object
	BAddAll=AddAllButton
	// Reference: GUIButton'BallisticProV55.ConfigTab_Swappings.RemoveAllButton'
	begin object name="RemoveAllButton" class=XInterface.GUIButton
		Caption="EMPTY"
		Hint="Unchecks all to replace the original weapon currently selected"
		WinTop=0.8000000
		WinLeft=0.7500000
		WinWidth=0.1500000
		TabOrder=0
		OnClick=ConfigTab_Swappings.InternalOnClick
		OnKeyEvent=RemoveAllButton.InternalOnKeyEvent
	end object
	BRemoveAll=RemoveAllButton
	// Reference: GUIButton'BallisticProV55.ConfigTab_Swappings.BSavePresetButton'
	begin object name="BSavePresetButton" class=XInterface.GUIButton
		Caption="Save"
		Hint="Saves the current configuration as a new preset Type the name of your new preset in the preset box."
		WinTop=0.8000000
		WinLeft=0.1000000
		WinWidth=0.1500000
		TabOrder=0
		OnClick=ConfigTab_Swappings.InternalOnClick
		OnKeyEvent=BSavePresetButton.InternalOnKeyEvent
	end object
	BSavePreset=BSavePresetButton
	// Reference: GUIButton'BallisticProV55.ConfigTab_Swappings.BDeletePresetButton'
	begin object name="BDeletePresetButton" class=XInterface.GUIButton
		Caption="Delete"
		Hint="Deletes the currently selected preset."
		WinTop=0.8000000
		WinLeft=0.3000000
		WinWidth=0.1500000
		TabOrder=0
		OnClick=ConfigTab_Swappings.InternalOnClick
		OnKeyEvent=BDeletePresetButton.InternalOnKeyEvent
	end object
	BDeletePreset=BDeletePresetButton
	// Reference: moComboBox'BallisticProV55.ConfigTab_Swappings.co_PresetsCB'
	begin object name="co_PresetsCB" class=XInterface.moComboBox
		ComponentJustification=0
		CaptionWidth=0.4000000
		Caption="Presets"
		OnCreateComponent=co_PresetsCB.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Choose a preset replacements configuration, or type a new preset name here and click 'Save' to make the current configuration a new preset."
		WinTop=0.7500000
		WinLeft=0.1000000
		WinWidth=0.3500000
		OnChange=ConfigTab_Swappings.InternalOnChange
	end object
	cb_Presets=co_PresetsCB
	// Reference: moCheckBox'BallisticProV55.ConfigTab_Swappings.ch_IndependentCheck'
	begin object name="ch_IndependentCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Independent Spawning"
		OnCreateComponent=ch_IndependentCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="When several weapons replace one original, this prevents ammo and same-type weapon pickups from being forced to match each other."
		WinTop=0.7500000
		WinLeft=0.5500000
		WinWidth=0.3500000
		WinHeight=0.0400000
	end object
	ch_Independent=ch_IndependentCheck
	// Reference: moNumericEdit'BallisticProV55.ConfigTab_Swappings.nu_SwitchTimeEdit'
	begin object name="nu_SwitchTimeEdit" class=XInterface.moNumericEdit
		MinValue=1
		MaxValue=600
		Step=5
		ComponentJustification=0
		CaptionWidth=0.7000000
		Caption="Pickup Change Time"
		OnCreateComponent=nu_SwitchTimeEdit.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Specify time interval(in seconds) between weapon pickup changes. Affects situations where multiple items are set to replace one original pickup."
		WinTop=0.9000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	nu_SwitchTime=nu_SwitchTimeEdit
	// Reference: GUILabel'BallisticProV55.ConfigTab_Swappings.l_OldListlabel'
	begin object name="l_OldListlabel" class=XInterface.GUILabel
		Caption="Original Weapons"
		TextAlign=1
		TextColor=(R=255,G=255,B=255,A=255)
		WinTop=0.0500000
		WinLeft=0.0750000
		WinWidth=0.4000000
		WinHeight=0.0500000
	end object
	l_OldList=l_OldListlabel
	// Reference: GUILabel'BallisticProV55.ConfigTab_Swappings.l_NewListlabel'
	begin object name="l_NewListlabel" class=XInterface.GUILabel
		Caption="Replace with..."
		TextAlign=1
		TextColor=(R=255,G=255,B=255,A=255)
		WinTop=0.0500000
		WinLeft=0.5250000
		WinWidth=0.4000000
		WinHeight=0.0500000
	end object
	l_NewList=l_NewListlabel
	DefaultSwaps[0]=(NIs=("BallisticProV55.X3Knife","BallisticProV55.A909SkrithBlades","BallisticProV55.EKS43katana"),R=false)
	DefaultSwaps[1]=(NIs=("BallisticProV55.M806Pistol","BallisticProV55.MRT6Shotgun","BallisticProV55.A42SkrithPistol","BallisticProV55.D49Revolver","BallisticProV55.AM67Pistol","BallisticProV55.Fifty9MachinePistol","BallisticProV55.XK2SubMachinegun","BallisticProV55.RS8Pistol","BallisticProV55.XRS10Submachinegun"),R=false)
	DefaultSwaps[2]=(NIs=("BallisticProV55.NRP57Grenade","BallisticProV55.FP7Grenade","BallisticProV55.FP9Explosive","BallisticProV55.BX5Mine","BallisticProV55.T10Grenade"),R=true)
	DefaultSwaps[3]=(NIs=("BallisticProV55.M50AssaultRifle","BallisticProV55.SRS900Rifle","BallisticProV55.SARAssaultRifle"),R=false)
	DefaultSwaps[4]=(NIs=("BallisticProV55.A73SkrithRifle","BallisticProV55.HVCMk9LightningGun"),R=false)
	DefaultSwaps[5]=(NIs=("BallisticProV55.M353Machinegun","BallisticProV55.M925Machinegun","BallisticProV55.XMV850Minigun"),R=false)
	DefaultSwaps[6]=(NIs=("BallisticProV55.M763Shotgun","BallisticProV55.M290Shotgun","BallisticProV55.MRS138Shotgun"),R=false)
	DefaultSwaps[7]=(NIs=("BallisticProV55.G5Bazooka","BallisticProV55.RX22AFlamer"),R=false)
	DefaultSwaps[8]=(NIs=("BallisticProV55.R78Rifle","BallisticProV55.M75Railgun","BallisticProV55.R9RangerRifle"),R=false)
	DefaultSwaps[9]=(NIs=("BallisticProV55.M75Railgun","BallisticProV55.RX22AFlamer"),R=false)
	DefaultSwaps[10]=(NIs=("BallisticProV55.XMV850Minigun","BallisticProV55.RX22AFlamer"),R=false)
	DefaultSwaps[11]=(NIs=("BallisticProV55.M75Railgun","BallisticProV55.R78Rifle","BallisticProV55.R9RangerRifle"),R=false)
	DefaultSwaps[12]=(NIs=("BallisticProV55.G5Bazooka"),R=false)
	DefaultSwaps[13]=(NIs=("BallisticProV55.NRP57Grenade"),R=false)
	DefaultSwaps[14]=(NIs=("BallisticProV55.BX5Mine"),R=false)
	DefaultSwaps[15]=(NIs=("BallisticProV55.R78Rifle"),R=false)
	Headings[0]="Melee"
	Headings[1]="Sidearms"
	Headings[2]="Sub Machineguns"
	Headings[3]="Assault Rifles"
	Headings[4]="Energy Weapons"
	Headings[5]="Heavy Machineguns"
	Headings[6]="Shotguns"
	Headings[7]="Ordnance"
	Headings[8]="Sniper Rifles"
	Headings[9]="Grenades"
	Headings[10]="Miscellaneous"
	Headings[11]="Non-BW"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: moNumericEdit'BallisticProV55.ConfigTab_Swappings.nu_SwitchTimeEdit'
begin object name="nu_SwitchTimeEdit" class=XInterface.moNumericEdit
	MinValue=1
	MaxValue=600
	Step=5
	ComponentJustification=0
	CaptionWidth=0.7000000
	Caption="Pickup Change Time"
	OnCreateComponent=nu_SwitchTimeEdit.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Specify time interval(in seconds) between weapon pickup changes. Affects situations where multiple items are set to replace one original pickup."
	WinTop=0.9000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_Swappings.ch_IndependentCheck'
begin object name="ch_IndependentCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Independent Spawning"
	OnCreateComponent=ch_IndependentCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="When several weapons replace one original, this prevents ammo and same-type weapon pickups from being forced to match each other."
	WinTop=0.7500000
	WinLeft=0.5500000
	WinWidth=0.3500000
	WinHeight=0.0400000
end object
// Reference: moComboBox'BallisticProV55.ConfigTab_Swappings.co_PresetsCB'
begin object name="co_PresetsCB" class=XInterface.moComboBox
	ComponentJustification=0
	CaptionWidth=0.4000000
	Caption="Presets"
	OnCreateComponent=co_PresetsCB.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Choose a preset replacements configuration, or type a new preset name here and click 'Save' to make the current configuration a new preset."
	WinTop=0.7500000
	WinLeft=0.1000000
	WinWidth=0.3500000
	OnChange=ConfigTab_Swappings.InternalOnChange
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_Swappings.BDeletePresetButton'
begin object name="BDeletePresetButton" class=XInterface.GUIButton
	Caption="Delete"
	Hint="Deletes the currently selected preset."
	WinTop=0.8000000
	WinLeft=0.3000000
	WinWidth=0.1500000
	TabOrder=0
	OnClick=ConfigTab_Swappings.InternalOnClick
	OnKeyEvent=BDeletePresetButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_Swappings.BSavePresetButton'
begin object name="BSavePresetButton" class=XInterface.GUIButton
	Caption="Save"
	Hint="Saves the current configuration as a new preset Type the name of your new preset in the preset box."
	WinTop=0.8000000
	WinLeft=0.1000000
	WinWidth=0.1500000
	TabOrder=0
	OnClick=ConfigTab_Swappings.InternalOnClick
	OnKeyEvent=BSavePresetButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_Swappings.RemoveAllButton'
begin object name="RemoveAllButton" class=XInterface.GUIButton
	Caption="EMPTY"
	Hint="Unchecks all to replace the original weapon currently selected"
	WinTop=0.8000000
	WinLeft=0.7500000
	WinWidth=0.1500000
	TabOrder=0
	OnClick=ConfigTab_Swappings.InternalOnClick
	OnKeyEvent=RemoveAllButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_Swappings.AddAllButton'
begin object name="AddAllButton" class=XInterface.GUIButton
	Caption="FILL"
	Hint="Checks all to replace the original weapon currently selected"
	WinTop=0.8000000
	WinLeft=0.5500000
	WinWidth=0.1500000
	TabOrder=0
	OnClick=ConfigTab_Swappings.InternalOnClick
	OnKeyEvent=AddAllButton.InternalOnKeyEvent
end object
// Reference: BC_GUICheckListBox'BallisticProV55.ConfigTab_Swappings.lb_NewWeaponsList'
begin object name="lb_NewWeaponsList" class=BCoreProV55.BC_GUICheckListBox
	bVisibleWhenEmpty=true
	OnCreateComponent=lb_NewWeaponsList.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Tick the weapons that you want to replace the orignal one selected on the left."
	WinTop=0.1000000
	WinLeft=0.5500000
	WinWidth=0.3500000
	WinHeight=0.6000000
	RenderWeight=0.5200000
	TabOrder=1
end object
// Reference: GUIListBox'BallisticProV55.ConfigTab_Swappings.lb_OldWeaponsList'
begin object name="lb_OldWeaponsList" class=XInterface.GUIListBox
	bVisibleWhenEmpty=true
	OnCreateComponent=lb_OldWeaponsList.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="The original weapons. Select one to choose what replaces it"
	WinTop=0.1000000
	WinLeft=0.1000000
	WinWidth=0.3500000
	WinHeight=0.6000000
	RenderWeight=0.5200000
	TabOrder=1
end object
// Reference: GUIImage'BallisticProV55.ConfigTab_Swappings.Box_OldImg'
begin object name="Box_OldImg" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.0500000
	WinLeft=0.0750000
	WinWidth=0.4000000
	WinHeight=0.6750000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.ConfigTab_Swappings.Box_NewImg'
begin object name="Box_NewImg" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.0500000
	WinLeft=0.5250000
	WinWidth=0.4000000
	WinHeight=0.6750000
	RenderWeight=0.0020000
end object
// Reference: GUILabel'BallisticProV55.ConfigTab_Swappings.l_OldListlabel'
begin object name="l_OldListlabel" class=XInterface.GUILabel
	Caption="Original Weapons"
	TextAlign=1
	TextColor=(R=255,G=255,B=255,A=255)
	WinTop=0.0500000
	WinLeft=0.0750000
	WinWidth=0.4000000
	WinHeight=0.0500000
end object
// Reference: GUILabel'BallisticProV55.ConfigTab_Swappings.l_NewListlabel'
begin object name="l_NewListlabel" class=XInterface.GUILabel
	Caption="Replace with..."
	TextAlign=1
	TextColor=(R=255,G=255,B=255,A=255)
	WinTop=0.0500000
	WinLeft=0.5250000
	WinWidth=0.4000000
	WinHeight=0.0500000
end object
