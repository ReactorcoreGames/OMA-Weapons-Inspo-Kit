class MidGameTab_Killstreaks extends MidGamePanel
	editinlinenew
	instanced;

var bool bInitialized;
var bool bLoadInitialized;
var() automated GUILoadOutItem Item_Streak1;
var() automated GUILoadOutItem Item_Streak2;
var() automated GUIComboBox cb_Streak1;
var() automated GUIComboBox cb_Streak2;
var() automated GUIComboBox cb_Streak1_LI;
var() automated GUIComboBox cb_Streak2_LI;
var() automated GUIComboBox cb_Streak1_CI;
var() automated GUIComboBox cb_Streak2_CI;
var() automated GUIImage MyBack;
var() automated GUIImage Box_Streak1;
var() automated GUIImage Box_Streak2;
var() automated GUIImage Streak1Back;
var() automated GUIImage Streak2Back;
var() automated GUIHeader MyHeader;
var() automated GUILabel l_Receiving;
var bool bWeaponsLoaded;
var() array<string> DefaultStreaks;
var() localized string QuickListText;
var localized string ReceivingText[2];
var KillstreakLRI KLRI;

function InitPanel()
{
	super(GUITabPanel).InitPanel();
	Initialize();
	//return;	
}

function Initialize()
{
	// End:0x0B
	if(bInitialized)
	{
		return;
	}
	Item_Streak1.__OnItemChange__Delegate = OnLoadoutItemChange;
	Item_Streak2.__OnItemChange__Delegate = OnLoadoutItemChange;
	Item_Streak1.SetItem(Class'BallisticProV55.KillstreakConfig'.default.Killstreaks[0]);
	Item_Streak2.SetItem(Class'BallisticProV55.KillstreakConfig'.default.Killstreaks[1]);
	KLRI = Class'BallisticProV55.Mut_Killstreak'.static.GetKLRI(PlayerOwner().PlayerReplicationInfo);
	// End:0x101
	if(KLRI == none)
	{
		// End:0xDF
		if(int(PlayerOwner().Level.NetMode) == int(NM_Client))
		{
			l_Receiving.Caption = ReceivingText[0];
			SetTimer(0.5000000, false);			
		}
		else
		{
			l_Receiving.Caption = ReceivingText[1];
			SetTimer(0.1000000, false);
		}		
	}
	else
	{
		OnLRIAcquired();
	}
	bInitialized = true;
	//return;	
}

event Timer()
{
	// End:0x14
	if(KLRI != none)
	{
		OnLRIAcquired();		
	}
	else
	{
		// End:0x6C
		if((PlayerOwner() != none) && Class'BallisticProV55.Mut_Killstreak'.static.GetKLRI(PlayerOwner().PlayerReplicationInfo) != none)
		{
			KLRI = Class'BallisticProV55.Mut_Killstreak'.static.GetKLRI(PlayerOwner().PlayerReplicationInfo);
			OnLRIAcquired();
			return;			
		}
		else
		{
			SetTimer(0.5000000, false);
		}
	}
	//return;	
}

function OnLRIAcquired()
{
	// End:0x20
	if(!KLRI.bWeaponsReady)
	{
		SetTimer(0.1000000, false);		
	}
	else
	{
		InitWeaponLists();
	}
	//return;	
}

