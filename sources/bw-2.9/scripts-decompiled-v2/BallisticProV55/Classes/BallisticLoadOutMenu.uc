class BallisticLoadOutMenu extends UT2K4GUIPage
	editinlinenew
	instanced;

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
var() automated GUIImage MyBack;
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
var() automated GUIButton bStats;
var() automated GUIHeader MyHeader;
var() automated GUILabel l_Receiving;
var() automated GUILabel l_StatTime;
var() automated GUILabel l_StatFrags;
var() automated GUILabel l_StatEfficiency;
var() automated GUILabel l_StatDamageRate;
var() automated GUILabel l_StatSniperEff;
var() automated GUILabel l_StatShotgunEff;
var() automated GUILabel l_StatHazardEff;
var() automated GUILabel l_StatHeading;
var() localized string QuickListText;
var localized string ReceivingText[2];
var() localized string StatTimeCaption;
var() localized string StatFragsCaption;
var() localized string StatEffCaption;
var() localized string StatDmgRtCaption;
var() localized string StatSnprEffCaption;
var() localized string StatStgnEffCaption;
var() localized string StatHzrdEffCaption;
var ClientLoadoutInterface COI;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	super(GUIPage).InitComponent(MyController, MyOwner);
	// End:0x95
	if((COI == none) || !COI.bWeaponsReady)
	{
		// End:0x73
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
	}
	cb_Melee.List.bSorted = true;
	cb_SideArm.List.bSorted = true;
	cb_Primary.List.bSorted = true;
	cb_Secondary.List.bSorted = true;
	cb_Grenade.List.bSorted = true;
	//return;	
}

event Timer()
{
	// End:0x28
	if((COI != none) && COI.bWeaponsReady)
	{
		KillTimer();
		LoadWeapons();
	}
	//return;	
}

