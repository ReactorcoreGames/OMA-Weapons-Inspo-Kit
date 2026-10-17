class BallisticConflictInfoMenu extends UT2K4GUIPage
	editinlinenew
	instanced;

struct s_WeaponInfo
{
	var string ItemName;
	var Material ItemImage;
	var string ItemClassName;
	var IntBox ImageCoords;
};

var() automated GUIImage MyBack;
var() automated GUIImage Box_WeaponList;
var() automated GUIImage Box_WeaponIcon;
var() automated GUIImage IconBack;
var() automated GUIImage WeaponIcon;
var() automated GUIButton bDone;
var() automated GUIHeader MyHeader;
var() automated GUILabel l_StatTime;
var() automated GUILabel l_StatFrags;
var() automated GUILabel l_StatEfficiency;
var() automated GUILabel l_StatDamageRate;
var() automated GUILabel l_StatSniperEff;
var() automated GUILabel l_StatShotgunEff;
var() automated GUILabel l_StatHazardEff;
var() automated GUILabel l_StatHeading;
var() automated GUILabel l_StatTimeMy;
var() automated GUILabel l_StatFragsMy;
var() automated GUILabel l_StatEfficiencyMy;
var() automated GUILabel l_StatDamageRateMy;
var() automated GUILabel l_StatSniperEffMy;
var() automated GUILabel l_StatShotgunEffMy;
var() automated GUILabel l_StatHazardEffMy;
var() automated GUILabel l_StatHeadingMy;
var() automated GUIListBox lb_Weapons;
var() localized string StatTimeCaption;
var() localized string StatFragsCaption;
var() localized string StatEffCaption;
var() localized string StatDmgRtCaption;
var() localized string StatSnprEffCaption;
var() localized string StatStgnEffCaption;
var() localized string StatHzrdEffCaption;
var export editinline MidGameTab_Conflict ConflictMenu;
var array<s_WeaponInfo> WeaponInfo;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	super(GUIPage).InitComponent(MyController, MyOwner);
	//return;	
}

function LoadWeapons(MidGameTab_Conflict Source)
{
	local int i;
	local s_WeaponInfo WI;

	ConflictMenu = Source;
	i = 0;
	J0x12:

	// End:0xD8 [Loop If]
	if(i < Source.CLRI.FullInventoryList.Length)
	{
		// End:0xCE
		if(Source.CLRI.FullInventoryList[i].ClassName != "")
		{
			// End:0xCE
			if(GetItemInfo(i, WI.ItemName, WI.ItemImage, WI.ItemClassName, WI.ImageCoords))
			{
				lb_Weapons.List.Add(WI.ItemName,, string(i));
				WeaponInfo[i] = WI;
			}
		}
		i++;
		// [Loop Continue]
		goto J0x12;
	}
	lb_Weapons.List.__OnChange__Delegate = InternalOnChange;
	l_StatTimeMy.Caption = StatTimeCaption $ string(ConflictMenu.CLRI.MySkillInfo.ElapsedTime);
	l_StatFragsMy.Caption = StatFragsCaption $ string(int(PlayerOwner().PlayerReplicationInfo.Score));
	// End:0x1AC
	if(PlayerOwner().PlayerReplicationInfo.Deaths == float(0))
	{
		l_StatEfficiencyMy.Caption = StatEffCaption $ string(PlayerOwner().PlayerReplicationInfo.Score / 0.1000000);		
	}
	else
	{
		l_StatEfficiencyMy.Caption = StatEffCaption $ string(PlayerOwner().PlayerReplicationInfo.Score / PlayerOwner().PlayerReplicationInfo.Deaths);
	}
	l_StatSniperEffMy.Caption = StatSnprEffCaption $ string(ConflictMenu.CLRI.MySkillInfo.SniperEff);
	l_StatShotgunEffMy.Caption = StatStgnEffCaption $ string(ConflictMenu.CLRI.MySkillInfo.ShotgunEff);
	l_StatHazardEffMy.Caption = StatHzrdEffCaption $ string(ConflictMenu.CLRI.MySkillInfo.HazardEff);
	l_StatDamageRateMy.Caption = StatDmgRtCaption $ string(ConflictMenu.CLRI.MySkillInfo.DamageRate);
	UpdateInfo();
	//return;	
}

