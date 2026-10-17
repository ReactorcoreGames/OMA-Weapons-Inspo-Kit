class ConfigTab_Loadout extends ConfigTabBase
	config(BallisticProV55)
	editinlinenew
	instanced;

struct LoadOutBox
{
	var array<string> WeaponNames;
};

struct LOWeapInfo
{
	var string ClassName;
	var string Description;
	var Material Icon;
	var IntBox IconCoords;
	var float ReqTime;
	var float ReqFrags;
	var float ReqEff;
	var float ReqDmgRate;
	var float ReqSnprEff;
	var float ReqStgnEff;
	var float ReqHzrdEff;
};

var config bool bUseAllWeapons;
var() automated GUIImage Box_New;
var() automated GUIImage Box_WeapIcon;
var() automated GUIImage Pic_Weapon;
var() automated GUILabel l_NewList;
var() automated GUILabel l_WeapTitle;
var() automated BC_GUICheckListBox lb_NewWeapons;
var() automated GUIButton BAddAll;
var() automated GUIButton BRemoveAll;
var() automated GUIButton BBox1;
var() automated GUIButton BBox2;
var() automated GUIButton BBox3;
var() automated GUIButton BBox4;
var() automated GUIButton BBox5;
var() automated moCheckBox ch_AllWeaps;
var() automated moFloatEdit fl_RequiredTime;
var() automated moFloatEdit fl_RequiredFrags;
var() automated moFloatEdit fl_RequiredEfficiency;
var() automated moFloatEdit fl_RequiredDmgRate;
var() automated moFloatEdit fl_RequiredSnprEff;
var() automated moFloatEdit fl_RequiredStgnEff;
var() automated moFloatEdit fl_RequiredHzrdEff;
var LoadOutBox Boxes[5];
var localized string BoxNames[5];
var int SelectedBox;
var() localized string Headings[12];
var array<LOWeapInfo> WeaponInfo;

function InitializeConfigTab()
{
	lb_NewWeapons.CheckList.__OnClick__Delegate = InternalOnClick;
	lb_NewWeapons.CheckList.__OnRightClick__Delegate = InternalOnRightClick;
	ch_AllWeaps.MyCheckBox.__OnClick__Delegate = InternalOnClick;
	ch_AllWeaps.MyCheckBox.SetChecked(bUseAllWeapons);
	LoadList();
	LoadBoxesFromMutator();
	LoadBox(0);
	//return;	
}

function LoadList()
{
	local int i, j, k;
	local array<WeaponRecord> Recs;
	local string S;
	local int Index[12];
	local bool OtherLoaded, MiscLoaded;
	local WeaponInfo WI;

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
	j = 0;
	J0x19D:

	// End:0x1C7 [Loop If]
	if(j < 12)
	{
		Index[j] = j + 1;
		j++;
		// [Loop Continue]
		goto J0x19D;
	}
	WeaponInfo.Length = 0;
	Class'Engine.CacheManager'.static.GetWeaponList(Recs);
	i = 0;
	J0x1E7:

	// End:0x7FC [Loop If]
	if(i < Recs.Length)
	{
		j = InStr(Recs[i].ClassName, ".");
		// End:0x2DD
		if(j != -1)
		{
			S = Left(Recs[i].ClassName, j);
			// End:0x265
			if(!Class'BCoreProV55.BC_WeaponInfoCache'.static.IsValid(Recs[i].ClassName))
			{
				// [Explicit Continue]
				goto J0x7F2;
			}
			// End:0x2DD
			if(!bUseAllWeapons)
			{
				// End:0x2DD
				if((((InStr(S, "Ballistic") == -1) && InStr(S, "BWBP") == -1) && InStr(S, "JunkWar") == -1) && InStr(S, "JWBP") == -1)
				{
					// [Explicit Continue]
					goto J0x7F2;
				}
			}
		}
		WI = Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(Recs[i].ClassName, j);
		// End:0x319
		if(j == -1)
		{
			// [Explicit Continue]
			goto J0x7F2;
		}
		j = WeaponInfo.Length;
		WeaponInfo.Length = j + 1;
		WeaponInfo[j].Description = Recs[i].Description;
		WeaponInfo[j].ClassName = Recs[i].ClassName;
		// End:0x40E
		if(WI.bIsBW)
		{
			WeaponInfo[j].Icon = WI.BigIconMaterial;
			WeaponInfo[j].IconCoords.X1 = -1;
			WeaponInfo[j].IconCoords.X2 = -1;
			WeaponInfo[j].IconCoords.Y1 = -1;
			WeaponInfo[j].IconCoords.Y2 = -1;			
		}
		else
		{
			WeaponInfo[j].Icon = WI.SmallIconMaterial;
			WeaponInfo[j].IconCoords = WI.SmallIconCoords;
		}
		k = 0;
		J0x44B:

		// End:0x5E8 [Loop If]
		if(k < Class'BallisticProV55.Mut_Loadout'.default.items.Length)
		{
			// End:0x5DE
			if(Class'BallisticProV55.Mut_Loadout'.default.items[k].ItemName ~= Recs[i].ClassName)
			{
				WeaponInfo[j].ReqTime = Class'BallisticProV55.Mut_Loadout'.default.items[k].Requirements.MatchTime;
				WeaponInfo[j].ReqFrags = Class'BallisticProV55.Mut_Loadout'.default.items[k].Requirements.Frags;
				WeaponInfo[j].ReqEff = Class'BallisticProV55.Mut_Loadout'.default.items[k].Requirements.Efficiency;
				WeaponInfo[j].ReqDmgRate = Class'BallisticProV55.Mut_Loadout'.default.items[k].Requirements.DamageRate;
				WeaponInfo[j].ReqSnprEff = Class'BallisticProV55.Mut_Loadout'.default.items[k].Requirements.SniperEff;
				WeaponInfo[j].ReqStgnEff = Class'BallisticProV55.Mut_Loadout'.default.items[k].Requirements.ShotgunEff;
				WeaponInfo[j].ReqHzrdEff = Class'BallisticProV55.Mut_Loadout'.default.items[k].Requirements.HazardEff;
				// [Explicit Break]
				goto J0x5E8;
			}
			k++;
			// [Loop Continue]
			goto J0x44B;
		}
		J0x5E8:

		// End:0x62C
		if((k >= Class'BallisticProV55.Mut_Loadout'.default.items.Length) && WI.bIsBW)
		{
			SetDefaultRequirements(Recs[i].ClassName, j);
		}
		// End:0x7F2
		if(WI.ClassName != "")
		{
			// End:0x774
			if(WI.bIsBW)
			{
				// End:0x6EA
				if((WI.InventoryGroup > 0) && WI.InventoryGroup < 10)
				{
					lb_NewWeapons.CheckList.Insert(Index[WI.InventoryGroup - 1], Recs[i].FriendlyName,, string(j));
					j = WI.InventoryGroup - 1;
					J0x6C4:

					// End:0x6E7 [Loop If]
					if(j < 12)
					{
						Index[j]++;
						j++;
						// [Loop Continue]
						goto J0x6C4;
					}					
				}
				else
				{
					// End:0x725
					if(!MiscLoaded)
					{
						MiscLoaded = true;
						lb_NewWeapons.CheckList.Add(Headings[10],, "MISC", true);
					}
					lb_NewWeapons.CheckList.Insert(Index[10], Recs[i].FriendlyName,, string(j));
					Index[10]++;
					Index[11]++;
				}
				// [Explicit Continue]
				goto J0x7F2;
			}
			// End:0x7B0
			if(!OtherLoaded)
			{
				OtherLoaded = true;
				lb_NewWeapons.CheckList.Add(Headings[11],, "OTHER", true);
			}
			lb_NewWeapons.CheckList.Insert(Index[11], Recs[i].FriendlyName,, string(j));
			Index[11]++;
		}
		J0x7F2:

		i++;
		// [Loop Continue]
		goto J0x1E7;
	}
	Class'BCoreProV55.BC_WeaponInfoCache'.static.EndSession();
	// End:0x893
	if(((lb_NewWeapons.CheckList.Index == 0) && lb_NewWeapons.CheckList.IsSection()) || lb_NewWeapons.CheckList.Index >= lb_NewWeapons.CheckList.ItemCount)
	{
		lb_NewWeapons.CheckList.SetIndex(1);
	}
	//return;	
}

