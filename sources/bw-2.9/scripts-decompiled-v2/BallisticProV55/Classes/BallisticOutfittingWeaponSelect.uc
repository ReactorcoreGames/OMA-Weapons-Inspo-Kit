class BallisticOutfittingWeaponSelect extends FloatingWindow
	config(User)
	editinlinenew
	instanced;

var() automated GUIListBox lb_Weapons;
var() automated GUIImage Box_WeapList;
var() automated GUIImage Box_Inventory;
var() automated GUIImage Pic_Weapon;
var() automated GUIImage Box_WeapIcon;
var() automated GUIComboBox cb_WeapLayoutIndex;
var() automated GUIComboBox cb_WeapCamoIndex;
var() automated GUILabel l_WeapTitle;
var() automated GUIScrollTextBox tb_Desc;
var() automated GUIButton b_Cancel;
var() automated GUIButton b_OK;
var() float EdgeBorder[4];
var() array<byte> LayoutIndexList;
var() array<byte> CamoIndexList;
var() bool bUpdatingWeapon;

function AlignButtons()
{
	local float X, Y, Xs, Ys, WIP, HIP;

	WIP = ActualWidth();
	HIP = ActualHeight();
	Xs = b_OK.ActualWidth() * 0.1000000;
	Ys = b_OK.ActualHeight() * 0.1000000;
	X = (1.0000000 - ((b_OK.ActualWidth() + Xs) / WIP)) - (EdgeBorder[2] / WIP);
	Y = (1.0000000 - ((b_OK.ActualHeight() + Ys) / HIP)) - (EdgeBorder[3] / WIP);
	b_OK.WinLeft = X;
	b_OK.WinTop = Y;
	X = (1.0000000 - (((b_OK.ActualWidth() + b_Cancel.ActualWidth()) + Xs) / WIP)) - (EdgeBorder[2] / WIP);
	b_Cancel.WinLeft = X;
	b_Cancel.WinTop = Y;
	//return;	
}

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	Log("BallisticOutfittingWeaponSelect::InitComponent");
	super.InitComponent(MyController, MyOwner);
	AlignButtons();
	lb_Weapons.List.__OnChange__Delegate = InternalOnChange;
	//return;	
}

function LoadWeapons(ClientOutfittingInterface COI, int Group)
{
	local int i, LastIndex;
	local WeaponInfo WI;

	Log("BallisticOutfittingWeaponSelect::LoadWeapons");
	lb_Weapons.List.Clear();
	LastIndex = -1;
	i = 0;
	J0x5A:

	// End:0x183 [Loop If]
	if(i < COI.GroupLength(byte(Group)))
	{
		// End:0x179
		if(LoadWIFromCache(COI.GetGroupItem(byte(Group), i), WI))
		{
			// End:0x120
			if(WI.InventoryGroup != LastIndex)
			{
				LastIndex = WI.InventoryGroup;
				lb_Weapons.List.Add(Class'BCoreProV55.BallisticWeaponClassInfo'.static.GetHeading(LastIndex),, "Weapon Category", true);
				LayoutIndexList.Insert(LayoutIndexList.Length, 1);
				CamoIndexList.Insert(CamoIndexList.Length, 1);
			}
			lb_Weapons.List.Add(WI.ItemName,, COI.GetGroupItem(byte(Group), i), false);
			LayoutIndexList.Insert(LayoutIndexList.Length, 1);
			CamoIndexList.Insert(CamoIndexList.Length, 1);
		}
		i++;
		// [Loop Continue]
		goto J0x5A;
	}
	UpdateWeaponIconAndDesc();
	//return;	
}

