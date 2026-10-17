class ConfigTab_Outfitting extends ConfigTabBase
	config(BallisticProV55)
	editinlinenew
	instanced;

const NUM_BOXES = 7;
const NUM_BOXES_TOTAL = 21;

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
};

var config bool bUseAllWeapons;
var() automated GUIImage Box_New;
var() automated GUIImage Box_WeapIcon;
var() automated GUIImage Pic_Weapon;
var() automated GUILabel l_NewList;
var() automated GUILabel l_WeapTitle;
var() automated BC_GUICheckListMultiBox lb_NewWeapons;
var() automated GUIButton BAddAll;
var() automated GUIButton BRemoveAll;
var() automated GUIButton BBox1;
var() automated GUIButton BBox2;
var() automated GUIButton BBox3;
var() automated GUIButton BBox4;
var() automated GUIButton BBox5;
var() automated GUIButton BBox6;
var() automated GUIButton BBox7;
var() automated GUIScrollTextBox lb_Desc;
var() automated moCheckBox ch_AllWeaps;
var() automated moFloatEdit fl_ChangeInterval;
var LoadOutBox Boxes[21];
var localized string BoxNames[7];
var int SelectedBox;
var() localized string Headings[12];
var array<LOWeapInfo> WeaponInfo;

function InitializeConfigTab()
{
	lb_NewWeapons.CheckList.__OnClick__Delegate = InternalOnClick;
	lb_NewWeapons.CheckList.__OnRightClick__Delegate = InternalOnRightClick;
	ch_AllWeaps.MyCheckBox.__OnClick__Delegate = InternalOnClick;
	ch_AllWeaps.MyCheckBox.SetChecked(bUseAllWeapons);
	fl_ChangeInterval.SetValue(Class'BallisticProV55.ClientOutfittingInterface'.default.ChangeInterval);
	LoadList();
	LoadBoxesFromMutator();
	LoadBox(0);
	//return;	
}

function LoadList()
{
	local int i, j;
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

	// End:0x693 [Loop If]
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
				goto J0x689;
			}
			// End:0x2DD
			if(!bUseAllWeapons)
			{
				// End:0x2DD
				if((((InStr(S, "Ballistic") == -1) && InStr(S, "BWBP") == -1) && InStr(S, "JunkWar") == -1) && InStr(S, "JWBP") == -1)
				{
					// [Explicit Continue]
					goto J0x689;
				}
			}
		}
		WI = Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(Recs[i].ClassName, j);
		// End:0x319
		if(j == -1)
		{
			// [Explicit Continue]
			goto J0x689;
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
		// End:0x689
		if(WI.ClassName != "")
		{
			// End:0x602
			if(WI.bIsBW)
			{
				// End:0x502
				if((WI.InventoryGroup > 0) && WI.InventoryGroup < 10)
				{
					lb_NewWeapons.CheckList.Insert(Index[WI.InventoryGroup - 1], Recs[i].FriendlyName,, string(j));
					j = WI.InventoryGroup - 1;
					J0x4DC:

					// End:0x4FF [Loop If]
					if(j < 12)
					{
						Index[j]++;
						j++;
						// [Loop Continue]
						goto J0x4DC;
					}					
				}
				else
				{
					// End:0x578
					if(WI.InventoryGroup == 0)
					{
						lb_NewWeapons.CheckList.Insert(Index[9], Recs[i].FriendlyName,, string(j));
						j = 9;
						J0x552:

						// End:0x575 [Loop If]
						if(j < 12)
						{
							Index[j]++;
							j++;
							// [Loop Continue]
							goto J0x552;
						}						
					}
					else
					{
						// End:0x5B3
						if(!MiscLoaded)
						{
							MiscLoaded = true;
							lb_NewWeapons.CheckList.Add(Headings[10],, "MISC", true);
						}
						lb_NewWeapons.CheckList.Insert(Index[10], Recs[i].FriendlyName,, string(j));
						Index[10]++;
						Index[11]++;
					}
				}
				// [Explicit Continue]
				goto J0x689;
			}
			// End:0x689
			if(bUseAllWeapons)
			{
				// End:0x647
				if(!OtherLoaded)
				{
					OtherLoaded = true;
					lb_NewWeapons.CheckList.Add(Headings[11],, "OTHER", true);
				}
				lb_NewWeapons.CheckList.Insert(Index[11], Recs[i].FriendlyName,, string(j));
				Index[11]++;
			}
		}
		J0x689:

		i++;
		// [Loop Continue]
		goto J0x1E7;
	}
	Class'BCoreProV55.BC_WeaponInfoCache'.static.EndSession();
	// End:0x72A
	if(((lb_NewWeapons.CheckList.Index == 0) && lb_NewWeapons.CheckList.IsSection()) || lb_NewWeapons.CheckList.Index >= lb_NewWeapons.CheckList.ItemCount)
	{
		lb_NewWeapons.CheckList.SetIndex(1);
	}
	//return;	
}