function UpdateInfo()
{
	local Color Red, Green;
	local int i;

	Red.A = byte(255);
	Red.R = byte(255);
	Green.A = byte(255);
	Green.G = byte(255);
	i = int(lb_Weapons.List.GetExtra());
	// End:0xB8
	if(ConflictMenu.CLRI.RequirementsList[i].MatchTime > float(ConflictMenu.CLRI.MySkillInfo.ElapsedTime))
	{
		l_StatTime.TextColor = Red;		
	}
	else
	{
		l_StatTime.TextColor = Green;
	}
	l_StatTime.Caption = StatTimeCaption $ string(ConflictMenu.CLRI.RequirementsList[i].MatchTime);
	// End:0x159
	if(ConflictMenu.CLRI.RequirementsList[i].Frags > PlayerOwner().PlayerReplicationInfo.Score)
	{
		l_StatFrags.TextColor = Red;		
	}
	else
	{
		l_StatFrags.TextColor = Green;
	}
	l_StatFrags.Caption = StatFragsCaption $ string(ConflictMenu.CLRI.RequirementsList[i].Frags);
	// End:0x235
	if(PlayerOwner().PlayerReplicationInfo.Deaths == float(0))
	{
		// End:0x21E
		if(ConflictMenu.CLRI.RequirementsList[i].Efficiency > (PlayerOwner().PlayerReplicationInfo.Score / 0.1000000))
		{
			l_StatEfficiency.TextColor = Red;			
		}
		else
		{
			l_StatEfficiency.TextColor = Green;
		}		
	}
	else
	{
		// End:0x29F
		if(ConflictMenu.CLRI.RequirementsList[i].Efficiency > (PlayerOwner().PlayerReplicationInfo.Score / PlayerOwner().PlayerReplicationInfo.Deaths))
		{
			l_StatEfficiency.TextColor = Red;			
		}
		else
		{
			l_StatEfficiency.TextColor = Green;
		}
	}
	// End:0x30D
	if(ConflictMenu.CLRI.RequirementsList[i].SniperEff > ConflictMenu.CLRI.MySkillInfo.SniperEff)
	{
		l_StatSniperEff.TextColor = Red;		
	}
	else
	{
		l_StatSniperEff.TextColor = Green;
	}
	// End:0x37B
	if(ConflictMenu.CLRI.RequirementsList[i].ShotgunEff > ConflictMenu.CLRI.MySkillInfo.ShotgunEff)
	{
		l_StatShotgunEff.TextColor = Red;		
	}
	else
	{
		l_StatShotgunEff.TextColor = Green;
	}
	// End:0x3E9
	if(ConflictMenu.CLRI.RequirementsList[i].HazardEff > ConflictMenu.CLRI.MySkillInfo.HazardEff)
	{
		l_StatHazardEff.TextColor = Red;		
	}
	else
	{
		l_StatHazardEff.TextColor = Green;
	}
	l_StatEfficiency.Caption = StatEffCaption $ string(ConflictMenu.CLRI.RequirementsList[i].Efficiency);
	l_StatSniperEff.Caption = StatSnprEffCaption $ string(ConflictMenu.CLRI.RequirementsList[i].SniperEff);
	l_StatShotgunEff.Caption = StatStgnEffCaption $ string(ConflictMenu.CLRI.RequirementsList[i].ShotgunEff);
	l_StatHazardEff.Caption = StatHzrdEffCaption $ string(ConflictMenu.CLRI.RequirementsList[i].HazardEff);
	// End:0x53F
	if(ConflictMenu.CLRI.RequirementsList[i].DamageRate > ConflictMenu.CLRI.MySkillInfo.DamageRate)
	{
		l_StatDamageRate.TextColor = Red;		
	}
	else
	{
		l_StatDamageRate.TextColor = Green;
	}
	l_StatDamageRate.Caption = StatDmgRtCaption $ string(ConflictMenu.CLRI.RequirementsList[i].DamageRate);
	WeaponIcon.Image = WeaponInfo[i].ItemImage;
	WeaponIcon.X1 = WeaponInfo[i].ImageCoords.X1;
	WeaponIcon.X2 = WeaponInfo[i].ImageCoords.X2;
	WeaponIcon.Y1 = WeaponInfo[i].ImageCoords.Y1;
	WeaponIcon.Y2 = WeaponInfo[i].ImageCoords.Y2;
	//return;	
}