simulated function bool LoadWIFromCache(string ClassStr, out WeaponInfo WepInfo)
{
	local int i;

	WepInfo = Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(ClassStr, i);
	// End:0x86
	if(i == -1)
	{
		Log("BallisticOutfittingWeaponSelect::LoadWIFromCache: Error loading item: " $ ClassStr, 'Warning');
		return false;
	}
	return true;
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

	cb_WeapCamoIndex.Clear();
	// End:0x20
	if(LayoutIndex == -1)
	{
		return false;
	}
	GameStyleIndex = Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle;
	// End:0x86
	if(BW.default.ParamsClasses.Length < int(GameStyleIndex))
	{
		Log("Error loading item for outfitting: " $ string(BW), 'Warning');
		return false;
	}
	AllowedCamos = BW.default.ParamsClasses[int(GameStyleIndex)].default.Layouts[LayoutIndex].AllowedCamos;
	// End:0x26A
	if(AllowedCamos.Length == 0)
	{
		i = 0;
		J0xCD:

		// End:0x239 [Loop If]
		if(i < BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos.Length)
		{
			// End:0x1C1
			if(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[i].CamoName == "")
			{
				// End:0x16E
				if(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos.Length == 1)
				{
					cb_WeapCamoIndex.AddItem("None",, "0");					
				}
				else
				{
					cb_WeapCamoIndex.AddItem("Layout: " $ string(i),, string(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[i].Index));
				}
			}
			cb_WeapCamoIndex.AddItem(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[i].CamoName,, string(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[i].Index));
			i++;
			// [Loop Continue]
			goto J0xCD;
		}
		cb_WeapCamoIndex.SetIndex(int(CamoIndexList[lb_Weapons.List.Index]));		
	}
	else
	{
		i = 0;
		J0x271:

		// End:0x371 [Loop If]
		if(i < AllowedCamos.Length)
		{
			cb_WeapCamoIndex.AddItem(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[AllowedCamos[i]].CamoName,, string(BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[AllowedCamos[i]].Index));
			// End:0x367
			if(int(CamoIndexList[lb_Weapons.List.Index]) == BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[AllowedCamos[i]].Index)
			{
				cb_WeapCamoIndex.SetIndex(i);
			}
			i++;
			// [Loop Continue]
			goto J0x271;
		}
	}
	// End:0x3A1
	if(cb_WeapCamoIndex.ItemCount() == 0)
	{
		cb_WeapCamoIndex.AddItem("None",, "255");
	}
	// End:0x430
	if((cb_WeapCamoIndex.ItemCount() > 1) && !Class'BCoreProV55.BallisticReplicationInfo'.default.bNoRandomCamo)
	{
		cb_WeapCamoIndex.AddItem("Random",, "255");
		// End:0x430
		if(int(CamoIndexList[lb_Weapons.List.Index]) == 255)
		{
			cb_WeapCamoIndex.SetIndex(cb_WeapCamoIndex.ItemCount() - 1);
		}
	}
	return true;
	//return;	
}

function UpdateWeaponIconAndDesc()
{
	local Class<BallisticWeapon> BW;

	l_WeapTitle.Caption = lb_Weapons.List.SelectedText();
	// End:0xAA
	if(lb_Weapons.List.IsSection())
	{
		tb_Desc.SetContent(Class'BCoreProV55.BallisticWeaponClassInfo'.static.GetClassDescription(lb_Weapons.List.SelectedText()));
		Pic_Weapon.Image = none;
		cb_WeapLayoutIndex.SetVisibility(false);
		cb_WeapCamoIndex.SetVisibility(false);
		return;
	}
	// End:0x28F
	if(lb_Weapons.List.GetObject() != none)
	{
		// End:0x1DE
		if(Class<BallisticWeapon>(lb_Weapons.List.GetObject()) != none)
		{
			bUpdatingWeapon = true;
			BW = Class<BallisticWeapon>(lb_Weapons.List.GetObject());
			Pic_Weapon.Image = BW.default.BigIconMaterial;
			tb_Desc.SetContent(BW.static.GetShortManual());
			LoadLIFromBW(BW);
			cb_WeapLayoutIndex.SetIndex(int(LayoutIndexList[lb_Weapons.List.Index]));
			LoadCIFromBW(BW, int(LayoutIndexList[lb_Weapons.List.Index]));
			cb_WeapLayoutIndex.SetVisibility(true);
			cb_WeapCamoIndex.SetVisibility(true);
			bUpdatingWeapon = false;
			return;
		}
		// End:0x28D
		if(Class<ConflictItem>(lb_Weapons.List.GetObject()) != none)
		{
			Pic_Weapon.Image = Class<ConflictItem>(lb_Weapons.List.static.GetObject()).default.Icon;
			tb_Desc.SetContent(Class<ConflictItem>(lb_Weapons.List.static.GetObject()).default.Description);
			cb_WeapLayoutIndex.SetVisibility(false);
			cb_WeapCamoIndex.SetVisibility(false);
			return;
		}
		return;
	}
	// End:0x4BB
	if(lb_Weapons.List.GetExtra() != "")
	{
		BW = Class<BallisticWeapon>(DynamicLoadObject(lb_Weapons.List.GetExtra(), Class'Core.Class'));
		// End:0x4BB
		if(BW != none)
		{
			bUpdatingWeapon = true;
			Pic_Weapon.Image = BW.default.BigIconMaterial;
			tb_Desc.SetContent(BW.static.GetShortManual());
			lb_Weapons.List.SetObjectAtIndex(lb_Weapons.List.Index, BW);
			// End:0x401
			if((int(LayoutIndexList[lb_Weapons.List.Index]) == 0) && int(CamoIndexList[lb_Weapons.List.Index]) == 0)
			{
				LoadLIFromBW(BW);
				LayoutIndexList[lb_Weapons.List.Index] = byte(cb_WeapLayoutIndex.GetIndex());
				LoadCIFromBW(BW, cb_WeapLayoutIndex.GetIndex());				
			}
			else
			{
				LoadLIFromBW(BW);
				cb_WeapLayoutIndex.SetIndex(int(LayoutIndexList[lb_Weapons.List.Index]));
				LoadCIFromBW(BW, int(LayoutIndexList[lb_Weapons.List.Index]));
			}
			CamoIndexList[lb_Weapons.List.Index] = byte(cb_WeapCamoIndex.GetIndex());
			cb_WeapLayoutIndex.SetVisibility(true);
			cb_WeapCamoIndex.SetVisibility(true);
			bUpdatingWeapon = false;
		}
	}
	//return;	
}