function InitWeaponLists()
{
	// End:0x0B
	if(bWeaponsLoaded)
	{
		return;
	}
	LoadWeapons();
	cb_Streak1.List.bSorted = true;
	cb_Streak1.List.Sort();
	cb_Streak2.List.bSorted = true;
	cb_Streak2.List.Sort();
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

	// End:0xA0 [Loop If]
	if(i < KLRI.GroupLength(0))
	{
		// End:0x96
		if(GetItemInfo(0, i, ic, IMat, ICN, ICrds))
		{
			Item_Streak1.AddItem(ic, IMat, ICN, ICrds);
			cb_Streak1.AddItem(ic,, ICN);
			cb_Streak1.SetText(QuickListText);
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0xA7:

	// End:0x140 [Loop If]
	if(i < KLRI.GroupLength(1))
	{
		// End:0x136
		if(GetItemInfo(1, i, ic, IMat, ICN, ICrds))
		{
			Item_Streak2.AddItem(ic, IMat, ICN, ICrds);
			cb_Streak2.AddItem(ic,, ICN);
			cb_Streak2.SetText(QuickListText);
		}
		i++;
		// [Loop Continue]
		goto J0xA7;
	}
	Item_Streak1.SetItem(Class'BallisticProV55.KillstreakConfig'.default.Killstreaks[0]);
	LoadLayouts(0, Item_Streak1.Index, cb_Streak1_LI);
	cb_Streak1_LI.SetIndex(int(Class'BallisticProV55.KillstreakConfig'.default.Layouts[0]));
	LoadCamos(0, cb_Streak1_LI.GetIndex(), Item_Streak1.Index, cb_Streak1_CI);
	Item_Streak2.SetItem(Class'BallisticProV55.KillstreakConfig'.default.Killstreaks[1]);
	LoadLayouts(1, Item_Streak2.Index, cb_Streak2_LI);
	cb_Streak2_LI.SetIndex(int(Class'BallisticProV55.KillstreakConfig'.default.Layouts[1]));
	LoadCamos(1, cb_Streak1_LI.GetIndex(), Item_Streak2.Index, cb_Streak2_CI);
	Class'BCoreProV55.BC_WeaponInfoCache'.static.EndSession();
	l_Receiving.Caption = "";
	bWeaponsLoaded = true;
	//return;	
}

function bool GetItemInfo(int Group, int Index, out string ItemCap, out Material ItemImage, out string ItemClassName, optional out IntBox ImageCoords)
{
	local WeaponInfo WI;
	local int i;

	// End:0x24
	if(KLRI.GetGroupItem(byte(Group), Index) == "")
	{
		return false;
	}
	WI = Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(KLRI.GetGroupItem(byte(Group), Index), i);
	// End:0xB4
	if(i == -1)
	{
		Log("Error loading item for killstreaks: " $ KLRI.GetGroupItem(byte(Group), Index), 'Warning');
		return false;
	}
	ItemCap = WI.ItemName;
	ItemClassName = KLRI.GetGroupItem(byte(Group), Index);
	// End:0x146
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

function bool LoadLayouts(int GroupIndex, int Index, GUIComboBox LayoutComboBox)
{
	local byte GameStyleIndex;
	local int i;
	local Class<BallisticWeapon> BW;

	LayoutComboBox.Clear();
	BW = Class<BallisticWeapon>(DynamicLoadObject(KLRI.GetGroupItem(byte(GroupIndex), Index), Class'Core.Class'));
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
	BW = Class<BallisticWeapon>(DynamicLoadObject(KLRI.GetGroupItem(byte(GroupIndex), Index), Class'Core.Class'));
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
		CamoComboBox.SetIndex(int(Class'BallisticProV55.KillstreakConfig'.default.Camos[GroupIndex]));		
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
			if(int(Class'BallisticProV55.KillstreakConfig'.default.Camos[GroupIndex]) == BW.default.ParamsClasses[int(GameStyleIndex)].default.Camos[AllowedCamos[i]].Index)
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
	// End:0x488
	if((CamoComboBox.ItemCount() > 1) && !Class'BCoreProV55.BallisticReplicationInfo'.default.bNoRandomCamo)
	{
		CamoComboBox.AddItem("Random",, "255");
		// End:0x488
		if(int(Class'BallisticProV55.KillstreakConfig'.default.Camos[GroupIndex]) == 255)
		{
			CamoComboBox.SetIndex(CamoComboBox.ItemCount() - 1);
		}
	}
	return true;
	//return;	
}

function bool InternalOnKeyEvent(out byte Key, out byte State, float Delta)
{
	return false;
	//return;	
}

function SaveStreaks()
{
	// End:0x0D
	if(!bWeaponsLoaded)
	{
		return;
	}
	// End:0x62
	if(Item_Streak1.items.Length > Item_Streak1.Index)
	{
		Class'BallisticProV55.KillstreakConfig'.default.Killstreaks[0] = Item_Streak1.items[Item_Streak1.Index].Text;
	}
	// End:0xB7
	if(Item_Streak2.items.Length > Item_Streak2.Index)
	{
		Class'BallisticProV55.KillstreakConfig'.default.Killstreaks[1] = Item_Streak2.items[Item_Streak2.Index].Text;
	}
	Class'BallisticProV55.KillstreakConfig'.default.Layouts[0] = byte(cb_Streak1_LI.GetIndex());
	Class'BallisticProV55.KillstreakConfig'.default.Layouts[1] = byte(cb_Streak2_LI.GetIndex());
	Class'BallisticProV55.KillstreakConfig'.default.Camos[0] = byte(int(cb_Streak1_CI.GetExtra()));
	Class'BallisticProV55.KillstreakConfig'.default.Camos[1] = byte(int(cb_Streak2_CI.GetExtra()));
	Class'BallisticProV55.KillstreakConfig'.static.StaticSaveConfig();
	KLRI.UpdateStreakChoices();
	//return;	
}

function OnLoadoutItemChange(GUIComponent Sender)
{
	// End:0x47
	if(Sender == Item_Streak1)
	{
		LoadLayouts(0, Item_Streak1.Index, cb_Streak1_LI);
		LoadCamos(0, 0, Item_Streak1.Index, cb_Streak1_CI);		
	}
	else
	{
		// End:0x8B
		if(Sender == Item_Streak2)
		{
			LoadLayouts(1, Item_Streak2.Index, cb_Streak2_LI);
			LoadCamos(1, 0, Item_Streak2.Index, cb_Streak2_CI);
		}
	}
	SaveStreaks();
	//return;	
}

function InternalOnChange(GUIComponent Sender)
{
	// End:0x23
	if((KLRI == none) || !KLRI.bWeaponsReady)
	{
		return;
	}
	// End:0xA0
	if(Sender == cb_Streak1)
	{
		Item_Streak1.SetItem(cb_Streak1.GetExtra());
		Item_Streak1.OnItemChange(Item_Streak1);
		LoadLayouts(0, Item_Streak1.Index, cb_Streak1_LI);
		LoadCamos(0, 0, Item_Streak1.Index, cb_Streak1_CI);		
	}
	else
	{
		// End:0x11D
		if(Sender == cb_Streak2)
		{
			Item_Streak2.SetItem(cb_Streak2.GetExtra());
			Item_Streak2.OnItemChange(Item_Streak2);
			LoadLayouts(1, Item_Streak2.Index, cb_Streak2_LI);
			LoadCamos(1, 0, Item_Streak2.Index, cb_Streak2_CI);			
		}
		else
		{
			// End:0x15E
			if(Sender == cb_Streak1_LI)
			{
				LoadCamos(0, cb_Streak1_LI.GetIndex(), Item_Streak1.Index, cb_Streak1_CI);
				SaveStreaks();				
			}
			else
			{
				// End:0x19F
				if(Sender == cb_Streak2_LI)
				{
					LoadCamos(1, cb_Streak2_LI.GetIndex(), Item_Streak2.Index, cb_Streak2_CI);
					SaveStreaks();					
				}
				else
				{
					// End:0x1B7
					if(Sender == cb_Streak1_CI)
					{
						SaveStreaks();						
					}
					else
					{
						// End:0x1CC
						if(Sender == cb_Streak2_CI)
						{
							SaveStreaks();
						}
					}
				}
			}
		}
	}
	//return;	
}

defaultproperties
{
	// Reference: GUILoadOutItem'BallisticProV55.MidGameTab_Killstreaks.Streak1Image'
	begin object name="Streak1Image" class=BCoreProV55.GUILoadOutItem
		NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
		Caption="4 Kills"
		WinTop=0.2000000
		WinLeft=0.2500000
		WinWidth=0.2000000
		WinHeight=0.2000000
		OnRendered=Streak1Image.InternalOnDraw
		OnClick=Streak1Image.InternalOnClick
		OnRightClick=Streak1Image.InternalOnRightClick
	end object
	Item_Streak1=Streak1Image
	// Reference: GUILoadOutItem'BallisticProV55.MidGameTab_Killstreaks.Streak2Image'
	begin object name="Streak2Image" class=BCoreProV55.GUILoadOutItem
		NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
		Caption="9 Kills"
		WinTop=0.2000000
		WinLeft=0.5500000
		WinWidth=0.2000000
		WinHeight=0.2000000
		OnRendered=Streak2Image.InternalOnDraw
		OnClick=Streak2Image.InternalOnClick
		OnRightClick=Streak2Image.InternalOnRightClick
	end object
	Item_Streak2=Streak2Image
	// Reference: GUIComboBox'BallisticProV55.MidGameTab_Killstreaks.cb_Streak1ComBox'
	begin object name="cb_Streak1ComBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Quick list of Streak1 items"
		WinTop=0.4300000
		WinLeft=0.2515630
		WinWidth=0.1960940
		WinHeight=0.0400000
		TabOrder=0
		OnChange=MidGameTab_Killstreaks.InternalOnChange
		OnKeyEvent=cb_Streak1ComBox.InternalOnKeyEvent
	end object
	cb_Streak1=cb_Streak1ComBox
	// Reference: GUIComboBox'BallisticProV55.MidGameTab_Killstreaks.cb_Streak2Box'
	begin object name="cb_Streak2Box" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Quick list of Streak2 items"
		WinTop=0.4300000
		WinLeft=0.5509770
		WinWidth=0.1960940
		WinHeight=0.0400000
		TabOrder=0
		OnChange=MidGameTab_Killstreaks.InternalOnChange
		OnKeyEvent=cb_Streak2Box.InternalOnKeyEvent
	end object
	cb_Streak2=cb_Streak2Box
	// Reference: GUIComboBox'BallisticProV55.MidGameTab_Killstreaks.cb_Streak1ComBox_LI'
	begin object name="cb_Streak1ComBox_LI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Streak 1 layouts."
		WinTop=0.4800000
		WinLeft=0.2515630
		WinWidth=0.1960940
		WinHeight=0.0400000
		TabOrder=0
		OnChange=MidGameTab_Killstreaks.InternalOnChange
		OnKeyEvent=cb_Streak1ComBox_LI.InternalOnKeyEvent
	end object
	cb_Streak1_LI=cb_Streak1ComBox_LI
	// Reference: GUIComboBox'BallisticProV55.MidGameTab_Killstreaks.cb_Streak2ComBox_LI'
	begin object name="cb_Streak2ComBox_LI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Streak 2 layouts."
		WinTop=0.4800000
		WinLeft=0.5509770
		WinWidth=0.1960940
		WinHeight=0.0400000
		TabOrder=0
		OnChange=MidGameTab_Killstreaks.InternalOnChange
		OnKeyEvent=cb_Streak2ComBox_LI.InternalOnKeyEvent
	end object
	cb_Streak2_LI=cb_Streak2ComBox_LI
	// Reference: GUIComboBox'BallisticProV55.MidGameTab_Killstreaks.cb_Streak1ComBox_CI'
	begin object name="cb_Streak1ComBox_CI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Streak 1 camos."
		WinTop=0.5300000
		WinLeft=0.2515630
		WinWidth=0.1960940
		WinHeight=0.0400000
		TabOrder=0
		OnChange=MidGameTab_Killstreaks.InternalOnChange
		OnKeyEvent=cb_Streak1ComBox_CI.InternalOnKeyEvent
	end object
	cb_Streak1_CI=cb_Streak1ComBox_CI
	// Reference: GUIComboBox'BallisticProV55.MidGameTab_Killstreaks.cb_Streak2ComBox_CI'
	begin object name="cb_Streak2ComBox_CI" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Streak 2 camos."
		WinTop=0.5300000
		WinLeft=0.5509770
		WinWidth=0.1960940
		WinHeight=0.0400000
		TabOrder=0
		OnChange=MidGameTab_Killstreaks.InternalOnChange
		OnKeyEvent=cb_Streak2ComBox_CI.InternalOnKeyEvent
	end object
	cb_Streak2_CI=cb_Streak2ComBox_CI
	// Reference: GUIImage'BallisticProV55.MidGameTab_Killstreaks.ImageBoxStreak1'
	begin object name="ImageBoxStreak1" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.1800000
		WinLeft=0.2375000
		WinWidth=0.2250000
		WinHeight=0.2400000
		RenderWeight=0.0020000
	end object
	Box_Streak1=ImageBoxStreak1
	// Reference: GUIImage'BallisticProV55.MidGameTab_Killstreaks.ImageBoxStreak2'
	begin object name="ImageBoxStreak2" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.1800000
		WinLeft=0.5375000
		WinWidth=0.2250000
		WinHeight=0.2400000
		RenderWeight=0.0020000
	end object
	Box_Streak2=ImageBoxStreak2
	// Reference: GUIImage'BallisticProV55.MidGameTab_Killstreaks.Streak1BackImage'
	begin object name="Streak1BackImage" class=XInterface.GUIImage
		Image=Texture'Engine.MenuBlack'
		ImageStyle=1
		WinTop=0.2000000
		WinLeft=0.2500000
		WinWidth=0.2000000
		WinHeight=0.2000000
		RenderWeight=0.0030000
	end object
	Streak1Back=Streak1BackImage
	// Reference: GUIImage'BallisticProV55.MidGameTab_Killstreaks.Streak2BackImage'
	begin object name="Streak2BackImage" class=XInterface.GUIImage
		Image=Texture'Engine.MenuBlack'
		ImageStyle=1
		WinTop=0.2000000
		WinLeft=0.5500000
		WinWidth=0.2000000
		WinHeight=0.2000000
		RenderWeight=0.0030000
	end object
	Streak2Back=Streak2BackImage
	// Reference: GUILabel'BallisticProV55.MidGameTab_Killstreaks.l_Receivinglabel'
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
	DefaultStreaks[0]="BallisticProV55.MRocketLauncher"
	DefaultStreaks[1]="BallisticProV55.RX22AFlamer"
	QuickListText="QuickList"
	ReceivingText[0]="Receiving..."
	ReceivingText[1]="Loading..."
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: GUILoadOutItem'BallisticProV55.MidGameTab_Killstreaks.Streak1Image'
begin object name="Streak1Image" class=BCoreProV55.GUILoadOutItem
	NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
	Caption="4 Kills"
	WinTop=0.2000000
	WinLeft=0.2500000
	WinWidth=0.2000000
	WinHeight=0.2000000
	OnRendered=Streak1Image.InternalOnDraw
	OnClick=Streak1Image.InternalOnClick
	OnRightClick=Streak1Image.InternalOnRightClick
end object
// Reference: GUILoadOutItem'BallisticProV55.MidGameTab_Killstreaks.Streak2Image'
begin object name="Streak2Image" class=BCoreProV55.GUILoadOutItem
	NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
	Caption="9 Kills"
	WinTop=0.2000000
	WinLeft=0.5500000
	WinWidth=0.2000000
	WinHeight=0.2000000
	OnRendered=Streak2Image.InternalOnDraw
	OnClick=Streak2Image.InternalOnClick
	OnRightClick=Streak2Image.InternalOnRightClick
end object
// Reference: GUIComboBox'BallisticProV55.MidGameTab_Killstreaks.cb_Streak2ComBox_CI'
begin object name="cb_Streak2ComBox_CI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Streak 2 camos."
	WinTop=0.5300000
	WinLeft=0.5509770
	WinWidth=0.1960940
	WinHeight=0.0400000
	TabOrder=0
	OnChange=MidGameTab_Killstreaks.InternalOnChange
	OnKeyEvent=cb_Streak2ComBox_CI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.MidGameTab_Killstreaks.cb_Streak2ComBox_LI'
begin object name="cb_Streak2ComBox_LI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Streak 2 layouts."
	WinTop=0.4800000
	WinLeft=0.5509770
	WinWidth=0.1960940
	WinHeight=0.0400000
	TabOrder=0
	OnChange=MidGameTab_Killstreaks.InternalOnChange
	OnKeyEvent=cb_Streak2ComBox_LI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.MidGameTab_Killstreaks.cb_Streak2Box'
begin object name="cb_Streak2Box" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Quick list of Streak2 items"
	WinTop=0.4300000
	WinLeft=0.5509770
	WinWidth=0.1960940
	WinHeight=0.0400000
	TabOrder=0
	OnChange=MidGameTab_Killstreaks.InternalOnChange
	OnKeyEvent=cb_Streak2Box.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.MidGameTab_Killstreaks.cb_Streak1ComBox_CI'
begin object name="cb_Streak1ComBox_CI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Streak 1 camos."
	WinTop=0.5300000
	WinLeft=0.2515630
	WinWidth=0.1960940
	WinHeight=0.0400000
	TabOrder=0
	OnChange=MidGameTab_Killstreaks.InternalOnChange
	OnKeyEvent=cb_Streak1ComBox_CI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.MidGameTab_Killstreaks.cb_Streak1ComBox_LI'
begin object name="cb_Streak1ComBox_LI" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Streak 1 layouts."
	WinTop=0.4800000
	WinLeft=0.2515630
	WinWidth=0.1960940
	WinHeight=0.0400000
	TabOrder=0
	OnChange=MidGameTab_Killstreaks.InternalOnChange
	OnKeyEvent=cb_Streak1ComBox_LI.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.MidGameTab_Killstreaks.cb_Streak1ComBox'
begin object name="cb_Streak1ComBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Quick list of Streak1 items"
	WinTop=0.4300000
	WinLeft=0.2515630
	WinWidth=0.1960940
	WinHeight=0.0400000
	TabOrder=0
	OnChange=MidGameTab_Killstreaks.InternalOnChange
	OnKeyEvent=cb_Streak1ComBox.InternalOnKeyEvent
end object
// Reference: GUIImage'BallisticProV55.MidGameTab_Killstreaks.ImageBoxStreak1'
begin object name="ImageBoxStreak1" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.1800000
	WinLeft=0.2375000
	WinWidth=0.2250000
	WinHeight=0.2400000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.MidGameTab_Killstreaks.ImageBoxStreak2'
begin object name="ImageBoxStreak2" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.1800000
	WinLeft=0.5375000
	WinWidth=0.2250000
	WinHeight=0.2400000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.MidGameTab_Killstreaks.Streak1BackImage'
begin object name="Streak1BackImage" class=XInterface.GUIImage
	Image=Texture'Engine.MenuBlack'
	ImageStyle=1
	WinTop=0.2000000
	WinLeft=0.2500000
	WinWidth=0.2000000
	WinHeight=0.2000000
	RenderWeight=0.0030000
end object
// Reference: GUIImage'BallisticProV55.MidGameTab_Killstreaks.Streak2BackImage'
begin object name="Streak2BackImage" class=XInterface.GUIImage
	Image=Texture'Engine.MenuBlack'
	ImageStyle=1
	WinTop=0.2000000
	WinLeft=0.5500000
	WinWidth=0.2000000
	WinHeight=0.2000000
	RenderWeight=0.0030000
end object
// Reference: GUILabel'BallisticProV55.MidGameTab_Killstreaks.l_Receivinglabel'
begin object name="l_Receivinglabel" class=XInterface.GUILabel
	TextAlign=1
	TextColor=(R=255,G=255,B=0,A=255)
	FontScale=2
	WinTop=0.0870000
	WinLeft=0.0500000
	WinWidth=0.9000000
	WinHeight=0.0400000
end object
