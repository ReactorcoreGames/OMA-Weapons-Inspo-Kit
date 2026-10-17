class ConfigTab_ConflictLoadout extends ConfigTabBase
	editinlinenew
	instanced;

var() automated GUIImage Box_Unused;
var() automated GUIImage Box_UsedRed;
var() automated GUIImage Box_UsedBlue;
var() automated GUIButton bAddBlue;
var() automated GUIButton BRemoveBlue;
var() automated GUIButton BAddAllBlue;
var() automated GUIButton BRemoveAllBlue;
var() automated GUIButton bAddRed;
var() automated GUIButton BRemoveRed;
var() automated GUIButton BAddAllRed;
var() automated GUIButton BRemoveAllRed;
var() automated GUIListBox lb_UsedRedWeapons;
var() automated GUIListBox lb_UsedBlueWeapons;
var() automated GUIListBox lb_UnusedWeapons;
var() automated GUILabel l_Red;
var() automated GUILabel l_Blue;
var() automated GUILabel l_Unused;
var() automated moComboBox co_LoadOpt;
var() localized string Headings[2];

function int WeaponRank(string PackageName, optional string ClassName, optional GUIListElem El)
{
	// End:0x10
	if(PackageName == "I")
	{
		return 50;
	}
	// End:0x27
	if(El.ExtraData == lb_UsedRedWeapons)
	{
		return 51;
	}
	// End:0x37
	if(PackageName == "BW")
	{
		return 0;
	}
	// End:0x6E
	if((InStr(PackageName, "Ballistic") != -1) || InStr(PackageName, "BWBP") != -1)
	{
		return 1;
	}
	// End:0xA4
	if((InStr(PackageName, "JunkWar") != -1) || InStr(PackageName, "JWBP") != -1)
	{
		return 2;
	}
	// End:0xB5
	if(PackageName == "UT")
	{
		return 100;
	}
	// End:0xE3
	if((PackageName ~= "XWeapons") || PackageName ~= "UTClassic")
	{
		return 101;
	}
	// End:0x102
	if(InStr(PackageName, "Onslaught") != -1)
	{
		return 150;
	}
	// End:0x112
	if(PackageName == "O")
	{
		return 200;
	}
	// End:0x125
	if(El.ExtraData == self)
	{
		return 10;
	}
	return 210;
	//return;	
}

function int MyCompareItem(GUIListElem ElemA, GUIListElem ElemB)
{
	local int i, Ar, Br;

	// End:0x27
	if(ElemA.bSection)
	{
		Ar = WeaponRank(ElemA.ExtraStrData);		
	}
	else
	{
		i = InStr(ElemA.ExtraStrData, ".");
		// End:0x73
		if(i > 0)
		{
			Ar = WeaponRank(Left(ElemA.ExtraStrData, i), ElemA.ExtraStrData, ElemA);
		}
	}
	// End:0x9A
	if(ElemB.bSection)
	{
		Br = WeaponRank(ElemB.ExtraStrData);		
	}
	else
	{
		i = InStr(ElemB.ExtraStrData, ".");
		// End:0xE6
		if(i > 0)
		{
			Br = WeaponRank(Left(ElemB.ExtraStrData, i), ElemB.ExtraStrData, ElemB);
		}
	}
	// End:0x10F
	if(Ar == Br)
	{
		return StrCmp(ElemA.Item, ElemB.Item);		
	}
	else
	{
		return Ar - Br;
	}
	//return;	
}

function bool InternalOnDragDrop(GUIComponent Sender)
{
	local array<GUIListElem> NewItem;
	local int i, j;
	local export editinline GUIList L;

	L = GUIList(Sender);
	// End:0x247
	if((L != none) && Sender.Controller.DropTarget == Sender)
	{
		// End:0x61
		if(Sender.Controller.DropSource == L)
		{
			return false;
		}
		// End:0x247
		if((Sender.Controller.DropSource != none) && GUIList(Sender.Controller.DropSource) != none)
		{
			NewItem = GUIList(Sender.Controller.DropSource).GetPendingElements();
			i = NewItem.Length;
			J0xDA:

			// End:0x178 [Loop If]
			if(i > -1)
			{
				// End:0x10C
				if(NewItem[i].bSection)
				{
					NewItem.Remove(i, 1);
					// [Explicit Continue]
					goto J0x16E;
				}
				j = 0;
				J0x113:

				// End:0x16E [Loop If]
				if(j < L.Elements.Length)
				{
					// End:0x164
					if(L.GetExtraAtIndex(j) ~= NewItem[i].ExtraStrData)
					{
						NewItem.Remove(i, 1);
						// [Explicit Break]
						goto J0x16E;
					}
					j++;
					// [Loop Continue]
					goto J0x113;
				}
				J0x16E:

				i--;
				// [Loop Continue]
				goto J0xDA;
			}
			// End:0x1B7
			if(!L.IsValidIndex(L.DropIndex))
			{
				L.DropIndex = L.ItemCount;
			}
			i = NewItem.Length - 1;
			J0x1C6:

			// End:0x228 [Loop If]
			if(i >= 0)
			{
				L.Insert(L.DropIndex, NewItem[i].Item, NewItem[i].ExtraData, NewItem[i].ExtraStrData);
				i--;
				// [Loop Continue]
				goto J0x1C6;
			}
			L.SetIndex(L.DropIndex);
			return true;
		}
	}
	return false;
	//return;	
}