function InternalOnChange(GUIComponent Sender)
{
	local Class<BallisticWeapon> BW;

	// End:0x21
	if(Sender == lb_Weapons.List)
	{
		UpdateWeaponIconAndDesc();		
	}
	else
	{
		// End:0x122
		if(Sender == cb_WeapLayoutIndex)
		{
			// End:0x11F
			if(((lb_Weapons.List.GetObject() != none) && Class<BallisticWeapon>(lb_Weapons.List.GetObject()) != none) && !bUpdatingWeapon)
			{
				LayoutIndexList[lb_Weapons.List.Index] = byte(cb_WeapLayoutIndex.GetIndex());
				// End:0x11F
				if(Class<BallisticWeapon>(lb_Weapons.List.GetObject()) != none)
				{
					BW = Class<BallisticWeapon>(lb_Weapons.List.GetObject());
					LoadCIFromBW(BW, int(LayoutIndexList[lb_Weapons.List.Index]));
				}
			}			
		}
		else
		{
			// End:0x1B0
			if(Sender == cb_WeapCamoIndex)
			{
				// End:0x1B0
				if(((lb_Weapons.List.GetObject() != none) && Class<BallisticWeapon>(lb_Weapons.List.GetObject()) != none) && !bUpdatingWeapon)
				{
					CamoIndexList[lb_Weapons.List.Index] = byte(cb_WeapCamoIndex.GetExtra());
				}
			}
		}
	}
	//return;	
}

function bool InternalOnClick(GUIComponent Sender)
{
	// End:0x21
	if(Sender == b_OK)
	{
		Controller.CloseMenu(false);
		return true;
	}
	// End:0x42
	if(Sender == b_Cancel)
	{
		Controller.CloseMenu(true);
		return true;
	}
	//return;	
}

function string GetDataString()
{
	local string ls;

	ls = (((lb_Weapons.List.GetExtra() $ "|") $ string(LayoutIndexList[lb_Weapons.List.Index])) $ "|") $ string(CamoIndexList[lb_Weapons.List.Index]);
	return ls;
	//return;	
}

