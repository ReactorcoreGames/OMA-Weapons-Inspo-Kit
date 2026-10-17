class ConfigMenu_Preferences extends ConfigMenuBase
	editinlinenew
	instanced;

var() localized string GameplayTabLabel;
var() localized string GameplayTabHint;
var() localized string VisualTabLabel;
var() localized string VisualTabHint;
var() localized string BloodTabLabel;
var() localized string BloodTabHint;
var() localized string CrossTabLabel;
var() localized string CrossTabHint;
var() localized string DetailSettings[9];

function AddTabs()
{
	c_Tabs.AddTab(GameplayTabLabel, "BallisticProV55.ConfigTab_GameplayPrefs",, GameplayTabHint);
	c_Tabs.AddTab(VisualTabLabel, "BallisticProV55.ConfigTab_VisualPrefs",, VisualTabHint);
	c_Tabs.AddTab(BloodTabLabel, "BallisticProV55.ConfigTab_Blood",, BloodTabHint);
	c_Tabs.AddTab(CrossTabLabel, "BallisticProV55.ConfigTab_Crosshairs",, CrossTabHint);
	//return;	
}

final function string GetDisplayString(string ConfigString)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x47 [Loop If]
	if(i < 9)
	{
		// End:0x3D
		if(DetailSettings[i] ~= ConfigString)
		{
			return Class'GUI2K4.UT2K4Tab_DetailSettings'.default.DetailLevels[i];
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return "";
	//return;	
}

final function string GetConfigString(string DisplayString)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x47 [Loop If]
	if(i < 9)
	{
		// End:0x3D
		if(Class'GUI2K4.UT2K4Tab_DetailSettings'.default.DetailLevels[i] ~= DisplayString)
		{
			return DetailSettings[i];
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return "";
	//return;	
}

defaultproperties
{
	GameplayTabLabel="Gameplay"
	GameplayTabHint="Configure gameplay preferences."
	VisualTabLabel="Visual"
	VisualTabHint="Configure visual preferences."
	BloodTabLabel="Blood"
	BloodTabHint="Configure blood and gore settings."
	CrossTabLabel="Graphical Crosshairs"
	CrossTabHint="Configure the graphical crosshairs."
	DetailSettings[0]="UltraLow"
	DetailSettings[1]="VeryLow"
	DetailSettings[2]="Low"
	DetailSettings[3]="Lower"
	DetailSettings[4]="Normal"
	DetailSettings[5]="Higher"
	DetailSettings[6]="High"
	DetailSettings[7]="VeryHigh"
	DetailSettings[8]="UltraHigh"
	HeaderCaption="Ballistic Preferences"
}
