class BallisticTeamOutfittingWeaponsTab extends UT2K4TabPanel
	config(BallisticProV55)
	editinlinenew
	instanced;

struct LoadoutWeapons
{
	var string PresetName;
	var string Weapons[5];
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
var() automated moComboBox cb_Presets;
var() automated GUIImage Box_Melee;
var() automated GUIImage Box_SideArm;
var() automated GUIImage Box_Primary;
var() automated GUIImage Box_Secondary;
var() automated GUIImage Box_Grenade;
var() automated GUIImage MeleeBack;
var() automated GUIImage SideArmBack;
var() automated GUIImage PrimaryBack;
var() automated GUIImage SecondaryBack;
var() automated GUIImage GrenadeBack;
var() automated GUIButton bDone;
var() automated GUIButton bCancel;
var() automated GUIButton BSavePreset;
var() automated GUILabel l_Receiving;
var export editinline BallisticTeamOutfittingMenu p_Anchor;
var config int CurrentIndex;
var config bool bInitialized;
var bool bWeaponsLoaded;
var() config LoadoutWeapons SavedLoadouts[5];
var int NumPresets;
var() localized string QuickListText;
var localized string ReceivingText[2];
var ClientTeamOutfittingInterface COI;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	super(GUIPanel).InitComponent(MyController, MyOwner);
	// End:0x42
	if(BallisticTeamOutfittingMenu(Controller.ActivePage) != none)
	{
		p_Anchor = BallisticTeamOutfittingMenu(Controller.ActivePage);
	}
	//return;	
}