function bool SetDefaultRequirements(string ClassName, int Index)
{
	local Class<BallisticWeapon> BW;
	local string S;
	local array<string> RS;

	BW = Class<BallisticWeapon>(DynamicLoadObject(ClassName, Class'Core.Class'));
	// End:0x28
	if(BW == none)
	{
		return false;
	}
	S = BW.static.StaticGetSpecialInfo('EvoDefs');
	// End:0x50
	if(S == "")
	{
		return false;
	}
	Split(S, ";", RS);
	switch(RS.Length - 1)
	{
		// End:0x8A
		case 6:
			WeaponInfo[Index].ReqHzrdEff = float(RS[6]);
		// End:0xAA
		case 5:
			WeaponInfo[Index].ReqStgnEff = float(RS[5]);
		// End:0xCA
		case 4:
			WeaponInfo[Index].ReqSnprEff = float(RS[4]);
		// End:0xEA
		case 3:
			WeaponInfo[Index].ReqDmgRate = float(RS[3]);
		// End:0x10A
		case 2:
			WeaponInfo[Index].ReqEff = float(RS[2]);
		// End:0x128
		case 1:
			WeaponInfo[Index].ReqFrags = float(RS[1]);
		// End:0x146
		case 0:
			WeaponInfo[Index].ReqTime = float(RS[0]);
		// End:0xFFFF
		default:
			return true;
			break;
	}
	//return;	
}

