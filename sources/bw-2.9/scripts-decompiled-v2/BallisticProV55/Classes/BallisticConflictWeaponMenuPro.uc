class BallisticConflictWeaponMenuPro extends UT2K4GUIPage
	editinlinenew
	instanced;

var() automated GUIImage MyBack;
var() automated GUIImage Box_Unused;
var() automated GUIImage Box_UsedRed;
var() automated GUIImage Box_UsedBlue;
var() automated GUIButton bDone;
var() automated GUIButton bCancel;
var() automated GUIButton bAddBlue;
var() automated GUIButton BRemoveBlue;
var() automated GUIButton BAddAllBlue;
var() automated GUIButton BRemoveAllBlue;
var() automated GUIButton bAddRed;
var() automated GUIButton BRemoveRed;
var() automated GUIButton BAddAllRed;
var() automated GUIButton BRemoveAllRed;
var() automated GUIHeader MyHeader;
var() automated GUIListBox lb_UsedRedWeapons;
var() automated GUIListBox lb_UsedBlueWeapons;
var() automated GUIListBox lb_UnusedWeapons;
var() automated GUILabel l_Red;
var() automated GUILabel l_Blue;
var() automated GUILabel l_Unused;
var() automated moComboBox co_LoadOpt;
var() localized string Headings[4];

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
	local int i, j;
	local array<string> ItemNameList;
	local Class<ConflictItem> CI;

	super(GUIPage).InitComponent(MyController, MyOwner);
	lb_UnusedWeapons.List.__CompareItem__Delegate = MyCompareItem;
	lb_UnusedWeapons.List.Add(Headings[0],, "BW", true);
	lb_UnusedWeapons.List.Add(Headings[1],, "I", true);
	lb_UnusedWeapons.List.Add(Headings[2],, "UT", true);
	lb_UnusedWeapons.List.Add(Headings[3],, "O", true);
	Class'Engine.CacheManager'.static.GetWeaponList(Recs);
	i = 0;
	J0xD9:

	// End:0x3D1 [Loop If]
	if(i < Recs.Length)
	{
		// End:0x110
		if(!Class'BCoreProV55.BC_WeaponInfoCache'.static.IsValid(Recs[i].ClassName))
		{
			// [Explicit Continue]
			goto J0x3C7;
		}
		j = 0;
		J0x117:

		// End:0x311 [Loop If]
		if(j < Class'BallisticProV55.Mut_ConflictLoadout'.default.ConflictWeapons.Length)
		{
			// End:0x307
			if(Class'BallisticProV55.Mut_ConflictLoadout'.default.ConflictWeapons[j].ClassName ~= Recs[i].ClassName)
			{
				// End:0x231
				if(Class'BallisticProV55.Mut_ConflictLoadout'.default.ConflictWeapons[j].bRed)
				{
					// End:0x1F8
					if((Recs[i].ClassName != "") && Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(Recs[i].ClassName).bIsBW)
					{
						lb_UsedRedWeapons.List.Add(Recs[i].FriendlyName, self, Recs[i].ClassName);						
					}
					else
					{
						lb_UsedRedWeapons.List.Add(Recs[i].FriendlyName,, Recs[i].ClassName);
					}
				}
				// End:0x304
				if(Class'BallisticProV55.Mut_ConflictLoadout'.default.ConflictWeapons[j].bBlue)
				{
					// End:0x2CB
					if((Recs[i].ClassName != "") && Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(Recs[i].ClassName).bIsBW)
					{
						lb_UsedBlueWeapons.List.Add(Recs[i].FriendlyName, self, Recs[i].ClassName);						
					}
					else
					{
						lb_UsedBlueWeapons.List.Add(Recs[i].FriendlyName,, Recs[i].ClassName);
					}
				}
				// [Explicit Break]
				goto J0x311;
			}
			j++;
			// [Loop Continue]
			goto J0x117;
		}
		J0x311:

		// End:0x38E
		if((Recs[i].ClassName != "") && Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(Recs[i].ClassName).bIsBW)
		{
			lb_UnusedWeapons.List.Add(Recs[i].FriendlyName, self, Recs[i].ClassName);
			// [Explicit Continue]
			goto J0x3C7;
		}
		lb_UnusedWeapons.List.Add(Recs[i].FriendlyName,, Recs[i].ClassName);
		J0x3C7:

		i++;
		// [Loop Continue]
		goto J0xD9;
	}
	Class'BCoreProV55.BC_WeaponInfoCache'.static.EndSession();
	PlayerOwner().GetAllInt("ConflictItem", ItemNameList);
	i = 0;
	J0x407:

	// End:0x57F [Loop If]
	if(i < ItemNameList.Length)
	{
		CI = Class<ConflictItem>(DynamicLoadObject(ItemNameList[i], Class'Core.Class'));
		// End:0x575
		if(CI != none)
		{
			j = 0;
			J0x44A:

			// End:0x53F [Loop If]
			if(j < Class'BallisticProV55.Mut_ConflictLoadout'.default.ConflictWeapons.Length)
			{
				// End:0x535
				if(Class'BallisticProV55.Mut_ConflictLoadout'.default.ConflictWeapons[j].ClassName ~= ItemNameList[i])
				{
					// End:0x4DF
					if(Class'BallisticProV55.Mut_ConflictLoadout'.default.ConflictWeapons[j].bRed)
					{
						lb_UsedRedWeapons.List.Add(CI.default.ItemName, lb_UsedRedWeapons, ItemNameList[i]);
					}
					// End:0x532
					if(Class'BallisticProV55.Mut_ConflictLoadout'.default.ConflictWeapons[j].bBlue)
					{
						lb_UsedBlueWeapons.List.Add(CI.default.ItemName, lb_UsedRedWeapons, ItemNameList[i]);
					}
					// [Explicit Break]
					goto J0x53F;
				}
				j++;
				// [Loop Continue]
				goto J0x44A;
			}
			J0x53F:

			lb_UnusedWeapons.List.Add(CI.default.ItemName, lb_UsedRedWeapons, ItemNameList[i]);
		}
		i++;
		// [Loop Continue]
		goto J0x407;
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
	J0x7D8:

	// End:0x826 [Loop If]
	if(i < Class'BallisticProV55.Mut_ConflictLoadout'.default.LoadoutOptionText.Length)
	{
		co_LoadOpt.AddItem(Class'BallisticProV55.Mut_ConflictLoadout'.default.LoadoutOptionText[i],, string(i));
		i++;
		// [Loop Continue]
		goto J0x7D8;
	}
	co_LoadOpt.ReadOnly(true);
	co_LoadOpt.SetIndex(int(Class'BallisticProV55.Mut_ConflictLoadout'.default.LoadoutOption));
	//return;	
}