defaultproperties
{
	// Reference: GUIListBox'BallisticProV55.BallisticOutfittingWeaponSelect.lb_WeaponsList'
	begin object name="lb_WeaponsList" class=XInterface.GUIListBox
		bVisibleWhenEmpty=true
		OnCreateComponent=lb_WeaponsList.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Available items. Double-click to add them to your inventory."
		WinTop=0.0950000
		WinLeft=0.0150000
		WinWidth=0.4000000
		WinHeight=0.7500000
		RenderWeight=0.5200000
		TabOrder=1
		bBoundToParent=true
	end object
	lb_Weapons=lb_WeaponsList
	// Reference: GUIImage'BallisticProV55.BallisticOutfittingWeaponSelect.Box_WeapListImg'
	begin object name="Box_WeapListImg" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.0500000
		WinWidth=0.4300000
		WinHeight=0.8500000
		RenderWeight=0.0020000
		bBoundToParent=true
	end object
	Box_WeapList=Box_WeapListImg
	// Reference: GUIImage'BallisticProV55.BallisticOutfittingWeaponSelect.Pic_WeaponImg'
	begin object name="Pic_WeaponImg" class=XInterface.GUIImage
		ImageStyle=4
		ImageAlign=1
		WinTop=0.0950000
		WinLeft=0.5150000
		WinWidth=0.4000000
		WinHeight=0.2260000
		RenderWeight=0.0040000
		bBoundToParent=true
	end object
	Pic_Weapon=Pic_WeaponImg
	// Reference: GUIImage'BallisticProV55.BallisticOutfittingWeaponSelect.Box_WeapIconImg'
	begin object name="Box_WeapIconImg" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.0500000
		WinLeft=0.4500000
		WinWidth=0.5400000
		WinHeight=0.8500000
		RenderWeight=0.0020000
		bBoundToParent=true
	end object
	Box_WeapIcon=Box_WeapIconImg
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponSelect.cb_WeapLayoutIndexComBox'
	begin object name="cb_WeapLayoutIndexComBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Weapon layouts."
		WinTop=0.2800000
		WinLeft=0.4800000
		WinWidth=0.1960940
		WinHeight=0.0400000
		TabOrder=0
		bBoundToParent=true
		OnChange=BallisticOutfittingWeaponSelect.InternalOnChange
		OnKeyEvent=cb_WeapLayoutIndexComBox.InternalOnKeyEvent
	end object
	cb_WeapLayoutIndex=cb_WeapLayoutIndexComBox
	// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponSelect.cb_WeapCamoIndexComBox'
	begin object name="cb_WeapCamoIndexComBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Weapon camos."
		WinTop=0.2800000
		WinLeft=0.7400000
		WinWidth=0.1960940
		WinHeight=0.0400000
		TabOrder=0
		bBoundToParent=true
		OnChange=BallisticOutfittingWeaponSelect.InternalOnChange
		OnKeyEvent=cb_WeapCamoIndexComBox.InternalOnKeyEvent
	end object
	cb_WeapCamoIndex=cb_WeapCamoIndexComBox
	// Reference: GUILabel'BallisticProV55.BallisticOutfittingWeaponSelect.l_WeapTitlelabel'
	begin object name="l_WeapTitlelabel" class=XInterface.GUILabel
		TextAlign=1
		TextColor=(R=255,G=255,B=255,A=255)
		WinTop=0.0464000
		WinLeft=0.5100000
		WinWidth=0.4300000
		WinHeight=0.0500000
		bBoundToParent=true
	end object
	l_WeapTitle=l_WeapTitlelabel
	// Reference: GUIScrollTextBox'BallisticProV55.BallisticOutfittingWeaponSelect.WeaponDescription'
	begin object name="WeaponDescription" class=XInterface.GUIScrollTextBox
		CharDelay=0.0015000
		EOLDelay=0.2500000
		bVisibleWhenEmpty=true
		OnCreateComponent=WeaponDescription.InternalOnCreateComponent
		FontScale=0
		WinTop=0.3300000
		WinLeft=0.4800000
		WinWidth=0.5000000
		WinHeight=0.5000000
		RenderWeight=0.5100000
		TabOrder=0
		bBoundToParent=true
		bAcceptsInput=false
		bNeverFocus=true
	end object
	tb_Desc=WeaponDescription
	// Reference: GUIButton'BallisticProV55.BallisticOutfittingWeaponSelect.LockedCancelButton'
	begin object name="LockedCancelButton" class=XInterface.GUIButton
		Caption="Cancel"
		bAutoShrink=false
		WinTop=0.8500000
		WinLeft=0.5100000
		WinWidth=0.1600000
		TabOrder=99
		bBoundToParent=true
		OnClick=BallisticOutfittingWeaponSelect.InternalOnClick
		OnKeyEvent=LockedCancelButton.InternalOnKeyEvent
	end object
	b_Cancel=LockedCancelButton
	// Reference: GUIButton'BallisticProV55.BallisticOutfittingWeaponSelect.LockedOKButton'
	begin object name="LockedOKButton" class=XInterface.GUIButton
		Caption="OK"
		bAutoShrink=false
		WinTop=0.8500000
		WinLeft=0.7430000
		WinWidth=0.1600000
		TabOrder=100
		bBoundToParent=true
		OnClick=BallisticOutfittingWeaponSelect.InternalOnClick
		OnKeyEvent=LockedOKButton.InternalOnKeyEvent
	end object
	b_OK=LockedOKButton
	EdgeBorder[0]=16.0000000
	EdgeBorder[1]=24.0000000
	EdgeBorder[2]=16.0000000
	EdgeBorder[3]=24.0000000
	WindowName="Select Weapon"
	bResizeWidthAllowed=false
	bResizeHeightAllowed=false
	DefaultLeft=0.1250000
	DefaultTop=0.1500000
	DefaultWidth=0.7400000
	DefaultHeight=0.7000000
	bCaptureInput=true
	InactiveFadeColor=(R=60,G=60,B=60,A=255)
	WinTop=0.1500000
	WinLeft=0.1250000
	WinWidth=0.7400000
	WinHeight=0.7000000
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponSelect.cb_WeapCamoIndexComBox'
begin object name="cb_WeapCamoIndexComBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Weapon camos."
	WinTop=0.2800000
	WinLeft=0.7400000
	WinWidth=0.1960940
	WinHeight=0.0400000
	TabOrder=0
	bBoundToParent=true
	OnChange=BallisticOutfittingWeaponSelect.InternalOnChange
	OnKeyEvent=cb_WeapCamoIndexComBox.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticOutfittingWeaponSelect.cb_WeapLayoutIndexComBox'
begin object name="cb_WeapLayoutIndexComBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Weapon layouts."
	WinTop=0.2800000
	WinLeft=0.4800000
	WinWidth=0.1960940
	WinHeight=0.0400000
	TabOrder=0
	bBoundToParent=true
	OnChange=BallisticOutfittingWeaponSelect.InternalOnChange
	OnKeyEvent=cb_WeapLayoutIndexComBox.InternalOnKeyEvent
end object
// Reference: GUIScrollTextBox'BallisticProV55.BallisticOutfittingWeaponSelect.WeaponDescription'
begin object name="WeaponDescription" class=XInterface.GUIScrollTextBox
	CharDelay=0.0015000
	EOLDelay=0.2500000
	bVisibleWhenEmpty=true
	OnCreateComponent=WeaponDescription.InternalOnCreateComponent
	FontScale=0
	WinTop=0.3300000
	WinLeft=0.4800000
	WinWidth=0.5000000
	WinHeight=0.5000000
	RenderWeight=0.5100000
	TabOrder=0
	bBoundToParent=true
	bAcceptsInput=false
	bNeverFocus=true
end object
// Reference: GUIListBox'BallisticProV55.BallisticOutfittingWeaponSelect.lb_WeaponsList'
begin object name="lb_WeaponsList" class=XInterface.GUIListBox
	bVisibleWhenEmpty=true
	OnCreateComponent=lb_WeaponsList.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Available items. Double-click to add them to your inventory."
	WinTop=0.0950000
	WinLeft=0.0150000
	WinWidth=0.4000000
	WinHeight=0.7500000
	RenderWeight=0.5200000
	TabOrder=1
	bBoundToParent=true
end object
// Reference: GUIButton'BallisticProV55.BallisticOutfittingWeaponSelect.LockedOKButton'
begin object name="LockedOKButton" class=XInterface.GUIButton
	Caption="OK"
	bAutoShrink=false
	WinTop=0.8500000
	WinLeft=0.7430000
	WinWidth=0.1600000
	TabOrder=100
	bBoundToParent=true
	OnClick=BallisticOutfittingWeaponSelect.InternalOnClick
	OnKeyEvent=LockedOKButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.BallisticOutfittingWeaponSelect.LockedCancelButton'
begin object name="LockedCancelButton" class=XInterface.GUIButton
	Caption="Cancel"
	bAutoShrink=false
	WinTop=0.8500000
	WinLeft=0.5100000
	WinWidth=0.1600000
	TabOrder=99
	bBoundToParent=true
	OnClick=BallisticOutfittingWeaponSelect.InternalOnClick
	OnKeyEvent=LockedCancelButton.InternalOnKeyEvent
end object
// Reference: GUIImage'BallisticProV55.BallisticOutfittingWeaponSelect.Box_WeapListImg'
begin object name="Box_WeapListImg" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.0500000
	WinWidth=0.4300000
	WinHeight=0.8500000
	RenderWeight=0.0020000
	bBoundToParent=true
end object
// Reference: GUIImage'BallisticProV55.BallisticOutfittingWeaponSelect.Pic_WeaponImg'
begin object name="Pic_WeaponImg" class=XInterface.GUIImage
	ImageStyle=4
	ImageAlign=1
	WinTop=0.0950000
	WinLeft=0.5150000
	WinWidth=0.4000000
	WinHeight=0.2260000
	RenderWeight=0.0040000
	bBoundToParent=true
end object
// Reference: GUIImage'BallisticProV55.BallisticOutfittingWeaponSelect.Box_WeapIconImg'
begin object name="Box_WeapIconImg" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.0500000
	WinLeft=0.4500000
	WinWidth=0.5400000
	WinHeight=0.8500000
	RenderWeight=0.0020000
	bBoundToParent=true
end object
// Reference: GUILabel'BallisticProV55.BallisticOutfittingWeaponSelect.l_WeapTitlelabel'
begin object name="l_WeapTitlelabel" class=XInterface.GUILabel
	TextAlign=1
	TextColor=(R=255,G=255,B=255,A=255)
	WinTop=0.0464000
	WinLeft=0.5100000
	WinWidth=0.4300000
	WinHeight=0.0500000
	bBoundToParent=true
end object