function bool ValidItem(int Index, PlayerReplicationInfo PRI)
{
	// End:0x35
	if(float(COI.ElapsedTime) < COI.GetItem(Index).Requirements.MatchTime)
	{
		return false;
	}
	// End:0x68
	if(PRI.Score < COI.GetItem(Index).Requirements.Frags)
	{
		return false;
	}
	// End:0xBB
	if(PRI.Deaths == float(0))
	{
		// End:0xB8
		if((PRI.Score / 0.1000000) < COI.GetItem(Index).Requirements.Efficiency)
		{
			return false;
		}		
	}
	else
	{
		// End:0xFE
		if((PRI.Score / PRI.Deaths) < COI.GetItem(Index).Requirements.Efficiency)
		{
			return false;
		}
	}
	// End:0x136
	if(COI.MyLoadoutInfo.SniperEff < COI.GetItem(Index).Requirements.SniperEff)
	{
		return false;
	}
	// End:0x16E
	if(COI.MyLoadoutInfo.ShotgunEff < COI.GetItem(Index).Requirements.ShotgunEff)
	{
		return false;
	}
	// End:0x1A6
	if(COI.MyLoadoutInfo.HazardEff < COI.GetItem(Index).Requirements.HazardEff)
	{
		return false;
	}
	// End:0x1DE
	if(COI.MyLoadoutInfo.DamageRate < COI.GetItem(Index).Requirements.DamageRate)
	{
		return false;
	}
	return true;
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

	// End:0x24A [Loop If]
	if(i < COI.GetItemsLength())
	{
		// End:0x240
		if(ValidItem(i, PlayerOwner().PlayerReplicationInfo))
		{
			// End:0x61
			if(!GetItemInfo(i, ic, IMat, ICN, ICrds))
			{
				// [Explicit Continue]
				goto J0x240;
			}
			// End:0xC0
			if((COI.GetItem(i).Groups & 1) > 0)
			{
				Item_Melee.AddItem(ic, IMat, ICN, ICrds);
				cb_Melee.AddItem(ic,, ICN);
			}
			// End:0x120
			if((COI.GetItem(i).Groups & 2) > 0)
			{
				Item_SideArm.AddItem(ic, IMat, ICN, ICrds);
				cb_SideArm.AddItem(ic,, ICN);
			}
			// End:0x180
			if((COI.GetItem(i).Groups & 4) > 0)
			{
				Item_Primary.AddItem(ic, IMat, ICN, ICrds);
				cb_Primary.AddItem(ic,, ICN);
			}
			// End:0x1E0
			if((COI.GetItem(i).Groups & 8) > 0)
			{
				Item_Secondary.AddItem(ic, IMat, ICN, ICrds);
				cb_Secondary.AddItem(ic,, ICN);
			}
			// End:0x240
			if((COI.GetItem(i).Groups & 16) > 0)
			{
				Item_Grenade.AddItem(ic, IMat, ICN, ICrds);
				cb_Grenade.AddItem(ic,, ICN);
			}
		}
		J0x240:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	Item_Melee.SetItem(Class'BallisticProV55.Mut_Loadout'.default.LoadOut[0]);
	cb_Melee.SetText(QuickListText);
	Item_SideArm.SetItem(Class'BallisticProV55.Mut_Loadout'.default.LoadOut[1]);
	cb_SideArm.SetText(QuickListText);
	Item_Primary.SetItem(Class'BallisticProV55.Mut_Loadout'.default.LoadOut[2]);
	cb_Primary.SetText(QuickListText);
	Item_Secondary.SetItem(Class'BallisticProV55.Mut_Loadout'.default.LoadOut[3]);
	cb_Secondary.SetText(QuickListText);
	Item_Grenade.SetItem(Class'BallisticProV55.Mut_Loadout'.default.LoadOut[4]);
	cb_Grenade.SetText(QuickListText);
	Class'BCoreProV55.BC_WeaponInfoCache'.static.EndSession();
	l_Receiving.Caption = "";
	l_StatTime.Caption = StatTimeCaption $ string(COI.ElapsedTime);
	l_StatFrags.Caption = StatFragsCaption $ string(int(PlayerOwner().PlayerReplicationInfo.Score));
	// End:0x415
	if(PlayerOwner().PlayerReplicationInfo.Deaths == float(0))
	{
		l_StatEfficiency.Caption = StatEffCaption $ string(PlayerOwner().PlayerReplicationInfo.Score / 0.1000000);		
	}
	else
	{
		l_StatEfficiency.Caption = StatEffCaption $ string(PlayerOwner().PlayerReplicationInfo.Score / PlayerOwner().PlayerReplicationInfo.Deaths);
	}
	l_StatSniperEff.Caption = StatSnprEffCaption $ string(COI.MyLoadoutInfo.SniperEff);
	l_StatShotgunEff.Caption = StatStgnEffCaption $ string(COI.MyLoadoutInfo.ShotgunEff);
	l_StatHazardEff.Caption = StatHzrdEffCaption $ string(COI.MyLoadoutInfo.HazardEff);
	l_StatDamageRate.Caption = StatDmgRtCaption $ string(COI.MyLoadoutInfo.DamageRate);
	//return;	
}

function bool GetItemInfo(int Index, out string ItemCap, out Material ItemImage, out string ItemClassName, optional out IntBox ImageCoords)
{
	local WeaponInfo WI;
	local int i;
	local string ItemCName;

	ItemCName = COI.GetItem(Index).ItemName;
	// End:0x2D
	if(ItemCName == "")
	{
		return false;
	}
	WI = Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(ItemCName, i);
	// End:0x8D
	if(i == -1)
	{
		Log("Error loading item for loadout: " $ ItemCName, 'Warning');
		return false;
	}
	ItemCap = WI.ItemName;
	ItemClassName = ItemCName;
	// End:0x109
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
	// End:0x21
	if(Sender == bCancel)
	{
		Controller.CloseMenu();		
	}
	else
	{
		// End:0xA3
		if(Sender == bStats)
		{
			Controller.OpenMenu("BallisticProV55.BallisticLoadoutInfoMenu");
			// End:0xA0
			if(BallisticLoadoutInfoMenu(Controller.ActivePage) != none)
			{
				BallisticLoadoutInfoMenu(Controller.ActivePage).LoadWeapons(self);
			}			
		}
		else
		{
			// End:0x299
			if(Sender == bDone)
			{
				// End:0x107
				if(Item_Melee.items.Length > Item_Melee.Index)
				{
					Class'BallisticProV55.Mut_Loadout'.default.LoadOut[0] = Item_Melee.items[Item_Melee.Index].Text;
				}
				// End:0x15C
				if(Item_SideArm.items.Length > Item_SideArm.Index)
				{
					Class'BallisticProV55.Mut_Loadout'.default.LoadOut[1] = Item_SideArm.items[Item_SideArm.Index].Text;
				}
				// End:0x1B2
				if(Item_Primary.items.Length > Item_Primary.Index)
				{
					Class'BallisticProV55.Mut_Loadout'.default.LoadOut[2] = Item_Primary.items[Item_Primary.Index].Text;
				}
				// End:0x208
				if(Item_Secondary.items.Length > Item_Secondary.Index)
				{
					Class'BallisticProV55.Mut_Loadout'.default.LoadOut[3] = Item_Secondary.items[Item_Secondary.Index].Text;
				}
				// End:0x25E
				if(Item_Grenade.items.Length > Item_Grenade.Index)
				{
					Class'BallisticProV55.Mut_Loadout'.default.LoadOut[4] = Item_Grenade.items[Item_Grenade.Index].Text;
				}
				Class'BallisticProV55.Mut_Loadout'.static.StaticSaveConfig();
				COI.LoadoutChanged(Class'BallisticProV55.Mut_Loadout'.default.LoadOut);
				Controller.CloseMenu();
			}
		}
	}
	return true;
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
					// End:0x110
					if(Sender == cb_Grenade)
					{
						Item_Grenade.SetItem(cb_Grenade.GetExtra());
					}
				}
			}
		}
	}
	//return;	
}