function bool GetItemInfo(int Index, out string ItemCap, out Material ItemImage, out string ItemClassName, optional out IntBox ImageCoords)
{
	local WeaponInfo WI;
	local int i;
	local string ItemCName;

	ItemCName = ConflictMenu.CLRI.FullInventoryList[Index].ClassName;
	// End:0x36
	if(ItemCName == "")
	{
		return false;
	}
	WI = Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(ItemCName, i);
	// End:0x66
	if(i == -1)
	{
		return false;
	}
	ItemCap = WI.ItemName;
	ItemClassName = ItemCName;
	// End:0xE2
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
	// End:0x2D
	if((int(Key) == 13) && int(State) == 3)
	{
		return InternalOnClick(bDone);		
	}
	else
	{
		// End:0x57
		if((int(Key) == 27) && int(State) == 3)
		{
			return InternalOnClick(bDone);
		}
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
	// End:0x1E
	if(Sender == bDone)
	{
		Controller.CloseMenu();
	}
	return true;
	//return;	
}

function InternalOnChange(GUIComponent Sender)
{
	// End:0x1E
	if(Sender == lb_Weapons.List)
	{
		UpdateInfo();
	}
	//return;	
}

defaultproperties
{
	// Reference: GUIImage'BallisticProV55.BallisticConflictInfoMenu.BackImage'
	begin object name="BackImage" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display95'
		ImageStyle=1
		WinLeft=0.2500000
		WinWidth=0.5000000
		WinHeight=1.0000000
		RenderWeight=0.0010000
	end object
	MyBack=BackImage
	// Reference: GUIImage'BallisticProV55.BallisticConflictInfoMenu.ImageBoxWeapons'
	begin object name="ImageBoxWeapons" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.0300000
		WinLeft=0.3000000
		WinWidth=0.4000000
		WinHeight=0.4500000
		RenderWeight=0.0020000
	end object
	Box_WeaponList=ImageBoxWeapons
	// Reference: GUIImage'BallisticProV55.BallisticConflictInfoMenu.ImageBox_WeaponIcon'
	begin object name="ImageBox_WeaponIcon" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display99'
		ImageStyle=1
		WinTop=0.4875000
		WinLeft=0.3875000
		WinWidth=0.2250000
		WinHeight=0.1583330
		RenderWeight=0.0020000
	end object
	Box_WeaponIcon=ImageBox_WeaponIcon
	// Reference: GUIImage'BallisticProV55.BallisticConflictInfoMenu.IconBackImage'
	begin object name="IconBackImage" class=XInterface.GUIImage
		Image=Texture'Engine.MenuBlack'
		ImageStyle=1
		WinTop=0.5000000
		WinLeft=0.4000000
		WinWidth=0.2000000
		WinHeight=0.1333330
		RenderWeight=0.0030000
	end object
	IconBack=IconBackImage
	// Reference: GUIImage'BallisticProV55.BallisticConflictInfoMenu.WeaponIconImage'
	begin object name="WeaponIconImage" class=XInterface.GUIImage
		Image=Texture'Engine.MenuBlack'
		ImageStyle=2
		WinTop=0.5000000
		WinLeft=0.4000000
		WinWidth=0.2000000
		WinHeight=0.1333330
		RenderWeight=0.0040000
	end object
	WeaponIcon=WeaponIconImage
	// Reference: GUIButton'BallisticProV55.BallisticConflictInfoMenu.DoneButton'
	begin object name="DoneButton" class=XInterface.GUIButton
		Caption="DONE"
		WinTop=0.9250000
		WinLeft=0.4000000
		WinWidth=0.2000000
		TabOrder=0
		OnClick=BallisticConflictInfoMenu.InternalOnClick
		OnKeyEvent=DoneButton.InternalOnKeyEvent
	end object
	bDone=DoneButton
	// Reference: GUIHeader'BallisticProV55.BallisticConflictInfoMenu.DaBeegHeader'
	begin object name="DaBeegHeader" class=XInterface.GUIHeader
		bUseTextHeight=true
		Caption="Weapon Requirement Stats"
		WinLeft=0.2500000
		WinWidth=0.5000000
		WinHeight=0.0312500
	end object
	MyHeader=DaBeegHeader
	// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatTimeLabel'
	begin object name="l_StatTimeLabel" class=XInterface.GUILabel
		Caption="Time"
		TextColor=(R=0,G=255,B=0,A=255)
		FontScale=0
		WinTop=0.7000000
		WinLeft=0.5000000
		WinWidth=0.2400000
		WinHeight=0.0400000
	end object
	l_StatTime=l_StatTimeLabel
	// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatFragsLabel'
	begin object name="l_StatFragsLabel" class=XInterface.GUILabel
		Caption="Frags"
		TextColor=(R=0,G=255,B=0,A=255)
		FontScale=0
		WinTop=0.7300000
		WinLeft=0.5000000
		WinWidth=0.2400000
		WinHeight=0.0400000
	end object
	l_StatFrags=l_StatFragsLabel
	// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatEfficiencyLabel'
	begin object name="l_StatEfficiencyLabel" class=XInterface.GUILabel
		Caption="Efficiency"
		TextColor=(R=0,G=255,B=0,A=255)
		FontScale=0
		WinTop=0.7600000
		WinLeft=0.5000000
		WinWidth=0.2400000
		WinHeight=0.0400000
	end object
	l_StatEfficiency=l_StatEfficiencyLabel
	// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatDamageRateLabel'
	begin object name="l_StatDamageRateLabel" class=XInterface.GUILabel
		Caption="DamageRate"
		TextColor=(R=0,G=255,B=0,A=255)
		FontScale=0
		WinTop=0.7900000
		WinLeft=0.5000000
		WinWidth=0.2400000
		WinHeight=0.0400000
	end object
	l_StatDamageRate=l_StatDamageRateLabel
	// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatSniperEffLabel'
	begin object name="l_StatSniperEffLabel" class=XInterface.GUILabel
		Caption="SniperEff"
		TextColor=(R=64,G=255,B=128,A=255)
		FontScale=0
		WinTop=0.8200000
		WinLeft=0.5000000
		WinWidth=0.2400000
		WinHeight=0.0400000
	end object
	l_StatSniperEff=l_StatSniperEffLabel
	// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatShotgunEffLabel'
	begin object name="l_StatShotgunEffLabel" class=XInterface.GUILabel
		Caption="ShotgunEff"
		TextColor=(R=64,G=255,B=128,A=255)
		FontScale=0
		WinTop=0.8500000
		WinLeft=0.5000000
		WinWidth=0.2400000
		WinHeight=0.0400000
	end object
	l_StatShotgunEff=l_StatShotgunEffLabel
	// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatHazardEffLabel'
	begin object name="l_StatHazardEffLabel" class=XInterface.GUILabel
		Caption="HazardEff"
		TextColor=(R=64,G=255,B=128,A=255)
		FontScale=0
		WinTop=0.8800000
		WinLeft=0.5000000
		WinWidth=0.2400000
		WinHeight=0.0400000
	end object
	l_StatHazardEff=l_StatHazardEffLabel
	// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatHeadingLabel'
	begin object name="l_StatHeadingLabel" class=XInterface.GUILabel
		Caption="Required Stats"
		TextAlign=1
		TextColor=(R=255,G=255,B=0,A=255)
		FontScale=0
		WinTop=0.6500000
		WinLeft=0.5000000
		WinWidth=0.2000000
		WinHeight=0.0400000
	end object
	l_StatHeading=l_StatHeadingLabel
	// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatTimeLabelMy'
	begin object name="l_StatTimeLabelMy" class=XInterface.GUILabel
		Caption="Time"
		TextColor=(R=64,G=255,B=128,A=255)
		FontScale=0
		WinTop=0.7000000
		WinLeft=0.2600000
		WinWidth=0.2400000
		WinHeight=0.0400000
	end object
	l_StatTimeMy=l_StatTimeLabelMy
	// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatFragsLabelMy'
	begin object name="l_StatFragsLabelMy" class=XInterface.GUILabel
		Caption="Frags"
		TextColor=(R=64,G=255,B=128,A=255)
		FontScale=0
		WinTop=0.7300000
		WinLeft=0.2600000
		WinWidth=0.2400000
		WinHeight=0.0400000
	end object
	l_StatFragsMy=l_StatFragsLabelMy
	// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatEfficiencyLabelMy'
	begin object name="l_StatEfficiencyLabelMy" class=XInterface.GUILabel
		Caption="Efficiency"
		TextColor=(R=64,G=255,B=128,A=255)
		FontScale=0
		WinTop=0.7600000
		WinLeft=0.2600000
		WinWidth=0.2400000
		WinHeight=0.0400000
	end object
	l_StatEfficiencyMy=l_StatEfficiencyLabelMy
	// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatDamageRateLabelMy'
	begin object name="l_StatDamageRateLabelMy" class=XInterface.GUILabel
		Caption="DamageRate"
		TextColor=(R=64,G=255,B=128,A=255)
		FontScale=0
		WinTop=0.7900000
		WinLeft=0.2600000
		WinWidth=0.2400000
		WinHeight=0.0400000
	end object
	l_StatDamageRateMy=l_StatDamageRateLabelMy
	// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatSniperEffLabelMy'
	begin object name="l_StatSniperEffLabelMy" class=XInterface.GUILabel
		Caption="SniperEff"
		TextColor=(R=64,G=255,B=128,A=255)
		FontScale=0
		WinTop=0.8200000
		WinLeft=0.2600000
		WinWidth=0.2400000
		WinHeight=0.0400000
	end object
	l_StatSniperEffMy=l_StatSniperEffLabelMy
	// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatShotgunEffLabelMy'
	begin object name="l_StatShotgunEffLabelMy" class=XInterface.GUILabel
		Caption="ShotgunEff"
		TextColor=(R=64,G=255,B=128,A=255)
		FontScale=0
		WinTop=0.8500000
		WinLeft=0.2600000
		WinWidth=0.2400000
		WinHeight=0.0400000
	end object
	l_StatShotgunEffMy=l_StatShotgunEffLabelMy
	// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatHazardEffLabelMy'
	begin object name="l_StatHazardEffLabelMy" class=XInterface.GUILabel
		Caption="HazardEff"
		TextColor=(R=64,G=255,B=128,A=255)
		FontScale=0
		WinTop=0.8800000
		WinLeft=0.2600000
		WinWidth=0.2400000
		WinHeight=0.0400000
	end object
	l_StatHazardEffMy=l_StatHazardEffLabelMy
	// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatHeadingLabelMy'
	begin object name="l_StatHeadingLabelMy" class=XInterface.GUILabel
		Caption="Your Stats"
		TextAlign=1
		TextColor=(R=255,G=255,B=0,A=255)
		FontScale=0
		WinTop=0.6500000
		WinLeft=0.2500000
		WinWidth=0.2000000
		WinHeight=0.0400000
	end object
	l_StatHeadingMy=l_StatHeadingLabelMy
	// Reference: GUIListBox'BallisticProV55.BallisticConflictInfoMenu.WeaponList'
	begin object name="WeaponList" class=XInterface.GUIListBox
		bVisibleWhenEmpty=true
		bSorted=true
		OnCreateComponent=WeaponList.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="All the weapons that can become available. Click to see each one's skill requirements."
		WinTop=0.0550000
		WinLeft=0.3100000
		WinWidth=0.3800000
		WinHeight=0.4000000
		RenderWeight=0.5100000
		TabOrder=1
	end object
	lb_Weapons=WeaponList
	StatTimeCaption="Time: "
	StatFragsCaption="Frags: "
	StatEffCaption="Efficiency: "
	StatDmgRtCaption="DamageRate: "
	StatSnprEffCaption="Sniper Eff: "
	StatStgnEffCaption="Shotgun Eff: "
	StatHzrdEffCaption="Hazard Eff: "
	bRenderWorld=true
	bAllowedAsLast=true
	OnClose=BallisticConflictInfoMenu.InternalOnClose
	OnKeyEvent=BallisticConflictInfoMenu.InternalOnKeyEvent
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: GUIListBox'BallisticProV55.BallisticConflictInfoMenu.WeaponList'
begin object name="WeaponList" class=XInterface.GUIListBox
	bVisibleWhenEmpty=true
	bSorted=true
	OnCreateComponent=WeaponList.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="All the weapons that can become available. Click to see each one's skill requirements."
	WinTop=0.0550000
	WinLeft=0.3100000
	WinWidth=0.3800000
	WinHeight=0.4000000
	RenderWeight=0.5100000
	TabOrder=1
end object
// Reference: GUIButton'BallisticProV55.BallisticConflictInfoMenu.DoneButton'
begin object name="DoneButton" class=XInterface.GUIButton
	Caption="DONE"
	WinTop=0.9250000
	WinLeft=0.4000000
	WinWidth=0.2000000
	TabOrder=0
	OnClick=BallisticConflictInfoMenu.InternalOnClick
	OnKeyEvent=DoneButton.InternalOnKeyEvent
end object
// Reference: GUIImage'BallisticProV55.BallisticConflictInfoMenu.BackImage'
begin object name="BackImage" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display95'
	ImageStyle=1
	WinLeft=0.2500000
	WinWidth=0.5000000
	WinHeight=1.0000000
	RenderWeight=0.0010000
end object
// Reference: GUIImage'BallisticProV55.BallisticConflictInfoMenu.ImageBoxWeapons'
begin object name="ImageBoxWeapons" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.0300000
	WinLeft=0.3000000
	WinWidth=0.4000000
	WinHeight=0.4500000
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticConflictInfoMenu.ImageBox_WeaponIcon'
begin object name="ImageBox_WeaponIcon" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display99'
	ImageStyle=1
	WinTop=0.4875000
	WinLeft=0.3875000
	WinWidth=0.2250000
	WinHeight=0.1583330
	RenderWeight=0.0020000
end object
// Reference: GUIImage'BallisticProV55.BallisticConflictInfoMenu.IconBackImage'
begin object name="IconBackImage" class=XInterface.GUIImage
	Image=Texture'Engine.MenuBlack'
	ImageStyle=1
	WinTop=0.5000000
	WinLeft=0.4000000
	WinWidth=0.2000000
	WinHeight=0.1333330
	RenderWeight=0.0030000
end object
// Reference: GUIImage'BallisticProV55.BallisticConflictInfoMenu.WeaponIconImage'
begin object name="WeaponIconImage" class=XInterface.GUIImage
	Image=Texture'Engine.MenuBlack'
	ImageStyle=2
	WinTop=0.5000000
	WinLeft=0.4000000
	WinWidth=0.2000000
	WinHeight=0.1333330
	RenderWeight=0.0040000
end object
// Reference: GUIHeader'BallisticProV55.BallisticConflictInfoMenu.DaBeegHeader'
begin object name="DaBeegHeader" class=XInterface.GUIHeader
	bUseTextHeight=true
	Caption="Weapon Requirement Stats"
	WinLeft=0.2500000
	WinWidth=0.5000000
	WinHeight=0.0312500
end object
// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatTimeLabel'
begin object name="l_StatTimeLabel" class=XInterface.GUILabel
	Caption="Time"
	TextColor=(R=0,G=255,B=0,A=255)
	FontScale=0
	WinTop=0.7000000
	WinLeft=0.5000000
	WinWidth=0.2400000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatFragsLabel'
begin object name="l_StatFragsLabel" class=XInterface.GUILabel
	Caption="Frags"
	TextColor=(R=0,G=255,B=0,A=255)
	FontScale=0
	WinTop=0.7300000
	WinLeft=0.5000000
	WinWidth=0.2400000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatEfficiencyLabel'
begin object name="l_StatEfficiencyLabel" class=XInterface.GUILabel
	Caption="Efficiency"
	TextColor=(R=0,G=255,B=0,A=255)
	FontScale=0
	WinTop=0.7600000
	WinLeft=0.5000000
	WinWidth=0.2400000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatDamageRateLabel'
begin object name="l_StatDamageRateLabel" class=XInterface.GUILabel
	Caption="DamageRate"
	TextColor=(R=0,G=255,B=0,A=255)
	FontScale=0
	WinTop=0.7900000
	WinLeft=0.5000000
	WinWidth=0.2400000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatSniperEffLabel'
begin object name="l_StatSniperEffLabel" class=XInterface.GUILabel
	Caption="SniperEff"
	TextColor=(R=64,G=255,B=128,A=255)
	FontScale=0
	WinTop=0.8200000
	WinLeft=0.5000000
	WinWidth=0.2400000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatShotgunEffLabel'
begin object name="l_StatShotgunEffLabel" class=XInterface.GUILabel
	Caption="ShotgunEff"
	TextColor=(R=64,G=255,B=128,A=255)
	FontScale=0
	WinTop=0.8500000
	WinLeft=0.5000000
	WinWidth=0.2400000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatHazardEffLabel'
begin object name="l_StatHazardEffLabel" class=XInterface.GUILabel
	Caption="HazardEff"
	TextColor=(R=64,G=255,B=128,A=255)
	FontScale=0
	WinTop=0.8800000
	WinLeft=0.5000000
	WinWidth=0.2400000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatHeadingLabel'
begin object name="l_StatHeadingLabel" class=XInterface.GUILabel
	Caption="Required Stats"
	TextAlign=1
	TextColor=(R=255,G=255,B=0,A=255)
	FontScale=0
	WinTop=0.6500000
	WinLeft=0.5000000
	WinWidth=0.2000000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatTimeLabelMy'
begin object name="l_StatTimeLabelMy" class=XInterface.GUILabel
	Caption="Time"
	TextColor=(R=64,G=255,B=128,A=255)
	FontScale=0
	WinTop=0.7000000
	WinLeft=0.2600000
	WinWidth=0.2400000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatFragsLabelMy'
begin object name="l_StatFragsLabelMy" class=XInterface.GUILabel
	Caption="Frags"
	TextColor=(R=64,G=255,B=128,A=255)
	FontScale=0
	WinTop=0.7300000
	WinLeft=0.2600000
	WinWidth=0.2400000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatEfficiencyLabelMy'
begin object name="l_StatEfficiencyLabelMy" class=XInterface.GUILabel
	Caption="Efficiency"
	TextColor=(R=64,G=255,B=128,A=255)
	FontScale=0
	WinTop=0.7600000
	WinLeft=0.2600000
	WinWidth=0.2400000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatDamageRateLabelMy'
begin object name="l_StatDamageRateLabelMy" class=XInterface.GUILabel
	Caption="DamageRate"
	TextColor=(R=64,G=255,B=128,A=255)
	FontScale=0
	WinTop=0.7900000
	WinLeft=0.2600000
	WinWidth=0.2400000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatSniperEffLabelMy'
begin object name="l_StatSniperEffLabelMy" class=XInterface.GUILabel
	Caption="SniperEff"
	TextColor=(R=64,G=255,B=128,A=255)
	FontScale=0
	WinTop=0.8200000
	WinLeft=0.2600000
	WinWidth=0.2400000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatShotgunEffLabelMy'
begin object name="l_StatShotgunEffLabelMy" class=XInterface.GUILabel
	Caption="ShotgunEff"
	TextColor=(R=64,G=255,B=128,A=255)
	FontScale=0
	WinTop=0.8500000
	WinLeft=0.2600000
	WinWidth=0.2400000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatHazardEffLabelMy'
begin object name="l_StatHazardEffLabelMy" class=XInterface.GUILabel
	Caption="HazardEff"
	TextColor=(R=64,G=255,B=128,A=255)
	FontScale=0
	WinTop=0.8800000
	WinLeft=0.2600000
	WinWidth=0.2400000
	WinHeight=0.0400000
end object
// Reference: GUILabel'BallisticProV55.BallisticConflictInfoMenu.l_StatHeadingLabelMy'
begin object name="l_StatHeadingLabelMy" class=XInterface.GUILabel
	Caption="Your Stats"
	TextAlign=1
	TextColor=(R=255,G=255,B=0,A=255)
	FontScale=0
	WinTop=0.6500000
	WinLeft=0.2500000
	WinWidth=0.2000000
	WinHeight=0.0400000
end object