function LoadBoxesFromMutator()
{
	local int i, j, k;
	local Class<BC_GameStyle> game_style;
	local WeaponList_Killstreak KillstreakList;

	game_style = BaseMenu.GetGameStyle();
	// End:0x65
	if(game_style == none)
	{
		Log("ConfigTab_Outfitting: Couldn't load - No compatible style found");
		return;
	}
	KillstreakList = new (none, game_style.default.StyleName) Class'BallisticProV55.WeaponList_Killstreak';
	Boxes[0].WeaponNames = Class'BallisticProV55.Mut_Outfitting'.default.LoadoutGroup0;
	Boxes[1].WeaponNames = Class'BallisticProV55.Mut_Outfitting'.default.LoadoutGroup1;
	Boxes[2].WeaponNames = Class'BallisticProV55.Mut_Outfitting'.default.LoadoutGroup2;
	Boxes[3].WeaponNames = Class'BallisticProV55.Mut_Outfitting'.default.LoadoutGroup3;
	Boxes[4].WeaponNames = Class'BallisticProV55.Mut_Outfitting'.default.LoadoutGroup4;
	Boxes[5].WeaponNames = KillstreakList.Streak1s;
	Boxes[6].WeaponNames = KillstreakList.Streak2s;
	Boxes[7].WeaponNames = Class'BallisticProV55.Mut_TeamOutfitting'.default.RedLoadoutGroup0;
	Boxes[8].WeaponNames = Class'BallisticProV55.Mut_TeamOutfitting'.default.RedLoadoutGroup1;
	Boxes[9].WeaponNames = Class'BallisticProV55.Mut_TeamOutfitting'.default.RedLoadoutGroup2;
	Boxes[10].WeaponNames = Class'BallisticProV55.Mut_TeamOutfitting'.default.RedLoadoutGroup3;
	Boxes[11].WeaponNames = Class'BallisticProV55.Mut_TeamOutfitting'.default.RedLoadoutGroup4;
	Boxes[12].WeaponNames = KillstreakList.Streak1s;
	Boxes[13].WeaponNames = KillstreakList.Streak2s;
	Boxes[14].WeaponNames = Class'BallisticProV55.Mut_TeamOutfitting'.default.BlueLoadoutGroup0;
	Boxes[15].WeaponNames = Class'BallisticProV55.Mut_TeamOutfitting'.default.BlueLoadoutGroup1;
	Boxes[16].WeaponNames = Class'BallisticProV55.Mut_TeamOutfitting'.default.BlueLoadoutGroup2;
	Boxes[17].WeaponNames = Class'BallisticProV55.Mut_TeamOutfitting'.default.BlueLoadoutGroup3;
	Boxes[18].WeaponNames = Class'BallisticProV55.Mut_TeamOutfitting'.default.BlueLoadoutGroup4;
	Boxes[19].WeaponNames = KillstreakList.Streak1s;
	Boxes[20].WeaponNames = KillstreakList.Streak2s;
	i = 0;
	J0x2D2:

	// End:0x391 [Loop If]
	if(i < 21)
	{
		j = 0;
		J0x2E5:

		// End:0x387 [Loop If]
		if(j < Boxes[i].WeaponNames.Length)
		{
			k = 0;
			J0x307:

			// End:0x34F [Loop If]
			if(k < WeaponInfo.Length)
			{
				// End:0x345
				if(Boxes[i].WeaponNames[j] ~= WeaponInfo[k].ClassName)
				{
					// [Explicit Break]
					goto J0x34F;
				}
				k++;
				// [Loop Continue]
				goto J0x307;
			}
			J0x34F:

			// End:0x37D
			if(k >= WeaponInfo.Length)
			{
				Boxes[i].WeaponNames.Remove(j, 1);
				j--;
			}
			j++;
			// [Loop Continue]
			goto J0x2E5;
		}
		i++;
		// [Loop Continue]
		goto J0x2D2;
	}
	//return;	
}