defaultproperties
{
	// Reference: GUILoadOutItem'BallisticProV55.BallisticLoadOutMenu.MeleeImage'
	begin object name="MeleeImage" class=BCoreProV55.GUILoadOutItem
		NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
		Caption="Melee Weapon"
		WinTop=0.3000000
		WinLeft=0.1000000
		WinWidth=0.2000000
		WinHeight=0.1333330
		OnRendered=MeleeImage.InternalOnDraw
		OnClick=MeleeImage.InternalOnClick
		OnRightClick=MeleeImage.InternalOnRightClick
	end object
	Item_Melee=MeleeImage
	// Reference: GUILoadOutItem'BallisticProV55.BallisticLoadOutMenu.SideArmImage'
	begin object name="SideArmImage" class=BCoreProV55.GUILoadOutItem
		NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
		Caption="SideArm"
		WinTop=0.3000000
		WinLeft=0.4000000
		WinWidth=0.2000000
		WinHeight=0.1333330
		OnRendered=SideArmImage.InternalOnDraw
		OnClick=SideArmImage.InternalOnClick
		OnRightClick=SideArmImage.InternalOnRightClick
	end object
	Item_SideArm=SideArmImage
	// Reference: GUILoadOutItem'BallisticProV55.BallisticLoadOutMenu.PrimaryImage'
	begin object name="PrimaryImage" class=BCoreProV55.GUILoadOutItem
		NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
		Caption="Primary Weapon"
		WinTop=0.5000000
		WinLeft=0.1000000
		WinWidth=0.2000000
		WinHeight=0.1333330
		OnRendered=PrimaryImage.InternalOnDraw
		OnClick=PrimaryImage.InternalOnClick
		OnRightClick=PrimaryImage.InternalOnRightClick
	end object
	Item_Primary=PrimaryImage
	// Reference: GUILoadOutItem'BallisticProV55.BallisticLoadOutMenu.SecondaryImage'
	begin object name="SecondaryImage" class=BCoreProV55.GUILoadOutItem
		NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
		Caption="Secondary Weapon"
		WinTop=0.5000000
		WinLeft=0.4000000
		WinWidth=0.2000000
		WinHeight=0.1333330
		OnRendered=SecondaryImage.InternalOnDraw
		OnClick=SecondaryImage.InternalOnClick
		OnRightClick=SecondaryImage.InternalOnRightClick
	end object
	Item_Secondary=SecondaryImage
	// Reference: GUILoadOutItem'BallisticProV55.BallisticLoadOutMenu.GrenadeImage'
	begin object name="GrenadeImage" class=BCoreProV55.GUILoadOutItem
		NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
		Caption="Grenades"
		WinTop=0.3000000
		WinLeft=0.7000000
		WinWidth=0.2000000
		WinHeight=0.1333330
		OnRendered=GrenadeImage.InternalOnDraw
		OnClick=GrenadeImage.InternalOnClick
		OnRightClick=GrenadeImage.InternalOnRightClick
	end object
	Item_Grenade=GrenadeImage
	// Reference: GUIComboBox'BallisticProV55.BallisticLoadOutMenu.cb_MeleeComBox'
	begin object name="cb_MeleeComBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Quick list of Melee items"
		WinTop=0.4314770
		WinLeft=0.1021480
		WinWidth=0.1960940
		WinHeight=0.0266810
		TabOrder=0
		OnChange=BallisticLoadOutMenu.InternalOnChange
		OnKeyEvent=cb_MeleeComBox.InternalOnKeyEvent
	end object
	cb_Melee=cb_MeleeComBox
	// Reference: GUIComboBox'BallisticProV55.BallisticLoadOutMenu.cb_SideArmBox'
	begin object name="cb_SideArmBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Quick list of SideArm items"
		WinTop=0.4314770
		WinLeft=0.4029300
		WinWidth=0.1960940
		WinHeight=0.0266810
		TabOrder=0
		OnChange=BallisticLoadOutMenu.InternalOnChange
		OnKeyEvent=cb_SideArmBox.InternalOnKeyEvent
	end object
	cb_SideArm=cb_SideArmBox
	// Reference: GUIComboBox'BallisticProV55.BallisticLoadOutMenu.cb_PrimaryComBox'
	begin object name="cb_PrimaryComBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Quick list of Primary items"
		WinTop=0.6319960
		WinLeft=0.1021480
		WinWidth=0.1960940
		WinHeight=0.0266810
		TabOrder=0
		OnChange=BallisticLoadOutMenu.InternalOnChange
		OnKeyEvent=cb_PrimaryComBox.InternalOnKeyEvent
	end object
	cb_Primary=cb_PrimaryComBox
	// Reference: GUIComboBox'BallisticProV55.BallisticLoadOutMenu.cb_SecondaryComBox'
	begin object name="cb_SecondaryComBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Quick list of Secondary items"
		WinTop=0.6319960
		WinLeft=0.4029300
		WinWidth=0.1960940
		WinHeight=0.0266810
		TabOrder=0
		OnChange=BallisticLoadOutMenu.InternalOnChange
		OnKeyEvent=cb_SecondaryComBox.InternalOnKeyEvent
	end object
	cb_Secondary=cb_SecondaryComBox
	// Reference: GUIComboBox'BallisticProV55.BallisticLoadOutMenu.cb_GrenadeComBox'
	begin object name="cb_GrenadeComBox" class=XInterface.GUIComboBox
		MaxVisibleItems=16
		Hint="Quick list of Grenade Trap and Explosive items"
		WinTop=0.4314770
		WinLeft=0.7021480
		WinWidth=0.1960940
		WinHeight=0.0266810
		TabOrder=0
		OnChange=BallisticLoadOutMenu.InternalOnChange
		OnKeyEvent=cb_GrenadeComBox.InternalOnKeyEvent
	end object
	cb_Grenade=cb_GrenadeComBox
	// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.BackImage'
	begin object name="BackImage" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display95'
		ImageStyle=1
		WinTop=0.2000000
		WinLeft=0.0500000
		WinWidth=0.9000000
		WinHeight=0.6000000
		RenderWeight=0.0010000
	end object
	MyBack=BackImage
	// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.ImageBoxMelee'
	begin object name="ImageBoxMelee" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.2875000
		WinLeft=0.0875000
		WinWidth=0.2250000
		WinHeight=0.1583330
		RenderWeight=0.0020000
	end object
	Box_Melee=ImageBoxMelee
	// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.ImageBoxSideArm'
	begin object name="ImageBoxSideArm" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.2875000
		WinLeft=0.3875000
		WinWidth=0.2250000
		WinHeight=0.1583330
		RenderWeight=0.0020000
	end object
	Box_SideArm=ImageBoxSideArm
	// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.ImageBoxPrimary'
	begin object name="ImageBoxPrimary" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.4875000
		WinLeft=0.0875000
		WinWidth=0.2250000
		WinHeight=0.1583330
		RenderWeight=0.0020000
	end object
	Box_Primary=ImageBoxPrimary
	// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.ImageBoxSecondary'
	begin object name="ImageBoxSecondary" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.4875000
		WinLeft=0.3875000
		WinWidth=0.2250000
		WinHeight=0.1583330
		RenderWeight=0.0020000
	end object
	Box_Secondary=ImageBoxSecondary
	// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.ImageBoxGrenade'
	begin object name="ImageBoxGrenade" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.2875000
		WinLeft=0.6875000
		WinWidth=0.2250000
		WinHeight=0.1583330
		RenderWeight=0.0020000
	end object
	Box_Grenade=ImageBoxGrenade
	// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.MeleeBackImage'
	begin object name="MeleeBackImage" class=XInterface.GUIImage
		Image=Texture'Engine.MenuBlack'
		ImageStyle=1
		WinTop=0.3000000
		WinLeft=0.1000000
		WinWidth=0.2000000
		WinHeight=0.1333330
		RenderWeight=0.0030000
	end object
	MeleeBack=MeleeBackImage
	// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.SideArmBackImage'
	begin object name="SideArmBackImage" class=XInterface.GUIImage
		Image=Texture'Engine.MenuBlack'
		ImageStyle=1
		WinTop=0.3000000
		WinLeft=0.4000000
		WinWidth=0.2000000
		WinHeight=0.1333330
		RenderWeight=0.0030000
	end object
	SideArmBack=SideArmBackImage
	// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.PrimaryBackImage'
	begin object name="PrimaryBackImage" class=XInterface.GUIImage
		Image=Texture'Engine.MenuBlack'
		ImageStyle=1
		WinTop=0.5000000
		WinLeft=0.1000000
		WinWidth=0.2000000
		WinHeight=0.1333330
		RenderWeight=0.0030000
	end object
	PrimaryBack=PrimaryBackImage
	// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.SecondaryBackImage'
	begin object name="SecondaryBackImage" class=XInterface.GUIImage
		Image=Texture'Engine.MenuBlack'
		ImageStyle=1
		WinTop=0.5000000
		WinLeft=0.4000000
		WinWidth=0.2000000
		WinHeight=0.1333330
		RenderWeight=0.0030000
	end object
	SecondaryBack=SecondaryBackImage
	// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.GrenadeBackImage'
	begin object name="GrenadeBackImage" class=XInterface.GUIImage
		Image=Texture'Engine.MenuBlack'
		ImageStyle=1
		WinTop=0.3000000
		WinLeft=0.7000000
		WinWidth=0.2000000
		WinHeight=0.1333330
		RenderWeight=0.0030000
	end object
	GrenadeBack=GrenadeBackImage
	// Reference: GUIButton'BallisticProV55.BallisticLoadOutMenu.DoneButton'
	begin object name="DoneButton" class=XInterface.GUIButton
		Caption="DONE"
		WinTop=0.7000000
		WinLeft=0.1000000
		WinWidth=0.2000000
		TabOrder=0
		OnClick=BallisticLoadOutMenu.InternalOnClick
		OnKeyEvent=DoneButton.InternalOnKeyEvent
	end object
	bDone=DoneButton
	// Reference: GUIButton'BallisticProV55.BallisticLoadOutMenu.CancelButton'
	begin object name="CancelButton" class=XInterface.GUIButton
		Caption="CANCEL"
		WinTop=0.7000000
		WinLeft=0.7000000
		WinWidth=0.2000000
		TabOrder=1
		OnClick=BallisticLoadOutMenu.InternalOnClick
		OnKeyEvent=CancelButton.InternalOnKeyEvent
	end object
	bCancel=CancelButton
	// Reference: GUIButton'BallisticProV55.BallisticLoadOutMenu.BStatButton'
	begin object name="BStatButton" class=XInterface.GUIButton
		Caption="Stats"
		WinTop=0.7000000
		WinLeft=0.4000000
		WinWidth=0.2000000
		TabOrder=1
		OnClick=BallisticLoadOutMenu.InternalOnClick
		OnKeyEvent=CancelButton.InternalOnKeyEvent
	end object
	bStats=BStatButton
	// Reference: GUIHeader'BallisticProV55.BallisticLoadOutMenu.DaBeegHeader'
	begin object name="DaBeegHeader" class=XInterface.GUIHeader
		bUseTextHeight=true
		Caption="Select your equipment"
		WinTop=0.2000000
		WinLeft=0.0500000
		WinWidth=0.9000000
		WinHeight=0.7000000
	end object
	MyHeader=DaBeegHeader
	// Reference: GUILabel'BallisticProV55.BallisticLoadOutMenu.l_Receivinglabel'
	begin object name="l_Receivinglabel" class=XInterface.GUILabel
		TextAlign=1
		TextColor=(R=255,G=255,B=0,A=255)
		FontScale=2
		WinTop=0.2370000
		WinLeft=0.0500000
		WinWidth=0.9000000
		WinHeight=0.0400000
	end object
	l_Receiving=l_Receivinglabel
	// Reference: GUILabel'BallisticProV55.BallisticLoadOutMenu.l_StatTimeLabel'
	begin object name="l_StatTimeLabel" class=XInterface.GUILabel
		Caption="Time"
		TextColor=(R=0,G=255,B=0,A=255)
		FontScale=0
		WinTop=0.4800000
		WinLeft=0.6500000
		WinWidth=0.3000000
		WinHeight=0.0400000
	end object
	l_StatTime=l_StatTimeLabel
	// Reference: GUILabel'BallisticProV55.BallisticLoadOutMenu.l_StatFragsLabel'
	begin object name="l_StatFragsLabel" class=XInterface.GUILabel
		Caption="Frags"
		TextColor=(R=0,G=255,B=0,A=255)
		FontScale=0
		WinTop=0.5100000
		WinLeft=0.6500000
		WinWidth=0.3000000
		WinHeight=0.0400000
	end object
	l_StatFrags=l_StatFragsLabel
	// Reference: GUILabel'BallisticProV55.BallisticLoadOutMenu.l_StatEfficiencyLabel'
	begin object name="l_StatEfficiencyLabel" class=XInterface.GUILabel
		Caption="Efficiency"
		TextColor=(R=0,G=255,B=0,A=255)
		FontScale=0
		WinTop=0.5400000
		WinLeft=0.6500000
		WinWidth=0.3000000
		WinHeight=0.0400000
	end object
	l_StatEfficiency=l_StatEfficiencyLabel
	// Reference: GUILabel'BallisticProV55.BallisticLoadOutMenu.l_StatDamageRateLabel'
	begin object name="l_StatDamageRateLabel" class=XInterface.GUILabel
		Caption="DamageRate"
		TextColor=(R=0,G=255,B=0,A=255)
		FontScale=0
		WinTop=0.5700000
		WinLeft=0.6500000
		WinWidth=0.3000000
		WinHeight=0.0400000
	end object
	l_StatDamageRate=l_StatDamageRateLabel
	// Reference: GUILabel'BallisticProV55.BallisticLoadOutMenu.l_StatSniperEffLabel'
	begin object name="l_StatSniperEffLabel" class=XInterface.GUILabel
		Caption="Sniper Efficiency"
		TextColor=(R=0,G=255,B=0,A=255)
		FontScale=0
		WinTop=0.6000000
		WinLeft=0.6500000
		WinWidth=0.3000000
		WinHeight=0.0400000
	end object
	l_StatSniperEff=l_StatSniperEffLabel
	// Reference: GUILabel'BallisticProV55.BallisticLoadOutMenu.l_StatShotgunEffLabel'
	begin object name="l_StatShotgunEffLabel" class=XInterface.GUILabel
		Caption="Shotgun Efficiency"
		TextColor=(R=0,G=255,B=0,A=255)
		FontScale=0
		WinTop=0.6300000
		WinLeft=0.6500000
		WinWidth=0.3000000
		WinHeight=0.0400000
	end object
	l_StatShotgunEff=l_StatShotgunEffLabel
	// Reference: GUILabel'BallisticProV55.BallisticLoadOutMenu.l_StatHazardEffLabel'
	begin object name="l_StatHazardEffLabel" class=XInterface.GUILabel
		Caption="Hazard Efficiency"
		TextColor=(R=0,G=255,B=0,A=255)
		FontScale=0
		WinTop=0.6600000
		WinLeft=0.6500000
		WinWidth=0.3000000
		WinHeight=0.0400000
	end object
	l_StatHazardEff=l_StatHazardEffLabel
	// Reference: GUILabel'BallisticProV55.BallisticLoadOutMenu.l_StatHeadingLabel'
	begin object name="l_StatHeadingLabel" class=XInterface.GUILabel
		Caption="Your Stats"
		TextAlign=1
		TextColor=(R=255,G=255,B=0,A=255)
		FontScale=0
		WinTop=0.4550000
		WinLeft=0.7000000
		WinWidth=0.2000000
		WinHeight=0.0400000
	end object
	l_StatHeading=l_StatHeadingLabel
	QuickListText="QuickList"
	ReceivingText[0]="Receiving..."
	ReceivingText[1]="Loading..."
	StatTimeCaption="Time: "
	StatFragsCaption="Frags: "
	StatEffCaption="Efficiency: "
	StatDmgRtCaption="DamageRate: "
	StatSnprEffCaption="Sniper Efficiency: "
	StatStgnEffCaption="Shotgun Efficiency: "
	StatHzrdEffCaption="Hazard Efficiency: "
	bRenderWorld=true
	bAllowedAsLast=true
	OnClose=BallisticLoadOutMenu.InternalOnClose
	OnKeyEvent=BallisticLoadOutMenu.InternalOnKeyEvent
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: GUILoadOutItem'BallisticProV55.BallisticLoadOutMenu.MeleeImage'
begin object name="MeleeImage" class=BCoreProV55.GUILoadOutItem
	NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
	Caption="Melee Weapon"
	WinTop=0.3000000
	WinLeft=0.1000000
	WinWidth=0.2000000
	WinHeight=0.1333330
	OnRendered=MeleeImage.InternalOnDraw
	OnClick=MeleeImage.InternalOnClick
	OnRightClick=MeleeImage.InternalOnRightClick
end object
// Reference: GUILoadOutItem'BallisticProV55.BallisticLoadOutMenu.SideArmImage'
begin object name="SideArmImage" class=BCoreProV55.GUILoadOutItem
	NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
	Caption="SideArm"
	WinTop=0.3000000
	WinLeft=0.4000000
	WinWidth=0.2000000
	WinHeight=0.1333330
	OnRendered=SideArmImage.InternalOnDraw
	OnClick=SideArmImage.InternalOnClick
	OnRightClick=SideArmImage.InternalOnRightClick
end object
// Reference: GUILoadOutItem'BallisticProV55.BallisticLoadOutMenu.PrimaryImage'
begin object name="PrimaryImage" class=BCoreProV55.GUILoadOutItem
	NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
	Caption="Primary Weapon"
	WinTop=0.5000000
	WinLeft=0.1000000
	WinWidth=0.2000000
	WinHeight=0.1333330
	OnRendered=PrimaryImage.InternalOnDraw
	OnClick=PrimaryImage.InternalOnClick
	OnRightClick=PrimaryImage.InternalOnRightClick
end object
// Reference: GUILoadOutItem'BallisticProV55.BallisticLoadOutMenu.SecondaryImage'
begin object name="SecondaryImage" class=BCoreProV55.GUILoadOutItem
	NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
	Caption="Secondary Weapon"
	WinTop=0.5000000
	WinLeft=0.4000000
	WinWidth=0.2000000
	WinHeight=0.1333330
	OnRendered=SecondaryImage.InternalOnDraw
	OnClick=SecondaryImage.InternalOnClick
	OnRightClick=SecondaryImage.InternalOnRightClick
end object
// Reference: GUILoadOutItem'BallisticProV55.BallisticLoadOutMenu.GrenadeImage'
begin object name="GrenadeImage" class=BCoreProV55.GUILoadOutItem
	NAImage=Texture'BW_Core_WeaponTex.Icons.BigIcon_NA'
	Caption="Grenades"
	WinTop=0.3000000
	WinLeft=0.7000000
	WinWidth=0.2000000
	WinHeight=0.1333330
	OnRendered=GrenadeImage.InternalOnDraw
	OnClick=GrenadeImage.InternalOnClick
	OnRightClick=GrenadeImage.InternalOnRightClick
end object
// Reference: GUIButton'BallisticProV55.BallisticLoadOutMenu.CancelButton'
begin object name="CancelButton" class=XInterface.GUIButton
	Caption="CANCEL"
	WinTop=0.7000000
	WinLeft=0.7000000
	WinWidth=0.2000000
	TabOrder=1
	OnClick=BallisticLoadOutMenu.InternalOnClick
	OnKeyEvent=CancelButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.BallisticLoadOutMenu.DoneButton'
begin object name="DoneButton" class=XInterface.GUIButton
	Caption="DONE"
	WinTop=0.7000000
	WinLeft=0.1000000
	WinWidth=0.2000000
	TabOrder=0
	OnClick=BallisticLoadOutMenu.InternalOnClick
	OnKeyEvent=DoneButton.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticLoadOutMenu.cb_GrenadeComBox'
begin object name="cb_GrenadeComBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Quick list of Grenade Trap and Explosive items"
	WinTop=0.4314770
	WinLeft=0.7021480
	WinWidth=0.1960940
	WinHeight=0.0266810
	TabOrder=0
	OnChange=BallisticLoadOutMenu.InternalOnChange
	OnKeyEvent=cb_GrenadeComBox.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticLoadOutMenu.cb_SecondaryComBox'
begin object name="cb_SecondaryComBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Quick list of Secondary items"
	WinTop=0.6319960
	WinLeft=0.4029300
	WinWidth=0.1960940
	WinHeight=0.0266810
	TabOrder=0
	OnChange=BallisticLoadOutMenu.InternalOnChange
	OnKeyEvent=cb_SecondaryComBox.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticLoadOutMenu.cb_PrimaryComBox'
begin object name="cb_PrimaryComBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Quick list of Primary items"
	WinTop=0.6319960
	WinLeft=0.1021480
	WinWidth=0.1960940
	WinHeight=0.0266810
	TabOrder=0
	OnChange=BallisticLoadOutMenu.InternalOnChange
	OnKeyEvent=cb_PrimaryComBox.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticLoadOutMenu.cb_SideArmBox'
begin object name="cb_SideArmBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Quick list of SideArm items"
	WinTop=0.4314770
	WinLeft=0.4029300
	WinWidth=0.1960940
	WinHeight=0.0266810
	TabOrder=0
	OnChange=BallisticLoadOutMenu.InternalOnChange
	OnKeyEvent=cb_SideArmBox.InternalOnKeyEvent
end object
// Reference: GUIComboBox'BallisticProV55.BallisticLoadOutMenu.cb_MeleeComBox'
begin object name="cb_MeleeComBox" class=XInterface.GUIComboBox
	MaxVisibleItems=16
	Hint="Quick list of Melee items"
	WinTop=0.4314770
	WinLeft=0.1021480
	WinWidth=0.1960940
	WinHeight=0.0266810
	TabOrder=0
	OnChange=BallisticLoadOutMenu.InternalOnChange
	OnKeyEvent=cb_MeleeComBox.InternalOnKeyEvent
end object
// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.BackImage'
begin object name="BackImage" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display95'
	ImageStyle=1
	WinTop=0.2000000
	WinLeft=0.0500000
	WinWidth=0.9000000
	WinHeight=0.6000000
	RenderWeight=0.0010000
end object
// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.ImageBoxMelee'
begin object name="ImageBoxMelee" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.2875000
	WinLeft=0.0875000
	WinWidth=0.2250000
	WinHeight=0.1583330
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.ImageBoxSideArm'
begin object name="ImageBoxSideArm" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.2875000
	WinLeft=0.3875000
	WinWidth=0.2250000
	WinHeight=0.1583330
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.ImageBoxPrimary'
begin object name="ImageBoxPrimary" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.4875000
	WinLeft=0.0875000
	WinWidth=0.2250000
	WinHeight=0.1583330
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.ImageBoxSecondary'
begin object name="ImageBoxSecondary" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.4875000
	WinLeft=0.3875000
	WinWidth=0.2250000
	WinHeight=0.1583330
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.ImageBoxGrenade'
begin object name="ImageBoxGrenade" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.2875000
	WinLeft=0.6875000
	WinWidth=0.2250000
	WinHeight=0.1583330
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.MeleeBackImage'
begin object name="MeleeBackImage" class=XInterface.GUIImage
	Image=Texture'Engine.MenuBlack'
	ImageStyle=1
	WinTop=0.3000000
	WinLeft=0.1000000
	WinWidth=0.2000000
	WinHeight=0.1333330
	RenderWeight=0.0030000
end object
// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.SideArmBackImage'
begin object name="SideArmBackImage" class=XInterface.GUIImage
	Image=Texture'Engine.MenuBlack'
	ImageStyle=1
	WinTop=0.3000000
	WinLeft=0.4000000
	WinWidth=0.2000000
	WinHeight=0.1333330
	RenderWeight=0.0030000
end object
// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.PrimaryBackImage'
begin object name="PrimaryBackImage" class=XInterface.GUIImage
	Image=Texture'Engine.MenuBlack'
	ImageStyle=1
	WinTop=0.5000000
	WinLeft=0.1000000
	WinWidth=0.2000000
	WinHeight=0.1333330
	RenderWeight=0.0030000
end object
// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.SecondaryBackImage'
begin object name="SecondaryBackImage" class=XInterface.GUIImage
	Image=Texture'Engine.MenuBlack'
	ImageStyle=1
	WinTop=0.5000000
	WinLeft=0.4000000
	WinWidth=0.2000000
	WinHeight=0.1333330
	RenderWeight=0.0030000
end object
// Reference: GUIImage'BallisticProV55.BallisticLoadOutMenu.GrenadeBackImage'
begin object name="GrenadeBackImage" class=XInterface.GUIImage
	Image=Texture'Engine.MenuBlack'
	ImageStyle=1
	WinTop=0.3000000
	WinLeft=0.7000000
	WinWidth=0.2000000
	WinHeight=0.1333330
	RenderWeight=0.0030000
end object
// Reference: GUIButton'BallisticProV55.BallisticLoadOutMenu.BStatButton'
begin object name="BStatButton" class=XInterface.GUIButton
	Caption="Stats"
	WinTop=0.7000000
	WinLeft=0.4000000
	WinWidth=0.2000000
	TabOrder=1
	OnClick=BallisticLoadOutMenu.InternalOnClick
	OnKeyEvent=CancelButton.InternalOnKeyEvent
end object
// Reference: GUIHeader'BallisticProV55.BallisticLoadOutMenu.DaBeegHeader'
begin object name="DaBeegHeader" class=XInterface.GUIHeader
	bUseTextHeight=true
	Caption="Select your equipment"
	WinTop=0.2000000
	WinLeft=0.0500000
	WinWidth=0.9000000
	WinHeight=0.7000000
end object
// Reference: GUILabel'BallisticProV55.BallisticLoadOutMenu.l_Receivinglabel'
begin object name="l_Receivinglabel" class=XInterface.GUILabel
	TextAlign=1
	TextColor=(R=255,G=255,B=0,A=255)
	FontScale=2
	WinTop=0.2370000
	WinLeft=0.0500000
	WinWidth=0.9000000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticLoadOutMenu.l_StatTimeLabel'
begin object name="l_StatTimeLabel" class=XInterface.GUILabel
	Caption="Time"
	TextColor=(R=0,G=255,B=0,A=255)
	FontScale=0
	WinTop=0.4800000
	WinLeft=0.6500000
	WinWidth=0.3000000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticLoadOutMenu.l_StatFragsLabel'
begin object name="l_StatFragsLabel" class=XInterface.GUILabel
	Caption="Frags"
	TextColor=(R=0,G=255,B=0,A=255)
	FontScale=0
	WinTop=0.5100000
	WinLeft=0.6500000
	WinWidth=0.3000000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticLoadOutMenu.l_StatEfficiencyLabel'
begin object name="l_StatEfficiencyLabel" class=XInterface.GUILabel
	Caption="Efficiency"
	TextColor=(R=0,G=255,B=0,A=255)
	FontScale=0
	WinTop=0.5400000
	WinLeft=0.6500000
	WinWidth=0.3000000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticLoadOutMenu.l_StatDamageRateLabel'
begin object name="l_StatDamageRateLabel" class=XInterface.GUILabel
	Caption="DamageRate"
	TextColor=(R=0,G=255,B=0,A=255)
	FontScale=0
	WinTop=0.5700000
	WinLeft=0.6500000
	WinWidth=0.3000000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticLoadOutMenu.l_StatSniperEffLabel'
begin object name="l_StatSniperEffLabel" class=XInterface.GUILabel
	Caption="Sniper Efficiency"
	TextColor=(R=0,G=255,B=0,A=255)
	FontScale=0
	WinTop=0.6000000
	WinLeft=0.6500000
	WinWidth=0.3000000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticLoadOutMenu.l_StatShotgunEffLabel'
begin object name="l_StatShotgunEffLabel" class=XInterface.GUILabel
	Caption="Shotgun Efficiency"
	TextColor=(R=0,G=255,B=0,A=255)
	FontScale=0
	WinTop=0.6300000
	WinLeft=0.6500000
	WinWidth=0.3000000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticLoadOutMenu.l_StatHazardEffLabel'
begin object name="l_StatHazardEffLabel" class=XInterface.GUILabel
	Caption="Hazard Efficiency"
	TextColor=(R=0,G=255,B=0,A=255)
	FontScale=0
	WinTop=0.6600000
	WinLeft=0.6500000
	WinWidth=0.3000000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticLoadOutMenu.l_StatHeadingLabel'
begin object name="l_StatHeadingLabel" class=XInterface.GUILabel
	Caption="Your Stats"
	TextAlign=1
	TextColor=(R=255,G=255,B=0,A=255)
	FontScale=0
	WinTop=0.4550000
	WinLeft=0.7000000
	WinWidth=0.2000000
	WinHeight=0.0400000
end object