function ShowPanel(bool bShow)
{
	local int i;

	super(GUITabPanel).ShowPanel(bShow);
	// End:0x66
	if(!bInitialized)
	{
		i = 0;
		J0x1E:

		// End:0x5B [Loop If]
		if(i < 5)
		{
			SavedLoadouts[0].Weapons[i] = Class'BallisticProV55.Mut_TeamOutfitting'.default.LoadOut[i];
			i++;
			// [Loop Continue]
			goto J0x1E;
		}
		bInitialized = true;
		SaveConfig();
	}
	// End:0x184
	if(!bWeaponsLoaded)
	{
		// End:0xF4
		if((COI == none) || COI.bWeaponsReady)
		{
			// End:0xD2
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
		cb_Primary.List.bSorted = true;
		cb_Secondary.List.bSorted = true;
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

	i = 0;
	J0x07:

	// End:0xC1 [Loop If]
	if(i < COI.GroupLength(0))
	{
		// End:0xB7
		if(GetItemInfo(0, i, ic, IMat, ICN, ICrds))
		{
			Item_Melee.AddItem(ic, IMat, ICN, ICrds);
			Item_Melee.SetItem(SavedLoadouts[CurrentIndex].Weapons[0]);
			cb_Melee.AddItem(ic,, ICN);
			cb_Melee.SetText(QuickListText);
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0xC8:

	// End:0x182 [Loop If]
	if(i < COI.GroupLength(1))
	{
		// End:0x178
		if(GetItemInfo(1, i, ic, IMat, ICN, ICrds))
		{
			Item_SideArm.AddItem(ic, IMat, ICN, ICrds);
			Item_SideArm.SetItem(SavedLoadouts[CurrentIndex].Weapons[1]);
			cb_SideArm.AddItem(ic,, ICN);
			cb_SideArm.SetText(QuickListText);
		}
		i++;
		// [Loop Continue]
		goto J0xC8;
	}
	i = 0;
	J0x189:

	// End:0x245 [Loop If]
	if(i < COI.GroupLength(2))
	{
		// End:0x23B
		if(GetItemInfo(2, i, ic, IMat, ICN, ICrds))
		{
			Item_Primary.AddItem(ic, IMat, ICN, ICrds);
			Item_Primary.SetItem(SavedLoadouts[CurrentIndex].Weapons[2]);
			cb_Primary.AddItem(ic,, ICN);
			cb_Primary.SetText(QuickListText);
		}
		i++;
		// [Loop Continue]
		goto J0x189;
	}
	i = 0;
	J0x24C:

	// End:0x308 [Loop If]
	if(i < COI.GroupLength(3))
	{
		// End:0x2FE
		if(GetItemInfo(3, i, ic, IMat, ICN, ICrds))
		{
			Item_Secondary.AddItem(ic, IMat, ICN, ICrds);
			Item_Secondary.SetItem(SavedLoadouts[CurrentIndex].Weapons[3]);
			cb_Secondary.AddItem(ic,, ICN);
			cb_Secondary.SetText(QuickListText);
		}
		i++;
		// [Loop Continue]
		goto J0x24C;
	}
	i = 0;
	J0x30F:

	// End:0x3CB [Loop If]
	if(i < COI.GroupLength(4))
	{
		// End:0x3C1
		if(GetItemInfo(4, i, ic, IMat, ICN, ICrds))
		{
			Item_Grenade.AddItem(ic, IMat, ICN, ICrds);
			Item_Grenade.SetItem(SavedLoadouts[CurrentIndex].Weapons[4]);
			cb_Grenade.AddItem(ic,, ICN);
			cb_Grenade.SetText(QuickListText);
		}
		i++;
		// [Loop Continue]
		goto J0x30F;
	}
	i = 0;
	J0x3D2:

	// End:0x40F [Loop If]
	if(i < 5)
	{
		cb_Presets.AddItem(SavedLoadouts[i].PresetName,, string(i));
		i++;
		// [Loop Continue]
		goto J0x3D2;
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

function bool InternalOnKeyEvent(out byte Key, out byte State, float Delta)
{
	return false;
	//return;	
}

function bool InternalOnClick(GUIComponent Sender)
{
	// End:0x224
	if(Sender == BSavePreset)
	{
		SavedLoadouts[cb_Presets.GetIndex()].PresetName = cb_Presets.GetText();
		// End:0x9A
		if(Item_Melee.items.Length > Item_Melee.Index)
		{
			SavedLoadouts[cb_Presets.GetIndex()].Weapons[0] = Item_Melee.items[Item_Melee.Index].Text;
		}
		// End:0xFB
		if(Item_SideArm.items.Length > Item_SideArm.Index)
		{
			SavedLoadouts[cb_Presets.GetIndex()].Weapons[1] = Item_SideArm.items[Item_SideArm.Index].Text;
		}
		// End:0x15D
		if(Item_Primary.items.Length > Item_Primary.Index)
		{
			SavedLoadouts[cb_Presets.GetIndex()].Weapons[2] = Item_Primary.items[Item_Primary.Index].Text;
		}
		// End:0x1BF
		if(Item_Secondary.items.Length > Item_Secondary.Index)
		{
			SavedLoadouts[cb_Presets.GetIndex()].Weapons[3] = Item_Secondary.items[Item_Secondary.Index].Text;
		}
		// End:0x221
		if(Item_Grenade.items.Length > Item_Grenade.Index)
		{
			SavedLoadouts[cb_Presets.GetIndex()].Weapons[4] = Item_Grenade.items[Item_Grenade.Index].Text;
		}
		SaveConfig();
	}
	return true;
	//return;	
}

function SaveWeapons()
{
	SavedLoadouts[cb_Presets.GetIndex()].PresetName = cb_Presets.GetText();
	// End:0x8B
	if(Item_Melee.items.Length > Item_Melee.Index)
	{
		SavedLoadouts[cb_Presets.GetIndex()].Weapons[0] = Item_Melee.items[Item_Melee.Index].Text;
	}
	// End:0xEC
	if(Item_SideArm.items.Length > Item_SideArm.Index)
	{
		SavedLoadouts[cb_Presets.GetIndex()].Weapons[1] = Item_SideArm.items[Item_SideArm.Index].Text;
	}
	// End:0x14E
	if(Item_Primary.items.Length > Item_Primary.Index)
	{
		SavedLoadouts[cb_Presets.GetIndex()].Weapons[2] = Item_Primary.items[Item_Primary.Index].Text;
	}
	// End:0x1B0
	if(Item_Secondary.items.Length > Item_Secondary.Index)
	{
		SavedLoadouts[cb_Presets.GetIndex()].Weapons[3] = Item_Secondary.items[Item_Secondary.Index].Text;
	}
	// End:0x212
	if(Item_Grenade.items.Length > Item_Grenade.Index)
	{
		SavedLoadouts[cb_Presets.GetIndex()].Weapons[4] = Item_Grenade.items[Item_Grenade.Index].Text;
	}
	// End:0x267
	if(Item_Melee.items.Length > Item_Melee.Index)
	{
		Class'BallisticProV55.Mut_TeamOutfitting'.default.LoadOut[0] = Item_Melee.items[Item_Melee.Index].Text;
	}
	// End:0x2BC
	if(Item_SideArm.items.Length > Item_SideArm.Index)
	{
		Class'BallisticProV55.Mut_TeamOutfitting'.default.LoadOut[1] = Item_SideArm.items[Item_SideArm.Index].Text;
	}
	// End:0x312
	if(Item_Primary.items.Length > Item_Primary.Index)
	{
		Class'BallisticProV55.Mut_TeamOutfitting'.default.LoadOut[2] = Item_Primary.items[Item_Primary.Index].Text;
	}
	// End:0x368
	if(Item_Secondary.items.Length > Item_Secondary.Index)
	{
		Class'BallisticProV55.Mut_TeamOutfitting'.default.LoadOut[3] = Item_Secondary.items[Item_Secondary.Index].Text;
	}
	// End:0x3BE
	if(Item_Grenade.items.Length > Item_Grenade.Index)
	{
		Class'BallisticProV55.Mut_TeamOutfitting'.default.LoadOut[4] = Item_Grenade.items[Item_Grenade.Index].Text;
	}
	// End:0x3E8
	if(cb_Presets.GetIndex() >= 0)
	{
		CurrentIndex = cb_Presets.GetIndex();
	}
	SaveConfig();
	Class'BallisticProV55.Mut_TeamOutfitting'.static.StaticSaveConfig();
	//return;	
}

function InternalOnChange(GUIComponent Sender)
{
	// End:0x23
	if((COI == none) || !COI.bWeaponsReady)
	{
		return;
	}
	// End:0x53
	if(Sender == cb_Melee)
	{
		Item_Melee.SetItem(cb_Melee.GetExtra());		
	}
	else
	{
		// End:0x83
		if(Sender == cb_SideArm)
		{
			Item_SideArm.SetItem(cb_SideArm.GetExtra());			
		}
		else
		{
			// End:0xB3
			if(Sender == cb_Primary)
			{
				Item_Primary.SetItem(cb_Primary.GetExtra());				
			}
			else
			{
				// End:0xE3
				if(Sender == cb_Secondary)
				{
					Item_Secondary.SetItem(cb_Secondary.GetExtra());					
				}
				else
				{
					// End:0x113
					if(Sender == cb_Grenade)
					{
						Item_Grenade.SetItem(cb_Grenade.GetExtra());						
					}
					else
					{
						// End:0x214
						if((Sender == cb_Presets) && cb_Presets.GetExtra() != "")
						{
							Item_Melee.SetItem(SavedLoadouts[cb_Presets.GetIndex()].Weapons[0]);
							Item_SideArm.SetItem(SavedLoadouts[cb_Presets.GetIndex()].Weapons[1]);
							Item_Primary.SetItem(SavedLoadouts[cb_Presets.GetIndex()].Weapons[2]);
							Item_Secondary.SetItem(SavedLoadouts[cb_Presets.GetIndex()].Weapons[3]);
							Item_Grenade.SetItem(SavedLoadouts[cb_Presets.GetIndex()].Weapons[4]);
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
	// Reference: GUILoadOutItem'BallisticProV55.BallisticTeamOutfittingWeaponsTab.MeleeImage'
	begin object name="MeleeImage" class=BCoreProV55.GUILoadOutItem
		NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
		Caption="Melee Weapon"
		WinTop=0.0500000
		WinLeft=0.1000000
		WinWidth=0.2000000
		WinHeight=0.2000000
		OnRendered=MeleeImage.InternalOnDraw
		OnClick=MeleeImage.InternalOnClick
		OnRightClick=MeleeImage.InternalOnRightClick
	end object
	Item_Melee=MeleeImage
	// Reference: GUILoadOutItem'BallisticProV55.BallisticTeamOutfittingWeaponsTab.SideArmImage'
	begin object name="SideArmImage" class=BCoreProV55.GUILoadOutItem
		NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
		Caption="SideArm"
		WinTop=0.0500000
		WinLeft=0.4000000
		WinWidth=0.2000000
		WinHeight=0.2000000
		OnRendered=SideArmImage.InternalOnDraw
		OnClick=SideArmImage.InternalOnClick
		OnRightClick=SideArmImage.InternalOnRightClick
	end object
	Item_SideArm=SideArmImage
	// Reference: GUILoadOutItem'BallisticProV55.BallisticTeamOutfittingWeaponsTab.PrimaryImage'
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
	// Reference: GUILoadOutItem'BallisticProV55.BallisticTeamOutfittingWeaponsTab.SecondaryImage'
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
	// Reference: GUILoadOutItem'BallisticProV55.BallisticTeamOutfittingWeaponsTab.GrenadeImage'
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
	// Reference: GUIComboBox'BallisticProV55.BallisticTeamOutfittingWeaponsTab.cb_MeleeComBox'
	begin object name="cb_MeleeComBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Quick list of Melee items"
		WinTop=0.2500000
		WinLeft=0.1021480
		WinWidth=0.1960940
		WinHeight=0.0400000
		TabOrder=0
		OnChange=BallisticTeamOutfittingWeaponsTab.InternalOnChange
		OnKeyEvent=cb_MeleeComBox.InternalOnKeyEvent
	end object
	cb_Melee=cb_MeleeComBox
	// Reference: GUIComboBox'BallisticProV55.BallisticTeamOutfittingWeaponsTab.cb_SideArmBox'
	begin object name="cb_SideArmBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Quick list of SideArm items"
		WinTop=0.2500000
		WinLeft=0.4029300
		WinWidth=0.1960940
		WinHeight=0.0400000
		TabOrder=0
		OnChange=BallisticTeamOutfittingWeaponsTab.InternalOnChange
		OnKeyEvent=cb_SideArmBox.InternalOnKeyEvent
	end object
	cb_SideArm=cb_SideArmBox
	// Reference: GUIComboBox'BallisticProV55.BallisticTeamOutfittingWeaponsTab.cb_PrimaryComBox'
	begin object name="cb_PrimaryComBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Quick list of Primary items"
		WinTop=0.5500000
		WinLeft=0.2515630
		WinWidth=0.1960940
		WinHeight=0.0400000
		TabOrder=0
		OnChange=BallisticTeamOutfittingWeaponsTab.InternalOnChange
		OnKeyEvent=cb_PrimaryComBox.InternalOnKeyEvent
	end object
	cb_Primary=cb_PrimaryComBox
	// Reference: GUIComboBox'BallisticProV55.BallisticTeamOutfittingWeaponsTab.cb_SecondaryComBox'
	begin object name="cb_SecondaryComBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Quick list of Secondary items"
		WinTop=0.5500000
		WinLeft=0.5509770
		WinWidth=0.1960940
		WinHeight=0.0400000
		TabOrder=0
		OnChange=BallisticTeamOutfittingWeaponsTab.InternalOnChange
		OnKeyEvent=cb_SecondaryComBox.InternalOnKeyEvent
	end object
	cb_Secondary=cb_SecondaryComBox
	// Reference: GUIComboBox'BallisticProV55.BallisticTeamOutfittingWeaponsTab.cb_GrenadeComBox'
	begin object name="cb_GrenadeComBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Quick list of Grenade Trap and Explosive items"
		WinTop=0.2500000
		WinLeft=0.7021480
		WinWidth=0.1960940
		WinHeight=0.0400000
		TabOrder=0
		OnChange=BallisticTeamOutfittingWeaponsTab.InternalOnChange
		OnKeyEvent=cb_GrenadeComBox.InternalOnKeyEvent
	end object
	cb_Grenade=cb_GrenadeComBox
	// Reference: moComboBox'BallisticProV55.BallisticTeamOutfittingWeaponsTab.co_PresetsCB'
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
		OnChange=BallisticTeamOutfittingWeaponsTab.InternalOnChange
	end object
	cb_Presets=co_PresetsCB
	// Reference: GUIImage'BallisticProV55.BallisticTeamOutfittingWeaponsTab.ImageBoxMelee'
	begin object name="ImageBoxMelee" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.0300000
		WinLeft=0.0875000
		WinWidth=0.2250000
		WinHeight=0.2400000
		RenderWeight=0.0020000
	end object
	Box_Melee=ImageBoxMelee
	// Reference: GUIImage'BallisticProV55.BallisticTeamOutfittingWeaponsTab.ImageBoxSideArm'
	begin object name="ImageBoxSideArm" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.0300000
		WinLeft=0.3875000
		WinWidth=0.2250000
		WinHeight=0.2400000
		RenderWeight=0.0020000
	end object
	Box_SideArm=ImageBoxSideArm
	// Reference: GUIImage'BallisticProV55.BallisticTeamOutfittingWeaponsTab.ImageBoxPrimary'
	begin object name="ImageBoxPrimary" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.3375000
		WinLeft=0.2375000
		WinWidth=0.2250000
		WinHeight=0.2400000
		RenderWeight=0.0020000
	end object
	Box_Primary=ImageBoxPrimary
	// Reference: GUIImage'BallisticProV55.BallisticTeamOutfittingWeaponsTab.ImageBoxSecondary'
	begin object name="ImageBoxSecondary" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.3375000
		WinLeft=0.5375000
		WinWidth=0.2250000
		WinHeight=0.2400000
		RenderWeight=0.0020000
	end object
	Box_Secondary=ImageBoxSecondary
	// Reference: GUIImage'BallisticProV55.BallisticTeamOutfittingWeaponsTab.ImageBoxGrenade'
	begin object name="ImageBoxGrenade" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.0300000
		WinLeft=0.6875000
		WinWidth=0.2250000
		WinHeight=0.2400000
		RenderWeight=0.0020000
	end object
	Box_Grenade=ImageBoxGrenade
	// Reference: GUIImage'BallisticProV55.BallisticTeamOutfittingWeaponsTab.MeleeBackImage'
	begin object name="MeleeBackImage" class=XInterface.GUIImage
		Image=Texture'Engine.MenuBlack'
		ImageStyle=1
		WinTop=0.0500000
		WinLeft=0.1000000
		WinWidth=0.2000000
		WinHeight=0.2400000
		RenderWeight=0.0030000
	end object
	MeleeBack=MeleeBackImage
	// Reference: GUIImage'BallisticProV55.BallisticTeamOutfittingWeaponsTab.SideArmBackImage'
	begin object name="SideArmBackImage" class=XInterface.GUIImage
		Image=Texture'Engine.MenuBlack'
		ImageStyle=1
		WinTop=0.0500000
		WinLeft=0.4000000
		WinWidth=0.2000000
		WinHeight=0.2000000
		RenderWeight=0.0030000
	end object
	SideArmBack=SideArmBackImage
	// Reference: GUIImage'BallisticProV55.BallisticTeamOutfittingWeaponsTab.PrimaryBackImage'
	begin object name="PrimaryBackImage" class=XInterface.GUIImage
		Image=Texture'Engine.MenuBlack'
		ImageStyle=1
		WinTop=0.3500000
		WinLeft=0.2500000
		WinWidth=0.2000000
		WinHeight=0.2000000
		RenderWeight=0.0030000
	end object
	PrimaryBack=PrimaryBackImage
	// Reference: GUIImage'BallisticProV55.BallisticTeamOutfittingWeaponsTab.SecondaryBackImage'
	begin object name="SecondaryBackImage" class=XInterface.GUIImage
		Image=Texture'Engine.MenuBlack'
		ImageStyle=1
		WinTop=0.3500000
		WinLeft=0.5500000
		WinWidth=0.2000000
		WinHeight=0.2000000
		RenderWeight=0.0030000
	end object
	SecondaryBack=SecondaryBackImage
	// Reference: GUIImage'BallisticProV55.BallisticTeamOutfittingWeaponsTab.GrenadeBackImage'
	begin object name="GrenadeBackImage" class=XInterface.GUIImage
		Image=Texture'Engine.MenuBlack'
		ImageStyle=1
		WinTop=0.0500000
		WinLeft=0.7000000
		WinWidth=0.2000000
		WinHeight=0.2000000
		RenderWeight=0.0030000
	end object
	GrenadeBack=GrenadeBackImage
	// Reference: GUIButton'BallisticProV55.BallisticTeamOutfittingWeaponsTab.BSavePresetButton'
	begin object name="BSavePresetButton" class=XInterface.GUIButton
		Caption="SAVE"
		Hint="Saves the current configuration as a new preset."
		WinTop=0.6400000
		WinLeft=0.1155000
		WinWidth=0.2570000
		WinHeight=0.0650000
		TabOrder=0
		OnClick=BallisticTeamOutfittingWeaponsTab.InternalOnClick
		OnKeyEvent=BSavePresetButton.InternalOnKeyEvent
	end object
	BSavePreset=BSavePresetButton
	// Reference: GUILabel'BallisticProV55.BallisticTeamOutfittingWeaponsTab.l_Receivinglabel'
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
	SavedLoadouts[0]=(PresetName="DEFAULT",Weapons="BallisticProV55.A909SkrithBlades",Weapons[1]="BallisticProV55.A42SkrithPistol",Weapons[2]="BallisticProV55.A73SkrithRifle",Weapons[3]="BWBPRecolors3Pro.A49SkrithBlaster",Weapons[4]="BWBPRecolors3Pro.G28Grenade")
	SavedLoadouts[1]=(PresetName="DEFAULT2",Weapons="BallisticProV55.A909SkrithBlades",Weapons[1]="BallisticProV55.A42SkrithPistol",Weapons[2]="BallisticProV55.A73SkrithRifle",Weapons[3]="BWBPRecolors3Pro.A49SkrithBlaster",Weapons[4]="BWBPRecolors3Pro.G28Grenade")
	SavedLoadouts[2]=(PresetName="DEFAULT3",Weapons="BallisticProV55.A909SkrithBlades",Weapons[1]="BallisticProV55.A42SkrithPistol",Weapons[2]="BallisticProV55.A73SkrithRifle",Weapons[3]="BWBPRecolors3Pro.A49SkrithBlaster",Weapons[4]="BWBPRecolors3Pro.G28Grenade")
	SavedLoadouts[3]=(PresetName="DEFAULT4",Weapons="BallisticProV55.A909SkrithBlades",Weapons[1]="BallisticProV55.A42SkrithPistol",Weapons[2]="BallisticProV55.A73SkrithRifle",Weapons[3]="BWBPRecolors3Pro.A49SkrithBlaster",Weapons[4]="BWBPRecolors3Pro.G28Grenade")
	SavedLoadouts[4]=(PresetName="DEFAULT5",Weapons="BallisticProV55.A909SkrithBlades",Weapons[1]="BallisticProV55.A42SkrithPistol",Weapons[2]="BallisticProV55.A73SkrithRifle",Weapons[3]="BWBPRecolors3Pro.A49SkrithBlaster",Weapons[4]="BWBPRecolors3Pro.G28Grenade")
	QuickListText="QuickList"
	ReceivingText[0]="Receiving..."
	ReceivingText[1]="Loading..."
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: GUILoadOutItem'BallisticProV55.BallisticTeamOutfittingWeaponsTab.MeleeImage'
begin object name="MeleeImage" class=BCoreProV55.GUILoadOutItem
	NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
	Caption="Melee Weapon"
	WinTop=0.0500000
	WinLeft=0.1000000
	WinWidth=0.2000000
	WinHeight=0.2000000
	OnRendered=MeleeImage.InternalOnDraw
	OnClick=MeleeImage.InternalOnClick
	OnRightClick=MeleeImage.InternalOnRightClick
end object
// Reference: GUILoadOutItem'BallisticProV55.BallisticTeamOutfittingWeaponsTab.SideArmImage'
begin object name="SideArmImage" class=BCoreProV55.GUILoadOutItem
	NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
	Caption="SideArm"
	WinTop=0.0500000
	WinLeft=0.4000000
	WinWidth=0.2000000
	WinHeight=0.2000000
	OnRendered=SideArmImage.InternalOnDraw
	OnClick=SideArmImage.InternalOnClick
	OnRightClick=SideArmImage.InternalOnRightClick
end object
// Reference: GUILoadOutItem'BallisticProV55.BallisticTeamOutfittingWeaponsTab.PrimaryImage'
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
// Reference: GUILoadOutItem'BallisticProV55.BallisticTeamOutfittingWeaponsTab.SecondaryImage'
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
// Reference: GUILoadOutItem'BallisticProV55.BallisticTeamOutfittingWeaponsTab.GrenadeImage'
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
// Reference: GUIButton'BallisticProV55.BallisticTeamOutfittingWeaponsTab.BSavePresetButton'
begin object name="BSavePresetButton" class=XInterface.GUIButton
	Caption="SAVE"
	Hint="Saves the current configuration as a new preset."
	WinTop=0.6400000
	WinLeft=0.1155000
	WinWidth=0.2570000
	WinHeight=0.0650000
	TabOrder=0
	OnClick=BallisticTeamOutfittingWeaponsTab.InternalOnClick
	OnKeyEvent=BSavePresetButton.InternalOnKeyEvent
end object
// Reference: moComboBox'BallisticProV55.BallisticTeamOutfittingWeaponsTab.co_PresetsCB'
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
	OnChange=BallisticTeamOutfittingWeaponsTab.InternalOnChange
end object
// Reference: GUIComboBox'BallisticProV55.BallisticTeamOutfittingWeaponsTab.cb_GrenadeComBox'
begin object name="cb_GrenadeComBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Quick list of Grenade Trap and Explosive items"
	WinTop=0.2500000
	WinLeft=0.7021480
	WinWidth=0.1960940
	WinHeight=0.0400000
	TabOrder=0
	OnChange=BallisticTeamOutfittingWeaponsTab.InternalOnChange
	OnKeyEvent=cb_GrenadeComBox.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticTeamOutfittingWeaponsTab.cb_SecondaryComBox'
begin object name="cb_SecondaryComBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Quick list of Secondary items"
	WinTop=0.5500000
	WinLeft=0.5509770
	WinWidth=0.1960940
	WinHeight=0.0400000
	TabOrder=0
	OnChange=BallisticTeamOutfittingWeaponsTab.InternalOnChange
	OnKeyEvent=cb_SecondaryComBox.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticTeamOutfittingWeaponsTab.cb_PrimaryComBox'
begin object name="cb_PrimaryComBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Quick list of Primary items"
	WinTop=0.5500000
	WinLeft=0.2515630
	WinWidth=0.1960940
	WinHeight=0.0400000
	TabOrder=0
	OnChange=BallisticTeamOutfittingWeaponsTab.InternalOnChange
	OnKeyEvent=cb_PrimaryComBox.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticTeamOutfittingWeaponsTab.cb_SideArmBox'
begin object name="cb_SideArmBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Quick list of SideArm items"
	WinTop=0.2500000
	WinLeft=0.4029300
	WinWidth=0.1960940
	WinHeight=0.0400000
	TabOrder=0
	OnChange=BallisticTeamOutfittingWeaponsTab.InternalOnChange
	OnKeyEvent=cb_SideArmBox.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticTeamOutfittingWeaponsTab.cb_MeleeComBox'
begin object name="cb_MeleeComBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Quick list of Melee items"
	WinTop=0.2500000
	WinLeft=0.1021480
	WinWidth=0.1960940
	WinHeight=0.0400000
	TabOrder=0
	OnChange=BallisticTeamOutfittingWeaponsTab.InternalOnChange
	OnKeyEvent=cb_MeleeComBox.InternalOnKeyEvent
end object
// Reference: GUIImage'BallisticProV55.BallisticTeamOutfittingWeaponsTab.ImageBoxMelee'
begin object name="ImageBoxMelee" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.0300000
	WinLeft=0.0875000
	WinWidth=0.2250000
	WinHeight=0.2400000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticTeamOutfittingWeaponsTab.ImageBoxSideArm'
begin object name="ImageBoxSideArm" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.0300000
	WinLeft=0.3875000
	WinWidth=0.2250000
	WinHeight=0.2400000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticTeamOutfittingWeaponsTab.ImageBoxPrimary'
begin object name="ImageBoxPrimary" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.3375000
	WinLeft=0.2375000
	WinWidth=0.2250000
	WinHeight=0.2400000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticTeamOutfittingWeaponsTab.ImageBoxSecondary'
begin object name="ImageBoxSecondary" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.3375000
	WinLeft=0.5375000
	WinWidth=0.2250000
	WinHeight=0.2400000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticTeamOutfittingWeaponsTab.ImageBoxGrenade'
begin object name="ImageBoxGrenade" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.0300000
	WinLeft=0.6875000
	WinWidth=0.2250000
	WinHeight=0.2400000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticTeamOutfittingWeaponsTab.MeleeBackImage'
begin object name="MeleeBackImage" class=XInterface.GUIImage
	Image=Texture'Engine.MenuBlack'
	ImageStyle=1
	WinTop=0.0500000
	WinLeft=0.1000000
	WinWidth=0.2000000
	WinHeight=0.2400000
	RenderWeight=0.0030000
end object
// Reference: GUIImage'BallisticProV55.BallisticTeamOutfittingWeaponsTab.SideArmBackImage'
begin object name="SideArmBackImage" class=XInterface.GUIImage
	Image=Texture'Engine.MenuBlack'
	ImageStyle=1
	WinTop=0.0500000
	WinLeft=0.4000000
	WinWidth=0.2000000
	WinHeight=0.2000000
	RenderWeight=0.0030000
end object
// Reference: GUIImage'BallisticProV55.BallisticTeamOutfittingWeaponsTab.PrimaryBackImage'
begin object name="PrimaryBackImage" class=XInterface.GUIImage
	Image=Texture'Engine.MenuBlack'
	ImageStyle=1
	WinTop=0.3500000
	WinLeft=0.2500000
	WinWidth=0.2000000
	WinHeight=0.2000000
	RenderWeight=0.0030000
end object
// Reference: GUIImage'BallisticProV55.BallisticTeamOutfittingWeaponsTab.SecondaryBackImage'
begin object name="SecondaryBackImage" class=XInterface.GUIImage
	Image=Texture'Engine.MenuBlack'
	ImageStyle=1
	WinTop=0.3500000
	WinLeft=0.5500000
	WinWidth=0.2000000
	WinHeight=0.2000000
	RenderWeight=0.0030000
end object
// Reference: GUIImage'BallisticProV55.BallisticTeamOutfittingWeaponsTab.GrenadeBackImage'
begin object name="GrenadeBackImage" class=XInterface.GUIImage
	Image=Texture'Engine.MenuBlack'
	ImageStyle=1
	WinTop=0.0500000
	WinLeft=0.7000000
	WinWidth=0.2000000
	WinHeight=0.2000000
	RenderWeight=0.0030000
end object
// Reference: GUILabel'BallisticProV55.BallisticTeamOutfittingWeaponsTab.l_Receivinglabel'
begin object name="l_Receivinglabel" class=XInterface.GUILabel
	TextAlign=1
	TextColor=(R=255,G=255,B=0,A=255)
	FontScale=2
	WinTop=0.0870000
	WinLeft=0.0500000
	WinWidth=0.9000000
	WinHeight=0.0400000
end object