function SaveBoxesToMutator()
{
	local int i;
	local Class<BC_GameStyle> game_style;
	local WeaponList_Killstreak KillstreakList;

	game_style = BaseMenu.GetGameStyle();
	// End:0x65
	if(game_style == none)
	{
		Log("ConfigTab_Outfitting: Couldn't load - No compatible style found");
		return;
	}
	KillstreakList = new (none, game_style.default.StyleName) Class'BallisticProV55.WeaponList_Killstreak';
	i = 0;
	J0x88:

	// End:0xC8 [Loop If]
	if(i < 21)
	{
		// End:0xBE
		if(Boxes[i].WeaponNames.Length < 1)
		{
			Boxes[i].WeaponNames.Length = 1;
		}
		i++;
		// [Loop Continue]
		goto J0x88;
	}
	Class'BallisticProV55.Mut_Outfitting'.default.LoadoutGroup0 = Boxes[0].WeaponNames;
	Class'BallisticProV55.Mut_Outfitting'.default.LoadoutGroup1 = Boxes[1].WeaponNames;
	Class'BallisticProV55.Mut_Outfitting'.default.LoadoutGroup2 = Boxes[2].WeaponNames;
	Class'BallisticProV55.Mut_Outfitting'.default.LoadoutGroup3 = Boxes[3].WeaponNames;
	Class'BallisticProV55.Mut_Outfitting'.default.LoadoutGroup4 = Boxes[4].WeaponNames;
	KillstreakList.Streak1s = Boxes[5].WeaponNames;
	KillstreakList.Streak2s = Boxes[6].WeaponNames;
	Class'BallisticProV55.Mut_TeamOutfitting'.default.RedLoadoutGroup0 = Boxes[7].WeaponNames;
	Class'BallisticProV55.Mut_TeamOutfitting'.default.RedLoadoutGroup1 = Boxes[8].WeaponNames;
	Class'BallisticProV55.Mut_TeamOutfitting'.default.RedLoadoutGroup2 = Boxes[9].WeaponNames;
	Class'BallisticProV55.Mut_TeamOutfitting'.default.RedLoadoutGroup3 = Boxes[10].WeaponNames;
	Class'BallisticProV55.Mut_TeamOutfitting'.default.RedLoadoutGroup4 = Boxes[11].WeaponNames;
	Class'BallisticProV55.Mut_TeamOutfitting'.default.BlueLoadoutGroup0 = Boxes[14].WeaponNames;
	Class'BallisticProV55.Mut_TeamOutfitting'.default.BlueLoadoutGroup1 = Boxes[15].WeaponNames;
	Class'BallisticProV55.Mut_TeamOutfitting'.default.BlueLoadoutGroup2 = Boxes[16].WeaponNames;
	Class'BallisticProV55.Mut_TeamOutfitting'.default.BlueLoadoutGroup3 = Boxes[17].WeaponNames;
	Class'BallisticProV55.Mut_TeamOutfitting'.default.BlueLoadoutGroup4 = Boxes[18].WeaponNames;
	Class'BallisticProV55.Mut_Outfitting'.static.StaticSaveConfig();
	Class'BallisticProV55.Mut_TeamOutfitting'.static.StaticSaveConfig();
	Class'BallisticProV55.Mut_Killstreak'.static.StaticSaveConfig();
	KillstreakList.SaveConfig();
	//return;	
}