function InternalOnEndDrag(GUIComponent Accepting, bool bAccepted)
{
	local export editinline GUIList L;

	L = lb_UnusedWeapons.List;
	// End:0x4A
	if(bAccepted && Accepting != none)
	{
		L.GetPendingElements();
		L.bRepeatClick = false;
	}
	// End:0x66
	if(Accepting == none)
	{
		L.bRepeatClick = true;
	}
	L.SetOutlineAlpha(255);
	// End:0xA1
	if(L.bNotify)
	{
		L.CheckLinkedObjects(L);
	}
	//return;	
}

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	local array<WeaponRecord> Recs;
	local WeaponInfo WI;
	local int i, j;
	local array<string> ItemNameList;
	local Class<ConflictItem> CI;
	local Class<BC_GameStyle> game_style;
	local WeaponList_ConflictLoadout ConfigList;

	super.InitComponent(MyController, MyOwner);
	lb_UnusedWeapons.List.__CompareItem__Delegate = MyCompareItem;
	lb_UnusedWeapons.List.Add(Headings[0],, "BW", true);
	lb_UnusedWeapons.List.Add(Headings[1],, "I", true);
	game_style = BaseMenu.GetGameStyle();
	// End:0xDF
	if(game_style == none)
	{
		Log("ConfigTab_ConflictLoadout: Couldn't load: No compatible style found");
		return;
	}
	ConfigList = new (none, game_style.default.StyleName) Class'BallisticProV55.WeaponList_ConflictLoadout';
	Class'Engine.CacheManager'.static.GetWeaponList(Recs);
	i = 0;
	J0x113:

	// End:0x2E6 [Loop If]
	if(i < Recs.Length)
	{
		// End:0x13D
		if(Recs[i].ClassName == "")
		{
			// [Explicit Continue]
			goto J0x2DC;
		}
		// End:0x164
		if(!Class'BCoreProV55.BC_WeaponInfoCache'.static.IsValid(Recs[i].ClassName))
		{
			// [Explicit Continue]
			goto J0x2DC;
		}
		WI = Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(Recs[i].ClassName);
		// End:0x19C
		if(!WI.bIsBW)
		{
			// [Explicit Continue]
			goto J0x2DC;
		}
		j = 0;
		J0x1A3:

		// End:0x2A3 [Loop If]
		if(j < ConfigList.ConflictWeapons.Length)
		{
			// End:0x299
			if(ConfigList.ConflictWeapons[j].ClassName ~= Recs[i].ClassName)
			{
				// End:0x240
				if(ConfigList.ConflictWeapons[j].bRed)
				{
					lb_UsedRedWeapons.List.Add(Recs[i].FriendlyName, self, Recs[i].ClassName);
				}
				// End:0x296
				if(ConfigList.ConflictWeapons[j].bBlue)
				{
					lb_UsedBlueWeapons.List.Add(Recs[i].FriendlyName, self, Recs[i].ClassName);
				}
				// [Explicit Break]
				goto J0x2A3;
			}
			j++;
			// [Loop Continue]
			goto J0x1A3;
		}
		J0x2A3:

		lb_UnusedWeapons.List.Add(Recs[i].FriendlyName, self, Recs[i].ClassName);
		J0x2DC:

		i++;
		// [Loop Continue]
		goto J0x113;
	}
	Class'BCoreProV55.BC_WeaponInfoCache'.static.EndSession();
	PlayerOwner().GetAllInt("ConflictItem", ItemNameList);
	i = 0;
	J0x31C:

	// End:0x494 [Loop If]
	if(i < ItemNameList.Length)
	{
		CI = Class<ConflictItem>(DynamicLoadObject(ItemNameList[i], Class'Core.Class'));
		// End:0x48A
		if(CI != none)
		{
			j = 0;
			J0x35F:

			// End:0x454 [Loop If]
			if(j < ConfigList.ConflictWeapons.Length)
			{
				// End:0x44A
				if(ConfigList.ConflictWeapons[j].ClassName ~= ItemNameList[i])
				{
					// End:0x3F4
					if(ConfigList.ConflictWeapons[j].bRed)
					{
						lb_UsedRedWeapons.List.Add(CI.default.ItemName, lb_UsedRedWeapons, ItemNameList[i]);
					}
					// End:0x447
					if(ConfigList.ConflictWeapons[j].bBlue)
					{
						lb_UsedBlueWeapons.List.Add(CI.default.ItemName, lb_UsedRedWeapons, ItemNameList[i]);
					}
					// [Explicit Break]
					goto J0x454;
				}
				j++;
				// [Loop Continue]
				goto J0x35F;
			}
			J0x454:

			lb_UnusedWeapons.List.Add(CI.default.ItemName, lb_UsedRedWeapons, ItemNameList[i]);
		}
		i++;
		// [Loop Continue]
		goto J0x31C;
	}
	lb_UnusedWeapons.List.bDropSource = true;
	lb_UnusedWeapons.List.bDropTarget = true;
	lb_UnusedWeapons.List.__OnDragDrop__Delegate = InternalOnDragDrop;
	lb_UnusedWeapons.List.__OnBeginDrag__Delegate = lb_UnusedWeapons.List.InternalOnBeginDrag;
	lb_UnusedWeapons.List.__OnEndDrag__Delegate = InternalOnEndDrag;
	lb_UnusedWeapons.List.__OnDblClick__Delegate = InternalOnDblClick;
	lb_UsedRedWeapons.List.bDropSource = true;
	lb_UsedRedWeapons.List.bDropTarget = true;
	lb_UsedRedWeapons.List.__OnDragDrop__Delegate = InternalOnDragDrop;
	lb_UsedRedWeapons.List.__OnBeginDrag__Delegate = lb_UsedRedWeapons.List.InternalOnBeginDrag;
	lb_UsedRedWeapons.List.__OnEndDrag__Delegate = lb_UsedRedWeapons.List.InternalOnEndDrag;
	lb_UsedRedWeapons.List.__OnDblClick__Delegate = InternalOnDblClick;
	lb_UsedBlueWeapons.List.bDropSource = true;
	lb_UsedBlueWeapons.List.bDropTarget = true;
	lb_UsedBlueWeapons.List.__OnDragDrop__Delegate = InternalOnDragDrop;
	lb_UsedBlueWeapons.List.__OnBeginDrag__Delegate = lb_UsedBlueWeapons.List.InternalOnBeginDrag;
	lb_UsedBlueWeapons.List.__OnEndDrag__Delegate = lb_UsedBlueWeapons.List.InternalOnEndDrag;
	lb_UsedBlueWeapons.List.__OnDblClick__Delegate = InternalOnDblClick;
	i = 0;
	J0x6ED:

	// End:0x73B [Loop If]
	if(i < Class'BallisticProV55.Mut_ConflictLoadout'.default.LoadoutOptionText.Length)
	{
		co_LoadOpt.AddItem(Class'BallisticProV55.Mut_ConflictLoadout'.default.LoadoutOptionText[i],, string(i));
		i++;
		// [Loop Continue]
		goto J0x6ED;
	}
	co_LoadOpt.ReadOnly(true);
	co_LoadOpt.SetIndex(int(ConfigList.LoadoutOption));
	//return;	
}

