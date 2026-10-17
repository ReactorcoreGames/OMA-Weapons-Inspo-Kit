class xPlayerReplicationInfo extends TeamPlayerReplicationInfo
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var PlayerRecord Rec;
var bool bForceNoPlayerLights;
var bool bNoTeamSkins;

simulated function UpdatePrecacheMaterials()
{
	// End:0x0E
	if(CharacterName == "")
	{
		return;
	}
	Rec = Class'XGame.xUtil'.static.FindPlayerRecord(CharacterName);
	// End:0x94
	if(Rec.Species != none)
	{
		// End:0x67
		if(Team == none)
		{
			Rec.Species.static.LoadResources(Rec, Level, self, 255);			
		}
		else
		{
			Rec.Species.static.LoadResources(Rec, Level, self, Team.TeamIndex);
		}
	}
	//return;	
}

simulated function SetCharacterName(string S)
{
	super(PlayerReplicationInfo).SetCharacterName(S);
	UpdateCharacter();
	//return;	
}

simulated event UpdateCharacter()
{
	Rec = Class'XGame.xUtil'.static.FindPlayerRecord(CharacterName);
	//return;	
}

simulated function Material GetPortrait()
{
	// End:0x3A
	if(Rec.Portrait == none)
	{
		return Material(DynamicLoadObject("PlayerPictures.cDefault", Class'Engine.Material'));
	}
	return Rec.Portrait;
	//return;	
}

