class ONSLinkDesignMessage extends LocalMessage
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var(String) localized string SetupString;
var(String) localized string SaveSetupString;
var(String) localized string LoadSetupString;
var(String) localized string SaveFailedString;
var(String) localized string LoadFailedString;
var(String) localized string DeleteSetupString;
var(String) localized string DeleteOfficialFailedString;
var(String) localized string DeleteNothingString;
var(String) localized string NoPathToPowerCoreString;
var(String) localized string LoadFailedNoPathToCoreString;

static function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	// End:0x44
	if(Switch == 7)
	{
		P.ClientOpenMenu("GUI2K4.UT2K4GenericMessageBox",,, default.NoPathToPowerCoreString);		
	}
	else
	{
		// End:0x88
		if(Switch == 8)
		{
			P.ClientOpenMenu("GUI2K4.UT2K4GenericMessageBox",,, default.LoadFailedNoPathToCoreString);			
		}
		else
		{
			super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
		}
	}
	//return;	
}

static function Color GetConsoleColor(PlayerReplicationInfo RelatedPRI_1)
{
	return Class'Engine.HUD'.default.WhiteColor;
	//return;	
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	switch(Switch)
	{
		// End:0x11
		case 0:
			return default.SaveSetupString;
		// End:0x1B
		case 1:
			return default.SaveFailedString;
		// End:0x26
		case 2:
			return default.LoadSetupString;
		// End:0x31
		case 3:
			return default.LoadFailedString;
		// End:0x3C
		case 4:
			return default.DeleteSetupString;
		// End:0x47
		case 5:
			return default.DeleteOfficialFailedString;
		// End:0x52
		case 6:
			return default.DeleteNothingString;
		// End:0xFFFF
		default:
			//return;
			break;
	}	
}

defaultproperties
{
	SaveSetupString="Successfully saved Link Setup."
	LoadSetupString="Successfully loaded Link Setup."
	SaveFailedString="You can't overwrite official Link Setups!"
	LoadFailedString="Failed to load Link Setup because no setup of that name exists."
	DeleteSetupString="Successfully deleted Link Setup."
	DeleteOfficialFailedString="You can't delete official Link Setups!"
	DeleteNothingString="Failed to delete Link Setup because no setup of that name exists."
	NoPathToPowerCoreString="Cannot save Link Setup: There must be a complete path between the PowerCores."
	LoadFailedNoPathToCoreString="Failed to load Link Setup because it does not have a complete path between the PowerCores."
	bIsSpecial=false
}
