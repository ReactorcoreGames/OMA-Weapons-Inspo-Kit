class BallisticArenaMenu extends UT2K4GUIPage
	config(User)
	editinlinenew
	instanced;

struct ArenaPreset
{
	var() config string PresetName;
	var() config array<string> WeaponClassNames;
};

var() automated GUIImage MyBack;
var() automated GUIImage Box_Unused;
var() automated GUIImage Box_Used;
var() automated GUIButton bDone;
var() automated GUIButton bCancel;
var() automated GUIButton bAdd;
var() automated GUIButton bRemove;
var() automated GUIButton bSave;
var() automated GUIButton BDelete;
var() automated GUIButton BAddAll;
var() automated GUIButton BRemoveAll;
var() automated GUIButton BBWOps;
var() automated GUIHeader MyHeader;
var() automated GUIListBox lb_UsedWeapons;
var() automated GUIListBox lb_UnusedWeapons;
var() automated moCheckBox ch_Random;
var() automated moCheckBox ch_PerSpawn;
var() automated GUIComboBox cb_Presets;
var() automated GUILabel l_PresetLabel;
var() config array<ArenaPreset> Presets;
var() localized string Headings[3];

function int WeaponRank(string PackageName, optional string ClassName, optional GUIListElem El)
{
	// End:0x10
	if(PackageName == "BW")
	{
		return 0;
	}
	// End:0x66
	if(((InStr(PackageName, "Ballistic") != -1) || InStr(PackageName, "BWBP") != -1) || InStr(PackageName, "RedGunPack") != -1)
	{
		return 1;
	}
	// End:0x9C
	if((InStr(PackageName, "JunkWar") != -1) || InStr(PackageName, "JWBP") != -1)
	{
		return 2;
	}
	// End:0xAD
	if(PackageName == "UT")
	{
		return 50;
	}
	// End:0xDB
	if((PackageName ~= "XWeapons") || PackageName ~= "UTClassic")
	{
		return 51;
	}
	// End:0xFA
	if(InStr(PackageName, "Onslaught") != -1)
	{
		return 55;
	}
	// End:0x10A
	if(PackageName == "O")
	{
		return 100;
	}
	// End:0x11D
	if(El.ExtraData == self)
	{
		return 10;
	}
	return 110;
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
	local int i;
	local export editinline GUIList L;

	L = GUIList(Sender);
	// End:0x1E2
	if((L != none) && Sender.Controller.DropTarget == Sender)
	{
		// End:0x61
		if(Sender.Controller.DropSource == L)
		{
			return false;
		}
		// End:0x1E2
		if((Sender.Controller.DropSource != none) && GUIList(Sender.Controller.DropSource) != none)
		{
			NewItem = GUIList(Sender.Controller.DropSource).GetPendingElements();
			i = NewItem.Length;
			J0xDA:

			// End:0x113 [Loop If]
			if(i > -1)
			{
				// End:0x109
				if(NewItem[i].bSection)
				{
					NewItem.Remove(i, 1);
				}
				i--;
				// [Loop Continue]
				goto J0xDA;
			}
			// End:0x152
			if(!L.IsValidIndex(L.DropIndex))
			{
				L.DropIndex = L.ItemCount;
			}
			i = NewItem.Length - 1;
			J0x161:

			// End:0x1C3 [Loop If]
			if(i >= 0)
			{
				L.Insert(L.DropIndex, NewItem[i].Item, NewItem[i].ExtraData, NewItem[i].ExtraStrData);
				i--;
				// [Loop Continue]
				goto J0x161;
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
	local int i;
	local export editinline GUIList L;

	L = lb_UnusedWeapons.List;
	// End:0xC1
	if(bAccepted && Accepting != none)
	{
		L.GetPendingElements();
		// End:0xB0
		if(Accepting != self)
		{
			i = 0;
			J0x4B:

			// End:0xB0 [Loop If]
			if(i < L.SelectedElements.Length)
			{
				// End:0xA6
				if(!L.SelectedElements[i].bSection)
				{
					L.RemoveElement(L.SelectedElements[i]);
				}
				i++;
				// [Loop Continue]
				goto J0x4B;
			}
		}
		L.bRepeatClick = false;
	}
	// End:0xDD
	if(Accepting == none)
	{
		L.bRepeatClick = true;
	}
	L.SetOutlineAlpha(255);
	// End:0x118
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

	super(GUIPage).InitComponent(MyController, MyOwner);
	i = 0;
	J0x17:

	// End:0x58 [Loop If]
	if(i < Presets.Length)
	{
		cb_Presets.AddItem(Presets[i].PresetName,, string(i));
		i++;
		// [Loop Continue]
		goto J0x17;
	}
	cb_Presets.SetText("");
	lb_UnusedWeapons.List.__CompareItem__Delegate = MyCompareItem;
	lb_UnusedWeapons.List.Add(Headings[0],, "BW", true);
	lb_UnusedWeapons.List.Add(Headings[1],, "UT", true);
	lb_UnusedWeapons.List.Add(Headings[2],, "O", true);
	Class'Engine.CacheManager'.static.GetWeaponList(Recs);
	i = 0;
	J0x10D:

	// End:0x329 [Loop If]
	if(i < Recs.Length)
	{
		// End:0x144
		if(!Class'BCoreProV55.BC_WeaponInfoCache'.static.IsValid(Recs[i].ClassName))
		{
			// [Explicit Continue]
			goto J0x31F;
		}
		j = 0;
		J0x14B:

		// End:0x250 [Loop If]
		if(j < Class'BallisticProV55.Mut_BallisticArena'.default.WeaponClassNames.Length)
		{
			// End:0x246
			if(Class'BallisticProV55.Mut_BallisticArena'.default.WeaponClassNames[j] ~= Recs[i].ClassName)
			{
				// End:0x20A
				if((Recs[i].ClassName != "") && Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(Recs[i].ClassName).bIsBW)
				{
					lb_UsedWeapons.List.Add(Recs[i].FriendlyName, self, Recs[i].ClassName);					
				}
				else
				{
					lb_UsedWeapons.List.Add(Recs[i].FriendlyName,, Recs[i].ClassName);
				}
				// [Explicit Break]
				goto J0x250;
			}
			j++;
			// [Loop Continue]
			goto J0x14B;
		}
		J0x250:

		// End:0x31F
		if(j >= Class'BallisticProV55.Mut_BallisticArena'.default.WeaponClassNames.Length)
		{
			// End:0x2E6
			if((Recs[i].ClassName != "") && Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(Recs[i].ClassName).bIsBW)
			{
				lb_UnusedWeapons.List.Add(Recs[i].FriendlyName, self, Recs[i].ClassName);
				// [Explicit Continue]
				goto J0x31F;
			}
			lb_UnusedWeapons.List.Add(Recs[i].FriendlyName,, Recs[i].ClassName);
		}
		J0x31F:

		i++;
		// [Loop Continue]
		goto J0x10D;
	}
	Class'BCoreProV55.BC_WeaponInfoCache'.static.EndSession();
	ch_Random.Checked(Class'BallisticProV55.Mut_BallisticArena'.default.bRandomPickOne);
	ch_PerSpawn.Checked(Class'BallisticProV55.Mut_BallisticArena'.default.bRandomPerSpawn);
	lb_UnusedWeapons.List.bDropSource = true;
	lb_UnusedWeapons.List.bDropTarget = true;
	lb_UnusedWeapons.List.__OnDragDrop__Delegate = InternalOnDragDrop;
	lb_UnusedWeapons.List.__OnBeginDrag__Delegate = lb_UnusedWeapons.List.InternalOnBeginDrag;
	lb_UnusedWeapons.List.__OnEndDrag__Delegate = InternalOnEndDrag;
	lb_UnusedWeapons.List.__OnDblClick__Delegate = InternalOnDblClick;
	lb_UsedWeapons.List.bDropSource = true;
	lb_UsedWeapons.List.bDropTarget = true;
	lb_UsedWeapons.List.__OnDragDrop__Delegate = InternalOnDragDrop;
	lb_UsedWeapons.List.__OnBeginDrag__Delegate = lb_UsedWeapons.List.InternalOnBeginDrag;
	lb_UsedWeapons.List.__OnEndDrag__Delegate = lb_UsedWeapons.List.InternalOnEndDrag;
	lb_UsedWeapons.List.__OnDblClick__Delegate = InternalOnDblClick;
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
	local int i;
	local ArenaPreset NewPreset;

	// End:0x21
	if(Sender == bCancel)
	{
		Controller.CloseMenu();		
	}
	else
	{
		// End:0x139
		if(Sender == bSave)
		{
			i = 0;
			J0x37:

			// End:0x91 [Loop If]
			if(i < lb_UsedWeapons.List.Elements.Length)
			{
				NewPreset.WeaponClassNames[i] = lb_UsedWeapons.List.GetExtraAtIndex(i);
				i++;
				// [Loop Continue]
				goto J0x37;
			}
			NewPreset.PresetName = cb_Presets.GetText();
			i = 0;
			J0xB2:

			// End:0xFC [Loop If]
			if(i < Presets.Length)
			{
				// End:0xF2
				if(Presets[i].PresetName ~= NewPreset.PresetName)
				{
					NewPreset.PresetName $= "2";
				}
				i++;
				// [Loop Continue]
				goto J0xB2;
			}
			Presets[Presets.Length] = NewPreset;
			cb_Presets.AddItem(NewPreset.PresetName,, string(Presets.Length - 1));
			SaveConfig();			
		}
		else
		{
			// End:0x1BF
			if(Sender == BDelete)
			{
				i = 0;
				J0x14F:

				// End:0x1BC [Loop If]
				if(i < Presets.Length)
				{
					// End:0x1B2
					if(Presets[i].PresetName ~= cb_Presets.GetText())
					{
						Presets.Remove(i, 1);
						cb_Presets.RemoveItem(cb_Presets.Index);
						SaveConfig();
						// [Explicit Break]
						goto J0x1BC;
					}
					i++;
					// [Loop Continue]
					goto J0x14F;
				}
				J0x1BC:
				
			}
			else
			{
				// End:0x2A3
				if(Sender == BAddAll)
				{
					i = lb_UnusedWeapons.List.Elements.Length - 1;
					J0x1EF:

					// End:0x2A0 [Loop If]
					if(i > -1)
					{
						// End:0x296
						if(!lb_UnusedWeapons.List.Elements[i].bSection)
						{
							lb_UsedWeapons.List.Add(lb_UnusedWeapons.List.GetItemAtIndex(i),, lb_UnusedWeapons.List.GetExtraAtIndex(i));
							lb_UnusedWeapons.List.Remove(i);
						}
						i--;
						// [Loop Continue]
						goto J0x1EF;
					}					
				}
				else
				{
					// End:0x33A
					if(Sender == BRemoveAll)
					{
						J0x2B2:

						// End:0x337 [Loop If]
						if(lb_UsedWeapons.List.Elements.Length > 0)
						{
							lb_UnusedWeapons.List.Add(lb_UsedWeapons.List.GetItemAtIndex(0),, lb_UsedWeapons.List.GetExtraAtIndex(0));
							lb_UsedWeapons.List.Remove(0);
							// [Loop Continue]
							goto J0x2B2;
						}						
					}
					else
					{
						// End:0x3E1
						if(Sender == bAdd)
						{
							// End:0x3DE
							if(!lb_UnusedWeapons.List.IsSection())
							{
								lb_UsedWeapons.List.Add(lb_UnusedWeapons.List.Get(),, lb_UnusedWeapons.List.GetExtra());
								lb_UnusedWeapons.List.Remove(lb_UnusedWeapons.List.Index);
							}							
						}
						else
						{
							// End:0x46B
							if(Sender == bRemove)
							{
								lb_UnusedWeapons.List.Add(lb_UsedWeapons.List.Get(),, lb_UsedWeapons.List.GetExtra());
								lb_UsedWeapons.List.Remove(lb_UsedWeapons.List.Index);								
							}
							else
							{
								// End:0x581
								if(Sender == bDone)
								{
									// End:0x4AC
									if(lb_UsedWeapons.List.Elements.Length < 1)
									{
										Class'BallisticProV55.Mut_BallisticArena'.default.WeaponClassNames.Length = 1;										
									}
									else
									{
										Class'BallisticProV55.Mut_BallisticArena'.default.WeaponClassNames.Length = 0;
										i = 0;
										J0x4C4:

										// End:0x522 [Loop If]
										if(i < lb_UsedWeapons.List.Elements.Length)
										{
											Class'BallisticProV55.Mut_BallisticArena'.default.WeaponClassNames[i] = lb_UsedWeapons.List.GetExtraAtIndex(i);
											i++;
											// [Loop Continue]
											goto J0x4C4;
										}
									}
									Class'BallisticProV55.Mut_BallisticArena'.default.bRandomPickOne = ch_Random.IsChecked();
									Class'BallisticProV55.Mut_BallisticArena'.default.bRandomPerSpawn = ch_PerSpawn.IsChecked();
									Class'BallisticProV55.Mut_BallisticArena'.static.StaticSaveConfig();
									Controller.CloseMenu();									
								}
								else
								{
									// End:0x5C5
									if(Sender == BBWOps)
									{
										Controller.OpenMenu("BallisticProV55.ConfigMenu_Inventory");
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
	// End:0x26
	if(Sender == lb_UnusedWeapons.List)
	{
		InternalOnClick(bAdd);		
	}
	else
	{
		// End:0x49
		if(Sender == lb_UsedWeapons.List)
		{
			InternalOnClick(bRemove);
		}
	}
	return true;
	//return;	
}

function InternalOnChange(GUIComponent Sender)
{
	local int i, j;

	// End:0x1CE
	if((Sender == cb_Presets) && cb_Presets.GetExtra() != "")
	{
		J0x27:

		// End:0xAC [Loop If]
		if(lb_UsedWeapons.List.Elements.Length > 0)
		{
			lb_UnusedWeapons.List.Add(lb_UsedWeapons.List.GetItemAtIndex(0),, lb_UsedWeapons.List.GetExtraAtIndex(0));
			lb_UsedWeapons.List.Remove(0);
			// [Loop Continue]
			goto J0x27;
		}
		i = 0;
		J0xB3:

		// End:0x1CE [Loop If]
		if(i < Presets[int(cb_Presets.GetExtra())].WeaponClassNames.Length)
		{
			j = 0;
			J0xE1:

			// End:0x1C4 [Loop If]
			if(j < lb_UnusedWeapons.List.Elements.Length)
			{
				// End:0x1BA
				if(lb_UnusedWeapons.List.GetExtraAtIndex(j) ~= Presets[int(cb_Presets.GetExtra())].WeaponClassNames[i])
				{
					lb_UsedWeapons.List.Add(lb_UnusedWeapons.List.GetItemAtIndex(j),, lb_UnusedWeapons.List.GetExtraAtIndex(j));
					lb_UnusedWeapons.List.Remove(j);
					// [Explicit Break]
					goto J0x1C4;
				}
				j++;
				// [Loop Continue]
				goto J0xE1;
			}
			J0x1C4:

			i++;
			// [Loop Continue]
			goto J0xB3;
		}
	}
	//return;	
}

defaultproperties
{
	// Reference: GUIImage'BallisticProV55.BallisticArenaMenu.BackImage'
	begin object name="BackImage" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display95'
		ImageStyle=1
		WinTop=0.2000000
		WinLeft=0.0500000
		WinWidth=0.9000000
		WinHeight=0.7000000
		RenderWeight=0.0010000
	end object
	MyBack=BackImage
	// Reference: GUIImage'BallisticProV55.BallisticArenaMenu.ImageBoxUnused'
	begin object name="ImageBoxUnused" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.2250000
		WinLeft=0.0875000
		WinWidth=0.3750000
		WinHeight=0.5000000
		RenderWeight=0.0020000
	end object
	Box_Unused=ImageBoxUnused
	// Reference: GUIImage'BallisticProV55.BallisticArenaMenu.ImageBoxUsed'
	begin object name="ImageBoxUsed" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.2250000
		WinLeft=0.5375000
		WinWidth=0.3750000
		WinHeight=0.5000000
		RenderWeight=0.0020000
	end object
	Box_Used=ImageBoxUsed
	// Reference: GUIButton'BallisticProV55.BallisticArenaMenu.DoneButton'
	begin object name="DoneButton" class=XInterface.GUIButton
		Caption="DONE"
		WinTop=0.5250000
		WinLeft=0.4500000
		WinWidth=0.1000000
		TabOrder=0
		OnClick=BallisticArenaMenu.InternalOnClick
		OnKeyEvent=DoneButton.InternalOnKeyEvent
	end object
	bDone=DoneButton
	// Reference: GUIButton'BallisticProV55.BallisticArenaMenu.CancelButton'
	begin object name="CancelButton" class=XInterface.GUIButton
		Caption="CANCEL"
		WinTop=0.5750000
		WinLeft=0.4500000
		WinWidth=0.1000000
		TabOrder=1
		OnClick=BallisticArenaMenu.InternalOnClick
		OnKeyEvent=CancelButton.InternalOnKeyEvent
	end object
	bCancel=CancelButton
	// Reference: GUIButton'BallisticProV55.BallisticArenaMenu.AddButton'
	begin object name="AddButton" class=XInterface.GUIButton
		Caption="ADD"
		WinTop=0.3750000
		WinLeft=0.4500000
		WinWidth=0.1000000
		TabOrder=0
		OnClick=BallisticArenaMenu.InternalOnClick
		OnKeyEvent=AddButton.InternalOnKeyEvent
	end object
	bAdd=AddButton
	// Reference: GUIButton'BallisticProV55.BallisticArenaMenu.RemoveButton'
	begin object name="RemoveButton" class=XInterface.GUIButton
		Caption="REMOVE"
		WinTop=0.4250000
		WinLeft=0.4500000
		WinWidth=0.1000000
		TabOrder=0
		OnClick=BallisticArenaMenu.InternalOnClick
		OnKeyEvent=RemoveButton.InternalOnKeyEvent
	end object
	bRemove=RemoveButton
	// Reference: GUIButton'BallisticProV55.BallisticArenaMenu.SaveButton'
	begin object name="SaveButton" class=XInterface.GUIButton
		Caption="SAVE"
		WinTop=0.7400000
		WinLeft=0.7250000
		WinWidth=0.1000000
		TabOrder=0
		OnClick=BallisticArenaMenu.InternalOnClick
		OnKeyEvent=SaveButton.InternalOnKeyEvent
	end object
	bSave=SaveButton
	// Reference: GUIButton'BallisticProV55.BallisticArenaMenu.DeleteButton'
	begin object name="DeleteButton" class=XInterface.GUIButton
		Caption="DELETE"
		WinTop=0.7400000
		WinLeft=0.8250000
		WinWidth=0.1000000
		TabOrder=0
		OnClick=BallisticArenaMenu.InternalOnClick
		OnKeyEvent=DeleteButton.InternalOnKeyEvent
	end object
	BDelete=DeleteButton
	// Reference: GUIButton'BallisticProV55.BallisticArenaMenu.AddAllButton'
	begin object name="AddAllButton" class=XInterface.GUIButton
		Caption="FILL"
		WinTop=0.2500000
		WinLeft=0.4500000
		WinWidth=0.1000000
		TabOrder=0
		OnClick=BallisticArenaMenu.InternalOnClick
		OnKeyEvent=AddAllButton.InternalOnKeyEvent
	end object
	BAddAll=AddAllButton
	// Reference: GUIButton'BallisticProV55.BallisticArenaMenu.RemoveAllButton'
	begin object name="RemoveAllButton" class=XInterface.GUIButton
		Caption="EMPTY"
		WinTop=0.3000000
		WinLeft=0.4500000
		WinWidth=0.1000000
		TabOrder=0
		OnClick=BallisticArenaMenu.InternalOnClick
		OnKeyEvent=RemoveAllButton.InternalOnKeyEvent
	end object
	BRemoveAll=RemoveAllButton
	// Reference: GUIButton'BallisticProV55.BallisticArenaMenu.BBWOpsButton'
	begin object name="BBWOpsButton" class=XInterface.GUIButton
		Caption="Options"
		WinTop=0.6500000
		WinLeft=0.4500000
		WinWidth=0.1000000
		TabOrder=1
		OnClick=BallisticArenaMenu.InternalOnClick
		OnKeyEvent=CancelButton.InternalOnKeyEvent
	end object
	BBWOps=BBWOpsButton
	// Reference: GUIHeader'BallisticProV55.BallisticArenaMenu.DaBeegHeader'
	begin object name="DaBeegHeader" class=XInterface.GUIHeader
		bUseTextHeight=true
		Caption="Ballistic Arena Options"
		WinTop=0.2000000
		WinLeft=0.0500000
		WinWidth=0.9000000
		WinHeight=0.7000000
	end object
	MyHeader=DaBeegHeader
	// Reference: GUIListBox'BallisticProV55.BallisticArenaMenu.UsedWeaponList'
	begin object name="UsedWeaponList" class=XInterface.GUIListBox
		bVisibleWhenEmpty=true
		OnCreateComponent=UsedWeaponList.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Used Weapons. Drag, Double click or use Remove button to take them out the match."
		WinTop=0.2700000
		WinLeft=0.5500000
		WinWidth=0.3500000
		WinHeight=0.4250000
		RenderWeight=0.5100000
		TabOrder=1
	end object
	lb_UsedWeapons=UsedWeaponList
	// Reference: GUIListBox'BallisticProV55.BallisticArenaMenu.UnusedWeaponList'
	begin object name="UnusedWeaponList" class=XInterface.GUIListBox
		bVisibleWhenEmpty=true
		bSorted=true
		OnCreateComponent=UnusedWeaponList.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Spare Weapons. Drag, Double click or use Add button to put them in the match."
		WinTop=0.2700000
		WinLeft=0.1000000
		WinWidth=0.3500000
		WinHeight=0.4250000
		RenderWeight=0.5100000
		TabOrder=1
	end object
	lb_UnusedWeapons=UnusedWeaponList
	// Reference: moCheckBox'BallisticProV55.BallisticArenaMenu.RandomCheck'
	begin object name="RandomCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="One Random Weapon"
		OnCreateComponent=RandomCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Gives players one random weapon from the list of weapons you have chosen."
		WinTop=0.8000000
		WinLeft=0.5500000
		WinWidth=0.3500000
		WinHeight=0.0400000
	end object
	ch_Random=RandomCheck
	// Reference: moCheckBox'BallisticProV55.BallisticArenaMenu.PerSpawnCheck'
	begin object name="PerSpawnCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Random Per Spawn"
		OnCreateComponent=PerSpawnCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Players get a different random weapon from the chosen list each time they spawn."
		WinTop=0.8000000
		WinLeft=0.1000000
		WinWidth=0.3500000
		WinHeight=0.0400000
	end object
	ch_PerSpawn=PerSpawnCheck
	// Reference: GUIComboBox'BallisticProV55.BallisticArenaMenu.PresetsComboBox'
	begin object name="PresetsComboBox" class=XInterface.GUIComboBox
		Hint="Pick a preset list of weapons."
		WinTop=0.7400000
		WinLeft=0.4000000
		WinWidth=0.3000000
		WinHeight=0.0300000
		TabOrder=0
		OnChange=BallisticArenaMenu.InternalOnChange
		OnKeyEvent=PresetsComboBox.InternalOnKeyEvent
	end object
	cb_Presets=PresetsComboBox
	// Reference: GUILabel'BallisticProV55.BallisticArenaMenu.PresetLabel'
	begin object name="PresetLabel" class=XInterface.GUILabel
		Caption="Presets"
		TextAlign=2
		TextColor=(R=255,G=255,B=255,A=255)
		bMultiLine=true
		FontScale=2
		WinTop=0.7400000
		WinLeft=0.1000000
		WinWidth=0.2750000
		WinHeight=0.0300000
	end object
	l_PresetLabel=PresetLabel
	Presets[0]=(PresetName="Sidearm Shootout",WeaponClassNames=("BallisticProV55.M806Pistol","BallisticProV55.A42SkrithPistol","BallisticProV55.XK2SubMachinegun","BallisticProV55.MRT6Shotgun","BallisticProV55.AM67Pistol","BallisticProV55.D49Revolver","BallisticProV55.Fifty9MachinePistol","BallisticProV55.RS8Pistol","BallisticProV55.XRS10SubMachinegun"))
	Presets[1]=(PresetName="Monster Weapons",WeaponClassNames=("BallisticProV55.G5Bazooka","BallisticProV55.HVCMk9LightningGun","BallisticProV55.M75Railgun","BallisticProV55.RX22AFlamer","BallisticProV55.XMV850Minigun"))
	Presets[2]=(PresetName="Shotgun Arena",WeaponClassNames=("BallisticProV55.MRT6Shotgun","BallisticProV55.M763Shotgun","BallisticProV55.M290Shotgun","BallisticProV55.MRS138Shotgun"))
	Presets[3]=(PresetName="Sniper Arena",WeaponClassNames=("BallisticProV55.M75Railgun","BallisticProV55.R78Rifle","BallisticProV55.SRS900Rifle"))
	Presets[4]=(PresetName="Tricks n Traps",WeaponClassNames=("BallisticProV55.NRP57Grenade","BallisticProV55.FP7Grenade","BallisticProV55.FP9Explosive","BallisticProV55.BX5Mine","BallisticProV55.T10Grenade"))
	Presets[5]=(PresetName="Assault Weapons",WeaponClassNames=("BallisticProV55.MRS138Shotgun","BallisticProV55.RS8Pistol","BallisticProV55.SRS900Rifle","BallisticProV55.AM67Pistol","BallisticProV55.M290Shotgun","BallisticProV55.M353Machinegun","BallisticProV55.M50AssaultRifle","BallisticProV55.M763Shotgun","BallisticProV55.M806Pistol","BallisticProV55.M925Machinegun","BallisticProV55.NRP57Grenade","BallisticProV55.X3Knife","BallisticProV55.XK2SubMachinegun"))
	Presets[6]=(PresetName="Machinegun Battle",WeaponClassNames=("BallisticProV55.M353Machinegun","BallisticProV55.M925Machinegun","BallisticProV55.XMV850Minigun"))
	Presets[7]=(PresetName="Blade Match",WeaponClassNames=("BallisticProV55.X3Knife","BallisticProV55.A909SkrithBlades","BallisticProV55.EKS43Katana"))
	Presets[8]=(PresetName="UT2004 Stuff",WeaponClassNames=("XWeapons.AssaultRifle","XWeapons.BioRifle","XWeapons.FlakCannon","XWeapons.Painter","XWeapons.SniperRifle","XWeapons.LinkGun","XWeapons.Minigun","XWeapons.Redeemer","XWeapons.RocketLauncher","XWeapons.ShieldGun","XWeapons.ShockRifle","UTClassic.ClassicSniperRifle","XWeapons.Translauncher","Onslaught.ONSAVRiL","Onslaught.ONSGrenadeLauncher","Onslaught.ONSMineLayer","OnslaughtFull.ONSPainter"))
	Headings[0]="Ballistic Weapons"
	Headings[1]="UT2004 Standard"
	Headings[2]="Other"
	bRenderWorld=true
	bAllowedAsLast=true
	OnClose=BallisticArenaMenu.InternalOnClose
	OnKeyEvent=BallisticArenaMenu.InternalOnKeyEvent
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: GUIButton'BallisticProV55.BallisticArenaMenu.AddButton'
begin object name="AddButton" class=XInterface.GUIButton
	Caption="ADD"
	WinTop=0.3750000
	WinLeft=0.4500000
	WinWidth=0.1000000
	TabOrder=0
	OnClick=BallisticArenaMenu.InternalOnClick
	OnKeyEvent=AddButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.BallisticArenaMenu.RemoveButton'
begin object name="RemoveButton" class=XInterface.GUIButton
	Caption="REMOVE"
	WinTop=0.4250000
	WinLeft=0.4500000
	WinWidth=0.1000000
	TabOrder=0
	OnClick=BallisticArenaMenu.InternalOnClick
	OnKeyEvent=RemoveButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.BallisticArenaMenu.AddAllButton'
begin object name="AddAllButton" class=XInterface.GUIButton
	Caption="FILL"
	WinTop=0.2500000
	WinLeft=0.4500000
	WinWidth=0.1000000
	TabOrder=0
	OnClick=BallisticArenaMenu.InternalOnClick
	OnKeyEvent=AddAllButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.BallisticArenaMenu.RemoveAllButton'
begin object name="RemoveAllButton" class=XInterface.GUIButton
	Caption="EMPTY"
	WinTop=0.3000000
	WinLeft=0.4500000
	WinWidth=0.1000000
	TabOrder=0
	OnClick=BallisticArenaMenu.InternalOnClick
	OnKeyEvent=RemoveAllButton.InternalOnKeyEvent
end object
// Reference: GUIListBox'BallisticProV55.BallisticArenaMenu.UsedWeaponList'
begin object name="UsedWeaponList" class=XInterface.GUIListBox
	bVisibleWhenEmpty=true
	OnCreateComponent=UsedWeaponList.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Used Weapons. Drag, Double click or use Remove button to take them out the match."
	WinTop=0.2700000
	WinLeft=0.5500000
	WinWidth=0.3500000
	WinHeight=0.4250000
	RenderWeight=0.5100000
	TabOrder=1
end object
// Reference: GUIButton'BallisticProV55.BallisticArenaMenu.CancelButton'
begin object name="CancelButton" class=XInterface.GUIButton
	Caption="CANCEL"
	WinTop=0.5750000
	WinLeft=0.4500000
	WinWidth=0.1000000
	TabOrder=1
	OnClick=BallisticArenaMenu.InternalOnClick
	OnKeyEvent=CancelButton.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticArenaMenu.PresetsComboBox'
begin object name="PresetsComboBox" class=XInterface.GUIComboBox
	Hint="Pick a preset list of weapons."
	WinTop=0.7400000
	WinLeft=0.4000000
	WinWidth=0.3000000
	WinHeight=0.0300000
	TabOrder=0
	OnChange=BallisticArenaMenu.InternalOnChange
	OnKeyEvent=PresetsComboBox.InternalOnKeyEvent
end object
// Reference: moCheckBox'BallisticProV55.BallisticArenaMenu.PerSpawnCheck'
begin object name="PerSpawnCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Random Per Spawn"
	OnCreateComponent=PerSpawnCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Players get a different random weapon from the chosen list each time they spawn."
	WinTop=0.8000000
	WinLeft=0.1000000
	WinWidth=0.3500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.BallisticArenaMenu.RandomCheck'
begin object name="RandomCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="One Random Weapon"
	OnCreateComponent=RandomCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Gives players one random weapon from the list of weapons you have chosen."
	WinTop=0.8000000
	WinLeft=0.5500000
	WinWidth=0.3500000
	WinHeight=0.0400000
end object
// Reference: GUIListBox'BallisticProV55.BallisticArenaMenu.UnusedWeaponList'
begin object name="UnusedWeaponList" class=XInterface.GUIListBox
	bVisibleWhenEmpty=true
	bSorted=true
	OnCreateComponent=UnusedWeaponList.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Spare Weapons. Drag, Double click or use Add button to put them in the match."
	WinTop=0.2700000
	WinLeft=0.1000000
	WinWidth=0.3500000
	WinHeight=0.4250000
	RenderWeight=0.5100000
	TabOrder=1
end object
// Reference: GUIButton'BallisticProV55.BallisticArenaMenu.DeleteButton'
begin object name="DeleteButton" class=XInterface.GUIButton
	Caption="DELETE"
	WinTop=0.7400000
	WinLeft=0.8250000
	WinWidth=0.1000000
	TabOrder=0
	OnClick=BallisticArenaMenu.InternalOnClick
	OnKeyEvent=DeleteButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.BallisticArenaMenu.SaveButton'
begin object name="SaveButton" class=XInterface.GUIButton
	Caption="SAVE"
	WinTop=0.7400000
	WinLeft=0.7250000
	WinWidth=0.1000000
	TabOrder=0
	OnClick=BallisticArenaMenu.InternalOnClick
	OnKeyEvent=SaveButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.BallisticArenaMenu.DoneButton'
begin object name="DoneButton" class=XInterface.GUIButton
	Caption="DONE"
	WinTop=0.5250000
	WinLeft=0.4500000
	WinWidth=0.1000000
	TabOrder=0
	OnClick=BallisticArenaMenu.InternalOnClick
	OnKeyEvent=DoneButton.InternalOnKeyEvent
end object
// Reference: GUIImage'BallisticProV55.BallisticArenaMenu.BackImage'
begin object name="BackImage" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display95'
	ImageStyle=1
	WinTop=0.2000000
	WinLeft=0.0500000
	WinWidth=0.9000000
	WinHeight=0.7000000
	RenderWeight=0.0010000
end object
// Reference: GUIImage'BallisticProV55.BallisticArenaMenu.ImageBoxUnused'
begin object name="ImageBoxUnused" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.2250000
	WinLeft=0.0875000
	WinWidth=0.3750000
	WinHeight=0.5000000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticArenaMenu.ImageBoxUsed'
begin object name="ImageBoxUsed" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.2250000
	WinLeft=0.5375000
	WinWidth=0.3750000
	WinHeight=0.5000000
	RenderWeight=0.0020000
end object
// Reference: GUIButton'BallisticProV55.BallisticArenaMenu.BBWOpsButton'
begin object name="BBWOpsButton" class=XInterface.GUIButton
	Caption="Options"
	WinTop=0.6500000
	WinLeft=0.4500000
	WinWidth=0.1000000
	TabOrder=1
	OnClick=BallisticArenaMenu.InternalOnClick
	OnKeyEvent=CancelButton.InternalOnKeyEvent
end object
// Reference: GUIHeader'BallisticProV55.BallisticArenaMenu.DaBeegHeader'
begin object name="DaBeegHeader" class=XInterface.GUIHeader
	bUseTextHeight=true
	Caption="Ballistic Arena Options"
	WinTop=0.2000000
	WinLeft=0.0500000
	WinWidth=0.9000000
	WinHeight=0.7000000
end object
// Reference: GUILabel'BallisticProV55.BallisticArenaMenu.PresetLabel'
begin object name="PresetLabel" class=XInterface.GUILabel
	Caption="Presets"
	TextAlign=2
	TextColor=(R=255,G=255,B=255,A=255)
	bMultiLine=true
	FontScale=2
	WinTop=0.7400000
	WinLeft=0.1000000
	WinWidth=0.2750000
	WinHeight=0.0300000
end object
