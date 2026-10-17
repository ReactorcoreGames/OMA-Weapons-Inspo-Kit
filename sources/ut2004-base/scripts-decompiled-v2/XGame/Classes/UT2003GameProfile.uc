class UT2003GameProfile extends GameProfile;

function ContinueSinglePlayerGame(LevelInfo Level, optional bool bReplace)
{
	local PlayerController PC;

	// End:0x1D
	foreach Level.__NFUN_325__(Class'Engine.PlayerController', PC)
	{
		// End:0x1D
		break;		
	}	
	// End:0x2B
	if(PC == none)
	{
		return;
	}
	// End:0x9B
	if(Level.Game.SavePackage(PackageName))
	{
		Log("SINGLEPLAYER UT2003GameProfile::ContinueSinglePlayerGame() saved profile.");		
	}
	else
	{
		Log("SINGLEPLAYER UT2003GameProfile::ContinueSinglePlayerGame() save profile FAILED.");
	}
	PC.ConsoleCommand("disconnect");
	// End:0x157
	if(bReplace)
	{
		PC.Player.GUIController.ReplaceMenu("xInterface.UT2SinglePlayerMain");		
	}
	else
	{
		PC.Player.GUIController.OpenMenu("xInterface.UT2SinglePlayerMain");
	}
	//return;	
}

defaultproperties
{
	PlayerTeam[0]=""
	PlayerTeam[1]=""
	PlayerTeam[2]=""
	PlayerTeam[3]=""
	PlayerTeam[4]=""
	PlayerTeam[5]=""
	PlayerTeam[6]=""
	TeamSymbolName="TeamSymbols_UT2003.sym01"
	SalaryCap=3500
	ladderrung=1
	GameLadderName="xGame.UT2003LadderInfo"
}