function LoadBox(int BoxNum)
{
	local int i, j, k, WatchedSection[3];
	local CheckStruct Empty;

	SelectedBox = BoxNum;
	i = 0;
	J0x12:

	// End:0x39 [Loop If]
	if(i < 3)
	{
		WatchedSection[i] = -1;
		i++;
		// [Loop Continue]
		goto J0x12;
	}
	i = 0;
	J0x40:

	// End:0x2A2 [Loop If]
	if(i < lb_NewWeapons.CheckList.Elements.Length)
	{
		lb_NewWeapons.CheckList.CheckStore[i] = Empty;
		lb_NewWeapons.CheckList.SetChecked(i, 0, false);
		lb_NewWeapons.CheckList.SetChecked(i, 1, false);
		lb_NewWeapons.CheckList.SetChecked(i, 2, false);
		// End:0x192
		if(lb_NewWeapons.CheckList.Elements[i].bSection)
		{
			j = 0;
			J0x110:

			// End:0x18F [Loop If]
			if(j < 3)
			{
				// End:0x174
				if((WatchedSection[j] > -1) && (i - WatchedSection[j]) > 1)
				{
					lb_NewWeapons.CheckList.SetChecked(WatchedSection[j], j, true);
				}
				WatchedSection[j] = i;
				j++;
				// [Loop Continue]
				goto J0x110;
			}
			// [Explicit Continue]
			goto J0x298;
		}
		j = 0;
		J0x199:

		// End:0x298 [Loop If]
		if(j < 3)
		{
			k = 0;
			J0x1AC:

			// End:0x257 [Loop If]
			if(k < Boxes[BoxNum + (j * 7)].WeaponNames.Length)
			{
				// End:0x24D
				if(Boxes[BoxNum + (j * 7)].WeaponNames[k] ~= WeaponInfo[int(lb_NewWeapons.CheckList.Elements[i].ExtraStrData)].ClassName)
				{
					lb_NewWeapons.CheckList.SetChecked(i, j, true);
					// [Explicit Break]
					goto J0x257;
				}
				k++;
				// [Loop Continue]
				goto J0x1AC;
			}
			J0x257:

			// End:0x28E
			if(k >= Boxes[BoxNum + (j * 7)].WeaponNames.Length)
			{
				WatchedSection[j] = -1;
			}
			j++;
			// [Loop Continue]
			goto J0x199;
		}
		J0x298:

		i++;
		// [Loop Continue]
		goto J0x40;
	}
	i = 0;
	J0x2A9:

	// End:0x32A [Loop If]
	if(i < 3)
	{
		// End:0x320
		if((WatchedSection[i] > -1) && WatchedSection[i] != (lb_NewWeapons.CheckList.Elements.Length - 1))
		{
			lb_NewWeapons.CheckList.SetChecked(WatchedSection[i], i, true);
		}
		i++;
		// [Loop Continue]
		goto J0x2A9;
	}
	l_NewList.Caption = BoxNames[BoxNum];
	// End:0x3E4
	if(!lb_NewWeapons.CheckList.IsValid())
	{
		i = 0;
		J0x368:

		// End:0x3DB [Loop If]
		if(i < lb_NewWeapons.CheckList.ItemCount)
		{
			// End:0x3D1
			if(!lb_NewWeapons.CheckList.Elements[i].bSection)
			{
				lb_NewWeapons.CheckList.SetIndex(i);
				// [Explicit Break]
				goto J0x3DB;
			}
			i++;
			// [Loop Continue]
			goto J0x368;
		}
		J0x3DB:

		DisplayWeapon();		
	}
	else
	{
		// End:0x3F5
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
	lb_Desc.SetContent(WeaponInfo[i].Description);
	//return;	
}

function SectionCheck(bool bChecked, int Index, byte Column)
{
	local int i, j;

	j = Index + 1;
	J0x0E:

	// End:0x27A [Loop If]
	if(j < lb_NewWeapons.CheckList.Elements.Length)
	{
		// End:0x58
		if(lb_NewWeapons.CheckList.Elements[j].bSection)
		{
			return;
		}
		lb_NewWeapons.CheckList.SetChecked(j, int(Column), bChecked);
		// End:0x1B5
		if(bChecked)
		{
			i = 0;
			J0x92:

			// End:0x11E [Loop If]
			if(i < Boxes[SelectedBox + (int(Column) * 7)].WeaponNames.Length)
			{
				// End:0x114
				if(Boxes[SelectedBox + (int(Column) * 7)].WeaponNames[i] ~= WeaponInfo[int(lb_NewWeapons.CheckList.Elements[j].ExtraStrData)].ClassName)
				{
					// [Explicit Break]
					goto J0x11E;
				}
				i++;
				// [Loop Continue]
				goto J0x92;
			}
			J0x11E:

			// End:0x1B2
			if(i >= Boxes[SelectedBox + (int(Column) * 7)].WeaponNames.Length)
			{
				Boxes[SelectedBox + (int(Column) * 7)].WeaponNames[Boxes[SelectedBox + (int(Column) * 7)].WeaponNames.Length] = WeaponInfo[int(lb_NewWeapons.CheckList.Elements[j].ExtraStrData)].ClassName;
			}
			// [Explicit Continue]
			goto J0x270;
		}
		i = 0;
		J0x1BC:

		// End:0x270 [Loop If]
		if(i < Boxes[SelectedBox + (int(Column) * 7)].WeaponNames.Length)
		{
			// End:0x266
			if(Boxes[SelectedBox + (int(Column) * 7)].WeaponNames[i] ~= WeaponInfo[int(lb_NewWeapons.CheckList.Elements[j].ExtraStrData)].ClassName)
			{
				Boxes[SelectedBox + (int(Column) * 7)].WeaponNames.Remove(i, 1);
				i--;
			}
			i++;
			// [Loop Continue]
			goto J0x1BC;
		}
		J0x270:

		j++;
		// [Loop Continue]
		goto J0x0E;
	}
	//return;	
}

function bool InternalOnClick(GUIComponent Sender)
{
	local int i, j, LastCheck;
	local byte LastColumn;

	// End:0x308
	if(Sender == lb_NewWeapons.CheckList)
	{
		lb_NewWeapons.CheckList.InternalOnClick(Sender);
		// End:0x2FF
		if(lb_NewWeapons.CheckList.LastClickWasCheck)
		{
			LastCheck = lb_NewWeapons.CheckList.LastCheckChanged;
			LastColumn = byte(lb_NewWeapons.CheckList.LastColumnChanged);
			// End:0xF4
			if(lb_NewWeapons.CheckList.Elements[LastCheck].bSection)
			{
				SectionCheck(int(lb_NewWeapons.CheckList.CheckStore[LastCheck].Checks[int(LastColumn)]) > 0, LastCheck, LastColumn);				
			}
			else
			{
				// End:0x246
				if(int(lb_NewWeapons.CheckList.CheckStore[LastCheck].Checks[int(LastColumn)]) > 0)
				{
					j = 0;
					J0x12D:

					// End:0x1B4 [Loop If]
					if(j < Boxes[SelectedBox + (int(LastColumn) * 7)].WeaponNames.Length)
					{
						// End:0x1AA
						if(Boxes[SelectedBox + (int(LastColumn) * 7)].WeaponNames[j] ~= WeaponInfo[int(lb_NewWeapons.List.GetExtraAtIndex(LastCheck))].ClassName)
						{
							// [Explicit Break]
							goto J0x1B4;
						}
						j++;
						// [Loop Continue]
						goto J0x12D;
					}
					J0x1B4:

					// End:0x243
					if(j >= Boxes[SelectedBox + (int(LastColumn) * 7)].WeaponNames.Length)
					{
						Boxes[SelectedBox + (int(LastColumn) * 7)].WeaponNames[Boxes[SelectedBox + (int(LastColumn) * 7)].WeaponNames.Length] = WeaponInfo[int(lb_NewWeapons.List.GetExtraAtIndex(LastCheck))].ClassName;
					}					
				}
				else
				{
					j = 0;
					J0x24D:

					// End:0x2FC [Loop If]
					if(j < Boxes[SelectedBox + (int(LastColumn) * 7)].WeaponNames.Length)
					{
						// End:0x2F2
						if(Boxes[SelectedBox + (int(LastColumn) * 7)].WeaponNames[j] ~= WeaponInfo[int(lb_NewWeapons.List.GetExtraAtIndex(LastCheck))].ClassName)
						{
							Boxes[SelectedBox + (int(LastColumn) * 7)].WeaponNames.Remove(j, 1);
							j--;
						}
						j++;
						// [Loop Continue]
						goto J0x24D;
					}
				}
			}			
		}
		else
		{
			DisplayWeapon();
		}		
	}
	else
	{
		// End:0x43B
		if(Sender == BAddAll)
		{
			i = 0;
			J0x31E:

			// End:0x438 [Loop If]
			if(i < 3)
			{
				Boxes[SelectedBox + (i * 7)].WeaponNames.Length = 0;
				j = 0;
				J0x34F:

				// End:0x42E [Loop If]
				if(j < lb_NewWeapons.CheckList.Elements.Length)
				{
					lb_NewWeapons.CheckList.SetChecked(j, i, true);
					// End:0x424
					if(!lb_NewWeapons.CheckList.Elements[j].bSection)
					{
						Boxes[SelectedBox + (i * 7)].WeaponNames[Boxes[SelectedBox + (i * 7)].WeaponNames.Length] = WeaponInfo[int(lb_NewWeapons.CheckList.Elements[j].ExtraStrData)].ClassName;
					}
					j++;
					// [Loop Continue]
					goto J0x34F;
				}
				i++;
				// [Loop Continue]
				goto J0x31E;
			}			
		}
		else
		{
			// End:0x4DE
			if(Sender == BRemoveAll)
			{
				i = 0;
				J0x451:

				// End:0x4DB [Loop If]
				if(i < 3)
				{
					Boxes[SelectedBox + (i * 7)].WeaponNames.Length = 0;
					j = 0;
					J0x482:

					// End:0x4D1 [Loop If]
					if(j < lb_NewWeapons.CheckList.Elements.Length)
					{
						lb_NewWeapons.CheckList.SetChecked(j, i, false);
						j++;
						// [Loop Continue]
						goto J0x482;
					}
					i++;
					// [Loop Continue]
					goto J0x451;
				}				
			}
			else
			{
				// End:0x4F7
				if(Sender == BBox1)
				{
					LoadBox(0);					
				}
				else
				{
					// End:0x510
					if(Sender == BBox2)
					{
						LoadBox(1);						
					}
					else
					{
						// End:0x52A
						if(Sender == BBox3)
						{
							LoadBox(2);							
						}
						else
						{
							// End:0x544
							if(Sender == BBox4)
							{
								LoadBox(3);								
							}
							else
							{
								// End:0x55E
								if(Sender == BBox5)
								{
									LoadBox(4);									
								}
								else
								{
									// End:0x578
									if(Sender == BBox6)
									{
										LoadBox(5);										
									}
									else
									{
										// End:0x592
										if(Sender == BBox7)
										{
											LoadBox(6);											
										}
										else
										{
											// End:0x620
											if(Sender == ch_AllWeaps.MyCheckBox)
											{
												ch_AllWeaps.MyCheckBox.InternalOnClick(Sender);
												bUseAllWeapons = ch_AllWeaps.IsChecked();
												lb_NewWeapons.CheckList.Clear();
												lb_NewWeapons.CheckList.CheckStore.Length = 0;
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
		}
	}
	return true;
	//return;	
}

function bool InternalOnRightClick(GUIComponent Sender)
{
	// End:0x58
	if(Sender == lb_NewWeapons.CheckList)
	{
		lb_NewWeapons.CheckList.InternalOnClick(Sender);
		// End:0x58
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
	// End:0x0D
	if(!bInitialized)
	{
		return;
	}
	Class'BallisticProV55.ClientOutfittingInterface'.default.ChangeInterval = fl_ChangeInterval.GetValue();
	Class'BallisticProV55.ClientOutfittingInterface'.static.StaticSaveConfig();
	SaveBoxesToMutator();
	SaveConfig();
	//return;	
}

static function string GetHeading(int i)
{
	// End:0x14
	if(i == 0)
	{
		return default.Headings[9];
	}
	return default.Headings[i - 1];
	//return;	
}

function DefaultSettings()
{
	Class'BallisticProV55.Mut_Outfitting'.static.ResetConfig("LoadoutGroup0");
	Class'BallisticProV55.Mut_Outfitting'.static.ResetConfig("LoadoutGroup1");
	Class'BallisticProV55.Mut_Outfitting'.static.ResetConfig("LoadoutGroup2");
	Class'BallisticProV55.Mut_Outfitting'.static.ResetConfig("LoadoutGroup3");
	Class'BallisticProV55.Mut_Outfitting'.static.ResetConfig("LoadoutGroup4");
	Class'BallisticProV55.Mut_Outfitting'.static.ResetConfig("LoadoutGroup5");
	Class'BallisticProV55.Mut_Outfitting'.static.ResetConfig("LoadoutGroup6");
	Class'BallisticProV55.Mut_Killstreak'.static.ResetConfig("Streak1s");
	Class'BallisticProV55.Mut_Killstreak'.static.ResetConfig("Streak2s");
	LoadBoxesFromMutator();
	LoadBox(SelectedBox);
	//return;	
}

defaultproperties
{
	// Reference: GUIImage'BallisticProV55.ConfigTab_Outfitting.Box_NewImg'
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
	// Reference: GUIImage'BallisticProV55.ConfigTab_Outfitting.Box_WeapIconImg'
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
	// Reference: GUIImage'BallisticProV55.ConfigTab_Outfitting.Pic_WeaponImg'
	begin object name="Pic_WeaponImg" class=XInterface.GUIImage
		ImageStyle=2
		WinTop=0.0900000
		WinLeft=0.0400000
		WinWidth=0.4200000
		WinHeight=0.2790000
		RenderWeight=0.0040000
	end object
	Pic_Weapon=Pic_WeaponImg
	// Reference: GUILabel'BallisticProV55.ConfigTab_Outfitting.l_NewListlabel'
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
	// Reference: GUILabel'BallisticProV55.ConfigTab_Outfitting.l_WeapTitlelabel'
	begin object name="l_WeapTitlelabel" class=XInterface.GUILabel
		TextAlign=1
		TextColor=(R=255,G=255,B=255,A=255)
		WinTop=0.0500000
		WinLeft=0.0350000
		WinWidth=0.4300000
		WinHeight=0.0500000
	end object
	l_WeapTitle=l_WeapTitlelabel
	// Reference: BC_GUICheckListMultiBox'BallisticProV55.ConfigTab_Outfitting.lb_NewWeaponsList'
	begin object name="lb_NewWeaponsList" class=BCoreProV55.BC_GUICheckListMultiBox
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
	// Reference: GUIButton'BallisticProV55.ConfigTab_Outfitting.AddAllButton'
	begin object name="AddAllButton" class=XInterface.GUIButton
		Caption="ALL"
		Hint="Checks all to replace the original weapon currently selected"
		WinTop=0.8500000
		WinLeft=0.5800000
		WinWidth=0.1500000
		TabOrder=0
		OnClick=ConfigTab_Outfitting.InternalOnClick
		OnKeyEvent=AddAllButton.InternalOnKeyEvent
	end object
	BAddAll=AddAllButton
	// Reference: GUIButton'BallisticProV55.ConfigTab_Outfitting.RemoveAllButton'
	begin object name="RemoveAllButton" class=XInterface.GUIButton
		Caption="NONE"
		Hint="Unchecks all to replace the original weapon currently selected"
		WinTop=0.8500000
		WinLeft=0.7800000
		WinWidth=0.1500000
		TabOrder=0
		OnClick=ConfigTab_Outfitting.InternalOnClick
		OnKeyEvent=RemoveAllButton.InternalOnKeyEvent
	end object
	BRemoveAll=RemoveAllButton
	// Reference: GUIButton'BallisticProV55.ConfigTab_Outfitting.BBox1Button'
	begin object name="BBox1Button" class=XInterface.GUIButton
		Caption="Melee"
		Hint="View the list of weapons in the 'Melee' box"
		WinTop=0.9400000
		WinLeft=0.0250000
		WinWidth=0.1500000
		TabOrder=0
		OnClick=ConfigTab_Outfitting.InternalOnClick
		OnKeyEvent=BBox1Button.InternalOnKeyEvent
	end object
	BBox1=BBox1Button
	// Reference: GUIButton'BallisticProV55.ConfigTab_Outfitting.BBox2Button'
	begin object name="BBox2Button" class=XInterface.GUIButton
		Caption="Sidearm"
		Hint="View the list of weapons in the 'Sidearm' box"
		WinTop=0.9400000
		WinLeft=0.2250000
		WinWidth=0.1500000
		TabOrder=0
		OnClick=ConfigTab_Outfitting.InternalOnClick
		OnKeyEvent=BBox2Button.InternalOnKeyEvent
	end object
	BBox2=BBox2Button
	// Reference: GUIButton'BallisticProV55.ConfigTab_Outfitting.BBox3Button'
	begin object name="BBox3Button" class=XInterface.GUIButton
		Caption="Primary"
		Hint="View the list of weapons in the 'Primary' box"
		WinTop=0.9400000
		WinLeft=0.4250000
		WinWidth=0.1500000
		TabOrder=0
		OnClick=ConfigTab_Outfitting.InternalOnClick
		OnKeyEvent=BBox3Button.InternalOnKeyEvent
	end object
	BBox3=BBox3Button
	// Reference: GUIButton'BallisticProV55.ConfigTab_Outfitting.BBox4Button'
	begin object name="BBox4Button" class=XInterface.GUIButton
		Caption="Secondary"
		Hint="View the list of weapons in the 'Secondary' box"
		WinTop=0.9400000
		WinLeft=0.6250000
		WinWidth=0.1500000
		TabOrder=0
		OnClick=ConfigTab_Outfitting.InternalOnClick
		OnKeyEvent=BBox4Button.InternalOnKeyEvent
	end object
	BBox4=BBox4Button
	// Reference: GUIButton'BallisticProV55.ConfigTab_Outfitting.BBox5Button'
	begin object name="BBox5Button" class=XInterface.GUIButton
		Caption="Grenade"
		Hint="View the list of weapons in the 'Grenade' box"
		WinTop=0.9400000
		WinLeft=0.8250000
		WinWidth=0.1500000
		TabOrder=0
		OnClick=ConfigTab_Outfitting.InternalOnClick
		OnKeyEvent=BBox5Button.InternalOnKeyEvent
	end object
	BBox5=BBox5Button
	// Reference: GUIButton'BallisticProV55.ConfigTab_Outfitting.BBox6Button'
	begin object name="BBox6Button" class=XInterface.GUIButton
		Caption="Streak 1"
		Hint="View the list of weapons in the 'Streak 1' box"
		WinTop=0.9800000
		WinLeft=0.2250000
		WinWidth=0.1500000
		TabOrder=0
		OnClick=ConfigTab_Outfitting.InternalOnClick
		OnKeyEvent=BBox6Button.InternalOnKeyEvent
	end object
	BBox6=BBox6Button
	// Reference: GUIButton'BallisticProV55.ConfigTab_Outfitting.BBox7Button'
	begin object name="BBox7Button" class=XInterface.GUIButton
		Caption="Streak 2"
		Hint="View the list of weapons in the 'Streak 2' box"
		WinTop=0.9800000
		WinLeft=0.6250000
		WinWidth=0.1500000
		TabOrder=0
		OnClick=ConfigTab_Outfitting.InternalOnClick
		OnKeyEvent=BBox7Button.InternalOnKeyEvent
	end object
	BBox7=BBox7Button
	// Reference: GUIScrollTextBox'BallisticProV55.ConfigTab_Outfitting.WeaponDescription'
	begin object name="WeaponDescription" class=XInterface.GUIScrollTextBox
		CharDelay=0.0015000
		EOLDelay=0.2500000
		bVisibleWhenEmpty=true
		OnCreateComponent=WeaponDescription.InternalOnCreateComponent
		FontScale=0
		WinTop=0.3700000
		WinLeft=0.0400000
		WinWidth=0.4200000
		WinHeight=0.4500000
		RenderWeight=0.5100000
		TabOrder=0
		bAcceptsInput=false
		bNeverFocus=true
	end object
	lb_Desc=WeaponDescription
	// Reference: moCheckBox'BallisticProV55.ConfigTab_Outfitting.ch_AllWeapsCheck'
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
	// Reference: moFloatEdit'BallisticProV55.ConfigTab_Outfitting.fl_ChangeIntervalFloat'
	begin object name="fl_ChangeIntervalFloat" class=XInterface.moFloatEdit
		MinValue=0.0000000
		MaxValue=600.0000000
		ComponentJustification=0
		CaptionWidth=0.8000000
		Caption="Loadout Change Interval"
		OnCreateComponent=fl_ChangeIntervalFloat.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Time which must pass before you can change your weapons with Loadout while still alive."
		WinTop=0.9000000
		WinLeft=0.0250000
		WinWidth=0.4500000
		WinHeight=0.0400000
	end object
	fl_ChangeInterval=fl_ChangeIntervalFloat
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
// Reference: moFloatEdit'BallisticProV55.ConfigTab_Outfitting.fl_ChangeIntervalFloat'
begin object name="fl_ChangeIntervalFloat" class=XInterface.moFloatEdit
	MinValue=0.0000000
	MaxValue=600.0000000
	ComponentJustification=0
	CaptionWidth=0.8000000
	Caption="Loadout Change Interval"
	OnCreateComponent=fl_ChangeIntervalFloat.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Time which must pass before you can change your weapons with Loadout while still alive."
	WinTop=0.9000000
	WinLeft=0.0250000
	WinWidth=0.4500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_Outfitting.ch_AllWeapsCheck'
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
// Reference: GUIScrollTextBox'BallisticProV55.ConfigTab_Outfitting.WeaponDescription'
begin object name="WeaponDescription" class=XInterface.GUIScrollTextBox
	CharDelay=0.0015000
	EOLDelay=0.2500000
	bVisibleWhenEmpty=true
	OnCreateComponent=WeaponDescription.InternalOnCreateComponent
	FontScale=0
	WinTop=0.3700000
	WinLeft=0.0400000
	WinWidth=0.4200000
	WinHeight=0.4500000
	RenderWeight=0.5100000
	TabOrder=0
	bAcceptsInput=false
	bNeverFocus=true
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_Outfitting.BBox7Button'
begin object name="BBox7Button" class=XInterface.GUIButton
	Caption="Streak 2"
	Hint="View the list of weapons in the 'Streak 2' box"
	WinTop=0.9800000
	WinLeft=0.6250000
	WinWidth=0.1500000
	TabOrder=0
	OnClick=ConfigTab_Outfitting.InternalOnClick
	OnKeyEvent=BBox7Button.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_Outfitting.BBox6Button'
begin object name="BBox6Button" class=XInterface.GUIButton
	Caption="Streak 1"
	Hint="View the list of weapons in the 'Streak 1' box"
	WinTop=0.9800000
	WinLeft=0.2250000
	WinWidth=0.1500000
	TabOrder=0
	OnClick=ConfigTab_Outfitting.InternalOnClick
	OnKeyEvent=BBox6Button.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_Outfitting.BBox5Button'
begin object name="BBox5Button" class=XInterface.GUIButton
	Caption="Grenade"
	Hint="View the list of weapons in the 'Grenade' box"
	WinTop=0.9400000
	WinLeft=0.8250000
	WinWidth=0.1500000
	TabOrder=0
	OnClick=ConfigTab_Outfitting.InternalOnClick
	OnKeyEvent=BBox5Button.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_Outfitting.BBox4Button'
begin object name="BBox4Button" class=XInterface.GUIButton
	Caption="Secondary"
	Hint="View the list of weapons in the 'Secondary' box"
	WinTop=0.9400000
	WinLeft=0.6250000
	WinWidth=0.1500000
	TabOrder=0
	OnClick=ConfigTab_Outfitting.InternalOnClick
	OnKeyEvent=BBox4Button.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_Outfitting.BBox3Button'
begin object name="BBox3Button" class=XInterface.GUIButton
	Caption="Primary"
	Hint="View the list of weapons in the 'Primary' box"
	WinTop=0.9400000
	WinLeft=0.4250000
	WinWidth=0.1500000
	TabOrder=0
	OnClick=ConfigTab_Outfitting.InternalOnClick
	OnKeyEvent=BBox3Button.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_Outfitting.BBox2Button'
begin object name="BBox2Button" class=XInterface.GUIButton
	Caption="Sidearm"
	Hint="View the list of weapons in the 'Sidearm' box"
	WinTop=0.9400000
	WinLeft=0.2250000
	WinWidth=0.1500000
	TabOrder=0
	OnClick=ConfigTab_Outfitting.InternalOnClick
	OnKeyEvent=BBox2Button.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_Outfitting.BBox1Button'
begin object name="BBox1Button" class=XInterface.GUIButton
	Caption="Melee"
	Hint="View the list of weapons in the 'Melee' box"
	WinTop=0.9400000
	WinLeft=0.0250000
	WinWidth=0.1500000
	TabOrder=0
	OnClick=ConfigTab_Outfitting.InternalOnClick
	OnKeyEvent=BBox1Button.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_Outfitting.RemoveAllButton'
begin object name="RemoveAllButton" class=XInterface.GUIButton
	Caption="NONE"
	Hint="Unchecks all to replace the original weapon currently selected"
	WinTop=0.8500000
	WinLeft=0.7800000
	WinWidth=0.1500000
	TabOrder=0
	OnClick=ConfigTab_Outfitting.InternalOnClick
	OnKeyEvent=RemoveAllButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_Outfitting.AddAllButton'
begin object name="AddAllButton" class=XInterface.GUIButton
	Caption="ALL"
	Hint="Checks all to replace the original weapon currently selected"
	WinTop=0.8500000
	WinLeft=0.5800000
	WinWidth=0.1500000
	TabOrder=0
	OnClick=ConfigTab_Outfitting.InternalOnClick
	OnKeyEvent=AddAllButton.InternalOnKeyEvent
end object
// Reference: BC_GUICheckListMultiBox'BallisticProV55.ConfigTab_Outfitting.lb_NewWeaponsList'
begin object name="lb_NewWeaponsList" class=BCoreProV55.BC_GUICheckListMultiBox
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
// Reference: GUIImage'BallisticProV55.ConfigTab_Outfitting.Box_NewImg'
begin object name="Box_NewImg" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.0500000
	WinLeft=0.5250000
	WinWidth=0.4500000
	WinHeight=0.8000000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.ConfigTab_Outfitting.Box_WeapIconImg'
begin object name="Box_WeapIconImg" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.0500000
	WinLeft=0.0250000
	WinWidth=0.4500000
	WinHeight=0.8000000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.ConfigTab_Outfitting.Pic_WeaponImg'
begin object name="Pic_WeaponImg" class=XInterface.GUIImage
	ImageStyle=2
	WinTop=0.0900000
	WinLeft=0.0400000
	WinWidth=0.4200000
	WinHeight=0.2790000
	RenderWeight=0.0040000
end object
// Reference: GUILabel'BallisticProV55.ConfigTab_Outfitting.l_NewListlabel'
begin object name="l_NewListlabel" class=XInterface.GUILabel
	Caption="Weapons"
	TextAlign=1
	TextColor=(R=255,G=255,B=255,A=255)
	WinTop=0.0500000
	WinLeft=0.5250000
	WinWidth=0.4500000
	WinHeight=0.0500000
end object
// Reference: GUILabel'BallisticProV55.ConfigTab_Outfitting.l_WeapTitlelabel'
begin object name="l_WeapTitlelabel" class=XInterface.GUILabel
	TextAlign=1
	TextColor=(R=255,G=255,B=255,A=255)
	WinTop=0.0500000
	WinLeft=0.0350000
	WinWidth=0.4300000
	WinHeight=0.0500000
end object
