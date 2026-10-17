class ConfigMenuBase extends UT2K4GUIPage
	editinlinenew
	instanced;

var Class<BC_GameStyle> ConfiguredStyle;
var() automated GUIImage MyBack;
var() automated GUIButton bDone;
var() automated GUIButton bCancel;
var() automated GUIButton bReset;
var() automated GUIButton bDefault;
var() automated GUIButton bPurge;
var() automated GUIHeader MyHeader;
var() automated GUITabControl c_Tabs;
var() localized string HeaderCaption;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	super(GUIPage).InitComponent(MyController, MyOwner);
	MyHeader.DockedTabs = c_Tabs;
	AddTabs();
	//return;	
}

function AddTabs()
{
	//return;	
}

function InternalOnChange(GUIComponent Sender)
{
	// End:0x12
	if(GUITabButton(Sender) == none)
	{
		return;
	}
	MyHeader.SetCaption((HeaderCaption @ "|") @ GUITabButton(Sender).Caption);
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
			return InternalOnClick(bCancel);
		}
	}
	return false;
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
		// End:0x3F
		if(Sender == bPurge)
		{
			PurgeSettings();
			LoadSettings();			
		}
		else
		{
			// End:0x66
			if(Sender == bDone)
			{
				SaveSettings();
				Controller.CloseMenu();				
			}
			else
			{
				// End:0x9E
				if(Sender == bReset)
				{
					ConfigTabBase(c_Tabs.ActiveTab.MyPanel).LoadSettings();					
				}
				else
				{
					// End:0xD3
					if(Sender == bDefault)
					{
						ConfigTabBase(c_Tabs.ActiveTab.MyPanel).DefaultSettings();
					}
				}
			}
		}
	}
	return true;
	//return;	
}

function PurgeSettings()
{
	local int i;
	local array<WeaponRecord> Recs;
	local Class<BallisticWeapon> Weap;

	Class'Engine.CacheManager'.static.GetWeaponList(Recs);
	i = 0;
	J0x18:

	// End:0x72 [Loop If]
	if(i < Recs.Length)
	{
		Weap = Class<BallisticWeapon>(DynamicLoadObject(Recs[i].ClassName, Class'Core.Class'));
		// End:0x68
		if(Weap != none)
		{
			Weap.static.StaticClearConfig();
		}
		i++;
		// [Loop Continue]
		goto J0x18;
	}
	Class'BCoreProV55.BallisticWeapon'.static.StaticClearConfig();
	Class'BallisticProV55.BWBloodControl'.static.StaticClearConfig();
	Class'BCoreProV55.BloodManager'.static.StaticClearConfig();
	Class'BCoreProV55.AD_BloodDecal'.static.StaticClearConfig();
	Class'BallisticProV55.Mut_Ballistic'.static.StaticClearConfig();
	Class'BCoreProV55.BallisticMod'.static.StaticClearConfig();
	Class'BallisticProV55.AD_ImpactDecal'.static.StaticClearConfig();
	Class'BallisticProV55.BallisticPawn'.static.StaticClearConfig();
	Class'BallisticProV55.Rules_Ballistic'.static.StaticClearConfig();
	//return;	
}

function Class<BC_GameStyle> GetGameStyle()
{
	return ConfiguredStyle;
	//return;	
}

function Class<BC_GameStyle_Config> GetConfigStyle()
{
	return Class<BC_GameStyle_Config>(ConfiguredStyle);
	//return;	
}