function LoadBoxesFromMutator()
{
	local int i, j, k;

	i = 0;
	J0x07:

	// End:0xAC [Loop If]
	if(i < Class'BallisticProV55.Mut_Loadout'.default.items.Length)
	{
		j = 0;
		J0x27:

		// End:0xA2 [Loop If]
		if(j < 5)
		{
			// End:0x98
			if((Class'BallisticProV55.Mut_Loadout'.default.items[i].Groups & (1 << j)) > 0)
			{
				Boxes[j].WeaponNames[Boxes[j].WeaponNames.Length] = Class'BallisticProV55.Mut_Loadout'.default.items[i].ItemName;
			}
			j++;
			// [Loop Continue]
			goto J0x27;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0xB3:

	// End:0x172 [Loop If]
	if(i < 5)
	{
		j = 0;
		J0xC6:

		// End:0x168 [Loop If]
		if(j < Boxes[i].WeaponNames.Length)
		{
			k = 0;
			J0xE8:

			// End:0x130 [Loop If]
			if(k < WeaponInfo.Length)
			{
				// End:0x126
				if(Boxes[i].WeaponNames[j] ~= WeaponInfo[k].ClassName)
				{
					// [Explicit Break]
					goto J0x130;
				}
				k++;
				// [Loop Continue]
				goto J0xE8;
			}
			J0x130:

			// End:0x15E
			if(k >= WeaponInfo.Length)
			{
				Boxes[i].WeaponNames.Remove(j, 1);
				j--;
			}
			j++;
			// [Loop Continue]
			goto J0xC6;
		}
		i++;
		// [Loop Continue]
		goto J0xB3;
	}
	//return;	
}

function SaveBoxesToMutator()
{
	local int i, j, k, L, Groups;

	i = 0;
	J0x07:

	// End:0x47 [Loop If]
	if(i < 5)
	{
		// End:0x3D
		if(Boxes[i].WeaponNames.Length < 1)
		{
			Boxes[i].WeaponNames.Length = 1;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0x4E:

	// End:0x333 [Loop If]
	if(i < WeaponInfo.Length)
	{
		// End:0x78
		if(WeaponInfo[i].ClassName == "")
		{
			// [Explicit Continue]
			goto J0x329;
		}
		j = 0;
		J0x7F:

		// End:0x104 [Loop If]
		if(j < 5)
		{
			k = 0;
			J0x92:

			// End:0xFA [Loop If]
			if(k < Boxes[j].WeaponNames.Length)
			{
				// End:0xF0
				if(Boxes[j].WeaponNames[k] ~= WeaponInfo[i].ClassName)
				{
					Groups = Groups | (1 << j);
					// [Explicit Break]
					goto J0xFA;
				}
				k++;
				// [Loop Continue]
				goto J0x92;
			}
			J0xFA:

			j++;
			// [Loop Continue]
			goto J0x7F;
		}
		L = 0;
		J0x10B:

		// End:0x15F [Loop If]
		if(L < Class'BallisticProV55.Mut_Loadout'.default.items.Length)
		{
			// End:0x155
			if(Class'BallisticProV55.Mut_Loadout'.default.items[L].ItemName ~= WeaponInfo[i].ClassName)
			{
				// [Explicit Break]
				goto J0x15F;
			}
			L++;
			// [Loop Continue]
			goto J0x10B;
		}
		J0x15F:

		// End:0x190
		if(L >= Class'BallisticProV55.Mut_Loadout'.default.items.Length)
		{
			Class'BallisticProV55.Mut_Loadout'.default.items.Length = L + 1;
		}
		Class'BallisticProV55.Mut_Loadout'.default.items[L].ItemName = WeaponInfo[i].ClassName;
		Class'BallisticProV55.Mut_Loadout'.default.items[L].Groups = Groups;
		Class'BallisticProV55.Mut_Loadout'.default.items[L].Requirements.MatchTime = WeaponInfo[i].ReqTime;
		Class'BallisticProV55.Mut_Loadout'.default.items[L].Requirements.Frags = WeaponInfo[i].ReqFrags;
		Class'BallisticProV55.Mut_Loadout'.default.items[L].Requirements.Efficiency = WeaponInfo[i].ReqEff;
		Class'BallisticProV55.Mut_Loadout'.default.items[L].Requirements.DamageRate = WeaponInfo[i].ReqDmgRate;
		Class'BallisticProV55.Mut_Loadout'.default.items[L].Requirements.SniperEff = WeaponInfo[i].ReqSnprEff;
		Class'BallisticProV55.Mut_Loadout'.default.items[L].Requirements.ShotgunEff = WeaponInfo[i].ReqStgnEff;
		Class'BallisticProV55.Mut_Loadout'.default.items[L].Requirements.HazardEff = WeaponInfo[i].ReqHzrdEff;
		Groups = 0;
		J0x329:

		i++;
		// [Loop Continue]
		goto J0x4E;
	}
	Class'BallisticProV55.Mut_Loadout'.static.StaticSaveConfig();
	//return;	
}

function LoadBox(int BoxNum)
{
	local int i, j, WatchedSection;

	SelectedBox = BoxNum;
	WatchedSection = -1;
	i = 0;
	J0x1D:

	// End:0x199 [Loop If]
	if(i < lb_NewWeapons.CheckList.Elements.Length)
	{
		lb_NewWeapons.CheckList.SetChecked(i, false);
		// End:0xD2
		if(lb_NewWeapons.CheckList.Elements[i].bSection)
		{
			// End:0xC4
			if((WatchedSection > -1) && (i - WatchedSection) > 1)
			{
				lb_NewWeapons.CheckList.SetChecked(WatchedSection, true);
			}
			WatchedSection = i;
			// [Explicit Continue]
			goto J0x18F;
		}
		j = 0;
		J0xD9:

		// End:0x169 [Loop If]
		if(j < Boxes[BoxNum].WeaponNames.Length)
		{
			// End:0x15F
			if(Boxes[BoxNum].WeaponNames[j] ~= WeaponInfo[int(lb_NewWeapons.CheckList.Elements[i].ExtraStrData)].ClassName)
			{
				lb_NewWeapons.CheckList.SetChecked(i, true);
				// [Explicit Break]
				goto J0x169;
			}
			j++;
			// [Loop Continue]
			goto J0xD9;
		}
		J0x169:

		// End:0x18F
		if(j >= Boxes[BoxNum].WeaponNames.Length)
		{
			WatchedSection = -1;
		}
		J0x18F:

		i++;
		// [Loop Continue]
		goto J0x1D;
	}
	// End:0x1ED
	if((WatchedSection > -1) && WatchedSection != (lb_NewWeapons.CheckList.Elements.Length - 1))
	{
		lb_NewWeapons.CheckList.SetChecked(WatchedSection, true);
	}
	// End:0x315
	if(!lb_NewWeapons.List.IsSection() && bInitialized)
	{
		i = int(lb_NewWeapons.List.GetExtra());
		WeaponInfo[i].ReqTime = fl_RequiredTime.GetValue();
		WeaponInfo[i].ReqFrags = fl_RequiredFrags.GetValue();
		WeaponInfo[i].ReqEff = fl_RequiredEfficiency.GetValue();
		WeaponInfo[i].ReqDmgRate = fl_RequiredDmgRate.GetValue();
		WeaponInfo[i].ReqSnprEff = fl_RequiredSnprEff.GetValue();
		WeaponInfo[i].ReqStgnEff = fl_RequiredStgnEff.GetValue();
		WeaponInfo[i].ReqHzrdEff = fl_RequiredHzrdEff.GetValue();
	}
	l_NewList.Caption = BoxNames[BoxNum];
	// End:0x3CF
	if(!lb_NewWeapons.CheckList.IsValid())
	{
		i = 0;
		J0x353:

		// End:0x3C6 [Loop If]
		if(i < lb_NewWeapons.CheckList.ItemCount)
		{
			// End:0x3BC
			if(!lb_NewWeapons.CheckList.Elements[i].bSection)
			{
				lb_NewWeapons.CheckList.SetIndex(i);
				// [Explicit Break]
				goto J0x3C6;
			}
			i++;
			// [Loop Continue]
			goto J0x353;
		}
		J0x3C6:

		DisplayWeapon();		
	}
	else
	{
		// End:0x3E0
		if(!bInitialized)
		{
			DisplayWeapon();
		}
	}
	//return;	
}

function DisplayWeapon()
{
	local int i;

	// End:0x1D
	if(lb_NewWeapons.List.IsSection())
	{
		return;
	}
	l_WeapTitle.Caption = lb_NewWeapons.List.Get();
	i = int(lb_NewWeapons.List.GetExtra());
	Pic_Weapon.Image = WeaponInfo[i].Icon;
	Pic_Weapon.X1 = WeaponInfo[i].IconCoords.X1;
	Pic_Weapon.X2 = WeaponInfo[i].IconCoords.X2;
	Pic_Weapon.Y1 = WeaponInfo[i].IconCoords.Y1;
	Pic_Weapon.Y2 = WeaponInfo[i].IconCoords.Y2;
	fl_RequiredTime.SetValue(WeaponInfo[i].ReqTime);
	fl_RequiredFrags.SetValue(WeaponInfo[i].ReqFrags);
	fl_RequiredEfficiency.SetValue(WeaponInfo[i].ReqEff);
	fl_RequiredDmgRate.SetValue(WeaponInfo[i].ReqDmgRate);
	fl_RequiredSnprEff.SetValue(WeaponInfo[i].ReqSnprEff);
	fl_RequiredStgnEff.SetValue(WeaponInfo[i].ReqStgnEff);
	fl_RequiredHzrdEff.SetValue(WeaponInfo[i].ReqHzrdEff);
	//return;	
}

function SectionCheck(bool bChecked, int Index)
{
	local int i, j;

	j = Index + 1;
	J0x0E:

	// End:0x20B [Loop If]
	if(j < lb_NewWeapons.CheckList.Elements.Length)
	{
		// End:0x58
		if(lb_NewWeapons.CheckList.Elements[j].bSection)
		{
			return;
		}
		lb_NewWeapons.CheckList.SetChecked(j, bChecked);
		// End:0x16D
		if(bChecked)
		{
			i = 0;
			J0x8B:

			// End:0xFD [Loop If]
			if(i < Boxes[SelectedBox].WeaponNames.Length)
			{
				// End:0xF3
				if(Boxes[SelectedBox].WeaponNames[i] ~= WeaponInfo[int(lb_NewWeapons.CheckList.Elements[j].ExtraStrData)].ClassName)
				{
					// [Explicit Break]
					goto J0xFD;
				}
				i++;
				// [Loop Continue]
				goto J0x8B;
			}
			J0xFD:

			// End:0x16A
			if(i >= Boxes[SelectedBox].WeaponNames.Length)
			{
				Boxes[SelectedBox].WeaponNames[Boxes[SelectedBox].WeaponNames.Length] = WeaponInfo[int(lb_NewWeapons.CheckList.Elements[j].ExtraStrData)].ClassName;
			}
			// [Explicit Continue]
			goto J0x201;
		}
		i = 0;
		J0x174:

		// End:0x201 [Loop If]
		if(i < Boxes[SelectedBox].WeaponNames.Length)
		{
			// End:0x1F7
			if(Boxes[SelectedBox].WeaponNames[i] ~= WeaponInfo[int(lb_NewWeapons.CheckList.Elements[j].ExtraStrData)].ClassName)
			{
				Boxes[SelectedBox].WeaponNames.Remove(i, 1);
				i--;
			}
			i++;
			// [Loop Continue]
			goto J0x174;
		}
		J0x201:

		j++;
		// [Loop Continue]
		goto J0x0E;
	}
	//return;	
}

function bool InternalOnClick(GUIComponent Sender)
{
	local int i, j;

	// End:0x3D7
	if(Sender == lb_NewWeapons.CheckList)
	{
		// End:0x135
		if(!lb_NewWeapons.List.IsSection())
		{
			i = int(lb_NewWeapons.List.GetExtra());
			WeaponInfo[i].ReqTime = fl_RequiredTime.GetValue();
			WeaponInfo[i].ReqFrags = fl_RequiredFrags.GetValue();
			WeaponInfo[i].ReqEff = fl_RequiredEfficiency.GetValue();
			WeaponInfo[i].ReqDmgRate = fl_RequiredDmgRate.GetValue();
			WeaponInfo[i].ReqSnprEff = fl_RequiredSnprEff.GetValue();
			WeaponInfo[i].ReqStgnEff = fl_RequiredStgnEff.GetValue();
			WeaponInfo[i].ReqHzrdEff = fl_RequiredHzrdEff.GetValue();
		}
		lb_NewWeapons.CheckList.InternalOnClick(Sender);
		// End:0x3D4
		if(lb_NewWeapons.CheckList.LastClickWasCheck)
		{
			// End:0x1F9
			if(lb_NewWeapons.CheckList.Elements[lb_NewWeapons.CheckList.LastCheckChanged].bSection)
			{
				SectionCheck(int(lb_NewWeapons.CheckList.Checks[lb_NewWeapons.CheckList.LastCheckChanged]) > 0, lb_NewWeapons.CheckList.LastCheckChanged);				
			}
			else
			{
				// End:0x333
				if(int(lb_NewWeapons.CheckList.Checks[lb_NewWeapons.CheckList.LastCheckChanged]) > 0)
				{
					i = 0;
					J0x237:

					// End:0x2B6 [Loop If]
					if(i < Boxes[SelectedBox].WeaponNames.Length)
					{
						// End:0x2AC
						if(Boxes[SelectedBox].WeaponNames[i] ~= WeaponInfo[int(lb_NewWeapons.List.GetExtraAtIndex(lb_NewWeapons.CheckList.LastCheckChanged))].ClassName)
						{
							// [Explicit Break]
							goto J0x2B6;
						}
						i++;
						// [Loop Continue]
						goto J0x237;
					}
					J0x2B6:

					// End:0x330
					if(i >= Boxes[SelectedBox].WeaponNames.Length)
					{
						Boxes[SelectedBox].WeaponNames[Boxes[SelectedBox].WeaponNames.Length] = WeaponInfo[int(lb_NewWeapons.List.GetExtraAtIndex(lb_NewWeapons.CheckList.LastCheckChanged))].ClassName;
					}					
				}
				else
				{
					i = 0;
					J0x33A:

					// End:0x3D4 [Loop If]
					if(i < Boxes[SelectedBox].WeaponNames.Length)
					{
						// End:0x3CA
						if(Boxes[SelectedBox].WeaponNames[i] ~= WeaponInfo[int(lb_NewWeapons.List.GetExtraAtIndex(lb_NewWeapons.CheckList.LastCheckChanged))].ClassName)
						{
							Boxes[SelectedBox].WeaponNames.Remove(i, 1);
							i--;
						}
						i++;
						// [Loop Continue]
						goto J0x33A;
					}
				}
			}
		}		
	}
	else
	{
		// End:0x4C7
		if(Sender == BAddAll)
		{
			Boxes[SelectedBox].WeaponNames.Length = 0;
			j = 0;
			J0x400:

			// End:0x4C4 [Loop If]
			if(j < lb_NewWeapons.CheckList.Elements.Length)
			{
				lb_NewWeapons.CheckList.SetChecked(j, true);
				// End:0x4BA
				if(!lb_NewWeapons.CheckList.Elements[j].bSection)
				{
					Boxes[SelectedBox].WeaponNames[Boxes[SelectedBox].WeaponNames.Length] = WeaponInfo[int(lb_NewWeapons.CheckList.Elements[j].ExtraStrData)].ClassName;
				}
				j++;
				// [Loop Continue]
				goto J0x400;
			}			
		}
		else
		{
			// End:0x53D
			if(Sender == BRemoveAll)
			{
				Boxes[SelectedBox].WeaponNames.Length = 0;
				j = 0;
				J0x4F0:

				// End:0x53A [Loop If]
				if(j < lb_NewWeapons.CheckList.Elements.Length)
				{
					lb_NewWeapons.CheckList.SetChecked(j, false);
					j++;
					// [Loop Continue]
					goto J0x4F0;
				}				
			}
			else
			{
				// End:0x556
				if(Sender == BBox1)
				{
					LoadBox(0);					
				}
				else
				{
					// End:0x56F
					if(Sender == BBox2)
					{
						LoadBox(1);						
					}
					else
					{
						// End:0x589
						if(Sender == BBox3)
						{
							LoadBox(2);							
						}
						else
						{
							// End:0x5A3
							if(Sender == BBox4)
							{
								LoadBox(3);								
							}
							else
							{
								// End:0x5BD
								if(Sender == BBox5)
								{
									LoadBox(4);									
								}
								else
								{
									// End:0x64B
									if(Sender == ch_AllWeaps.MyCheckBox)
									{
										ch_AllWeaps.MyCheckBox.InternalOnClick(Sender);
										bUseAllWeapons = ch_AllWeaps.IsChecked();
										lb_NewWeapons.CheckList.Clear();
										lb_NewWeapons.CheckList.Checks.Length = 0;
										LoadList();
										LoadBox(SelectedBox);
									}
								}
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

function bool InternalOnRightClick(GUIComponent Sender)
{
	local int i;

	// End:0x175
	if(Sender == lb_NewWeapons.CheckList)
	{
		// End:0x135
		if(!lb_NewWeapons.List.IsSection())
		{
			i = int(lb_NewWeapons.List.GetExtra());
			WeaponInfo[i].ReqTime = fl_RequiredTime.GetValue();
			WeaponInfo[i].ReqFrags = fl_RequiredFrags.GetValue();
			WeaponInfo[i].ReqEff = fl_RequiredEfficiency.GetValue();
			WeaponInfo[i].ReqDmgRate = fl_RequiredDmgRate.GetValue();
			WeaponInfo[i].ReqSnprEff = fl_RequiredSnprEff.GetValue();
			WeaponInfo[i].ReqStgnEff = fl_RequiredStgnEff.GetValue();
			WeaponInfo[i].ReqHzrdEff = fl_RequiredHzrdEff.GetValue();
		}
		lb_NewWeapons.CheckList.InternalOnClick(Sender);
		// End:0x175
		if(!lb_NewWeapons.CheckList.IsSection())
		{
			DisplayWeapon();
		}
	}
	return true;
	//return;	
}

function LoadSettings()
{
	LoadBoxesFromMutator();
	LoadBox(SelectedBox);
	//return;	
}

function SaveSettings()
{
	local int i;

	// End:0x0D
	if(!bInitialized)
	{
		return;
	}
	// End:0x12A
	if(!lb_NewWeapons.List.IsSection())
	{
		i = int(lb_NewWeapons.List.GetExtra());
		WeaponInfo[i].ReqTime = fl_RequiredTime.GetValue();
		WeaponInfo[i].ReqFrags = fl_RequiredFrags.GetValue();
		WeaponInfo[i].ReqEff = fl_RequiredEfficiency.GetValue();
		WeaponInfo[i].ReqDmgRate = fl_RequiredDmgRate.GetValue();
		WeaponInfo[i].ReqSnprEff = fl_RequiredSnprEff.GetValue();
		WeaponInfo[i].ReqStgnEff = fl_RequiredStgnEff.GetValue();
		WeaponInfo[i].ReqHzrdEff = fl_RequiredHzrdEff.GetValue();
	}
	SaveBoxesToMutator();
	SaveConfig();
	//return;	
}

function DefaultSettings()
{
	Class'BallisticProV55.Mut_Loadout'.static.ResetConfig("Items");
	LoadBoxesFromMutator();
	bInitialized = false;
	LoadBox(SelectedBox);
	bInitialized = true;
	//return;	
}

defaultproperties
{
	// Reference: GUIImage'BallisticProV55.ConfigTab_Loadout.Box_NewImg'
	begin object name="Box_NewImg" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.0500000
		WinLeft=0.5250000
		WinWidth=0.4500000
		WinHeight=0.8000000
		RenderWeight=0.0020000
	end object
	Box_New=Box_NewImg
	// Reference: GUIImage'BallisticProV55.ConfigTab_Loadout.Box_WeapIconImg'
	begin object name="Box_WeapIconImg" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.0500000
		WinLeft=0.0250000
		WinWidth=0.4500000
		WinHeight=0.8000000
		RenderWeight=0.0020000
	end object
	Box_WeapIcon=Box_WeapIconImg
	// Reference: GUIImage'BallisticProV55.ConfigTab_Loadout.Pic_WeaponImg'
	begin object name="Pic_WeaponImg" class=XInterface.GUIImage
		ImageStyle=2
		WinTop=0.0900000
		WinLeft=0.0400000
		WinWidth=0.4200000
		WinHeight=0.2790000
		RenderWeight=0.0040000
	end object
	Pic_Weapon=Pic_WeaponImg
	// Reference: GUILabel'BallisticProV55.ConfigTab_Loadout.l_NewListlabel'
	begin object name="l_NewListlabel" class=XInterface.GUILabel
		Caption="Weapons"
		TextAlign=1
		TextColor=(R=255,G=255,B=255,A=255)
		WinTop=0.0500000
		WinLeft=0.5250000
		WinWidth=0.4500000
		WinHeight=0.0500000
	end object
	l_NewList=l_NewListlabel
	// Reference: GUILabel'BallisticProV55.ConfigTab_Loadout.l_WeapTitlelabel'
	begin object name="l_WeapTitlelabel" class=XInterface.GUILabel
		TextAlign=1
		TextColor=(R=255,G=255,B=255,A=255)
		WinTop=0.0500000
		WinLeft=0.0350000
		WinWidth=0.4300000
		WinHeight=0.0500000
	end object
	l_WeapTitle=l_WeapTitlelabel
	// Reference: BC_GUICheckListBox'BallisticProV55.ConfigTab_Loadout.lb_NewWeaponsList'
	begin object name="lb_NewWeaponsList" class=BCoreProV55.BC_GUICheckListBox
		bVisibleWhenEmpty=true
		OnCreateComponent=lb_NewWeaponsList.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Tick the weapons that you want in the chosen loadout box."
		WinTop=0.1000000
		WinLeft=0.5500000
		WinWidth=0.4000000
		WinHeight=0.7400000
		RenderWeight=0.5200000
		TabOrder=1
	end object
	lb_NewWeapons=lb_NewWeaponsList
	// Reference: GUIButton'BallisticProV55.ConfigTab_Loadout.AddAllButton'
	begin object name="AddAllButton" class=XInterface.GUIButton
		Caption="ALL"
		Hint="Checks all to replace the original weapon currently selected"
		WinTop=0.8500000
		WinLeft=0.5800000
		WinWidth=0.1500000
		TabOrder=0
		OnClick=ConfigTab_Loadout.InternalOnClick
		OnKeyEvent=AddAllButton.InternalOnKeyEvent
	end object
	BAddAll=AddAllButton
	// Reference: GUIButton'BallisticProV55.ConfigTab_Loadout.RemoveAllButton'
	begin object name="RemoveAllButton" class=XInterface.GUIButton
		Caption="NONE"
		Hint="Unchecks all to replace the original weapon currently selected"
		WinTop=0.8500000
		WinLeft=0.7800000
		WinWidth=0.1500000
		TabOrder=0
		OnClick=ConfigTab_Loadout.InternalOnClick
		OnKeyEvent=RemoveAllButton.InternalOnKeyEvent
	end object
	BRemoveAll=RemoveAllButton
	// Reference: GUIButton'BallisticProV55.ConfigTab_Loadout.BBox1Button'
	begin object name="BBox1Button" class=XInterface.GUIButton
		Caption="Melee"
		Hint="View the list of weapons in the 'Melee' box"
		WinTop=0.9500000
		WinLeft=0.0250000
		WinWidth=0.1500000
		TabOrder=0
		OnClick=ConfigTab_Loadout.InternalOnClick
		OnKeyEvent=BBox1Button.InternalOnKeyEvent
	end object
	BBox1=BBox1Button
	// Reference: GUIButton'BallisticProV55.ConfigTab_Loadout.BBox2Button'
	begin object name="BBox2Button" class=XInterface.GUIButton
		Caption="Sidearm"
		Hint="View the list of weapons in the 'Sidearm' box"
		WinTop=0.9500000
		WinLeft=0.2250000
		WinWidth=0.1500000
		TabOrder=0
		OnClick=ConfigTab_Loadout.InternalOnClick
		OnKeyEvent=BBox2Button.InternalOnKeyEvent
	end object
	BBox2=BBox2Button
	// Reference: GUIButton'BallisticProV55.ConfigTab_Loadout.BBox3Button'
	begin object name="BBox3Button" class=XInterface.GUIButton
		Caption="Primary"
		Hint="View the list of weapons in the 'Primary' box"
		WinTop=0.9500000
		WinLeft=0.4250000
		WinWidth=0.1500000
		TabOrder=0
		OnClick=ConfigTab_Loadout.InternalOnClick
		OnKeyEvent=BBox3Button.InternalOnKeyEvent
	end object
	BBox3=BBox3Button
	// Reference: GUIButton'BallisticProV55.ConfigTab_Loadout.BBox4Button'
	begin object name="BBox4Button" class=XInterface.GUIButton
		Caption="Secondary"
		Hint="View the list of weapons in the 'Secondary' box"
		WinTop=0.9500000
		WinLeft=0.6250000
		WinWidth=0.1500000
		TabOrder=0
		OnClick=ConfigTab_Loadout.InternalOnClick
		OnKeyEvent=BBox4Button.InternalOnKeyEvent
	end object
	BBox4=BBox4Button
	// Reference: GUIButton'BallisticProV55.ConfigTab_Loadout.BBox5Button'
	begin object name="BBox5Button" class=XInterface.GUIButton
		Caption="Grenade"
		Hint="View the list of weapons in the 'Grenade' box"
		WinTop=0.9500000
		WinLeft=0.8250000
		WinWidth=0.1500000
		TabOrder=0
		OnClick=ConfigTab_Loadout.InternalOnClick
		OnKeyEvent=BBox5Button.InternalOnKeyEvent
	end object
	BBox5=BBox5Button
	// Reference: moCheckBox'BallisticProV55.ConfigTab_Loadout.ch_AllWeapsCheck'
	begin object name="ch_AllWeapsCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Use All Weapons"
		OnCreateComponent=ch_AllWeapsCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Enable non BW weapons in the list."
		WinTop=0.8500000
		WinLeft=0.0250000
		WinWidth=0.4500000
		WinHeight=0.0400000
	end object
	ch_AllWeaps=ch_AllWeapsCheck
	// Reference: moFloatEdit'BallisticProV55.ConfigTab_Loadout.RequirementTimeEdit'
	begin object name="RequirementTimeEdit" class=XInterface.moFloatEdit
		MinValue=0.0000000
		MaxValue=999999.0000000
		ComponentJustification=0
		CaptionWidth=0.4000000
		Caption="Time"
		OnCreateComponent=RequirementTimeEdit.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="How much match time must have passed for this weapon to be available (simply delays availability)"
		WinTop=0.3500000
		WinLeft=0.0400000
		WinWidth=0.4200000
		WinHeight=0.0400000
	end object
	fl_RequiredTime=RequirementTimeEdit
	// Reference: moFloatEdit'BallisticProV55.ConfigTab_Loadout.RequirementFragsEdit'
	begin object name="RequirementFragsEdit" class=XInterface.moFloatEdit
		MaxValue=999999.0000000
		ComponentJustification=0
		CaptionWidth=0.4000000
		Caption="Frags"
		OnCreateComponent=RequirementFragsEdit.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Mimimum frags required to choose this weapon (benefit by killing lots)"
		WinTop=0.4000000
		WinLeft=0.0400000
		WinWidth=0.4200000
		WinHeight=0.0400000
	end object
	fl_RequiredFrags=RequirementFragsEdit
	// Reference: moFloatEdit'BallisticProV55.ConfigTab_Loadout.RequirementEffEdit'
	begin object name="RequirementEffEdit" class=XInterface.moFloatEdit
		MaxValue=999999.0000000
		ComponentJustification=0
		CaptionWidth=0.4000000
		Caption="Efficiency"
		OnCreateComponent=RequirementEffEdit.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Frags divided by Deaths efficiency required to access this weapon (benefit by not wasting lives)"
		WinTop=0.4500000
		WinLeft=0.0400000
		WinWidth=0.4200000
		WinHeight=0.0400000
	end object
	fl_RequiredEfficiency=RequirementEffEdit
	// Reference: moFloatEdit'BallisticProV55.ConfigTab_Loadout.RequirementDmgRtEdit'
	begin object name="RequirementDmgRtEdit" class=XInterface.moFloatEdit
		MaxValue=999999.0000000
		ComponentJustification=0
		CaptionWidth=0.4000000
		Caption="DamageRate"
		OnCreateComponent=RequirementDmgRtEdit.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Damage Inflicted divided by Kills. How much the player has contibuted to kills (benfit by targeting strong players)"
		WinTop=0.5000000
		WinLeft=0.0400000
		WinWidth=0.4200000
		WinHeight=0.0400000
	end object
	fl_RequiredDmgRate=RequirementDmgRtEdit
	// Reference: moFloatEdit'BallisticProV55.ConfigTab_Loadout.fl_RequiredSnprEffEdit'
	begin object name="fl_RequiredSnprEffEdit" class=XInterface.moFloatEdit
		MaxValue=999999.0000000
		ComponentJustification=0
		CaptionWidth=0.4000000
		Caption="Sniper Eff"
		OnCreateComponent=RequirementDmgRtEdit.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Headshot kills divided by deaths. How efficient the player is at headshots (benfit by getting headshots and avoiding death)"
		WinTop=0.5500000
		WinLeft=0.0400000
		WinWidth=0.4200000
		WinHeight=0.0400000
	end object
	fl_RequiredSnprEff=fl_RequiredSnprEffEdit
	// Reference: moFloatEdit'BallisticProV55.ConfigTab_Loadout.fl_RequiredStgnEffEdit'
	begin object name="fl_RequiredStgnEffEdit" class=XInterface.moFloatEdit
		MaxValue=999999.0000000
		ComponentJustification=0
		CaptionWidth=0.4000000
		Caption="Shotgun Eff"
		OnCreateComponent=RequirementDmgRtEdit.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Gun kills divided by range and deaths. How efficient the player is at close combat with guns (benefit by using guns close up and avoiding death)"
		WinTop=0.6000000
		WinLeft=0.0400000
		WinWidth=0.4200000
		WinHeight=0.0400000
	end object
	fl_RequiredStgnEff=fl_RequiredStgnEffEdit
	// Reference: moFloatEdit'BallisticProV55.ConfigTab_Loadout.fl_RequiredHzrdEffEdit'
	begin object name="fl_RequiredHzrdEffEdit" class=XInterface.moFloatEdit
		MaxValue=999999.0000000
		ComponentJustification=0
		CaptionWidth=0.4000000
		Caption="Hazard Eff"
		OnCreateComponent=RequirementDmgRtEdit.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Kills minus deaths with traps and hazardous weapons divided by deaths. (benfit by killing with hazardous weapons and avoiding death)"
		WinTop=0.6500000
		WinLeft=0.0400000
		WinWidth=0.4200000
		WinHeight=0.0400000
	end object
	fl_RequiredHzrdEff=fl_RequiredHzrdEffEdit
	BoxNames[0]="Melee"
	BoxNames[1]="Sidearm"
	BoxNames[2]="Primary"
	BoxNames[3]="Secondary"
	BoxNames[4]="Grenade"
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
// Reference: moFloatEdit'BallisticProV55.ConfigTab_Loadout.RequirementDmgRtEdit'
begin object name="RequirementDmgRtEdit" class=XInterface.moFloatEdit
	MaxValue=999999.0000000
	ComponentJustification=0
	CaptionWidth=0.4000000
	Caption="DamageRate"
	OnCreateComponent=RequirementDmgRtEdit.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Damage Inflicted divided by Kills. How much the player has contibuted to kills (benfit by targeting strong players)"
	WinTop=0.5000000
	WinLeft=0.0400000
	WinWidth=0.4200000
	WinHeight=0.0400000
end object
// Reference: moFloatEdit'BallisticProV55.ConfigTab_Loadout.RequirementEffEdit'
begin object name="RequirementEffEdit" class=XInterface.moFloatEdit
	MaxValue=999999.0000000
	ComponentJustification=0
	CaptionWidth=0.4000000
	Caption="Efficiency"
	OnCreateComponent=RequirementEffEdit.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Frags divided by Deaths efficiency required to access this weapon (benefit by not wasting lives)"
	WinTop=0.4500000
	WinLeft=0.0400000
	WinWidth=0.4200000
	WinHeight=0.0400000
end object
// Reference: moFloatEdit'BallisticProV55.ConfigTab_Loadout.RequirementFragsEdit'
begin object name="RequirementFragsEdit" class=XInterface.moFloatEdit
	MaxValue=999999.0000000
	ComponentJustification=0
	CaptionWidth=0.4000000
	Caption="Frags"
	OnCreateComponent=RequirementFragsEdit.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Mimimum frags required to choose this weapon (benefit by killing lots)"
	WinTop=0.4000000
	WinLeft=0.0400000
	WinWidth=0.4200000
	WinHeight=0.0400000
end object
// Reference: moFloatEdit'BallisticProV55.ConfigTab_Loadout.RequirementTimeEdit'
begin object name="RequirementTimeEdit" class=XInterface.moFloatEdit
	MinValue=0.0000000
	MaxValue=999999.0000000
	ComponentJustification=0
	CaptionWidth=0.4000000
	Caption="Time"
	OnCreateComponent=RequirementTimeEdit.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="How much match time must have passed for this weapon to be available (simply delays availability)"
	WinTop=0.3500000
	WinLeft=0.0400000
	WinWidth=0.4200000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_Loadout.ch_AllWeapsCheck'
begin object name="ch_AllWeapsCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Use All Weapons"
	OnCreateComponent=ch_AllWeapsCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Enable non BW weapons in the list."
	WinTop=0.8500000
	WinLeft=0.0250000
	WinWidth=0.4500000
	WinHeight=0.0400000
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_Loadout.BBox5Button'
begin object name="BBox5Button" class=XInterface.GUIButton
	Caption="Grenade"
	Hint="View the list of weapons in the 'Grenade' box"
	WinTop=0.9500000
	WinLeft=0.8250000
	WinWidth=0.1500000
	TabOrder=0
	OnClick=ConfigTab_Loadout.InternalOnClick
	OnKeyEvent=BBox5Button.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_Loadout.BBox4Button'
begin object name="BBox4Button" class=XInterface.GUIButton
	Caption="Secondary"
	Hint="View the list of weapons in the 'Secondary' box"
	WinTop=0.9500000
	WinLeft=0.6250000
	WinWidth=0.1500000
	TabOrder=0
	OnClick=ConfigTab_Loadout.InternalOnClick
	OnKeyEvent=BBox4Button.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_Loadout.BBox3Button'
begin object name="BBox3Button" class=XInterface.GUIButton
	Caption="Primary"
	Hint="View the list of weapons in the 'Primary' box"
	WinTop=0.9500000
	WinLeft=0.4250000
	WinWidth=0.1500000
	TabOrder=0
	OnClick=ConfigTab_Loadout.InternalOnClick
	OnKeyEvent=BBox3Button.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_Loadout.BBox2Button'
begin object name="BBox2Button" class=XInterface.GUIButton
	Caption="Sidearm"
	Hint="View the list of weapons in the 'Sidearm' box"
	WinTop=0.9500000
	WinLeft=0.2250000
	WinWidth=0.1500000
	TabOrder=0
	OnClick=ConfigTab_Loadout.InternalOnClick
	OnKeyEvent=BBox2Button.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_Loadout.BBox1Button'
begin object name="BBox1Button" class=XInterface.GUIButton
	Caption="Melee"
	Hint="View the list of weapons in the 'Melee' box"
	WinTop=0.9500000
	WinLeft=0.0250000
	WinWidth=0.1500000
	TabOrder=0
	OnClick=ConfigTab_Loadout.InternalOnClick
	OnKeyEvent=BBox1Button.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_Loadout.RemoveAllButton'
begin object name="RemoveAllButton" class=XInterface.GUIButton
	Caption="NONE"
	Hint="Unchecks all to replace the original weapon currently selected"
	WinTop=0.8500000
	WinLeft=0.7800000
	WinWidth=0.1500000
	TabOrder=0
	OnClick=ConfigTab_Loadout.InternalOnClick
	OnKeyEvent=RemoveAllButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_Loadout.AddAllButton'
begin object name="AddAllButton" class=XInterface.GUIButton
	Caption="ALL"
	Hint="Checks all to replace the original weapon currently selected"
	WinTop=0.8500000
	WinLeft=0.5800000
	WinWidth=0.1500000
	TabOrder=0
	OnClick=ConfigTab_Loadout.InternalOnClick
	OnKeyEvent=AddAllButton.InternalOnKeyEvent
end object
// Reference: BC_GUICheckListBox'BallisticProV55.ConfigTab_Loadout.lb_NewWeaponsList'
begin object name="lb_NewWeaponsList" class=BCoreProV55.BC_GUICheckListBox
	bVisibleWhenEmpty=true
	OnCreateComponent=lb_NewWeaponsList.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Tick the weapons that you want in the chosen loadout box."
	WinTop=0.1000000
	WinLeft=0.5500000
	WinWidth=0.4000000
	WinHeight=0.7400000
	RenderWeight=0.5200000
	TabOrder=1
end object
// Reference: GUIImage'BallisticProV55.ConfigTab_Loadout.Box_NewImg'
begin object name="Box_NewImg" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.0500000
	WinLeft=0.5250000
	WinWidth=0.4500000
	WinHeight=0.8000000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.ConfigTab_Loadout.Box_WeapIconImg'
begin object name="Box_WeapIconImg" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.0500000
	WinLeft=0.0250000
	WinWidth=0.4500000
	WinHeight=0.8000000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.ConfigTab_Loadout.Pic_WeaponImg'
begin object name="Pic_WeaponImg" class=XInterface.GUIImage
	ImageStyle=2
	WinTop=0.0900000
	WinLeft=0.0400000
	WinWidth=0.4200000
	WinHeight=0.2790000
	RenderWeight=0.0040000
end object
// Reference: GUILabel'BallisticProV55.ConfigTab_Loadout.l_NewListlabel'
begin object name="l_NewListlabel" class=XInterface.GUILabel
	Caption="Weapons"
	TextAlign=1
	TextColor=(R=255,G=255,B=255,A=255)
	WinTop=0.0500000
	WinLeft=0.5250000
	WinWidth=0.4500000
	WinHeight=0.0500000
end object
// Reference: GUILabel'BallisticProV55.ConfigTab_Loadout.l_WeapTitlelabel'
begin object name="l_WeapTitlelabel" class=XInterface.GUILabel
	TextAlign=1
	TextColor=(R=255,G=255,B=255,A=255)
	WinTop=0.0500000
	WinLeft=0.0350000
	WinWidth=0.4300000
	WinHeight=0.0500000
end object
// Reference: moFloatEdit'BallisticProV55.ConfigTab_Loadout.fl_RequiredSnprEffEdit'
begin object name="fl_RequiredSnprEffEdit" class=XInterface.moFloatEdit
	MaxValue=999999.0000000
	ComponentJustification=0
	CaptionWidth=0.4000000
	Caption="Sniper Eff"
	OnCreateComponent=RequirementDmgRtEdit.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Headshot kills divided by deaths. How efficient the player is at headshots (benfit by getting headshots and avoiding death)"
	WinTop=0.5500000
	WinLeft=0.0400000
	WinWidth=0.4200000
	WinHeight=0.0400000
end object
// Reference: moFloatEdit'BallisticProV55.ConfigTab_Loadout.fl_RequiredStgnEffEdit'
begin object name="fl_RequiredStgnEffEdit" class=XInterface.moFloatEdit
	MaxValue=999999.0000000
	ComponentJustification=0
	CaptionWidth=0.4000000
	Caption="Shotgun Eff"
	OnCreateComponent=RequirementDmgRtEdit.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Gun kills divided by range and deaths. How efficient the player is at close combat with guns (benefit by using guns close up and avoiding death)"
	WinTop=0.6000000
	WinLeft=0.0400000
	WinWidth=0.4200000
	WinHeight=0.0400000
end object
// Reference: moFloatEdit'BallisticProV55.ConfigTab_Loadout.fl_RequiredHzrdEffEdit'
begin object name="fl_RequiredHzrdEffEdit" class=XInterface.moFloatEdit
	MaxValue=999999.0000000
	ComponentJustification=0
	CaptionWidth=0.4000000
	Caption="Hazard Eff"
	OnCreateComponent=RequirementDmgRtEdit.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Kills minus deaths with traps and hazardous weapons divided by deaths. (benfit by killing with hazardous weapons and avoiding death)"
	WinTop=0.6500000
	WinLeft=0.0400000
	WinWidth=0.4200000
	WinHeight=0.0400000
end object