function bool InternalOnDblClick(GUIComponent Sender)
{
	// End:0x31
	if(Sender == lb_UnusedWeapons.List)
	{
		InternalOnClick(bAddRed);
		InternalOnClick(bAddBlue);		
	}
	else
	{
		// End:0x57
		if(Sender == lb_UsedRedWeapons.List)
		{
			InternalOnClick(BRemoveRed);			
		}
		else
		{
			// End:0x7A
			if(Sender == lb_UsedBlueWeapons.List)
			{
				InternalOnClick(BRemoveBlue);
			}
		}
	}
	return true;
	//return;	
}

function bool InternalOnClick(GUIComponent Sender)
{
	local int i;

	// End:0xDF
	if(Sender == BAddAllBlue)
	{
		lb_UsedBlueWeapons.List.Clear();
		i = lb_UnusedWeapons.List.Elements.Length - 1;
		J0x48:

		// End:0xDC [Loop If]
		if(i > -1)
		{
			// End:0xD2
			if(!lb_UnusedWeapons.List.Elements[i].bSection)
			{
				lb_UsedBlueWeapons.List.Add(lb_UnusedWeapons.List.GetItemAtIndex(i),, lb_UnusedWeapons.List.GetExtraAtIndex(i));
			}
			i--;
			// [Loop Continue]
			goto J0x48;
		}		
	}
	else
	{
		// End:0x12B
		if(Sender == BRemoveAllBlue)
		{
			J0xEE:

			// End:0x128 [Loop If]
			if(lb_UsedBlueWeapons.List.Elements.Length > 0)
			{
				lb_UsedBlueWeapons.List.Remove(0);
				// [Loop Continue]
				goto J0xEE;
			}			
		}
		else
		{
			// End:0x235
			if(Sender == bAddBlue)
			{
				// End:0x232
				if(!lb_UnusedWeapons.List.IsSection())
				{
					i = 0;
					J0x15E:

					// End:0x1C7 [Loop If]
					if(i < lb_UsedBlueWeapons.List.Elements.Length)
					{
						// End:0x1BD
						if(lb_UsedBlueWeapons.List.GetExtraAtIndex(i) == lb_UnusedWeapons.List.GetExtra())
						{
							// [Explicit Break]
							goto J0x1C7;
						}
						i++;
						// [Loop Continue]
						goto J0x15E;
					}
					J0x1C7:

					// End:0x232
					if(i >= lb_UsedBlueWeapons.List.Elements.Length)
					{
						lb_UsedBlueWeapons.List.Add(lb_UnusedWeapons.List.Get(),, lb_UnusedWeapons.List.GetExtra());
					}
				}				
			}
			else
			{
				// End:0x276
				if(Sender == BRemoveBlue)
				{
					lb_UsedBlueWeapons.List.Remove(lb_UsedBlueWeapons.List.Index);					
				}
				else
				{
					// End:0x355
					if(Sender == BAddAllRed)
					{
						lb_UsedRedWeapons.List.Clear();
						i = lb_UnusedWeapons.List.Elements.Length - 1;
						J0x2BE:

						// End:0x352 [Loop If]
						if(i > -1)
						{
							// End:0x348
							if(!lb_UnusedWeapons.List.Elements[i].bSection)
							{
								lb_UsedRedWeapons.List.Add(lb_UnusedWeapons.List.GetItemAtIndex(i),, lb_UnusedWeapons.List.GetExtraAtIndex(i));
							}
							i--;
							// [Loop Continue]
							goto J0x2BE;
						}						
					}
					else
					{
						// End:0x3A1
						if(Sender == BRemoveAllRed)
						{
							J0x364:

							// End:0x39E [Loop If]
							if(lb_UsedRedWeapons.List.Elements.Length > 0)
							{
								lb_UsedRedWeapons.List.Remove(0);
								// [Loop Continue]
								goto J0x364;
							}							
						}
						else
						{
							// End:0x4AB
							if(Sender == bAddRed)
							{
								// End:0x4A8
								if(!lb_UnusedWeapons.List.IsSection())
								{
									i = 0;
									J0x3D4:

									// End:0x43D [Loop If]
									if(i < lb_UsedRedWeapons.List.Elements.Length)
									{
										// End:0x433
										if(lb_UsedRedWeapons.List.GetExtraAtIndex(i) == lb_UnusedWeapons.List.GetExtra())
										{
											// [Explicit Break]
											goto J0x43D;
										}
										i++;
										// [Loop Continue]
										goto J0x3D4;
									}
									J0x43D:

									// End:0x4A8
									if(i >= lb_UsedRedWeapons.List.Elements.Length)
									{
										lb_UsedRedWeapons.List.Add(lb_UnusedWeapons.List.Get(),, lb_UnusedWeapons.List.GetExtra());
									}
								}								
							}
							else
							{
								// End:0x4E9
								if(Sender == BRemoveRed)
								{
									lb_UsedRedWeapons.List.Remove(lb_UsedRedWeapons.List.Index);
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

function SaveSettings()
{
	local int i, j, k;
	local Class<BC_GameStyle> game_style;
	local WeaponList_ConflictLoadout ConfigList;

	game_style = BaseMenu.GetGameStyle();
	// End:0x69
	if(game_style == none)
	{
		Log("ConfigTab_ConflictLoadout: Couldn't save: No compatible style found");
		return;
	}
	ConfigList = new (none, game_style.default.StyleName) Class'BallisticProV55.WeaponList_ConflictLoadout';
	ConfigList.LoadoutOption = byte(co_LoadOpt.GetIndex());
	ConfigList.ConflictWeapons.Length = 0;
	i = 0;
	J0xBD:

	// End:0x298 [Loop If]
	if(i < lb_UnusedWeapons.List.Elements.Length)
	{
		// End:0x108
		if(lb_UnusedWeapons.List.Elements[i].bSection)
		{
			// [Explicit Continue]
			goto J0x28E;
		}
		k = ConfigList.ConflictWeapons.Length;
		ConfigList.ConflictWeapons.Length = k + 1;
		ConfigList.ConflictWeapons[k].ClassName = lb_UnusedWeapons.List.GetExtraAtIndex(i);
		j = 0;
		J0x173:

		// End:0x1FD [Loop If]
		if(j < lb_UsedRedWeapons.List.Elements.Length)
		{
			// End:0x1F3
			if(lb_UsedRedWeapons.List.GetExtraAtIndex(j) ~= lb_UnusedWeapons.List.GetExtraAtIndex(i))
			{
				ConfigList.ConflictWeapons[k].bRed = true;
				// [Explicit Break]
				goto J0x1FD;
			}
			j++;
			// [Loop Continue]
			goto J0x173;
		}
		J0x1FD:

		j = 0;
		J0x204:

		// End:0x28E [Loop If]
		if(j < lb_UsedBlueWeapons.List.Elements.Length)
		{
			// End:0x284
			if(lb_UsedBlueWeapons.List.GetExtraAtIndex(j) ~= lb_UnusedWeapons.List.GetExtraAtIndex(i))
			{
				ConfigList.ConflictWeapons[k].bBlue = true;
				// [Explicit Break]
				goto J0x28E;
			}
			j++;
			// [Loop Continue]
			goto J0x204;
		}
		J0x28E:

		i++;
		// [Loop Continue]
		goto J0xBD;
	}
	ConfigList.SaveConfig();
	SaveConfig();
	//return;	
}

function LoadSettings()
{
	//return;	
}

function DefaultSettings()
{
	//return;	
}

defaultproperties
{
	// Reference: GUIImage'BallisticProV55.ConfigTab_ConflictLoadout.ImageBoxUnused'
	begin object name="ImageBoxUnused" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.1500000
		WinLeft=0.3750000
		WinWidth=0.2500000
		WinHeight=0.6000000
		RenderWeight=0.0020000
	end object
	Box_Unused=ImageBoxUnused
	// Reference: GUIImage'BallisticProV55.ConfigTab_ConflictLoadout.ImageBoxUsedRed'
	begin object name="ImageBoxUsedRed" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.1500000
		WinLeft=0.6750000
		WinWidth=0.2500000
		WinHeight=0.6000000
		RenderWeight=0.0020000
	end object
	Box_UsedRed=ImageBoxUsedRed
	// Reference: GUIImage'BallisticProV55.ConfigTab_ConflictLoadout.ImageBoxUsedBlue'
	begin object name="ImageBoxUsedBlue" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.1500000
		WinLeft=0.0750000
		WinWidth=0.2500000
		WinHeight=0.6000000
		RenderWeight=0.0020000
	end object
	Box_UsedBlue=ImageBoxUsedBlue
	// Reference: GUIButton'BallisticProV55.ConfigTab_ConflictLoadout.AddButtonBlue'
	begin object name="AddButtonBlue" class=XInterface.GUIButton
		Caption="< < <"
		WinTop=0.7500000
		WinLeft=0.3750000
		WinWidth=0.1000000
		TabOrder=0
		OnClick=ConfigTab_ConflictLoadout.InternalOnClick
		OnKeyEvent=AddButton.InternalOnKeyEvent
	end object
	bAddBlue=AddButtonBlue
	// Reference: GUIButton'BallisticProV55.ConfigTab_ConflictLoadout.RemoveButtonBlue'
	begin object name="RemoveButtonBlue" class=XInterface.GUIButton
		Caption="> > >"
		WinTop=0.7500000
		WinLeft=0.2250000
		WinWidth=0.1000000
		TabOrder=0
		OnClick=ConfigTab_ConflictLoadout.InternalOnClick
		OnKeyEvent=RemoveButton.InternalOnKeyEvent
	end object
	BRemoveBlue=RemoveButtonBlue
	// Reference: GUIButton'BallisticProV55.ConfigTab_ConflictLoadout.AddAllButtonBlue'
	begin object name="AddAllButtonBlue" class=XInterface.GUIButton
		Caption="FILL"
		WinTop=0.7500000
		WinLeft=0.0750000
		WinWidth=0.0750000
		TabOrder=0
		OnClick=ConfigTab_ConflictLoadout.InternalOnClick
		OnKeyEvent=AddAllButton.InternalOnKeyEvent
	end object
	BAddAllBlue=AddAllButtonBlue
	// Reference: GUIButton'BallisticProV55.ConfigTab_ConflictLoadout.RemoveAllButtonBlue'
	begin object name="RemoveAllButtonBlue" class=XInterface.GUIButton
		Caption="EMPTY"
		WinTop=0.7500000
		WinLeft=0.1500000
		WinWidth=0.0750000
		TabOrder=0
		OnClick=ConfigTab_ConflictLoadout.InternalOnClick
		OnKeyEvent=RemoveAllButton.InternalOnKeyEvent
	end object
	BRemoveAllBlue=RemoveAllButtonBlue
	// Reference: GUIButton'BallisticProV55.ConfigTab_ConflictLoadout.AddButtonRed'
	begin object name="AddButtonRed" class=XInterface.GUIButton
		Caption="> > >"
		WinTop=0.7500000
		WinLeft=0.5250000
		WinWidth=0.1000000
		TabOrder=0
		OnClick=ConfigTab_ConflictLoadout.InternalOnClick
		OnKeyEvent=AddButton.InternalOnKeyEvent
	end object
	bAddRed=AddButtonRed
	// Reference: GUIButton'BallisticProV55.ConfigTab_ConflictLoadout.RemoveButtonRed'
	begin object name="RemoveButtonRed" class=XInterface.GUIButton
		Caption="< < <"
		WinTop=0.7500000
		WinLeft=0.6750000
		WinWidth=0.1000000
		TabOrder=0
		OnClick=ConfigTab_ConflictLoadout.InternalOnClick
		OnKeyEvent=RemoveButton.InternalOnKeyEvent
	end object
	BRemoveRed=RemoveButtonRed
	// Reference: GUIButton'BallisticProV55.ConfigTab_ConflictLoadout.AddAllButtonRed'
	begin object name="AddAllButtonRed" class=XInterface.GUIButton
		Caption="FILL"
		WinTop=0.7500000
		WinLeft=0.8500000
		WinWidth=0.0750000
		TabOrder=0
		OnClick=ConfigTab_ConflictLoadout.InternalOnClick
		OnKeyEvent=AddAllButton.InternalOnKeyEvent
	end object
	BAddAllRed=AddAllButtonRed
	// Reference: GUIButton'BallisticProV55.ConfigTab_ConflictLoadout.RemoveAllButtonRed'
	begin object name="RemoveAllButtonRed" class=XInterface.GUIButton
		Caption="EMPTY"
		WinTop=0.7500000
		WinLeft=0.7750000
		WinWidth=0.0750000
		TabOrder=0
		OnClick=ConfigTab_ConflictLoadout.InternalOnClick
		OnKeyEvent=RemoveAllButton.InternalOnKeyEvent
	end object
	BRemoveAllRed=RemoveAllButtonRed
	// Reference: GUIListBox'BallisticProV55.ConfigTab_ConflictLoadout.UsedRedWeaponList'
	begin object name="UsedRedWeaponList" class=XInterface.GUIListBox
		bVisibleWhenEmpty=true
		OnCreateComponent=UsedWeaponList.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="List of the weapons for red team. Be careful to make sure there are always some available weapons when using evolution mode."
		WinTop=0.1900000
		WinLeft=0.6850000
		WinWidth=0.2300000
		WinHeight=0.5500000
		RenderWeight=0.5100000
		TabOrder=1
	end object
	lb_UsedRedWeapons=UsedRedWeaponList
	// Reference: GUIListBox'BallisticProV55.ConfigTab_ConflictLoadout.UsedBlueWeaponList'
	begin object name="UsedBlueWeaponList" class=XInterface.GUIListBox
		bVisibleWhenEmpty=true
		OnCreateComponent=UsedWeaponList.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="List of the weapons for blue team. Be careful to make sure there are always some available weapons when using evolution mode."
		WinTop=0.1900000
		WinLeft=0.0850000
		WinWidth=0.2300000
		WinHeight=0.5500000
		RenderWeight=0.5100000
		TabOrder=1
	end object
	lb_UsedBlueWeapons=UsedBlueWeaponList
	// Reference: GUIListBox'BallisticProV55.ConfigTab_ConflictLoadout.UnusedWeaponList'
	begin object name="UnusedWeaponList" class=XInterface.GUIListBox
		bVisibleWhenEmpty=true
		bSorted=true
		OnCreateComponent=UnusedWeaponList.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="List of weapons that you can give to the teams."
		WinTop=0.1900000
		WinLeft=0.3860000
		WinWidth=0.2300000
		WinHeight=0.5500000
		RenderWeight=0.5100000
		TabOrder=1
	end object
	lb_UnusedWeapons=UnusedWeaponList
	// Reference: GUILabel'BallisticProV55.ConfigTab_ConflictLoadout.RedLabel'
	begin object name="RedLabel" class=XInterface.GUILabel
		Caption="Red"
		TextAlign=1
		TextColor=(R=255,G=0,B=0,A=255)
		FontScale=0
		WinTop=0.1500000
		WinLeft=0.7000000
		WinWidth=0.2000000
		WinHeight=0.0400000
	end object
	l_Red=RedLabel
	// Reference: GUILabel'BallisticProV55.ConfigTab_ConflictLoadout.BlueLabel'
	begin object name="BlueLabel" class=XInterface.GUILabel
		Caption="Blue"
		TextAlign=1
		TextColor=(R=0,G=255,B=255,A=255)
		FontScale=0
		WinTop=0.1500000
		WinLeft=0.1000000
		WinWidth=0.2000000
		WinHeight=0.0400000
	end object
	l_Blue=BlueLabel
	// Reference: GUILabel'BallisticProV55.ConfigTab_ConflictLoadout.UnusedLabel'
	begin object name="UnusedLabel" class=XInterface.GUILabel
		Caption="Potentials"
		TextAlign=1
		TextColor=(R=255,G=255,B=0,A=255)
		FontScale=0
		WinTop=0.1500000
		WinLeft=0.4000000
		WinWidth=0.2000000
		WinHeight=0.0400000
	end object
	l_Unused=UnusedLabel
	// Reference: moComboBox'BallisticProV55.ConfigTab_ConflictLoadout.LoadOptCombo'
	begin object name="LoadOptCombo" class=XInterface.moComboBox
		OnCreateComponent=LoadOptCombo.InternalOnCreateComponent
		IniOption="@Internal"
		IniDefault="High"
		Hint="Choose the type of loadout."
		WinTop=0.8250000
		WinLeft=0.2750000
		WinWidth=0.3000000
	end object
	co_LoadOpt=LoadOptCombo
	Headings[0]="Ballistic Weapons"
	Headings[1]="Items"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: moComboBox'BallisticProV55.ConfigTab_ConflictLoadout.LoadOptCombo'
begin object name="LoadOptCombo" class=XInterface.moComboBox
	OnCreateComponent=LoadOptCombo.InternalOnCreateComponent
	IniOption="@Internal"
	IniDefault="High"
	Hint="Choose the type of loadout."
	WinTop=0.8250000
	WinLeft=0.2750000
	WinWidth=0.3000000
end object
// Reference: GUIListBox'BallisticProV55.ConfigTab_ConflictLoadout.UnusedWeaponList'
begin object name="UnusedWeaponList" class=XInterface.GUIListBox
	bVisibleWhenEmpty=true
	bSorted=true
	OnCreateComponent=UnusedWeaponList.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="List of weapons that you can give to the teams."
	WinTop=0.1900000
	WinLeft=0.3860000
	WinWidth=0.2300000
	WinHeight=0.5500000
	RenderWeight=0.5100000
	TabOrder=1
end object
// Reference: GUIImage'BallisticProV55.ConfigTab_ConflictLoadout.ImageBoxUnused'
begin object name="ImageBoxUnused" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.1500000
	WinLeft=0.3750000
	WinWidth=0.2500000
	WinHeight=0.6000000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.ConfigTab_ConflictLoadout.ImageBoxUsedRed'
begin object name="ImageBoxUsedRed" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.1500000
	WinLeft=0.6750000
	WinWidth=0.2500000
	WinHeight=0.6000000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.ConfigTab_ConflictLoadout.ImageBoxUsedBlue'
begin object name="ImageBoxUsedBlue" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.1500000
	WinLeft=0.0750000
	WinWidth=0.2500000
	WinHeight=0.6000000
	RenderWeight=0.0020000
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_ConflictLoadout.AddButtonBlue'
begin object name="AddButtonBlue" class=XInterface.GUIButton
	Caption="< < <"
	WinTop=0.7500000
	WinLeft=0.3750000
	WinWidth=0.1000000
	TabOrder=0
	OnClick=ConfigTab_ConflictLoadout.InternalOnClick
	OnKeyEvent=AddButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_ConflictLoadout.RemoveButtonBlue'
begin object name="RemoveButtonBlue" class=XInterface.GUIButton
	Caption="> > >"
	WinTop=0.7500000
	WinLeft=0.2250000
	WinWidth=0.1000000
	TabOrder=0
	OnClick=ConfigTab_ConflictLoadout.InternalOnClick
	OnKeyEvent=RemoveButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_ConflictLoadout.AddAllButtonBlue'
begin object name="AddAllButtonBlue" class=XInterface.GUIButton
	Caption="FILL"
	WinTop=0.7500000
	WinLeft=0.0750000
	WinWidth=0.0750000
	TabOrder=0
	OnClick=ConfigTab_ConflictLoadout.InternalOnClick
	OnKeyEvent=AddAllButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_ConflictLoadout.RemoveAllButtonBlue'
begin object name="RemoveAllButtonBlue" class=XInterface.GUIButton
	Caption="EMPTY"
	WinTop=0.7500000
	WinLeft=0.1500000
	WinWidth=0.0750000
	TabOrder=0
	OnClick=ConfigTab_ConflictLoadout.InternalOnClick
	OnKeyEvent=RemoveAllButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_ConflictLoadout.AddButtonRed'
begin object name="AddButtonRed" class=XInterface.GUIButton
	Caption="> > >"
	WinTop=0.7500000
	WinLeft=0.5250000
	WinWidth=0.1000000
	TabOrder=0
	OnClick=ConfigTab_ConflictLoadout.InternalOnClick
	OnKeyEvent=AddButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_ConflictLoadout.RemoveButtonRed'
begin object name="RemoveButtonRed" class=XInterface.GUIButton
	Caption="< < <"
	WinTop=0.7500000
	WinLeft=0.6750000
	WinWidth=0.1000000
	TabOrder=0
	OnClick=ConfigTab_ConflictLoadout.InternalOnClick
	OnKeyEvent=RemoveButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_ConflictLoadout.AddAllButtonRed'
begin object name="AddAllButtonRed" class=XInterface.GUIButton
	Caption="FILL"
	WinTop=0.7500000
	WinLeft=0.8500000
	WinWidth=0.0750000
	TabOrder=0
	OnClick=ConfigTab_ConflictLoadout.InternalOnClick
	OnKeyEvent=AddAllButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigTab_ConflictLoadout.RemoveAllButtonRed'
begin object name="RemoveAllButtonRed" class=XInterface.GUIButton
	Caption="EMPTY"
	WinTop=0.7500000
	WinLeft=0.7750000
	WinWidth=0.0750000
	TabOrder=0
	OnClick=ConfigTab_ConflictLoadout.InternalOnClick
	OnKeyEvent=RemoveAllButton.InternalOnKeyEvent
end object
// Reference: GUIListBox'BallisticProV55.ConfigTab_ConflictLoadout.UsedRedWeaponList'
begin object name="UsedRedWeaponList" class=XInterface.GUIListBox
	bVisibleWhenEmpty=true
	OnCreateComponent=UsedWeaponList.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="List of the weapons for red team. Be careful to make sure there are always some available weapons when using evolution mode."
	WinTop=0.1900000
	WinLeft=0.6850000
	WinWidth=0.2300000
	WinHeight=0.5500000
	RenderWeight=0.5100000
	TabOrder=1
end object
// Reference: GUIListBox'BallisticProV55.ConfigTab_ConflictLoadout.UsedBlueWeaponList'
begin object name="UsedBlueWeaponList" class=XInterface.GUIListBox
	bVisibleWhenEmpty=true
	OnCreateComponent=UsedWeaponList.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="List of the weapons for blue team. Be careful to make sure there are always some available weapons when using evolution mode."
	WinTop=0.1900000
	WinLeft=0.0850000
	WinWidth=0.2300000
	WinHeight=0.5500000
	RenderWeight=0.5100000
	TabOrder=1
end object
// Reference: GUILabel'BallisticProV55.ConfigTab_ConflictLoadout.RedLabel'
begin object name="RedLabel" class=XInterface.GUILabel
	Caption="Red"
	TextAlign=1
	TextColor=(R=255,G=0,B=0,A=255)
	FontScale=0
	WinTop=0.1500000
	WinLeft=0.7000000
	WinWidth=0.2000000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.ConfigTab_ConflictLoadout.BlueLabel'
begin object name="BlueLabel" class=XInterface.GUILabel
	Caption="Blue"
	TextAlign=1
	TextColor=(R=0,G=255,B=255,A=255)
	FontScale=0
	WinTop=0.1500000
	WinLeft=0.1000000
	WinWidth=0.2000000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.ConfigTab_ConflictLoadout.UnusedLabel'
begin object name="UnusedLabel" class=XInterface.GUILabel
	Caption="Potentials"
	TextAlign=1
	TextColor=(R=255,G=255,B=0,A=255)
	FontScale=0
	WinTop=0.1500000
	WinLeft=0.4000000
	WinWidth=0.2000000
	WinHeight=0.0400000
end object