function LoadSettings()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x56 [Loop If]
	if(i < c_Tabs.TabStack.Length)
	{
		ConfigTabBase(c_Tabs.TabStack[i].MyPanel).LoadSettings();
		++i;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

function SaveSettings()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x56 [Loop If]
	if(i < c_Tabs.TabStack.Length)
	{
		ConfigTabBase(c_Tabs.TabStack[i].MyPanel).SaveSettings();
		++i;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

function DefaultSettings()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x56 [Loop If]
	if(i < c_Tabs.TabStack.Length)
	{
		ConfigTabBase(c_Tabs.TabStack[i].MyPanel).DefaultSettings();
		++i;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

defaultproperties
{
	// Reference: GUIImage'BallisticProV55.ConfigMenuBase.BackImage'
	begin object name="BackImage" class=XInterface.GUIImage
		Image=Texture'2K4Menus.NewControls.Display95'
		ImageStyle=1
		WinLeft=0.1000000
		WinWidth=0.8000000
		WinHeight=1.0000000
		RenderWeight=0.0010000
	end object
	MyBack=BackImage
	// Reference: GUIButton'BallisticProV55.ConfigMenuBase.DoneButton'
	begin object name="DoneButton" class=XInterface.GUIButton
		Caption="OK"
		Hint="Save settings and exit menu."
		WinTop=0.9000000
		WinLeft=0.2000000
		WinWidth=0.1000000
		TabOrder=0
		OnClick=ConfigMenuBase.InternalOnClick
		OnKeyEvent=DoneButton.InternalOnKeyEvent
	end object
	bDone=DoneButton
	// Reference: GUIButton'BallisticProV55.ConfigMenuBase.CancelButton'
	begin object name="CancelButton" class=XInterface.GUIButton
		Caption="CANCEL"
		Hint="Exit menu without saving."
		WinTop=0.9000000
		WinLeft=0.7000000
		WinWidth=0.1000000
		TabOrder=1
		OnClick=ConfigMenuBase.InternalOnClick
		OnKeyEvent=CancelButton.InternalOnKeyEvent
	end object
	bCancel=CancelButton
	// Reference: GUIButton'BallisticProV55.ConfigMenuBase.BResetButton'
	begin object name="BResetButton" class=XInterface.GUIButton
		Caption="RESET"
		Hint="Undo all changes."
		WinTop=0.9000000
		WinLeft=0.3750000
		WinWidth=0.1000000
		TabOrder=1
		OnClick=ConfigMenuBase.InternalOnClick
		OnKeyEvent=CancelButton.InternalOnKeyEvent
	end object
	bReset=BResetButton
	// Reference: GUIButton'BallisticProV55.ConfigMenuBase.BDefaultButton'
	begin object name="BDefaultButton" class=XInterface.GUIButton
		Caption="DEFAULTS"
		Hint="Load default settings."
		WinTop=0.9000000
		WinLeft=0.5250000
		WinWidth=0.1000000
		TabOrder=1
		OnClick=ConfigMenuBase.InternalOnClick
		OnKeyEvent=CancelButton.InternalOnKeyEvent
	end object
	bDefault=BDefaultButton
	// Reference: GUIHeader'BallisticProV55.ConfigMenuBase.DaBeegHeader'
	begin object name="DaBeegHeader" class=XInterface.GUIHeader
		bUseTextHeight=true
		Caption="Ballistic Settings"
		FontScale=1
		WinLeft=0.1000000
		WinWidth=0.8000000
		WinHeight=1.0000000
	end object
	MyHeader=DaBeegHeader
	// Reference: GUITabControl'BallisticProV55.ConfigMenuBase.PageTabs'
	begin object name="PageTabs" class=XInterface.GUITabControl
		bDockPanels=true
		TabHeight=0.0400000
		BackgroundStyleName="TabBackground"
		WinLeft=0.1100000
		WinWidth=0.7800000
		WinHeight=0.0400000
		RenderWeight=0.4900000
		TabOrder=3
		bAcceptsInput=true
		OnActivate=PageTabs.InternalOnActivate
		OnChange=ConfigMenuBase.InternalOnChange
	end object
	c_Tabs=PageTabs
	HeaderCaption="Ballistic Settings"
	bRenderWorld=true
	bAllowedAsLast=true
	OnKeyEvent=ConfigMenuBase.InternalOnKeyEvent
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: GUIButton'BallisticProV55.ConfigMenuBase.CancelButton'
begin object name="CancelButton" class=XInterface.GUIButton
	Caption="CANCEL"
	Hint="Exit menu without saving."
	WinTop=0.9000000
	WinLeft=0.7000000
	WinWidth=0.1000000
	TabOrder=1
	OnClick=ConfigMenuBase.InternalOnClick
	OnKeyEvent=CancelButton.InternalOnKeyEvent
end object
// Reference: GUITabControl'BallisticProV55.ConfigMenuBase.PageTabs'
begin object name="PageTabs" class=XInterface.GUITabControl
	bDockPanels=true
	TabHeight=0.0400000
	BackgroundStyleName="TabBackground"
	WinLeft=0.1100000
	WinWidth=0.7800000
	WinHeight=0.0400000
	RenderWeight=0.4900000
	TabOrder=3
	bAcceptsInput=true
	OnActivate=PageTabs.InternalOnActivate
	OnChange=ConfigMenuBase.InternalOnChange
end object
// Reference: GUIButton'BallisticProV55.ConfigMenuBase.DoneButton'
begin object name="DoneButton" class=XInterface.GUIButton
	Caption="OK"
	Hint="Save settings and exit menu."
	WinTop=0.9000000
	WinLeft=0.2000000
	WinWidth=0.1000000
	TabOrder=0
	OnClick=ConfigMenuBase.InternalOnClick
	OnKeyEvent=DoneButton.InternalOnKeyEvent
end object
// Reference: GUIImage'BallisticProV55.ConfigMenuBase.BackImage'
begin object name="BackImage" class=XInterface.GUIImage
	Image=Texture'2K4Menus.NewControls.Display95'
	ImageStyle=1
	WinLeft=0.1000000
	WinWidth=0.8000000
	WinHeight=1.0000000
	RenderWeight=0.0010000
end object
// Reference: GUIButton'BallisticProV55.ConfigMenuBase.BResetButton'
begin object name="BResetButton" class=XInterface.GUIButton
	Caption="RESET"
	Hint="Undo all changes."
	WinTop=0.9000000
	WinLeft=0.3750000
	WinWidth=0.1000000
	TabOrder=1
	OnClick=ConfigMenuBase.InternalOnClick
	OnKeyEvent=CancelButton.InternalOnKeyEvent
end object
// Reference: GUIButton'BallisticProV55.ConfigMenuBase.BDefaultButton'
begin object name="BDefaultButton" class=XInterface.GUIButton
	Caption="DEFAULTS"
	Hint="Load default settings."
	WinTop=0.9000000
	WinLeft=0.5250000
	WinWidth=0.1000000
	TabOrder=1
	OnClick=ConfigMenuBase.InternalOnClick
	OnKeyEvent=CancelButton.InternalOnKeyEvent
end object
// Reference: GUIHeader'BallisticProV55.ConfigMenuBase.DaBeegHeader'
begin object name="DaBeegHeader" class=XInterface.GUIHeader
	bUseTextHeight=true
	Caption="Ballistic Settings"
	FontScale=1
	WinLeft=0.1000000
	WinWidth=0.8000000
	WinHeight=1.0000000
end object