function bool InternalOnKeyEvent(out byte Key, out byte State, float Delta)
{
	// End:0x2A
	if((int(Key) == 13) && int(State) == 3)
	{
		return InternalOnClick(bDone);
	}
	return false;
	//return;	
}

function InternalOnClose(optional bool bCanceled)
{
	OnClose(bCanceled);
	//return;	
}

function bool InternalOnClick(GUIComponent Sender)
{
	local int i, j, k;

	// End:0x21
	if(Sender == bCancel)
	{
		Controller.CloseMenu();		
	}
	else
	{
		// End:0x100
		if(Sender == BAddAllBlue)
		{
			lb_UsedBlueWeapons.List.Clear();
			i = lb_UnusedWeapons.List.Elements.Length - 1;
			J0x69:

			// End:0xFD [Loop If]
			if(i > -1)
			{
				// End:0xF3
				if(!lb_UnusedWeapons.List.Elements[i].bSection)
				{
					lb_UsedBlueWeapons.List.Add(lb_UnusedWeapons.List.GetItemAtIndex(i),, lb_UnusedWeapons.List.GetExtraAtIndex(i));
				}
				i--;
				// [Loop Continue]
				goto J0x69;
			}			
		}
		else
		{
			// End:0x14C
			if(Sender == BRemoveAllBlue)
			{
				J0x10F:

				// End:0x149 [Loop If]
				if(lb_UsedBlueWeapons.List.Elements.Length > 0)
				{
					lb_UsedBlueWeapons.List.Remove(0);
					// [Loop Continue]
					goto J0x10F;
				}				
			}
			else
			{
				// End:0x256
				if(Sender == bAddBlue)
				{
					// End:0x253
					if(!lb_UnusedWeapons.List.IsSection())
					{
						i = 0;
						J0x17F:

						// End:0x1E8 [Loop If]
						if(i < lb_UsedBlueWeapons.List.Elements.Length)
						{
							// End:0x1DE
							if(lb_UsedBlueWeapons.List.GetExtraAtIndex(i) == lb_UnusedWeapons.List.GetExtra())
							{
								// [Explicit Break]
								goto J0x1E8;
							}
							i++;
							// [Loop Continue]
							goto J0x17F;
						}
						J0x1E8:

						// End:0x253
						if(i >= lb_UsedBlueWeapons.List.Elements.Length)
						{
							lb_UsedBlueWeapons.List.Add(lb_UnusedWeapons.List.Get(),, lb_UnusedWeapons.List.GetExtra());
						}
					}					
				}
				else
				{
					// End:0x297
					if(Sender == BRemoveBlue)
					{
						lb_UsedBlueWeapons.List.Remove(lb_UsedBlueWeapons.List.Index);						
					}
					else
					{
						// End:0x376
						if(Sender == BAddAllRed)
						{
							lb_UsedRedWeapons.List.Clear();
							i = lb_UnusedWeapons.List.Elements.Length - 1;
							J0x2DF:

							// End:0x373 [Loop If]
							if(i > -1)
							{
								// End:0x369
								if(!lb_UnusedWeapons.List.Elements[i].bSection)
								{
									lb_UsedRedWeapons.List.Add(lb_UnusedWeapons.List.GetItemAtIndex(i),, lb_UnusedWeapons.List.GetExtraAtIndex(i));
								}
								i--;
								// [Loop Continue]
								goto J0x2DF;
							}							
						}
						else
						{
							// End:0x3C2
							if(Sender == BRemoveAllRed)
							{
								J0x385:

								// End:0x3BF [Loop If]
								if(lb_UsedRedWeapons.List.Elements.Length > 0)
								{
									lb_UsedRedWeapons.List.Remove(0);
									// [Loop Continue]
									goto J0x385;
								}								
							}
							else
							{
								// End:0x4CC
								if(Sender == bAddRed)
								{
									// End:0x4C9
									if(!lb_UnusedWeapons.List.IsSection())
									{
										i = 0;
										J0x3F5:

										// End:0x45E [Loop If]
										if(i < lb_UsedRedWeapons.List.Elements.Length)
										{
											// End:0x454
											if(lb_UsedRedWeapons.List.GetExtraAtIndex(i) == lb_UnusedWeapons.List.GetExtra())
											{
												// [Explicit Break]
												goto J0x45E;
											}
											i++;
											// [Loop Continue]
											goto J0x3F5;
										}
										J0x45E:

										// End:0x4C9
										if(i >= lb_UsedRedWeapons.List.Elements.Length)
										{
											lb_UsedRedWeapons.List.Add(lb_UnusedWeapons.List.Get(),, lb_UnusedWeapons.List.GetExtra());
										}
									}									
								}
								else
								{
									// End:0x50D
									if(Sender == BRemoveRed)
									{
										lb_UsedRedWeapons.List.Remove(lb_UsedRedWeapons.List.Index);										
									}
									else
									{
										// End:0x74D
										if(Sender == bDone)
										{
											Class'BallisticProV55.Mut_ConflictLoadout'.default.LoadoutOption = byte(co_LoadOpt.GetIndex());
											Class'BallisticProV55.Mut_ConflictLoadout'.default.ConflictWeapons.Length = 0;
											i = 0;
											J0x554:

											// End:0x72F [Loop If]
											if(i < lb_UnusedWeapons.List.Elements.Length)
											{
												// End:0x59F
												if(lb_UnusedWeapons.List.Elements[i].bSection)
												{
													// [Explicit Continue]
													goto J0x725;
												}
												k = Class'BallisticProV55.Mut_ConflictLoadout'.default.ConflictWeapons.Length;
												Class'BallisticProV55.Mut_ConflictLoadout'.default.ConflictWeapons.Length = k + 1;
												Class'BallisticProV55.Mut_ConflictLoadout'.default.ConflictWeapons[k].ClassName = lb_UnusedWeapons.List.GetExtraAtIndex(i);
												j = 0;
												J0x60A:

												// End:0x694 [Loop If]
												if(j < lb_UsedRedWeapons.List.Elements.Length)
												{
													// End:0x68A
													if(lb_UsedRedWeapons.List.GetExtraAtIndex(j) ~= lb_UnusedWeapons.List.GetExtraAtIndex(i))
													{
														Class'BallisticProV55.Mut_ConflictLoadout'.default.ConflictWeapons[k].bRed = true;
														// [Explicit Break]
														goto J0x694;
													}
													j++;
													// [Loop Continue]
													goto J0x60A;
												}
												J0x694:

												j = 0;
												J0x69B:

												// End:0x725 [Loop If]
												if(j < lb_UsedBlueWeapons.List.Elements.Length)
												{
													// End:0x71B
													if(lb_UsedBlueWeapons.List.GetExtraAtIndex(j) ~= lb_UnusedWeapons.List.GetExtraAtIndex(i))
													{
														Class'BallisticProV55.Mut_ConflictLoadout'.default.ConflictWeapons[k].bBlue = true;
														// [Explicit Break]
														goto J0x725;
													}
													j++;
													// [Loop Continue]
													goto J0x69B;
												}
												J0x725:

												i++;
												// [Loop Continue]
												goto J0x554;
											}
											Class'BallisticProV55.Mut_ConflictLoadout'.static.StaticSaveConfig();
											Controller.CloseMenu();
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

function InternalOnChange(GUIComponent Sender)
{
	//return;	
}

defaultproperties
{
	// Reference: GUIImage'BallisticProV55.BallisticConflictWeaponMenuPro.BackImage'
	begin object name="BackImage" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display95'
		ImageStyle=1
		WinTop=0.1000000
		WinLeft=0.0500000
		WinWidth=0.9000000
		WinHeight=0.8000000
		RenderWeight=0.0010000
	end object
	MyBack=BackImage
	// Reference: GUIImage'BallisticProV55.BallisticConflictWeaponMenuPro.ImageBoxUnused'
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
	// Reference: GUIImage'BallisticProV55.BallisticConflictWeaponMenuPro.ImageBoxUsedRed'
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
	// Reference: GUIImage'BallisticProV55.BallisticConflictWeaponMenuPro.ImageBoxUsedBlue'
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
	// Reference: GUIButton'BallisticProV55.BallisticConflictWeaponMenuPro.DoneButton'
	begin object name="DoneButton" class=XInterface.GUIButton
		Caption="DONE"
		WinTop=0.8250000
		WinLeft=0.3000000
		WinWidth=0.1000000
		TabOrder=0
		OnClick=BallisticConflictWeaponMenuPro.InternalOnClick
		OnKeyEvent=DoneButton.InternalOnKeyEvent
	end object
	bDone=DoneButton
	// Reference: GUIButton'BallisticProV55.BallisticConflictWeaponMenuPro.CancelButton'
	begin object name="CancelButton" class=XInterface.GUIButton
		Caption="CANCEL"
		WinTop=0.8250000
		WinLeft=0.6000000
		WinWidth=0.1000000
		TabOrder=1
		OnClick=BallisticConflictWeaponMenuPro.InternalOnClick
		OnKeyEvent=CancelButton.InternalOnKeyEvent
	end object
	bCancel=CancelButton
	// Reference: GUIButton'BallisticProV55.BallisticConflictWeaponMenuPro.AddButtonBlue'
	begin object name="AddButtonBlue" class=XInterface.GUIButton
		Caption="< < <"
		WinTop=0.7500000
		WinLeft=0.3750000
		WinWidth=0.1000000
		TabOrder=0
		OnClick=BallisticConflictWeaponMenuPro.InternalOnClick
		OnKeyEvent=AddButton.InternalOnKeyEvent
	end object
	bAddBlue=AddButtonBlue
	// Reference: GUIButton'BallisticProV55.BallisticConflictWeaponMenuPro.RemoveButtonBlue'
	begin object name="RemoveButtonBlue" class=XInterface.GUIButton
		Caption="> > >"
		WinTop=0.7500000
		WinLeft=0.2250000
		WinWidth=0.1000000
		TabOrder=0
		OnClick=BallisticConflictWeaponMenuPro.InternalOnClick
		OnKeyEvent=RemoveButton.InternalOnKeyEvent
	end object
	BRemoveBlue=RemoveButtonBlue
	// Reference: GUIButton'BallisticProV55.BallisticConflictWeaponMenuPro.AddAllButtonBlue'
	begin object name="AddAllButtonBlue" class=XInterface.GUIButton
		Caption="FILL"
		WinTop=0.7500000
		WinLeft=0.0750000
		WinWidth=0.0750000
		TabOrder=0
		OnClick=BallisticConflictWeaponMenuPro.InternalOnClick
		OnKeyEvent=AddAllButton.InternalOnKeyEvent
	end object
	BAddAllBlue=AddAllButtonBlue
	// Reference: GUIButton'BallisticProV55.BallisticConflictWeaponMenuPro.RemoveAllButtonBlue'
	begin object name="RemoveAllButtonBlue" class=XInterface.GUIButton
		Caption="EMPTY"
		WinTop=0.7500000
		WinLeft=0.1500000
		WinWidth=0.0750000
		TabOrder=0
		OnClick=BallisticConflictWeaponMenuPro.InternalOnClick
		OnKeyEvent=RemoveAllButton.InternalOnKeyEvent
	end object
	BRemoveAllBlue=RemoveAllButtonBlue
	// Reference: GUIButton'BallisticProV55.BallisticConflictWeaponMenuPro.AddButtonRed'
	begin object name="AddButtonRed" class=XInterface.GUIButton
		Caption="> > >"
		WinTop=0.7500000
		WinLeft=0.5250000
		WinWidth=0.1000000
		TabOrder=0
		OnClick=BallisticConflictWeaponMenuPro.InternalOnClick
		OnKeyEvent=AddButton.InternalOnKeyEvent
	end object
	bAddRed=AddButtonRed
	// Reference: GUIButton'BallisticProV55.BallisticConflictWeaponMenuPro.RemoveButtonRed'
	begin object name="RemoveButtonRed" class=XInterface.GUIButton
		Caption="< < <"
		WinTop=0.7500000
		WinLeft=0.6750000
		WinWidth=0.1000000
		TabOrder=0
		OnClick=BallisticConflictWeaponMenuPro.InternalOnClick
		OnKeyEvent=RemoveButton.InternalOnKeyEvent
	end object
	BRemoveRed=RemoveButtonRed
	// Reference: GUIButton'BallisticProV55.BallisticConflictWeaponMenuPro.AddAllButtonRed'
	begin object name="AddAllButtonRed" class=XInterface.GUIButton
		Caption="FILL"
		WinTop=0.7500000
		WinLeft=0.8500000
		WinWidth=0.0750000
		TabOrder=0
		OnClick=BallisticConflictWeaponMenuPro.InternalOnClick
		OnKeyEvent=AddAllButton.InternalOnKeyEvent
	end object
	BAddAllRed=AddAllButtonRed
	// Reference: GUIButton'BallisticProV55.BallisticConflictWeaponMenuPro.RemoveAllButtonRed'
	begin object name="RemoveAllButtonRed" class=XInterface.GUIButton
		Caption="EMPTY"
		WinTop=0.7500000
		WinLeft=0.7750000
		WinWidth=0.0750000
		TabOrder=0
		OnClick=BallisticConflictWeaponMenuPro.InternalOnClick
		OnKeyEvent=RemoveAllButton.InternalOnKeyEvent
	end object
	BRemoveAllRed=RemoveAllButtonRed
	// Reference: GUIHeader'BallisticProV55.BallisticConflictWeaponMenuPro.DaBeegHeader'
	begin object name="DaBeegHeader" class=XInterface.GUIHeader
		bUseTextHeight=true
		Caption="Ballistic Conflict Team Weapons"
		FontScale=1
		WinTop=0.1000000
		WinLeft=0.0500000
		WinWidth=0.9000000
		WinHeight=0.0429690
	end object
	MyHeader=DaBeegHeader
	// Reference: GUIListBox'BallisticProV55.BallisticConflictWeaponMenuPro.UsedRedWeaponList'
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
	// Reference: GUIListBox'BallisticProV55.BallisticConflictWeaponMenuPro.UsedBlueWeaponList'
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
	// Reference: GUIListBox'BallisticProV55.BallisticConflictWeaponMenuPro.UnusedWeaponList'
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
	// Reference: GUILabel'BallisticProV55.BallisticConflictWeaponMenuPro.l_RedLabel'
	begin object name="l_RedLabel" class=XInterface.GUILabel
		Caption="Red"
		TextAlign=1
		TextColor=(R=255,G=0,B=0,A=255)
		FontScale=0
		WinTop=0.1500000
		WinLeft=0.7000000
		WinWidth=0.2000000
		WinHeight=0.0400000
	end object
	l_Red=l_RedLabel
	// Reference: GUILabel'BallisticProV55.BallisticConflictWeaponMenuPro.l_BlueLabel'
	begin object name="l_BlueLabel" class=XInterface.GUILabel
		Caption="Blue"
		TextAlign=1
		TextColor=(R=0,G=255,B=255,A=255)
		FontScale=0
		WinTop=0.1500000
		WinLeft=0.1000000
		WinWidth=0.2000000
		WinHeight=0.0400000
	end object
	l_Blue=l_BlueLabel
	// Reference: GUILabel'BallisticProV55.BallisticConflictWeaponMenuPro.l_UnusedLabel'
	begin object name="l_UnusedLabel" class=XInterface.GUILabel
		Caption="Potentials"
		TextAlign=1
		TextColor=(R=255,G=255,B=0,A=255)
		FontScale=0
		WinTop=0.1500000
		WinLeft=0.4000000
		WinWidth=0.2000000
		WinHeight=0.0400000
	end object
	l_Unused=l_UnusedLabel
	// Reference: moComboBox'BallisticProV55.BallisticConflictWeaponMenuPro.LoadOptCombo'
	begin object name="LoadOptCombo" class=XInterface.moComboBox
		OnCreateComponent=LoadOptCombo.InternalOnCreateComponent
		IniOption="@Internal"
		IniDefault="High"
		Hint="Choose the type of loadout."
		WinTop=0.8250000
		WinLeft=0.3500000
		WinWidth=0.2000000
	end object
	co_LoadOpt=LoadOptCombo
	Headings[0]="Ballistic Weapons"
	Headings[1]="Items"
	Headings[2]="UT2004 Standard"
	Headings[3]="Other"
	bRenderWorld=true
	bAllowedAsLast=true
	OnClose=BallisticConflictWeaponMenuPro.InternalOnClose
	OnKeyEvent=BallisticConflictWeaponMenuPro.InternalOnKeyEvent
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: moComboBox'BallisticProV55.BallisticConflictWeaponMenuPro.LoadOptCombo'
begin object name="LoadOptCombo" class=XInterface.moComboBox
	OnCreateComponent=LoadOptCombo.InternalOnCreateComponent
	IniOption="@Internal"
	IniDefault="High"
	Hint="Choose the type of loadout."
	WinTop=0.8250000
	WinLeft=0.3500000
	WinWidth=0.2000000
end object
// Reference: GUIListBox'BallisticProV55.BallisticConflictWeaponMenuPro.UnusedWeaponList'
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
// Reference: GUIButton'BallisticProV55.BallisticConflictWeaponMenuPro.CancelButton'
begin object name="CancelButton" class=XInterface.GUIButton
	Caption="CANCEL"
	WinTop=0.8250000
	WinLeft=0.6000000
	WinWidth=0.1000000
	TabOrder=1
	OnClick=BallisticConflictWeaponMenuPro.InternalOnClick
	OnKeyEvent=CancelButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.BallisticConflictWeaponMenuPro.DoneButton'
begin object name="DoneButton" class=XInterface.GUIButton
	Caption="DONE"
	WinTop=0.8250000
	WinLeft=0.3000000
	WinWidth=0.1000000
	TabOrder=0
	OnClick=BallisticConflictWeaponMenuPro.InternalOnClick
	OnKeyEvent=DoneButton.InternalOnKeyEvent
end object
// Reference: GUIImage'BallisticProV55.BallisticConflictWeaponMenuPro.BackImage'
begin object name="BackImage" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display95'
	ImageStyle=1
	WinTop=0.1000000
	WinLeft=0.0500000
	WinWidth=0.9000000
	WinHeight=0.8000000
	RenderWeight=0.0010000
end object
// Reference: GUIImage'BallisticProV55.BallisticConflictWeaponMenuPro.ImageBoxUnused'
begin object name="ImageBoxUnused" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.1500000
	WinLeft=0.3750000
	WinWidth=0.2500000
	WinHeight=0.6000000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticConflictWeaponMenuPro.ImageBoxUsedRed'
begin object name="ImageBoxUsedRed" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.1500000
	WinLeft=0.6750000
	WinWidth=0.2500000
	WinHeight=0.6000000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticConflictWeaponMenuPro.ImageBoxUsedBlue'
begin object name="ImageBoxUsedBlue" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.1500000
	WinLeft=0.0750000
	WinWidth=0.2500000
	WinHeight=0.6000000
	RenderWeight=0.0020000
end object
// Reference: GUIButton'BallisticProV55.BallisticConflictWeaponMenuPro.AddButtonBlue'
begin object name="AddButtonBlue" class=XInterface.GUIButton
	Caption="< < <"
	WinTop=0.7500000
	WinLeft=0.3750000
	WinWidth=0.1000000
	TabOrder=0
	OnClick=BallisticConflictWeaponMenuPro.InternalOnClick
	OnKeyEvent=AddButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.BallisticConflictWeaponMenuPro.RemoveButtonBlue'
begin object name="RemoveButtonBlue" class=XInterface.GUIButton
	Caption="> > >"
	WinTop=0.7500000
	WinLeft=0.2250000
	WinWidth=0.1000000
	TabOrder=0
	OnClick=BallisticConflictWeaponMenuPro.InternalOnClick
	OnKeyEvent=RemoveButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.BallisticConflictWeaponMenuPro.AddAllButtonBlue'
begin object name="AddAllButtonBlue" class=XInterface.GUIButton
	Caption="FILL"
	WinTop=0.7500000
	WinLeft=0.0750000
	WinWidth=0.0750000
	TabOrder=0
	OnClick=BallisticConflictWeaponMenuPro.InternalOnClick
	OnKeyEvent=AddAllButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.BallisticConflictWeaponMenuPro.RemoveAllButtonBlue'
begin object name="RemoveAllButtonBlue" class=XInterface.GUIButton
	Caption="EMPTY"
	WinTop=0.7500000
	WinLeft=0.1500000
	WinWidth=0.0750000
	TabOrder=0
	OnClick=BallisticConflictWeaponMenuPro.InternalOnClick
	OnKeyEvent=RemoveAllButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.BallisticConflictWeaponMenuPro.AddButtonRed'
begin object name="AddButtonRed" class=XInterface.GUIButton
	Caption="> > >"
	WinTop=0.7500000
	WinLeft=0.5250000
	WinWidth=0.1000000
	TabOrder=0
	OnClick=BallisticConflictWeaponMenuPro.InternalOnClick
	OnKeyEvent=AddButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.BallisticConflictWeaponMenuPro.RemoveButtonRed'
begin object name="RemoveButtonRed" class=XInterface.GUIButton
	Caption="< < <"
	WinTop=0.7500000
	WinLeft=0.6750000
	WinWidth=0.1000000
	TabOrder=0
	OnClick=BallisticConflictWeaponMenuPro.InternalOnClick
	OnKeyEvent=RemoveButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.BallisticConflictWeaponMenuPro.AddAllButtonRed'
begin object name="AddAllButtonRed" class=XInterface.GUIButton
	Caption="FILL"
	WinTop=0.7500000
	WinLeft=0.8500000
	WinWidth=0.0750000
	TabOrder=0
	OnClick=BallisticConflictWeaponMenuPro.InternalOnClick
	OnKeyEvent=AddAllButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.BallisticConflictWeaponMenuPro.RemoveAllButtonRed'
begin object name="RemoveAllButtonRed" class=XInterface.GUIButton
	Caption="EMPTY"
	WinTop=0.7500000
	WinLeft=0.7750000
	WinWidth=0.0750000
	TabOrder=0
	OnClick=BallisticConflictWeaponMenuPro.InternalOnClick
	OnKeyEvent=RemoveAllButton.InternalOnKeyEvent
end object
// Reference: GUIHeader'BallisticProV55.BallisticConflictWeaponMenuPro.DaBeegHeader'
begin object name="DaBeegHeader" class=XInterface.GUIHeader
	bUseTextHeight=true
	Caption="Ballistic Conflict Team Weapons"
	FontScale=1
	WinTop=0.1000000
	WinLeft=0.0500000
	WinWidth=0.9000000
	WinHeight=0.0429690
end object
// Reference: GUIListBox'BallisticProV55.BallisticConflictWeaponMenuPro.UsedRedWeaponList'
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
// Reference: GUIListBox'BallisticProV55.BallisticConflictWeaponMenuPro.UsedBlueWeaponList'
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
// Reference: GUILabel'BallisticProV55.BallisticConflictWeaponMenuPro.l_RedLabel'
begin object name="l_RedLabel" class=XInterface.GUILabel
	Caption="Red"
	TextAlign=1
	TextColor=(R=255,G=0,B=0,A=255)
	FontScale=0
	WinTop=0.1500000
	WinLeft=0.7000000
	WinWidth=0.2000000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticConflictWeaponMenuPro.l_BlueLabel'
begin object name="l_BlueLabel" class=XInterface.GUILabel
	Caption="Blue"
	TextAlign=1
	TextColor=(R=0,G=255,B=255,A=255)
	FontScale=0
	WinTop=0.1500000
	WinLeft=0.1000000
	WinWidth=0.2000000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticConflictWeaponMenuPro.l_UnusedLabel'
begin object name="l_UnusedLabel" class=XInterface.GUILabel
	Caption="Potentials"
	TextAlign=1
	TextColor=(R=255,G=255,B=0,A=255)
	FontScale=0
	WinTop=0.1500000
	WinLeft=0.4000000
	WinWidth=0.2000000
	WinHeight=0.0400000
end object
