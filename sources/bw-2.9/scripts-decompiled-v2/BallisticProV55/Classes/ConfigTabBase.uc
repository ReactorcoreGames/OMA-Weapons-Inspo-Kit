class ConfigTabBase extends UT2K4TabPanel
	editinlinenew
	instanced;

var export editinline ConfigMenuBase BaseMenu;
var bool bInitialized;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	super(GUIPanel).InitComponent(MyController, MyOwner);
	// End:0x42
	if(ConfigMenuBase(Controller.ActivePage) != none)
	{
		BaseMenu = ConfigMenuBase(Controller.ActivePage);
	}
	//return;	
}

function ShowPanel(bool bShow)
{
	super(GUITabPanel).ShowPanel(bShow);
	// End:0x17
	if(bInitialized)
	{
		return;
	}
	InitializeConfigTab();
	LoadSettings();
	bInitialized = true;
	//return;	
}

function InitializeConfigTab()
{
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

function SaveSettings()
{
	//return;	
}

